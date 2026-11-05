from flask import Flask, render_template, request, redirect, url_for, flash
from pymongo import MongoClient
from pymongo.errors import PyMongoError
import os

app = Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY", "change-this-secret")
client = MongoClient(os.getenv("MONGO_URI", "mongodb://localhost:27017/"), serverSelectionTimeoutMS=5000)
db = client["HospitalDB"]
medicines = db["medicines"]
medicines.create_index("medicine_id", unique=True)

@app.get("/")
def home():
    return render_template("index.html", count=medicines.count_documents({}))

@app.route("/add", methods=["GET", "POST"])
def add_medicine():
    if request.method == "POST":
        try:
            doc = {"medicine_id": int(request.form["medicine_id"]),
                   "name": request.form["name"].strip(),
                   "category": request.form["category"].strip(),
                   "price": float(request.form["price"]),
                   "stock": int(request.form["stock"]),
                   "manufacturer": request.form["manufacturer"].strip()}
            if doc["price"] < 0 or doc["stock"] < 0 or not doc["name"]:
                raise ValueError("Name is required; price and stock cannot be negative.")
            medicines.insert_one(doc)
            flash("Medicine added.", "success")
            return redirect(url_for("view_medicines"))
        except (ValueError, PyMongoError) as exc:
            flash(f"Could not add medicine: {exc}", "error")
    return render_template("medicine_form.html")

@app.get("/medicines")
def view_medicines():
    records = list(medicines.find({}, {"_id": 0}).sort("medicine_id", 1))
    return render_template("medicines.html", medicines=records)

@app.route("/search", methods=["GET", "POST"])
def search_medicine():
    result = None
    if request.method == "POST":
        term = request.form["term"].strip()
        try:
            result = medicines.find_one({"medicine_id": int(term)}, {"_id": 0})
        except ValueError:
            result = medicines.find_one({"name": {"$regex": term, "$options": "i"}}, {"_id": 0})
        if result is None:
            flash("Medicine not found.", "error")
    return render_template("search.html", medicine=result)

@app.post("/update-stock")
def update_stock():
    try:
        mid = int(request.form["medicine_id"])
        new_stock = int(request.form["stock"])
        if new_stock < 0:
            raise ValueError("Stock cannot be negative.")
        result = medicines.update_one({"medicine_id": mid}, {"$set": {"stock": new_stock}})
        flash("Stock updated." if result.matched_count else "Medicine ID not found.",
              "success" if result.matched_count else "error")
    except (ValueError, PyMongoError) as exc:
        flash(f"Update failed: {exc}", "error")
    return redirect(url_for("view_medicines"))

@app.post("/delete")
def delete_medicine():
    try:
        result = medicines.delete_one({"medicine_id": int(request.form["medicine_id"])})
        flash("Medicine deleted." if result.deleted_count else "Medicine ID not found.",
              "success" if result.deleted_count else "error")
    except (ValueError, PyMongoError) as exc:
        flash(f"Delete failed: {exc}", "error")
    return redirect(url_for("view_medicines"))

@app.get("/queries")
def query_practice():
    category = request.args.get("category", "").strip()
    manufacturer = request.args.get("manufacturer", "").strip()
    sort_by = request.args.get("sort_by", "medicine_id")
    direction = -1 if request.args.get("direction") == "desc" else 1
    query = {}
    if category: query["category"] = category
    if manufacturer: query["manufacturer"] = manufacturer
    if request.args.get("price") == "over50": query["price"] = {"$gt": 50}
    elif request.args.get("price") == "under100": query["price"] = {"$lt": 100}
    if request.args.get("low_stock") == "yes": query["stock"] = {"$lt": 30}
    if sort_by not in ("price", "stock", "medicine_id"): sort_by = "medicine_id"
    records = list(medicines.find(query, {"_id": 0}).sort(sort_by, direction))
    return render_template("medicines.html", medicines=records, filtered=True)

@app.get("/suppliers")
def suppliers():
    return render_template("suppliers.html",
        medicines=list(medicines.find({"supplier": {"$exists": True}}, {"_id": 0})))

@app.get("/report")
def report():
    pipeline = [{"$group": {"_id": None, "total_stock": {"$sum": "$stock"}}}]
    summary = list(medicines.aggregate(pipeline))
    low = list(medicines.find({"stock": {"$lt": 30}}, {"_id": 0}).sort("stock", 1))
    expensive = medicines.find_one(sort=[("price", -1)])
    cheapest = medicines.find_one(sort=[("price", 1)])
    return render_template("report.html", count=medicines.count_documents({}),
        total_stock=summary[0]["total_stock"] if summary else 0, low=low,
        expensive=expensive, cheapest=cheapest)

@app.get("/health")
def health():
    try:
        client.admin.command("ping")
        return "Connected successfully to HospitalDB.medicines"
    except PyMongoError as exc:
        return f"MongoDB connection failed: {exc}", 503

if __name__ == "__main__":
    app.run(debug=True)

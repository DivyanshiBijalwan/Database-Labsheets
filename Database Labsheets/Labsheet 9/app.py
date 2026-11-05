from flask import Flask, render_template, request, redirect, url_for, flash
from pymongo import MongoClient
from pymongo.errors import PyMongoError
from bson.objectid import ObjectId
import os

app = Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY", "change-this-secret")
client = MongoClient(os.getenv("MONGO_URI", "mongodb://localhost:27017/"), serverSelectionTimeoutMS=5000)
db = client["CollegeDB"]
students = db["students"]
students.create_index("student_id", unique=True)

@app.get("/")
def home():
    return render_template("index.html", total=students.count_documents({}))

@app.route("/add", methods=["GET", "POST"])
def add_student():
    if request.method == "POST":
        try:
            doc = {
                "student_id": int(request.form["student_id"]),
                "name": request.form["name"].strip(),
                "age": int(request.form["age"]),
                "gender": request.form["gender"],
                "department": request.form["department"].strip(),
                "marks": float(request.form["marks"])
            }
            if not doc["name"] or not 0 <= doc["marks"] <= 100:
                raise ValueError("Name is required and marks must be between 0 and 100.")
            students.insert_one(doc)
            flash("Student added successfully.", "success")
            return redirect(url_for("view_students"))
        except (ValueError, PyMongoError) as exc:
            flash(f"Could not add student: {exc}", "error")
    return render_template("student_form.html", student=None, action="Add")

@app.get("/students")
def view_students():
    records = list(students.find({}, {"_id": 0}).sort("student_id", 1))
    return render_template("students.html", students=records)

@app.route("/search", methods=["GET", "POST"])
def search_student():
    result = None
    if request.method == "POST":
        term = request.form["student_id"].strip()
        try:
            result = students.find_one({"student_id": int(term)}, {"_id": 0})
        except ValueError:
            result = students.find_one({"name": {"$regex": term, "$options": "i"}}, {"_id": 0})
        if result is None:
            flash("No matching student found.", "error")
    return render_template("search.html", student=result)

@app.route("/update", methods=["GET", "POST"])
def update_student():
    if request.method == "POST":
        try:
            sid = int(request.form["student_id"])
            changes = {
                "name": request.form["name"].strip(),
                "age": int(request.form["age"]),
                "department": request.form["department"].strip(),
                "marks": float(request.form["marks"])
            }
            result = students.update_one({"student_id": sid}, {"$set": changes})
            flash("Student updated." if result.matched_count else "Student ID not found.",
                  "success" if result.matched_count else "error")
            return redirect(url_for("view_students"))
        except (ValueError, PyMongoError) as exc:
            flash(f"Update failed: {exc}", "error")
    return render_template("update.html")

@app.post("/delete")
def delete_student():
    try:
        sid = int(request.form["student_id"])
        result = students.delete_one({"student_id": sid})
        flash("Student deleted." if result.deleted_count else "Student ID not found.",
              "success" if result.deleted_count else "error")
    except (ValueError, PyMongoError) as exc:
        flash(f"Delete failed: {exc}", "error")
    return redirect(url_for("view_students"))

@app.get("/filter")
def filter_students():
    department = request.args.get("department", "").strip()
    condition = request.args.get("condition", "all")
    query = {}
    if department:
        query["department"] = department
    if condition == "above75":
        query["marks"] = {"$gt": 75}
    elif condition == "between50and80":
        query["marks"] = {"$gte": 50, "$lte": 80}
    elif condition == "older20":
        query["age"] = {"$gt": 20}
    records = list(students.find(query, {"_id": 0}).sort("student_id", 1))
    return render_template("students.html", students=records, filtered=True)

@app.get("/health")
def health():
    try:
        client.admin.command("ping")
        return "Connected successfully to CollegeDB.students (MongoDB)."
    except PyMongoError as exc:
        return f"MongoDB connection failed: {exc}", 503

if __name__ == "__main__":
    app.run(debug=True)

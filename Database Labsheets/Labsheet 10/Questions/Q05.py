# Q5: Insert medicine through Flask
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
@app.post("/add")
def add_medicine():
    doc = {"medicine_id": int(request.form["medicine_id"]), "name": request.form["name"],
           "category": request.form["category"], "price": float(request.form["price"]),
           "stock": int(request.form["stock"]), "manufacturer": request.form["manufacturer"]}
    medicines.insert_one(doc)
    return "Medicine inserted successfully"

# Q8: Update medicine stock
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
@app.post("/update-stock")
def update_stock():
    mid, new_stock = int(request.form["medicine_id"]), int(request.form["stock"])
    result = medicines.update_one({"medicine_id": mid}, {"$set": {"stock": new_stock}})
    return "Stock updated" if result.matched_count else "Medicine not found"

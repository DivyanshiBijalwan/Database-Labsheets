# Q9: Delete medicine
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
@app.post("/delete")
def delete():
    result = medicines.delete_one({"medicine_id": int(request.form["medicine_id"])})
    return "Medicine deleted" if result.deleted_count else "Medicine not found"

# Q7: Search medicine by ID or name
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
@app.get("/search")
def search():
    term = request.args.get("term", "").strip()
    try:
        query = {"medicine_id": int(term)}
    except ValueError:
        query = {"name": {"$regex": term, "$options": "i"}}
    result = medicines.find_one(query, {"_id": 0})
    return str(result) if result else "Medicine not found"

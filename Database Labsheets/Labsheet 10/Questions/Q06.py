# Q6: Display all medicines
from flask import Flask, render_template
from pymongo import MongoClient
app = Flask(__name__)
medicines = MongoClient("mongodb://localhost:27017/")["HospitalDB"]["medicines"]
@app.get("/medicines")
def view_medicines():
    return render_template("medicines.html", medicines=list(medicines.find({}, {"_id": 0})))

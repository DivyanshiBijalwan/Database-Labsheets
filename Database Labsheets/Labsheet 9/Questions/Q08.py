# Q8: Search student by ID
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
@app.get("/search")
def search():
    sid = request.args.get("student_id", type=int)
    student = students.find_one({"student_id": sid}, {"_id": 0}) if sid is not None else None
    return str(student) if student else "Student not found"

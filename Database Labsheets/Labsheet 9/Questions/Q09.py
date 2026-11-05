# Q9: Update student
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
@app.post("/update")
def update():
    sid = int(request.form["student_id"])
    changes = {"name": request.form["name"], "age": int(request.form["age"]),
               "department": request.form["department"], "marks": float(request.form["marks"])}
    result = students.update_one({"student_id": sid}, {"$set": changes})
    return "Updated" if result.matched_count else "Student not found"

# Q10: Delete student
from flask import Flask, request
from pymongo import MongoClient
app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
@app.post("/delete")
def delete():
    result = students.delete_one({"student_id": int(request.form["student_id"])})
    return "Deleted" if result.deleted_count else "Student not found"

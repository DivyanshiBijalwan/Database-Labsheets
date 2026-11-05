# Q6: Insert student form data
from flask import Flask, request, redirect
from pymongo import MongoClient
app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
@app.post("/add")
def add():
    student = {"student_id": int(request.form["student_id"]), "name": request.form["name"],
               "age": int(request.form["age"]), "gender": request.form["gender"],
               "department": request.form["department"], "marks": float(request.form["marks"])}
    students.insert_one(student)
    return "Student inserted successfully"

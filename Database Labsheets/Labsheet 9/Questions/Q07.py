# Q7: Display all students
from flask import Flask, render_template
from pymongo import MongoClient
app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]
@app.get("/students")
def view_students():
    return render_template("students.html", students=list(students.find({}, {"_id": 0})))

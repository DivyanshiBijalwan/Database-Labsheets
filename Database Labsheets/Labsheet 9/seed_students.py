from pymongo import MongoClient
import os

client = MongoClient(os.getenv("MONGO_URI", "mongodb://localhost:27017/"))
db = client["CollegeDB"]
students = db["students"]

sample_students = [
    {"student_id": 1, "name": "Amit", "age": 20, "gender": "Male", "department": "Computer Science", "marks": 85},
    {"student_id": 2, "name": "Priya", "age": 21, "gender": "Female", "department": "Pharmacy", "marks": 92},
    {"student_id": 3, "name": "Rahul", "age": 19, "gender": "Male", "department": "Computer Science", "marks": 76},
    {"student_id": 4, "name": "Neha", "age": 22, "gender": "Female", "department": "Commerce", "marks": 88},
    {"student_id": 5, "name": "Arjun", "age": 20, "gender": "Male", "department": "Mathematics", "marks": 69},
]
for student in sample_students:
    students.update_one({"student_id": student["student_id"]}, {"$set": student}, upsert=True)
print(f"Seeded {students.count_documents({})} student records in CollegeDB.students")
client.close()

# Q5: Flask MongoDB connection
from flask import Flask
from pymongo import MongoClient
app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=5000)
db = client["CollegeDB"]
students = db["students"]
@app.get("/")
def home():
    client.admin.command("ping")
    return "Successfully connected to CollegeDB.students"
if __name__ == "__main__":
    app.run(debug=True)

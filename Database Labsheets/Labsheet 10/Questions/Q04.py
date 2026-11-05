# Q4: Flask MongoDB connection
from flask import Flask
from pymongo import MongoClient
app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=5000)
db = client["HospitalDB"]
medicines = db["medicines"]
@app.get("/")
def home():
    client.admin.command("ping")
    return "Successfully connected to HospitalDB.medicines"
if __name__ == "__main__":
    app.run(debug=True)

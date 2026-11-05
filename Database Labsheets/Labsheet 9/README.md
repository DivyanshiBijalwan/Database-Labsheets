# Labsheet 9 – Student Record Management System

Stack: Python 3, Flask, PyMongo, MongoDB.

## Setup
```bash
py -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```
Start MongoDB locally, or set `MONGO_URI` to your MongoDB Atlas connection string. Then:
```bash
python app.py
```
Open http://127.0.0.1:5000.

Run `seed_students.py` to insert the five sample records from the practical. The app implements add, view, search, update, delete, and filtering.

# Labsheet 10 – Hospital Medicine Management System

Stack: Python 3, Flask, PyMongo, MongoDB.

## Setup
```bash
py -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```
Start MongoDB locally or set `MONGO_URI` to your Atlas connection string. Run `python seed_medicines.py`, then `python app.py`. Visit http://127.0.0.1:5000.

Default database: `HospitalDB`; collection: `medicines`. Low stock is defined as fewer than 30 units.

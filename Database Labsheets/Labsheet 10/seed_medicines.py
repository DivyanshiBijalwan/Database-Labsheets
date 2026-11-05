from pymongo import MongoClient
import os
client = MongoClient(os.getenv("MONGO_URI", "mongodb://localhost:27017/"))
medicines = client["HospitalDB"]["medicines"]
data = [
 {"medicine_id":301,"name":"Paracetamol","category":"Analgesic","price":25,"stock":100,"manufacturer":"ABC Pharma"},
 {"medicine_id":302,"name":"Amoxicillin","category":"Antibiotic","price":80,"stock":50,"manufacturer":"MediLife"},
 {"medicine_id":303,"name":"Cetirizine","category":"Antihistamine","price":35,"stock":75,"manufacturer":"ABC Pharma"},
 {"medicine_id":304,"name":"Omeprazole","category":"Antacid","price":60,"stock":40,"manufacturer":"HealthPlus"},
 {"medicine_id":305,"name":"Azithromycin","category":"Antibiotic","price":120,"stock":25,"manufacturer":"MediLife"},
 {"medicine_id":306,"name":"Ibuprofen","category":"Pain Relief","price":45,"stock":20,"manufacturer":"Care Pharma"},
 {"medicine_id":307,"name":"Metformin","category":"Antidiabetic","price":55,"stock":90,"manufacturer":"HealthPlus"},
 {"medicine_id":308,"name":"Vitamin C","category":"Supplement","price":30,"stock":15,"manufacturer":"ABC Pharma"}
]
for item in data:
    medicines.update_one({"medicine_id":item["medicine_id"]},{"$set":item},upsert=True)
print(f"Seeded {medicines.count_documents({})} medicine records in HospitalDB.medicines")
client.close()

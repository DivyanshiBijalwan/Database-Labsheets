# Q12: Inventory report logic
from pymongo import MongoClient
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]
total_medicines = medicines.count_documents({})
summary = list(medicines.aggregate([{"$group":{"_id":None,"total_stock":{"$sum":"$stock"}}}]))
total_stock = summary[0]["total_stock"] if summary else 0
low_stock = list(medicines.find({"stock":{"$lt":30}},{"_id":0}))
most_expensive = medicines.find_one(sort=[("price",-1)])
cheapest = medicines.find_one(sort=[("price",1)])
print("Total medicines:", total_medicines)
print("Total stock:", total_stock)
print("Low stock:", low_stock)
print("Most expensive:", most_expensive)
print("Cheapest:", cheapest)

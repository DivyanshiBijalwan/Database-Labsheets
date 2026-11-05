// Q1: MongoDB database and sample documents
// Run in mongosh
use HospitalDB
db.medicines.insertMany([
 {medicine_id:301,name:"Paracetamol",category:"Analgesic",price:25,stock:100,manufacturer:"ABC Pharma"},
 {medicine_id:302,name:"Amoxicillin",category:"Antibiotic",price:80,stock:50,manufacturer:"MediLife"},
 {medicine_id:303,name:"Cetirizine",category:"Antihistamine",price:35,stock:75,manufacturer:"ABC Pharma"},
 {medicine_id:304,name:"Omeprazole",category:"Antacid",price:60,stock:40,manufacturer:"HealthPlus"},
 {medicine_id:305,name:"Azithromycin",category:"Antibiotic",price:120,stock:25,manufacturer:"MediLife"},
 {medicine_id:306,name:"Ibuprofen",category:"Pain Relief",price:45,stock:20,manufacturer:"Care Pharma"},
 {medicine_id:307,name:"Metformin",category:"Antidiabetic",price:55,stock:90,manufacturer:"HealthPlus"},
 {medicine_id:308,name:"Vitamin C",category:"Supplement",price:30,stock:15,manufacturer:"ABC Pharma"}
])
db.medicines.find()

// Q10: MongoDB query practice
use HospitalDB
// a. Medicines in a category
db.medicines.find({category:"Antibiotic"})
// b. Price greater than 50
db.medicines.find({price:{$gt:50}})
// c. Price less than 100
db.medicines.find({price:{$lt:100}})
// d. Stock less than 30
db.medicines.find({stock:{$lt:30}})
// e. Manufacturer
db.medicines.find({manufacturer:"ABC Pharma"})
// f. Sort by price
db.medicines.find().sort({price:1})
// g. Sort by stock
db.medicines.find().sort({stock:1})

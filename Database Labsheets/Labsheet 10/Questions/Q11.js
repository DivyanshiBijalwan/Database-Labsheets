// Q11: Embedded supplier documents
use HospitalDB
db.medicines.updateOne({medicine_id:301},{$set:{supplier:{name:"City Med Supplies",phone:"9876543210",city:"Dehradun"}}})
db.medicines.updateOne({medicine_id:302},{$set:{supplier:{name:"Health Distributors",phone:"9876501234",city:"Haridwar"}}})
db.medicines.updateOne({medicine_id:303},{$set:{supplier:{name:"Care Wholesale",phone:"9812345670",city:"Roorkee"}}})
db.medicines.find({supplier:{$exists:true}},{_id:0,name:1,supplier:1})

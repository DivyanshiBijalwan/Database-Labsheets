// Q11: MongoDB filtering queries
use CollegeDB
// a. Particular department
db.students.find({department:"Computer Science"})
// b. Marks greater than 75
db.students.find({marks:{$gt:75}})
// c. Marks between 50 and 80 (inclusive)
db.students.find({marks:{$gte:50,$lte:80}})
// d. Age greater than 20
db.students.find({age:{$gt:20}})

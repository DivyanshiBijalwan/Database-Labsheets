-- Q20: Student name, marks and grade
USE CollegeDB;

SELECT StudentName, Marks, StudentGrade(Marks) AS Grade
FROM Student ORDER BY StudentID;

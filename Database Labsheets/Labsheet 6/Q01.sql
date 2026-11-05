-- Q1: Display all students
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE ShowStudents()
BEGIN SELECT * FROM Student; END //
CALL ShowStudents();
DELIMITER ;

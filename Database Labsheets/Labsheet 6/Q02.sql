-- Q2: Display all departments
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE ShowDepartments()
BEGIN SELECT * FROM Department; END //
CALL ShowDepartments();
DELIMITER ;

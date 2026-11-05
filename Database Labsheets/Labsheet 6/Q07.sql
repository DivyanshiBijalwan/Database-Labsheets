-- Q7: Total students
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE TotalStudents()
BEGIN SELECT COUNT(*) AS TotalStudents FROM Student; END //
CALL TotalStudents();
DELIMITER ;

-- Q5: Students by department
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE GetStudentsByDept(IN p_DeptID INT)
BEGIN SELECT * FROM Student WHERE DeptID = p_DeptID; END //
CALL GetStudentsByDept(102);
DELIMITER ;

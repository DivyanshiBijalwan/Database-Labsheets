-- Q4: Display student by ID
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE GetStudent(IN p_StudentID INT)
BEGIN SELECT * FROM Student WHERE StudentID = p_StudentID; END //
CALL GetStudent(3);
DELIMITER ;

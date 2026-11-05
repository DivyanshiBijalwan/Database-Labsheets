-- Q6: Students above given marks
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE StudentsAboveMarks(IN p_Marks DECIMAL(5,2))
BEGIN SELECT * FROM Student WHERE Marks > p_Marks ORDER BY Marks DESC; END //
CALL StudentsAboveMarks(80);
DELIMITER ;

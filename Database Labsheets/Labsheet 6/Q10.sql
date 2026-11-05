-- Q10: Students within marks range
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE StudentsBetweenMarks(IN p_Min DECIMAL(5,2), IN p_Max DECIMAL(5,2))
BEGIN SELECT * FROM Student WHERE Marks BETWEEN p_Min AND p_Max ORDER BY Marks; END //
CALL StudentsBetweenMarks(70, 90);
DELIMITER ;

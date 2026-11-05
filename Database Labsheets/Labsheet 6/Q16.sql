-- Q16: Calculate bonus
USE CollegeDB;

DELIMITER //
CREATE FUNCTION CalculateBonus(p_Marks DECIMAL(5,2))
RETURNS INT DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_Marks >= 90 THEN 1000
        WHEN p_Marks >= 75 THEN 500
        ELSE 200
    END;
END //
SELECT StudentName, Marks, CalculateBonus(Marks) AS Bonus FROM Student;
DELIMITER ;

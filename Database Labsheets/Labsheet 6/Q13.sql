-- Q13: Pass or fail function
USE CollegeDB;

DELIMITER //
CREATE FUNCTION ResultStatus(p_Marks DECIMAL(5,2))
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    RETURN IF(p_Marks >= 50, 'Pass', 'Fail');
END //
SELECT ResultStatus(76.5) AS Result;
DELIMITER ;

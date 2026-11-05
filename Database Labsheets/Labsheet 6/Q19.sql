-- Q19: Age after five years
USE CollegeDB;

DELIMITER //
CREATE FUNCTION AgeAfterFiveYears(p_Age INT)
RETURNS INT DETERMINISTIC
BEGIN RETURN p_Age + 5; END //
SELECT AgeAfterFiveYears(20) AS AgeAfterFiveYears;
DELIMITER ;

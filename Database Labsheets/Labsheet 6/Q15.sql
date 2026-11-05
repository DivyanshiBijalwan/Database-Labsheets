-- Q15: Age category
USE CollegeDB;

DELIMITER //
CREATE FUNCTION AgeCategory(p_Age INT)
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN RETURN IF(p_Age >= 18, 'Adult', 'Minor'); END //
SELECT AgeCategory(20) AS AgeCategory;
DELIMITER ;

-- Q1: BMI function
USE Hospital_Functions_Lab;
DELIMITER //
CREATE FUNCTION calculate_bmi(weight_kg DECIMAL(6,2), height_m DECIMAL(4,2))
RETURNS DECIMAL(6,2) DETERMINISTIC
BEGIN
    IF height_m <= 0 THEN RETURN NULL; END IF;
    RETURN ROUND(weight_kg / (height_m * height_m), 2);
END //
SELECT calculate_bmi(55.5, 1.65) AS BMI;
DELIMITER ;

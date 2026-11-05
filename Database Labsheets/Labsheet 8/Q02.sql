-- Q2: Age category
USE Hospital_Functions_Lab;
DELIMITER //
CREATE FUNCTION age_category(p_age INT)
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    RETURN CASE WHEN p_age < 18 THEN 'Child'
                WHEN p_age < 60 THEN 'Adult'
                ELSE 'Senior' END;
END //
SELECT PatientID, PatientName, Age, age_category(Age) AS AgeCategory FROM Patients;
DELIMITER ;

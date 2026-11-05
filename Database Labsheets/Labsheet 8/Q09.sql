-- Q9: Patient report
USE Hospital_Functions_Lab;
DELIMITER //
CREATE PROCEDURE patient_report()
BEGIN
    SELECT PatientID, PatientName, Age,
           calculate_bmi(WeightKg, 1.65) AS BMI,
           age_category(Age) AS AgeCategory
    FROM Patients ORDER BY PatientID;
END //
CALL patient_report();
DELIMITER ;

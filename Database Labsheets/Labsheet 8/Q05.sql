-- Q5: Patients by gender
USE Hospital_Functions_Lab;
DELIMITER //
CREATE PROCEDURE patient_by_gender(IN p_gender VARCHAR(10))
BEGIN SELECT * FROM Patients WHERE Gender = p_gender; END //
CALL patient_by_gender('F');
CALL patient_by_gender('M');
DELIMITER ;

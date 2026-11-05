-- Q6: Patients above age
USE Hospital_Functions_Lab;
DELIMITER //
CREATE PROCEDURE patients_above_age(IN p_age INT)
BEGIN SELECT * FROM Patients WHERE Age > p_age ORDER BY Age; END //
CALL patients_above_age(25);
CALL patients_above_age(40);
DELIMITER ;

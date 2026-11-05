-- Q8: Medicine count output parameter
USE Hospital_Functions_Lab;
DELIMITER //
CREATE PROCEDURE medicine_count(OUT p_count INT)
BEGIN SELECT COUNT(*) INTO p_count FROM Medicines; END //
CALL medicine_count(@medicine_total);
SELECT @medicine_total AS TotalMedicines;
DELIMITER ;

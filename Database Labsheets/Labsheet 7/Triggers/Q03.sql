-- Trigger Question 3
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q03 BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    SET NEW.DoctorName = UPPER(NEW.DoctorName);
END //
INSERT INTO Doctors VALUES (298,'dr. lower case','General',700,'Active');
SELECT * FROM Doctors WHERE DoctorID = 298;
DELIMITER ;

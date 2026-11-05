-- Trigger Question 8
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q08 BEFORE UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF LOWER(NEW.Status) = 'active' THEN SET NEW.Status = 'Active'; END IF;
END //
UPDATE Doctors SET Status = 'active' WHERE DoctorID = 201;
SELECT DoctorID, Status FROM Doctors WHERE DoctorID = 201;
DELIMITER ;

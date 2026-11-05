-- Trigger Question 7
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q07 BEFORE UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.ConsultationFee < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Consultation fee cannot become negative';
    END IF;
END //
-- Test separately: this UPDATE should raise the custom error.
UPDATE Doctors SET ConsultationFee = -1 WHERE DoctorID = 201;
DELIMITER ;

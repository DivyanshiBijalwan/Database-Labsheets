-- Trigger Question 4
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q04 BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.ConsultationFee < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Consultation fee cannot be negative';
    END IF;
END //
-- Test separately: this INSERT should raise the custom error.
INSERT INTO Doctors VALUES (297,'Dr. Invalid','General',-100,'Active');
DELIMITER ;

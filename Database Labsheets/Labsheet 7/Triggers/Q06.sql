-- Trigger Question 6
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q06 AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF OLD.ConsultationFee <> NEW.ConsultationFee THEN
        INSERT INTO Fee_Log (DoctorID, DoctorName, OldFee, NewFee)
        VALUES (NEW.DoctorID, NEW.DoctorName, OLD.ConsultationFee, NEW.ConsultationFee);
    END IF;
END //
UPDATE Doctors SET ConsultationFee = ConsultationFee + 25 WHERE DoctorID = 202;
SELECT * FROM Fee_Log WHERE DoctorID = 202;
DELIMITER ;

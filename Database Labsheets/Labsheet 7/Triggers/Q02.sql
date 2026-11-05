-- Trigger Question 2
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q02 AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF OLD.ConsultationFee <> NEW.ConsultationFee THEN
        INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
        VALUES (NEW.DoctorID, 'FEE UPDATE', OLD.ConsultationFee, NEW.ConsultationFee);
    END IF;
END //
UPDATE Doctors SET ConsultationFee = ConsultationFee + 50 WHERE DoctorID = 201;
SELECT * FROM Doctor_Audit WHERE DoctorID = 201;
DELIMITER ;

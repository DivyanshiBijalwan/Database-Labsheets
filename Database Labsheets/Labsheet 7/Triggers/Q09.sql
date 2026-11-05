-- Trigger Question 9
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q09 AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF OLD.Department <> NEW.Department THEN
        INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
        VALUES (NEW.DoctorID, CONCAT('DEPT: ', OLD.Department, ' -> ', NEW.Department),
                OLD.ConsultationFee, NEW.ConsultationFee);
    END IF;
END //
UPDATE Doctors SET Department = 'General Medicine' WHERE DoctorID = 204;
SELECT * FROM Doctor_Audit WHERE DoctorID = 204;
DELIMITER ;

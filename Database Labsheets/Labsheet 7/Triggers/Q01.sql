-- Trigger Question 1
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q01 AFTER INSERT ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
    VALUES (NEW.DoctorID, 'INSERT', NULL, NEW.ConsultationFee);
END //
INSERT INTO Doctors VALUES (299,'Dr. Test Insert','General',750,'Active');
SELECT * FROM Doctor_Audit WHERE DoctorID = 299;
DELIMITER ;

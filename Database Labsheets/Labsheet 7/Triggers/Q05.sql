-- Trigger Question 5
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q05 AFTER DELETE ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
    VALUES (OLD.DoctorID, 'DELETE', OLD.ConsultationFee, NULL);
END //
-- Insert a temporary row, then delete it to test.
INSERT INTO Doctors VALUES (296,'Dr. Delete Test','General',650,'Active');
DELETE FROM Doctors WHERE DoctorID = 296;
SELECT * FROM Doctor_Audit WHERE DoctorID = 296;
DELIMITER ;

-- Trigger Question 10
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE TRIGGER trg_q10 BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.Status IS NULL OR TRIM(NEW.Status) = '' THEN
        SET NEW.Status = 'Pending';
    END IF;
END //
INSERT INTO Doctors (DoctorID, DoctorName, Department, ConsultationFee, Status)
VALUES (295,'Dr. Status Test','General',500,'');
SELECT * FROM Doctors WHERE DoctorID = 295;
DELIMITER ;

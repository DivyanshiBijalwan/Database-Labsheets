-- Cursor Question 6
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q06()
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT DoctorID, ConsultationFee FROM Doctors WHERE Department = 'Pediatrics';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_fee;
        IF v_done THEN LEAVE read_loop; END IF;
        UPDATE Doctors SET ConsultationFee = ROUND(v_fee * 1.10, 2) WHERE DoctorID = v_id;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q06();
SELECT * FROM Doctors WHERE Department = 'Pediatrics';
DELIMITER ;

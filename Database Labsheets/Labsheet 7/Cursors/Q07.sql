-- Cursor Question 7
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q07()
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT DoctorID, ConsultationFee FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_fee;
        IF v_done THEN LEAVE read_loop; END IF;
        IF v_fee < 1000 THEN UPDATE Doctors SET Status = 'Review' WHERE DoctorID = v_id; END IF;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q07();
SELECT * FROM Doctors;
DELIMITER ;

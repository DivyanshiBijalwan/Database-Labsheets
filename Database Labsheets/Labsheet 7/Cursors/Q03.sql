-- Cursor Question 3
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q03(OUT p_total DECIMAL(12,2))
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT ConsultationFee FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    SET p_total = 0;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_fee;
        IF v_done THEN LEAVE read_loop; END IF;
        SET p_total = p_total + v_fee;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q03(@total_fee);
SELECT @total_fee AS TotalConsultationFee;
DELIMITER ;

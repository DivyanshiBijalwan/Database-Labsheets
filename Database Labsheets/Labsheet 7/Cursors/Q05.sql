-- Cursor Question 5
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q05(OUT p_average DECIMAL(10,2))
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE v_total DECIMAL(12,2) DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT ConsultationFee FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_fee;
        IF v_done THEN LEAVE read_loop; END IF;
        SET v_total = v_total + v_fee;
        SET v_count = v_count + 1;
    END LOOP;
    CLOSE cur;
    SET p_average = IF(v_count = 0, NULL, v_total / v_count);
END //
CALL cursor_q05(@average_fee);
SELECT @average_fee AS AverageConsultationFee;
DELIMITER ;

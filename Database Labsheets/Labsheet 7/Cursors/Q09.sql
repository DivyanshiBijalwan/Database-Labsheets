-- Cursor Question 9
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q09(OUT p_active_count INT)
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_status VARCHAR(20);
    DECLARE cur CURSOR FOR SELECT Status FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    SET p_active_count = 0;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_status;
        IF v_done THEN LEAVE read_loop; END IF;
        IF v_status = 'Active' THEN SET p_active_count = p_active_count + 1; END IF;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q09(@active_count);
SELECT @active_count AS ActiveDoctors;
DELIMITER ;

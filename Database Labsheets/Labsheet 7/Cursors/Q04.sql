-- Cursor Question 4
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q04(OUT p_count INT)
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_department VARCHAR(40);
    DECLARE cur CURSOR FOR SELECT Department FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    SET p_count = 0;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_department;
        IF v_done THEN LEAVE read_loop; END IF;
        IF v_department = 'Cardiology' THEN SET p_count = p_count + 1; END IF;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q04(@cardiology_count);
SELECT @cardiology_count AS CardiologyDoctors;
DELIMITER ;

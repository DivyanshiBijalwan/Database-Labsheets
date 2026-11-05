-- Cursor Question 1
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q01()
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT DoctorID, DoctorName FROM Doctors ORDER BY DoctorID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_name;
        IF v_done THEN LEAVE read_loop; END IF;
        SELECT v_id AS DoctorID, v_name AS DoctorName;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q01();
DELIMITER ;

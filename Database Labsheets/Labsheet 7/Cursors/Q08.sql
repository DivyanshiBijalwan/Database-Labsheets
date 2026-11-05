-- Cursor Question 8
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q08()
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_name VARCHAR(50);
    DECLARE v_department VARCHAR(40);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT DoctorName, Department, ConsultationFee FROM Doctors ORDER BY Department, DoctorName;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_name, v_department, v_fee;
        IF v_done THEN LEAVE read_loop; END IF;
        SELECT v_name AS DoctorName, v_department AS Department, v_fee AS ConsultationFee;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q08();
DELIMITER ;

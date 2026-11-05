-- Cursor Question 2
USE Hospital_Cursor_Trigger_Lab;
DELIMITER //
CREATE PROCEDURE cursor_q02()
BEGIN
    DECLARE v_done BOOL DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT DoctorID, DoctorName, ConsultationFee FROM Doctors WHERE ConsultationFee > 1000;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_name, v_fee;
        IF v_done THEN LEAVE read_loop; END IF;
        SELECT v_id AS DoctorID, v_name AS DoctorName, v_fee AS ConsultationFee;
    END LOOP;
    CLOSE cur;
END //
CALL cursor_q02();
DELIMITER ;

-- Q7: Update medicine stock
USE Hospital_Functions_Lab;
DELIMITER //
CREATE PROCEDURE update_medicine_stock(IN p_id INT, IN p_quantity INT)
BEGIN
    UPDATE Medicines SET Stock = Stock + p_quantity WHERE MedicineID = p_id;
    SELECT * FROM Medicines WHERE MedicineID = p_id;
END //
CALL update_medicine_stock(301, 10);
DELIMITER ;

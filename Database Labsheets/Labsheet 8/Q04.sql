-- Q4: Medicine stock value
USE Hospital_Functions_Lab;
DELIMITER //
CREATE FUNCTION medicine_stock_value(unit_price DECIMAL(10,2), stock INT)
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN RETURN unit_price * stock; END //
SELECT MedicineID, MedicineName, UnitPrice, Stock,
       medicine_stock_value(UnitPrice, Stock) AS StockValue
FROM Medicines;
DELIMITER ;

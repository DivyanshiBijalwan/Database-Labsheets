-- Q3: Consultation fee with tax
USE Hospital_Functions_Lab;
DELIMITER //
CREATE FUNCTION consultation_with_tax(fee DECIMAL(10,2), tax_percent DECIMAL(5,2))
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN RETURN ROUND(fee + (fee * tax_percent / 100), 2); END //
SELECT PatientName, ConsultationFee AS OriginalFee,
       consultation_with_tax(ConsultationFee, 18) AS FeeWithTax
FROM Patients;
DELIMITER ;

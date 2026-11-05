-- Q9: Students by gender
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE GetStudentsByGender(IN p_Gender VARCHAR(10))
BEGIN SELECT * FROM Student WHERE Gender = p_Gender; END //
CALL GetStudentsByGender('Female');
DELIMITER ;

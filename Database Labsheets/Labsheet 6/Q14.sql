-- Q14: Student grade
USE CollegeDB;

DELIMITER //
CREATE FUNCTION StudentGrade(p_Marks DECIMAL(5,2))
RETURNS CHAR(1) DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_Marks >= 90 THEN 'A'
        WHEN p_Marks >= 75 THEN 'B'
        WHEN p_Marks >= 60 THEN 'C'
        ELSE 'D'
    END;
END //
SELECT StudentName, Marks, StudentGrade(Marks) AS Grade FROM Student;
DELIMITER ;

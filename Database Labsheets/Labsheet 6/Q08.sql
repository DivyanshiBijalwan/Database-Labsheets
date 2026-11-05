-- Q8: Check pass or fail
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE CheckResult(IN p_StudentID INT)
BEGIN
    SELECT StudentID, StudentName, Marks,
           IF(Marks >= 50, 'Pass', 'Fail') AS Result
    FROM Student WHERE StudentID = p_StudentID;
END //
CALL CheckResult(3);
DELIMITER ;

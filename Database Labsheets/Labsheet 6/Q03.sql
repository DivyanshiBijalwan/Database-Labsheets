-- Q3: Display all courses
USE CollegeDB;

DELIMITER //
CREATE PROCEDURE ShowCourses()
BEGIN SELECT * FROM Course; END //
CALL ShowCourses();
DELIMITER ;

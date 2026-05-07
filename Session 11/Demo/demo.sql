USE students_management;

-- STORED PROCEDURE (Thủ tục được lưu trữ)

-- DELIMITER //
-- CREATE PROCEDURE procedure_name(param1, param2,...)
-- BEGIN
-- 	SQL COMMANDS
-- END //
-- DELIMITER ;

-- Xây dựng thủ tục lấy ra tên và điểm của sinh viên
DELIMITER //
CREATE PROCEDURE get_students_score()
BEGIN
    SELECT fullName, avgScore 
    FROM students;
END //
DELIMITER ;

CALL get_students_score();

DROP PROCEDURE get_students_score;
-- TRANSACTION
-- START TRANSACTION;
-- SQL COMMANDS
-- ROLLBACK / COMMIT;

USE students_management;

DELIMITER //
CREATE PROCEDURE add_class_and_student()
BEGIN
	DECLARE v_classId INT;
    DECLARE v_studentId INT;
	START TRANSACTION;
	-- thêm lớp CNTT2 
	INSERT INTO classrooms 
    VALUES (8, 'CNTT2');  
	-- THÊM sinh viên Quang Minh và cho vào lớp CNTT2
	INSERT INTO students
	VALUES (150000, 'nguyễn quang minh', 'abc@gmail.com', 18, '2026-05-08', 8, 7.7);
	SELECT classId INTO v_classId FROM classrooms WHERE classId = 8;
    SELECT studentId INTO v_studentId FROM students WHERE studentId = 150000;
	COMMIT;
END //
DELIMITER ;
SELECT * FROM classrooms;
CALL add_class_and_student();
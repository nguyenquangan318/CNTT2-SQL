-- cú pháp tạo trigger
-- DELIMITER //
-- CREATE TRIGGER trigger_name
-- (BEFORE / AFTER) (INSERT / UPDATE / DELETE)
-- ON table_name
-- FOR EACH ROW
-- BEGIN
-- SQL COMMANDS
-- END //
-- DELIMITER ;
USE students_management;
SELECT * FROM classrooms;
SELECT * FROM students WHERE studentId=100007;

INSERT INTO students(studentId, fullName, email, age, avgScore)
VALUES(100007, 'Anh Dương', 'dư1@gmail.com', 18, 6);
-- Xây dựng trigger tự động cho sinh viên vào lớp chung
DELIMITER //
CREATE TRIGGER trigger_assign_student
BEFORE INSERT
ON students
FOR EACH ROW
BEGIN
	SET NEW.classId = 7;
END //
DELIMITER ;

DROP TRIGGER trigger_assign_student;

-- Tạo bảng lưu lại thông tin khi
-- thực hiện cập nhật điểm cho sinh viên
CREATE TABLE student_score_log(
	logId INT AUTO_INCREMENT PRIMARY KEY,
    studentId INT,
    oldScore FLOAT,
    newScore FLOAT,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP
)
-- Xây dựng trigger lưu lại thông tin khi
-- thực hiện cập nhật điểm cho sinh viên
DELIMITER //
CREATE TRIGGER trigger_log_score_update
AFTER UPDATE
ON students
FOR EACH ROW
BEGIN
	IF OLD.avgScore <> NEW.avgScore
    THEN
		INSERT INTO student_score_log(studentId, oldScore, newScore)
		VALUES (NEW.studentId, OLD.avgScore, NEW.avgScore);
	END IF;
END //
DELIMITER ;

UPDATE students
SET avgScore = 10
WHERE studentId > 10000;

SELECT * FROM student_score_log;
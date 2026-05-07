-- THAM SỐ CHỈ TRUYỀN VÀO (IN)

-- Lấy ra các sinh viên có điểm được nhập vào
use students_management;

DROP PROCEDURE student_score;
DELIMITER //
CREATE PROCEDURE student_score(IN p_score FLOAT)
BEGIN
    SELECT *
    FROM students
    WHERE avgScore = p_score;
END //
DELIMITER ;
CALL student_score(9);

-- THAM SỐ CHỈ LẤY RA (OUT)
-- Lấy ra biến chứa tên sinh viên có điểm được truyền vào 
DROP PROCEDURE get_student_name_by_score;
delimiter //
CREATE PROCEDURE get_student_name_by_score(
	IN p_score FLOAT, 
    OUT p_fullname VARCHAR(30)
)
BEGIN
	SELECT fullname INTO p_fullname
    FROM students
    WHERE avgScore = p_score
    LIMIT 1;
END //
delimiter ;
CALL get_student_name_by_score(7, @fullname);
SELECT @fullname;

-- THAM SỐ CẢ VÀO CẢ RA (INOUT)
-- Viết thủ tục lấy ra điểm mới = điểm truyền vào + 0.2
DELIMITER //
CREATE PROCEDURE increase_score( INOUT current_grade FLOAT )
BEGIN
    SET current_grade = current_grade + 0.2;
END //
DELIMITER ;
SET @score = 9;
CALL increase_score(@score);
SELECT @score;

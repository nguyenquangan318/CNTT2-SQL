-- Khai báo biến và câu điều kiện trong thủ tục
-- Cú pháp khai báo biến: 
-- DECLARE name DATA_TYPE DEFAULT value;

-- Cú pháp câu điều kiện:
-- IF conditions 1
-- THEN SQL commands;
-- ELSEIF conditions 2
-- THEN SQL commands;
-- ....
-- ELSE
-- SQL commands;
-- END IF;

-- Lấy ra biến chứa xếp loại của sinh viên
-- Nếu điểm > 8 : Giỏi
-- Nếu điểm > 5 : Khá
-- Còn lại: Yếu
DELIMITER //
CREATE PROCEDURE ranking_student_by_id(
	OUT p_rank varchar(5), IN p_student_id INT
)
BEGIN
	-- Khai báo biến
	DECLARE score FLOAT;
    
    -- Đặt điểm sinh viên vào biến
	SELECT avgScore INTO score FROM students
    WHERE studentId = p_student_id;
    
    -- Gán giá trị xếp loại dựa vào biến điểm
    IF score > 8
		THEN SET p_rank = 'Giỏi';
    ELSEIF score > 5
		THEN SET p_rank = 'Khá';
    ELSE 
		SET p_rank = 'Yếu';
    END IF;
END //
DELIMITER ;
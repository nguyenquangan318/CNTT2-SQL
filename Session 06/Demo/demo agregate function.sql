-- CÁC HÀM TỔNG HỢP (AGREGATE FUNCTION)
-- AVG, SUM, COUNT, MAX, MIN

-- Lấy ra tổng số sinh viên trong hệ thống
SELECT COUNT(studentId) total_student
FROM students;

-- Lấy ra điểm trung bình của toàn bộ sinh viên
SELECT ROUND(AVG(avgScore), 2) average_point 
FROM students;
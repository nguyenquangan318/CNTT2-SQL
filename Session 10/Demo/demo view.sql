-- VIEW
USE students_management;

-- Tạo view cho tên và điểm sinh viên
CREATE VIEW student_avgScore AS (
	SELECT fullName, avgScore 
    FROM students
);

-- Xóa VIEW
DROP VIEW student_avgScore;

SELECT * FROM student_avgScore;

-- Tạo view
CREATE VIEW class_avg AS (
	SELECT className, ROUND(AVG(avgScore), 2)
	FROM classrooms
	JOIN students ON classrooms.classId = students.classId
	GROUP BY classrooms.classId
);

-- Lấy tên lớp và điểm trung bình của lớp đó
SELECT * FROM class_avg;

-- Lấy các lớp có điểm trung bình < 7.5
SELECT * FROM class_avg
WHERE avgScore < 7.5;

-- Lấy lớp có điểm trung bình lớn nhất
SELECT * FROM class_avg
ORDER BY avgScore DESC
LIMIT 1;


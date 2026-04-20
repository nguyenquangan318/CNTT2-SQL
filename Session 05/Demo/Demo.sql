-- CREATE students_management;
USE students_management;
CREATE TABLE classrooms(
	classId INT PRIMARY KEY,
    className varchar(20)
);
CREATE TABLE students(
    studentId INT PRIMARY KEY,
    fullName varchar(30),
    email varchar(50) UNIQUE,
    age TINYINT CHECK (age >0),
    createAt DATE DEFAULT (current_date()),
    classId INT,
    avgScore FLOAT CHECK (avgScore >0),
    FOREIGN KEY (classId) REFERENCES classrooms(classId)
);

SELECT * FROM students;

-- Lấy danh sách mã, tên và học lực của sinh viên
-- Trong đó điểm > 8 là giỏi
-- điểm > 7 là khá
-- điểm < 7 là TB

-- SELECT
-- CASE
-- WHEN CONDITION THEN NEW_VALUE
-- WHEN CONDITION THEN NEW_VALUE
-- ...
-- ELSE
-- END AS NEW_COLUMN_NAME

SELECT studentId, fullName, avgScore,
	CASE 
		WHEN avgScore > 8 THEN 'GIỎI'
		WHEN avgScore > 7 THEN 'KHÁ'
        ELSE 'TB'
        END AS 'HỌC LỰC'
FROM students;

-- Lấy ra những sinh viên có điểm trung bình từ 5 - 8
SELECT * FROM students
WHERE avgScore BETWEEN 5 AND 8;

-- Lấy ra những sinh viên có tên chứa chữ 'a' và chữ 'e'
SELECT * FROM students
WHERE fullName LIKE '%a%' AND fullName LIKE '%e%';

-- Lấy ra 10 sinh viên
SELECT studentId, fullName,	avgScore
FROM students
-- ORDER BY avgScore DESC
LIMIT 10 OFFSET 10;



USE students_management;

SELECT * FROM students;
SELECT * FROM classrooms;

-- 6. SELECT
-- 1. FROM
-- 2. JOIN TABLE_NAME ON CONDITION
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 7. ORDER BY
-- 8. LIMIT OFFSET

-- JOIN 
SELECT *
FROM students
JOIN classrooms;

-- INNER JOIN: Tất cả các bản ghi thỏa mãn điều kiện
-- Lấy các sinh viên và tên lớp sinh viên đó theo học
SELECT s.*, c.className
FROM students s
JOIN classrooms c ON s.classId = c.classId;

-- LEFT JOIN: Lấy tất cả bản ghi từ bảng bên trái 
--            kể cả các bản ghi không thỏa mãn điều kiện
SELECT s.*, c.className
FROM students s
LEFT JOIN classrooms c ON s.classId = c.classId

-- RIGHT JOIN: Lấy tất cả bản ghi từ bảng bên phải 
--            kể cả các bản ghi không thỏa mãn điều kiện

-- CROSS JOIN : Lấy tất cả bản ghi

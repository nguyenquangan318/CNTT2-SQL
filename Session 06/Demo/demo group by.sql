-- GROUP BY: Nhóm các dữ liệu theo cột

-- Lấy tất cả các lớp và sĩ số sinh viên trong mỗi lớp
SELECT c.classId, c.className, COUNT(s.fullName) total_student
FROM classrooms c
JOIN students s ON s.classId = c.classId
GROUP BY c.classId;

-- Lấy các lớp và điểm trung bình của các sinh viên trong lớp
SELECT c.classId, c.className, ROUND(AVG(s.avgScore), 2) avg_point
FROM classrooms c
JOIN students s ON s.classId = c.classId
GROUP BY c.classId;

-- Lấy các lớp và số lượng sinh viên có điểm > 7.5 trong lớp
SELECT c.classId, c.className, COUNT(s.studentId) total_good_student
FROM classrooms c
JOIN students s ON s.classId = c.classId
WHERE s.avgScore > 7.5 AND c.className LIKE 'C%'
GROUP BY c.classId
HAVING total_good_student >= 3;
-- Chỉ in ra những lớp mà số lượng sinh viên này >= 3



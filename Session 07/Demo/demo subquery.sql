USE students_management;

SELECT * FROM students;
SELECT * FROM classrooms;

-- Truy vấn lồng với 1 giá trị
-- Lấy sinh viên có điểm cao hơn trung bình toàn bộ sinh viên
SELECT * FROM students 
WHERE avgScore > (
	SELECT AVG(avgScore)
	FROM students
);

-- Lấy sinh viên có tuổi lớn hơn tuổi trung bình
SELECT * FROM students
WHERE age > (
	select AVG(age)
	FROM students
);

-- Lấy toàn bộ sinh viên và điểm trung bình lớp của sinh viên đó
SELECT *, 
	(
		SELECT AVG(avgScore)
		FROM students s2
		WHERE s1.classId = s2.classId
    ) AS avg_class
FROM students s1;

-- Lấy toàn bộ sinh viên và sĩ số lớp của sinh viên đó 
select *,
	(
		select count(studentId)
		from students s2
        where s1.classId = s2.classId
	) as totalStudent
from students s1;



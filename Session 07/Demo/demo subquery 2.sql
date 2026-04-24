-- Truy vấn lồng với nhiều giá trị
-- Lấy các sinh viên trong lớp bắt đầu bằng CN
-- Dùng từ khóa IN 
SELECT * FROM students
WHERE classId IN (
	SELECT classId 
    FROM classrooms
    
	WHERE className LIKE 'CN%'
);

-- Lấy lớp có ít nhất 1 sinh viên điểm > 8
-- Sử dụng EXISTS
select c.className 
from classrooms c
where exists (
    select 1
    from students s
	where c.classId = s.classId
	and s.avgScore > 8
);

-- Lấy sinh viên có điểm lớn hơn tất cả sinh viên lớp có id 2
-- dùng từ khóa ALL
-- Lấy sinh viên điểm > điểm lớn nhất lớp 2
SELECT * FROM students
WHERE avgScore > (
    SELECT MAX(avgScore) 
    FROM students 
    WHERE classId = 2
);
-- Lấy sinh viên có điểm > tất cả điểm trong lớp 2
SELECT *
FROM students s
WHERE s.avgScore > ALL (
    SELECT avgScore
    FROM students
    WHERE classId = 2
);

-- Lấy sinh viên có điểm lớn hơn ít nhất 1 sinh viên lớp 2
select *
from students 
where avgScore > (
	select Min(avgScore)
    from students
    where classId = 2
);

SELECT *
FROM students
WHERE avgScore > ANY (
    SELECT avgScore
    FROM students
    WHERE classId = 2
);
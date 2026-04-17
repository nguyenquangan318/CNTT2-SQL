-- Lệnh xóa bảng
drop table students;

-- Lệnh sửa bảng
-- Thêm cột
alter table students
add score float(4,2) check (score > 0);

-- Sửa cột
alter table students
modify score decimal(4,2);

alter table students
drop constraint students_chk_2;

alter table students
change score avgScore decimal(4,2);
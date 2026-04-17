-- Lệnh tạo bảng
create table students (
	studentId int primary key,
    fullName varchar(30) not null,
    email varchar(50) unique,
    age tinyint default 18 check (age > 0),
    createAt date,
    classId int,
    foreign key (classId) references classrooms(classId)
);

create table classrooms(
	classId int primary key,
    className varchar(10) not null
)

select * from students;
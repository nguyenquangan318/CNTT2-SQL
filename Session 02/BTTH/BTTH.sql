-- Tạo cơ sở dữ liệu
create database books_management;
use books_management;

-- Tạo bảng bên trong
create table books(
	bookId char(5) primary key,
    bookName varchar(200) not null,
    quantity int check (quantity >= 0),
    price decimal(10,2) default 5000
);

create table borrow_books(
	borrowId int auto_increment primary key,
    bookId char(5) not null,
    borrowDate datetime default (current_timestamp())
)
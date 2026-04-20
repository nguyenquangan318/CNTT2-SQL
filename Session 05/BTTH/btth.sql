CREATE DATABASE shop;
USE shop;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	total_amount INT,
	note TEXT,
    user_id INT,
    `status` varchar(10)
);
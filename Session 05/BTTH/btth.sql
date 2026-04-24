CREATE DATABASE shop;
USE shop;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	total_amount INT,
	note TEXT,
    user_id INT,
    `status` varchar(10)
);

SELECT * from orders
where total_amount between 4000000 and 5000000
and status <> 'cancelled'
and (note like '%gấp%' or user_id IS NULL);



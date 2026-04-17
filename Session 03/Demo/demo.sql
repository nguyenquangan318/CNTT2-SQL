CREATE DATABASE sales_management;
USE sales_management;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    create_at DATE DEFAULT (current_date())
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    order_date DATE DEFAULT (current_date()),
    total DECIMAL(10,2) CHECK (total > 0),
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

insert into orders(order_id, total, customer_id)
values
	(1, 60000, 2),
    (2, 60000, 2),
    (3, 60000, 3),
    (4, 60000, 1);

-- Lệnh thêm dữ liệu vào bảng
INSERT INTO customers(customer_name, customer_id)
VALUES ('Vinh', 1 );

insert into customers(customer_id, customer_name)
values 
    (2, 'Toàn'),
    (3, 'Dương'),
    (4, 'Hiếu'),
    (5, 'Nhung'),
    (6, 'Đức');
    
-- Thay đổi tên ông Toàn thành tên cô Nhung
update customers
set customer_name = 'Nhung'
where customer_name='Toàn';

-- Xóa cô Nhung đi
DELETE FROM customers
WHERE customer_name = 'Nhung'
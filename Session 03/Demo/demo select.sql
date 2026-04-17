SELECT * FROM customers;
SELECT * FROM orders;

-- ALIAS: Định danh cho cột khi lấy dữ liệu
SELECT customer_name ten_khach_hang from customers;

-- Lấy thông tin đơn hàng và khách hàng đặt đơn
SELECT o.order_id, c.customer_name
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

-- Lấy ra tổng doanh thu của hệ thống
SELECT sum(total) tong_doanh_thu
FROM orders;

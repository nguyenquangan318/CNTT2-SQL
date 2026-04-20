CREATE DATABASE shop;
USE shop;

CREATE TABLE products(
	product_id char(5) PRIMARY KEY,
    product_name varchar(20) NOT NULL,
    product_size varchar(5),
    product_price DECIMAL(10,2) CHECK (product_price > 1000)
);
DROP TABLE products;

INSERT INTO products
VALUES
	('P01', 'Áo sơ mi trắng', 'L', 250000),
    ('P02', 'Quần Jean xanh', 'M', 450000),
    ('P03', 'Áo thun Basic', 'XL', 150000),
    ('P04', 'Áo hoodie', NULL, 200000);
    
-- Giảm giá sản phẩm P02 đi 50000
UPDATE products 
SET product_price = product_price - 50000
WHERE product_id = 'P02';

-- Tăng giá tất cả sản phẩm lên 10%
UPDATE products
SET product_price = product_price*1.1;

-- Xóa sản phẩm P03 nếu giá của sản phẩm > 5000.
DELETE FROM products
WHERE product_id = 'P03' AND product_price > 5000;

-- In nhãn sản phẩm (chỉ cần: Tên, Size) có giá > 300000.
SELECT product_name, product_size
FROM products
WHERE product_price > 300000


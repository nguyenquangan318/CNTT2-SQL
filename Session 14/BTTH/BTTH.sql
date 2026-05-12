USE rikkeiclinicdb;

DELIMITER //
CREATE PROCEDURE ProcessEquipmentPurchase(
	IN p_patient_id INT,
    IN p_product_id INT,
    IN p_stock INT,
    OUT p_msg varchar(30)
)
BEGIN
	-- Trừ số lượng mua tương ứng trong bảng thiết bị (Products).
    UPDATE products
    SET stock = stock - p_stock
    WHERE product_id = p_product_id;
END //
DELIMITER ;
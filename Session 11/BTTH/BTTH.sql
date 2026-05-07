-- BTTH
-- Xây dựng thủ tục xử lý đơn thuốc cho bệnh nhân
DELIMITER //
CREATE PROCEDURE ProcessPrescription(
	IN p_quantity INT,
    IN p_patient_id INT,
	IN p_medicine_id INT,
    IN p_discount_code varchar(10)
)
BEGIN
	-- Khai báo biến chứa số thuốc trong kho
    DECLARE v_stock INT;
    -- Khai báo biến chứa giá tiền của thuốc được mua
    DECLARE v_price DECIMAL(18,2);
    -- Khai báo biến chứa tổng giá trị của đơn
    DECLARE v_total DECIMAL(18,2);
    
    -- Truy vấn giá trị và gán cho biến số thuốc
    SELECT stock INTO v_stock
    FROM medicines
    WHERE medicine_id = p_medicine_id;
    
    -- Truy vấn giá trị và gán cho biến giá tiền của thuốc
    
    
    -- Sử dụng điều kiện để in thông báo
    IF v_stock < p_quantity
    THEN SELECT 'Thất bại: Kho không đủ thuốc';
    ELSE
		-- Nếu đủ thuốc thì giảm số lượng trong kho
		UPDATE medicines
        SET stock = stock -p_quantity
        WHERE medicine_id = p_medicine_id;
        -- Tính tổng giá trị của đơn
        
    END IF;
END //
DELIMITER ;
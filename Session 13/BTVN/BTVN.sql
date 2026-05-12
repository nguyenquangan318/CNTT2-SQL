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
    DECLARE v_total_price DECIMAL(18,2);
	-- Truy vấn giá trị và gán cho biến số thuốc
	SELECT stock INTO v_stock
	FROM medicines
	WHERE medicine_id = p_medicine_id;
	-- Sử dụng điều kiện để in thông báo
    IF v_stock < p_quantity
    THEN SELECT 'Thất bại: Kho không đủ thuốc';
    ELSE
		-- Nếu đủ thuốc thì giảm số lượng trong kho
		UPDATE medicines
        SET stock = stock - p_quantity
        WHERE medicine_id = p_medicine_id;
        -- Tính tổng giá trị của đơn
		-- Truy vấn giá trị và gán cho biến giá tiền của thuốc
        SELECT price INTO v_price FROM medicines
        WHERE medicine_id = p_medicine_id;
        SET v_total_price = p_quantity * v_price;
        
        IF p_discount_code = 'NV-RIKKEI'
        THEN SET v_total_price = v_total_price * 0.5;
        END IF;
        
        UPDATE patient_invoices
        SET total_due = total_due + v_total_price
        WHERE patient_id = p_patient_id;
        
        SELECT 'Thành công: Đã xử lý đơn thuốc';
    END IF;
END //
DELIMITER ;
USE rikkeiclinicdb;

DELIMITER //
CREATE TRIGGER AutoDeductWallet
BEFORE INSERT
ON Service_Usages
FOR EACH ROW
BEGIN
	-- Tạo biến giá tiền
	DECLARE v_actual_price decimal(18,2);
    -- Lấy giá tiền từ bảng services và gán cho biến
	SELECT price INTO v_actual_price FROM services
    WHERE service_id = NEW.service_id;
    -- Đặt giá tiền trước khi insert
    SET NEW.actual_price = v_actual_price;
    
    -- Cập nhật ví của bệnh nhân sau khi thêm dịch vụ
    UPDATE Wallets
    SET balance = balance - v_actual_price
    WHERE patient_id = NEW.patient_id;
END //
DELIMITER ;

INSERT INTO Service_Usages (patient_id, service_id)
VALUES (1, 1)
USE rikkeiclinicdb;

DELIMITER //
CREATE TRIGGER AutoDeductWallet
BEFORE INSERT
ON Service_Usages
FOR EACH ROW
BEGIN
	-- Tạo biến giá tiền
	DECLARE v_actual_price decimal(18,2);
    -- Tạo biến trạng thái ví
    DECLARE v_status varchar(20);
    -- Tạo biến số dư
    DECLARE v_balance decimal(18,2);
    -- Lấy giá tiền từ bảng services và gán cho biến
	SELECT price INTO v_actual_price FROM services
    WHERE service_id = NEW.service_id;
    -- Đặt giá tiền trước khi insert
    SET NEW.actual_price = v_actual_price;
    -- Lấy trạng thái ví tiền
    SELECT status INTO v_status 
    FROM wallets
    WHERE patient_id = NEW.patient_id;
    -- Lấy số dư trong ví
    SELECT balance INTO v_balance FROM wallets
    WHERE patient_id = NEW.patient_id;
    IF v_status = 'Inactive'
    THEN
		SELECT 'Thất bại: Ví trả trước đang bị khóa';
	ELSEIF v_balance < v_actual_price
	THEN
		SELECT 'Thất bại: Số dư ví không đủ để thanh toán';
    ELSE
		-- Cập nhật ví của bệnh nhân sau khi thêm dịch vụ
		UPDATE Wallets
		SET balance = balance - v_actual_price
		WHERE patient_id = NEW.patient_id;
    END IF;
END //
DELIMITER ;

INSERT INTO Service_Usages (patient_id, service_id)
VALUES (1, 1)
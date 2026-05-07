create database er ;
use er;

create table Patients (
	Patient_ID varchar(5) primary key ,
	Full_Name varchar (100) not null,
	Admission_Time datetime default current_timestamp
);

create table Vitals_Logs (
	Log_ID int auto_increment primary key,
	Patient_ID varchar(5),
	Heart_Rate int check (Heart_Rate >0),
	Blood_Pressure varchar(10),
	Record_Time datetime default current_timestamp,
	foreign key (Patient_ID) references  Patients(Patient_ID)
);

INSERT INTO Patients (Patient_ID, Full_Name)
VALUES 
('BN001', 'Nguyen Van A'),
('BN002', 'Tran Thi B'),
('BN003', 'Le Van C'),
('BN004', 'Tran Minh Duc');

INSERT INTO Vitals_Logs (Patient_ID, Heart_Rate, Blood_Pressure)
VALUES
('BN001', 72, '120/80'),
('BN001', 75, '118/79'),
('BN002', 80, '130/85'),
('BN003', 65, '110/70'),
('BN004', NULL, '20/70');

CREATE INDEX idx_patient_record_time 
ON Vitals_Logs(Patient_ID, Record_Time DESC);

-- Lấy tên bệnh nhân, huyết áp, nhịp tim, record_time
CREATE VIEW ER_Dashboard_View AS
	SELECT 
		Full_Name,
		Blood_Pressure, 
		COALESCE(CAST(Heart_Rate AS CHAR), 'Pending') AS Heart_rate,
		CASE 
			WHEN Heart_Rate > 120 OR Heart_Rate <50
			THEN 'CRITICAL'
			WHEN Heart_Rate IS NULL
			THEN 'PENDING'
			ELSE 'STABLE'
		END AS Urgency_Level,
		Record_Time
	FROM Patients
	JOIN Vitals_Logs ON Patients.Patient_ID = Vitals_Logs.Patient_ID;

SELECT * FROM ER_Dashboard_View;
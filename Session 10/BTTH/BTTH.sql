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

CREATE INDEX idx_patient_record_time 
ON Vitals_Logs(Patient_ID, Record_Time DESC);

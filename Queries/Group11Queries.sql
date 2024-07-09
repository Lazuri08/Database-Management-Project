USE group11schema;
-- 1 
SELECT CONCAT(FirstName, " ", LastName) AS FullName, Address, PhoneNumber, EmailAddress
FROM Patient;

-- 2 
SELECT FirstName From Patient 
INNER JOIN Appointment
ON patient.patientId = appointment.patient_patientID 
WHERE appointment.appointmentDate > DATE_SUB(curdate(), interval 2 year);


-- 3 
SELECT CONCAT(Patient.FirstName, ' ', Patient.LastName) AS "PatientFullName", CONCAT(Doctor.FirstName, ' ', Doctor.LastName) AS "DoctorFullName",
CONCAT(Staff.FirstName, ' ', Staff.LastName) AS "NurseFullName",
CONCAT(Appointment.AppointmentDate, ", ", Appointment.AppointmentTime) AS AppointmentDateTime, examine.treatment AS "TestOrdered"
FROM Patient
JOIN Appointment
ON Patient.PatientId = Appointment.Patient_patientId
JOIN Examine
ON Appointment.AppointmentNo = Examine.Appointment_AppointmentNo
join staff
on staff.staffId = examine.staff_staffId
JOIN Doctor
ON Examine.Doctor_DoctorId = Doctor.DoctorId
WHERE YEAR(appointment.AppointmentDate) = "2020%";

-- 4 
SELECT * FROM Appointment
WHERE Status = 'Cancelled' OR Status = 'No show' AND AppointmentDate  BETWEEN '2020-12-01' AND '2020-12-31' ;

-- 5 
SELECT CONCAT(FirstName, ' ', LastName) AS FullName, format((HourlyRate * HoursWorked), 2) AS Salary
FROM Staff INNER JOIN PayCheck
ON Staff.StaffId = PayCheck.Staff_StaffId;

-- 6 
SELECT CONCAT(Staff.FirstName, ' ', Staff.LastName) AS Name, 
CONCAT(Staff.Address, ', ', Staff.City, ', ', Staff.Province) AS Address,PostalCode
FROM Staff 
WHERE position != "manager"
UNION ALL
SELECT
CONCAT(Doctor.FirstName, ' ',Doctor.LastName) AS Name, 
CONCAT(Doctor.Address, ', ', Doctor.City, ', ', Doctor.Province) AS Address, PostalCode
FROM  Doctor;

-- 7 
SELECT CONCAT(FirstName, ' ', LastNAme) AS FullName FROM Patient
WHERE Doctor_DoctorId IS NOT NULL;

-- 8 
SELECT CONCAT(FirstName, ' ', LastNAme) AS FullName, PrimaryMemberId, Relationship
FROM Patient; 

-- 9 
SELECT CONCAT(FirstName, ' ', LastNAme) as FullName FROM Patient
  JOIN Appointment
  ON Patient.patientId = Appointment.Patient_patientId
  WHERE DATE(AppointmentDate) = '2021-01-15';

-- 10 
SELECT CONCAT(Patient.FirstName, ' ', Patient.LastNAme) AS "PatientFullName", Invoice.Description, CONCAT(Doctor.FirstName, " ", Doctor.LastName) AS "DoctorFullName"
FROM invoice INNER JOIN Appointment
ON Invoice.Appointment_AppointmentNo = Appointment.AppointmentNo
INNER JOIN Patient
ON Patient.PatientId = Appointment.Patient_PatientId
INNER JOIN Doctor
ON Patient.Doctor_DoctorId = Doctor.DoctorId;
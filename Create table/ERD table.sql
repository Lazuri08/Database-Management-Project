CREATE TABLE Staff_Schedule(   StaffID int primary key,   
Shift text,   Date date,   role text,   hoursWorked int  );  

CREATE TABLE clinic_Staff(    clinicStaffID int primary key,    
name text,    role text,    manager text  ); 

CREATE TABLE Clinic_Staff_has_Staff_Schedule(    clinic_Staff_clinicStaffID int,    
Staff_schedule_StaffID  int,    
foreign key(clinic_Staff_clinicStaffID) 
references clinic_Staff(clinicStaffID),    
foreign key(Staff_schedule_StaffID) 
references  Staff_Schedule(StaffID)  );  

CREATE TABLE Patient(   PatientID int primary key,   name text,   
address text,   phone int );  

CREATE TABLE Clinic_STaff_Has_Patient(   clinic_Staff_clinicStaffID int,   
patient_patientID int,   foreign key(clinic_Staff_clinicStaffID) 
references clinic_Staff(clinicStaffID),   
foreign key(patient_patientID) references Patient(PatientID)  );  

CREATE TABLE Walkin_Queue( VisitID int primary key);  CREATE TABLE Check_IN(VisitID int primary key); 

CREATE TABLE Visit(    VisitID int primary key,    PatientID int,    BloodPressure int,    
Temparature decimal,    height  decimal,    Weight int,    Walkin_Queue_VisitID int,    
Check_In_VisitID int,    foreign key(PatientID) references Patient(PatientID),    
foreign key(Walkin_Queue_VisitID) references Walkin_Queue(VisitID),    
foreign key(Check_In_VisitID) references Check_IN(VisitID)      );  

CREATE TABLE Patient_Has_Visit(    patient_patientID int,    Visit_VisitID int,    
foreign key(patient_patientID) references Patient(PatientID) ,   
foreign key(Visit_VisitID) references Visit(VisitID)     ); 

CREATE TABLE Diagnostic_Tests(    DoctorID int primary key,    
PatientID int,    TestType  text,    Symptoms text,    prescriptionMedicians text,    
foreign key(PatientID) references Patient(PatientID)    );  

CREATE TABLE Visit_Has_Diagnostic_Tests(    Visit_VisitID int,    
Visit_Walkin_Queue_VisitID int,    Visit_Check_in_visitID int,    
Diagnostic_Tests_DoctorID int,    foreign key(Visit_VisitID) 
references Visit(VisitID),    foreign key(Visit_Walkin_Queue_VisitID) 
references  Walkin_Queue(VisitID),    foreign key(Visit_Check_in_visitID) 
references Check_In_VisitID(VisitID),    foreign key(Diagnostic_Tests_DoctorID) 
references Diagnostic_Tests(DoctorID)  );  

CREATE TABLE Enrolled_Patient(    PatientID int primary key,    
Patient_PatientID int,    foreign key(Patient_PatientID) references Patient(PatientID)  );  

CREATE TABLE Walk_INPatient(    PatientID int primary key,    Patient_PatientID int,    
foreign key(Patient_PatientID) references Patient(PatientID)  );  

CREATE TABLE Appointment(   AppointmentNo int primary key,   PatientID int,   
DoctorID int,   date date,   time text,   statuss text,   smallFee text,   
foreign key(PatientID) references Patient(PatientID),   
foreign key(DoctorID) references Diagnostic_Tests(DoctorID) );   

CREATE TABLE Enrolled_Patient_Has_Appointment(    Enrolled_Patient_PatientID int,    
Enrolled_Patient_Patient_PatientID int,    Appointment_AppointmentNo int,    
foreign key(Enrolled_Patient_Patient_PatientID) references Patient(PatientID),    
foreign key(Enrolled_Patient_Patient_PatientID) references Enrolled_Patient(PatientID),    
foreign key(Appointment_AppointmentNo) references Appointment(AppointmentNo)  );
 
 
 
 
 
 
 
 
 
 
 
 
 
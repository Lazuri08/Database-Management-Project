CREATE DATABASE  IF NOT EXISTS `group11schema` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `group11schema`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: group11schema
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentNo` int NOT NULL,
  `Patient_patientId` int NOT NULL,
  `AppointmentDate` date DEFAULT NULL,
  `AppointmentTime` time DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL COMMENT 'booked\ncancelled\narrived\nchecked in\nchecked out\nLWT\nNo show',
  PRIMARY KEY (`AppointmentNo`),
  KEY `fk_Appointment_Patient_idx` (`Patient_patientId`),
  CONSTRAINT `fk_Appointment_Patient` FOREIGN KEY (`Patient_patientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,'2020-01-10','16:00:00','Checked out'),(2,1,'2020-01-21','13:45:00','Arrived'),(3,1,'2020-02-09','11:30:00','LWT'),(4,1,'2020-02-19','14:00:00','Checked out'),(5,1,'2020-03-15','14:00:00','Arrived'),(6,3,'2020-12-15','15:25:00','No show'),(7,2,'2020-12-17','13:00:00','Cancelled'),(8,4,'2020-12-20','14:30:00','No show'),(9,5,'2020-12-23','15:45:00','Cancelled'),(10,5,'2020-12-26','16:00:00','LWT'),(11,4,'2020-12-28','14:30:00','Cancelled'),(12,4,'2021-01-15','14:30:00','Checked out'),(13,8,'2021-01-15','15:15:00','Checked out'),(14,11,'2021-01-15','16:45:00','Checked out');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DoctorId` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DoctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Gorkem','Sari','Anywhere Street ','Toronto','Ontario','M56389'),(2,'Nanami','Waku','Somewhere Avenue','Montreal','Quebec','M6N5G4'),(3,'Mia ','Nakashima','Right Here Street','Toronto ','Ontario ','M849H5'),(4,'Enes ','Sertkan','Maybe There Street','Missisauga','Ontario','M5JK6J'),(5,'William','Cham','Elsewhere Avenue','Toronto ','Ontario','M5H4H5'),(6,'John','Smith','Maybe Here Avenue','Calgary','Alberta','M26Y54'),(7,'Pretzel','Duncan','Stick Street','Vancouver','British Columbia','M89GT9'),(8,'Tropicana ','Juicer','Pulp Street','Vancouver','British Columbia','M54H8I'),(9,'Bread','Sandwich','Subway Street East','Hamilton','Ontario','M69J58'),(10,'Julius','Caesar','Salad Avenue','Richmond','British Columbia','M69420');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examine`
--

DROP TABLE IF EXISTS `examine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examine` (
  `Appointment_AppointmentNo` int NOT NULL,
  `Symptom` varchar(45) DEFAULT NULL,
  `Diagnosis` varchar(45) DEFAULT NULL,
  `Treatment` varchar(45) DEFAULT NULL,
  `Specialist` varchar(45) DEFAULT NULL,
  `Staff_StaffId` int NOT NULL,
  `Doctor_DoctorId` int NOT NULL,
  PRIMARY KEY (`Appointment_AppointmentNo`),
  KEY `fk_Examine_Staff1_idx` (`Staff_StaffId`),
  KEY `fk_Examine_Doctor1_idx` (`Doctor_DoctorId`),
  CONSTRAINT `fk_Examine_Appointment1` FOREIGN KEY (`Appointment_AppointmentNo`) REFERENCES `appointment` (`AppointmentNo`),
  CONSTRAINT `fk_Examine_Doctor1` FOREIGN KEY (`Doctor_DoctorId`) REFERENCES `doctor` (`DoctorId`),
  CONSTRAINT `fk_Examine_Staff1` FOREIGN KEY (`Staff_StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examine`
--

LOCK TABLES `examine` WRITE;
/*!40000 ALTER TABLE `examine` DISABLE KEYS */;
INSERT INTO `examine` VALUES (1,'Dizziness','High blood pressure','Diuretics','3',1,2),(2,'Dizziness','High blood pressure','Diuretics','3',1,2),(3,'Dizziness','High blood pressure','Diuretics','3',1,2),(4,'Dizziness','High blood pressure','Diuretics','3',1,2),(5,'Dizziness','High blood pressure','Diuretics','3',1,2),(12,'Diarrhea','Worms','Mebendazole','2',3,6),(13,'Allergies','Allergic reaction','Claritin','4',6,6),(14,'Nausea','Food poisoning','Pebto-bismol','5',5,6);
/*!40000 ALTER TABLE `examine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceId` int NOT NULL,
  `Appointment_AppointmentNo` int NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `InvoiceDate` date DEFAULT NULL,
  `InvoiceTotal` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `fk_Invoice_Appointment1_idx` (`Appointment_AppointmentNo`),
  CONSTRAINT `fk_Invoice_Appointment1` FOREIGN KEY (`Appointment_AppointmentNo`) REFERENCES `appointment` (`AppointmentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1,'Checked blood pressure ','2020-01-10',65.50),(2,2,'Checked blood pressure ','2020-01-21',120.00),(3,3,'Checked blood pressure ','2020-02-09',15.00),(4,4,'Checked blood pressure ','2020-02-19',56.00),(5,5,'Checked blood pressure ','2020-03-15',45.00),(6,6,'No show','2020-12-15',20.00),(7,7,'Cancelled','2020-12-17',0.00),(8,8,'No show','2020-12-20',20.00),(9,9,'Cancelled','2020-12-23',0.00),(10,10,'Checked blood pressure','2020-12-26',55.00),(11,11,'Cancelled','2020-12-28',0.00),(12,12,'Checked for worms','2021-01-15',59.00),(13,13,'Applied cream and gave medicine for allergic reaction','2021-01-15',32.00),(14,14,'Hydrated and checked patient\'s nauseous reaction','2021-01-15',46.00);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientId` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `EmailAddress` varchar(45) DEFAULT NULL,
  `MedicalInformation` varchar(45) DEFAULT NULL,
  `PrimaryMemberId` int DEFAULT NULL,
  `Relationship` varchar(45) DEFAULT NULL,
  `Doctor_DoctorId` int DEFAULT NULL,
  PRIMARY KEY (`PatientId`),
  KEY `fk_Patient_Doctor1_idx` (`Doctor_DoctorId`),
  CONSTRAINT `fk_Patient_Doctor1` FOREIGN KEY (`Doctor_DoctorId`) REFERENCES `doctor` (`DoctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Dwayne','Johnson','123 Any Street','6488875253','the_rock@yahoo.com','',NULL,NULL,2),(2,'Emma','Watson','Hogswart Avenue','6789950564','wingardiumleviosa@hotmail.com',NULL,NULL,NULL,NULL),(3,'Avril','Lavigne','501 Pop Street','6890145223','sk8terboi@outlook.com',NULL,NULL,NULL,NULL),(4,'Thomas','Shelby','111 Birmingham Drive','4841616117','thomas_shelby@gmail.com',NULL,4,'Husband',6),(5,'Grace','Shelby','111 Birmingham Drive','6847616589','grace_shelby@gmail.com',NULL,4,'Wife',6),(6,'Charles','Shelby','111 Birmingham Drive','4816535594','charles_shelby@gmail.com',NULL,4,'Son',6),(7,'Ruby','Shelby','111 Birmingham Drive','6631794956','ruby_shelby@gmail.com',NULL,4,'Daughter',6),(8,'Lionel ','Messi','1030 Barcelona Avenue','4103007126','lionel_messi10@gmail.com',NULL,NULL,NULL,NULL),(9,'Robert ','Lewandowski','888 Bayern Street','6484498848','robert_lewandowski09@outlook.com',NULL,NULL,NULL,NULL),(10,'Cristiano','Ronaldo','709 Madrid Street','4948651784','cristiano07ronaldo@yahoo.com',NULL,NULL,NULL,NULL),(11,'Neymar','Silva','1110 Parisian Street','6699484761','neymarjrsilva11@hotmail.com',NULL,NULL,NULL,NULL),(12,'Harleen','Quinzel','93 Timm Street','6949117886','harleyandivy@hotmail.com',NULL,NULL,NULL,NULL),(13,'Bruce','Wayne','1007 Mountain Drive','4456135894','bruce_wayne@gmail.com',NULL,13,'Son',5),(14,'Thomas ','Wayne','1007 Mountain Drive','4889261561','thomas_wayne@gmail.com',NULL,13,'Father',5),(15,'Martha ','Wayne','1007 Mountain Drive','6897787154','martha_wayne@gmail.com',NULL,13,'Mother',5);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_description`
--

DROP TABLE IF EXISTS `patient_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_description` (
  `Patient_PatientId` int NOT NULL,
  `BloodType` char(2) DEFAULT NULL,
  `Temperature` char(2) DEFAULT NULL,
  `Height` char(4) DEFAULT NULL,
  `Weight` char(4) DEFAULT NULL,
  PRIMARY KEY (`Patient_PatientId`),
  CONSTRAINT `fk_Patient1 Description_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_description`
--

LOCK TABLES `patient_description` WRITE;
/*!40000 ALTER TABLE `patient_description` DISABLE KEYS */;
INSERT INTO `patient_description` VALUES (1,'A+','97','167','64'),(2,'B-','89','189','89'),(3,'O+','92','155','53'),(4,'AB','93','164','65'),(5,'O-','87','154','49'),(6,'A+','99','135','45'),(7,'A+','99','130','41'),(8,'A-','91','165','61'),(9,'B-','94','159','54'),(10,'O+','96','154','58'),(11,'O-','95','152','54'),(12,'O+','95','161','56'),(13,'A-','94','171','75'),(14,'B+','96','169','81'),(15,'AB','95','156','55');
/*!40000 ALTER TABLE `patient_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paycheck`
--

DROP TABLE IF EXISTS `paycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paycheck` (
  `Staff_StaffId` int NOT NULL,
  `HourlyRate` double DEFAULT NULL,
  `HoursWorked` double DEFAULT NULL,
  PRIMARY KEY (`Staff_StaffId`),
  KEY `fk_Pay Check_Staff1_idx` (`Staff_StaffId`),
  CONSTRAINT `fk_Pay Check_Staff1` FOREIGN KEY (`Staff_StaffId`) REFERENCES `staff` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paycheck`
--

LOCK TABLES `paycheck` WRITE;
/*!40000 ALTER TABLE `paycheck` DISABLE KEYS */;
INSERT INTO `paycheck` VALUES (1,39.75,24.95),(2,39.75,31.35),(3,39.75,29.55),(4,39.75,28.05),(5,39.75,26.35),(6,39.75,22.65),(7,25.65,25.5),(8,25.65,26.95),(9,25.65,31),(10,25.65,29.45),(11,25.65,30.25),(12,23.55,28.6),(13,23.55,25.25);
/*!40000 ALTER TABLE `paycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialist_contact`
--

DROP TABLE IF EXISTS `specialist_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialist_contact` (
  `SpecialistId` int NOT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SpecialistId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist_contact`
--

LOCK TABLES `specialist_contact` WRITE;
/*!40000 ALTER TABLE `specialist_contact` DISABLE KEYS */;
INSERT INTO `specialist_contact` VALUES (1,'Jackman','Hugh'),(2,'Reynolds','Ryan'),(3,'Hart','Kevin'),(4,'Brie','Alison'),(5,'Mendler','Bridgit');
/*!40000 ALTER TABLE `specialist_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffId` int NOT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Province` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Nurse','Julia','Roberts','First Nurse street','Toronto','Ontario','M69Y7T'),(2,'Nurse','Margot','Robbie','Second Nurse Street','Missisauga','Ontario ','M89H5K'),(3,'Nurse','Emma ','Stone','Third Nurse Street','Toronto','Ontario','M6P86U'),(4,'Nurse','Victoria','Beckham','Fourth Nurse Street','Etobicoke','Ontario','M56IHJ'),(5,'Nurse','Hannah ','Tointon','Fifth Nurse Street','Toronto','Ontario','M6J52L'),(6,'Nurse','Anna','Taylor','Sixth Nurse Street','Toronto','Ontario','M5651H'),(7,'Secretary','Courteney ','Cox','Primary Sec Street','Toronto','Ontario','M894YU'),(8,'Secretary','Andrew ','Garfield','Secondary Sec Street','Etobicoke','Ontario','M615FT'),(9,'Secretary','Tobey ','Maguire','Tirtiary Sec Street','Etobicoke','Ontario','MIU58G'),(10,'Secretary','Paul','Rudd','Fourtiary Sec Street','Toronto','Ontario','M46262'),(11,'Secretary','Cara','Delevigne','Quintiary Sec Street','Toronto','Ontario','M481HG'),(12,'Admin Assistant','Sandra','Bullock','Primer Asistente Avenue','Missisauga','Ontario','M195HG'),(13,'Admin Assistant','David ','Beckham','Segundo Asistente Avenue','Missisauga','Ontario','M89KLO'),(14,'Manager','Adam','Sandler','Only Manager Drive','Toronto','Ontario','M26HLO');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 19:47:49

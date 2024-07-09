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
  `Description` varchar(45) DEFAULT NULL,
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
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient description`
--

DROP TABLE IF EXISTS `patient description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient description` (
  `Patient_PatientId` int NOT NULL,
  `BloodType` char(2) DEFAULT NULL,
  `Temperature` char(2) DEFAULT NULL,
  `Height` char(4) DEFAULT NULL,
  `Weight` char(4) DEFAULT NULL,
  PRIMARY KEY (`Patient_PatientId`),
  CONSTRAINT `fk_Patient Description_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`PatientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient description`
--

LOCK TABLES `patient description` WRITE;
/*!40000 ALTER TABLE `patient description` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient description` ENABLE KEYS */;
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

-- Dump completed on 2022-08-01 15:35:47

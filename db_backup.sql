-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_team58
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB
DROP SCHEMA IF EXISTS `db_team58`;
CREATE SCHEMA `db_team58`;
USE `db_team58`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contains` (
  `MedicalEquipmentID` int(11) NOT NULL,
  `SectorName` varchar(20) NOT NULL,
  `QuantityAvaillable` int(11) DEFAULT NULL,
  PRIMARY KEY (`MedicalEquipmentID`,`SectorName`),
  KEY `sectorName_idx` (`SectorName`),
  CONSTRAINT `sectorName2` FOREIGN KEY (`SectorName`) REFERENCES `hospitalsectors` (`SectorName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MedicalEquipmentID2` FOREIGN KEY (`MedicalEquipmentID`) REFERENCES `medicalequipment` (`MedicalEquipmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (1,'Cardiological',10),(1,'Neurological',25),(1,'Pediatric',7),(1,'Psychiatric',12),(1,'Surgery',200),(2,'Surgery',30),(3,'Cardiological',50),(3,'Pediatric',2);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `Identity` varchar(8) NOT NULL,
  `Specialty` varchar(30) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Sex` enum('M','F') DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `HiredDate` date DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Identity`),
  KEY `fk_Doctor_Staff1_idx` (`Identity`),
  CONSTRAINT `fk_Doctor_Staff1` FOREIGN KEY (`Identity`) REFERENCES `staff` (`Identity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('AH159753','Surgeon','Afrodith Koutsiou','F',1000,'2011-01-08','6954782236'),('AH456782','Psychiatrist','Iwanna Ganith','F',1800,'2010-11-12','6954585123'),('AH789456','Pediatrician','Giwrgos Papadopoulos','M',2000,'2019-09-01','6954812358'),('AK123654','Surgeon','Kwstas Mourouzidis','M',2000,'2011-01-09','6945871236'),('AK135590','Dermatologist','Ioannis Katos','M',2500,'2012-02-02','6977075449');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER`db_team58`.`Doctor_BEFORE_INSERT`
BEFORE INSERT ON `Doctor` FOR EACH ROW
BEGIN
	IF(NEW.Salary <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
    IF(length(NEW.Identity) !=8) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Identity must be 8 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Doctor_BEFORE_UPDATE` 
BEFORE UPDATE ON `Doctor` FOR EACH ROW
BEGIN
	IF(NEW.Salary <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
    IF(length(NEW.Identity) !=8) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Identity must be 8 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `getexamsusing`
--

DROP TABLE IF EXISTS `getexamsusing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `getexamsusing` (
  `MedicalEquipmentID` int(11) NOT NULL,
  `AMKA` varchar(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`MedicalEquipmentID`,`AMKA`),
  KEY `AMKA_idx` (`AMKA`),
  CONSTRAINT `AMKA3` FOREIGN KEY (`AMKA`) REFERENCES `patients` (`AMKA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MedicalEquipmentID3` FOREIGN KEY (`MedicalEquipmentID`) REFERENCES `medicalequipment` (`MedicalEquipmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `getexamsusing`
--

LOCK TABLES `getexamsusing` WRITE;
/*!40000 ALTER TABLE `getexamsusing` DISABLE KEYS */;
INSERT INTO `getexamsusing` VALUES (1,'12019101234','2019-11-17','13:00'),(1,'13035879845','2019-04-12','08:00'),(2,'28026456987','2018-08-20','14:30'),(3,'28026456987','2017-11-25','11:35'),(4,'12019101234','2018-04-05','19:20');
/*!40000 ALTER TABLE `getexamsusing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_appointment_with`
--

DROP TABLE IF EXISTS `has_appointment_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_appointment_with` (
  `Identity` varchar(8) NOT NULL,
  `AMKA` varchar(11) NOT NULL,
  `Time` varchar(5) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Description` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Identity`,`AMKA`),
  KEY `AMKA_idx` (`AMKA`),
  CONSTRAINT `2AMKA` FOREIGN KEY (`AMKA`) REFERENCES `patients` (`AMKA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `2Identity` FOREIGN KEY (`Identity`) REFERENCES `doctor` (`Identity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_appointment_with`
--

LOCK TABLES `has_appointment_with` WRITE;
/*!40000 ALTER TABLE `has_appointment_with` DISABLE KEYS */;
INSERT INTO `has_appointment_with` VALUES ('AH159753','25016575896','17:00','2019-12-15','Hearing Evaluation'),('AH456782','28026456987','12:00','2019-11-27','Vision Evaluation'),('AH789456','12028415648','18:00','2019-11-16','Reaprraisal'),('AK123654','13035879845','19:00','2019-11-24','Stomach ache '),('AK135590','12019101234','18:00','2019-11-15','Check-up');
/*!40000 ALTER TABLE `has_appointment_with` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalsectors`
--

DROP TABLE IF EXISTS `hospitalsectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitalsectors` (
  `SectorName` varchar(20) NOT NULL,
  `AvailableBeds` int(11) DEFAULT NULL,
  `TotalBeds` int(11) NOT NULL,
  `UsedBeds` int(11) DEFAULT NULL,
  PRIMARY KEY (`SectorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalsectors`
--

LOCK TABLES `hospitalsectors` WRITE;
/*!40000 ALTER TABLE `hospitalsectors` DISABLE KEYS */;
INSERT INTO `hospitalsectors` VALUES ('Cardiological',6,25,19),('Neurological',20,25,5),('Pediatric',10,30,20),('Psychiatric',5,20,15),('Surgery',3,15,12);
/*!40000 ALTER TABLE `hospitalsectors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`HospitalSectors_BEFORE_INSERT` 
BEFORE INSERT ON `HospitalSectors` FOR EACH ROW
BEGIN
	IF (new.AvailableBeds < 0 ) THEN
    signal sqlstate '45000' set message_text = 'invalid data';
    end if;
    IF (new.UsedBeds < 0 ) THEN
    signal sqlstate '45000' set message_text = 'invalid data';
    end if;
    IF (new.TotalBeds <= 0 ) THEN
    signal sqlstate '45000' set message_text = 'invalid data';
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`HospitalSectors_BEFORE_UPDATE` 
BEFORE UPDATE ON `HospitalSectors` FOR EACH ROW
BEGIN
	IF (new.AvailableBeds < 0 ) THEN
    signal sqlstate '45000' set message_text = 'invalid data';
    end if;
    IF (new.UsedBeds < 0 ) THEN
    signal sqlstate '45000' set message_text = 'invalid data';
    end if;
    IF (new.TotalBeds <= 0 ) THEN
    signal sqlstate '45000' set message_text = 'invalid data';
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL,
  `AMKA` varchar(11) NOT NULL,
  `TotalCost` float DEFAULT NULL,
  `DateOfHospitalization` date DEFAULT NULL,
  `DateOfDischarge` date DEFAULT NULL,
  `DateOfPayment` date DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`,`AMKA`),
  UNIQUE KEY `InvoiceID_UNIQUE` (`InvoiceID`),
  KEY `AMKA_idx` (`AMKA`),
  CONSTRAINT `Patients_AMKA` FOREIGN KEY (`AMKA`) REFERENCES `patients` (`AMKA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (124578,'28026456987',150,'2018-10-15','2019-10-20','2018-10-25'),(154879,'28026456987',200,'2018-10-19','2018-10-25','2018-10-26'),(215487,'25016575896',270,'2018-10-15','2018-10-25','2018-10-28'),(231567,'12019101234',300,'2018-10-10','2018-10-23','2018-10-23'),(298746,'13035879845',10,'2018-10-11','2018-10-18','2018-10-18');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Invoice_BEFORE_INSERT` 
BEFORE INSERT ON `Invoice` FOR EACH ROW
BEGIN
	IF (new.DateOfHospitalization > new.DateOfDischarge) THEN
    signal sqlstate '45000' set message_text = 'Date of Hospitalization cannot be later than Date of Discharge';
    END IF;
    IF(NEW.TotalCost <0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Invoice_BEFORE_UPDATE`
BEFORE UPDATE ON `Invoice` FOR EACH ROW
BEGIN
	IF (new.DateOfHospitalization > new.DateOfDischarge) THEN
    signal sqlstate '45000' set message_text = 'Date of Hospitalization cannot be later than Date of Discharge';
    END IF;
	IF(NEW.TotalCost <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medicalequipment`
--

DROP TABLE IF EXISTS `medicalequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicalequipment` (
  `MedicalEquipmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(200) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MedicalEquipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalequipment`
--

LOCK TABLES `medicalequipment` WRITE;
/*!40000 ALTER TABLE `medicalequipment` DISABLE KEYS */;
INSERT INTO `medicalequipment` VALUES (1,'Made of material that allows the skin to breathe','Traumaplast'),(2,' Piece of material used either to support a medical device such as a dressing or splint, or on its own to provide support to or to restrict the movement of a part of the body.','Bandages'),(3,'Medical implement used for capillary blood sampling','Lancet'),(4,'For Medical Equipment Transportation','Unattached trolley'),(5,'Antiseptic, disinfectant use','Bedadin');
/*!40000 ALTER TABLE `medicalequipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `AMKA` varchar(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `DeseaseHistory` varchar(50) DEFAULT NULL,
  `Street` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `Sex` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`AMKA`),
  UNIQUE KEY `AMKA_UNIQUE` (`AMKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('12019101234','Nikos Papas','6980123123','Flu','12, Aristotelous','Thessaloniki',67123,'M'),('12028415648','Giannis Kompos','6949760485','Stroke','15, Venizelou','Kavala',65403,'M'),('13035879845','Giwrgos Mpaltas','6942501586','Heart attack','18,21hs Iouniou','Kilkis',61100,'M'),('25016575896','Elenh Amoiridou','6975214589','Stroke','19,Mullerou','Athina',10436,'F'),('28026456987','Maria Pentagiwtisa','6983546987','Thyroid','25,Omonoias','Athina',10431,'F');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Patients_BEFORE_INSERT`
BEFORE INSERT ON `Patients` FOR EACH ROW
BEGIN
	IF(length(NEW.AMKA) !=11) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'AMKA must be 11 digits long';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Patients_BEFORE_UPDATE`
BEFORE UPDATE ON `Patients` FOR EACH ROW
BEGIN
	IF(length(NEW.AMKA) !=11) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'AMKA must be 11 digits long';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `patients with cancer`
--

DROP TABLE IF EXISTS `patients with cancer`;
/*!50001 DROP VIEW IF EXISTS `patients with cancer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patients with cancer` (
  `Name` tinyint NOT NULL,
  `DeseaseHistory` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `restofthestaff`
--

DROP TABLE IF EXISTS `restofthestaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restofthestaff` (
  `Identity` varchar(8) NOT NULL,
  `Job_Description` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Sex` enum('M','F') NOT NULL,
  `Salary` float NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `HiredDate` date DEFAULT NULL,
  PRIMARY KEY (`Identity`),
  KEY `fk_RestOfTheStaff_Staff1_idx` (`Identity`),
  CONSTRAINT `fk_RestOfTheStaff_Staff1` FOREIGN KEY (`Identity`) REFERENCES `staff` (`Identity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restofthestaff`
--

LOCK TABLES `restofthestaff` WRITE;
/*!40000 ALTER TABLE `restofthestaff` DISABLE KEYS */;
INSERT INTO `restofthestaff` VALUES ('AH159750','Ambulance Driver','Afrodith Tsakiri','F',900,'6954782231','2011-02-23'),('AH456781','Secretary','Iwanna Politou','F',900,'6954585122','2010-01-01'),('AH789454','Bearer','Kwstas Papadopoulos','M',900,'6954812356','2010-10-02'),('AK123655','Cleaner','Maria Papadopoulou','F',800,'6945871234','2011-02-08'),('AK135599','Nurse','Giwrgos Maleas','M',1000,'6977075447','2012-03-04');
/*!40000 ALTER TABLE `restofthestaff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`RestOfTheStaff_BEFORE_INSERT` 
BEFORE INSERT ON `RestOfTheStaff` FOR EACH ROW
BEGIN
	IF(NEW.Salary <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
    IF(length(NEW.Identity) !=8) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Identity must be 8 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`RestOfTheStaff_BEFORE_UPDATE`
BEFORE UPDATE ON `RestOfTheStaff` FOR EACH ROW
BEGIN
	IF(NEW.Salary <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
    IF(length(NEW.Identity) !=8) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Identity must be 8 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `serves`
--

DROP TABLE IF EXISTS `serves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serves` (
  `AMKA` varchar(11) NOT NULL,
  `Identity` varchar(8) NOT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  PRIMARY KEY (`AMKA`,`Identity`),
  KEY `Identity#_idx` (`Identity`),
  CONSTRAINT `Patientss_AMKA` FOREIGN KEY (`AMKA`) REFERENCES `patients` (`AMKA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `1Identity#` FOREIGN KEY (`Identity`) REFERENCES `staff` (`Identity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serves`
--

LOCK TABLES `serves` WRITE;
/*!40000 ALTER TABLE `serves` DISABLE KEYS */;
INSERT INTO `serves` VALUES ('12019101234','AH456782','2019-10-19','2019-10-23'),('12028415648','AH789454','2019-10-21','2019-10-23'),('13035879845','AK135599','2019-10-24','2019-10-25'),('25016575896','AH456781','2019-10-17','2019-10-06'),('28026456987','AK135590','2019-10-29','2019-11-03');
/*!40000 ALTER TABLE `serves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Identity` varchar(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Sex` enum('M','F') NOT NULL,
  `Salary` float NOT NULL,
  `HiredDate` date NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('AH159750','Afrodith Tsakiri','F',900,'2011-02-03','6954782231'),('AH159753','Afrodith Koutsiou','F',1000,'2011-02-08','6954782236'),('AH456781','Iwanna Politou','F',900,'2010-01-01','6954585122'),('AH456782','Iwanna Ganith','F',1800,'2010-12-11','6954585123'),('AH789454','Kwstas Papadopoulos','M',900,'2010-10-02','6954812356'),('AH789456','Giwrgos Papadopoulos','M',2000,'2019-09-01','6954812358'),('AK123654','Kwstas Mourouzidis','M',2000,'2011-02-08','6945871236'),('AK123655','Maria Papadopoulou','M',800,'2011-02-08','6945871234'),('AK135590','Ioannis Katos','M',2500,'2012-02-02','6977075449'),('AK135599','Giwrgos Maleas','M',1000,'2012-03-04','6977075447');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Staff_BEFORE_INSERT` 
BEFORE INSERT ON `Staff` FOR EACH ROW
BEGIN
	IF(NEW.Salary <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
    IF(length(NEW.Identity) !=8) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Identity must be 8 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`Staff_BEFORE_UPDATE`
BEFORE UPDATE ON `Staff` FOR EACH ROW
BEGIN
	IF(NEW.Salary <=0 ) THEN
	signal sqlstate '45000' set message_text = 'invalid data';
    END IF;
    IF(length(NEW.Phone) !=10) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Phone must be 10 digits long';
    END IF;
	IF(length(NEW.Identity) !=8) THEN
    SIGNAL SQLSTATE '45000' set message_text = 'Identity must be 8 digits long';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `surgery staff`
--

DROP TABLE IF EXISTS `surgery staff`;
/*!50001 DROP VIEW IF EXISTS `surgery staff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `surgery staff` (
  `Name` tinyint NOT NULL,
  `Identity` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `treatmentplan`
--

DROP TABLE IF EXISTS `treatmentplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatmentplan` (
  `TreatmentID` int(11) NOT NULL AUTO_INCREMENT,
  `AMKA` varchar(11) NOT NULL,
  `Prescription` varchar(50) DEFAULT NULL,
  `Illness` varchar(50) DEFAULT NULL,
  `StartingDate` date DEFAULT NULL,
  `ExpectedCompletionDate` date DEFAULT NULL,
  PRIMARY KEY (`TreatmentID`,`AMKA`),
  KEY `AMKA_idx` (`AMKA`),
  CONSTRAINT `AMKA1` FOREIGN KEY (`AMKA`) REFERENCES `patients` (`AMKA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmentplan`
--

LOCK TABLES `treatmentplan` WRITE;
/*!40000 ALTER TABLE `treatmentplan` DISABLE KEYS */;
INSERT INTO `treatmentplan` VALUES (1,'12019101234','Autrivin','Flu','2019-11-07','2019-11-21'),(2,'12028415648','Fucidin','Cancer','2019-04-12','2019-04-15'),(3,'13035879845','t4, 100mg','Thyroid','2018-08-20','2018-08-30'),(4,'28026456987','Zanax','Cancer','2017-11-25','2017-11-29'),(5,'25016575896','Primperan, 10 mg','Panic attacks','2018-04-05','2018-04-25');
/*!40000 ALTER TABLE `treatmentplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`TreatmentPlan_BEFORE_INSERT`
BEFORE INSERT ON `TreatmentPlan` FOR EACH ROW
BEGIN
	IF (new.StartingDate > new.ExpectedCompletionDate) THEN
    signal sqlstate '45000' set message_text = 'Date of Hospitalization cannot be later than Date of Discharge';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_team58`.`TreatmentPlan_BEFORE_UPDATE` BEFORE UPDATE ON `TreatmentPlan` FOR EACH ROW
BEGIN
	IF (new.StartingDate > new.ExpectedCompletionDate) THEN
    signal sqlstate '45000' set message_text = 'Date of Hospitalization cannot be later than Date of Discharge';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works` (
  `SectorName` varchar(20) NOT NULL,
  `Identity` varchar(8) NOT NULL,
  `FromHour` varchar(5) DEFAULT NULL,
  `ToHour` varchar(5) DEFAULT NULL,
  `WorkingDays` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') DEFAULT NULL,
  PRIMARY KEY (`SectorName`,`Identity`),
  KEY `Identity#_idx` (`Identity`),
  CONSTRAINT `Staffs_Identity#` FOREIGN KEY (`Identity`) REFERENCES `staff` (`Identity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SectorName1` FOREIGN KEY (`SectorName`) REFERENCES `hospitalsectors` (`SectorName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES ('Cardiological','AH159753','08:00','16:00','Tue'),('Neurological','AH789454','16:00','00:00','Mon'),('Pediatric','AH789456','08:00','16:00','Wed'),('Psychiatric','AH456782','00:00','08:00','Fri'),('Surgery','AK123654','08:00','16:00','Mon');
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `patients with cancer`
--

/*!50001 DROP TABLE IF EXISTS `patients with cancer`*/;
/*!50001 DROP VIEW IF EXISTS `patients with cancer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patients with cancer` AS select `patients`.`Name` AS `Name`,`patients`.`DeseaseHistory` AS `DeseaseHistory` from (`patients` join `treatmentplan` on((`patients`.`AMKA` = `treatmentplan`.`AMKA`))) where (`treatmentplan`.`Illness` = 'Cancer') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `surgery staff`
--

/*!50001 DROP TABLE IF EXISTS `surgery staff`*/;
/*!50001 DROP VIEW IF EXISTS `surgery staff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `surgery staff` AS select `staff`.`Name` AS `Name`,`staff`.`Identity` AS `Identity` from (`staff` join `works` on((`staff`.`Identity` = `works`.`Identity`))) where (`works`.`SectorName` = 'Surgery') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-15 17:54:16
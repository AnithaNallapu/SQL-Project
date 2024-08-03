CREATE DATABASE  IF NOT EXISTS `MBAStudents` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `MBAStudents`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: MBAStudents
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `Address_ID` int NOT NULL,
  `Student_ID` int NOT NULL,
  `Address` varchar(500) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Postcode` varchar(50) NOT NULL,
  PRIMARY KEY (`Address_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Students` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,109804,'33 Frenchwood','Preston','PR1 6LE'),(2,109750,'27 Citycentre','Manchester','M1 1AD'),(3,109888,'85 Newhalllane','Preston','PR1 5AB'),(4,109204,'66 Moorpark','Preston','PR1 3MM'),(5,109150,'203 Avenhamstreet','Preston','PR1 3AE'),(6,109657,'229 Blackrod','Bolton','BL5 8FT'),(7,109366,'190 StockportRD','Manchester','M19 3JN'),(8,109226,'802 OxfordRD','Manchester','M13 8HJ');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignments`
--

DROP TABLE IF EXISTS `Assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignments` (
  `Assignment_ID` int NOT NULL,
  `Assignment_Name` varchar(50) DEFAULT NULL,
  `Module_ID` int DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Assignment_ID`),
  KEY `Module_ID` (`Module_ID`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`Module_ID`) REFERENCES `Modules` (`Module_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignments`
--

LOCK TABLES `Assignments` WRITE;
/*!40000 ALTER TABLE `Assignments` DISABLE KEYS */;
INSERT INTO `Assignments` VALUES (1,'PD CW',400804,'2000W Assignment'),(2,'RS CW',400352,'Presentation'),(3,'ET CW',400609,'3000WGroup Report'),(4,'FM CW',100210,'Exam'),(5,'PM CW',200298,'2000W Assignment'),(6,'MC CW',400201,'5000W Group Report'),(7,'WBL Project',300158,'12000W Project'),(8,'PT Project',400123,'12000W Project');
/*!40000 ALTER TABLE `Assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enrolment`
--

DROP TABLE IF EXISTS `Enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enrolment` (
  `Enrolment_ID` int NOT NULL,
  `Student_ID` int DEFAULT NULL,
  `Program` varchar(500) DEFAULT NULL,
  `Enrolment1_Date` date DEFAULT NULL,
  `Enrolment2_Date` date DEFAULT NULL,
  PRIMARY KEY (`Enrolment_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `enrolment_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `Students` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrolment`
--

LOCK TABLES `Enrolment` WRITE;
/*!40000 ALTER TABLE `Enrolment` DISABLE KEYS */;
INSERT INTO `Enrolment` VALUES (1092,109888,'MBA with Placement','2022-02-01','2023-03-12'),(1125,109366,'MBA with Work-based Learning','2022-02-13','2023-03-17'),(1273,109750,'MBA with Work-based Learning','2022-01-23','0023-03-02'),(1289,109150,'MBA with Placement','2022-01-24','2023-03-16'),(1298,109804,'MBA with Work-based Learning','2022-01-19','2023-03-22'),(1345,109657,'MBA with Placement','2022-01-22','2023-04-16'),(1362,109226,'MBA with Placement','2022-01-28','2023-03-09'),(1982,109204,'MBA with Placement','2022-02-15','2023-04-01');
/*!40000 ALTER TABLE `Enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grades`
--

DROP TABLE IF EXISTS `Grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grades` (
  `Grade_ID` int NOT NULL,
  `Assignment_ID` int DEFAULT NULL,
  `Student_ID` int DEFAULT NULL,
  `Grade` int DEFAULT NULL,
  `Pass_or_Fail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Grade_ID`),
  KEY `Assignment_ID` (`Assignment_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`Assignment_ID`) REFERENCES `Assignments` (`Assignment_ID`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `Students` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grades`
--

LOCK TABLES `Grades` WRITE;
/*!40000 ALTER TABLE `Grades` DISABLE KEYS */;
INSERT INTO `Grades` VALUES (1,1,109804,77,'pass'),(2,1,109750,67,'pass'),(3,1,109888,54,'pass'),(4,1,109204,55,'pass'),(5,1,109150,58,'pass'),(6,1,109657,65,'pass'),(7,1,109366,60,'pass'),(8,1,109226,51,'pass'),(9,2,109804,63,'pass'),(10,2,109750,58,'pass'),(11,2,109888,66,'pass'),(12,2,109204,55,'pass'),(13,2,109150,55,'pass'),(14,2,109657,57,'pass'),(15,2,109366,56,'pass'),(16,2,109226,62,'pass'),(17,3,109804,69,'pass'),(18,3,109750,61,'pass'),(19,3,109888,51,'pass'),(20,3,109204,53,'pass'),(21,3,109150,61,'pass'),(22,3,109657,66,'pass'),(23,3,109366,40,'fail'),(24,3,109226,51,'pass'),(25,4,109804,61,'pass'),(26,4,109750,55,'pass'),(27,4,109888,67,'pass'),(28,4,109204,52,'pass'),(29,4,109150,59,'pass'),(30,4,109657,62,'pass'),(31,4,109366,45,'fail'),(32,4,109226,51,'pass'),(33,5,109804,54,'pass'),(34,5,109750,59,'pass'),(35,5,109888,51,'pass'),(36,5,109204,59,'pass'),(37,5,109150,52,'pass'),(38,5,109657,63,'pass'),(39,5,109366,54,'pass'),(40,5,109226,66,'pass'),(41,6,109804,68,'pass'),(42,6,109750,59,'pass'),(43,6,109888,65,'pass'),(44,6,109204,54,'pass'),(45,6,109150,71,'pass'),(46,6,109657,65,'pass'),(47,6,109366,58,'pass'),(48,6,109226,52,'pass'),(49,7,109804,64,'pass'),(50,7,109750,62,'pass'),(51,7,109366,58,'pass'),(52,8,109888,60,'pass'),(53,8,109204,50,'pass'),(54,8,109150,43,'fail'),(55,8,109657,57,'pass'),(56,8,109226,44,'fail');
/*!40000 ALTER TABLE `Grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modules`
--

DROP TABLE IF EXISTS `Modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Modules` (
  `Module_ID` int NOT NULL,
  `Module_Name` varchar(50) DEFAULT NULL,
  `Semester` int DEFAULT NULL,
  `Credits` int DEFAULT NULL,
  `Professor_ID` int DEFAULT NULL,
  PRIMARY KEY (`Module_ID`),
  KEY `Professor_ID` (`Professor_ID`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`Professor_ID`) REFERENCES `Professors` (`Professor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modules`
--

LOCK TABLES `Modules` WRITE;
/*!40000 ALTER TABLE `Modules` DISABLE KEYS */;
INSERT INTO `Modules` VALUES (100210,'Finacial Management',2,20,1011),(200298,'Project Managemnt',3,20,1012),(300158,'Work-Based Learning',4,60,1013),(400123,'Placement',4,60,1014),(400201,'Management Consultancy',3,40,1011),(400352,'Research Skills',1,20,1013),(400609,'Entrepreneurship Theory',2,20,1012),(400804,'Professional Development',1,20,1011);
/*!40000 ALTER TABLE `Modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professors`
--

DROP TABLE IF EXISTS `Professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Professors` (
  `Professor_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Professor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professors`
--

LOCK TABLES `Professors` WRITE;
/*!40000 ALTER TABLE `Professors` DISABLE KEYS */;
INSERT INTO `Professors` VALUES (1011,'Shelly','Bavin','ShellyB@uclan.ac.uk'),(1012,'Ruth','Stav','RuthS@uclan.ac.uk'),(1013,'Khurram','Conway','KhurramT@Uclan.ac.uk'),(1014,'Tony','Tan','TonyT@uclan.ac.uk');
/*!40000 ALTER TABLE `Professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prossorshelpforretake`
--

DROP TABLE IF EXISTS `prossorshelpforretake`;
/*!50001 DROP VIEW IF EXISTS `prossorshelpforretake`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prossorshelpforretake` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Module_Name`,
 1 AS `grade`,
 1 AS `pass_or_fail`,
 1 AS `professor_ID`,
 1 AS `Professor_Name`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Retake`
--

DROP TABLE IF EXISTS `Retake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Retake` (
  `Retake_ID` int NOT NULL,
  `Enrolment_ID` int DEFAULT NULL,
  `Retake_Module_ID` int DEFAULT NULL,
  `Grade_ID` int DEFAULT NULL,
  `Retake_StartDate` date DEFAULT NULL,
  PRIMARY KEY (`Retake_ID`),
  KEY `Retake_Module_ID` (`Retake_Module_ID`),
  KEY `Enrolment_ID` (`Enrolment_ID`),
  KEY `Grade_ID` (`Grade_ID`),
  CONSTRAINT `retake_ibfk_1` FOREIGN KEY (`Retake_Module_ID`) REFERENCES `Modules` (`Module_ID`),
  CONSTRAINT `retake_ibfk_2` FOREIGN KEY (`Enrolment_ID`) REFERENCES `Enrolment` (`Enrolment_ID`),
  CONSTRAINT `retake_ibfk_3` FOREIGN KEY (`Grade_ID`) REFERENCES `Grades` (`Grade_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Retake`
--

LOCK TABLES `Retake` WRITE;
/*!40000 ALTER TABLE `Retake` DISABLE KEYS */;
INSERT INTO `Retake` VALUES (1,1125,400609,23,'2024-03-11'),(2,1125,100210,31,'2024-03-13'),(3,1289,400123,54,'2024-03-15'),(4,1362,400123,56,'2024-03-15');
/*!40000 ALTER TABLE `Retake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `Student_ID` int NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email_Id` varchar(50) NOT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (109150,'Indira','Mani','IndiraM@uclan.ac.uk'),(109204,'Manipal','Thota','ManipalT@uclan.ac.uk'),(109226,'Ramcharan','Konidela','RamcharanK@uclan.ac.uk'),(109366,'Vignesh','Kumar','VigneshK@uclan.ac.uk'),(109657,'Daksha','Adapala','DakshaA@uclan.ac.uk'),(109750,'Pravalika','Nimmarajula','PravalikaN@uclan.ac.uk'),(109804,'Anitha','Nallapu','AnithaN@uclan.ac.uk'),(109888,'Shiva','Thamisetty','ShivaT@uclan.ac.uk');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `Students_BEFORE_INSERT` BEFORE INSERT ON `students` FOR EACH ROW BEGIN
set New.First_Name= upper(New.First_Name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `Students_AFTER_INSERT` AFTER INSERT ON `students` FOR EACH ROW BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_retake_students`
--

DROP TABLE IF EXISTS `v_retake_students`;
/*!50001 DROP VIEW IF EXISTS `v_retake_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_retake_students` AS SELECT 
 1 AS `First_Name`,
 1 AS `Last_Name`,
 1 AS `Module_Name`,
 1 AS `grade`,
 1 AS `pass_or_fail`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'MBAStudents'
--

--
-- Dumping routines for database 'MBAStudents'
--
/*!50003 DROP FUNCTION IF EXISTS `AverageGrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `AverageGrade`(item1 int, Item2 int) RETURNS int
    DETERMINISTIC
BEGIN
declare AverageGrade int;
if item2 > 0 then
set AverageGrade = item1/item2;
else 
 set 
 AverageGrade = 0;
 end if;
 
RETURN AverageGrade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Student Full Ddetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `Student Full Ddetails`(in Student_ID int)
BEGIN
Select s.First_Name, s.Last_Name,s.student_ID, e.Enrolment_ID, e.Program,
concat(ad.address,ad.city,ad.postcode) as 'Full_Address',
AverageGrade(Sum(g.Grade), count( distinct g.Assignment_ID)) As 'Overal Grade'
From Students as s
inner join Enrolment as e on e.Student_id = S.student_ID
inner join address as ad on ad.Student_ID = s.student_ID
inner join grades as g on g.student_ID = s.student_ID
inner join assignments as a on a.Assignment_ID = g.Assignment_ID
inner join modules as m on m.module_ID = a.module_ID
group by g.Student_ID, e.enrolment_ID, ad.Address_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentFullDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `StudentFullDetails`(IN item int)
BEGIN
Select s.*, e.Enrolment_ID, e.Program, e.Enrolment1_Date,e.Enrolment2_Date,
concat(ad.address,' ',ad.city,' ' ,ad.postcode) as 'Full_Address',
count(m.module_ID) as NumberofModules ,
AverageGrade(Sum(g.Grade), count( distinct g.Assignment_ID)) As 'Overal Grade'
From Students as s
inner join Enrolment as e on e.Student_id = S.student_ID
inner join address as ad on ad.Student_ID = s.student_ID
inner join grades as g on g.student_ID = s.student_ID
inner join assignments as a on a.Assignment_ID = g.Assignment_ID
inner join modules as m on m.module_ID = a.module_ID
where s.student_ID = item
group by g.Student_ID, e.enrolment_ID, ad.Address_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `prossorshelpforretake`
--

/*!50001 DROP VIEW IF EXISTS `prossorshelpforretake`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prossorshelpforretake` AS select `v`.`First_Name` AS `First_Name`,`v`.`Last_Name` AS `Last_Name`,`v`.`Module_Name` AS `Module_Name`,`v`.`grade` AS `grade`,`v`.`pass_or_fail` AS `pass_or_fail`,`p`.`Professor_ID` AS `professor_ID`,concat(`p`.`First_Name`,' ',`p`.`Last_Name`) AS `Professor_Name`,`p`.`Email` AS `Email` from ((`v_retake_students` `v` join `modules` `m` on((`m`.`Module_Name` = `v`.`Module_Name`))) join `professors` `p` on((`p`.`Professor_ID` = `m`.`Professor_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_retake_students`
--

/*!50001 DROP VIEW IF EXISTS `v_retake_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_retake_students` AS select `s`.`First_Name` AS `First_Name`,`s`.`Last_Name` AS `Last_Name`,`m`.`Module_Name` AS `Module_Name`,`g`.`Grade` AS `grade`,`g`.`Pass_or_Fail` AS `pass_or_fail` from ((((`retake` `r` join `enrolment` `e` on((`e`.`Enrolment_ID` = `r`.`Enrolment_ID`))) join `students` `s` on((`s`.`Student_ID` = `e`.`Student_ID`))) join `modules` `m` on((`m`.`Module_ID` = `r`.`Retake_Module_ID`))) join `grades` `g` on((`g`.`Grade_ID` = `r`.`Grade_ID`))) */;
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

-- Dump completed on 2023-12-11  2:23:54

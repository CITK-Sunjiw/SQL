-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: University
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Advisor`
--

DROP TABLE IF EXISTS `Advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Advisor` (
  `I_id` varchar(10) DEFAULT NULL,
  `S_id` varchar(10) DEFAULT NULL,
  KEY `I_id` (`I_id`),
  KEY `S_id` (`S_id`),
  CONSTRAINT `Advisor_ibfk_1` FOREIGN KEY (`I_id`) REFERENCES `Instructor` (`I_id`),
  CONSTRAINT `Advisor_ibfk_2` FOREIGN KEY (`S_id`) REFERENCES `Student` (`S_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advisor`
--

LOCK TABLES `Advisor` WRITE;
/*!40000 ALTER TABLE `Advisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class_Room`
--

DROP TABLE IF EXISTS `Class_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class_Room` (
  `building` varchar(10) DEFAULT NULL,
  `room_no` int NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class_Room`
--

LOCK TABLES `Class_Room` WRITE;
/*!40000 ALTER TABLE `Class_Room` DISABLE KEYS */;
INSERT INTO `Class_Room` VALUES ('C2',105,90),('A1',109,100),('B5',302,70);
/*!40000 ALTER TABLE `Class_Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `course_id` varchar(10) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `credit` int DEFAULT NULL,
  `dept_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('UCE107','Machine',8,'CE'),('UCSE101','C',3,'CSE'),('UCSE103','C++',3,'CSE');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `dept_name` varchar(10) NOT NULL,
  `building` varchar(10) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('CE','B3',500000),('CSE','A1',100000),('ECE','C1',90000);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructor` (
  `I_id` varchar(10) NOT NULL,
  `FN` varchar(10) DEFAULT NULL,
  `MN` varchar(10) DEFAULT NULL,
  `LN` varchar(10) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `dept_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`I_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `Instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES ('17235','Carl','Farok','Smith',90000,'CE'),('18920','Albert','Einstein','Doe',100000,'CSE'),('28914','Anish','Kumar','Roy',100000,'ECE');
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preq`
--

DROP TABLE IF EXISTS `Preq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Preq` (
  `preq_id` varchar(10) NOT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`preq_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `Preq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preq`
--

LOCK TABLES `Preq` WRITE;
/*!40000 ALTER TABLE `Preq` DISABLE KEYS */;
/*!40000 ALTER TABLE `Preq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Section` (
  `course_id` varchar(10) DEFAULT NULL,
  `sec_id` varchar(10) NOT NULL,
  `sem` varchar(10) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `time_slot_id` varchar(10) DEFAULT NULL,
  `building` varchar(10) DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  PRIMARY KEY (`sec_id`),
  KEY `course_id` (`course_id`),
  KEY `room_no` (`room_no`),
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `Section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`),
  CONSTRAINT `Section_ibfk_2` FOREIGN KEY (`room_no`) REFERENCES `Class_Room` (`room_no`),
  CONSTRAINT `Section_ibfk_3` FOREIGN KEY (`time_slot_id`) REFERENCES `Time_slot` (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES ('UCSE103','A','Autumn',2009,'A671','A2',302),('UCSE101','B','Autumn',2009,'A671','A1',109),('UCE107','C','Spring',2008,'C267','C2',105);
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `S_id` varchar(10) NOT NULL,
  `FN` varchar(10) DEFAULT NULL,
  `MN` varchar(10) DEFAULT NULL,
  `LN` varchar(10) DEFAULT NULL,
  `total_credit` int DEFAULT NULL,
  `dept_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`S_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `Department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('1011011','John','David','Smith',4,'CSE'),('1011012','Mary','Elizabeth','Smith',7,'CSE'),('1011029','Mohandas','Karamchand','Gandhi',8,'CSE'),('1012013','William','Henry','Jones',9,'CE');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Takes`
--

DROP TABLE IF EXISTS `Takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Takes` (
  `S_id` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  `sec_id` varchar(10) DEFAULT NULL,
  `sem` varchar(10) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  KEY `S_id` (`S_id`),
  KEY `course_id` (`course_id`),
  KEY `sec_id` (`sec_id`),
  CONSTRAINT `Takes_ibfk_1` FOREIGN KEY (`S_id`) REFERENCES `Student` (`S_id`),
  CONSTRAINT `Takes_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`),
  CONSTRAINT `Takes_ibfk_3` FOREIGN KEY (`sec_id`) REFERENCES `Section` (`sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Takes`
--

LOCK TABLES `Takes` WRITE;
/*!40000 ALTER TABLE `Takes` DISABLE KEYS */;
INSERT INTO `Takes` VALUES ('1011011','UCSE101','B','Autumn',2009,'A'),('1011012','UCSE101','B','Autumn',2009,'A'),('1011029','UCSE103','A','Autumn',2009,'B');
/*!40000 ALTER TABLE `Takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaches`
--

DROP TABLE IF EXISTS `Teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teaches` (
  `I_id` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  `sec_id` varchar(10) DEFAULT NULL,
  `sem` varchar(10) DEFAULT NULL,
  `year` int DEFAULT NULL,
  KEY `I_id` (`I_id`),
  KEY `course_id` (`course_id`),
  KEY `sec_id` (`sec_id`),
  CONSTRAINT `Teaches_ibfk_1` FOREIGN KEY (`I_id`) REFERENCES `Instructor` (`I_id`),
  CONSTRAINT `Teaches_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`),
  CONSTRAINT `Teaches_ibfk_3` FOREIGN KEY (`sec_id`) REFERENCES `Section` (`sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaches`
--

LOCK TABLES `Teaches` WRITE;
/*!40000 ALTER TABLE `Teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Time_slot`
--

DROP TABLE IF EXISTS `Time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Time_slot` (
  `time_slot_id` varchar(10) NOT NULL,
  PRIMARY KEY (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Time_slot`
--

LOCK TABLES `Time_slot` WRITE;
/*!40000 ALTER TABLE `Time_slot` DISABLE KEYS */;
INSERT INTO `Time_slot` VALUES ('A671'),('C267');
/*!40000 ALTER TABLE `Time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Time_slot_P`
--

DROP TABLE IF EXISTS `Time_slot_P`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Time_slot_P` (
  `time_slot_id` varchar(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `slot_time` int DEFAULT NULL,
  `end_time` int DEFAULT NULL,
  KEY `time_slot_id` (`time_slot_id`),
  CONSTRAINT `Time_slot_P_ibfk_1` FOREIGN KEY (`time_slot_id`) REFERENCES `Time_slot` (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Time_slot_P`
--

LOCK TABLES `Time_slot_P` WRITE;
/*!40000 ALTER TABLE `Time_slot_P` DISABLE KEYS */;
/*!40000 ALTER TABLE `Time_slot_P` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-08 22:56:34

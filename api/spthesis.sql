-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: spthesis
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `adviser`
--

DROP TABLE IF EXISTS `adviser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adviser` (
  `employee_number` varchar(10) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `college` varchar(5) NOT NULL,
  `department` varchar(7) NOT NULL,
  PRIMARY KEY (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adviser`
--

LOCK TABLES `adviser` WRITE;
/*!40000 ALTER TABLE `adviser` DISABLE KEYS */;
INSERT INTO `adviser` VALUES ('12345-1001','Albacea','John Patrick','VJ','CAS','ICS'),('12345-1002','Bawagan','Juan Miguel III','J','CAS','ICS'),('12345-1003','Clarino','Maria Art Antonette','D','CAS','ICS'),('12345-1004','Hermocilla','Joseph Anthony','C','CAS','ICS'),('12345-1005','Khan','Concepcion','L','CAS','ICS'),('12345-1006','Drio','Donnalyn','F','CAS','ICS'),('12345-1007','Poserio','Clinton','M','CAS','ICS'),('12345-1008','Eusebio','Rosemarie','A','CAS','ICS'),('12345-1009','Naag','Alice','B','CAS','ICS'),('12345-1010','Roxas','Jean Mark','C','CAS','ICS'),('12345-1011','de Guzman','Rowena','R','CAS','ICS'),('12345-1012','San Jose','Edna','J','CAS','ICS'),('12345-1013','Ayao','John Mark','G','CAS','ICS'),('12345-1014','Borja','Christopher John','T','CAS','ICS'),('12345-1015','Garcia','Joshua','N','CAS','ICS'),('12345-1016','Villanueva','Christian','Y','CAS','ICS'),('12345-1017','Garcia','Joshua','N','CAS','ICS'),('12345-1018','Garcia','Joshua','N','CAS','ICS'),('12345-1019','Fernandez','Francis Mark','O','CAS','ICS'),('12345-1020','Roxas','Jean Mark','C','CAS','ICS');
/*!40000 ALTER TABLE `adviser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adviser_mastery`
--

DROP TABLE IF EXISTS `adviser_mastery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adviser_mastery` (
  `employee_number` varchar(10) NOT NULL,
  `field_of_mastery` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_number`,`field_of_mastery`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adviser_mastery`
--

LOCK TABLES `adviser_mastery` WRITE;
/*!40000 ALTER TABLE `adviser_mastery` DISABLE KEYS */;
INSERT INTO `adviser_mastery` VALUES ('12345-1001','Digital Image Processing'),('12345-1001','Information Technology'),('12345-1002','Bioinformatics'),('12345-1002','Information Technology'),('12345-1003','Information Technology'),('12345-1003','Numerical Computation'),('12345-1003','Programming Languages'),('12345-1004','Cloud and Distributed Computing'),('12345-1004','Programming Languages'),('12345-1005','Advanced Databases'),('12345-1005','Artificial Intelligence'),('12345-1005','Web Designing'),('12345-1006','Programming Languages'),('12345-1006','Web Designing'),('12345-1007','Artificial Intelligence'),('12345-1007','Robotics'),('12345-1008','Digital Image Processing'),('12345-1008','Software Development'),('12345-1009','Advanced Databases'),('12345-1009','Information Technology'),('12345-1010','Advanced Databses'),('12345-1010','Web Designing'),('12345-1011','Artificial Intelligence'),('12345-1011','Robotics'),('12345-1012','Cloud and Distributed Computing'),('12345-1012','Web Designing'),('12345-1013','Information Technology'),('12345-1014','Artificial Intelligence'),('12345-1015','Digital Image Processing'),('12345-1015','Web Designing'),('12345-1016','Information Technology'),('12345-1016','Programming Languages'),('12345-1017','Robotics'),('12345-1018','Artificial Intelligence'),('12345-1018','Cloud and Distributed Computing'),('12345-1019','Advanced Databases'),('12345-1019','Web Designing'),('12345-1020','Artificial Intelligence'),('12345-1020','Digital Image Processing'),('12345-1020','Web Designing');
/*!40000 ALTER TABLE `adviser_mastery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_authored_by_adviser`
--

DROP TABLE IF EXISTS `co_authored_by_adviser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_authored_by_adviser` (
  `call_number` varchar(20) NOT NULL,
  `employee_number` varchar(20) NOT NULL,
  PRIMARY KEY (`call_number`,`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_authored_by_adviser`
--

LOCK TABLES `co_authored_by_adviser` WRITE;
/*!40000 ALTER TABLE `co_authored_by_adviser` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_authored_by_adviser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_authored_by_student`
--

DROP TABLE IF EXISTS `co_authored_by_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `co_authored_by_student` (
  `call_number` varchar(20) NOT NULL,
  `student_number` varchar(10) NOT NULL,
  PRIMARY KEY (`call_number`,`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_authored_by_student`
--

LOCK TABLES `co_authored_by_student` WRITE;
/*!40000 ALTER TABLE `co_authored_by_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `co_authored_by_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `call_number` varchar(20) NOT NULL,
  `title` varchar(80) NOT NULL,
  `topic` varchar(80) NOT NULL,
  `classification` varchar(20) NOT NULL,
  `date_published` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `grade` float NOT NULL,
  `student_number` varchar(10) NOT NULL,
  PRIMARY KEY (`call_number`),
  KEY `paper_student_number_fk` (`student_number`),
  CONSTRAINT `paper_student_number_fk` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES ('ABCDE-10001','Towards Input Device Satisfaction Through Hand Anthropometry','The ideal design for the comfort of using devices with the human hands.','SP','2017-08-26',1,1.25,'2015-34567'),('ABCDE-10002','Cool SP Title','Cool Topic','SP','2017-08-29',1,1,'2015-89012'),('ABCDE-10003','Awesome SP Title','Awesome Topic','SP','2017-09-02',1,1.25,'2015-12345'),('ABCDE-10004','Boring SP Title','Boring Topic','SP','2016-09-05',1,1.5,'2015-56789'),('ABCDE-10005','Another SP Title','Another Topic','SP','2017-09-08',1,1.75,'2015-45678'),('ABCDE-10006','Old SP Title','Old Topic','SP','2017-09-11',0,2,'2015-23456'),('ABCDE-10007','Winning SP Title','Winning Topic','SP','2017-09-14',1,1.75,'2015-78901'),('ABCDE-10008','Great SP Title','Great Topic','SP','2016-09-17',1,1.5,'2015-67890'),('ABCDE-10009','Accepted SP Titled','Accepted Topic','SP','2017-09-20',1,1.25,'2015-01234'),('ABCDE-10010','Rejected SP Title','Rejected Topic','SP','2017-09-23',1,1.5,'2015-90123'),('ABCDE-10012','This is thesis 2','Topic 2','Thesis','2017-09-29',0,2,'2015-54321'),('ABCDE-10013','This is thesis 3','Topic 3','Thesis','2017-10-01',0,2.25,'2015-87654'),('ABCDE-10014','This is thesis 4','Topic 4','Thesis','2016-10-04',0,2,'2015-76543'),('ABCDE-10015','This is thesis 5','Topic 5','Thesis','2017-10-07',1,1.75,'2015-09876'),('ABCDE-10016','This is thesis 6','Topic 6','Thesis','2017-10-10',1,1.5,'2015-98765'),('ABCDE-10017','This is thesis 7','Topic 7','Thesis','2017-10-13',1,1.75,'2015-32109'),('ABCDE-10018','This is thesis 8','Topic 8','Thesis','2016-10-16',0,2,'2015-21098'),('ABCDE-10019','This is thesis 9','Topic 9','Thesis','2017-10-19',0,2.25,'2015-43210'),('ABCDE-10020','This is thesis 10','Topic 10','Thesis','2017-10-22',0,2.5,'2015-10987');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_award`
--

DROP TABLE IF EXISTS `paper_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_award` (
  `call_number` varchar(20) NOT NULL,
  `award` varchar(255) NOT NULL,
  PRIMARY KEY (`call_number`,`award`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_award`
--

LOCK TABLES `paper_award` WRITE;
/*!40000 ALTER TABLE `paper_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_interest`
--

DROP TABLE IF EXISTS `paper_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_interest` (
  `call_number` varchar(20) NOT NULL,
  `field_of_interest` varchar(255) NOT NULL,
  PRIMARY KEY (`call_number`,`field_of_interest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_interest`
--

LOCK TABLES `paper_interest` WRITE;
/*!40000 ALTER TABLE `paper_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_panel`
--

DROP TABLE IF EXISTS `paper_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_panel` (
  `call_number` varchar(20) NOT NULL,
  `employee_number` varchar(10) NOT NULL,
  `presentation_date` date NOT NULL,
  `presentation_place` varchar(255) NOT NULL,
  PRIMARY KEY (`call_number`,`employee_number`),
  KEY `paper_employee_number_fk` (`employee_number`),
  CONSTRAINT `paper_employee_number_fk` FOREIGN KEY (`employee_number`) REFERENCES `adviser` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_panel`
--

LOCK TABLES `paper_panel` WRITE;
/*!40000 ALTER TABLE `paper_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper_standing`
--

DROP TABLE IF EXISTS `paper_standing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_standing` (
  `grade` float NOT NULL,
  `standing` int(3) NOT NULL,
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper_standing`
--

LOCK TABLES `paper_standing` WRITE;
/*!40000 ALTER TABLE `paper_standing` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper_standing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_number` varchar(10) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `course` varchar(6) NOT NULL,
  `employee_number` varchar(20) NOT NULL,
  PRIMARY KEY (`student_number`),
  KEY `student_employee_number_fk` (`employee_number`),
  CONSTRAINT `student_employee_number_fk` FOREIGN KEY (`employee_number`) REFERENCES `adviser` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2015-01234','Argote','Benedict Ian','N','BSCS','12345-1009'),('2015-09876','Rustia','Eugene Mark','D','BSCS','12345-1015'),('2015-10987','Vibar','Joy','G','BSCS','12345-1020'),('2015-12345','Gaza','John Cedric','C','BSCS','12345-1003'),('2015-21098','Arce','Mary Anne','E','BSCS','12345-1018'),('2015-23456','Cortez','Clarisse Sydney','B','BSCS','12345-1006'),('2015-32109','Zapanta','Juan','K','BSCS','12345-1017'),('2015-34567','Mirandilla','Meagan','A','BSCS','12345-1001'),('2015-43210','Golpe','Arnel','I','BSCS','12345-1019'),('2015-45678','Custodio','Alexander','B','BSCS','12345-1005'),('2015-54321','Tapan','Tim','Q','BSCS','12345-1012'),('2015-56789','Jueves','Kim Jushua','N','BSCS','12345-1004'),('2015-65432','Mercado','Mark Joseph','V','BSCS','12345-1011'),('2015-67890','Aytona','Aaron Carl','I','BSCS','12345-1008'),('2015-76543','Rustia','Eugene Mar','O','BSCS','12345-1014'),('2015-78901','Carillo','Sean Joshua','N','BSCS','12345-1007'),('2015-87654','Mallapre','Anne','U','BSCS','12345-1013'),('2015-89012','Dayo','Kimberly','M','BSCS','12345-1002'),('2015-90123','Vibar','Vanessa Mae','W','BSCS','12345-1010'),('2015-98765','Matias','Mel Gabriel','A','BSCS','12345-1016');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_interest`
--

DROP TABLE IF EXISTS `student_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_interest` (
  `student_number` varchar(10) NOT NULL,
  `field_of_interest` varchar(255) NOT NULL,
  PRIMARY KEY (`student_number`,`field_of_interest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_interest`
--

LOCK TABLES `student_interest` WRITE;
/*!40000 ALTER TABLE `student_interest` DISABLE KEYS */;
INSERT INTO `student_interest` VALUES ('2015-01234','Programming Languages'),('2015-01234','Web Designing'),('2015-09876','Advanced Databases;'),('2015-09876','Software Development'),('2015-10987','Advanced Databases'),('2015-10987','Information Technology'),('2015-10987','Programming Languages'),('2015-12345','Information Technology'),('2015-12345','Numerical Computation'),('2015-12345','Programming Languages'),('2015-21098','Cloud and Distributed Computing'),('2015-21098','Web Designing'),('2015-23456','Programming Languages'),('2015-23456','Web Designing'),('2015-32109','Software Development'),('2015-34567','Digital Image Processing'),('2015-34567','Information Technology'),('2015-43210','Digital Image Processing'),('2015-43210','Software Development'),('2015-45678','Advanced Databases'),('2015-45678','Artificial Intelligence'),('2015-45678','Web Designing'),('2015-54321','Artificial Intelligence'),('2015-54321','Robotics'),('2015-56789','Cloud and Distributed Computing'),('2015-56789','Software Development'),('2015-65432','Digital Image Processing'),('2015-65432','Web Designing'),('2015-67890','Programming Language'),('2015-67890','Robotics'),('2015-76543','Web Designing'),('2015-78901','Artificial Intelligence'),('2015-78901','Robotics'),('2015-87654','Advanced Databases'),('2015-89012','Bioinformatics'),('2015-89012','Information Technology'),('2015-90123','Cloud and Distributed Computing'),('2015-90123','Software Development'),('2015-98765','Cloud and Distributed Computing'),('2015-98765','Programming Languages');
/*!40000 ALTER TABLE `student_interest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-03 20:21:18

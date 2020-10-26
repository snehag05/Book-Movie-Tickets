-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: movietheater
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_details` (
  `TRANSACTION_ID` int(255) NOT NULL,
  `USER_ID` int(255) NOT NULL,
  `DATE` date DEFAULT NULL,
  `SLOT` varchar(255) NOT NULL,
  `MOVIE_ID` int(255) NOT NULL,
  `SCREEN_NO` int(255) NOT NULL,
  `SEAT_NO` varchar(255) NOT NULL,
  `TOTAL` int(255) NOT NULL,
  `inserted_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_details`
--

LOCK TABLES `booking_details` WRITE;
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
INSERT INTO `booking_details` VALUES (5775,1,'2020-05-16','9AM-12PM',5,5,'23, 24',10,'2020-05-03 19:09:57');
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_details`
--

DROP TABLE IF EXISTS `movie_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_details` (
  `MOVIE_ID` int(255) NOT NULL,
  `MOVIETITLE` varchar(255) NOT NULL,
  `DATE` date DEFAULT '2020-05-23',
  `SCREEN_NO` int(255) NOT NULL,
  `SLOT` varchar(255) NOT NULL,
  `PRICE` int(255) NOT NULL,
  `TRAILER` varchar(255) NOT NULL,
  `IMAGE` varchar(255) NOT NULL,
  `inserted_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_details`
--

LOCK TABLES `movie_details` WRITE;
/*!40000 ALTER TABLE `movie_details` DISABLE KEYS */;
INSERT INTO `movie_details` VALUES (4,'Aladdin','2020-05-10',2,'9AM-12PM',4,'https://www.youtube.com/embed/foyufD52aog','https://lh4.googleusercontent.com/pT5L3m7w1A6BEWsFpqQOsF-nbxXZknlZS0OR_tJvA0QUSYC7m3f3KsfyMwfkcLg=w1200-h630-p',NULL),(3,'Lion King','2020-05-12',3,'5PM-7PM',6,'https://www.youtube.com/embed/4CbLXeGSDxg','https://lh6.googleusercontent.com/8aqFOaN82NQ9u6LJahLJF6tTTMVKfilq9KWNA4r0AFRjqrWrQd8vEcVJTI83J4I=w1200-h630-p',NULL),(2,'High School Musical','2020-05-14',1,'12PM-2PM',4,'https://www.youtube.com/embed/zL4ZEWYsmuw','https://lh4.googleusercontent.com/15rOOvTANm33b-WtfgjlsBnPnJMv7r2xYvNDRFi0xPUvPfKb6LfOSq_R3_U975o=w1200-h630-p',NULL),(1,'American Son','2020-05-11',4,'9AM-12PM',5,'https://www.youtube.com/embed/dbKZlSwAS3M','https://lh6.googleusercontent.com/aZJMjLfkALVPK0np6KnJsyjrM88qbnhXldd3LCsAw5us3W1EFS3fMKqWxNTOpQ8=w1200-h630-p',NULL),(5,'Scoob!','2020-05-16',5,'8PM-10PM',3,'https://www.youtube.com/embed/GzlEnS7MmUo','https://lh3.googleusercontent.com/NLoIpIhCcizBOSS8fe70V1mKDQAyYjfSLmGcMdoPB3uDOMqeLsyxUocHQAbL_JM=w1200-h630-p',NULL);
/*!40000 ALTER TABLE `movie_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_details`
--

DROP TABLE IF EXISTS `screen_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_details` (
  `MOVIE_ID` int(255) NOT NULL,
  `SCREEN_NO` int(255) NOT NULL,
  `SEAT_NO` int(255) NOT NULL,
  `BOOKED` tinyint(1) NOT NULL,
  `DATE` date NOT NULL,
  `SLOT` varchar(255) NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_details`
--

LOCK TABLES `screen_details` WRITE;
/*!40000 ALTER TABLE `screen_details` DISABLE KEYS */;
INSERT INTO `screen_details` VALUES (2,1,1,0,'2020-05-23','12PM-2PM',NULL),(2,1,2,0,'2020-05-23','12PM-2PM',NULL),(2,1,3,0,'2020-05-23','12PM-2PM',NULL),(2,1,4,0,'2020-05-23','12PM-2PM',NULL),(2,1,5,0,'2020-05-23','12PM-2PM',NULL),(2,1,6,0,'2020-05-23','12PM-2PM',NULL),(2,1,7,0,'2020-05-23','12PM-2PM',NULL),(2,1,8,0,'2020-05-23','12PM-2PM',NULL),(2,1,9,0,'2020-05-23','12PM-2PM',NULL),(2,1,10,0,'2020-05-23','12PM-2PM',NULL),(2,1,11,0,'2020-05-23','12PM-2PM',NULL),(2,1,12,0,'2020-05-23','12PM-2PM',NULL),(2,1,13,0,'2020-05-23','12PM-2PM',NULL),(2,1,14,0,'2020-05-23','12PM-2PM',NULL),(2,1,15,0,'2020-05-23','12PM-2PM',NULL),(2,1,16,0,'2020-05-23','12PM-2PM',NULL),(2,1,17,0,'2020-05-23','12PM-2PM',NULL),(2,1,18,0,'2020-05-23','12PM-2PM',NULL),(2,1,19,0,'2020-05-23','12PM-2PM',NULL),(2,1,20,0,'2020-05-23','12PM-2PM',NULL),(2,1,21,0,'2020-05-23','12PM-2PM',NULL),(2,1,22,0,'2020-05-23','12PM-2PM',NULL),(2,1,23,0,'2020-05-23','12PM-2PM',NULL),(2,1,24,0,'2020-05-23','12PM-2PM',NULL),(2,1,25,0,'2020-05-23','12PM-2PM',NULL),(2,1,26,0,'2020-05-23','12PM-2PM',NULL),(2,1,27,0,'2020-05-23','12PM-2PM',NULL),(2,1,28,0,'2020-05-23','12PM-2PM',NULL),(2,1,29,0,'2020-05-23','12PM-2PM',NULL),(2,1,30,0,'2020-05-23','12PM-2PM',NULL),(4,2,1,0,'2020-05-23','9AM-12PM',NULL),(4,2,2,0,'2020-05-23','9AM-12PM',NULL),(4,2,3,0,'2020-05-23','9AM-12PM',NULL),(4,2,4,0,'2020-05-23','9AM-12PM',NULL),(4,2,5,0,'2020-05-23','9AM-12PM',NULL),(4,2,6,0,'2020-05-23','9AM-12PM',NULL),(4,2,7,0,'2020-05-23','9AM-12PM',NULL),(4,2,8,0,'2020-05-23','9AM-12PM',NULL),(4,2,9,0,'2020-05-23','9AM-12PM',NULL),(4,2,10,0,'2020-05-23','9AM-12PM',NULL),(4,2,11,0,'2020-05-23','9AM-12PM',NULL),(4,2,12,0,'2020-05-23','9AM-12PM',NULL),(4,2,13,0,'2020-05-23','9AM-12PM',NULL),(4,2,14,0,'2020-05-23','9AM-12PM',NULL),(4,2,15,0,'2020-05-23','9AM-12PM',NULL),(4,2,16,0,'2020-05-23','9AM-12PM',NULL),(4,2,17,0,'2020-05-23','9AM-12PM',NULL),(4,2,18,0,'2020-05-23','9AM-12PM',NULL),(4,2,19,0,'2020-05-23','9AM-12PM',NULL),(4,2,20,0,'2020-05-23','9AM-12PM',NULL),(4,2,21,0,'2020-05-23','9AM-12PM',NULL),(4,2,22,0,'2020-05-23','9AM-12PM',NULL),(4,2,23,0,'2020-05-23','9AM-12PM',NULL),(4,2,24,0,'2020-05-23','9AM-12PM',NULL),(4,2,25,0,'2020-05-23','9AM-12PM',NULL),(4,2,26,0,'2020-05-23','9AM-12PM',NULL),(4,2,27,0,'2020-05-23','9AM-12PM',NULL),(4,2,28,0,'2020-05-23','9AM-12PM',NULL),(4,2,29,0,'2020-05-23','9AM-12PM',NULL),(4,2,30,0,'2020-05-23','9AM-12PM',NULL),(3,3,1,0,'2020-05-23','5PM-7PM',NULL),(3,3,2,0,'2020-05-23','5PM-7PM',NULL),(3,3,3,0,'2020-05-23','5PM-7PM',NULL),(3,3,4,0,'2020-05-23','5PM-7PM',NULL),(3,3,5,0,'2020-05-23','5PM-7PM',NULL),(3,3,6,0,'2020-05-23','5PM-7PM',NULL),(3,3,7,0,'2020-05-23','5PM-7PM',NULL),(3,3,8,0,'2020-05-23','5PM-7PM',NULL),(3,3,9,0,'2020-05-23','5PM-7PM',NULL),(3,3,10,0,'2020-05-23','5PM-7PM',NULL),(3,3,11,0,'2020-05-23','5PM-7PM',NULL),(3,3,12,0,'2020-05-23','5PM-7PM',NULL),(3,3,13,0,'2020-05-23','5PM-7PM',NULL),(3,3,14,0,'2020-05-23','5PM-7PM',NULL),(3,3,15,0,'2020-05-23','5PM-7PM',NULL),(3,3,16,0,'2020-05-23','5PM-7PM',NULL),(3,3,17,0,'2020-05-23','5PM-7PM',NULL),(3,3,18,0,'2020-05-23','5PM-7PM',NULL),(3,3,19,0,'2020-05-23','5PM-7PM',NULL),(3,3,20,0,'2020-05-23','5PM-7PM',NULL),(3,3,21,0,'2020-05-23','5PM-7PM',NULL),(3,3,22,0,'2020-05-23','5PM-7PM',NULL),(3,3,23,0,'2020-05-23','5PM-7PM',NULL),(3,3,24,0,'2020-05-23','5PM-7PM',NULL),(3,3,25,0,'2020-05-23','5PM-7PM',NULL),(3,3,26,0,'2020-05-23','5PM-7PM',NULL),(3,3,27,0,'2020-05-23','5PM-7PM',NULL),(3,3,28,0,'2020-05-23','5PM-7PM',NULL),(3,3,29,0,'2020-05-23','5PM-7PM',NULL),(3,3,30,0,'2020-05-23','5PM-7PM',NULL),(1,4,1,0,'2020-05-23','9AM-12PM',NULL),(1,4,2,0,'2020-05-23','9AM-12PM',NULL),(1,4,3,0,'2020-05-23','9AM-12PM',NULL),(1,4,4,0,'2020-05-23','9AM-12PM',NULL),(1,4,5,0,'2020-05-23','9AM-12PM',NULL),(1,4,6,0,'2020-05-23','9AM-12PM',NULL),(1,4,7,0,'2020-05-23','9AM-12PM',NULL),(1,4,8,0,'2020-05-23','9AM-12PM',NULL),(1,4,9,0,'2020-05-23','9AM-12PM',NULL),(1,4,10,0,'2020-05-23','9AM-12PM',NULL),(1,4,11,0,'2020-05-23','9AM-12PM',NULL),(1,4,12,0,'2020-05-23','9AM-12PM',NULL),(1,4,13,0,'2020-05-23','9AM-12PM',NULL),(1,4,14,0,'2020-05-23','9AM-12PM',NULL),(1,4,15,0,'2020-05-23','9AM-12PM',NULL),(1,4,16,0,'2020-05-23','9AM-12PM',NULL),(1,4,17,0,'2020-05-23','9AM-12PM',NULL),(1,4,18,0,'2020-05-23','9AM-12PM',NULL),(1,4,19,0,'2020-05-23','9AM-12PM',NULL),(1,4,20,0,'2020-05-23','9AM-12PM',NULL),(1,4,21,0,'2020-05-23','9AM-12PM',NULL),(1,4,22,0,'2020-05-23','9AM-12PM',NULL),(1,4,23,0,'2020-05-23','9AM-12PM',NULL),(1,4,24,0,'2020-05-23','9AM-12PM',NULL),(1,4,25,0,'2020-05-23','9AM-12PM',NULL),(1,4,26,0,'2020-05-23','9AM-12PM',NULL),(1,4,27,0,'2020-05-23','9AM-12PM',NULL),(1,4,28,0,'2020-05-23','9AM-12PM',NULL),(1,4,29,0,'2020-05-23','9AM-12PM',NULL),(1,4,30,0,'2020-05-23','9AM-12PM',NULL),(5,5,1,0,'2020-05-24','8PM-10PM',NULL),(5,5,2,0,'2020-05-24','8PM-10PM',NULL),(5,5,3,0,'2020-05-24','8PM-10PM',NULL),(5,5,4,0,'2020-05-24','8PM-10PM',NULL),(5,5,5,0,'2020-05-24','8PM-10PM',NULL),(5,5,6,0,'2020-05-24','8PM-10PM',NULL),(5,5,7,0,'2020-05-24','8PM-10PM',NULL),(5,5,8,0,'2020-05-24','8PM-10PM',NULL),(5,5,9,0,'2020-05-24','8PM-10PM',NULL),(5,5,10,0,'2020-05-24','8PM-10PM',NULL),(5,5,11,0,'2020-05-24','8PM-10PM',NULL),(5,5,12,0,'2020-05-24','8PM-10PM',NULL),(5,5,13,0,'2020-05-24','8PM-10PM',NULL),(5,5,14,0,'2020-05-24','8PM-10PM',NULL),(5,5,15,0,'2020-05-24','8PM-10PM',NULL),(5,5,16,0,'2020-05-24','8PM-10PM',NULL),(5,5,17,0,'2020-05-24','8PM-10PM',NULL),(5,5,18,0,'2020-05-24','8PM-10PM',NULL),(5,5,19,0,'2020-05-24','8PM-10PM',NULL),(5,5,20,0,'2020-05-24','8PM-10PM',NULL),(5,5,21,0,'2020-05-24','8PM-10PM',NULL),(5,5,22,0,'2020-05-24','8PM-10PM',NULL),(5,5,23,0,'2020-05-24','8PM-10PM',NULL),(5,5,24,0,'2020-05-24','8PM-10PM',NULL),(5,5,25,0,'2020-05-24','8PM-10PM',NULL),(5,5,26,0,'2020-05-24','8PM-10PM',NULL),(5,5,27,0,'2020-05-24','8PM-10PM',NULL),(5,5,28,0,'2020-05-24','8PM-10PM',NULL),(5,5,29,0,'2020-05-24','8PM-10PM',NULL),(5,5,30,0,'2020-05-24','8PM-10PM',NULL);
/*!40000 ALTER TABLE `screen_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` int(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `PHONE` bigint(255) NOT NULL,
  `INSERTED_ON` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin@ucm.com',45344354,'2020-05-02 20:44:30'),(2,'janedoe','jane@123','janedoe@gmail.com',7829476927,'2020-05-03 03:31:30');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'movietheater'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-03 14:10:52

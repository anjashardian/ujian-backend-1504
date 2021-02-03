-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: backend_2021
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `location_id` int NOT NULL,
  `time_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_movieID_idx` (`movie_id`),
  KEY `schedules_timeID_idx` (`time_id`),
  KEY `schedules_lokationid_idx` (`location_id`),
  CONSTRAINT `schedules_lokationid` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `schedules_movieid` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `schedules_timeid` FOREIGN KEY (`time_id`) REFERENCES `show_times` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,1,1,3),(2,1,1,4),(3,1,1,5),(4,1,2,1),(5,1,2,5),(6,1,2,6),(7,1,3,1),(8,1,3,2),(9,1,3,3),(10,2,2,2),(11,2,2,4),(12,2,2,6),(13,3,1,3),(14,3,3,5),(15,3,3,6),(16,4,1,1),(17,4,2,2),(18,4,2,4),(19,4,3,3),(20,5,1,5),(21,5,2,5),(22,5,3,5),(23,6,1,1),(24,6,2,2),(25,6,3,3),(26,8,1,4),(27,8,1,6),(28,9,1,1),(29,9,1,2),(31,9,1,3);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 16:37:28

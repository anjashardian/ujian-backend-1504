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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `release_date` int NOT NULL,
  `release_month` int NOT NULL,
  `release_year` int NOT NULL,
  `duration_min` int NOT NULL,
  `genre` varchar(45) NOT NULL,
  `description` varchar(425) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `movie_moviestatus_idx` (`status`),
  CONSTRAINT `movie_moviestatus` FOREIGN KEY (`status`) REFERENCES `movie_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Avengers: Endgame',24,4,2019,182,'Action','After Thanos, an intergalactic warlord, disintegrates half of the universe, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.',3),(2,'Frozen 2',20,11,2019,113,'Fantasy','Queen Elsa starts hearing a mysterious melodic voice calling to her. Unsettled, she answers it and that awakens the elemental spirits that lead her to a quest to restore an old injustice.',2),(3,'Demon Slayer: Kimetsu no Yaiba the Movie: Mugen Train',6,1,2021,129,'Anime','A youth begins a quest to fight demons and save his sister after finding his family slaughtered and his sister turned into a demon.',1),(4,'Weathering with You',21,8,2019,111,'Romance','A boy runs away to Tokyo and befriends a girl who appears to be able to manipulate the weather.',2),(5,'The Nun',5,9,2018,96,'Horror','When a young nun at a cloistered abbey in Romania takes her own life, a priest with a haunted past and a novitiate on the threshold of her final vows are sent by the Vatican to investigate. Together, they uncover the order\'s unholy secret. Risking not only their lives but their faith and their very souls, they confront a malevolent force in the form of a demonic nun.',3),(6,'Spider-Man: Far From Home',3,7,2019,129,'Action','As Spider-Man, a beloved superhero, Peter Parker faces four destructive elemental monsters while on holiday in Europe. Soon, he receives help from Mysterio, a fellow hero with mysterious origins.',2),(8,'Black Widow',4,29,2021,133,'Action','At birth the Black Widow (aka Natasha Romanova) is given to the KGB, which grooms her to become its ultimate operative. When the U.S.S.R. breaks up, the government tries to kill her as the action moves to present-day New York, where she is a freelance operative.',1),(9,'Mulan',25,3,2020,120,'Fantasy','A girl disguises as a male warrior and joins the imperial army in order to prevent her sick father from being forced to enlist as he has no male heir.',2);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-03 16:37:26

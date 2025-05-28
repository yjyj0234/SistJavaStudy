-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `num` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `id` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gaipday` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (8,'이영자','youngja','5555','yj@naver.com','2025-05-16 03:05:04'),(9,'강호동','stronghodong','1234','shddd@shd.com','2025-05-16 03:11:04'),(11,'오많오','55555555555','1234','5555@5555.com','2025-05-16 08:16:52'),(14,'손흥민','hmson7','1234','son@son.com','2025-05-19 00:50:17'),(16,'이영주','youngju','1234','yj@yj.com','2025-05-19 00:51:22'),(17,'관리자','admin','1234','admin@iamadmin.com','2025-05-19 02:29:39'),(18,'yyyy','yyyyyyy','1234','yyy@naver.com','2025-05-21 09:15:08');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smartanswer`
--

DROP TABLE IF EXISTS `smartanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartanswer` (
  `idx` smallint NOT NULL AUTO_INCREMENT,
  `num` smallint DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `writeday` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `num` (`num`),
  CONSTRAINT `smartanswer_ibfk_1` FOREIGN KEY (`num`) REFERENCES `coffee`.`smartboard` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartanswer`
--

LOCK TABLES `smartanswer` WRITE;
/*!40000 ALTER TABLE `smartanswer` DISABLE KEYS */;
INSERT INTO `smartanswer` VALUES (9,1,'123','1233','2025-05-23 08:44:38'),(10,1,'345','345','2025-05-23 08:45:47');
/*!40000 ALTER TABLE `smartanswer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 10:43:54

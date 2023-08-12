-- MariaDB dump 10.19-11.0.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: esp8266
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `EstadoObj`
--

DROP TABLE IF EXISTS `EstadoObj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoObj` (
  `IdEstadoObj` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdEstadoObj`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoObj`
--

LOCK TABLES `EstadoObj` WRITE;
/*!40000 ALTER TABLE `EstadoObj` DISABLE KEYS */;
INSERT INTO `EstadoObj` VALUES
(1,'2023-08-11 23:18:08',0),
(2,'2023-08-12 00:31:01',1),
(3,'2023-08-12 00:31:08',0),
(4,'2023-08-12 10:47:49',1),
(5,'2023-08-12 10:50:36',1),
(6,'2023-08-12 10:51:28',1),
(7,'2023-08-12 10:51:38',0),
(8,'2023-08-12 11:42:10',1),
(9,'2023-08-12 11:42:39',1),
(10,'2023-08-12 12:26:50',1),
(11,'2023-08-12 12:26:57',1),
(12,'2023-08-12 12:27:49',1),
(13,'2023-08-12 12:28:22',1),
(14,'2023-08-12 12:32:38',1),
(15,'2023-08-12 12:32:52',1),
(16,'2023-08-12 14:25:40',1),
(17,'2023-08-12 14:26:04',0),
(18,'2023-08-12 14:28:14',1),
(19,'2023-08-12 14:28:22',1),
(20,'2023-08-12 14:28:27',1),
(21,'2023-08-12 14:29:26',1),
(22,'2023-08-12 14:30:56',1),
(23,'2023-08-12 14:31:02',1),
(24,'2023-08-12 14:31:10',1),
(25,'2023-08-12 14:31:16',1),
(26,'2023-08-12 14:32:02',1),
(27,'2023-08-12 14:32:12',0),
(28,'2023-08-12 14:33:39',1),
(29,'2023-08-12 14:34:01',1);
/*!40000 ALTER TABLE `EstadoObj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objeto`
--

DROP TABLE IF EXISTS `Objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Objeto` (
  `IdObjeto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) DEFAULT NULL,
  `fkEstadoObj` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdObjeto`),
  KEY `fkEstadoObj` (`fkEstadoObj`),
  CONSTRAINT `Objeto_ibfk_1` FOREIGN KEY (`fkEstadoObj`) REFERENCES `EstadoObj` (`IdEstadoObj`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objeto`
--

LOCK TABLES `Objeto` WRITE;
/*!40000 ALTER TABLE `Objeto` DISABLE KEYS */;
INSERT INTO `Objeto` VALUES
(2,'Open',1),
(3,'Close',2),
(4,'Open',3),
(5,'Close',4),
(6,'Close',5),
(7,'Close',6),
(8,'Open',7),
(9,'Close',8),
(10,'Close',9),
(11,'Close',10),
(12,'Close',11),
(13,'Close',12),
(14,'Close',13),
(15,'Close',14),
(16,'Close',15),
(17,'Close',16),
(18,'Open',17),
(19,'Close',18),
(20,'Close',19),
(21,'Close',20),
(22,'Close',21),
(23,'Close',22),
(24,'Close',23),
(25,'Close',24),
(26,'Close',25),
(27,'Close',26),
(28,'Open',27),
(29,'Close',28),
(30,'Close',29);
/*!40000 ALTER TABLE `Objeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(15) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES
(1,'test','test'),
(2,'admin','admin');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-12 16:08:47

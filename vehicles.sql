USE vehicles;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vehicles
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `entregas_log`
--

DROP TABLE IF EXISTS `entregas_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas_log` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(45) NOT NULL,
  `initial_kilometers` int DEFAULT NULL,
  `current_kilometers` int DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `reason` varchar(45) NOT NULL,
  `submission_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_data` int DEFAULT NULL,
  `entregas_name` varchar(35) NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `fk_entregas_log_general_data` (`id_data`),
  CONSTRAINT `fk_entregas_log_general_data` FOREIGN KEY (`id_data`) REFERENCES `general_data` (`id_data`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_log`
--

LOCK TABLES `entregas_log` WRITE;
/*!40000 ALTER TABLE `entregas_log` DISABLE KEYS */;
INSERT INTO `entregas_log` VALUES (56,'Amarok blanco U84',1,2,'2024-08-14 20:09:37','ASDFASDF','2024-08-14 20:09:37',NULL,'SDFASD'),(57,'Amarok gris U85',1,2,'2024-08-14 21:40:25','work','2024-08-14 21:40:25',NULL,'Gianny'),(58,'Amarok U83',1,2,'2024-08-14 23:15:13','motivo entregas','2024-08-14 23:15:13',NULL,'giovanni entregas'),(59,'Amarok U83',1,3,'2024-08-14 23:23:27','TESTING','2024-08-14 23:23:27',NULL,'TESTING'),(60,'Amarok U83',3,4,'2024-08-14 23:52:23','FASD','2024-08-14 23:52:23',NULL,'FASDF'),(61,'Amarok U83',6,7,'2024-08-15 00:51:56','fasdfasd','2024-08-15 00:51:56',NULL,'dfasdfa'),(62,'Amarok blanco U84',7,8,'2024-08-15 00:57:22','personal','2024-08-15 00:57:22',NULL,'gianny '),(63,'Amarok blanco U84',8,9,'2024-08-15 13:15:36','mover personal','2024-08-15 13:15:36',NULL,'Gianny'),(64,'Amarok blanco U84',454490,454501,'2024-08-15 15:05:52','mover personal','2024-08-15 15:05:52',NULL,'Alicia');
/*!40000 ALTER TABLE `entregas_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_data`
--

DROP TABLE IF EXISTS `general_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_data` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `vehicles_id` int NOT NULL,
  `user_name` tinytext NOT NULL,
  `vehicle_name` varchar(45) NOT NULL,
  `reason_for_needing_the_vehicle` varchar(45) NOT NULL,
  `initial_date` date NOT NULL,
  `return_date` date NOT NULL,
  `submission_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `vehicles_id_UNIQUE` (`id_data`),
  KEY `fk_general_data_vehicles_data_cars_list_idx` (`vehicles_id`),
  CONSTRAINT `fk_general_data_vehicles_data_cars_list` FOREIGN KEY (`vehicles_id`) REFERENCES `vehicles_data_cars_list` (`vehicles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_data`
--

LOCK TABLES `general_data` WRITE;
/*!40000 ALTER TABLE `general_data` DISABLE KEYS */;
INSERT INTO `general_data` VALUES (48,1,'Gianny Pedidos','Amarok blanco U84','CopEnergy because i have to','2024-08-14','2024-08-14','2024-08-14 17:41:19'),(49,1,'Gianny Pedidos','Amarok blanco U84','CopEnergy because i have to','2024-08-14','2024-08-14','2024-08-14 18:37:17'),(50,3,'giovanni pedidos','Amarok U83','pedido empresa i razon','2024-08-14','2024-08-14','2024-08-14 23:16:20'),(51,1,'Gianny','Amarok blanco U84','Copenergy','2024-08-14','2024-08-14','2024-08-15 00:56:26'),(52,1,'Gianny ','Amarok blanco U84','copenergy  mobilizacion personal','2024-08-15','2024-08-15','2024-08-15 13:13:36'),(53,1,'Gianny ','Amarok blanco U84','copenergy  mobilizacion personal','2024-08-15','2024-08-16','2024-08-15 15:02:04');
/*!40000 ALTER TABLE `general_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles_data_cars_list`
--

DROP TABLE IF EXISTS `vehicles_data_cars_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles_data_cars_list` (
  `vehicles_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_name` varchar(45) DEFAULT NULL,
  `current_kilometers` int DEFAULT NULL,
  `vehicle_status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`vehicles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles_data_cars_list`
--

LOCK TABLES `vehicles_data_cars_list` WRITE;
/*!40000 ALTER TABLE `vehicles_data_cars_list` DISABLE KEYS */;
INSERT INTO `vehicles_data_cars_list` VALUES (1,'Amarok blanco U84',454501,0),(2,'Amarok gris U85',2,0),(3,'Amarok U83',204946,0),(4,'Bus Internacional U401',175709,1),(5,'Camion Internacional U402',0,1),(6,'Camion Isuzu U139',0,1),(7,'Camion Isuzu U180',0,1),(8,'Mahindra Cafe U26',0,1),(9,'Mitsubishi L200 U6',0,1),(10,'Mitsubishi U307',140831,1),(11,'Nissan Frontier U306',81987,1),(12,'Toyota Hilux U97',0,1),(13,'Toyota Hilux U98',0,1),(14,'Toyota Land Cruiser U65',0,1);
/*!40000 ALTER TABLE `vehicles_data_cars_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15  9:49:16

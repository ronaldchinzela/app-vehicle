CREATE DATABASE  IF NOT EXISTS `base-proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `base-proyecto`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: base-proyecto
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'Toyota','Corolla','Blanco',10,35000,'2025-01-10 13:00:00'),(2,'Ford','Escape','Negro',7,40000,'2025-01-09 20:34:00'),(3,'Chevrolet','Malibu','Azul',12,38000,'2025-01-08 17:20:00'),(4,'Honda','Civic','Gris',5,34000,'2025-01-07 14:45:00'),(5,'Nissan','Altima','Rojo',15,37000,'2025-01-09 19:12:00'),(6,'Hyundai','Elantra','Plata',20,36000,'2025-01-10 15:30:00'),(7,'Jeep','Compass','Verde',8,45000,'2025-01-06 16:22:00'),(8,'Volkswagen','Tiguan','Blanco Perla',9,42000,'2025-01-05 18:14:00'),(9,'BMW','X3','Negro Mate',3,60000,'2025-01-10 12:40:00'),(10,'Mercedes-Benz','GLA','Plateado',4,55000,'2025-01-08 21:50:00'),(11,'Audi','Q5','Azul Marino',6,58000,'2025-01-09 17:00:00'),(12,'Volvo','XC60','Gris Oscuro',10,62000,'2025-01-04 23:20:00'),(13,'Porsche','Macan','Negro',2,72000,'2025-01-10 14:45:00'),(14,'Lexus','RX 350','Rojo Carmesí',5,65000,'2025-01-08 00:30:00'),(15,'Land Rover','Discovery','Verde Oscuro',4,70000,'2025-01-09 22:10:00'),(16,'Tesla','Model Y','Blanco',12,54000,'2025-01-04 03:05:00'),(17,'Toyota','RAV4','Azul',18,41000,'2025-01-07 02:15:00'),(18,'Ford','F-150','Rojo',20,50000,'2025-01-06 01:40:00'),(19,'Chevrolet','Silverado','Negro',15,49000,'2025-01-10 16:55:00'),(20,'Ram','1500','Gris',14,52000,'2025-01-08 19:30:00'),(21,'Mazda','Mazda3','Blanco Perla',8,30000,'2025-01-10 17:40:00'),(22,'Kia','Seltos','Naranja',10,32000,'2025-01-09 13:25:00'),(23,'Subaru','Outback','Verde',6,45000,'2025-01-07 04:10:00'),(24,'Honda','CR-V','Negro',20,39000,'2025-01-05 20:45:00'),(25,'Hyundai','Tucson','Gris Mate',12,35000,'2025-01-04 19:50:00'),(26,'Jeep','Wrangler','Amarillo',5,60000,'2025-01-09 21:00:00'),(27,'Volkswagen','Golf','Azul',15,27000,'2025-01-09 00:35:00'),(28,'BMW','Series 3','Rojo',7,45000,'2025-01-10 18:25:00'),(29,'Mercedes-Benz','C-Class','Negro',8,48000,'2025-01-06 16:00:00'),(30,'Audi','A4','Blanco',10,43000,'2025-01-07 19:45:00'),(31,'Ford','Mustang','Rojo',5,55000,'2025-01-10 20:10:00'),(32,'Chevrolet','Equinox','Azul',8,40000,'2025-01-09 16:40:00'),(33,'Nissan','Rogue','Negro',12,37000,'2025-01-08 15:30:00'),(34,'Hyundai','Sonata','Gris Claro',14,42000,'2025-01-07 18:25:00'),(35,'Jeep','Cherokee','Verde Claro',9,46000,'2025-01-06 23:55:00'),(36,'Volkswagen','Passat','Blanco',16,33000,'2025-01-05 15:20:00'),(37,'BMW','X5','Plata',4,65000,'2025-01-10 21:00:00'),(38,'Mercedes-Benz','E-Class','Gris Oscuro',7,62000,'2025-01-05 00:00:00'),(39,'Audi','Q7','Azul Claro',6,68000,'2025-01-04 02:15:00'),(40,'Volvo','S90','Rojo',5,70000,'2025-01-02 22:00:00'),(41,'Lexus','NX 300','Negro Mate',12,55000,'2025-01-10 22:30:00'),(42,'Land Rover','Range Rover','Verde',9,75000,'2025-01-10 01:45:00'),(43,'Tesla','Model X','Blanco Perla',6,80000,'2025-01-08 19:00:00'),(44,'Toyota','Highlander','Plata',11,54000,'2025-01-07 23:35:00'),(45,'Ford','Bronco','Verde',10,60000,'2025-01-07 03:50:00'),(46,'Chevrolet','Traverse','Rojo Claro',14,48000,'2025-01-05 16:15:00'),(47,'Nissan','Murano','Gris Claro',7,47000,'2025-01-04 18:00:00'),(48,'Hyundai','Palisade','Azul Marino',12,63000,'2025-01-04 01:10:00'),(49,'Jeep','Grand Cherokee','Amarillo Claro',6,70000,'2025-01-02 21:40:00'),(50,'Volkswagen','Arteon','Blanco',10,49000,'2025-01-02 00:25:00'),(51,'BMW','Z4','Rojo Mate',5,75000,'2025-01-10 23:40:00'),(52,'Mercedes-Benz','S-Class','Plata',8,85000,'2025-01-09 14:00:00'),(53,'Audi','Q8','Negro Mate',4,70000,'2025-01-08 18:15:00'),(54,'Volvo','XC90','Gris',6,72000,'2025-01-08 02:30:00'),(55,'Porsche','911','Blanco',2,95000,'2025-01-07 00:50:00'),(56,'Lexus','LX 570','Rojo',5,120000,'2025-01-05 21:00:00'),(57,'Land Rover','Defender','Negro',3,130000,'2025-01-04 22:10:00'),(58,'Tesla','Cybertruck','Cromo',4,150000,'2025-01-03 16:25:00'),(59,'Jaguar','F-Pace','Azul',6,95000,'2025-01-02 20:15:00'),(60,'Aston Martin','DBX','Verde',3,170000,'2025-01-01 17:30:00'),(61,'Toyota','Camry','Negro',10,35000,'2025-01-10 13:00:00'),(62,'Ford','Explorer','Azul Marino',7,40000,'2025-01-09 20:34:00'),(63,'Chevrolet','Tahoe','Blanco Perla',12,58000,'2025-01-08 17:20:00'),(64,'Honda','Accord','Rojo Carmesí',8,34000,'2025-01-07 14:45:00'),(65,'Nissan','Pathfinder','Gris Claro',5,37000,'2025-01-09 19:12:00'),(66,'Hyundai','Santa Fe','Azul Claro',20,40000,'2025-01-10 15:30:00'),(67,'Jeep','Renegade','Verde Oscuro',6,33000,'2025-01-06 16:22:00'),(68,'Volkswagen','Jetta','Gris Mate',9,31000,'2025-01-05 18:14:00'),(69,'BMW','Series 5','Plata',4,62000,'2025-01-10 12:40:00'),(70,'Mercedes-Benz','GLC','Azul Marino',3,56000,'2025-01-08 21:50:00'),(71,'Audi','A6','Negro Mate',5,52000,'2025-01-09 17:00:00'),(72,'Volvo','V60','Blanco',10,43000,'2025-01-04 23:20:00'),(73,'Porsche','Cayenne','Gris',3,78000,'2025-01-10 14:45:00'),(74,'Lexus','ES 300','Rojo',7,60000,'2025-01-08 00:30:00'),(75,'Land Rover','Evoque','Naranja',8,71000,'2025-01-09 22:10:00'),(76,'Tesla','Model 3','Azul',15,42000,'2025-01-04 03:05:00'),(77,'Toyota','4Runner','Negro',11,44000,'2025-01-07 02:15:00'),(78,'Ford','Edge','Rojo Claro',9,39000,'2025-01-06 01:40:00'),(79,'Chevrolet','Blazer','Blanco Perla',14,41000,'2025-01-10 16:55:00'),(80,'Ram','2500','Gris Oscuro',18,53000,'2025-01-08 19:30:00'),(81,'Mazda','CX-5','Azul Marino',7,35000,'2025-01-10 17:40:00'),(82,'Kia','Sportage','Verde Claro',10,32000,'2025-01-09 13:25:00'),(83,'Subaru','Crosstrek','Rojo Oscuro',12,38000,'2025-01-07 04:10:00'),(84,'Honda','Pilot','Blanco',6,47000,'2025-01-05 20:45:00'),(85,'Hyundai','Kona','Gris',16,29000,'2025-01-04 19:50:00'),(86,'Jeep','Gladiator','Amarillo',4,50000,'2025-01-09 21:00:00'),(87,'Volkswagen','ID.4','Azul',5,45000,'2025-01-09 00:35:00'),(88,'BMW','X6','Plata',6,67000,'2025-01-10 18:25:00'),(89,'Mercedes-Benz','GLE','Gris Oscuro',9,72000,'2025-01-06 16:00:00'),(90,'Audi','A8','Rojo Mate',2,75000,'2025-01-07 19:45:00'),(91,'Ford','Maverick','Verde',10,34000,'2025-01-10 20:10:00'),(92,'Chevrolet','Trax','Blanco',8,30000,'2025-01-09 16:40:00'),(93,'Nissan','Frontier','Azul',14,37000,'2025-01-08 15:30:00'),(94,'Hyundai','Venue','Naranja',5,29000,'2025-01-07 18:25:00'),(95,'Jeep','Commander','Negro Mate',7,49000,'2025-01-06 23:55:00'),(96,'Volkswagen','T-Cross','Amarillo Claro',12,31000,'2025-01-05 15:20:00'),(97,'BMW','i4','Blanco Perla',3,65000,'2025-01-10 21:00:00'),(98,'Mercedes-Benz','AMG GT','Azul Claro',2,95000,'2025-01-05 00:00:00'),(99,'Audi','RS7','Gris',1,110000,'2025-01-04 02:15:00'),(100,'Volvo','C40','Plata',9,60000,'2025-01-02 22:00:00'),(101,'Lexus','IS 500','Negro',6,65000,'2025-01-10 22:30:00'),(102,'Land Rover','Velar','Verde',8,85000,'2025-01-10 01:45:00'),(103,'Tesla','Roadster','Rojo',2,200000,'2025-01-08 19:00:00'),(104,'Toyota','Sequoia','Naranja',6,58000,'2025-01-07 23:35:00'),(105,'Ford','Transit','Blanco',14,55000,'2025-01-07 03:50:00'),(106,'Chevrolet','Bolt','Azul Oscuro',11,32000,'2025-01-05 16:15:00'),(107,'Nissan','Armada','Verde Oscuro',7,52000,'2025-01-04 18:00:00'),(108,'Hyundai','Ioniq 5','Plata',5,45000,'2025-01-04 01:10:00'),(109,'Jeep','Patriot','Azul Marino',6,29000,'2025-01-02 21:40:00'),(110,'Volkswagen','Taos','Rojo',10,36000,'2025-01-02 00:25:00'),(111,'Toyota','Yaris','Negro',15,25000,'2025-01-10 23:00:00'),(112,'Ford','Explorer','Blanco',12,45000,'2025-01-10 23:10:00'),(113,'Chevrolet','Trailblazer','Rojo',10,37000,'2025-01-10 23:20:00'),(114,'Honda','Accord','Azul',8,33000,'2025-01-10 23:30:00'),(115,'Nissan','Maxima','Plata',5,34000,'2025-01-10 23:40:00'),(116,'Hyundai','Santa Fe','Gris',20,40000,'2025-01-10 23:50:00'),(117,'Jeep','Renegade','Naranja',7,42000,'2025-01-11 00:00:00'),(118,'Volkswagen','ID.4','Blanco Perla',9,45000,'2025-01-11 00:10:00'),(119,'BMW','i4','Negro Mate',3,55000,'2025-01-11 00:20:00'),(120,'Mercedes-Benz','GLB','Rojo Mate',4,53000,'2025-01-11 00:30:00'),(121,'Audi','A5','Azul Marino',6,47000,'2025-01-11 00:40:00'),(122,'Volvo','V60','Gris Claro',10,49000,'2025-01-11 00:50:00'),(123,'Porsche','Cayenne','Negro',2,80000,'2025-01-11 01:00:00'),(124,'Lexus','ES 300h','Verde Oscuro',5,55000,'2025-01-11 01:10:00'),(125,'Land Rover','Freelander','Gris Mate',4,60000,'2025-01-11 01:20:00'),(126,'Tesla','Model 3','Blanco',12,48000,'2025-01-11 01:30:00'),(127,'Toyota','Tacoma','Rojo',18,41000,'2025-01-11 01:40:00'),(128,'Ford','Edge','Plata',20,39000,'2025-01-11 01:50:00'),(129,'Chevrolet','Colorado','Verde Claro',15,46000,'2025-01-11 02:00:00'),(130,'Nissan','Pathfinder','Azul Oscuro',14,42000,'2025-01-11 02:10:00'),(131,'Toyota','Corolla','Blanco',25,23000,'2025-01-11 03:00:00'),(132,'Ford','Fusion','Negro',20,28000,'2025-01-11 03:10:00'),(133,'Chevrolet','Malibu','Gris',15,27000,'2025-01-11 03:20:00'),(134,'Honda','Civic','Rojo',18,26000,'2025-01-11 03:30:00'),(135,'Nissan','Altima','Azul',12,29000,'2025-01-11 03:40:00'),(136,'Hyundai','Elantra','Blanco Perla',22,24000,'2025-01-11 03:50:00'),(137,'Jeep','Wrangler','Verde Militar',10,45000,'2025-01-11 04:00:00'),(138,'Volkswagen','Jetta','Negro',25,23000,'2025-01-11 04:10:00'),(139,'BMW','X1','Blanco',8,48000,'2025-01-11 04:20:00'),(140,'Mercedes-Benz','C-Class','Plata',6,52000,'2025-01-11 04:30:00'),(141,'Audi','Q3','Azul Marino',9,47000,'2025-01-11 04:40:00'),(142,'Volvo','XC60','Gris Oscuro',12,50000,'2025-01-11 04:50:00'),(143,'Porsche','Macan','Negro Mate',3,75000,'2025-01-11 05:00:00'),(144,'Lexus','RX 350','Rojo Vino',7,53000,'2025-01-11 05:10:00'),(145,'Land Rover','Discovery','Gris Claro',5,62000,'2025-01-11 05:20:00'),(146,'Tesla','Model S','Blanco',9,90000,'2025-01-11 05:30:00'),(147,'Toyota','RAV4','Rojo',15,35000,'2025-01-11 05:40:00'),(148,'Ford','Escape','Azul',20,34000,'2025-01-11 05:50:00'),(149,'Chevrolet','Tahoe','Negro',10,60000,'2025-01-11 06:00:00'),(150,'Nissan','Rogue','Gris Oscuro',18,32000,'2025-01-11 06:10:00'),(151,'Hyundai','Tucson','Blanco Perla',21,31000,'2025-01-11 06:20:00'),(152,'Jeep','Compass','Naranja',13,38000,'2025-01-11 06:30:00'),(153,'Volkswagen','Passat','Plata',16,29000,'2025-01-11 06:40:00'),(154,'BMW','5 Series','Azul Oscuro',4,55000,'2025-01-11 06:50:00'),(155,'Mercedes-Benz','E-Class','Negro Mate',5,65000,'2025-01-11 07:00:00'),(156,'Audi','A4','Blanco',12,42000,'2025-01-11 07:10:00'),(157,'Volvo','S90','Rojo Mate',8,49000,'2025-01-11 07:20:00'),(158,'Porsche','Panamera','Negro',2,120000,'2025-01-11 07:30:00'),(159,'Lexus','GX 460','Gris',6,63000,'2025-01-11 07:40:00'),(160,'Land Rover','Range Rover','Azul Marino',3,110000,'2025-01-11 07:50:00'),(161,'Tesla','Model Y','Gris Mate',10,58000,'2025-01-11 08:00:00'),(162,'Toyota','Highlander','Rojo Oscuro',15,40000,'2025-01-11 08:10:00'),(163,'Ford','Bronco','Verde Oscuro',12,46000,'2025-01-11 08:20:00'),(164,'Chevrolet','Suburban','Negro Mate',8,70000,'2025-01-11 08:30:00'),(165,'Nissan','Murano','Blanco',20,38000,'2025-01-11 08:40:00'),(166,'Hyundai','Kona','Azul',25,28000,'2025-01-11 08:50:00'),(167,'Jeep','Grand Cherokee','Rojo Mate',10,50000,'2025-01-11 09:00:00'),(168,'Volkswagen','Golf','Verde',20,27000,'2025-01-11 09:10:00'),(169,'BMW','7 Series','Negro',4,90000,'2025-01-11 09:20:00'),(170,'Mercedes-Benz','GLC','Azul Marino',8,55000,'2025-01-11 09:30:00'),(171,'Audi','Q5','Gris Claro',9,47000,'2025-01-11 09:40:00'),(172,'Volvo','XC90','Negro Mate',7,65000,'2025-01-11 09:50:00'),(173,'Porsche','911','Rojo',2,150000,'2025-01-11 10:00:00'),(174,'Lexus','IS 300','Plata',10,48000,'2025-01-11 10:10:00'),(175,'Land Rover','Defender','Naranja',6,75000,'2025-01-11 10:20:00'),(176,'Tesla','Cybertruck','Gris Oscuro',5,70000,'2025-01-11 10:30:00'),(177,'Toyota','Prius','Blanco',18,27000,'2025-01-11 10:40:00'),(178,'Ford','Mustang','Rojo',12,55000,'2025-01-11 10:50:00'),(179,'Chevrolet','Blazer','Gris Claro',14,43000,'2025-01-11 11:00:00'),(180,'Nissan','Frontier','Azul',22,39000,'2025-01-11 11:10:00');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'base-proyecto'
--

--
-- Dumping routines for database 'base-proyecto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-15 23:59:46

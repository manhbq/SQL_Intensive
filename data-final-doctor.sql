-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: doctor_anywhere
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `acc_cust_id_idx` (`customer_id`),
  CONSTRAINT `acc_cust_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (18,'000001','abc123','e1@gmail.com','ACTIVE',1),(19,'000006','abc123','e2@gmail.com','ACTIVE',6),(20,'000007','abc123','e3@gmail.com','ACTIVE',7),(21,'000008','abc123','e4@gmail.com','ACTIVE',8),(22,'000009','abc123','e5@gmail.com','ACTIVE',9),(23,'000010','abc123','e6@gmail.com','ACTIVE',10),(24,'000011','abc123','e7@gmail.com','ACTIVE',11),(25,'000012','abc123','e8@gmail.com','ACTIVE',12),(26,'000013','abc123','e9@gmail.com','ACTIVE',13),(27,'000014','abc123','e10@gmail.com','ACTIVE',14),(28,'000015','abc123','e11@gmail.com','ACTIVE',15),(29,'000016','abc123','e12@gmail.com','ACTIVE',16),(30,'000017','abc123','e13@gmail.com','ACTIVE',17),(31,'000018','abc123','e14@gmail.com','ACTIVE',18),(32,'000019','abc123','e15@gmail.com','ACTIVE',19),(33,'000020','abc123','e16@gmail.com','ACTIVE',20),(35,'000021','abc123','hoang@gmail.com','INACTIVE',21),(36,'000022','abc123','leena@gmail.com','INACTIVE',22);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` enum('PENDING','DONE','REJECTED','REARRANGED') DEFAULT 'PENDING',
  PRIMARY KEY (`id`),
  KEY `app_booking_id_idx` (`booking_id`),
  KEY `app_doctor_id_idx` (`doctor_id`),
  KEY `app_department_id_idx` (`department_id`),
  KEY `app_cust_id_idx` (`customer_id`),
  CONSTRAINT `app_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `app_cust_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `app_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `app_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,1,1,11,'2022-05-06 12:00:00','cannot walk and eat','DONE'),(2,2,6,1,11,'2022-06-20 17:00:00','So much pain, cannot sleep','PENDING'),(3,3,7,1,5,'2022-05-12 09:00:00','Headache','DONE'),(4,4,8,1,20,'2021-05-01 09:00:00','some thing fly in brain','DONE'),(5,5,9,2,9,'2022-07-06 12:00:00','vomit a lot','PENDING'),(6,6,10,3,7,'2022-08-02 10:00:00','hair falling','PENDING'),(7,7,11,4,8,'2022-09-01 15:00:00','Red eyes','PENDING'),(8,8,12,5,3,'2022-10-17 14:00:00','Sleep a lot but very tired','PENDING'),(9,9,13,6,4,'2022-11-20 16:00:00','Cannot go toilet','PENDING'),(10,10,14,7,6,'2022-12-22 15:00:00','Broken leg','PENDING'),(11,12,16,9,15,'2021-08-02 20:00:00','Hot all body','DONE'),(12,13,17,10,18,'2021-12-01 18:00:00','want to vomit all the time','REJECTED'),(13,14,18,11,19,'2021-12-01 18:00:00','broken aims','REJECTED'),(14,16,20,2,9,'2022-06-06 13:00:00','ichi butt','REARRANGED'),(15,16,20,2,9,'2022-06-22 13:00:00','ichi butt','PENDING');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` enum('PENDING','PAID','REJECTED') DEFAULT 'PENDING',
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_doctor_id_idx` (`doctor_id`),
  KEY `book_department_id_idx` (`department_id`),
  KEY `book_cus_id_idx` (`customer_id`),
  CONSTRAINT `book_cus_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `book_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `book_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,11,'cannot walk and eat','2022-05-06 12:00:00','PAID',100),(2,6,1,11,'So much pain, cannot sleep','2022-06-20 17:00:00','PAID',45),(3,7,1,5,'Headache','2022-05-12 09:00:00','PAID',67),(4,8,1,20,'some thing fly in brain','2021-05-01 09:00:00','PAID',165),(5,9,2,9,'vomit a lot','2022-07-06 12:00:00','PAID',112),(6,10,3,7,'hair falling','2022-08-02 10:00:00','PAID',98),(7,11,4,8,'Red eyes','2022-09-01 15:00:00','PAID',150),(8,12,5,3,'Sleep a lot but very tired','2022-10-17 14:00:00','PAID',200),(9,13,6,4,'Cannot go toilet','2022-11-20 16:00:00','PAID',50),(10,14,7,6,'Broken leg','2022-12-22 15:00:00','PAID',50),(11,15,8,7,'Aim cannot lift up','2021-09-07 12:00:00','REJECTED',50),(12,16,9,15,'Hot all body','2021-08-02 20:00:00','PAID',270),(13,17,10,18,'want to vomit all the time','2021-12-01 18:00:00','PAID',180),(14,18,11,19,'broken aims','2021-12-01 18:00:00','PAID',38),(15,19,11,12,'Knee heavy','2022-06-16 11:00:00','PENDING',42),(16,20,2,9,'ichi butt','2022-06-06 13:00:00','PAID',68),(17,1,4,8,'forget everything','2021-06-06 13:00:00','REJECTED',22),(18,6,5,3,'lost mind','2021-02-06 13:00:00','REJECTED',34);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_number` varchar(45) DEFAULT NULL,
  `valid_date` varchar(5) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_customer_id_idx` (`customer_id`),
  CONSTRAINT `card_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'0123456789','02/26','ACTIVE',1),(2,'1333456789','05/26','ACTIVE',15),(3,'42223456789','12/25','ACTIVE',11),(4,'43783456789','11/24','ACTIVE',1),(5,'86783456789','09/28','ACTIVE',11),(6,'01234563425','11/22','ACTIVE',13),(7,'23448456789','10/21','ACTIVE',16),(8,'74575456789','09/22','ACTIVE',20),(9,'87498432644','05/25','ACTIVE',6),(10,'13264565465','03/24','ACTIVE',8),(11,'97852612245','06/21','INACTIVE',9),(12,'6756452134','07/23','ACTIVE',12);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dung Nguyen','557 To Ky, Q12, TPHCM','090909090'),(6,'Hoang Nguyen','557 To Ky, Q12, TPHCM','097090902'),(7,'Le Nguyen','2 Nguyen Trai Q1, TPHCM','080909090'),(8,'Kim','36 Hang Thau, Ha Noi','070909090'),(9,'David','37 Tran Quoc Toan, Di Chieu , Da Nang','060909090'),(10,'Hue Le','17 Tam Ky, Quang Nam','050909090'),(11,'Tran Hoang','29A/7 Le Loi, Gia Lai','040909090'),(12,'Cao','4 Cao Thang, Q3, TPHCM','030909090'),(13,'Nam','9/1/4 Hoang Dieu, Q4, TPHCM','020909090'),(14,'Mari','4 Hoan Kiem, Ha Noi','010909090'),(15,'Tom','35 Hang Sach, Ha Noi','099909090'),(16,'David Teo','98 Hang Che, Ha Noi','091909090'),(17,'Hoang Nguyen','Sala, Q2, TPHCM','097290907'),(18,'Dung Nguyen','Sala, Q2, TPHCM','097190907'),(19,'Dung Duc Nguyen','Sala, Q2, TPHCM','097390907'),(20,'Hoang Nguyen','88 Le Loi, Dinh Chieu, Da Nang','097490907'),(21,'Le Long','105 Le Loi, Dinh Chieu, Da Nang','095490907'),(22,'Ngan Lee','199 Le Loi, Dinh Chieu, Da Nang','099049090');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Outpatient ',NULL),(2,'Neonatal Intensive Care',NULL),(3,'Intensive Care',NULL),(4,'Haemodialysis/ Kidney Dialysis','Kidney'),(5,'Cardiology','Heart'),(6,'Endocrinology',NULL),(7,'Gastroenterology ','Emit food, stormach'),(8,'Hepato-Biliary-Pancreatic',NULL),(9,'Pediatrics ',NULL),(10,'General Medical/Medicine',NULL),(11,'Neurology',NULL),(12,'Respiratory ','Breath'),(13,'Surgery ',NULL),(14,'Neurosurgery ',NULL),(15,'Urology ',NULL),(16,'Hematology ',NULL),(17,'Dermatology ',NULL),(18,'Endoscopy ',NULL),(19,'Ophthalmology ','Eye'),(20,'Ear – Nose -Throat',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Hoang','875642341','doctor8@doctor.com'),(2,'Hwang','328472135','doctor9@doctor.com'),(3,'Park','348579111','doctor10@doctor.com'),(4,'Dung','239845673','doctor11@doctor.com'),(5,'Peter','349856738','doctor12@doctor.com'),(6,'Tom','0450909009','doctor1@doctor.com'),(7,'Nhiem','065909009','doctor2@doctor.com'),(8,'Nhien','087909009','doctor3@doctor.com'),(9,'Tao Chi','099569009','doctor4@doctor.com'),(10,'Chi Hoang','086409009','doctor5@doctor.com'),(11,'Nam Quang','090909123','doctor6@doctor.com'),(12,'Dau Tran','090909234','doctor7@doctor.com'),(13,'Alexander','654987123','elax@doctor.com');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_in_department`
--

DROP TABLE IF EXISTS `doctor_in_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_in_department` (
  `doctor_id` int NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`doctor_id`,`department_id`),
  KEY `department_id_idx` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_in_department`
--

LOCK TABLES `doctor_in_department` WRITE;
/*!40000 ALTER TABLE `doctor_in_department` DISABLE KEYS */;
INSERT INTO `doctor_in_department` VALUES (12,1),(3,2),(4,2),(5,2),(4,3),(5,3),(6,3),(5,4),(6,4),(7,4),(1,5),(6,5),(7,5),(8,5),(10,5),(2,6),(7,6),(8,6),(3,7),(8,7),(4,8),(2,9),(12,10),(1,11),(9,12),(11,12),(2,13),(3,15),(9,15),(10,16),(10,18),(11,19),(12,19),(1,20),(9,20),(11,20);
/*!40000 ALTER TABLE `doctor_in_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `method` enum('CARD','BANK TRANSFER','CASH') DEFAULT NULL,
  `card_id` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pay_book_id_idx` (`booking_id`),
  KEY `pay_card_id_idx` (`card_id`),
  CONSTRAINT `pay_book_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `pay_card_id` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'BANK TRANSFER',NULL,'transfer by ACB, ref: 232564'),(2,2,'BANK TRANSFER',NULL,'transfer by VCB, ref: 099123'),(3,3,'CASH',NULL,'BILL NO : 9541657'),(4,4,'CASH',NULL,'BILL NO : 8972132'),(5,5,'BANK TRANSFER',NULL,'transfer by NAB, ref: 054631'),(6,6,'BANK TRANSFER',NULL,'transfer by CMW, ref: 546547'),(7,7,'CARD',5,'VISA'),(8,8,'CASH',NULL,'BILL NO : 2132198'),(9,9,'CARD',6,'VISA'),(10,10,'BANK TRANSFER',NULL,'transfer by AAB, ref: 9871516'),(11,12,'CARD',7,'VISA'),(12,13,'BANK TRANSFER',NULL,'transfer by MOR, ref: 564873'),(13,14,'CASH',NULL,'BILL NO : 65489712'),(14,16,'CARD',8,'VISA');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_app_id_idx` (`appointment_id`),
  CONSTRAINT `result_app_id` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,1,'Need to go to directly hospital to take XRay'),(2,3,'Drink more vitamin C to improve health'),(3,4,'to go singapore to explore more about  cancer'),(4,11,'Buy panadol to ease the  headache, no problem');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-06 16:06:23

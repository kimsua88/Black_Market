CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `affiliation`
--

DROP TABLE IF EXISTS `affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliation` (
  `joinDate` varchar(45) DEFAULT NULL,
  `users_userid` varchar(45) NOT NULL,
  `grade_jobGradeCode` int NOT NULL,
  PRIMARY KEY (`users_userid`,`grade_jobGradeCode`),
  KEY `fk_affiliation_grade1_idx` (`grade_jobGradeCode`),
  CONSTRAINT `fk_affiliation_grade1` FOREIGN KEY (`grade_jobGradeCode`) REFERENCES `grade` (`jobGradeCode`),
  CONSTRAINT `fk_affiliation_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approvalStep`
--

DROP TABLE IF EXISTS `approvalStep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approvalStep` (
  `documentId` int NOT NULL,
  `approverId` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `actionDate` varchar(45) DEFAULT NULL,
  `users_userid` varchar(45) NOT NULL,
  `createApprovalDocument_documentId` int NOT NULL,
  `createApprovalDocument_users_userid` varchar(45) NOT NULL,
  PRIMARY KEY (`documentId`,`users_userid`,`createApprovalDocument_documentId`,`createApprovalDocument_users_userid`),
  KEY `fk_approvalStep_users1_idx` (`users_userid`),
  KEY `fk_approvalStep_createApprovalDocument1_idx` (`createApprovalDocument_documentId`,`createApprovalDocument_users_userid`),
  CONSTRAINT `fk_approvalStep_createApprovalDocument1` FOREIGN KEY (`createApprovalDocument_documentId`, `createApprovalDocument_users_userid`) REFERENCES `createApprovalDocument` (`documentId`, `users_userid`),
  CONSTRAINT `fk_approvalStep_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `createApprovalDocument`
--

DROP TABLE IF EXISTS `createApprovalDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `createApprovalDocument` (
  `documentId` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `rejectedReason` varchar(45) DEFAULT NULL,
  `approvalRequestExpense` varchar(45) DEFAULT NULL,
  `users_userid` varchar(45) NOT NULL,
  PRIMARY KEY (`documentId`,`users_userid`),
  KEY `fk_createApprovalDocument_users1_idx` (`users_userid`),
  CONSTRAINT `fk_createApprovalDocument_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `createNotice`
--

DROP TABLE IF EXISTS `createNotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `createNotice` (
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `photo` blob,
  `users_userid` varchar(45) NOT NULL,
  PRIMARY KEY (`users_userid`),
  CONSTRAINT `fk_createNotice_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daffiliation`
--

DROP TABLE IF EXISTS `daffiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daffiliation` (
  `store_storeCode` int NOT NULL,
  `users_userid1` varchar(45) NOT NULL,
  PRIMARY KEY (`store_storeCode`,`users_userid1`),
  KEY `fk_daffiliation_store1_idx` (`store_storeCode`),
  KEY `fk_daffiliation_users1_idx` (`users_userid1`),
  CONSTRAINT `fk_daffiliation_store1` FOREIGN KEY (`store_storeCode`) REFERENCES `store` (`storeCode`),
  CONSTRAINT `fk_daffiliation_users1` FOREIGN KEY (`users_userid1`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatch` (
  `dispatchedQuantity` int DEFAULT NULL,
  `dispatchDate` varchar(45) DEFAULT NULL,
  `users_userid` varchar(45) NOT NULL,
  `Purchase_purchaseId` int NOT NULL,
  `Purchase_users_userid` varchar(45) NOT NULL,
  `Purchase_store_storeCode` int NOT NULL,
  `Purchase_products_productsCode` int NOT NULL,
  PRIMARY KEY (`users_userid`,`Purchase_purchaseId`,`Purchase_users_userid`,`Purchase_store_storeCode`,`Purchase_products_productsCode`),
  KEY `fk_dispatch_Purchase1_idx` (`Purchase_purchaseId`,`Purchase_users_userid`,`Purchase_store_storeCode`),
  CONSTRAINT `fk_dispatch_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `jobGradeCode` int NOT NULL,
  `gradeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`jobGradeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `manufacturerName` varchar(45) NOT NULL,
  PRIMARY KEY (`manufacturerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oders`
--

DROP TABLE IF EXISTS `oders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oders` (
  `orderId` int NOT NULL,
  `orderStatus` varchar(45) DEFAULT NULL,
  `orderQuantity` varchar(45) DEFAULT NULL,
  `orderDate` varchar(45) DEFAULT NULL,
  `manufacturers_manufacturerName` varchar(45) NOT NULL,
  `users_userid` varchar(45) NOT NULL,
  `products_productsCode` int NOT NULL,
  PRIMARY KEY (`orderId`,`manufacturers_manufacturerName`,`users_userid`,`products_productsCode`),
  KEY `fk_oders_manufacturers1_idx` (`manufacturers_manufacturerName`),
  KEY `fk_oders_users1_idx` (`users_userid`),
  CONSTRAINT `fk_oders_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productRegistration`
--

DROP TABLE IF EXISTS `productRegistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productRegistration` (
  `ptitle` text,
  `contentBlocks` longblob,
  `introductionPhoto` longblob,
  `users_userid` varchar(45) NOT NULL,
  `products_productsCode` int NOT NULL,
  PRIMARY KEY (`users_userid`,`products_productsCode`),
  CONSTRAINT `fk_productRegistration_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productsCode` int NOT NULL AUTO_INCREMENT,
  `productsName` varchar(45) DEFAULT NULL,
  `productsImage` longblob,
  `productsColor` varchar(45) DEFAULT NULL,
  `productsSize` int DEFAULT NULL,
  `productsOPrice` int DEFAULT NULL,
  `productsPrice` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productsCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Purchase` (
  `purchaseId` int NOT NULL,
  `purchasePrice` int DEFAULT NULL,
  `PurchaseQuanity` int DEFAULT NULL,
  `PurchaseDate` varchar(45) DEFAULT NULL,
  `PurchaseCardId` varchar(45) DEFAULT NULL,
  `PurchaseDeliveryStatus` varchar(45) DEFAULT NULL,
  `users_userid` varchar(45) NOT NULL,
  `products_productsCode` int NOT NULL,
  `store_storeCode` int NOT NULL,
  PRIMARY KEY (`purchaseId`,`users_userid`,`products_productsCode`,`store_storeCode`),
  KEY `fk_Purchase_users1_idx` (`users_userid`),
  KEY `fk_Purchase_products1_idx` (`products_productsCode`),
  KEY `fk_Purchase_store1_idx` (`store_storeCode`),
  CONSTRAINT `fk_Purchase_store1` FOREIGN KEY (`store_storeCode`) REFERENCES `store` (`storeCode`),
  CONSTRAINT `fk_Purchase_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `return`
--

DROP TABLE IF EXISTS `return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `return` (
  `returnCategory` varchar(45) DEFAULT NULL,
  `returnDate` varchar(45) DEFAULT NULL,
  `prosessionStateus` varchar(45) DEFAULT NULL,
  `returnReason` varchar(45) DEFAULT NULL,
  `resolution` varchar(45) DEFAULT NULL,
  `recordDate` varchar(45) DEFAULT NULL,
  `users_userid` varchar(45) NOT NULL,
  `Purchase_purchaseId` int NOT NULL,
  `Purchase_users_userid` varchar(45) NOT NULL,
  `Purchase_store_storeCode` int NOT NULL,
  `Purchase_products_productsCode` int NOT NULL,
  PRIMARY KEY (`users_userid`,`Purchase_purchaseId`,`Purchase_users_userid`,`Purchase_store_storeCode`,`Purchase_products_productsCode`),
  KEY `fk_return_Purchase1_idx` (`Purchase_purchaseId`,`Purchase_users_userid`,`Purchase_store_storeCode`),
  CONSTRAINT `fk_return_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockReceipts`
--

DROP TABLE IF EXISTS `stockReceipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockReceipts` (
  `stockReceiptsQuantityReceived` int NOT NULL,
  `stockReceiptsReceipDate` varchar(45) DEFAULT NULL,
  `manufacturers_manufacturerName` varchar(45) NOT NULL,
  `users_userid` varchar(45) NOT NULL,
  `products_productsCode` int NOT NULL,
  PRIMARY KEY (`stockReceiptsQuantityReceived`,`manufacturers_manufacturerName`,`users_userid`,`products_productsCode`),
  KEY `fk_stockReceipts_manufacturers1_idx` (`manufacturers_manufacturerName`),
  KEY `fk_stockReceipts_users1_idx` (`users_userid`),
  CONSTRAINT `fk_stockReceipts_users1` FOREIGN KEY (`users_userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `storeCode` int NOT NULL,
  `storeName` varchar(45) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`storeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `birthDate` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `memberType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 11:07:05

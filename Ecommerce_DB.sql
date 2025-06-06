-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Temporary view structure for view `customer_sales_summary`
--

DROP TABLE IF EXISTS `customer_sales_summary`;
/*!50001 DROP VIEW IF EXISTS `customer_sales_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_sales_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `name`,
 1 AS `total_spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice Johnson','alice@gmail.com','9876543210','New York'),(2,'Bob Smith','bob@gmail.com','8765432109','California'),(3,'Charlie Lee','charlie@gmail.com','7654321098','Texas'),(4,'David Kim','david.kim@gmail.com','7543210987','Washington'),(5,'Evelyn Clark','evelyn.clark@gmail.com','7432109876','Florida'),(6,'Frank Wright','frank.wright@gmail.com','7321098765','Illinois'),(7,'Grace Hall','grace.hall@gmail.com','7210987654','Ohio'),(8,'Hannah Adams','hannah.adams@gmail.com','7109876543','Georgia'),(9,'Ian Baker','ian.baker@gmail.com','7098765432','Nevada'),(10,'Jackie Chen','jackie.chen@gmail.com','6987654321','Oregon'),(11,'Karen Davis','karen.davis@gmail.com','6876543210','Colorado'),(12,'Liam Evans','liam.evans@gmail.com','6765432109','Michigan'),(13,'Mia Foster','mia.foster@gmail.com','6654321098','Arizona'),(14,'Nathan Gray','nathan.gray@gmail.com','6543210987','Indiana'),(15,'Olivia Harris','olivia.harris@gmail.com','6432109876','Tennessee'),(16,'Paul Irving','paul.irving@gmail.com','6321098765','Missouri'),(17,'Queenie Jones','queenie.jones@gmail.com','6210987654','Louisiana'),(18,'Ryan King','ryan.king@gmail.com','6109876543','Kentucky'),(19,'Sophia Lee','sophia.lee@gmail.com','6098765432','Alabama'),(20,'Tommy Nelson','tommy.nelson@gmail.com','5987654321','Massachusetts');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,201,101,1,799.99),(2,202,111,1,149.99),(3,203,104,1,999.99),(4,204,103,1,349.99),(5,205,112,1,180.00),(6,206,120,1,59.99),(7,207,108,1,129.95),(8,208,116,1,549.99),(9,209,109,1,49.99),(10,210,117,1,139.99),(11,211,118,1,119.95),(12,212,119,1,649.99),(13,213,111,1,150.00),(14,214,120,1,59.99),(15,215,104,1,999.99),(16,216,107,1,399.99),(17,217,105,1,849.50),(18,218,110,1,39.99),(19,219,111,1,150.00),(20,220,101,1,799.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_order_date` (`order_date`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (201,1,'2025-05-01',799.99),(202,2,'2025-05-02',149.99),(203,3,'2025-05-03',999.99),(204,4,'2025-05-03',349.99),(205,5,'2025-05-04',180.00),(206,6,'2025-05-04',59.99),(207,7,'2025-05-05',129.95),(208,8,'2025-05-05',549.99),(209,9,'2025-05-06',49.99),(210,10,'2025-05-06',139.99),(211,11,'2025-05-07',119.95),(212,12,'2025-05-08',649.99),(213,13,'2025-05-08',150.00),(214,14,'2025-05-09',59.99),(215,15,'2025-05-09',999.99),(216,16,'2025-05-10',399.99),(217,17,'2025-05-10',849.50),(218,18,'2025-05-11',39.99),(219,19,'2025-05-12',150.00),(220,20,'2025-05-12',799.99);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (301,201,'2025-05-01','Credit Card',799.99),(302,202,'2025-05-02','UPI',149.99),(303,203,'2025-05-03','Credit Card',999.99),(304,204,'2025-05-03','Net Banking',349.99),(305,205,'2025-05-04','Debit Card',180.00),(306,206,'2025-05-04','Cash on Delivery',59.99),(307,207,'2025-05-05','Credit Card',129.95),(308,208,'2025-05-05','UPI',549.99),(309,209,'2025-05-06','Net Banking',49.99),(310,210,'2025-05-06','Credit Card',139.99),(311,211,'2025-05-07','Credit Card',119.95),(312,212,'2025-05-08','Debit Card',649.99),(313,213,'2025-05-08','UPI',150.00),(314,214,'2025-05-09','Cash on Delivery',59.99),(315,215,'2025-05-09','Credit Card',999.99),(316,216,'2025-05-10','Net Banking',399.99),(317,217,'2025-05-10','UPI',849.50),(318,218,'2025-05-11','Debit Card',39.99),(319,219,'2025-05-12','UPI',150.00),(320,220,'2025-05-12','Credit Card',799.99);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (101,'Apple iPhone 14','Electronics',799.99,50),(102,'Samsung Galaxy S22','Electronics',699.99,45),(103,'Sony WH-1000XM4 Headphones','Audio',349.99,30),(104,'Dell XPS 13 Laptop','Computers',999.99,20),(105,'HP Pavilion Gaming Laptop','Computers',849.50,15),(106,'Canon EOS 1500D DSLR','Cameras',599.00,12),(107,'Apple Watch Series 8','Wearables',399.99,40),(108,'Fitbit Charge 5','Wearables',129.95,25),(109,'Amazon Echo Dot (5th Gen)','Smart Home',49.99,60),(110,'Google Nest Mini','Smart Home',39.99,55),(111,'Nike Air Max 270','Footwear',150.00,35),(112,'Adidas Ultraboost 22','Footwear',180.00,28),(113,'Logitech MX Master 3 Mouse','Accessories',99.99,75),(114,'Razer BlackWidow Keyboard','Accessories',129.99,20),(115,'Samsung 4K UHD TV 55\"','Electronics',599.99,10),(116,'LG 4K Smart TV 50\"','Electronics',549.99,8),(117,'Kindle Paperwhite','Books & Media',139.99,22),(118,'JBL Flip 6 Bluetooth Speaker','Audio',119.95,33),(119,'Asus ROG Strix GPU','Computers',649.99,5),(120,'WD 1TB External HDD','Storage',59.99,65);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_sales_summary`
--

/*!50001 DROP VIEW IF EXISTS `customer_sales_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_sales_summary` AS select `c`.`customer_id` AS `customer_id`,`c`.`name` AS `name`,sum(`o`.`total_amount`) AS `total_spent` from (`customers` `c` join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) group by `c`.`customer_id`,`c`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 20:17:57

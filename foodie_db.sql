-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Foodie
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.10.1

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `image_url` varchar(2000) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_UN` (`username`),
  UNIQUE KEY `client_UN_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (49,'email_example14','Cameron','Ord','2023-06-27','image_url','Nucken14','password'),(50,'email@outlook.com','Cameron','Ord','2023-06-29','avatar','Nuckeeeeen','password');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session`
--

DROP TABLE IF EXISTS `client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_session_UN` (`token`),
  KEY `client_session_FK` (`client_id`),
  CONSTRAINT `client_session_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session`
--

LOCK TABLES `client_session` WRITE;
/*!40000 ALTER TABLE `client_session` DISABLE KEYS */;
INSERT INTO `client_session` VALUES (105,'7f39c3649ff84b51b66c39bcc3fe1d10',49,'2023-06-27'),(106,'135c6861f9b14fddae021b73bc56b7fc',49,'2023-06-28'),(107,'4c49d6ac72f645748e4fa14ba84180c6',50,'2023-06-29'),(108,'12b828ff606c4c08a1af38ade4cc5d1f',49,'2023-06-29'),(109,'f1634dfe646b4c41b8d77388adc07983',49,'2023-06-30');
/*!40000 ALTER TABLE `client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(125) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `image_url` varchar(2000) DEFAULT NULL,
  `restaurant_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_item_FK` (`restaurant_id`),
  CONSTRAINT `menu_item_FK` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (16,'a pizza','Pepperoni Pizza',25,'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_center,w_730,h_913/k%2FPhoto%2FRecipe%20Ramp%20Up%2F2021-07-Chicken-Alfredo-Pizza%2FChicken-Alfredo-Pizza-KitchnKitchn2970-1_01',21),(17,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(18,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(19,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(20,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(21,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(22,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(23,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(24,'a pizza','Pepperoni Pizza',25,'picture of pizza',21),(25,'a pizza','Pepperoni Pizza',25,'picture of pizza',21);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_menu_item`
--

DROP TABLE IF EXISTS `order_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_menu_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `menu_item_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_menu_item_FK` (`order_id`),
  KEY `order_menu_item_FK_1` (`menu_item_id`),
  CONSTRAINT `order_menu_item_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_menu_item_FK_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menu_item`
--

LOCK TABLES `order_menu_item` WRITE;
/*!40000 ALTER TABLE `order_menu_item` DISABLE KEYS */;
INSERT INTO `order_menu_item` VALUES (118,74,16),(119,74,16),(120,74,16),(121,74,16),(122,74,16),(123,74,16),(124,74,16);
/*!40000 ALTER TABLE `order_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `restaurant_id` int(10) unsigned DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_FK` (`client_id`),
  KEY `orders_FK_1` (`restaurant_id`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_FK_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (74,49,21,0,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `profile_url` varchar(2000) DEFAULT NULL,
  `banner_url` varchar(2000) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_UN_email` (`email`),
  UNIQUE KEY `restaurant_UN_phone` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (16,'restemail','Pizza Godz','address','509-109-2372','bio','city','url','https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg','password'),(18,'restemail2','Lords of Pizza','address','509-109-6372','bio','city','url','https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg','password'),(19,'restemail3','Denizens of Godly Pizza God','address','509-109-3372','bio','city','url','https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg','password'),(20,'restemail4','Lordly pizza of the heavenly delights','address','509-109-7372','bio','city','url','https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg','password'),(21,'restemail5','Pizza of the Italian Incarnate','address','509-109-7572','bio','city','url','https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/800px-Pizza-3007395.jpg','password');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_session`
--

DROP TABLE IF EXISTS `restaurant_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) DEFAULT NULL,
  `restaurant_id` int(10) unsigned DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_session_UN` (`token`),
  KEY `restaurant_session_FK` (`restaurant_id`),
  CONSTRAINT `restaurant_session_FK` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_session`
--

LOCK TABLES `restaurant_session` WRITE;
/*!40000 ALTER TABLE `restaurant_session` DISABLE KEYS */;
INSERT INTO `restaurant_session` VALUES (16,'c003130756074482bd604c67d28d9e80',16,'2023-06-29'),(17,'c288ba8b5e9343008ce362202447716a',18,'2023-06-29'),(18,'9495fce558d44e2886c45f9e371fb805',19,'2023-06-29'),(19,'20ad5254c7384c71b638f34a43f9fa3f',20,'2023-06-29'),(20,'2be234aeb9e94ac994da5c98752d7f31',21,'2023-06-29'),(21,'c20afedb98054f4bb8c49c4a9ec73079',21,'2023-06-29');
/*!40000 ALTER TABLE `restaurant_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Foodie'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `client_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `client_login`(email_input varchar(100), password_input varchar(100), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	insert into client_session (client_id, token, created_at) values ((select client.id from client WHERE email=email_input and password = password_input), token_input, now());
	select convert(token using "utf8") as token, client_id 
	from client_session inner join client on client_id = client.id 
	where client_session.token = token_input and password = password_input and email = email_input;
	delete client_session from client_session where created_at < (now() - INTERVAL 1 DAY) and (select email from client where email=email_input);
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `client_logout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `client_logout`(token_input varchar (200))
    MODIFIES SQL DATA
BEGIN
	delete client_session from client_session where token = token_input;
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `client_post_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `client_post_order`(restaurant_id_input int unsigned, menu_item_input varchar(100), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	declare menu_item varchar(200) default '';
	declare client_id_input int unsigned default 0;
	declare rows_inserted int default 0;
	set menu_item_input = replace(menu_item_input, '[', '');
	set menu_item_input = replace(menu_item_input, ']', '');
	set client_id_input = (select client_id from client_session where token = token_input);
	insert into orders(client_id, restaurant_id, is_confirmed, is_complete) VALUES(client_id_input,restaurant_id_input, false, false);
	while length(menu_item_input) > 0 do
		set menu_item = trim(SUBSTRING_INDEX(menu_item_input, ',', 1));
		set menu_item_input = TRIM(SUBSTRING(menu_item_input, length(menu_item) + 2));
		insert into order_menu_item(order_id, menu_item_id) VALUES((select id from orders where client_id = client_id_input order by id DESC  limit 1 ),menu_item);
		
		set rows_inserted = rows_inserted + 1;
	end while;
	select rows_inserted;
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `concat_practice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `concat_practice`()
BEGIN
	declare first_name varchar(100);
	declare last_name varchar(100);
	SET first_name = 'John';
    SET last_name = 'Doe';

    SELECT CONCAT(first_name, ' ', last_name) AS full_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_client`(password_input varchar(100), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	delete client from client inner join client_session on client_id = client.id where password = password_input and token = token_input;
	select	row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_menu_item`(menu_id_input int unsigned)
    MODIFIES SQL DATA
BEGIN
	delete menu_item from menu_item where menu_item.id = menu_id_input;
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_restaurant`(password_input varchar(100), token_input varchar(250))
    MODIFIES SQL DATA
BEGIN
	delete restaurant from restaurant inner join restaurant_session on restaurant_id = restaurant.id where password = password_input and token = token_input;
	select	row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `example` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `example`(menu_item_input varchar(200), client_id_input int unsigned, restaurant_id_input int unsigned)
    MODIFIES SQL DATA
BEGIN
	set menu_item_input = replace(menu_item_input, '[', '(');
    set menu_item_input = replace(menu_item_input, ']', ')');
    set menu_item_input = replace(menu_item_input, ',', concat(',', client_id_input, ',', restaurant_id_input, false, false, '),('));
    prepare stmt from concat('insert into orders(menu_items, client_id, restaurant_id, is_confirmed, is_completed) values', menu_item_input);
    EXECUTE stmt;
    SELECT ROW_COUNT(); 
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_restaurants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_restaurants`()
BEGIN
	select convert(email using "utf8") as email, convert(name using "utf8") as name, convert(address using "utf8") as address , convert(phone_number using "utf8") as phone_number, convert(bio using "utf8") as bio, convert(city using "utf8") as city, convert(profile_url using "utf8") as profile_url, convert(banner_url using "utf8") as banner_url, id from restaurant;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_client`(client_id_input int unsigned)
BEGIN
	select 
	convert(client.created_at using "utf8" ) as created_at,
	convert(email using "utf8" ) as email,
	convert(first_name using "utf8" ) as first_name,
	convert(last_name using "utf8" ) as last_name, client.id,
	convert(image_url using "utf8" ) as image_url,
	convert(username using "utf8" ) as username from client 
	where client_id_input = client.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_client_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_client_order`(token_input varchar(200), is_confirmed_input BOOL, is_complete_input BOOL)
BEGIN
	
	if is_confirmed_input IS NOT NULL and is_complete_input IS NOT NULL then
	select  is_confirmed, is_complete, convert(name using "utf8") as name, price,menu_item_id, order_id from order_menu_item inner join orders on order_id=orders.id inner join menu_item on menu_item.id = menu_item_id where is_confirmed = is_confirmed_input and is_complete = is_complete_input and client_id = (select client_id from client_session where token=token_input);
	elseif is_confirmed_input is NOT NULL and is_complete_input is NULL then
    select convert(name using "utf8") as name, price,menu_item_id, order_id from order_menu_item inner join orders on order_id=orders.id inner join menu_item on menu_item.id = menu_item_id where is_confirmed = is_confirmed_input and client_id = (select client_id from client_session where token=token_input);
	elseif is_confirmed_input is NULL and is_complete_input is NOT NULL then
    select convert(name using "utf8") as name, price,menu_item_id, order_id from order_menu_item inner join orders on order_id=orders.id inner join menu_item on menu_item.id = menu_item_id where is_complete = is_complete_input and client_id = (select client_id from client_session where token=token_input);
	end if;   
	   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_menu_item`(restaurant_id_input int unsigned)
    MODIFIES SQL DATA
BEGIN
	select 
	convert(description using "utf8") as description,
	convert(image_url using "utf8") as image_url,
	convert(name using "utf8") as name,
	id,
	price
    from menu_item where restaurant_id = restaurant_id_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_restaurant`(rest_id_input int unsigned)
BEGIN
	select 
	convert(email using "utf8") as email,
	convert(name using "utf8") as name,
	convert(address using "utf8") as address,
	convert(phone_number using "utf8") as phone_number,
	convert(bio using "utf8") as bio,
	convert(city using "utf8") as city,
	convert(profile_url using "utf8") as profile_url,
	convert(banner_url using "utf8") as banner_url
	from restaurant
	where rest_id_input=restaurant.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_client`(email_input VARCHAR(100), first_name_input VARCHAR(100), last_name_input VARCHAR(100), image_input VARCHAR(2000), username_input VARCHAR(100), password_input VARCHAR(100), token_input varchar(300))
    MODIFIES SQL DATA
BEGIN
	insert into client (email, first_name, last_name, image_url, username, password, created_at)
	values (email_input, first_name_input, last_name_input, image_input, username_input, password_input, now());
	insert into client_session (client_id, token, created_at) values ((select client.id from client WHERE email=email_input and password = password_input), token_input, now());
	select convert(token using "utf8") as token, client_id from client_session inner join client on client_id=client.id where client_session.token = token_input and password = password_input and email = email_input;
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_menu_item`(desc_input varchar(200), image_input varchar(2000), name_input varchar(100), price_input int(11), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	insert into menu_item (description, image_url, name, price, restaurant_id)
	values (desc_input, image_input, name_input, price_input, (select restaurant_id from restaurant_session where token=token_input limit 1));
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_restaurant`(email_input varchar(100), password_input varchar(100), name_input varchar(100), address_input varchar (100), phone_number_input varchar (100), bio_input varchar(300), city_input varchar(100), profile_url_input varchar(100), banner_url_input varchar(2000), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	insert into restaurant
	(
	email,
	password,
	name,
	address,
	phone_number, 
	bio,
	city, 
	profile_url,
	banner_url
	)
	values 
	(
	email_input,
	password_input,
	name_input,
	address_input,
	phone_number_input, 
	bio_input,
	city_input, 
	profile_url_input,
	banner_url_input
	);
	insert into restaurant_session 
	(
	restaurant_id,
	token,
	created_at) 
	values 
	(
	(select restaurant.id from restaurant WHERE email=email_input and password = password_input),
	token_input,
	now());
	select 
	convert(token using "utf8") as token, 
	restaurant_id 
	from restaurant_session
	inner join restaurant on restaurant_id=restaurant.id 
	where restaurant_session.token = token_input and password = password_input and email = email_input;
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `restaurant_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `restaurant_login`(email_input varchar(100), password_input varchar(100), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	insert into restaurant_session (restaurant_id, token, created_at) values ((select restaurant.id from restaurant WHERE email=email_input and password = password_input), token_input, now());
	select convert(token using "utf8") as token, restaurant_id 
	from restaurant_session inner join restaurant on restaurant_id = restaurant.id 
	where restaurant_session.token = token_input and password = password_input and email = email_input;
	delete restaurant_session from restaurant_session where created_at < (now() - INTERVAL 1 DAY) and (select email from restaurant where email=email_input);
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `restaurant_logout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `restaurant_logout`(token_input varchar(200))
BEGIN
	delete restaurant_session from restaurant_session where token = token_input;
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `restaurant_patch_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `restaurant_patch_order`(order_id_input int unsigned)
    MODIFIES SQL DATA
BEGIN
	declare is_confirmed_value BOOL;
	declare is_complete_value BOOL;
	set is_confirmed_value = (select is_confirmed from orders where orders.id=order_id_input);
	set is_complete_value = (select is_complete from orders where orders.id=order_id_input);
	
	if is_confirmed_value = 0 then
	   update orders SET is_confirmed = 1 where orders.id = order_id_input;
	elseif is_confirmed_value = 1 and is_complete_value = 0 THEN 
	   update orders set is_complete = 1 where orders.id = order_id_input;
	end if;
   select row_count();  
   commit;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rest_get_client_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rest_get_client_order`(token_input varchar(200), is_confirmed_input BOOL, is_complete_input BOOL)
BEGIN
	if is_confirmed_input is NOT NULL and is_complete_input is NOT NULL then
	select is_confirmed, is_complete, convert(name using "utf8") as name, price,menu_item_id, order_id from order_menu_item inner join orders on order_id=orders.id inner join menu_item on menu_item.id = menu_item_id where is_confirmed = is_confirmed_input and is_complete = is_complete_input and orders.restaurant_id = (select restaurant_id from restaurant_session where token=token_input);
	elseif is_confirmed_input is NOT NULL and is_complete_input is NULL then
    select is_confirmed, is_complete, convert(name using "utf8") as name, price,menu_item_id, order_id from order_menu_item inner join orders on order_id=orders.id inner join menu_item on menu_item.id = menu_item_id where is_confirmed = is_confirmed_input and orders.restaurant_id = (select restaurant_id from restaurant_session where token=token_input);
	elseif is_confirmed_input is NULL and is_complete_input is NOT NULL then
    select is_confirmed, is_complete, convert(name using "utf8") as name, price,menu_item_id, order_id from order_menu_item inner join orders on order_id=orders.id inner join menu_item on menu_item.id = menu_item_id where is_complete = is_complete_input and orders.restaurant_id = (select restaurant_id from restaurant_session where token=token_input);
	end if;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_client`(email_input varchar(100), first_name_input varchar(100), last_name_input varchar(100), image_input varchar(2000), username_input varchar(100), password_input varchar(100), token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	UPDATE client inner join client_session on client.id = client_id 
	SET 
	email = IFNULL(email_input, email), 
	first_name = IFNULL(first_name_input,first_name),
	last_name = IFNULL(last_name_input,last_name),
	image_url = IFNULL(image_input,image_url),
	username = IFNULL(username_input,username),
	password = IFNULL(password_input,password)
	where  token=token_input;
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_menu_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_menu_item`(desc_input varchar(300), image_input varchar(2000), name_input varchar(100), price_input int(10),  menu_id_input int unsigned, token_input varchar(200))
    MODIFIES SQL DATA
BEGIN
	UPDATE menu_item inner join restaurant_session on restaurant_session.restaurant_id = (select restaurant_id from restaurant_session where token = token_input)
	SET 
	description = IFNULL(desc_input, description),
	image_url = IFNULL(image_input, image_url),
	name = IFNULL(name_input, name),
	price = IFNULL(price_input, price)
	where token=token_input and menu_item.id = menu_id_input;
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_restaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_restaurant`(email_input varchar(100), name_input varchar(100), address_input varchar(100), phone_number_input varchar(100), bio_input varchar(300), city_input varchar(100), profile_url_input varchar(2000), banner_url_input varchar(2000), password_input varchar(100), token_input varchar(250))
    MODIFIES SQL DATA
BEGIN
	UPDATE restaurant inner join restaurant_session on restaurant.id = (select restaurant_id from restaurant_session where token=token_input) 
	SET 
	email = IFNULL(email_input, email), 
	name = IFNULL(name_input, name),
	address = IFNULL(address_input, address),
	phone_number = IFNULL(phone_number_input, phone_number),
	bio = IFNULL(bio_input, bio),
	city = IFNULL(city_input, city),
	profile_url = IFNULL(profile_url_input, profile_url),
	banner_url = IFNULL(banner_url_input, banner_url),
	password = IFNULL(password_input, password)
	where  token=token_input;
	select row_count();
	commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-30  2:03:33

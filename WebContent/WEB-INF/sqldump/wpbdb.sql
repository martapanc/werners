-- MySQL dump 10.13  Distrib 5.7.16, for osx10.12 (x86_64)
--
-- Host: localhost    Database: wpbdb
-- ------------------------------------------------------
-- Server version	5.7.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `wpbdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wpbdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wpbdb`;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `vip_status` bit(1) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_e6gkqunxajvyxl5uctpl2vl2p` (`email`),
  KEY `FK2iwi278tiwgkgwsu0hl8alwpw` (`role_id`),
  CONSTRAINT `FK2iwi278tiwgkgwsu0hl8alwpw` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,63,'/restaurantProject/dist/img/gusteau160x160.jpg',NULL,'2017-01-08 15:47:57','overlord@wpb.it','Chuck Norris','$2a$10$iqRz4zDwGjm2SCDoTcVjUeV0Oc7J41qTWr27ezQtKF89qh27GjVOi',NULL,0,'\0',5),(7,0,'/restaurantProject/dist/img/gusteau160x160.jpg',NULL,'2017-01-08 15:47:57','admin@wpb.it','I am God','$2a$10$qH7CkN7xnqHDh8HWz/YtgOMXt3AxaB672c5vieusO4u0BrXw1vu0G',NULL,0,'\0',1),(8,0,'/restaurantProject/dist/img/gusteau160x160.jpg',NULL,'2017-01-08 15:47:58','marta@wpb.it','Marta Pancaldi','$2a$10$KEqpDOakVx4OqwIxQMD59O4EGVYRvgPtWPysbq7QicOJ3q07vtaVW',NULL,0,'\0',3),(9,0,'/restaurantProject/dist/img/gusteau160x160.jpg',NULL,'2017-01-08 15:47:58','werner@wpb.it','Werner Sperandio','$2a$10$UYsMdy4kwNVAoeMvWneHXupEr0NNZKcZIEiZ4OBUOyNF5ZnTyZ1NW',NULL,0,'\0',2),(10,2,'/restaurantProject/dist/img/gusteau160x160.jpg',NULL,'2017-01-08 15:47:58','giulia@wpb.it','Giulia','$2a$10$/WhsvD5OIFAHzSJPG/20weGyVMX1z.dgo4F.YzGSYZUtPmR89No3O',NULL,0,'\0',4),(227,2,'/restaurantProject/dist/img/avatar1.png',NULL,'2017-01-09 14:45:26','giovannino@yahoo.it','Giovanni','$2a$10$bU5C5heVS6bY7bBrO0uF9eSeHqUAqZfC8v2IS6Lisvc0GcHU6/S4O',NULL,0,'\0',4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_control_list`
--

DROP TABLE IF EXISTS `access_control_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_control_list` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `delete_Permission` bit(1) DEFAULT NULL,
  `insert_permission` bit(1) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `update_permission` bit(1) DEFAULT NULL,
  `view_permission` bit(1) DEFAULT NULL,
  `USER_TYPE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ansxk2tevgl9f0rjauhdjpr9` (`USER_TYPE_ID`),
  CONSTRAINT `FK4ansxk2tevgl9f0rjauhdjpr9` FOREIGN KEY (`USER_TYPE_ID`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_control_list`
--

LOCK TABLES `access_control_list` WRITE;
/*!40000 ALTER TABLE `access_control_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_control_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_class`
--

DROP TABLE IF EXISTS `food_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_class` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c87dhk77dfvs15c9em4ld2e9u` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_class`
--

LOCK TABLES `food_class` WRITE;
/*!40000 ALTER TABLE `food_class` DISABLE KEYS */;
INSERT INTO `food_class` VALUES (41,0,'Pizza'),(42,0,'Burger'),(43,0,'Chinese'),(44,0,'Salad'),(45,0,'Dessert'),(46,0,'Drink');
/*!40000 ALTER TABLE `food_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('default',387);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `available` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double DEFAULT NULL,
  `foodClass_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqibklpch3jj964w3842ex0j5e` (`foodClass_id`),
  CONSTRAINT `FKqibklpch3jj964w3842ex0j5e` FOREIGN KEY (`foodClass_id`) REFERENCES `food_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (47,1,'','Margherita',5.5,41),(48,2,'','Marescialla',5.5,41),(49,1,'','Quattro stagioni',7,41),(50,0,'\0','Tonno Cipolla',6,41),(51,0,'','San Daniele',9,41),(52,0,'\0','Primavera',6.7,41),(53,0,'','Capricciosa',7.5,41),(54,15,'','Hot Dog',3.5,42),(55,0,'','Chicken Burger',3.7,42),(56,4,'\0','Double Cheeseburger',5.5,42),(57,4,'','McChicken',4.8,42),(58,1,'','Burger Royal',5.5,42),(59,0,'\0','Hawaiian Toast',5,42),(60,0,'','BauernToast',4.3,42),(61,0,'','Chinese noodles',5.5,43),(62,1,'\0','Zhajiangmian',6.7,43),(63,2,'\0','Fried Rice',3.5,43),(64,1,'\0','Kung Pao chicken',7.8,43),(65,0,'','Wonton',6,43),(66,0,'\0','Zongzi',6.7,43),(67,1,'','Peking Duck',8,43),(68,1,'','Cesar Salad',4.5,44),(69,0,'','Chicken Salad',6.7,44),(70,0,'\0','Russian Salad',5.5,44),(71,1,'\0','Tomato Salad',6.8,44),(72,0,'','Potatoe Salad',4.4,44),(73,1,'','Fresh Salad',6.7,44),(74,0,'\0','Rice Salad',4.2,44),(75,0,'','Brownies',4.5,45),(76,2,'','Ice Cream',6.7,45),(77,0,'\0','Surprise',12,45),(78,2,'\0','Mousse',6.8,45),(79,1,'','Sacher',4.4,45),(80,2,'','Marshmallows',6.7,45),(81,0,'\0','Affogato',4.2,45),(82,0,'','Green Tea',1.5,46),(83,0,'','Lemon Soda',2.7,46),(84,0,'\0','Fizzy Water',1.5,46),(85,1,'\0','Beer',2.8,46),(86,1,'','Red Wine',4.4,46),(87,0,'','White Wine',3.7,46),(88,0,'','Sprite',1.2,46);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKija6hjjiit8dprnmvtvgdp6ru` (`item_id`),
  CONSTRAINT `FKija6hjjiit8dprnmvtvgdp6ru` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (90,0,'this is item with id 5 and qty 10',10,NULL),(92,1,'sample comment',7,NULL),(93,1,'this is item with id 5 and qty 10',10,NULL),(176,0,NULL,4,54),(177,0,NULL,2,57),(179,0,NULL,3,54),(181,0,NULL,1,56),(182,0,NULL,2,54),(184,0,NULL,1,56),(185,0,NULL,2,54),(187,0,NULL,3,54),(188,0,NULL,2,47),(190,0,NULL,3,54),(191,0,NULL,1,79),(192,0,NULL,1,76),(193,0,NULL,1,80),(195,0,NULL,2,62),(196,0,NULL,1,54),(197,0,NULL,1,80),(199,0,NULL,2,78),(200,0,NULL,1,64),(201,0,NULL,1,58),(202,0,NULL,3,85),(203,0,NULL,1,49),(204,0,NULL,1,73),(206,0,NULL,5,63),(207,0,NULL,1,78),(208,0,NULL,2,48),(209,0,NULL,2,54),(211,0,NULL,1,56),(212,0,NULL,1,54),(216,0,NULL,3,54),(217,0,NULL,1,57),(319,0,NULL,3,54),(321,0,NULL,3,54),(323,0,NULL,2,54),(329,0,NULL,3,54),(335,0,NULL,1,57),(338,0,NULL,1,57),(340,0,NULL,1,48),(341,0,NULL,2,76),(342,0,NULL,1,67),(343,0,NULL,1,68),(347,0,NULL,1,54),(372,0,NULL,2,56),(373,0,NULL,1,63),(374,0,NULL,3,86),(375,0,NULL,1,71);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item__table_order`
--

DROP TABLE IF EXISTS `order_item__table_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item__table_order` (
  `table_order_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`table_order_id`,`order_item_id`),
  KEY `FK9ntdv80hks55regqvvn38j0ar` (`order_item_id`),
  CONSTRAINT `FK2urcmv9k3layhhul8cf1lufrx` FOREIGN KEY (`table_order_id`) REFERENCES `table_order` (`id`),
  CONSTRAINT `FK9ntdv80hks55regqvvn38j0ar` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item__table_order`
--

LOCK TABLES `order_item__table_order` WRITE;
/*!40000 ALTER TABLE `order_item__table_order` DISABLE KEYS */;
INSERT INTO `order_item__table_order` VALUES (89,90);
/*!40000 ALTER TABLE `order_item__table_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item__takeaway_order`
--

DROP TABLE IF EXISTS `order_item__takeaway_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item__takeaway_order` (
  `takeaway_order_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`takeaway_order_id`,`order_item_id`),
  KEY `FKcqe69xpnjlbyxrk2bkteyv552` (`order_item_id`),
  CONSTRAINT `FKcqe69xpnjlbyxrk2bkteyv552` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`),
  CONSTRAINT `FKr25irxx5xnfwkqtqk17ncmcqh` FOREIGN KEY (`takeaway_order_id`) REFERENCES `takeaway_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item__takeaway_order`
--

LOCK TABLES `order_item__takeaway_order` WRITE;
/*!40000 ALTER TABLE `order_item__takeaway_order` DISABLE KEYS */;
INSERT INTO `order_item__takeaway_order` VALUES (91,92),(94,92),(91,93),(94,93),(175,176),(175,177),(178,179),(180,181),(180,182),(183,184),(183,185),(186,187),(186,188),(189,190),(189,191),(189,192),(189,193),(194,195),(194,196),(194,197),(198,199),(198,200),(198,201),(198,202),(198,203),(198,204),(205,206),(205,207),(205,208),(205,209),(210,211),(210,212),(215,216),(215,217),(322,323),(328,329),(334,335),(337,338),(339,340),(339,341),(339,342),(339,343),(346,347),(371,372),(371,373),(371,374),(371,375);
/*!40000 ALTER TABLE `order_item__takeaway_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf0xcjhvt0kidlgegr8ukg6kop` (`user_id`),
  CONSTRAINT `FKf0xcjhvt0kidlgegr8ukg6kop` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (95,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(96,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(97,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(98,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(99,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(100,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(101,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(102,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(103,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(104,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6),(120,0,NULL,NULL,'2017-01-08 02:00:00','2017-01-08 00:00:00',NULL),(122,0,NULL,NULL,'2017-01-08 02:00:00','2017-01-08 00:00:00',NULL),(124,0,NULL,NULL,'2017-01-08 02:00:00','2017-01-08 00:00:00',NULL),(126,0,NULL,NULL,'2017-01-09 19:30:00','2017-01-09 17:30:00',NULL),(128,0,NULL,NULL,'2017-01-08 18:15:00','2017-01-08 16:15:00',NULL),(130,0,NULL,NULL,'2017-01-08 18:15:00','2017-01-08 16:15:00',NULL),(132,1,NULL,'Marta pancaldi','2017-01-08 18:15:00','2017-01-08 16:15:00',NULL),(134,1,NULL,'Marta pancaldi','2017-01-08 18:15:00','2017-01-08 16:15:00',NULL),(136,1,'menghedenghe','Marta pancaldi','2017-01-08 18:15:00','2017-01-08 16:15:00',NULL),(138,1,'fefwewefwefwf','Marta pancaldi','2017-01-08 18:30:00','2017-01-08 16:30:00',NULL),(140,1,'efeefefef','Marta pancaldi','2017-01-08 18:30:00','2017-01-08 16:30:00',NULL),(142,1,'','Marta pancaldi','2017-01-08 18:45:00','2017-01-08 16:45:00',NULL),(144,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL),(146,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL),(148,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL),(150,1,'grgrgrgrg','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL),(152,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL),(154,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL),(156,1,'menghedenghe','Ciccio Pasticcio','2017-01-08 19:45:00','2017-01-08 17:45:00',6),(158,1,'','Giulia Burgio','2017-01-08 20:00:00','2017-01-08 18:00:00',10),(160,1,'Vatican Cameos','Sherlock Holmes','2017-01-18 00:15:00','2017-01-17 22:15:00',6),(214,1,'','Marta Pancaldi','2017-01-09 15:00:00','2017-01-09 13:00:00',6),(220,1,'hhhhh','Marta Pancaldi','2017-01-09 16:30:00','2017-01-09 14:30:00',NULL),(223,1,'hhhh','Marta Pancaldi','2017-01-09 16:30:00','2017-01-09 14:30:00',NULL),(226,1,'','Marta Pancaldi','2017-01-09 16:45:00','2017-01-09 14:45:00',NULL),(230,1,'','Marta pancaldi','2017-01-09 21:30:00','2017-01-09 19:30:00',NULL),(233,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',NULL),(236,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',NULL),(239,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',NULL),(242,1,'ciaociaociao','Ciccio Pasticcio','2017-01-11 00:45:00','2017-01-10 22:45:00',NULL),(244,1,'The game is on','marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(246,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(248,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(251,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(254,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(257,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(260,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(263,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6),(266,1,'test','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(269,1,'test','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(272,1,'test','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(275,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(278,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(281,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(284,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(287,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6),(290,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(293,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(296,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(299,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(302,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(305,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(308,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(311,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(314,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(317,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6),(326,1,'9.45','Marta pancaldi','2017-01-10 11:45:00','2017-01-10 09:45:00',NULL),(332,1,'','Marta pancaldi','2017-01-10 11:45:00','2017-01-10 09:45:00',NULL),(345,1,'test','Marta pancaldi','2017-01-10 12:00:00','2017-01-10 10:00:00',6),(349,1,'ffffdfsdsv','Marta geegeegg','2017-01-10 13:30:00','2017-01-10 11:30:00',227),(352,1,'ffff','Marta Pancaldi','2017-01-10 13:30:00','2017-01-10 11:30:00',227),(354,1,'htrhrthtr','Marta Pancaldi','2017-01-10 13:30:00','2017-01-10 11:30:00',6),(357,1,'external','Marta Pancaldi','2017-01-10 13:30:00','2017-01-10 11:30:00',6),(360,1,'test','Marta dwdwdw','2017-01-10 13:45:00','2017-01-10 11:45:00',6),(369,1,'','Marta pancaldi','2017-01-10 13:45:00','2017-01-10 11:45:00',NULL),(377,1,'','Marta pancaldi','2017-01-10 13:45:00','2017-01-10 11:45:00',6),(379,1,'menu test','Marta Pancaldi','2017-01-10 14:00:00','2017-01-10 12:00:00',6),(381,1,'menu test','Marta Pancaldi','2017-01-10 14:00:00','2017-01-10 12:00:00',6),(383,1,'menu test 2','Marta pancaldi','2017-01-10 14:00:00','2017-01-10 12:00:00',6),(386,1,'','Marta bsbsrbr','2017-01-10 14:15:00','2017-01-10 12:15:00',6);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,0,0),(2,0,2),(3,0,1),(4,0,3),(5,0,4);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_table`
--

DROP TABLE IF EXISTS `room_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_table` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `seats` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_table`
--

LOCK TABLES `room_table` WRITE;
/*!40000 ALTER TABLE `room_table` DISABLE KEYS */;
INSERT INTO `room_table` VALUES (11,0,'highend','Table 1','Room 0',3),(12,10,'highend','Table 2','Room 2',1),(13,0,'highend','Table 3','Room 2',9),(14,0,'highend','Table 4','Room 1',10),(15,0,'highend','Table 5','Room 0',5),(16,0,'highend','Table 6','Room 1',10),(17,0,'highend','Table 7','Room 0',9),(18,0,'highend','Table 8','Room 2',11),(19,0,'highend','Table 9','Room 1',6),(20,0,'highend','Table 10','Room 2',4),(21,0,'highend','Table 11','Room 0',7),(22,0,'highend','Table 12','Room 0',1),(23,0,'highend','Table 13','Room 1',11),(24,0,'highend','Table 14','Room 1',11),(25,0,'highend','Table 15','Room 2',9),(26,0,'highend','Table 16','Room 1',7),(27,0,'highend','Table 17','Room 1',6),(28,0,'highend','Table 18','Room 1',11),(29,0,'highend','Table 19','Room 2',9),(30,0,'highend','Table 20','Room 0',7),(31,0,'highend','Table 21','Room 2',7),(32,0,'highend','Table 22','Room 2',2),(33,0,'highend','Table 23','Room 0',2),(34,0,'highend','Table 24','Room 2',11),(35,0,'highend','Table 25','Room 1',8),(36,0,'highend','Table 26','Room 0',6),(37,0,'highend','Table 27','Room 1',10),(38,0,'highend','Table 28','Room 0',8),(39,0,'highend','Table 29','Room 2',5),(40,0,'highend','Table 30','Room 1',11),(106,0,'medium','Table 221','Room 2',1),(108,0,'medium','Table 221','Room 0',1),(111,0,'medium','Table 221','Room 2',1),(114,0,'medium','Table 221','Room 0',1),(117,0,'medium','Table 221','Room 1',1),(119,1,'medium','Table 221','Room 0',1),(121,1,'medium','Table 221','Room 1',1),(123,1,'medium','Table 222','Room 0',1),(125,1,'medium','Table 222','Room 2',1),(127,1,'medium','Table 222','Room 2',1),(129,1,'medium','Table 222','Room 2',1),(131,1,'medium','Table 222','Room 2',1),(133,1,'medium','Table 222','Room 0',1),(135,1,'medium','Table 222','Room 1',1),(137,1,'medium','Table 222','Room 2',1),(139,1,'medium','Table 222','Room 1',1),(141,1,'medium','Table 222','Room 1',1),(143,1,'medium','Table 222','Room 2',1),(145,1,'medium','Table 222','Room 2',1),(147,1,'medium','Table 222','Room 1',1),(149,1,'medium','Table 222','Room 0',1),(151,1,'medium','Table 222','Room 2',1),(153,1,'medium','Table 222','Room 2',1),(155,1,'medium','Table 222','Room 1',1),(157,1,'medium','Table 222','Room 2',1),(159,1,'medium','Table 222','Room 0',1),(213,1,'medium','Table 222','Room 0',1),(219,1,'medium','Table 222','Room 1',1),(222,1,'medium','Table 222','Room 1',1),(225,1,'medium','Table 222','Room 0',1),(229,1,'medium','Table 222','Room 2',1),(232,1,'medium','Table 222','Room 1',1),(235,1,'medium','Table 222','Room 2',1),(238,1,'medium','Table 222','Room 2',1),(241,1,'medium','Table 222','Room 0',1),(243,1,'medium','Table 222','Room 2',1),(245,1,'medium','Table 222','Room 1',1),(247,1,'medium','Table 222','Room 1',1),(250,1,'medium','Table 222','Room 0',1),(253,1,'medium','Table 222','Room 2',1),(256,1,'medium','Table 222','Room 0',1),(259,1,'medium','Table 222','Room 1',1),(262,1,'medium','Table 222','Room 1',1),(265,1,'medium','Table 222','Room 0',1),(268,1,'medium','Table 222','Room 0',1),(271,1,'medium','Table 222','Room 0',1),(274,1,'medium','Table 222','Room 2',1),(277,1,'medium','Table 222','Room 1',1),(280,1,'medium','Table 222','Room 0',1),(283,1,'medium','Table 222','Room 0',1),(286,1,'medium','Table 222','Room 0',1),(289,1,'medium','Table 222','Room 1',1),(292,1,'medium','Table 222','Room 0',1),(295,1,'medium','Table 222','Room 0',1),(298,1,'medium','Table 222','Room 1',1),(301,1,'medium','Table 222','Room 2',1),(304,1,'medium','Table 222','Room 0',1),(307,1,'medium','Table 222','Room 1',1),(310,1,'medium','Table 222','Room 1',1),(313,1,'medium','Table 222','Room 0',1),(316,1,'medium','Table 222','Room 0',1),(325,1,'medium','Table 222','Room 1',1),(331,1,'medium','Table 222','Room 2',1),(344,1,'medium','Table 222','Room 2',1),(348,1,'medium','Table 222','Room 2',1),(351,1,'medium','Table 222','Room 0',1),(353,1,'medium','Table 222','Room 1',1),(356,1,'medium','Table 222','Room 0',1),(359,1,'medium','Table 222','Room 1',1),(362,0,'medium','Table 222','Room 1',1),(365,0,'medium','Table 222','Room 1',1),(368,1,'medium','Table 222','Room 1',1),(376,1,'medium','Table 222','Room 1',1),(378,1,'medium','Table 222','Room 2',1),(380,1,'medium','Table 222','Room 2',1),(382,1,'medium','Table 222','Room 1',1),(385,1,'medium','Table 222','Room 1',1);
/*!40000 ALTER TABLE `room_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_table__reservation`
--

DROP TABLE IF EXISTS `room_table__reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_table__reservation` (
  `reservation_id` bigint(20) NOT NULL,
  `room_table_id` bigint(20) NOT NULL,
  PRIMARY KEY (`reservation_id`,`room_table_id`),
  KEY `FK7yec9r11agngsmum4cvwhilqh` (`room_table_id`),
  CONSTRAINT `FK7yec9r11agngsmum4cvwhilqh` FOREIGN KEY (`room_table_id`) REFERENCES `room_table` (`id`),
  CONSTRAINT `FKb4s5kkr7gj37qqw8w8ndpb2px` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_table__reservation`
--

LOCK TABLES `room_table__reservation` WRITE;
/*!40000 ALTER TABLE `room_table__reservation` DISABLE KEYS */;
INSERT INTO `room_table__reservation` VALUES (95,12),(96,12),(97,12),(98,12),(99,12),(100,12),(101,12),(102,12),(103,12),(104,12),(120,119),(122,121),(124,123),(126,125),(128,127),(130,129),(132,131),(134,133),(136,135),(138,137),(140,139),(142,141),(144,143),(146,145),(148,147),(150,149),(152,151),(154,153),(156,155),(158,157),(160,159),(214,213),(220,219),(223,222),(226,225),(230,229),(233,232),(236,235),(239,238),(242,241),(244,243),(246,245),(248,247),(251,250),(254,253),(257,256),(260,259),(263,262),(266,265),(269,268),(272,271),(275,274),(278,277),(281,280),(284,283),(287,286),(290,289),(293,292),(296,295),(299,298),(302,301),(305,304),(308,307),(311,310),(314,313),(317,316),(326,325),(332,331),(345,344),(349,348),(352,351),(354,353),(357,356),(360,359),(369,368),(377,376),(379,378),(381,380),(383,382),(386,385);
/*!40000 ALTER TABLE `room_table__reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_order`
--

DROP TABLE IF EXISTS `table_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_order` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_order`
--

LOCK TABLES `table_order` WRITE;
/*!40000 ALTER TABLE `table_order` DISABLE KEYS */;
INSERT INTO `table_order` VALUES (89,0,'PRONTO');
/*!40000 ALTER TABLE `table_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takeaway_order`
--

DROP TABLE IF EXISTS `takeaway_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takeaway_order` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `cost` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `guest_id` bigint(20) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnlej2ox6eo9t6729y5dchfbvv` (`guest_id`),
  CONSTRAINT `FKnlej2ox6eo9t6729y5dchfbvv` FOREIGN KEY (`guest_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takeaway_order`
--

LOCK TABLES `takeaway_order` WRITE;
/*!40000 ALTER TABLE `takeaway_order` DISABLE KEYS */;
INSERT INTO `takeaway_order` VALUES (91,0,'Piazza Domenicani, Design Faculty',NULL,3.5,'PRONTO',NULL,NULL,NULL),(94,0,'221B Baker St',NULL,17.9,'pronto',NULL,NULL,NULL),(175,0,'Via Corti 3',NULL,23.600000381469727,'pronto',6,NULL,NULL),(178,0,'Via Corti 3',NULL,10.5,'pronto',6,NULL,NULL),(180,0,'Via Corti 3',NULL,12.5,'pronto',6,NULL,NULL),(183,0,'Via Corti 3',NULL,12.5,'pronto',6,NULL,NULL),(186,0,'3287 C OF C COMPLEX',NULL,21.5,'pronto',6,NULL,NULL),(189,0,'Via Corti 3',NULL,28.299999237060547,'pronto',6,NULL,NULL),(194,0,'221B Baker St, London',NULL,23.600000381469727,'pronto',6,'marta pancaldi','3284465452'),(198,0,'Via Carducci 7',NULL,49,'pronto',10,'Ludwig Van Beethoven','6102031644'),(205,0,'221B Baker St, London','40 minutes to Sherlock',42.29999923706055,'pronto',6,'Martha Hudson','1111111111'),(210,0,'221B Baker St, London, UK','ciao',9,'pronto',6,'Marta Pancaldi','2122212122'),(215,0,'221B Baker St, London, UK','fffffffff',15.300000190734863,'pronto',6,'Marta Pancaldi','2122212122'),(322,0,'Via Corti 3','hhhhh',7,'pronto',6,'Marta pancaldi','0522556071'),(328,0,'Via Corti 3','test ta',10.5,'pronto',NULL,'Marta pancaldi','0522556071'),(334,0,'221B Baker St, London','The sister',4.800000190734863,'pronto',NULL,'John Watson','0522556071'),(337,0,'221B Baker St, London','Not your housekeeper',4.800000190734863,'pronto',NULL,'Martha Hudson','6102031644'),(339,0,'Somewhere in London','the British government',31.399999618530273,'pronto',6,'Mycroft Holmes','6102031644'),(346,0,'Via Corti 3','',3.5,'pronto',6,'Marta pancaldi','0522556071'),(371,0,'Via Corti 3','',34.5,'pronto',NULL,'Marta pancaldi','0522556071');
/*!40000 ALTER TABLE `takeaway_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 19:58:20

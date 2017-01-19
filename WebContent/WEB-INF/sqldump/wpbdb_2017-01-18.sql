# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: wpbdb
# Generation Time: 2017-01-18 19:21:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table access_control_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_control_list`;

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



# Dump of table food_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `food_class`;

CREATE TABLE `food_class` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c87dhk77dfvs15c9em4ld2e9u` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `food_class` WRITE;
/*!40000 ALTER TABLE `food_class` DISABLE KEYS */;

INSERT INTO `food_class` (`id`, `version_number`, `name`)
VALUES
	(41,0,'Pizza'),
	(42,0,'Burger'),
	(43,0,'Chinese'),
	(44,0,'Salad'),
	(45,0,'Dessert'),
	(46,0,'Drink');

/*!40000 ALTER TABLE `food_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hibernate_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hibernate_sequences`;

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;

INSERT INTO `hibernate_sequences` (`sequence_name`, `next_val`)
VALUES
	('default',440);

/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item`;

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

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;

INSERT INTO `item` (`id`, `version_number`, `available`, `name`, `price`, `foodClass_id`)
VALUES
	(47,1,b'1','Margherita',5.5,41),
	(48,3,b'1','Marescialla',5.5,41),
	(49,1,b'1','Quattro stagioni',7,41),
	(50,0,b'0','Tonno Cipolla',6,41),
	(51,0,b'1','San Daniele',9,41),
	(52,0,b'0','Primavera',6.7,41),
	(53,0,b'1','Capricciosa',7.5,41),
	(54,19,b'1','Hot Dog',3.5,42),
	(55,4,b'1','Chicken Burger',3.7,42),
	(56,9,b'0','Double Cheeseburger',5.5,42),
	(57,7,b'1','McChicken',4.8,42),
	(58,2,b'1','Burger Royal',5.5,42),
	(59,2,b'0','Hawaiian Toast',5,42),
	(60,1,b'1','BauernToast',4.3,42),
	(61,1,b'1','Chinese noodles',5.5,43),
	(62,2,b'0','Zhajiangmian',6.7,43),
	(63,2,b'0','Fried Rice',3.5,43),
	(64,3,b'0','Kung Pao chicken',7.8,43),
	(65,0,b'1','Wonton',6,43),
	(66,1,b'0','Zongzi',6.7,43),
	(67,2,b'1','Peking Duck',8,43),
	(68,1,b'1','Cesar Salad',4.5,44),
	(69,0,b'1','Chicken Salad',6.7,44),
	(70,0,b'0','Russian Salad',5.5,44),
	(71,1,b'0','Tomato Salad',6.8,44),
	(72,0,b'1','Potatoe Salad',4.4,44),
	(73,1,b'1','Fresh Salad',6.7,44),
	(74,0,b'0','Rice Salad',4.2,44),
	(75,0,b'1','Brownies',4.5,45),
	(76,3,b'1','Ice Cream',6.7,45),
	(77,0,b'0','Surprise',12,45),
	(78,2,b'0','Mousse',6.8,45),
	(79,1,b'1','Sacher',4.4,45),
	(80,2,b'1','Marshmallows',6.7,45),
	(81,1,b'0','Affogato',4.2,45),
	(82,0,b'1','Green Tea',1.5,46),
	(83,1,b'1','Lemon Soda',2.7,46),
	(84,0,b'0','Fizzy Water',1.5,46),
	(85,1,b'0','Beer',2.8,46),
	(86,1,b'1','Red Wine',4.4,46),
	(87,0,b'1','White Wine',3.7,46),
	(88,0,b'1','Sprite',1.2,46);

/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_item`;

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

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;

INSERT INTO `order_item` (`id`, `version_number`, `comment`, `quantity`, `item_id`)
VALUES
	(90,0,'this is item with id 5 and qty 10',10,NULL),
	(92,1,'sample comment',7,NULL),
	(93,1,'this is item with id 5 and qty 10',10,NULL),
	(176,0,NULL,4,54),
	(177,0,NULL,2,57),
	(179,0,NULL,3,54),
	(181,0,NULL,1,56),
	(182,0,NULL,2,54),
	(184,0,NULL,1,56),
	(185,0,NULL,2,54),
	(187,0,NULL,3,54),
	(188,0,NULL,2,47),
	(190,0,NULL,3,54),
	(191,0,NULL,1,79),
	(192,0,NULL,1,76),
	(193,0,NULL,1,80),
	(195,0,NULL,2,62),
	(196,0,NULL,1,54),
	(197,0,NULL,1,80),
	(199,0,NULL,2,78),
	(200,0,NULL,1,64),
	(201,0,NULL,1,58),
	(202,0,NULL,3,85),
	(203,0,NULL,1,49),
	(204,0,NULL,1,73),
	(206,0,NULL,5,63),
	(207,0,NULL,1,78),
	(208,0,NULL,2,48),
	(209,0,NULL,2,54),
	(211,0,NULL,1,56),
	(212,0,NULL,1,54),
	(216,0,NULL,3,54),
	(217,0,NULL,1,57),
	(319,0,NULL,3,54),
	(321,0,NULL,3,54),
	(323,0,NULL,2,54),
	(329,0,NULL,3,54),
	(335,0,NULL,1,57),
	(338,0,NULL,1,57),
	(340,0,NULL,1,48),
	(341,0,NULL,2,76),
	(342,0,NULL,1,67),
	(343,0,NULL,1,68),
	(347,0,NULL,1,54),
	(372,0,NULL,2,56),
	(373,0,NULL,1,63),
	(374,0,NULL,3,86),
	(375,0,NULL,1,71),
	(390,0,NULL,3,54),
	(392,0,NULL,1,64),
	(393,0,NULL,1,56),
	(394,0,NULL,2,58),
	(395,0,NULL,1,54),
	(397,0,NULL,1,66),
	(398,0,NULL,2,48),
	(399,0,NULL,1,60),
	(400,0,NULL,1,62),
	(401,0,NULL,1,76),
	(403,0,NULL,2,55),
	(405,0,NULL,3,55),
	(407,0,NULL,1,55),
	(408,0,NULL,2,56),
	(410,0,NULL,2,57),
	(412,0,NULL,3,55),
	(414,0,NULL,2,56),
	(416,0,NULL,1,59),
	(419,0,NULL,4,57),
	(421,0,NULL,1,57),
	(422,0,NULL,1,56),
	(424,0,NULL,3,54),
	(426,0,NULL,3,54),
	(428,0,NULL,1,83),
	(430,0,NULL,1,81),
	(432,0,NULL,1,64),
	(433,0,NULL,2,61),
	(434,0,NULL,1,67),
	(436,0,NULL,1,56),
	(437,0,NULL,1,59);

/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_item__table_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_item__table_order`;

CREATE TABLE `order_item__table_order` (
  `table_order_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`table_order_id`,`order_item_id`),
  KEY `FK9ntdv80hks55regqvvn38j0ar` (`order_item_id`),
  CONSTRAINT `FK2urcmv9k3layhhul8cf1lufrx` FOREIGN KEY (`table_order_id`) REFERENCES `table_order` (`id`),
  CONSTRAINT `FK9ntdv80hks55regqvvn38j0ar` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `order_item__table_order` WRITE;
/*!40000 ALTER TABLE `order_item__table_order` DISABLE KEYS */;

INSERT INTO `order_item__table_order` (`table_order_id`, `order_item_id`)
VALUES
	(89,90);

/*!40000 ALTER TABLE `order_item__table_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_item__takeaway_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_item__takeaway_order`;

CREATE TABLE `order_item__takeaway_order` (
  `takeaway_order_id` bigint(20) NOT NULL,
  `order_item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`takeaway_order_id`,`order_item_id`),
  KEY `FKcqe69xpnjlbyxrk2bkteyv552` (`order_item_id`),
  CONSTRAINT `FKcqe69xpnjlbyxrk2bkteyv552` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`),
  CONSTRAINT `FKr25irxx5xnfwkqtqk17ncmcqh` FOREIGN KEY (`takeaway_order_id`) REFERENCES `takeaway_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `order_item__takeaway_order` WRITE;
/*!40000 ALTER TABLE `order_item__takeaway_order` DISABLE KEYS */;

INSERT INTO `order_item__takeaway_order` (`takeaway_order_id`, `order_item_id`)
VALUES
	(389,390),
	(391,392),
	(391,393),
	(391,394),
	(391,395),
	(396,397),
	(396,398),
	(396,399),
	(396,400),
	(396,401),
	(402,403),
	(404,405),
	(406,407),
	(406,408),
	(409,410),
	(411,412),
	(413,414),
	(415,416),
	(418,419),
	(420,421),
	(420,422),
	(423,424),
	(425,426),
	(427,428),
	(429,430),
	(431,432),
	(431,433),
	(431,434),
	(435,436),
	(435,437);

/*!40000 ALTER TABLE `order_item__takeaway_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reservation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `roomTable_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf0xcjhvt0kidlgegr8ukg6kop` (`user_id`),
  CONSTRAINT `FKf0xcjhvt0kidlgegr8ukg6kop` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm4oimk0l1757o9pwavorj6ljg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;

INSERT INTO `reservation` (`id`, `version_number`, `comment`, `customer_name`, `end_date`, `start_date`, `user_id`, `roomTable_id`)
VALUES
	(95,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(96,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(97,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(98,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(99,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(100,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(101,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,25),
	(102,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(103,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,0),
	(104,0,'I\'m a comment',NULL,'2017-01-08 16:47:59','2017-01-08 15:47:59',6,18),
	(120,0,NULL,NULL,'2017-01-08 02:00:00','2017-01-08 00:00:00',NULL,0),
	(122,0,NULL,NULL,'2017-01-08 02:00:00','2017-01-08 00:00:00',NULL,0),
	(124,0,NULL,NULL,'2017-01-08 02:00:00','2017-01-08 00:00:00',NULL,18),
	(126,0,NULL,NULL,'2017-01-09 19:30:00','2017-01-09 17:30:00',NULL,0),
	(128,0,NULL,NULL,'2017-01-08 18:15:00','2017-01-08 16:15:00',NULL,0),
	(130,0,NULL,NULL,'2017-01-08 18:15:00','2017-01-08 16:15:00',NULL,0),
	(132,1,NULL,'Marta pancaldi','2017-01-08 18:15:00','2017-01-08 16:15:00',NULL,0),
	(134,1,NULL,'Marta pancaldi','2017-01-08 18:15:00','2017-01-08 16:15:00',NULL,0),
	(136,1,'menghedenghe','Marta pancaldi','2017-01-08 18:15:00','2017-01-08 16:15:00',NULL,0),
	(138,1,'fefwewefwefwf','Marta pancaldi','2017-01-08 18:30:00','2017-01-08 16:30:00',NULL,0),
	(140,1,'efeefefef','Marta pancaldi','2017-01-08 18:30:00','2017-01-08 16:30:00',NULL,0),
	(142,1,'','Marta pancaldi','2017-01-08 18:45:00','2017-01-08 16:45:00',NULL,0),
	(144,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL,0),
	(146,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL,0),
	(148,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL,0),
	(150,1,'grgrgrgrg','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL,0),
	(152,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL,0),
	(154,1,'','Marta pancaldi','2017-01-08 19:00:00','2017-01-08 17:00:00',NULL,0),
	(156,1,'menghedenghe','Ciccio Pasticcio','2017-01-08 19:45:00','2017-01-08 17:45:00',6,0),
	(158,1,'','Giulia Burgio','2017-01-08 20:00:00','2017-01-08 18:00:00',10,0),
	(160,1,'Vatican Cameos','Sherlock Holmes','2017-01-18 00:15:00','2017-01-17 22:15:00',6,0),
	(214,1,'','Marta Pancaldi','2017-01-09 15:00:00','2017-01-09 13:00:00',6,0),
	(220,1,'hhhhh','Marta Pancaldi','2017-01-09 16:30:00','2017-01-09 14:30:00',NULL,0),
	(223,1,'hhhh','Marta Pancaldi','2017-01-09 16:30:00','2017-01-09 14:30:00',NULL,0),
	(226,1,'','Marta Pancaldi','2017-01-09 16:45:00','2017-01-09 14:45:00',NULL,0),
	(230,1,'','Marta pancaldi','2017-01-09 21:30:00','2017-01-09 19:30:00',NULL,0),
	(233,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',NULL,0),
	(236,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',NULL,0),
	(239,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',NULL,0),
	(242,1,'ciaociaociao','Ciccio Pasticcio','2017-01-11 00:45:00','2017-01-10 22:45:00',NULL,0),
	(244,1,'The game is on','marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(246,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(248,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(251,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(254,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(257,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(260,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(263,1,'','Marta pancaldi','2017-01-09 21:45:00','2017-01-09 19:45:00',6,0),
	(266,1,'test','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(269,1,'test','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(272,1,'test','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(275,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(278,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(281,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(284,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(287,1,'','Marta pancaldi','2017-01-09 22:00:00','2017-01-09 20:00:00',6,0),
	(290,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(293,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(296,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(299,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(302,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(305,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(308,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,0),
	(311,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,11),
	(314,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,24),
	(317,1,'','Marta pancaldi','2017-01-09 22:15:00','2017-01-09 20:15:00',6,23),
	(349,1,'ffffdfsdsv','Marta geegeegg','2017-01-10 13:30:00','2017-01-10 11:30:00',227,20),
	(352,1,'ffff','Marta Pancaldi','2017-01-10 13:30:00','2017-01-10 11:30:00',227,18),
	(354,1,'htrhrthtr','Marta Pancaldi','2017-01-10 13:30:00','2017-01-10 11:30:00',6,19),
	(357,1,'external','Marta Pancaldi','2017-01-10 13:30:00','2017-01-10 11:30:00',6,24),
	(360,1,'test','Marta dwdwdw','2017-01-10 13:45:00','2017-01-10 11:45:00',6,17),
	(369,1,'','Marta pancaldi','2017-01-10 13:45:00','2017-01-10 11:45:00',NULL,16),
	(377,1,'','Marta pancaldi','2017-01-10 13:45:00','2017-01-10 11:45:00',6,15),
	(379,1,'menu test','Marta Pancaldi','2017-01-10 14:00:00','2017-01-10 12:00:00',6,14),
	(381,1,'menu test','Marta Pancaldi','2017-01-10 14:00:00','2017-01-10 12:00:00',6,13),
	(383,1,'menu test 2','Marta pancaldi','2017-01-10 14:00:00','2017-01-10 12:00:00',6,11),
	(386,1,'','Marta bsbsrbr','2017-01-10 14:15:00','2017-01-10 12:15:00',6,12),
	(387,0,'','Chuck Norris','2017-01-18 21:00:00','2017-01-18 19:00:00',6,32),
	(417,0,'','Bianca Bianchi','2017-01-18 22:00:00','2017-01-18 20:00:00',NULL,19),
	(438,0,'','Chuck Norris','2017-01-18 22:45:00','2017-01-18 20:45:00',6,33),
	(439,0,'','Chuck Norris','2017-01-18 22:30:00','2017-01-18 20:30:00',6,11);

/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table restaurant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `restaurant`;

CREATE TABLE `restaurant` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `version_number`, `name`)
VALUES
	(1,0,0),
	(2,0,2),
	(3,0,1),
	(4,0,3),
	(5,0,4);

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_table`;

CREATE TABLE `room_table` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `seats` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `room_table` WRITE;
/*!40000 ALTER TABLE `room_table` DISABLE KEYS */;

INSERT INTO `room_table` (`id`, `version_number`, `category`, `name`, `room`, `seats`)
VALUES
	(11,0,'highend','Table 1','Room 0',3),
	(12,10,'highend','Table 2','Room 2',1),
	(13,0,'highend','Table 3','Room 2',9),
	(14,0,'highend','Table 4','Room 1',10),
	(15,0,'highend','Table 5','Room 0',5),
	(16,0,'highend','Table 6','Room 1',10),
	(17,0,'highend','Table 7','Room 0',9),
	(18,0,'highend','Table 8','Room 2',11),
	(19,0,'highend','Table 9','Room 1',6),
	(20,0,'highend','Table 10','Room 2',4),
	(21,0,'highend','Table 11','Room 0',7),
	(22,0,'highend','Table 12','Room 0',1),
	(23,0,'highend','Table 13','Room 1',11),
	(24,0,'highend','Table 14','Room 1',11),
	(25,0,'highend','Table 15','Room 2',9),
	(26,0,'highend','Table 16','Room 1',7),
	(27,0,'highend','Table 17','Room 1',6),
	(28,0,'highend','Table 18','Room 1',11),
	(29,0,'highend','Table 19','Room 2',9),
	(30,0,'highend','Table 20','Room 0',7),
	(31,0,'highend','Table 21','Room 2',7),
	(32,0,'highend','Table 22','Room 2',2),
	(33,0,'highend','Table 23','Room 0',2),
	(34,0,'highend','Table 24','Room 2',11),
	(35,0,'highend','Table 25','Room 1',8),
	(36,0,'highend','Table 26','Room 0',6),
	(37,0,'highend','Table 27','Room 1',10),
	(38,0,'highend','Table 28','Room 0',8),
	(39,0,'highend','Table 29','Room 2',5),
	(40,0,'highend','Table 30','Room 1',11);

/*!40000 ALTER TABLE `room_table` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table room_table__reservation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room_table__reservation`;

CREATE TABLE `room_table__reservation` (
  `reservation_id` bigint(20) NOT NULL,
  `room_table_id` bigint(20) NOT NULL,
  PRIMARY KEY (`reservation_id`,`room_table_id`),
  KEY `FK7yec9r11agngsmum4cvwhilqh` (`room_table_id`),
  CONSTRAINT `FK7yec9r11agngsmum4cvwhilqh` FOREIGN KEY (`room_table_id`) REFERENCES `room_table` (`id`),
  CONSTRAINT `FKb4s5kkr7gj37qqw8w8ndpb2px` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `room_table__reservation` WRITE;
/*!40000 ALTER TABLE `room_table__reservation` DISABLE KEYS */;

INSERT INTO `room_table__reservation` (`reservation_id`, `room_table_id`)
VALUES
	(95,12),
	(96,12),
	(97,12),
	(98,12),
	(99,12),
	(100,12),
	(101,12),
	(102,12),
	(103,12),
	(104,12);

/*!40000 ALTER TABLE `room_table__reservation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table table_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `table_order`;

CREATE TABLE `table_order` (
  `id` bigint(20) NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `table_order` WRITE;
/*!40000 ALTER TABLE `table_order` DISABLE KEYS */;

INSERT INTO `table_order` (`id`, `version_number`, `status`)
VALUES
	(89,0,'PRONTO');

/*!40000 ALTER TABLE `table_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table takeaway_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `takeaway_order`;

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
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnlej2ox6eo9t6729y5dchfbvv` (`guest_id`),
  CONSTRAINT `FKnlej2ox6eo9t6729y5dchfbvv` FOREIGN KEY (`guest_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrujbdlcuo3vlaa3t27e8q6j9f` FOREIGN KEY (`guest_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `takeaway_order` WRITE;
/*!40000 ALTER TABLE `takeaway_order` DISABLE KEYS */;

INSERT INTO `takeaway_order` (`id`, `version_number`, `address`, `comment`, `cost`, `status`, `guest_id`, `customer_name`, `phone_number`, `order_date`)
VALUES
	(389,0,'999 Main St, Charleston SC','',10.5,'pronto',6,'Chuck Norris','1234567890','2017-01-18 19:30:19'),
	(391,0,'999 Main St, Charleston SC','',27.799999237060547,'pronto',6,'Chuck Norris','1234567890','2017-01-18 19:36:42'),
	(396,0,'221B Baker St, London, UK','test ',35.400001525878906,'pronto',6,'John Watson','1234567890','2017-01-18 19:36:42'),
	(402,0,'3123 Russel Square, Albuquerque NM','comment 32352555',7.400000095367432,'pronto',6,'Jesse Pinkman','1234567890','2017-01-18 19:36:42'),
	(404,0,'999 Main St, Charleston SC','',11.100000381469727,'pronto',6,'Chuck Norris','0522556071','2017-01-18 19:36:42'),
	(406,0,'221B Baker St, London, UK','',14.699999809265137,'pronto',6,'Marta Pancaldi','1234512345','2017-01-18 19:36:42'),
	(409,0,'999 Main St, Charleston SC','',9.600000381469727,'pronto',6,'Chuck Norris','0522556071','2017-01-18 19:36:42'),
	(411,0,'','',11.100000381469727,'pronto',10,'Giulia Burgio','1234512345','2017-01-18 19:36:42'),
	(413,0,'221B Baker St, London, UK','',11,'pronto',10,'Marta Pasticcio','1234512345','2017-01-18 19:36:42'),
	(415,0,'999 Main St, Charleston SC','',5,'pronto',6,'Chuck Norris','0522556071','2017-01-18 19:36:42'),
	(418,0,'Via Vincenzi 1','test 235235253',19.200000762939453,'pronto',NULL,'Umberto Pancaldi','1234512345','2017-01-18 20:05:09'),
	(420,0,'Via Vincenzi 1','',10.300000190734863,'pronto',NULL,'Nino Pancaldi','1212121211','2017-01-18 20:05:09'),
	(423,0,'Via Corti 3','124124',10.5,'pronto',NULL,'Elisabetta Morini','1125125161','2017-01-18 20:05:09'),
	(425,0,'221B Baker St, London, UK','',10.5,'pronto',NULL,'Greg Lestrade','3513713522','2017-01-18 20:08:13'),
	(427,0,'999 Main St, Charleston SC','',2.700000047683716,'pronto',6,'Chuck Norris','0522556071','2017-01-18 20:08:50'),
	(429,0,'221B Baker St, London, UK','151251252',4.199999809265137,'pronto',6,'Sherlock Holmes','1234512345','2017-01-18 20:09:51'),
	(431,0,'999 Main St, Charleston SC','',26.799999237060547,'pronto',6,'Chuck Norris','0522556071','2017-01-18 20:12:30'),
	(435,0,'221B Baker St, London, UK','comment 21123',10.5,'pronto',NULL,'Martha Hudson','1125167137','2017-01-18 20:13:15');

/*!40000 ALTER TABLE `takeaway_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

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
  CONSTRAINT `FK2iwi278tiwgkgwsu0hl8alwpw` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `version_number`, `avatar`, `billing_address`, `creation_date`, `email`, `full_name`, `password`, `phone_number`, `points`, `vip_status`, `role_id`)
VALUES
	(6,77,'dist/img/gusteau160x160.jpg','999 Main St, Charleston SC','2017-01-08 15:47:57','overlord@wpb.it','Chuck Norris','$2a$10$iqRz4zDwGjm2SCDoTcVjUeV0Oc7J41qTWr27ezQtKF89qh27GjVOi','0522556071',0,b'0',5),
	(7,0,'dist/img/avatar2.png',NULL,'2017-01-08 15:47:57','admin@wpb.it','I am God','$2a$10$qH7CkN7xnqHDh8HWz/YtgOMXt3AxaB672c5vieusO4u0BrXw1vu0G',NULL,0,b'0',1),
	(8,0,'dist/img/avatar3.png',NULL,'2017-01-08 15:47:58','marta@wpb.it','Marta Pancaldi','$2a$10$KEqpDOakVx4OqwIxQMD59O4EGVYRvgPtWPysbq7QicOJ3q07vtaVW',NULL,0,b'0',3),
	(9,0,'dist/img/avatar4.png',NULL,'2017-01-08 15:47:58','werner@wpb.it','Werner Sperandio','$2a$10$UYsMdy4kwNVAoeMvWneHXupEr0NNZKcZIEiZ4OBUOyNF5ZnTyZ1NW',NULL,0,b'0',2),
	(10,4,'dist/img/avatar1.png',NULL,'2017-01-08 15:47:58','giulia@wpb.it','Giulia Burgio','$2a$10$/WhsvD5OIFAHzSJPG/20weGyVMX1z.dgo4F.YzGSYZUtPmR89No3O',NULL,0,b'0',4),
	(227,2,'dist/img/avatar5.png',NULL,'2017-01-09 14:45:26','giovannino@yahoo.it','Giovanni Rossi','$2a$10$bU5C5heVS6bY7bBrO0uF9eSeHqUAqZfC8v2IS6Lisvc0GcHU6/S4O',NULL,0,b'0',4),
	(388,0,'dist/img/gusteau160x160.jpg',NULL,'2017-01-18 19:02:10','mbianchi@email.it','Mario Bianchi','$2a$10$qHsjGw80LjliNSd4KP35zOCX1b83YT/7AOK8c9UT81KwidXRv0AVm',NULL,0,b'0',4);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

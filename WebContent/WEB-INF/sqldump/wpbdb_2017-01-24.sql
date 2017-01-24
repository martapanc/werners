# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: wpbdb
# Generation Time: 2017-01-24 13:17:24 +0000
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
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c87dhk77dfvs15c9em4ld2e9u` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `food_class` WRITE;
/*!40000 ALTER TABLE `food_class` DISABLE KEYS */;

INSERT INTO `food_class` (`id`, `version_number`, `name`, `image`)
VALUES
	(41,0,'Pizza','dist/img/flat-icon-gastronomy/pizza-2.svg'),
	(42,0,'Burger','dist/img/flat-icon-gastronomy/burger.svg'),
	(43,0,'Chinese','dist/img/flat-icon-gastronomy/noodles.svg'),
	(44,0,'Salad','dist/img/flat-icon-gastronomy/salad.svg'),
	(45,0,'Dessert','dist/img/flat-icon-gastronomy/cupcake.svg'),
	(46,0,'Drink','dist/img/flat-icon-gastronomy/glass-3.svg'),
	(580,0,'Japanese','dist/img/flat-icon-gastronomy/sushi-1.svg');

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
	('default',583);

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
	(47,4,b'1','Margherita',5.2,41),
	(48,3,b'1','Marescialla',5.5,41),
	(49,2,b'1','Quattro stagioni',7,41),
	(50,0,b'1','Tonno Cipolla',6,41),
	(51,2,b'1','San Daniele',9,41),
	(52,0,b'1','Primavera',6.7,41),
	(53,0,b'1','Capricciosa',7.5,41),
	(54,29,b'1','Hot Dog',3.5,42),
	(55,9,b'1','Chicken Burger',3.7,42),
	(56,11,b'1','Double Cheeseburger',5.5,42),
	(57,9,b'1','McChicken',4.8,42),
	(58,6,b'1','Burger Royal',5.5,42),
	(59,6,b'1','Hawaiian Toast',5,42),
	(60,5,b'1','BauernToast',4.3,42),
	(61,3,b'1','Chinese noodles',5.5,43),
	(62,4,b'1','Zhajiangmian',6.7,43),
	(63,3,b'1','Fried Rice',3.5,43),
	(64,6,b'1','Kung Pao chicken',7.8,43),
	(65,1,b'1','Wonton',6,43),
	(66,3,b'1','Zongzi',6.7,43),
	(67,4,b'1','Peking Duck',8,43),
	(68,2,b'1','Cesar Salad',4.5,44),
	(69,0,b'1','Chicken Salad',6.7,44),
	(70,2,b'1','Russian Salad',5.5,44),
	(71,1,b'1','Tomato Salad',6.8,44),
	(72,1,b'1','Potatoe Salad',4.4,44),
	(73,2,b'1','Fresh Salad',6.7,44),
	(74,0,b'1','Rice Salad',4.2,44),
	(75,0,b'1','Brownies',4.5,45),
	(76,3,b'1','Ice Cream',6.7,45),
	(77,0,b'1','Surprise',12,45),
	(78,3,b'1','Mousse',6.8,45),
	(79,2,b'1','Sacher',4.4,45),
	(80,2,b'1','Marshmallows',6.7,45),
	(81,1,b'1','Affogato',4.2,45),
	(82,1,b'1','Green Tea',1.5,46),
	(83,1,b'1','Lemon Soda',2.7,46),
	(84,1,b'1','Fizzy Water',1.5,46),
	(85,2,b'1','Beer',2.8,46),
	(86,2,b'1','Red Wine',4.4,46),
	(87,1,b'1','White Wine',3.7,46),
	(88,2,b'1','Sprite',1.2,46),
	(453,1,b'1','Pancakes',3.5,45);

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
	(437,0,NULL,1,59),
	(441,0,NULL,1,55),
	(442,0,NULL,1,58),
	(443,0,NULL,1,60),
	(445,0,NULL,1,78),
	(446,0,NULL,1,51),
	(447,0,NULL,1,54),
	(449,0,NULL,3,55),
	(461,0,NULL,1,70),
	(462,0,NULL,1,73),
	(463,0,NULL,1,56),
	(464,0,NULL,1,51),
	(465,0,NULL,1,54),
	(470,0,NULL,1,55),
	(471,0,NULL,1,58),
	(487,0,NULL,1,453),
	(488,0,NULL,1,79),
	(489,0,NULL,2,57),
	(490,0,NULL,1,59),
	(491,0,NULL,1,54),
	(493,0,NULL,3,60),
	(494,0,NULL,1,54),
	(496,0,NULL,3,60),
	(497,0,NULL,1,54),
	(499,0,NULL,2,84),
	(500,0,NULL,1,85),
	(501,0,NULL,3,47),
	(502,0,NULL,1,88),
	(503,0,NULL,1,49),
	(505,0,NULL,1,54),
	(506,0,NULL,1,59),
	(507,0,NULL,1,57),
	(509,0,NULL,3,64),
	(510,0,NULL,1,66),
	(511,0,NULL,1,62),
	(513,0,NULL,1,72),
	(514,0,NULL,2,63),
	(515,0,NULL,1,88),
	(516,0,NULL,1,66),
	(517,0,NULL,1,70),
	(518,0,NULL,1,68),
	(519,0,NULL,1,64),
	(520,0,NULL,1,61),
	(521,0,NULL,2,67),
	(522,0,NULL,1,86),
	(523,0,NULL,2,87),
	(524,0,NULL,2,82),
	(530,0,NULL,1,55),
	(531,0,NULL,1,58),
	(532,0,NULL,1,60),
	(534,0,NULL,1,61),
	(535,0,NULL,1,67),
	(536,0,NULL,1,65),
	(539,0,NULL,2,58),
	(540,0,NULL,1,54),
	(549,0,NULL,4,55),
	(551,0,NULL,1,56),
	(552,0,NULL,1,59),
	(554,0,NULL,1,54),
	(556,0,NULL,1,54),
	(572,0,NULL,2,59),
	(573,0,NULL,1,54),
	(574,0,NULL,2,64),
	(575,0,NULL,1,62);

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
	(435,437),
	(440,441),
	(440,442),
	(440,443),
	(444,445),
	(444,446),
	(444,447),
	(448,449),
	(460,461),
	(460,462),
	(460,463),
	(460,464),
	(460,465),
	(469,470),
	(469,471),
	(486,487),
	(486,488),
	(486,489),
	(486,490),
	(486,491),
	(492,493),
	(492,494),
	(495,496),
	(495,497),
	(498,499),
	(498,500),
	(498,501),
	(498,502),
	(498,503),
	(504,505),
	(504,506),
	(504,507),
	(508,509),
	(508,510),
	(508,511),
	(512,513),
	(512,514),
	(512,515),
	(512,516),
	(512,517),
	(512,518),
	(512,519),
	(512,520),
	(512,521),
	(512,522),
	(512,523),
	(512,524),
	(529,530),
	(529,531),
	(529,532),
	(533,534),
	(533,535),
	(533,536),
	(538,539),
	(538,540),
	(548,549),
	(550,551),
	(550,552),
	(553,554),
	(555,556),
	(571,572),
	(571,573),
	(571,574),
	(571,575);

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
	(439,0,'','Chuck Norris','2017-01-18 22:30:00','2017-01-18 20:30:00',6,11),
	(450,0,'','Chuck Norris','2017-01-20 21:15:00','2017-01-20 19:15:00',6,32),
	(452,0,'test 32361','Chuck Norris','2017-01-22 00:15:00','2017-01-21 22:15:00',6,20),
	(454,0,'','Chuck Norris','2017-02-01 13:45:00','2017-02-01 11:45:00',6,20),
	(455,0,'','Chuck Norris','2017-02-02 14:15:00','2017-02-02 12:15:00',6,14),
	(456,0,'','Chuck Norris','2017-02-02 14:00:00','2017-02-02 12:00:00',6,21),
	(457,0,'TJLC IS REAL','Sherlock Holmes','2016-09-29 14:15:00','2016-09-29 12:15:00',451,20),
	(458,0,'','Sherlock Holmes','2016-10-12 14:15:00','2016-10-12 12:15:00',451,20),
	(459,0,'','Sherlock Holmes','2016-11-23 14:15:00','2016-11-23 12:15:00',451,13),
	(466,0,'','Chuck Norris','2016-09-30 15:15:00','2016-09-30 13:15:00',6,11),
	(467,0,'','Chuck Norris','2016-10-20 14:30:00','2016-10-20 12:30:00',6,20),
	(468,0,'','Chuck Norris','2016-10-12 14:30:00','2016-10-12 12:30:00',6,32),
	(472,0,'','Chuck Norris','2016-10-19 14:30:00','2016-10-19 12:30:00',6,32),
	(473,0,'','Chuck Norris','2016-11-17 14:30:00','2016-11-17 12:30:00',6,32),
	(474,0,'','Chuck Norris','2016-11-17 14:30:00','2016-11-17 12:30:00',6,33),
	(475,0,'','Chuck Norris','2016-12-22 14:30:00','2016-12-22 12:30:00',6,32),
	(476,0,'','Chuck Norris','2016-12-06 15:15:00','2016-12-06 13:15:00',6,15),
	(477,0,'','Chuck Norris','2016-12-06 15:15:00','2016-12-06 13:15:00',6,39),
	(478,0,'','Chuck Norris','2016-12-06 15:15:00','2016-12-06 13:15:00',6,19),
	(479,0,'','Chuck Norris','2016-12-06 15:15:00','2016-12-06 13:15:00',6,27),
	(480,0,'','Chuck Norris','2016-11-09 17:00:00','2016-11-09 15:00:00',6,15),
	(481,0,'','Giulia Burgio','2016-12-29 22:00:00','2016-12-29 20:00:00',10,21),
	(482,0,'','Giulia Burgio','2016-12-13 21:45:00','2016-12-13 19:45:00',10,15),
	(484,0,'','Mario Rossi','2016-12-31 14:15:00','2016-12-31 12:15:00',483,20),
	(485,0,'','Mario Rossi','2016-12-11 15:30:00','2016-12-11 13:30:00',483,19),
	(525,0,'','Giulia Burgio','2016-11-11 17:00:00','2016-11-11 15:00:00',10,20),
	(526,0,'','Giulia Burgio','2016-11-23 20:00:00','2016-11-23 18:00:00',10,19),
	(527,0,'','Chuck Norris','2016-11-04 17:00:00','2016-11-04 15:00:00',6,20),
	(528,0,'','Chuck Berry','2016-11-17 17:00:00','2016-11-17 15:00:00',6,18),
	(537,0,'','Chuck Norris','2017-01-22 18:30:00','2017-01-22 16:30:00',6,33),
	(541,0,'','Chuck Norris','2017-01-23 13:30:00','2017-01-23 11:30:00',6,33),
	(542,0,'','Chuck Norris','2017-01-23 13:30:00','2017-01-23 11:30:00',6,32),
	(543,0,'','Chuck Norris','2017-01-23 17:45:00','2017-01-23 15:45:00',6,33),
	(544,0,'','Chuck Norris','2017-01-23 17:45:00','2017-01-23 15:45:00',6,32),
	(545,0,'test 2361','Chuck Norris','2017-01-23 22:45:00','2017-01-23 20:45:00',6,38),
	(546,0,'','Chuck Norris','2017-01-23 19:15:00','2017-01-23 17:15:00',6,18),
	(547,0,'','Chuck Norris','2017-01-23 19:15:00','2017-01-23 17:15:00',6,23),
	(558,0,'','Giulia Burgio','2017-01-23 18:15:00','2017-01-23 16:15:00',10,11),
	(559,0,'','sdgeweg awhawe','2017-01-23 19:00:00','2017-01-23 17:00:00',10,26),
	(560,0,'','Walter White','2017-01-23 19:30:00','2017-01-23 17:30:00',10,20),
	(561,0,'','Chuck Norris','2017-01-23 19:15:00','2017-01-23 17:15:00',6,39),
	(563,0,'','Marta Pancaldi','2017-01-23 20:15:00','2017-01-23 18:15:00',562,15),
	(564,0,'Hello there','Ciccio Pasticcio','2017-01-25 21:45:00','2017-01-25 19:45:00',NULL,39),
	(565,0,'','Chuck Norris','2017-01-23 20:15:00','2017-01-23 18:15:00',6,11),
	(566,0,'','Marta Pancaldi','2017-01-23 21:45:00','2017-01-23 19:45:00',562,20),
	(567,0,'','Marta Pancaldi','2017-01-23 21:00:00','2017-01-23 19:00:00',562,27),
	(568,0,'Se ti Ã¨ arrivata questa email, vuol dire che il server ha funzionato! :D','Werner Sperandio','2017-01-23 22:30:00','2017-01-23 20:30:00',562,11),
	(569,0,'Se ti Ã¨ arrivata questa email, vuol dire che il server ha funzionato! :D','Giulia Burgio','2017-01-23 22:30:00','2017-01-23 20:30:00',562,39);

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
	(435,0,'221B Baker St, London, UK','comment 21123',10.5,'pronto',NULL,'Martha Hudson','1125167137','2017-01-18 20:13:15'),
	(440,0,'999 Main St, Charleston SC','c n comment',13.5,'pronto',6,'Chuck Norris','0522556073','2017-01-19 11:32:32'),
	(444,0,'999 Main St, Charleston SC','test 253',19.299999237060547,'pronto',6,'Chuck Norris','0522556073','2017-01-19 11:33:16'),
	(448,0,'3123 Russel Square, Albuquerque NM','test 34534976',11.100000381469727,'pronto',NULL,'Walter White','3463424635','2017-01-20 18:38:16'),
	(460,0,'221b Baker St, London UK','',30.200000762939453,'pronto',451,'Sherlock Holmes','2362352523','2016-09-29 12:21:38'),
	(469,0,'999 Main St, Charleston','',9.199999809265137,'pronto',6,'Chuck Norris','0522124554','2016-09-29 12:29:06'),
	(486,0,'Piazza del Duomo 23, Bolzano','',26,'pronto',483,'Mario Rossi','5124089898','2016-09-29 12:43:08'),
	(492,0,'999 Main St, Charleston','',16.399999618530273,'pronto',6,'Chuck Norris','0522124554','2017-01-22 14:34:54'),
	(495,0,'999 Main St, Charleston','',16.399999618530273,'pronto',6,'Chuck Norris','0522124554','2016-11-04 14:35:43'),
	(498,0,'Via Carducci 7','No tomato on the Margherita, please',29.899999618530273,'pronto',NULL,'John Doe','1242151253','2016-11-04 14:36:49'),
	(504,0,'Via Amendola 23','',13.300000190734863,'pronto',NULL,'John Smith','1234512345','2016-11-04 14:59:24'),
	(508,0,'Sherrinford, somewhere in the English Channel','',36.79999923706055,'pronto',NULL,'Eurus Holmes','1224124124','2016-11-04 15:00:21'),
	(512,0,'Anywhere you can imagine','MISS ME?',73.4000015258789,'pronto',NULL,'James Moriarty','2141244124','2016-11-04 15:01:56'),
	(529,0,'999 Main St, Charleston, SC','',13.5,'pronto',6,'Chuck Norris','0522124554','2016-12-01 15:05:38'),
	(533,0,'999 Main St, Charleston','',19.5,'pronto',6,'Chuck Norris','0522124554','2016-12-01 15:06:06'),
	(538,0,'999 Main St, Charleston','',14.5,'pronto',6,'Chuck Berry','0522124554','2017-01-22 17:00:19'),
	(548,0,'999 Main St, Charleston','test 23274288242',14.800000190734863,'pronto',6,'Chuck Norris','0522124554','2017-01-23 15:54:13'),
	(550,0,'999 Main St, Charleston','',10.5,'pronto',6,'Chuck Norris','0522124554','2017-01-23 15:54:42'),
	(553,0,'221B Baker St, London, UK','edfehhdeh',3.5,'pronto',NULL,'John Smith','3453453453','2017-01-23 16:06:44'),
	(555,0,'221B Baker St, London, UK','rfdrge',3.5,'pronto',NULL,'John Smith','2523623634','2017-01-23 16:07:24'),
	(571,0,'221B Baker St, London, UK','The game is on',35.79999923706055,'pronto',NULL,'John Watson','1234512345','2017-01-24 11:08:38');

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
	(6,227,'dist/img/gusteau160x160.jpg','999 Main St, Charleston, SC','2017-01-08 15:47:57','overlord@wpb.it','Chuck Norris','$2a$10$Labp3/QUKiLEG4WiQahrXe1bbCfhXEHqQ.xKcXnoaDRfWRM5ZUAmm','0522124554',0,b'0',5),
	(7,2,'dist/img/avatar2.png','Somewhere over the rainbow','2017-01-08 15:47:57','admin@wpb.it','I am God','$2a$10$qH7CkN7xnqHDh8HWz/YtgOMXt3AxaB672c5vieusO4u0BrXw1vu0G','1241251243',0,b'0',1),
	(8,2,'dist/img/avatar3.png','Via Carducci 7, Bolzano','2017-01-08 15:47:58','marta@wpb.it','Marta Pancaldi','$2a$10$KEqpDOakVx4OqwIxQMD59O4EGVYRvgPtWPysbq7QicOJ3q07vtaVW','0522332720',0,b'0',3),
	(9,0,'dist/img/avatar4.png',NULL,'2017-01-08 15:47:58','werner@wpb.it','Werner Sperandio','$2a$10$UYsMdy4kwNVAoeMvWneHXupEr0NNZKcZIEiZ4OBUOyNF5ZnTyZ1NW',NULL,0,b'0',2),
	(10,13,'dist/img/avatar1.png','Via Weggenstein 12123, Bolzano','2017-01-08 15:47:58','giulia@wpb.it','Giulia Burgio','$2a$10$/WhsvD5OIFAHzSJPG/20weGyVMX1z.dgo4F.YzGSYZUtPmR89No3O','1251248124',0,b'0',4),
	(227,2,'dist/img/avatar5.png',NULL,'2017-01-09 14:45:26','giovannino@yahoo.it','Giovanni Rossi','$2a$10$bU5C5heVS6bY7bBrO0uF9eSeHqUAqZfC8v2IS6Lisvc0GcHU6/S4O',NULL,0,b'0',4),
	(388,0,'dist/img/gusteau160x160.jpg',NULL,'2017-01-18 19:02:10','mbianchi@email.it','Mario Bianchi','$2a$10$qHsjGw80LjliNSd4KP35zOCX1b83YT/7AOK8c9UT81KwidXRv0AVm',NULL,0,b'0',4),
	(451,6,'dist/img/gusteau160x160.jpg','221b Baker St, London UK','2017-01-21 18:36:52','sholmes@email.co.uk','Sherlock Holmes','$2a$10$pWdckKUdTeiPzl7ZlaEYmOUw/1qxihVzdMhkM5Wt9M1Br7ncVkMxS','2362352523',0,b'0',4),
	(483,5,'dist/img/avatar1.png','Piazza del Duomo 23, Bolzano','2016-09-29 12:41:11','mrossi@gmail.com','Mario Rossi','$2a$10$U0.U7tdZVeralp65bRuIZ.qkE7k2HXX4ziFw8vUs4UvgfUcfUr9h6','5124089898',0,b'0',4),
	(562,7,'dist/img/avatar3.png','Via Carducci 7, Bolzano','2017-01-23 17:27:16','marta.panc@gmail.com','Marta Pancaldi','$2a$10$suZwiRWt6hCvgUIfXal7feOPrgCIXhlsXBl2GekBCpB79k9u8y2Si','3284465452',0,b'0',4),
	(570,2,'dist/img/avatar2.png',NULL,'2017-01-23 19:22:17','marta.pancaldi@stud-inf.unibz.it','Pancaldi Marta','$2a$10$Btj1V7wNbQYwvkJtO9w7h.9q9kV9Q1EE8Rge42q28DyOoXV09Rp3a',NULL,0,b'0',4);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

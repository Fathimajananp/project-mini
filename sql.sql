/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.27 : Database - kmct_fishmart
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kmct_fishmart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kmct_fishmart`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add delivery boy',7,'add_deliveryboy'),
(26,'Can change delivery boy',7,'change_deliveryboy'),
(27,'Can delete delivery boy',7,'delete_deliveryboy'),
(28,'Can view delivery boy',7,'view_deliveryboy'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add meat',9,'add_meat'),
(34,'Can change meat',9,'change_meat'),
(35,'Can delete meat',9,'delete_meat'),
(36,'Can view meat',9,'view_meat'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add stock',11,'add_stock'),
(42,'Can change stock',11,'change_stock'),
(43,'Can delete stock',11,'delete_stock'),
(44,'Can view stock',11,'view_stock'),
(45,'Can add order',12,'add_order'),
(46,'Can change order',12,'change_order'),
(47,'Can delete order',12,'delete_order'),
(48,'Can view order',12,'view_order'),
(49,'Can add payment',13,'add_payment'),
(50,'Can change payment',13,'change_payment'),
(51,'Can delete payment',13,'delete_payment'),
(52,'Can view payment',13,'view_payment'),
(53,'Can add feedback',14,'add_feedback'),
(54,'Can change feedback',14,'change_feedback'),
(55,'Can delete feedback',14,'delete_feedback'),
(56,'Can view feedback',14,'view_feedback'),
(57,'Can add deliverystatus',15,'add_deliverystatus'),
(58,'Can change deliverystatus',15,'change_deliverystatus'),
(59,'Can delete deliverystatus',15,'delete_deliverystatus'),
(60,'Can view deliverystatus',15,'view_deliverystatus'),
(61,'Can add bank',16,'add_bank'),
(62,'Can change bank',16,'change_bank'),
(63,'Can delete bank',16,'delete_bank'),
(64,'Can view bank',16,'view_bank'),
(65,'Can add cart',17,'add_cart'),
(66,'Can change cart',17,'change_cart'),
(67,'Can delete cart',17,'delete_cart'),
(68,'Can view cart',17,'view_cart'),
(69,'Can add order_sub',18,'add_order_sub'),
(70,'Can change order_sub',18,'change_order_sub'),
(71,'Can delete order_sub',18,'delete_order_sub'),
(72,'Can view order_sub',18,'view_order_sub'),
(73,'Can add order_main',19,'add_order_main'),
(74,'Can change order_main',19,'change_order_main'),
(75,'Can delete order_main',19,'delete_order_main'),
(76,'Can view order_main',19,'view_order_main');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(16,'myapp','bank'),
(17,'myapp','cart'),
(7,'myapp','deliveryboy'),
(15,'myapp','deliverystatus'),
(14,'myapp','feedback'),
(8,'myapp','login'),
(9,'myapp','meat'),
(12,'myapp','order'),
(19,'myapp','order_main'),
(18,'myapp','order_sub'),
(13,'myapp','payment'),
(11,'myapp','stock'),
(10,'myapp','user'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2022-11-06 10:42:56.371998'),
(2,'auth','0001_initial','2022-11-06 10:42:57.028185'),
(3,'admin','0001_initial','2022-11-06 10:42:57.185056'),
(4,'admin','0002_logentry_remove_auto_add','2022-11-06 10:42:57.200684'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-11-06 10:42:57.216368'),
(6,'contenttypes','0002_remove_content_type_name','2022-11-06 10:42:57.372544'),
(7,'auth','0002_alter_permission_name_max_length','2022-11-06 10:42:57.450661'),
(8,'auth','0003_alter_user_email_max_length','2022-11-06 10:42:57.481907'),
(9,'auth','0004_alter_user_username_opts','2022-11-06 10:42:57.497530'),
(10,'auth','0005_alter_user_last_login_null','2022-11-06 10:42:57.560024'),
(11,'auth','0006_require_contenttypes_0002','2022-11-06 10:42:57.575648'),
(12,'auth','0007_alter_validators_add_error_messages','2022-11-06 10:42:57.591271'),
(13,'auth','0008_alter_user_username_max_length','2022-11-06 10:42:57.674720'),
(14,'auth','0009_alter_user_last_name_max_length','2022-11-06 10:42:57.754150'),
(15,'auth','0010_alter_group_name_max_length','2022-11-06 10:42:57.782215'),
(16,'auth','0011_update_proxy_permissions','2022-11-06 10:42:57.797451'),
(17,'auth','0012_alter_user_first_name_max_length','2022-11-06 10:42:57.860062'),
(18,'myapp','0001_initial','2022-11-06 10:42:58.782854'),
(19,'myapp','0002_user_image','2022-11-06 10:42:58.814101'),
(20,'myapp','0003_remove_order_meat','2022-11-06 10:42:58.923546'),
(21,'myapp','0004_cart','2022-11-06 10:42:59.079701'),
(22,'myapp','0005_auto_20221030_1431','2022-11-06 10:42:59.204690'),
(23,'myapp','0006_auto_20221030_1505','2022-11-06 10:42:59.626523'),
(24,'myapp','0007_deliverystatus_feedback_order_payment','2022-11-06 10:43:00.173426'),
(25,'myapp','0008_remove_order_delivery_date','2022-11-06 10:43:00.235842'),
(26,'myapp','0009_auto_20221030_1528','2022-11-06 10:43:00.360828'),
(27,'myapp','0010_payment_amount','2022-11-06 10:43:00.392088'),
(28,'myapp','0011_payment_feedback','2022-11-06 10:43:00.423322'),
(29,'myapp','0012_auto_20221030_1833','2022-11-06 10:43:00.438946'),
(30,'myapp','0013_alter_payment_amount','2022-11-06 10:43:00.517063'),
(31,'myapp','0014_cart','2022-11-06 10:43:00.688921'),
(32,'myapp','0015_order_main_order_sub','2022-11-06 10:43:00.985767'),
(33,'myapp','0016_auto_20221104_1109','2022-11-06 10:43:01.079545'),
(34,'sessions','0001_initial','2022-11-06 10:43:01.126380'),
(35,'myapp','0017_rename_feedback_payment_reciept','2022-11-07 06:08:51.046303'),
(36,'myapp','0018_alter_order_sub_order','2022-11-07 09:21:50.202978'),
(37,'myapp','0019_auto_20221107_1716','2022-11-07 11:46:18.936574'),
(38,'myapp','0020_alter_payment_order','2022-11-08 03:35:06.088350'),
(39,'myapp','0021_alter_payment_order','2022-11-08 03:44:40.412928'),
(40,'myapp','0022_alter_payment_order','2022-11-08 03:44:40.476115'),
(41,'myapp','0023_alter_deliverystatus_order','2022-11-08 04:47:37.720194'),
(42,'myapp','0024_auto_20221108_1042','2022-11-08 05:12:22.692544'),
(43,'myapp','0025_alter_order_main_date','2022-11-08 06:36:47.879901'),
(44,'myapp','0026_alter_order_sub_qty','2022-11-08 07:47:10.419732'),
(45,'myapp','0027_alter_meat_price_kg','2022-11-08 07:48:47.590864');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('qyrmpbuo3m0qkloyfqcwstf6ryb1kek7','.eJyrVsrJTFGyMtZRKi7JT84GsZUMlXSU8kEsQzMdpcTcvBIlKyNTAz0DHaVSsKiOUkk-UMzUxAAsmJ8LFjWvBQAsLBSP:1osLFT:5zuLh0-puVSaLWN8ih8_zlblx1R6MpO6nX3b0bhK_gI','2022-11-22 09:50:27.524756');

/*Table structure for table `myapp_bank` */

DROP TABLE IF EXISTS `myapp_bank`;

CREATE TABLE `myapp_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountnumber` varchar(40) NOT NULL,
  `cvv` varchar(40) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_bank` */

/*Table structure for table `myapp_cart` */

DROP TABLE IF EXISTS `myapp_cart`;

CREATE TABLE `myapp_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` varchar(50) NOT NULL,
  `meatid_id` int NOT NULL,
  `userid_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_cart_meatid_id_58906760_fk_myapp_meat_id` (`meatid_id`),
  KEY `myapp_cart_userid_id_32c339e3_fk_myapp_user_id` (`userid_id`),
  CONSTRAINT `myapp_cart_meatid_id_58906760_fk_myapp_meat_id` FOREIGN KEY (`meatid_id`) REFERENCES `myapp_meat` (`id`),
  CONSTRAINT `myapp_cart_userid_id_32c339e3_fk_myapp_user_id` FOREIGN KEY (`userid_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_cart` */

/*Table structure for table `myapp_deliveryboy` */

DROP TABLE IF EXISTS `myapp_deliveryboy`;

CREATE TABLE `myapp_deliveryboy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `housename` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `LOGIN_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_deliveryboy_LOGIN_id_cb102ebb_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_deliveryboy_LOGIN_id_cb102ebb_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_deliveryboy` */

insert  into `myapp_deliveryboy`(`id`,`name`,`email_id`,`housename`,`place`,`city`,`state`,`pincode`,`phone_no`,`LOGIN_id`) values 
(1,'Amal','amal@gmail.com','kbdkbsjkzb','calicat','calicat','calicat','675879','8687837593',3);

/*Table structure for table `myapp_deliverystatus` */

DROP TABLE IF EXISTS `myapp_deliverystatus`;

CREATE TABLE `myapp_deliverystatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `DELIVERY_id` int NOT NULL,
  `ORDER_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_deliverystatus_DELIVERY_id_2b0e5b8e_fk_myapp_del` (`DELIVERY_id`),
  KEY `myapp_deliverystatus_ORDER_id_5caf6b79_fk_myapp_order_main_id` (`ORDER_id`),
  CONSTRAINT `myapp_deliverystatus_DELIVERY_id_2b0e5b8e_fk_myapp_del` FOREIGN KEY (`DELIVERY_id`) REFERENCES `myapp_deliveryboy` (`id`),
  CONSTRAINT `myapp_deliverystatus_ORDER_id_5caf6b79_fk_myapp_order_main_id` FOREIGN KEY (`ORDER_id`) REFERENCES `myapp_order_main` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_deliverystatus` */

insert  into `myapp_deliverystatus`(`id`,`date`,`status`,`DELIVERY_id`,`ORDER_id`) values 
(4,'2022-11-02','Delivered',1,13),
(5,'2022-11-08','Delivered',1,13),
(6,'2022-11-08','Delivered',1,12),
(7,'2022-11-08','Delivered',1,14),
(8,'2022-11-08','pending',1,15),
(9,'2022-11-08','pending',1,16),
(10,'2022-11-08','pending',1,17);

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedback` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `ORDER_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_ORDER_id_bbe13155_fk_myapp_order_main_id` (`ORDER_id`),
  CONSTRAINT `myapp_feedback_ORDER_id_bbe13155_fk_myapp_order_main_id` FOREIGN KEY (`ORDER_id`) REFERENCES `myapp_order_main` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`feedback`,`date`,`ORDER_id`) values 
(1,'jdlkfjdk','2022-11-08',13),
(2,'dfgfdgdfgdfg','2022-11-08',13);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`type`) values 
(1,'admin@gmail.com','admin','admin'),
(2,'akhi@gmail.com','12345','user'),
(3,'amal@gmail.com','2687','deliveryboy');

/*Table structure for table `myapp_meat` */

DROP TABLE IF EXISTS `myapp_meat`;

CREATE TABLE `myapp_meat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meat_name` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price/kg` int NOT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_meat` */

insert  into `myapp_meat`(`id`,`meat_name`,`type`,`price/kg`,`image`) values 
(1,'ayila','Normal',250,'/media/20221107084447.jpg'),
(2,'Nathal','Normal',450,'/media/20221108084259.jpg');

/*Table structure for table `myapp_order_main` */

DROP TABLE IF EXISTS `myapp_order_main`;

CREATE TABLE `myapp_order_main` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(30) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_order_main_user_id_866a208a_fk_myapp_user_id` (`user_id`),
  CONSTRAINT `myapp_order_main_user_id_866a208a_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_order_main` */

insert  into `myapp_order_main`(`id`,`status`,`amount`,`user_id`,`date`) values 
(12,'Delivered','500.0',1,'2022-11-07'),
(13,'Delivered','0',1,'2022-11-07'),
(14,'Delivered','750.0',1,'2022-11-07'),
(15,'Assigned','750.0',1,'2022-11-08'),
(16,'Assigned','1750.0',1,'2022-11-08'),
(17,'Assigned','5400.0',1,'2022-11-08');

/*Table structure for table `myapp_order_sub` */

DROP TABLE IF EXISTS `myapp_order_sub`;

CREATE TABLE `myapp_order_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `meat_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_order_sub_meat_id_b023b208_fk_myapp_meat_id` (`meat_id`),
  KEY `myapp_order_sub_order_id_d8f4c024_fk_myapp_order_main_id` (`order_id`),
  CONSTRAINT `myapp_order_sub_meat_id_b023b208_fk_myapp_meat_id` FOREIGN KEY (`meat_id`) REFERENCES `myapp_meat` (`id`),
  CONSTRAINT `myapp_order_sub_order_id_d8f4c024_fk_myapp_order_main_id` FOREIGN KEY (`order_id`) REFERENCES `myapp_order_main` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_order_sub` */

insert  into `myapp_order_sub`(`id`,`qty`,`meat_id`,`order_id`) values 
(2,2,1,13),
(3,3,1,14),
(4,3,1,15),
(5,4,1,16),
(6,3,1,16),
(7,12,2,17);

/*Table structure for table `myapp_payment` */

DROP TABLE IF EXISTS `myapp_payment`;

CREATE TABLE `myapp_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `ORDER_id` int NOT NULL,
  `amount` varchar(20) NOT NULL,
  `reciept` varchar(150) NOT NULL,
  `feedback` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_payment_ORDER_id_90f79814_fk_myapp_order_main_id` (`ORDER_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_payment` */

insert  into `myapp_payment`(`id`,`date`,`status`,`ORDER_id`,`amount`,`reciept`,`feedback`) values 
(1,'2022-11-07','Delivered',14,'250.0','/media/20221107-150248.jpg','kfghsdjgjk'),
(2,'2022-11-07','Delivered',16,'250.0','/media/20221107-170005.jpg','kdkflgkdfkhskg'),
(3,'2022-11-07','Delivered',16,'250.0','/media/20221107-171723.jpg','lxjdkfj'),
(4,'2022-11-08','paid',16,'250.0','/media/20221108-120352.jpg','pending');

/*Table structure for table `myapp_stock` */

DROP TABLE IF EXISTS `myapp_stock`;

CREATE TABLE `myapp_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `date` date NOT NULL,
  `MEAT_id` int NOT NULL,
  `curstock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_stock_MEAT_id_0e8d1180_fk_myapp_meat_id` (`MEAT_id`),
  CONSTRAINT `myapp_stock_MEAT_id_0e8d1180_fk_myapp_meat_id` FOREIGN KEY (`MEAT_id`) REFERENCES `myapp_meat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_stock` */

insert  into `myapp_stock`(`id`,`quantity`,`date`,`MEAT_id`,`curstock`) values 
(1,15,'2022-11-07',1,94),
(2,50,'2022-11-08',2,50);

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `house_name` varchar(30) NOT NULL,
  `place` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pin code` int NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone no` varchar(20) NOT NULL,
  `LOGIN_id` int NOT NULL,
  `image` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`name`,`gender`,`house_name`,`place`,`city`,`pin code`,`email`,`phone no`,`LOGIN_id`,`image`) values 
(1,'Akhil','Male','Krishnalayam','Kannur','Kannur',678987,'akhi@gmail.com','8546389237',2,'/media/20221106225640.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.6.19 : Database - komoline
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`komoline` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `komoline`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NameIndex` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`) values (9,'Beef Products'),(2,'Dairy and Egg Products'),(3,'Fats and Oils'),(10,'Finfish and Shellfish Products'),(7,'Fruits and Fruit Juices'),(11,'Lamb, Veal, and Game Products'),(1,'Legumes and Legume Products'),(12,'Nut and Seed Products'),(4,'Pork Products'),(6,'Poultry Products'),(5,'Spices and Herbs'),(8,'Vegetables and Vegetable Products');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` varchar(30) NOT NULL,
  `category` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `min_order` double DEFAULT '0',
  `description` text,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price` double DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_products_owner` (`owner_id`),
  KEY `FK_products_category` (`category`),
  CONSTRAINT `FK_products_category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  CONSTRAINT `FK_products_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`category`,`name`,`min_order`,`description`,`created_time`,`price`,`is_deleted`,`owner_id`,`photo_path`) values ('eidz_V0nQU2EpSp9_uHEtg',12,'Pomegranat KABLAMMO!',10,NULL,'2016-04-26 22:38:07',150000,0,2,'Bomb.png');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `trans_id` int(11) NOT NULL,
  `rating` double NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`trans_id`),
  CONSTRAINT `FK_ratings` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ratings` */

insert  into `ratings`(`trans_id`,`rating`,`created_time`) values (3,1,'2016-04-15 07:00:37');

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `trans_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`trans_id`),
  CONSTRAINT `FK_reviews` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reviews` */

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `tag_name` varchar(50) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  PRIMARY KEY (`tag_name`,`product_id`),
  KEY `FK_tags_product` (`product_id`),
  CONSTRAINT `FK_tags_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tags` */

insert  into `tags`(`tag_name`,`product_id`) values ('red fruit','eidz_V0nQU2EpSp9_uHEtg');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(30) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finish_time` timestamp NULL DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `quantity` double DEFAULT '0' COMMENT 'in kilograms',
  `code` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CodeIndex` (`code`),
  KEY `FK_transactions_buyer` (`buyer_id`),
  KEY `FK_transactions_product` (`product_id`),
  CONSTRAINT `FK_transactions_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_transactions_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `transactions` */

insert  into `transactions`(`id`,`product_id`,`buyer_id`,`start_time`,`finish_time`,`status`,`quantity`,`code`) values (1,'eidz_V0nQU2EpSp9_uHEtg',2,'2016-03-12 14:47:54',NULL,'Started',100,'i_ASfPye3EKtI1ypZVHP_Q'),(2,'eidz_V0nQU2EpSp9_uHEtg',2,'2016-03-12 14:53:41',NULL,'Started',237.48,'E6HSwyDT10GUUTmTki1vAA'),(3,'eidz_V0nQU2EpSp9_uHEtg',2,'2016-04-15 06:38:10',NULL,'Finished',444,'fbDLZimumkGZFXad6m4Fpg'),(4,'eidz_V0nQU2EpSp9_uHEtg',3,'2016-04-26 22:34:29',NULL,'Started',69,'m9QJ_6XQFEmNkF2CDN4i4w'),(8,'eidz_V0nQU2EpSp9_uHEtg',3,'2016-04-26 22:48:02',NULL,'Started',12,'h-oXySkBmke8x-BNMOlLkw'),(9,'eidz_V0nQU2EpSp9_uHEtg',3,'2016-04-26 23:00:09',NULL,'Started',27832,'I7hxT37hF0-nB_IY4ZSMDw'),(10,'eidz_V0nQU2EpSp9_uHEtg',3,'2016-04-26 23:00:40',NULL,'Started',100.75,'H3vvEnCeKUaKwA6Ku0rZsw');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed_time` timestamp NULL DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `request_promotion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`name`,`address`,`phone_number`,`email`,`photo_path`,`register_time`,`confirmed_time`,`status`,`is_deleted`,`request_promotion`) values (1,'DragunoVoid','1000:kU296zlo0AQjpZ/7APdJv9kYNdizRZAw:tqBh2PsrAMsrCUs7vGLWNnsSdUS0qSDY','Edo Fanuel Siswanto',NULL,NULL,'edofanuel.siswanto@yahoo.co.id','Default.jpg','2016-03-10 23:58:40',NULL,'admin',NULL,NULL),(2,'lusi','1000:Krt+T6tRU5S7rn2R0+VXAP/6YYtuTGwn:6wNnMQ9WquHYXzQ+FdVmyuWf8ZsDBgFY','Kucing','TKI Sekian...','+62-896-609-498-87','lusianawijayanti@gmail.com','Default.jpg','2016-03-11 22:57:08',NULL,'Vendor',NULL,NULL),(3,'edofanuel','1000:THycfBuoQNY5EFYNcq4A6DE6vlnik1ND:m+A0WCzCAUfKt2W6xJamqoeCipe8jmI/','Edo Fanuel','Kopo Permai II 2CD no.9','081320911587','dragunovoid@gmail.com','6358.jpg','2016-04-26 20:05:43',NULL,'Buyer',NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

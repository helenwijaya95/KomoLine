/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.1.30-community : Database - komoline
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

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

insert  into `products`(`id`,`category`,`name`,`min_order`,`description`,`created_time`,`price`,`is_deleted`,`owner_id`,`photo_path`) values ('BK1',8,'Brokoli',5,'Brokoli segar menggunakan bibit import langsung dipanen dari kebun.','2016-04-15 05:05:14',4000,0,2,'brokoli.jpg'),('BK2',9,'Daging Sapi',5,'Daging sapi lokal berasal dari sapi sehat milik peternakan keluarga.\r\nSemasa hidupnya, sapi diberi vitamin dan rumput segar sehingga\r\nmenghasilkan daging sapi berkualitas\r\n','2016-04-26 00:08:56',60000,0,6,'dagingsapi.png'),('BK3',12,'Susu Kacang Kedelai',1,'Dibuat dari 100% kacang kedelai asli tanpa bahan pengawet.\r\n','2016-04-26 00:12:11',12000,0,6,'susukedelai.png'),('eidz_V0nQU2EpSp9_uHEtg',7,'Pomegranat KABLAMMO!',0,'Buah pome bom kualitas import. Bibit berasal dari Thailand.','2016-04-26 00:11:49',150000,0,2,'Bomb.png');

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

insert  into `ratings`(`trans_id`,`rating`,`created_time`) values (4,5,'2016-04-22 09:05:13');

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

insert  into `reviews`(`trans_id`,`content`,`created_time`) values (3,'helloooo\r\n','2016-04-15 13:00:08'),(4,'RPLL','2016-04-22 09:04:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `transactions` */

insert  into `transactions`(`id`,`product_id`,`buyer_id`,`start_time`,`finish_time`,`status`,`quantity`,`code`) values (3,'eidz_V0nQU2EpSp9_uHEtg',4,'2016-04-15 04:21:17','2016-10-01 12:11:10','Finished',2,'5'),(4,'eidz_V0nQU2EpSp9_uHEtg',4,'2016-04-15 04:21:21','2016-10-01 12:11:10','Finished',3,'6');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `Username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`name`,`address`,`phone_number`,`email`,`photo_path`,`register_time`,`confirmed_time`,`status`,`is_deleted`) values (1,'DragunoVoid','1000:kU296zlo0AQjpZ/7APdJv9kYNdizRZAw:tqBh2PsrAMsrCUs7vGLWNnsSdUS0qSDY','Edo Fanuel Siswanto',NULL,NULL,'edofanuel.siswanto@yahoo.co.id','Default.jpg','2016-03-10 23:58:40',NULL,'admin',NULL),(2,'lusi','1000:Krt+T6tRU5S7rn2R0+VXAP/6YYtuTGwn:6wNnMQ9WquHYXzQ+FdVmyuWf8ZsDBgFY','Lusiana Wijayanti','TKI Sekian...','+62-896-609-498-87','lusianawijayanti@gmail.com','Default.jpg','2016-03-11 22:57:08',NULL,'vendor',NULL),(4,'helen','1000:whFT3NUCAoTmNievg2Zp/zCDThzhLjad:7tvRYPfjvuJZNPXt0LSJMcU3u4E36qVi','Abc def',NULL,'0939848957948','helz.w8312@gmail.com','Default.jpg','2016-04-06 12:53:43',NULL,'admin',NULL),(5,'aaa','1000:207RMox3z3bR6PFyc9Wf0ZKgeTVm2XuR:CqytdIvbJtmRhcuvJBurObdK0Utp984r','Helen Wijaya',NULL,'0939848957948','helz.w8312@gmail.com','Default.jpg','2016-04-06 16:10:30',NULL,'admin',NULL),(6,'chiko','1000:yCsFbi2mKMKm3W2d3OsJtxQkpDqbhZD5:5UstrEy9MRMSL03dgAnU8LCiH8BsvNwy','Chikongunya',NULL,NULL,'chiko@yahoo.co.id','Default.jpg','2016-04-12 10:00:31',NULL,'vendor',NULL),(7,'lusilala','1000:yZtqI67V2lmPv61feQbSBOt4qHmPcGXU:FDKwfLyo9kIAlzIcALUANcuslW5FWNsc','lusilala',NULL,NULL,'lusi@gmail.com','Default.jpg','2016-04-15 08:15:20',NULL,'buyer',NULL),(8,'','1000:U+rjZo+3h7nyTokMJYslt93W4eHJQUxP:LLlCwIClDF1tHowM1rIfQI92kcU05xur','',NULL,NULL,'abc@gmail.com','Default.jpg','2016-04-26 01:15:55',NULL,'buyer',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

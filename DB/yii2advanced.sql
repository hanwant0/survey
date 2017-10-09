/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.13-MariaDB : Database - yii2advanced
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yii2advanced` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `yii2advanced`;

/*Table structure for table `answer_choices` */

DROP TABLE IF EXISTS `answer_choices`;

CREATE TABLE `answer_choices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `choice` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `question_id` int(10) unsigned NOT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `answer_choices` */

insert  into `answer_choices`(`id`,`choice`,`question_id`,`order`) values (1,'yes',7,NULL),(2,'no',7,NULL),(3,'test',8,NULL),(4,'sdsds',8,NULL),(5,'sds',8,NULL),(6,'d',8,NULL),(7,'dsd',8,NULL),(8,'s',8,NULL),(9,'ds',8,NULL),(10,'sd',8,NULL),(11,'fdfdfdfdf',8,NULL),(12,'df',8,NULL),(13,'fd',8,NULL),(14,'fdfdfd',8,NULL),(15,'fdf',8,NULL),(16,'dfdfdf',8,NULL);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `country` */

insert  into `country`(`code`,`name`,`population`) values ('AU','Australia',18886000),('BR','Brazil',170115000),('CA','Canada',1147000),('CN','China',1277558000),('DE','Germany',82164700),('FR','France',59225700),('GB','United Kingdom',59623400),('IN','India',1013662000),('NI','Nigeria',3500000),('RU','Russia',146934000),('US','United States',278357000);

/*Table structure for table `country_x` */

DROP TABLE IF EXISTS `country_x`;

CREATE TABLE `country_x` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `country_x` */

insert  into `country_x`(`id`,`code`,`title`,`details`) values (1,'re','r','ddfsdf'),(3,'hghg','jhj','gh'),(12,'sdf','df','sdf'),(13,'sdf','df','sdf'),(14,'qwe','hjh','jjk'),(15,'klkjadsajdj','jsjj','kjk');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `c_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `c_contact_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cg_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer` */

insert  into `customer`(`c_id`,`c_name`,`c_email`,`c_contact_no`,`cg_id`) values (2,'rahul','rahul@gmail.com','12345678',12);

/*Table structure for table `customer_group` */

DROP TABLE IF EXISTS `customer_group`;

CREATE TABLE `customer_group` (
  `cg_id` int(11) NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_group` */

insert  into `customer_group`(`cg_id`,`cg_name`) values (1,'jhj');

/*Table structure for table `customer_group_assign` */

DROP TABLE IF EXISTS `customer_group_assign`;

CREATE TABLE `customer_group_assign` (
  `cga_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`cga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `customer_group_assign` */

/*Table structure for table `migration` */

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migration` */

insert  into `migration`(`version`,`apply_time`) values ('m000000_000000_base',1492718794),('m130524_201442_init',1492718800);

/*Table structure for table `professions` */

DROP TABLE IF EXISTS `professions`;

CREATE TABLE `professions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `professions` */

insert  into `professions`(`id`,`title`,`created_at`,`updated_at`) values (6,'house wife','2017-10-09 08:20:13','2017-10-09 08:20:13'),(7,'government employe','2017-10-09 08:20:54','2017-10-09 08:20:54');

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_type` enum('single','multiple') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'single',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `questions` */

insert  into `questions`(`id`,`question`,`answer_type`,`created_at`,`updated_at`) values (1,'hjhjhj','multiple','2017-10-09 06:20:36','2017-10-09 06:20:36'),(2,'hiii','single','2017-10-09 06:20:54','2017-10-09 06:20:54'),(3,'hiii','single','2017-10-09 07:38:29','2017-10-09 07:38:29'),(4,'hii','single','2017-10-09 08:00:46','2017-10-09 08:00:46'),(5,'hii','multiple','2017-10-09 08:02:34','2017-10-09 08:02:34'),(6,'hii','single','2017-10-09 08:03:30','2017-10-09 08:03:30'),(7,'hii','single','2017-10-09 08:04:03','2017-10-09 08:04:03'),(8,'testt','single','2017-10-09 08:06:12','2017-10-09 08:06:12');

/*Table structure for table `submission_answer` */

DROP TABLE IF EXISTS `submission_answer`;

CREATE TABLE `submission_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int(10) unsigned NOT NULL,
  `choice_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submission_id` (`submission_id`),
  KEY `choice_id` (`choice_id`),
  CONSTRAINT `submission_answer_ibfk_1` FOREIGN KEY (`submission_id`) REFERENCES `user_survey_submission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `submission_answer_ibfk_2` FOREIGN KEY (`choice_id`) REFERENCES `answer_choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `submission_answer` */

/*Table structure for table `survey` */

DROP TABLE IF EXISTS `survey`;

CREATE TABLE `survey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_of_questions` int(3) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `survey` */

insert  into `survey`(`id`,`title`,`no_of_questions`,`created_at`,`updated_at`) values (1,'servey 1',29,NULL,'2017-10-08 22:43:46'),(2,'dfd',23,'2017-10-08 22:41:06','2017-10-08 22:41:06'),(3,'xcx',1,'2017-10-08 23:03:11','2017-10-08 23:03:11');

/*Table structure for table `survey_profession_trans` */

DROP TABLE IF EXISTS `survey_profession_trans`;

CREATE TABLE `survey_profession_trans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(10) unsigned NOT NULL,
  `profession_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  KEY `profession_id` (`profession_id`),
  CONSTRAINT `survey_profession_trans_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `survey_profession_trans_ibfk_2` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `survey_profession_trans` */

/*Table structure for table `survey_question_trans` */

DROP TABLE IF EXISTS `survey_question_trans`;

CREATE TABLE `survey_question_trans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `survey_question_trans_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `survey_question_trans_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

/*Data for the table `survey_question_trans` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`name`,`status`,`created_at`,`updated_at`) values (1,'rahul','FZZDzNP9h-1M4ey1M8sRP8uDrQSfuPPu','$2y$13$dk.Onor69GB17wp1fXA13e1SK.InY.OV.MwJHKaB4qPMdCB3WCybq',NULL,'rahul@gmail.com','',10,1501936747,1501936747),(2,'rahulsingh','QbkXjHj7Y2NgPgK7spsgchWTz2BSbrdm','$2y$13$pURKYtqh4nITjnPsFHYIdeCXo7FHY2GWUPwGxVGYOYtnelpypQj5O','Gd3n8gMxy96fFMg9mfiwVfnKIDFf8NT0_1507470480','rahuls@gmail.com','',10,1507470397,1507470480),(3,'hanwant','qShFj28IrM4f-8UQaDMOjTgn6iZCE8AV','$2y$13$GLG34vsiQ8jC.3eC8ny68eubsyaxOVZdmUjZGGUKzGHLIhpdMF.Ha',NULL,'hanwant0@gmail.com','',10,1507567346,1507567346);

/*Table structure for table `user_survey_submission` */

DROP TABLE IF EXISTS `user_survey_submission`;

CREATE TABLE `user_survey_submission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `survey_id` int(10) unsigned NOT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `user_survey_submission_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_survey_submission` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

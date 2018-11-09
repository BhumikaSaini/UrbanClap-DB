DROP DATABASE IF EXISTS `UrbanClap`;
CREATE DATABASE `UrbanClap`;
USE `UrbanClap`;

DROP TABLE IF EXISTS `CATEGORY`;
CREATE TABLE `CATEGORY` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `CITY`;
CREATE TABLE `CITY` (
  `city_id` int(10) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `city_state` varchar(45) NOT NULL,
  `city_country` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER` (
  `cust_id` int(10) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(45) NOT NULL,
  `cust_gender` varchar(1) NOT NULL,
  `cust_email` varchar(45) NOT NULL,
  `cust_mobile` varchar(15) NOT NULL,
  `cust_street` varchar(45) NOT NULL,
  `city_id` int(10) NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_id_UNIQUE` (`cust_id`),
  UNIQUE KEY `cust_mobile_UNIQUE` (`cust_mobile`),
  UNIQUE KEY `cust_email_UNIQUE` (`cust_email`),
  KEY `fk_CUSTOMER_city_id_idx` (`city_id`),
  CONSTRAINT `fk_CUSTOMER_city_id` FOREIGN KEY (`city_id`) 
  REFERENCES `CITY` (`city_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `OFFER`;
CREATE TABLE `OFFER` (
  `off_id` int(10) NOT NULL AUTO_INCREMENT,
  `off_name` varchar(45) NOT NULL,
  `off_desc` varchar(45) NOT NULL,
  `off_discount` float NOT NULL,
  PRIMARY KEY (`off_id`),
  UNIQUE KEY `offer_id_UNIQUE` (`off_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `PARTNER`;
CREATE TABLE `PARTNER` (
  `part_id` int(10) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(45) NOT NULL,
  `part_gender` varchar(45) NOT NULL,
  `part_email` varchar(45) NOT NULL,
  `part_mobile` varchar(15) NOT NULL,
  `part_profession` varchar(45) NOT NULL,
  `serv_id` int(10) NOT NULL,
  PRIMARY KEY (`part_id`),
  UNIQUE KEY `part_id_UNIQUE` (`part_id`),
  UNIQUE KEY `part_email_UNIQUE` (`part_email`),
  UNIQUE KEY `part_mobile_UNIQUE` (`part_mobile`),
  KEY `fk_PARTNER_serv_id_idx` (`serv_id`),
  CONSTRAINT `fk_PARTNER_serv_id` FOREIGN KEY (`serv_id`) 
  REFERENCES `SERVICE` (`serv_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `SERVICE`;
CREATE TABLE `SERVICE` (
  `serv_id` int(10) NOT NULL AUTO_INCREMENT,
  `serv_name` varchar(45) NOT NULL,
  `serv_desc` varchar(45) NOT NULL,
  `serv_rating` float NOT NULL,
  `serv_email` varchar(45) NOT NULL,
  `serv_mobile` varchar(45) NOT NULL,
  `serv_cost` float NOT NULL,
  `serv_commission` float NOT NULL,
  `serv_street` varchar(45) NOT NULL,
  `city_id` int(10) NOT NULL,
  PRIMARY KEY (`serv_id`),
  UNIQUE KEY `serv_id_UNIQUE` (`serv_id`),
  UNIQUE KEY `serv_name_UNIQUE` (`serv_name`),
  KEY `fk_SERVICE_city_id_idx` (`city_id`),
  CONSTRAINT `fk_SERVICE_city_id` FOREIGN KEY (`city_id`) 
  REFERENCES `CITY` (`city_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `avails`;
CREATE TABLE `avails` (
  `avails_id` int(10) NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) NOT NULL,
  `off_id` int(10) NOT NULL,
  PRIMARY KEY (`avails_id`),
  UNIQUE KEY `avails_id_UNIQUE` (`avails_id`),
  KEY `fk_avails_cust_id_idx` (`cust_id`),
  KEY `fk_avails_off_id_idx` (`off_id`),
  CONSTRAINT `fk_avails_cust_id` FOREIGN KEY (`cust_id`) 
  REFERENCES `CUSTOMER` (`cust_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_avails_off_id` FOREIGN KEY (`off_id`) 
  REFERENCES `OFFER` (`off_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `belongs_to`;
CREATE TABLE `belongs_to` (
  `belongs_id` int(10) NOT NULL AUTO_INCREMENT,
  `serv_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  PRIMARY KEY (`belongs_id`),
  UNIQUE KEY `belongs_id_UNIQUE` (`belongs_id`),
  KEY `fk_belongs_to_serv_id_idx` (`serv_id`),
  KEY `fk_belongs_to_cat_id_idx` (`cat_id`),
  CONSTRAINT `fk_belongs_to_cat_id` FOREIGN KEY (`cat_id`) 
  REFERENCES `CATEGORY` (`cat_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_belongs_to_serv_id` FOREIGN KEY (`serv_id`) 
  REFERENCES `SERVICE` (`serv_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `book_id` int(10) NOT NULL AUTO_INCREMENT,
  `book_date` datetime NOT NULL,
  `book_servdate` datetime NOT NULL,
  `book_remarks` varchar(250) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `serv_id` int(10) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `books_id_UNIQUE` (`book_id`),
  KEY `fk_books_cust_id_idx` (`cust_id`),
  KEY `fk_books_serv_id_idx` (`serv_id`),
  CONSTRAINT `fk_books_cust_id` FOREIGN KEY (`cust_id`) 
  REFERENCES `CUSTOMER` (`cust_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_books_serv_id` FOREIGN KEY (`serv_id`) 
  REFERENCES `SERVICE` (`serv_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks` (
  `fb_id` int(10) NOT NULL AUTO_INCREMENT,
  `fb_rating` float NOT NULL,
  `fb_desc` varchar(250) NOT NULL,
  `fb_date` datetime NOT NULL,
  `cust_id` int(10) NOT NULL,
  `part_id` int(10) NOT NULL,
  PRIMARY KEY (`fb_id`),
  UNIQUE KEY `fb_id_UNIQUE` (`fb_id`),
  KEY `fk_feedbacks_cust_id_idx` (`cust_id`),
  KEY `fk_feedbacks_part_id_idx` (`part_id`),
  CONSTRAINT `fk_feedbacks_cust_id` FOREIGN KEY (`cust_id`) 
  REFERENCES `CUSTOMER` (`cust_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_feedbacks_part_id` FOREIGN KEY (`part_id`) 
  REFERENCES `PARTNER` (`part_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `proposes`;
CREATE TABLE `proposes` (
  `proposes_id` int(10) NOT NULL AUTO_INCREMENT,
  `serv_id` int(10) NOT NULL,
  `off_id` int(10) NOT NULL,
  PRIMARY KEY (`proposes_id`),
  UNIQUE KEY `proposes_id_UNIQUE` (`proposes_id`),
  KEY `fk_proposes_serv_id_idx` (`serv_id`),
  KEY `fk_proposes_off_id_idx` (`off_id`),
  CONSTRAINT `fk_proposes_off_id` FOREIGN KEY (`off_id`) 
  REFERENCES `OFFER` (`off_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_proposes_serv_id` FOREIGN KEY (`serv_id`) 
  REFERENCES `SERVICE` (`serv_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `log_OFFERS`;
CREATE TABLE `log_OFFERS` (
  `id_log_offers` INT NOT NULL AUTO_INCREMENT,
  `action` VARCHAR(45) NOT NULL,
  `off_id` INT NOT NULL,
  `off_name` VARCHAR(45) NOT NULL,
  `off_desc` VARCHAR(45) NOT NULL,
  `off_discount` FLOAT NOT NULL,
  `changed_on` DATETIME NOT NULL,
  PRIMARY KEY (`id_log_offers`),
  UNIQUE INDEX `id_log_offers_UNIQUE` (`id_log_offers` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


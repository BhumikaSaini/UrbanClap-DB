-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: UrbanClap
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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


DROP DATABASE IF EXISTS `UrbanClap`;
CREATE DATABASE `UrbanClap`;
USE `UrbanClap`;

--
-- Table structure for table `CATEGORY`
--

DROP TABLE IF EXISTS `CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY`
--

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CITY`
--

DROP TABLE IF EXISTS `CITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CITY` (
  `city_id` int(10) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  `city_state` varchar(45) NOT NULL,
  `city_country` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_id_UNIQUE` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CITY`
--

LOCK TABLES `CITY` WRITE;
/*!40000 ALTER TABLE `CITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `CITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_CUSTOMER_city_id` FOREIGN KEY (`city_id`) REFERENCES `CITY` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFER`
--

DROP TABLE IF EXISTS `OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFER` (
  `off_id` int(10) NOT NULL AUTO_INCREMENT,
  `off_name` varchar(45) NOT NULL,
  `off_desc` varchar(45) NOT NULL,
  `off_discount` float NOT NULL,
  PRIMARY KEY (`off_id`),
  UNIQUE KEY `offer_id_UNIQUE` (`off_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFER`
--

LOCK TABLES `OFFER` WRITE;
/*!40000 ALTER TABLE `OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTNER`
--

DROP TABLE IF EXISTS `PARTNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_PARTNER_serv_id` FOREIGN KEY (`serv_id`) REFERENCES `SERVICE` (`serv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTNER`
--

LOCK TABLES `PARTNER` WRITE;
/*!40000 ALTER TABLE `PARTNER` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTNER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE`
--

DROP TABLE IF EXISTS `SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_SERVICE_city_id` FOREIGN KEY (`city_id`) REFERENCES `CITY` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE`
--

LOCK TABLES `SERVICE` WRITE;
/*!40000 ALTER TABLE `SERVICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avails`
--

DROP TABLE IF EXISTS `avails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avails` (
  `avails_id` int(10) NOT NULL AUTO_INCREMENT,
  `cust_id` int(10) NOT NULL,
  `off_id` int(10) NOT NULL,
  PRIMARY KEY (`avails_id`),
  UNIQUE KEY `avails_id_UNIQUE` (`avails_id`),
  KEY `fk_avails_cust_id_idx` (`cust_id`),
  KEY `fk_avails_off_id_idx` (`off_id`),
  CONSTRAINT `fk_avails_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `CUSTOMER` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_avails_off_id` FOREIGN KEY (`off_id`) REFERENCES `OFFER` (`off_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avails`
--

LOCK TABLES `avails` WRITE;
/*!40000 ALTER TABLE `avails` DISABLE KEYS */;
/*!40000 ALTER TABLE `avails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongs_to`
--

DROP TABLE IF EXISTS `belongs_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `belongs_to` (
  `belongs_id` int(10) NOT NULL AUTO_INCREMENT,
  `serv_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  PRIMARY KEY (`belongs_id`),
  UNIQUE KEY `belongs_id_UNIQUE` (`belongs_id`),
  KEY `fk_belongs_to_serv_id_idx` (`serv_id`),
  KEY `fk_belongs_to_cat_id_idx` (`cat_id`),
  CONSTRAINT `fk_belongs_to_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `CATEGORY` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_belongs_to_serv_id` FOREIGN KEY (`serv_id`) REFERENCES `SERVICE` (`serv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs_to`
--

LOCK TABLES `belongs_to` WRITE;
/*!40000 ALTER TABLE `belongs_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `belongs_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_books_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `CUSTOMER` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_books_serv_id` FOREIGN KEY (`serv_id`) REFERENCES `SERVICE` (`serv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `fk_feedbacks_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `CUSTOMER` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_feedbacks_part_id` FOREIGN KEY (`part_id`) REFERENCES `PARTNER` (`part_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposes`
--

DROP TABLE IF EXISTS `proposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proposes` (
  `proposes_id` int(10) NOT NULL AUTO_INCREMENT,
  `serv_id` int(10) NOT NULL,
  `off_id` int(10) NOT NULL,
  PRIMARY KEY (`proposes_id`),
  UNIQUE KEY `proposes_id_UNIQUE` (`proposes_id`),
  KEY `fk_proposes_serv_id_idx` (`serv_id`),
  KEY `fk_proposes_off_id_idx` (`off_id`),
  CONSTRAINT `fk_proposes_off_id` FOREIGN KEY (`off_id`) REFERENCES `OFFER` (`off_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_proposes_serv_id` FOREIGN KEY (`serv_id`) REFERENCES `SERVICE` (`serv_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposes`
--

LOCK TABLES `proposes` WRITE;
/*!40000 ALTER TABLE `proposes` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-30 11:29:28

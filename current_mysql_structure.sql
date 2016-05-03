-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: money
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.12.04.1

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
-- Table structure for table `_buckets`
--

USE money;

/* THE _buckets TABLE IS OBSOLETE AND CAN BE REMOVED */
DROP TABLE IF EXISTS `_buckets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
/*CREATE TABLE `_buckets` (
  `bucketId` int(255) NOT NULL,
  `bucketName` varchar(255) NOT NULL,
  `amount` float DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bucketId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;*/
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `account_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(56) NOT NULL,
  `account_amount` float NOT NULL DEFAULT '0',
  `owner_id` bigint(20) unsigned NOT NULL,
  `payschedule_code` int(10) unsigned NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booksummary`
--

/* RENAME TO 'categories' */
DROP TABLE IF EXISTS `booksummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booksummary` (
  `bookId` int(10) unsigned NOT NULL AUTO_INCREMENT, -- rename to category_id
  `bookName` varchar(25) NOT NULL DEFAULT 'New Book', -- rename to category_name
  `bookAmtNec` double NOT NULL DEFAULT '0', -- rename to amount_necessary
  `bookAmtCurrent` double NOT NULL DEFAULT '0', -- rename to current_amount
  `InterestBearing` tinyint(1) NOT NULL DEFAULT '0', -- interest_bearing
  `ownerId` int(10) unsigned NOT NULL DEFAULT '1', -- owner_id
  `priority` int(10) unsigned DEFAULT '5',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `due_months` varchar(26) NOT NULL DEFAULT '1|2|3|4|5|6|7|8|9|10|11|12',
  `due_day` int(11) NOT NULL DEFAULT '1',
  `account_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booktransactions`
--

/* THIS TABLE IS OBSOLETE AND CAN BE REMOVED */
DROP TABLE IF EXISTS `booktransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
/*CREATE TABLE `booktransactions` (
  `transactionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookId` varchar(255) NOT NULL DEFAULT '0',
  `ownerId` bigint(20) NOT NULL DEFAULT '0',
  `bookTransAmt` double NOT NULL DEFAULT '0',
  `TransType` char(1) NOT NULL DEFAULT '1' COMMENT 'a = Add, s = Subtract',
  `bookTransDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bookTransPlace` varchar(65) DEFAULT NULL,
  `new_fundsId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`transactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3867 DEFAULT CHARSET=latin1;*/
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cleared_transactions`
--

/* INVESTIGATE THIS TABLE AND SEE IF IT'S STILL BEING USED */
DROP TABLE IF EXISTS `cleared_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cleared_transactions` (
  `transactionId` int(255) NOT NULL DEFAULT '0', -- transaction_id
  `cleared_bank` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interest`
--

/* THIS TABLE WAS NEVER IMPLEMENTED INTO ANYTHING SO IT MAY NOT BE WORTH KEEPING */
DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT, -- id
  `bookId` int(11) NOT NULL, -- category_id
  `rate` float NOT NULL,
  `rate-type` int(11) NOT NULL, -- rate_type
  `amtOwed` double NOT NULL, -- amount_owed
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `link_name` varchar(120) DEFAULT NULL,
  `link_url` varchar(765) DEFAULT NULL,
  `sort_order` double DEFAULT NULL,
  `active_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category` varchar(120) DEFAULT NULL,
  `term_date` datetime DEFAULT NULL,
  `title` varchar(168) DEFAULT NULL,
  `class` varchar(300) DEFAULT NULL,
  `id` varchar(300) DEFAULT NULL,
  `type` varchar(126) DEFAULT NULL,
  `rel` varchar(126) DEFAULT NULL,
  `media` varchar(126) DEFAULT NULL,
  `href` varchar(765) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_history` (
  `UserId` int(11) NOT NULL DEFAULT '0', -- user_id
  `DateLoggedIn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- date_logged_in
  `LastUpdate` datetime DEFAULT NULL, -- last_update
  `DateLoggedOut` datetime DEFAULT NULL -- date_logged_out
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_funds`
--

DROP TABLE IF EXISTS `new_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_funds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerId` int(10) unsigned NOT NULL DEFAULT '1', -- owner_id or user_id
  `account_id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `gross` double NOT NULL,
  `net` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=394 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `note_text` varchar(255) NOT NULL,
  `note_priority` int(11) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payschedule`
--

DROP TABLE IF EXISTS `payschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payschedule` (
  `payScheduleId` int(10) unsigned NOT NULL AUTO_INCREMENT, -- pay_schedule_id
  `ownerId` int(10) unsigned NOT NULL, -- owner_id
  `paySchedule` int(10) unsigned NOT NULL DEFAULT '1', -- pay_schedule
  PRIMARY KEY (`payScheduleId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payschedule_lookup`
--

DROP TABLE IF EXISTS `payschedule_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payschedule_lookup` ( -- pay_schedule_lookup
  `payschedule_code` int(1) NOT NULL DEFAULT '0', -- pay_schedule_code
  `payschedule_translation` varchar(30) NOT NULL DEFAULT '' -- pay_schedule_translation
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules` (
  `rule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(140) NOT NULL,
  `rule_qualifier` varchar(140) DEFAULT NULL,
  `rule_value` varchar(165) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

/* THIS IS THE NEWER TRANSACTION TABLE, IT'S MUCH BETTER THAN THE OLD ON */
DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `to_category` double DEFAULT NULL,
  `from_category` double DEFAULT NULL,
  `to_account` double DEFAULT NULL,
  `from_account` varchar(180) DEFAULT NULL,
  `deposit_id` double DEFAULT NULL,
  `owner_id` double DEFAULT NULL,
  `transaction_amount` double DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_info` varchar(195) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10701 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT, -- id
  `Username` varchar(255) NOT NULL, -- username
  `Password` varchar(255) NOT NULL, -- password
  `Temp_pass` varchar(55) DEFAULT NULL, -- temp_password
  `Temp_pass_active` tinyint(1) NOT NULL DEFAULT '0', -- temp_password_active
  `Email` varchar(255) NOT NULL, -- email
  `dateAdded` datetime NOT NULL, -- date_added / date_joined
  `Active` int(11) NOT NULL DEFAULT '0', -- active
  `Level_access` int(11) NOT NULL DEFAULT '2', -- access_level
  `Random_key` varchar(32) DEFAULT NULL, -- random_key
  `agree_to_terms` datetime NOT NULL, -- agree_to_terms
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-03 16:59:32

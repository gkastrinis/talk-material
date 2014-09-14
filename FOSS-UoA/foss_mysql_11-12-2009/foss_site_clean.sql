-- MySQL dump 10.11
--
-- Host: localhost    Database: Site
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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

CREATE DATABASE IF NOT EXISTS Site;
USE Site;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `web_admins_username` varchar(20) NOT NULL,
  `date` date default NULL,
  `msg_en` varchar(50) default NULL,
  `msg_gr` varchar(50) default NULL,
  `link` varchar(300) default NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `events_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `events`
--



--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `feeds` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `web_admins_username` varchar(20) NOT NULL,
  `title` varchar(100) default NULL,
  `link` varchar(300) default NULL,
  `description` varchar(200) default NULL,
  `date` date default NULL,
  `type` varchar(20) default NULL,
  `lang` char(3) default NULL,
  `deleted` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `events_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `feeds`
--



--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `web_admins_username` varchar(20) NOT NULL,
  `ip` varchar(20) default NULL,
  `date` datetime default NULL,
  `action` varchar(40) default NULL,
  PRIMARY KEY  (`id`),
  KEY `posts_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `logs`
--



--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `web_admins_username` varchar(20) NOT NULL,
  `title` varchar(100) default NULL,
  `date` date default NULL,
  `edit_date` date default NULL,
  `body` text,
  `lang` char(3) default NULL,
  `deleted` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `posts_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `posts`
--



--
-- Table structure for table `web_admins`
--

DROP TABLE IF EXISTS `web_admins`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `web_admins` (
  `username` varchar(20) NOT NULL,
  `pass` varchar(64) default NULL,
  PRIMARY KEY  (`username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `web_admins`
--

LOCK TABLES `web_admins` WRITE;
/*!40000 ALTER TABLE `web_admins` DISABLE KEYS */;
INSERT INTO `web_admins` VALUES ('SpartanGeorge','$1$eS..Py1.$lfZfkTCxmiD.38eGn7H33/');
/*!40000 ALTER TABLE `web_admins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-09-09 19:40:34

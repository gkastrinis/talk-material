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
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `events_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'SpartanGeorge','2008-09-20','Software Freedom Day 2008','ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý 2008','display.php?msg_id=2',0),(2,'SpartanGeorge','2009-03-11','Opensource conference 2009 By Sun Hellas','Opensource conference 2009 By Sun Hellas','../gr/display.php?msg_id=7',0),(3,'SpartanGeorge','2009-04-08','Presentation about Linux','Çìåñßäá ó÷åôéêÜ ìå ôï Linux','../gr/display.php?msg_id=8',0),(4,'SpartanGeorge','2009-05-09','2nd FOSS Communities Conference','2ï ÓõíÝäñéï ÊïéíïôÞôùí ÅËËÁÊ','../gr/display.php?msg_id=6',0),(5,'SpartanGeorge','2009-05-10','2nd FOSS Communities Conference','2ï ÓõíÝäñéï ÊïéíïôÞôùí ÅËËÁÊ','../gr/display.php?msg_id=6',0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

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
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `events_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (1,'SpartanGeorge','Welcome to Foss UOA','http://foss.uoa.gr/gr/','Ôï Foss UOA åßíáé ç êïéíüôçôá áíïé÷ôïý êáé åëÝõèåñïõ ëïãéóìéêïý ôïõ Åèíéêïý êáé Êáðïäéóôñéáêïý Ðáíåðéóôçìßïõ Áèçíþí.','2009-09-10','General RSS','gr',0),(2,'SpartanGeorge','ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý 2008','http://foss-uoa/gr/display.php?msg_id=2','¸÷ïõìå ôçí ÷áñÜ íá áíáêïéíþóïõìå üôé ç ðüëç ôçò Èåóóáëïíßêçò èá öéëïîåíÞóåé ìéá åêäÞëùóç ôï ÓÜââáôï, 20 Óåðôåìâñßïõ ãéá ôçí ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý 2008.','2009-09-10','General RSS','gr',0),(3,'SpartanGeorge','ÍÝï Óýóôçìá ØçöéóìÜôùí','http://foss.uoa.gr/polls/poll.php','Óôïí óýíäåóìï http://foss.uoa.gr/polls/poll.php õðÜñ÷åé Ýíá áðëü óýóôçìá äçìéïõñãßáò øçöéóìÜôùí. Enjoy :)','2009-09-10','General RSS','gr',0),(4,'SpartanGeorge','RSS Feed ãéá ôéò óõíáíôÞóåéò','http://foss.uoa.gr/gr/display.php?msg_id=4','Áðü óÞìåñá õðÜñ÷åé äõíáôüôçôá åíçìÝñùóçò ãéá ôéò óõíáíôÞóåéò ôçò êïéíüôçôáò ìå ôç ÷ñÞóç RSS Feed.','2009-09-10','General RSS','gr',0),(5,'SpartanGeorge','2ï ÓõíÝäñéï ÊïéíïôÞôùí ÅËËÁÊ','http://foss.uoa.gr/gr/display.php?msg_id=6','2ï ÓõíÝäñéï ÊïéíïôÞôùí ÅËËÁÊ áðü FOSSCOMM.','2009-09-10','General RSS','gr',0),(6,'SpartanGeorge','Opensource conference 2009 By Sun Hellas','http://foss.uoa.gr/gr/display.php?msg_id=7','Opensource conference 2009 By Sun Hellas - 11/03/2009.','2009-09-10','General RSS','gr',0),(7,'SpartanGeorge','Çìåñßäá ó÷åôéêÜ ìå ôï Linux - (08/04/2009 - 15.00-19.00 Á2)','http://foss.uoa.gr/gr/display.php?msg_id=8','Çìåñßäá ó÷åôéêÜ ìå ôï Linux - ÔåôÜñôç 08/04/2009 - 15.00-19.00 Áßèïõóá Á2 (ÔìÞìá ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí).','2009-09-10','General RSS','gr',0),(8,'SpartanGeorge','Server Downtime 02/09/2009 - 03/09/2009','http://foss.uoa.gr/gr/display.php?msg_id=9','Ï server ôçò êïéíüôçôáò èá åßíáé åêôüò ëåéôïõñãßáò óôï ÷ñïíéêü äéÜóôçìá 02/09/2009 - 03/09/2009 ëüãù ìåôáöïñÜò ôïõ õðïëïãéóôéêïý êÝíôñïõ.','2009-09-10','General RSS','gr',0),(9,'SpartanGeorge','30 Ïêôùâñßïõ (16.00)','http://foss.uoa.gr/forum/viewtopic.php?f=2&amp;t=214','Ç åðüìåíç óõíÜíôçóç ôçò êïéíüôçôáò èá ãßíåé ôçí ÐÝìðôç 30 Ïêôùâñßïõ óôéò 16.00 óôï ÷þñï ôïõ ÔìÞìáôïò ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí.','2009-09-10','Meetings RSS','gr',0),(10,'SpartanGeorge','ÐáñáóêåõÞ 20/03/2009 (15:00) - Áßèïõóá Ç','http://foss.uoa.gr/forum/viewtopic.php?f=2&amp;t=214','Ç åðüìåíç óõíÜíôçóç ôçò êïéíüôçôáò èá ãßíåé ôçí ÐáñáóêåõÞ 20/03/2009 óôéò 15:00 óôï ÷þñï ôïõ ÔìÞìáôïò ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí (ÌÜëëïí óôçí áßèïõóá Ç).','2009-09-10','Meetings RSS','gr',0),(11,'SpartanGeorge','ÐÝìðôç 30/04/2009 (16:00) - Áßèïõóá Ç','http://foss.uoa.gr/forum/viewtopic.php?f=2&amp;t=235','Ç åðüìåíç óõíÜíôçóç ôçò êïéíüôçôáò èá ãßíåé ôçí ÐÝìðôç 30/04/2009 óôéò 16:00 óôï ÷þñï ôïõ ÔìÞìáôïò ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí (ÌÜëëïí óôçí áßèïõóá Ç).','2009-09-10','Meetings RSS','gr',0),(12,'SpartanGeorge','ÐÝìðôç 04/06/2009 (15:00) - Áßèïõóá Ç','http://foss.uoa.gr/forum/viewtopic.php?f=2&amp;t=256','Ç åðüìåíç óõíÜíôçóç ôçò êïéíüôçôáò èá ãßíåé ôçí ÐÝìðôç 04/06/2009 óôéò 15:00 óôï ÷þñï ôïõ ÔìÞìáôïò ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí (ÌÜëëïí óôçí áßèïõóá Ç).','2009-09-10','Meetings RSS','gr',0),(13,'SpartanGeorge','Welcome to Foss UOA','http://foss.uoa.gr/en/','Foss UOA is the Free and Open Source Software community of the National and Kapodistrian University of Athens.','2009-09-10','General RSS','en',0),(14,'SpartanGeorge','Software Freedom Day 2008','http://foss-uoa/en/display.php?msg_id=2','We are proud to announce that Thessalonika will be hosting a special event on Saturday September 20th for Software Freedom Day 2008.','2009-09-10','General RSS','en',0),(15,'SpartanGeorge','New Poll System available','http://foss.uoa.gr/polls/poll.php','Following the url http://foss.uoa.gr/polls/poll.php you will find a simple system for creating various polls. Enjoy :)','2009-09-10','General RSS','en',0),(16,'SpartanGeorge','RSS feed for the community\'s meetings','http://foss.uoa.gr/en/display.php?msg_id=4','From today onwards an RSS Feed concerning the meetings of the community is available.','2009-09-10','General RSS','en',0),(17,'SpartanGeorge','October 30th (16.00)','http://foss.uoa.gr/forum/viewtopic.php?f=2&amp;t=134','The next meeting of the community will take place on Thursday October 30th at 16.00, at the premises of the Dep. of Informatics and Tel/s.','2009-09-10','Meetings RSS','en',0),(18,'SpartanGeorge','Friday 20/03/2009 (15:00) - Class Ç','http://foss.uoa.gr/forum/viewtopic.php?f=2&amp;t=134','The next meeting of the community will take place on Friday March 20th at 15.00, at the premises of the Dep. of Informatics and Tel/s.','2009-09-10','Meetings RSS','en',0);
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

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
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `posts_FKIndex1` (`web_admins_username`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'SpartanGeorge','Áíôß Ðñïëüãïõ','2008-05-12',NULL,'Êáëþò Þëèáôå óôïí äéêôõáêü ôüðï ôçò Êïéíüôçôáò Åëåýèåñïõ Ëïãéóìéêïý êáé Ëïãéóìéêïý Áíïé÷ôïý Êþäéêá (<a href=\"http://foss.uoa.gr/wiki/index.php/ELLAK:About\" >ÅË/ËÁÊ</a>) ôïõ <a href=\"http://www.uoa.gr/uoagr/uoaindex.htm\" >Ðáíåðéóôçìßïõ Áèçíþí</a>.<br />\r\n<br />\r\nÇ éäÝá ãéá ôçí äçìéïõñãßá ôçò êïéíüôçôáò îåêßíçóå áðü öïéôçôÝò ôïõ <a href=\"http://www.di.uoa.gr/gr/\" >ÔìÞìáôïò ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí</a>,\r\nêáé óýíôïìá õðÞñ÷å óõììåôï÷Þ êáé áðü öïéôçôÝò Üëëùí ó÷ïëþí ôïõ Ðáíåðéóôçìßïõ Áèçíþí.<br />\r\n<br />\r\nÏ ëüãïò ýðáñîçò ôçò êïéíüôçôáò åßíáé ç äéÜäïóç êáé óôÞñéîç ôïõ ÅË/ËÁÊ (Åëåýèåñï Ëïãéóìéêü/Ëïãéóìéêü Áíïé÷ôïý Êþäéêá), ìÝóù äñáóôçñéïôÞôùí üðùò:<br />\r\n- Ðáñï÷Þ ôå÷íéêÞò âïÞèåéáò<br />\r\n- ÄéåîáãùãÞ óåìéíáñßùí, ðáñïõóéÜóåùí êáé åêäçëþóåùí<br />\r\n- Óõììåôï÷Þ óå projects<br />\r\n<br />\r\nÏðïéoóäÞðïôå åíäéáöÝñåôáé êáé Ý÷åé üñåîç íá óõììåôÜó÷åé, åßíáé åõðñüóäåêôïò óôçí êïéíüôçôá êáé ôéò óõæçôÞóåéò ôçò.<br />\r\nÇ ðñïóðÜèåéá åßíáé áíïé÷ôÞ ãéá óõììåôï÷Þ ðñïò üëïõò.<br />\r\n<br />\r\nÓôü÷ïò ìáò åßíáé íá äéáäþóïõìå åöáñìïãÝò êáé ãåíéêüôåñá ôç öéëïóïößá ÅË/ËÁÊ ìÝóá êáé Ýîù\r\náðü ôï ÐáíåðéóôÞìéï, íá ðåßóïõìå ôïõò ÷ñÞóôåò íá ôï ðñïôéìÞóïõí êáé íá åíéó÷ýóïõìå ôç èÝóç\r\nôïõ þóôå íá ðåôý÷ïõìå íá ÷ñçóéìïðïéåßôáé ðáíôïý, ðñïáóðßæïíôáò ðáñÜëëçëá ôçí åëåõèåñßá óôï åðßðåäï ëïãéóìéêïý.<br />','gr',0),(2,'SpartanGeorge','ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý 2008','2008-09-13',NULL,'<a href=\"http://softwarefreedomday.org/about/el\" class=\"imglink\"><img src=\"../img/sfd08-el-banner468x60.png\" alt=\"ÇìÝñá Åëåýèåñïõ ëïãéóìéêïý 2008\" title=\"ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý 2008 (20 Óåðôåìâñßïõ)\"/></a><br />\r\n<br />\r\n¸÷ïõìå ôçí ÷áñÜ íá áíáêïéíþóïõìå üôé ç ðüëç ôçò Èåóóáëïíßêçò èá öéëïîåíÞóåé ìéá åêäÞëùóç ôï ÓÜââáôï, 20 Óåðôåìâñßïõ ãéá ôçí ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý 2008. ÁõôÞ åßíáé ìåãáëýôåñç äéåèíÞò åêäÞëùóç ãéá ôïí åïñôáóìü êáé ôçí ðñïþèçóç ôïõ Åëåýèåñïõ Ëïãéóìéêïý, ìå åêáôïíôÜäåò ïìÜäåò áðü üëï ôïí ðëáíÞôç íá óõììåôÝ÷ïõí óå áõôÞí!<br />\r\n<br />\r\nÓôçí óçìåñéíÞ øçöéáêÞ åðï÷Þ, ïé êáèçìåñéíÝò ìáò åìðåéñßåò åîáñôþíôáé üëï êáé ðåñéóóüôåñï áðü ôï ëïãéóìéêü. Ôï ëïãéóìéêü áóêåß åðéññïÞ óôï ðùò åðéêïéíùíïýìå ìå ôïõò ãýñï ìáò, ðùò äéáóêåäÜæïõìå, äïõëåýïõìå, áêüìá êáé ðùò âñßóêïõìå ôïí ðñïïñéóìü ìáò óôïõò äáéäáëþäåéò äñüìïõò ìéáò ðüëçò. Ôï ëïãéóìéêü óôçñßæåé ôïí ßäéï ôïí ôñüðï æùÞò ìáò, ôéò âáóéêÝò ìáò åëåõèåñßåò üðùò ç åëåõèåñßá ôçò óõíÜèñïéóçò, ç åëåõèåñßá ôçò óêÝøçò, Þ åëåõèåñßá ôçò åðéëïãÞò êáé Üëëåò. Ðáñüëá áõôÜ, ðïëëïß Üíèñùðïé äåí áíôéëáìâÜíïíôáé ôçí óçìáóßá êáé ôçí åðßäñáóç ôïõ ëïãéóìéêïý êáé Üëëùí ôå÷íïëïãéþí óôéò æùÝò ìáò.<br /> \r\n<br />\r\nÔé åííïïýìå üìùò ìå ôï Åëåýèåñï Ëïãéóìéêü; Ôï Åëåýèåñï Ëïãéóìéêü ðñüêåéôáé ãéá Ýíá ôå÷íïëïãéêü ìÝëëïí, ôï ïðïßï èá ìðïñïýìå íá åìðéóôåõôïýìå, ðïõ åßíáé âéþóéìï êáé äåí åðçñåÜæåé áñíçôéêÜ ôéò âáóéêÝò åëåõèåñßåò ìáò, ôéò ïðïßåò èåùñïýìå äåäïìÝíåò. Ëïãéóìéêü ðáñáêïëïýèçóçò, ôï ïðïßï ðáñáêïëïõèåß ôéò óõíïìéëßåò ìáò, ôïõò ôñáðåæéêïýò ëïãáñéáóìïýò ìáò, ôï çëåêôñïíéêü ôá÷õäñïìåßï ìáò, ìðïñåß êáé åãêáèéóôÜôå óôïõò õðïëïãéóôÝò ìáò ÷ùñßò ôçí ãíþóç ìáò. Ôï êëåßäùìá ôùí ôáéíéþí áíÜ ãåùãñáöéêÞ ðåñéï÷Þ, åéóÜãåé Ýíá ôå÷íçôü åìðüäéï óôï äéåèíÝò ðåñéå÷üìåíï - ðïõ åßíáé ç ðñïóùðéêÞ åðéëïãÞ ìáò; Éäéüêôçôåò ìïñöÝò äåäïìÝíùí ìðïñïýí íá ìáò êëåéäþíïõí Ýîù áðü ôï ßäéï ìáò ôï ðåñéå÷üìåíï. Ç Åëåõèåñßá ôïõ Ëïãéóìéêïý ìðïñåß íá óõíôçñçèåß ìüíï áðü äéáöáíÞ óõóôÞìáôá (üðùò ôï Åëåýèåñï êáé Áíïéêôïý Êþäéêá Ëïãéóìéêü) ðïõ åßíáé âáóéóìÝíá óå áíïéêôÜ, áóöáëÞ êáé âéþóéìá óôÜíôáñô, óõìðåñéëáìâáíïìÝíùí ôùí ìïñöþí äåäïìÝíùí êáé ôùí ðñùôïêüëëùí åðéêïéíùíßáò.<br /> \r\n<br />\r\nÇ ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý åßíáé Ýíá åôÞóéïò åïñôáóìüò ôïõ Åëåýèåñïõ Ëïãéóìéêïý êáé ãéáôß åßíáé óçìáíôéêü. Óôü÷ïò ìáò åßíáé ç åíçìÝñùóç ôïõ êïéíïý ãéá áõôÜ ôá óçìáíôéêÜ æçôÞìáôá. Ðëçñïöïñßåò ãéá ôçí åêäÞëùóç ãéá ôçí ÇìÝñá Åëåýèåñïõ Ëïãéóìéêïý óôçí Èåóóáëïíßêç ìðïñåßôå íá âñåßôå <a href=\"http://softwarefreedomday.org/about/el\" alt=\"about link\">åäþ</a> êáé óáò ðñïóêáëïýìå íá Ýñèåôå ãéá ìéá äéáóêåäáóôéêÞ çìÝñá ãåìÜôç áðü åíäéáöÝñïõóåò óõæçôÞóåéò, äùñÜêéá êáé ðëçñïöïñßåò.<br />\r\n<br />\r\n<a href=\"http://softwarefreedomday.org/teams/europe/greece/PressRelease\" alt=\"official article\">via</a><br />','gr',0),(3,'SpartanGeorge','Ðáñïõóßáóç óôï ìÜèçìá ôçò ÅéóáãùãÞò óôïí Ðñïãñáììáôéóìü','2008-10-22',NULL,'Ôçí ÐáñáóêåõÞ 24 Ïêôùâñßïõ èá ðñáãìáôïðïéçèåß ïëéãüëåðôç ðáñïõóßáóç ôçò êïéíüôçôáò, óôï ìÜèçìá ôçò <a href=\"http://cgi.di.uoa.gr/~ip/\" alt=\"IP link\">ÅéóáãùãÞò óôïí Ðñïãñáììáôéóìü</a> ôïõ ôìÞìáôïò ÐëçñïöïñéêÞò.<br />\r\n<br />\r\nÈÝìá ôçò ðáñïõóßáóçò áðïôåëåß ãåíéêÜ ç éäÝá ôïõ Åëåýèåñïõ Ëïãéóìéêïý, êáèþò êáé ç åíçìÝñùóç ôùí ðñùôïåôþí öïéôçôþí ãéá ôçí ýðáñîç ôçò êïéíüôçôáò.<br />\r\n<br />\r\nÓôï ôÝëïò ôçí ðáñïõóßáóçò èá õðÜñîåé êáé ìéá \"special\" Ýêðëçîç. Ôï áñ÷åßï ôçò ðáñïõóßáóçò, èá áíÝâåé óôçí wiki ôçò êïéíüôçôáò, êÜðïéá óôéãìÞ ìåôÜ ôï ðÝñáò ôçò ðáñïõóßáóçò.<br />','gr',0),(4,'SpartanGeorge','RSS feed ãéá ôéò ÓõíáíôÞóåéò','2008-10-28',NULL,'Áðü óÞìåñá õðÜñ÷åé äõíáôüôçôá åíçìÝñùóçò ãéá ôéò óõíáíôÞóåéò ôçò êïéíüôçôáò ìå ôç ÷ñÞóç <a href=\"http://en.wikipedia.org/wiki/Rss\" alt=\"wiki rss\">RSS Feed</a>.<br />\r\n<br />\r\nÔï RSS Feed ìðïñåß íá âñåèåß áðü <a href=\"RSSfeed_meetings.xml\" alt=\"rss feed\">åäþ</a>.<br />','gr',0),(5,'SpartanGeorge','Ðñüóêëçóç áðü ôçí Ð.Á.Ó.Ð. ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí','2008-10-31',NULL,'Ç Ð.Á.Ó.Ð. ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí, óôá ðëáßóéá ôçò çìåñßäáò ðïõ äéïñãáíþíåé ôçí ÔåôÜñôç 5 Íïåìâñßïõ ó÷åôéêÜ ìå ôï åëåýèåñï ëïãéóìéêü, ðñïóêÜëåóå ôçí êïéíüôçôá ìáò ãéá íá óõììåôÜó÷åé êáé áõôÞ.<br />\r\n<br />\r\nÇ êïéíüôçôá áðïöÜóéóå áðëÜ íá ðáñáóôåß ìå ìéá ïëéãüëåðôç ïìéëßá, ãéá íá ãíùóôïðïéÞóåé ôçí ýðáñîç ôçò óôïõò óõììåôÝ÷ïíôåò.<br />\r\n<br />\r\nÇ áðüöáóç ôçò êïéíüôçôáò õðÜñ÷åé êáé <a href=\"http://foss.uoa.gr/forum/viewtopic.php?f=14&t=142#p2665\" alt=\"áíáêïßíùóç\">åäþ</a>.<br />\r\n<br />\r\nÌå áõôÞ ôçí êßíçóç äåóìåõüìáóôå óáí êïéíüôçôá áí ìáò ãßíåé áíôßóôïé÷ç ðñüôáóç áðü ïðïéáäÞðïôå Üëëç êïììáôéêÞ - öïéôçôéêÞ ðáñÜôáîç íá äþóïõìå ôï ðáñüí êáé íá ðáñïõóéÜóïõìå ôï Ýñãï ìáò.<br />','gr',0),(6,'SpartanGeorge','2ï ÓõíÝäñéï ÊïéíïôÞôùí ÅËËÁÊ','2009-03-01',NULL,'Åßìáóôå óôçí åõ÷Üñéóôç èÝóç íá óáò áíáêïéíþóïõìå üôé ôï 2ï ÓõíÝäñéï\r\nÊïéíïôÞôùí Åëåýèåñïõ / Áíïéêôïý Ëïãéóìéêïý (ÅËËÁÊ), èá ðñáãìáôïðïéçèåß\r\nóôéò 9-10 ÌáÀïõ 2009 óôï ÔÅÉ ËÜñéóáò.<br />\r\n<br />\r\nÇ åêäÞëùóç ðåñéëáìâÜíåé ôçí ðáñïõóßáóç Óõëëüãùí / ÊïéíïôÞôùí / ÏìÜäùí ðïõ\r\náó÷ïëïýíôáé ìå ôï ÅËËÁÊ óôçí ÅëëÜäá, êáèþò êáé ôá âÞìáôá ðïõ Ýãéíáí áðü ôï\r\nðñïçãïýìåíï Fosscomm.<br />\r\n<br />\r\nÔï ðñüãñáììá èá êéíçèåß óå ðáñüìïéá ðëáßóéá ìå ôï ðåñóéíü, êáé èá ðåñéÝ÷åé\r\nðáñïõóéÜóåéò êïéíïôÞôùí, ïìéëßåò ó÷åôéêÜ ìå ôï ÅËËÁÊ êáèþò êáé workshops.<br />\r\n<br />\r\nÃéá ôéò äçëþóåéò óõììåôï÷Þò èá âãåé áíáêïßíùóç óýíôïìá.<br />\r\n<br />\r\n¼ðïéåò üìùò êïéíüôçôåò åíäéáöÝñïíôáé íá Ý÷ïõí åêðñüóùðï óôçí åöïñåõôéêÞ\r\nåðéôñïðÞ ôïõ óõíåäñßïõ, áò åðéêïéíùíÞóïõí ìÝ÷ñé ôéò 10-2-09 óôçí äéåýèõíóç\r\nepitropi at fosscomm dot gr<br />\r\n<br />\r\n<br />\r\nÃéá Üìåóç åðéêïéíùíßá õðÜñ÷åé ôï êáíÜëé #fosscomm óôï GRNet áëëÜ êáé ôï\r\nêáíÜëé ôïõ LinuxTeam ÔÅÉ ËÜñéóáò #linuxteam.<br />\r\n<br />\r\nÅðßóçò óôá ðëáßóéá ôçò äéïñãÜíùóçò ôïõ 2ïõ Fosscomm èá ãßíïõí óýíôïìá\r\náëëáãÝò óôçí éóôïóåëßäá fosscomm.gr<br />\r\n<br />\r\n<br />\r\nÌå ôéìÞ,<br />\r\nÇ ïñãáíùôéêÞ åðéôñïðÞ<br />\r\n<br />\r\n<a href=\"http://www.fosscomm.gr/\" alt=\"official article\">via</a><br />','gr',0),(7,'SpartanGeorge','Opensource conference 2009 By Sun Hellas','2009-03-08',NULL,'Áðï ôï åðßóçìï äåëôßï ôçò Sun Hellas<br /><br />\r\nÇ Sun Microsystems Ý÷åé ôçí ÷áñÜ íá óáò ðñïóêáëÝóåé óôçí çìåñßäá Open \r\nSource Conference 2009 ðïõ èá ðñáãìáôïðïéçèåß óôï îåíïäï÷åßï Athens \r\nImperial, ôçí TåôÜñôç 11 Ìáñôßïõ 2009 êáé þñá 8:30 - 17:30.<br />\r\n<br />\r\nÊáôÜ ôç äéÜñêåéá ôçò çìåñßäáò, èá ðñáãìáôïðïéçèïýí ðáñÜëëçëá 3 áíïéêôÜ \r\nworkshops ãéá MySQL, Storage êáé High Performance Computing.<br />\r\n<br />\r\nÏìéëçôÝò óå áõôÞ ôçí ìïíáäéêÞ åêäÞëùóç èá åßíáé ç ÏìÜäá Åõáããåëéóôþí áðü ôçí \r\nSun Microsystems Inc. êáèþò êáé åîåéäéêåõìÝíá óôåëÝ÷ç ôçò MySQL, åíþ \r\nïé âáóéêüôåñåò ôå÷íïëïãßåò ðïõ èá êáëõöèïýí ìå ïìéëßåò êáé óõæçôÞóåéò \r\nåßíáé Java SE êáé JavaFX, MySQL, Glassfish, OpenSolaris, OpenOffice, \r\nVirtualization êáé Open Storage.<br />\r\n<br />\r\nÅããñáöÞ äùñåÜí <a href=\"https://www2.sun.de/dct/forms/reg_gr_1102_377_0.jsp\" alt=\"register\">åäþ</a>.<br />','gr',0),(8,'SpartanGeorge','Çìåñßäá ó÷åôéêÜ ìå ôï Linux - (08/04/2009 - 15.00-19.00 Á2)','2009-03-30',NULL,'ÌåôÜ áðü ìéá ìåãÜëç áíáâïëÞ ôçò çìåñßäáò ôçò êïéíüôçôáò ìáò, ãéá ôï ÷åéìåñéíü åîÜìçíï,\r\nôåëéêÜ êáôáöÝñáìå íá ôçí ðñïãñáììáôßóïõìå ãéá ôçí ÔåôÜñôç 8 Áðñéëßïõ, \r\nþñá 15.00 ìÝ÷ñé 19.00 ðåñéðïõ, óôçí áßèïõóá Á2 (ôìÞìá ÐëçñïöïñéêÞò êáé Ôçëåðéêïéíùíéþí).<br />\r\n<br />\r\nÇ çìåñßäá èá Ý÷åé èÝìá ôçí åéóáãùãÞ óôï Linux.<br />\r\nÃéá ðéï ðïëëÜ äåßôå êáé ôçí áößóá ôçò çìåñßäáò<br />\r\n<a href=\"../img/foss__A3.jpg\" alt=\"poster\" style=\"border-bottom: 0px !important;\" ><img src=\"../img/foss__A3_thumb.jpg\" /\"></a><br />\r\n<br />\r\nÓáò ðåñéìÝíïõìå åêåß :)<br />\r\n<br />\r\n<br />\r\n// ÓõæçôÞóåéò ó÷åôéêÜ ìå ôçí çìåñßäá ìðïñïýí íá ãßíïõí <a href=\"http://foss.uoa.gr/forum/viewtopic.php?f=2&t=223\" alt=\"thread\">åäþ</a>.<br />','gr',0),(9,'SpartanGeorge','Server Downtime','2009-08-31',NULL,'Áðü ôçí ÔåôÜñôç 02/09 ìÝ÷ñé êáé ôï ìåóçìÝñé ôçò ÐÝìðôçò 03/09 ïé õðçñåóßåò ôçò êïéíüôçôáò (wiki, forum ê.ë.ð.) äå èá åßíáé äéáèÝóéìåò ëüãù ìåôáöïñÜò ôùí õðïëïãéóôþí ôïõ õðïëïãéóôéêïý êÝíôñïõ.<br />\r\n<br />\r\nÅõ÷áñéóôïýìå ãéá ôçí êáôáíüçóç.<br />','gr',0),(10,'SpartanGeorge','For starters','2008-05-12',NULL,'Welcome to the website of the Free and Open Source Software Community (<a href=\"http://en.wikipedia.org/wiki/Free_and_open_source_software\">FOSS</a>) at the <a href=\"http://www.uoa.gr/uoauk/uoaindex.htm\">University of Athens</a>.<br />\r\n<br />\r\nThe community was founded in 2008 from students of the <a href=\"http://www.di.uoa.gr/en/\">Dep. of Informatics and Tel/s</a>, and it wasn\'t long before students from other departments participated.<br />\r\n<br />\r\nThe reason of existance for the community is spreading and supporting FOSS with:<br />\r\n- Providing technical support<br />\r\n- Seminars, presentations, events<br />\r\n- Participation in projects<br />\r\n<br />\r\nWhoever is interested and desires to participate, is more than welcome to the community and discussions.<br />\r\nThe effort is open for participation to all.<br />\r\n<br />\r\nOur aim is to spread applications and in general FOSS philosophy, inside and outside the University, to convince users to choose it and to strengthen its position in order for it to be used everywhere, while defending freedom in the software.<br />','en',0),(11,'SpartanGeorge','Software Freedom Day 2008','2008-09-13',NULL,'<a href=\"http://softwarefreedomday.org/about/el\" class=\"imglink\"><img src=\"../img/sfd08-el-banner468x60.png\" alt=\"Software Freedom Day 2008\" title=\"Software Freedom Day 2008 (September 20th)\"/></a><br />\r\n<br />\r\nWe are proud to announce that Thessalonika will be hosting a special event on Saturday September 20th for Software Freedom Day 2008! This is the biggest international celebration and outreach event for Software Freedom globally with hundreds of teams from all around the world participating!<br />\r\n<br />\r\nIn an increasingly digital age, more and more of our everyday experiences depend upon software. Software influences how we interact with each other, enjoy different media, vote, get paid, and even navigate our roads. Software underpins our very way of life, our basic freedoms such as freedom of association, freedom of thought, freedom of choice and much more, yet many people do not realise the importance and influence of software and other technologies on their lives.<br />\r\n<br />\r\nWhat do we mean by Software Freedom? Software Freedom is about a technology future that we can trust, that is sustainable, and that doesn\'t negatively impact on the basic human freedoms we take for granted. Untrusted electoral systems can lead to civil unrest and a lack of trust in governing bodies. Spyware that watches what we listen to, our banking details and who we email can be installed on our computers without our knowledge. Region encoding of movies introduces an artificial barrier to the international content; where is our personal choice? Proprietary data formats can mean lockout to accessing our own information! Software Freedom can be maintained by transparent systems (such as Free and Open Source Software) that are based on open, secure and sustainable standards including data formats and communication protocols.<br />\r\n<br />\r\nSoftware Freedom Day is a yearly celebration of Software Freedom and why it is important; our purpose is public education about these important issues. Information about the Software Freedom Day event in Thessalonika can be found <a href=\"http://softwarefreedomday.org/about/el\" alt=\"about link\">here (greek)</a> and we invite you to come along to a fun day with giveaways, competitions and information <ensure this represents your event>.<br />\r\n<br />\r\n<a href=\"http://softwarefreedomday.org/teams/europe/greece/PressRelease\" alt=\"official article\">via (greek)</a><br />','en',0),(12,'SpartanGeorge','Presentation durring the lesson of \"Introduction to Programming\"','2008-10-22',NULL,'On Friday October 24th, our community will hold a small presentation during the lesson of <a href=\"http://cgi.di.uoa.gr/~ip/\" alt=\"IP link\">Introduction to Programming</a> of the Dep. of Informatics and Tel/s.<br />\r\n<br />\r\nThe subject of the presentation is the idea of Free Software in general, and also it is meant to inform the new students of the department about the existence of our community.<br />\r\n<br />\r\nAt the end of the presentation a \"special\" surprise awaits those who will be present. The file of the presentation will be uploaded on the community\'s wiki sometime after the end of the event.<br />','en',0),(13,'SpartanGeorge','RSS feed for the community\'s meetings','2008-10-28',NULL,'From today onwards an <a href=\"http://en.wikipedia.org/wiki/Rss\" alt=\"wiki rss\">RSS Feed</a> concerning the meetings of the community is available.<br />\r\n<br />\r\nThe RSS Feed is accessible from <a href=\"RSSfeed_meetings.xml\" alt=\"rss feed\">here</a>.<br />','en',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2009-09-10  8:06:40

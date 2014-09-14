-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 16, 2011 at 01:24 PM
-- Server version: 5.1.58
-- PHP Version: 5.3.6-13ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `forum`
--
CREATE DATABASE `forum` DEFAULT CHARACTER SET ucs2 COLLATE ucs2_general_ci;
USE `forum`;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `tID` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `body` varchar(500) NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pID`, `tID`, `uID`, `body`, `postDate`) VALUES
(1, 1, 1, 'Test and test', '2011-12-16 02:42:52'),
(2, 1, 1, 'Another', '2011-12-16 02:42:52'),
(3, 1, 2, 'Me too', '2011-12-16 02:42:52'),
(4, 1, 1, 'Hello there Foss', '2011-12-16 02:42:52'),
(5, 1, 2, 'Spam spam spam', '2011-12-16 02:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE IF NOT EXISTS `threads` (
  `tID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `opener_uID` int(11) NOT NULL,
  PRIMARY KEY (`tID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`tID`, `title`, `opener_uID`) VALUES
(1, 'Web Development', 1),
(2, 'Site issues', 2),
(3, 'Relax', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(50) NOT NULL,
  `group` enum('normal','banned','moderator','admin','bot') NOT NULL,
  PRIMARY KEY (`uID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uID`, `username`, `password`, `email`, `group`) VALUES
(1, 'george', '123', 'george@foss.uoa.gr', 'normal'),
(2, 'foss', '321', 'foss@foss.uoa.gr', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

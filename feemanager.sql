-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.13-rc-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema feesdb
--

CREATE DATABASE IF NOT EXISTS feesdb;
USE feesdb;

--
-- Definition of table `accountant_master`
--

DROP TABLE IF EXISTS `accountant_master`;
CREATE TABLE `accountant_master` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(95) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mno` varchar(10) NOT NULL,
  PRIMARY KEY  USING BTREE (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountant_master`
--

/*!40000 ALTER TABLE `accountant_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountant_master` ENABLE KEYS */;


--
-- Definition of table `student_master`
--

DROP TABLE IF EXISTS `student_master`;
CREATE TABLE `student_master` (
  `sid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `eno` varchar(12) NOT NULL,
  `gender` char(1) NOT NULL,
  `course` varchar(5) NOT NULL,
  `fee` float NOT NULL default '100000',
  `paid` float NOT NULL default '0',
  `due` float NOT NULL default '100000',
  `address` varchar(100) NOT NULL,
  `mno` varchar(10) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `sem` int(10) unsigned default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_master`
--

/*!40000 ALTER TABLE `student_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_master` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

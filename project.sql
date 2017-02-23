-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: qqq
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_ID` int(11) NOT NULL,
  `post_ID` int(11) DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `comment_text` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`comment_ID`),
  KEY `post_ID` (`post_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fav`
--

DROP TABLE IF EXISTS `fav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fav` (
  `post_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  PRIMARY KEY (`post_ID`,`user_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `fav_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`),
  CONSTRAINT `fav_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `post_type` int(11) DEFAULT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `parent_post_ID` int(11) DEFAULT NULL,
  `accpted_post_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_ID` (`user_ID`),
  KEY `parent_post_ID` (`parent_post_ID`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posttag`
--

DROP TABLE IF EXISTS `posttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posttag` (
  `post_ID` int(11) NOT NULL,
  `tag_ID` int(11) NOT NULL,
  PRIMARY KEY (`post_ID`,`tag_ID`),
  KEY `tag_ID` (`tag_ID`),
  CONSTRAINT `posttag_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`),
  CONSTRAINT `posttag_ibfk_2` FOREIGN KEY (`tag_ID`) REFERENCES `tag` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `ID` int(11) NOT NULL,
  `tag_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `display_name` varchar(30) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `post_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `vote_type` int(11) DEFAULT NULL,
  `vote_date` datetime DEFAULT NULL,
  PRIMARY KEY (`post_ID`,`user_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`),
  CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-23  8:44:58

-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: wags
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `fireWood` int(11) DEFAULT 0,
  `grill` int(11) DEFAULT 0,
  `fireWoodPrice` int(11) DEFAULT 0,
  `grillPrice` int(11) DEFAULT 0,
  `inday` date DEFAULT NULL,
  `outday` date DEFAULT NULL,
  `title` char(100) DEFAULT NULL,
  `roomPrice` int(11) DEFAULT NULL,
  `totalPrice` char(30) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (39,'kkkk','p0203','2025-03-13',1,1,20000,20000,'2025-03-26','2025-03-27','글램핑3',400000,'440000',1),(40,'userid','p0203','2025-03-14',0,0,0,0,'2025-03-18','2025-03-20','글램핑3',800000,'800000',1),(41,'userid','p0101','2025-03-14',1,1,20000,20000,'2025-03-25','2025-03-26','카라반1',200000,'240000',1),(60,'test','p0203','2025-03-21',0,0,0,0,'2025-03-27','2025-03-28','글램핑3',400000,'400000',0),(61,'superman','p0203','2025-03-24',1,1,20000,20000,'2025-03-27','2025-03-28','글램핑3',1,'40001',0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pwd` char(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment` (`cid`),
  CONSTRAINT `fk_comment` FOREIGN KEY (`cid`) REFERENCES `freeboard` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'kkkk',NULL,'1234','2025-03-19',16),(2,'test',NULL,'침실 2개,화장실 1개','2025-03-19',16),(3,'batman',NULL,'침실 2개,화장실 1개','2025-03-19',16),(4,'superman',NULL,'침실 2개,화장실 1개','2025-03-19',16);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dibs`
--

DROP TABLE IF EXISTS `dibs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dibs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pcode` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dibs`
--

LOCK TABLES `dibs` WRITE;
/*!40000 ALTER TABLE `dibs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dibs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freeboard`
--

DROP TABLE IF EXISTS `freeboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `views` int(11) DEFAULT 0,
  `title` varchar(200) DEFAULT NULL,
  `userid` char(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `pwd` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freeboard`
--

LOCK TABLES `freeboard` WRITE;
/*!40000 ALTER TABLE `freeboard` DISABLE KEYS */;
INSERT INTO `freeboard` VALUES (5,3,'123','kkkk',' 123','123','2025-03-17'),(6,0,'123','kkkk',' 123','123','2025-03-17'),(7,0,'123','kkkk',' 123','123','2025-03-17'),(8,0,'123','kkkk',' 123','123','2025-03-17'),(9,0,'123','kkkk',' 123','123','2025-03-17'),(10,0,'123','kkkk',' 123','123','2025-03-17'),(11,0,'123','kkkk',' 123','123','2025-03-17'),(12,0,'123','kkkk',' 123','123','2025-03-17'),(13,0,'123','kkkk',' 123','123','2025-03-17'),(14,0,'123','kkkk',' 123','123','2025-03-17'),(15,1,'123','kkkk',' 123','123','2025-03-17'),(16,8,'123','kkkk',' 3123','123','2025-03-17');
/*!40000 ALTER TABLE `freeboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` char(15) DEFAULT NULL,
  `save` int(11) DEFAULT 0,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'superman','1234','슈퍼맨','superman@naver.com','010-1234-5678',4000,'2025-03-04'),(2,'kkkk','1234','kkkk','kkkk@naver.com','010-1234-5678',12000,'2025-03-07'),(4,'userid','1234','name','userid@naver.com','010-1234-1234',6000,'2025-03-10'),(5,'test','1234','테스트','123445@naver.com','010-1234-12341',6000,'2025-03-11'),(6,'test2','1234','테스트2','test2@naver.com','010-1234-1234',10000,'2025-03-12'),(7,'테스트입니다','1234','test0314','1234@naver.com','010-1234-1234',8000,'2025-03-14');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (3,'할인행사 합니다!!','단 10일간 10% 할인행사합니다\r\n많은 참여부탁드립니다!!','2025-03-14'),(5,'겨울을 맞아 불멍을 무료로 제공합니다','겨울을 맞아 불멍을 위한 장작\r\n무료로 제공합니다!\r\n*단, 하나만 무료입니다','2025-03-14'),(6,'aaaa','aaaa','2025-03-19'),(7,'aaaaa','aaaa','2025-03-19'),(8,'aaaaaaaa','aaaaaaaaa','2025-03-19'),(9,'aaaaaaaaa','aaaaaaaaa','2025-03-19'),(10,'aaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaa','2025-03-19'),(11,'aaaaaaaaaaaaaa','aaaaaaaaaaaaa','2025-03-19'),(12,'aaaaaaaaaaaaa','aaaaaaaaaaaaaaaa','2025-03-19'),(13,'aaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa','2025-03-19'),(14,'aaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaa','2025-03-19'),(16,'최초가입시 10000포인트!','최초가입시 10000포인트 드립니다','2025-03-21');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `title` char(15) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `pimg` varchar(400) DEFAULT NULL,
  `dimg` varchar(100) DEFAULT NULL,
  `save` int(11) DEFAULT NULL,
  `standard` int(11) DEFAULT NULL,
  `review` int(11) DEFAULT 0,
  `star` double DEFAULT 0,
  `people` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,200000,'카라반1','p0101',2,'caravan1.jpg','caravan1.jpg',1000,2,0,0,NULL),(2,300000,'카라반2','p0102',4,'caravan2.jpg','caravan2.jpg',1000,2,0,0,NULL),(3,200000,'글램핑1','p0201',2,'glamping1.jpg','glamping1.jpg',1000,2,0,0,NULL),(4,400000,'카라반3','p0103',6,'caravan3.jpg','caravan3.jpg',1000,4,0,0,NULL),(5,300000,'글램핑2','p0202',4,'glamping2.jpg','glamping2.jpg',1000,2,1,4,NULL),(6,400000,'글램핑3','p0203',6,'glamping3.jpg','glamping3.jpg',1000,4,0,0,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  `qtitle` varchar(100) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  `qna` int(11) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `secret` int(11) DEFAULT 0,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'superman','침대가몇개인가요?','2025-03-11 17:23:46','카라반1',1,1,'p0101',0,0),(4,'admin','1개입니다','2025-03-12 09:41:24','카라반1',1,2,'p0101',0,0),(6,'userid','시설문의 비밀x','2025-03-13 17:37:18','시설관련2',0,1,'p0203',0,0),(7,'userid','서비스 뭄ㄴ의 비밀글','2025-03-13 17:38:12','서비스2',7,1,'p0203',0,2),(8,'userid','시설1 비밀글','2025-03-13 17:38:23','시설1',8,1,'p0203',0,1),(10,'test','ㅁㄴㅇㅁㄴㅇㄴㅁㅇ','2025-03-14 14:19:48','ㅁㄴㅇㅁㄴㅇ',10,1,'p0203',1,0),(11,'test','1231231123','2025-03-14 16:42:55','123',11,1,'p0203',1,1),(13,'테스트입니다','123123','2025-03-14 17:35:09','123',13,1,'p0103',1,0),(14,'admin','1321321','2025-03-14 17:39:39','123',13,2,'p0103',1,0),(16,'admin','1232','2025-03-14 17:40:03','ㅁㄴㅇㅁㄴㅇ',10,2,'p0203',1,0),(17,'admin','asdf','2025-03-21 10:35:39','123',11,2,'p0203',1,1),(18,'admin','aaaa','2025-03-21 11:45:41','서비스2',7,2,'글램핑3',0,2),(19,'admin','asd','2025-03-21 11:46:00','시설1',8,2,'글램핑3',0,1);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `useSave` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `review` int(11) DEFAULT NULL,
  `jumuncode` char(12) DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `pay` int(11) DEFAULT NULL,
  `card1` int(11) DEFAULT NULL,
  `halbu` int(11) DEFAULT NULL,
  `bank1` int(11) DEFAULT NULL,
  `card2` int(11) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `bank2` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `inday` date DEFAULT NULL,
  `outday` date DEFAULT NULL,
  `fireWood` int(11) DEFAULT NULL,
  `grill` int(11) DEFAULT NULL,
  `grillPrice` int(11) DEFAULT NULL,
  `fireWoodPrice` int(11) DEFAULT NULL,
  `roomPrice` int(11) DEFAULT NULL,
  `title` char(15) DEFAULT NULL,
  `req` varchar(500) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (10,'superman','p0101',1000,'2025-03-06',0,'j20250306001',5,0,0,0,0,0,0,0,240000,'2025-02-27','2025-03-01',1,1,20000,20000,200000,'카라반1','하하하',NULL),(11,'superman','p0201',1000,'2025-03-06',0,'j20250306001',5,0,0,0,0,0,0,0,340000,'2025-02-28','2025-03-02',1,1,20000,20000,300000,'글램핑1','하하하',NULL),(12,'superman','p0101',1000,'2025-03-06',0,'j20250306002',5,0,0,0,0,0,0,0,440000,'2025-02-27','2025-03-01',1,1,20000,20000,400000,'카라반1','zzzz',NULL),(13,'kkkk','p0101',0,'2025-03-07',0,'j20250307001',5,0,1,2,1,0,0,0,200000,'2025-03-15','2025-03-17',0,0,0,0,200000,'카라반1','',NULL),(14,'kkkk','p0102',0,'2025-03-07',0,'j20250307001',5,0,1,2,1,0,0,0,340000,'2025-03-19','2025-03-21',1,1,20000,20000,300000,'카라반2','',NULL),(15,'kkkk','p0103',0,'2025-03-07',0,'j20250307001',7,0,1,2,1,0,0,0,460000,'2025-03-25','2025-03-26',2,1,20000,40000,400000,'카라반3','',NULL),(16,'kkkk','p0101',0,'2025-03-07',0,'j20250307002',5,0,1,2,1,0,0,0,200000,'2025-03-15','2025-03-17',0,0,0,0,200000,'카라반1','',NULL),(17,'kkkk','p0102',0,'2025-03-07',0,'j20250307002',5,0,1,2,1,0,0,0,340000,'2025-03-19','2025-03-21',1,1,20000,20000,300000,'카라반2','',NULL),(18,'kkkk','p0103',0,'2025-03-07',0,'j20250307002',0,0,1,2,1,0,0,0,460000,'2025-03-25','2025-03-26',2,1,20000,40000,400000,'카라반3','',NULL),(19,'kkkk','p0203',0,'2025-03-07',0,'j20250307003',5,4,0,0,0,0,0,1,440000,'2025-03-18','2025-03-19',1,1,20000,20000,400000,'글램핑3','',NULL),(20,'kkkk','p0102',0,'2025-03-07',0,'j20250307004',0,0,0,0,0,0,0,0,680000,'2025-03-25','2025-03-27',3,1,20000,60000,600000,'카라반2','',NULL),(21,'userid','p0203',0,'2025-03-10',0,'j20250310001',0,0,1,1,0,0,0,0,460000,'2025-03-18','2025-03-19',1,1,40000,20000,400000,'글램핑3','',NULL),(22,'test','p0101',5000,'2025-03-11',0,'j20250311001',5,2,0,0,0,1,0,0,460000,'2025-03-14','2025-03-16',2,0,20000,40000,400000,'카라반1','테스트 입니다.',NULL),(23,'test','p0102',5000,'2025-03-11',0,'j20250311001',5,2,0,0,0,1,0,0,640000,'2025-03-16','2025-03-18',1,1,20000,20000,600000,'카라반2','테스트 입니다.',NULL),(24,'test','p0201',5000,'2025-03-11',0,'j20250311001',5,2,0,0,0,1,0,0,240000,'2025-03-13','2025-03-14',1,1,20000,20000,200000,'글램핑1','테스트 입니다.',NULL),(25,'test','p0203',5000,'2025-03-11',0,'j20250311001',5,2,0,0,0,1,0,0,440000,'2025-03-12','2025-03-13',1,1,20000,20000,400000,'글램핑3','테스트 입니다.',NULL),(27,'test2','p0101',0,'2025-03-12',0,'j20250312001',4,4,3,0,0,0,0,1,240000,'2025-03-12','2025-03-13',1,0,20000,20000,200000,'카라반1','테스트2입니다',NULL),(28,'test2','p0102',0,'2025-03-12',0,'j20250312001',1,4,3,0,0,0,0,1,380000,'2025-03-13','2025-03-14',1,0,60000,20000,300000,'카라반2','테스트2입니다',NULL),(29,'test2','p0201',0,'2025-03-12',0,'j20250312001',0,4,3,0,0,0,0,1,460000,'2025-03-16','2025-03-18',2,1,20000,40000,400000,'글램핑1','테스트2입니다',NULL),(30,'test2','p0103',0,'2025-03-12',0,'j20250312001',2,4,3,0,0,0,0,1,460000,'2025-03-14','2025-03-15',2,1,20000,40000,400000,'카라반3','테스트2입니다',NULL),(31,'test2','p0202',0,'2025-03-12',1,'j20250312002',5,4,1,0,0,0,0,1,940000,'2025-03-03','2025-03-04',1,1,20000,20000,900000,'글램핑2','',NULL),(32,'test','p0202',0,'2025-03-12',0,'j20250312003',5,3,0,0,0,0,1,0,400000,'2025-03-06','2025-03-07',1,4,80000,20000,300000,'글램핑2','',NULL),(33,'kkkk','p0202',0,'2025-03-12',0,'j20250312004',5,0,0,0,0,0,0,0,360000,'2025-03-08','2025-03-09',1,2,40000,20000,300000,'글램핑2','',NULL),(34,'테스트입니다','p0103',0,'2025-03-14',0,'j20250314001',5,4,0,0,0,0,0,0,475000,'2025-03-01','2025-03-02',1,2,40000,20000,400000,'카라반3','',1),(35,'테스트입니다','p0202',0,'2025-03-14',0,'j20250314001',3,4,0,0,0,0,0,0,375000,'2025-03-17','2025-03-18',2,1,20000,40000,300000,'글램핑2','',1),(36,'테스트입니다','p0203',0,'2025-03-14',0,'j20250314001',0,4,0,0,0,0,0,0,455000,'2025-03-26','2025-03-27',1,1,20000,20000,400000,'글램핑3','',1),(37,'kkkk','p0202',0,'2025-03-21',0,'j20250321001',0,0,0,0,0,0,0,0,300000,'2025-03-21','2025-03-22',0,0,0,0,300000,'글램핑2','',0),(38,'test','p0203',0,'2025-03-21',0,'j20250321002',4,0,0,0,0,0,0,0,400000,'2025-03-21','2025-03-22',0,0,0,0,400000,'글램핑3','',0),(39,'superman','p0203',0,'2025-03-21',0,'j20250321003',0,0,0,0,0,0,0,0,400000,'2025-03-22','2025-03-23',0,0,0,0,400000,'글램핑3','',0);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(12) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (25,'test2','p0202',4,'222','22222','2025-03-12',31);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02 11:24:31

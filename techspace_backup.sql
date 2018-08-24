-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: techspace
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'club_admin');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (10,1,25),(11,1,26),(12,1,27),(1,1,46),(2,1,47),(3,1,48),(4,1,49),(5,1,50),(6,1,51),(7,1,52),(8,1,53),(9,1,54);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add contact',7,'add_contact'),(20,'Can change contact',7,'change_contact'),(21,'Can delete contact',7,'delete_contact'),(22,'Can add club',8,'add_club'),(23,'Can change club',8,'change_club'),(24,'Can delete club',8,'delete_club'),(25,'Can add report',9,'add_report'),(26,'Can change report',9,'change_report'),(27,'Can delete report',9,'delete_report'),(28,'Can add user profile',10,'add_userprofile'),(29,'Can change user profile',10,'change_userprofile'),(30,'Can delete user profile',10,'delete_userprofile'),(31,'Can add message',11,'add_message'),(32,'Can change message',11,'change_message'),(33,'Can delete message',11,'delete_message'),(34,'Can add blog post',12,'add_blogpost'),(35,'Can change blog post',12,'change_blogpost'),(36,'Can delete blog post',12,'delete_blogpost'),(37,'Can add upvote',13,'add_upvote'),(38,'Can change upvote',13,'change_upvote'),(39,'Can delete upvote',13,'delete_upvote'),(40,'Can add comment upvote',14,'add_commentupvote'),(41,'Can change comment upvote',14,'change_commentupvote'),(42,'Can delete comment upvote',14,'delete_commentupvote'),(43,'Can add comments',15,'add_comments'),(44,'Can change comments',15,'change_comments'),(45,'Can delete comments',15,'delete_comments'),(46,'Can add tag',16,'add_tag'),(47,'Can change tag',16,'change_tag'),(48,'Can delete tag',16,'delete_tag'),(49,'Can add events',17,'add_events'),(50,'Can change events',17,'change_events'),(51,'Can delete events',17,'delete_events'),(52,'Can add latestpost',18,'add_latestpost'),(53,'Can change latestpost',18,'change_latestpost'),(54,'Can delete latestpost',18,'delete_latestpost'),(55,'Can add notification',19,'add_notification'),(56,'Can change notification',19,'change_notification'),(57,'Can delete notification',19,'delete_notification');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$1XcEV389nlEr$RPggUTqrqhFCHW3udhDsaPLZDVDunxYzmukerf0Pm2Q=','2018-08-24 07:40:45.048913',1,'admin1@techspace','','','techspace@ipu.ac.in',1,1,'2018-08-13 17:03:31.282491'),(2,'pbkdf2_sha256$36000$4BlyDxPzOv7U$i4xuGNXonjaB62kSsV3y4EYWqMWp4wEuCsLybt1Xkf0=','2018-08-23 19:27:52.378657',0,'prabhanshu','','','guptaprabhanshu1@gmail.com',0,1,'2018-08-13 17:23:05.410943'),(3,'pbkdf2_sha256$36000$c1gyu8Fj2umh$znsNDlu2+VlxtpQhhFXO/BuetcRGnGC75BYW56KUwGo=','2018-08-20 14:11:00.000000',0,'akshat','','','akshat@gmail.com',1,1,'2018-08-13 19:17:00.000000'),(4,'pbkdf2_sha256$36000$opPU1lf4YG7k$AZY7SFt/g55p2aNcQP+VyEkHLk0EdI9pqBgT3CqpwpQ=','2018-08-14 19:00:52.606410',0,'user','','','ss@ss.com',0,1,'2018-08-14 19:00:52.315542'),(5,'pbkdf2_sha256$36000$pg26m60cjdho$caTBULRA+fkPpSWZIR2PfmJ4NkE36+W/+qgvYX4B+a8=','2018-08-14 19:20:53.774786',0,'pmehndiratta','','','mehndiratta142@gmail.com',0,1,'2018-08-14 19:20:53.503918'),(6,'pbkdf2_sha256$36000$8xZgzbnwLt0F$vnv4IyiA+U3DpNNGc9YoTcFx5akNVAkMH0scFlTx/s8=','2018-08-15 08:58:15.578243',0,'undefined','','','b4091604@nwytg.net',0,1,'2018-08-14 20:55:58.139458'),(7,'pbkdf2_sha256$36000$hEHwt0cFF0UM$uY5eLAQwVNCgzFT4FPdwvnu4OaYrPhBm+o3lzElcCGo=','2018-08-15 17:18:03.388580',0,'testuser','','','',0,1,'2018-08-15 17:18:03.081800'),(8,'pbkdf2_sha256$36000$PJ4HYOtpD3oa$mYp8Rw1m0Sve8xX/0uby1IyMLnCdxNNVvG4i4BQgMIs=','2018-08-22 02:47:55.220253',0,'vishal','','','pal.vishal41@gmail.com',0,1,'2018-08-15 17:23:36.575560'),(9,'pbkdf2_sha256$36000$4rxQw041nH65$/Q8oktFrWz7h91GSlrEbSSGDPpbaeMrzRxBxlk/+wSw=','2018-08-15 17:49:58.946375',0,'xmax','','','rajshiv169@gmail.com',0,1,'2018-08-15 17:49:58.679342'),(10,'pbkdf2_sha256$36000$QCshCp0W1SP2$BBSvBAIbBdLAot0pM0Zx1mHQFSn1a9VuraLJ575JxbI=','2018-08-15 19:11:00.000000',0,'chuckie','','','rajatrooney1234@gmail.com',1,1,'2018-08-15 19:11:00.000000'),(11,'pbkdf2_sha256$36000$tJX3J80MwEzE$sYobARtF3X+jteQ1n4W/xQqI36yZyQpE1pr3wREt2j4=','2018-08-16 07:12:48.449554',0,'Eshaan7','','','ishubansal2000@gmail.com',0,1,'2018-08-16 07:12:48.042769'),(12,'pbkdf2_sha256$36000$0FpWY1d3yb0W$mfPujuH9rOF+SxEvd+Ed27zuzu+wUqORewWwxiOZ8qM=','2018-08-16 07:13:44.170488',0,'Sushmita','','','prasadsushmita2@gmail.com',0,1,'2018-08-16 07:13:43.800057'),(13,'pbkdf2_sha256$36000$UFnDcFD48Hfi$9TAArJw3Sle1lyFAxQn6zR/VnfvJvf1agUUOvWLq/io=','2018-08-16 07:14:28.129438',0,'arpit001','','','agsinghgarg131@gmail.com',0,1,'2018-08-16 07:14:27.727498'),(14,'pbkdf2_sha256$36000$WpyMDR81reGq$Lld5LJVEpec1qeaOw2CrbASbxQaOeh5kBYCVNSsE914=','2018-08-16 07:17:17.575379',0,'UN','','','negiujjawal@gmail.com',0,1,'2018-08-16 07:17:17.187661'),(15,'pbkdf2_sha256$36000$od7igw5295lL$reMfskGSlolzAxTERUy4M621biWzefD8FC5si7awFP8=','2018-08-16 07:38:40.361097',0,'Asmit007','','','asmitpapney007@gmail.com',0,1,'2018-08-16 07:38:40.065884'),(16,'pbkdf2_sha256$36000$gPzUjt4Jd5x4$hgr0YTLB62jLc8qHZgviyVvvfsGoNt35WwLBcTf+ivQ=','2018-08-16 07:42:11.015237',0,'aryangupta','','','shubhamg199630@gmail.com',0,1,'2018-08-16 07:42:10.622649'),(17,'pbkdf2_sha256$36000$YnoKuQV3MAEM$4OtRcRtbzXvkEFNyN2rOaPNQW3SkH3NvdrsT/z9sdT0=','2018-08-16 07:45:13.753718',0,'sudo.sid','','','siddhu28.ss@gmail.com',0,1,'2018-08-16 07:45:13.480251'),(18,'pbkdf2_sha256$36000$791zwhsuLc30$AJt+Hr3Lr4Yg3QeiwWv+qje+YBApXN9Io0ICQ03OXXQ=','2018-08-22 18:43:42.865366',0,'Kushagra_Garg','','','kushagra.garg19@gmail.com',0,1,'2018-08-16 08:02:25.250541'),(19,'pbkdf2_sha256$36000$fGJY2UPqsRsU$42uHU3BQ+Wlj0BCS2jbZnNfd+Zsm9rNmyXteDcCpQuU=','2018-08-16 10:37:19.002044',0,'Mukesh','','','Mukrsh199894@gmail.com',0,1,'2018-08-16 08:02:28.200734'),(20,'pbkdf2_sha256$36000$J6vRP7CZP6Yn$wQDiZMUEyHfZ1waaa16WENJ8qvDR38z/KL3E2N4Qv0c=','2018-08-16 09:30:10.861284',0,'Mridul_Gupta','','','mridul27gupta@gmail.com',0,1,'2018-08-16 09:30:10.465498'),(21,'pbkdf2_sha256$36000$PLfnGpoI2J8r$s4OJwj6xTFHXXJrREG5ncEnqvUWXbEK7Gt00ckt7I+A=','2018-08-16 09:53:23.444185',0,'Sachin','','','sachin.sharma.6091@gmail.com',0,1,'2018-08-16 09:53:23.168342'),(22,'pbkdf2_sha256$36000$uMSrASoRs4oI$dq44ThUXcr3zRq5SS251P4NqDbcPln7LJqrZyfxSXH8=','2018-08-20 20:47:01.641961',0,'Harshb','','','harshitrock111@gmail.com',0,1,'2018-08-16 10:33:23.778565'),(23,'pbkdf2_sha256$36000$Sg7QoGFNqvCl$kOe9KjD1x9RHom+osiddgUFw0lAz67HP4soeOqtnCWE=','2018-08-16 10:50:35.348030',0,'Pragatisharma@18','','','sharmagirl808@gmail.com',0,1,'2018-08-16 10:50:34.960435'),(24,'pbkdf2_sha256$36000$dsKo2pXRSgmL$Pca8a7jWh8Ktc8NVFBrUz+WG/6YzyR99aFAtksJgWfs=','2018-08-16 10:50:59.650347',0,'Saksham091098','','','saksham091098@gmail.com',0,1,'2018-08-16 10:50:59.263822'),(25,'pbkdf2_sha256$36000$IkOfVqRTVX7K$Qx5Xb09PDhqFsZJcGfyjxi+eE7QFMZJIM/j5ufWnUA0=','2018-08-16 10:52:35.254480',0,'Devil2.0','','','Belikenoone2k17@gmail.com',0,1,'2018-08-16 10:52:34.872483'),(26,'pbkdf2_sha256$36000$uMThuf4MPllA$Y7pmRNe/63ir+czbxMQZApCt6k1e/hsDgYkGg7rIDzI=','2018-08-16 10:56:43.859526',0,'Vaibhavi07','','','malikvaibhavi@yahoo.in',0,1,'2018-08-16 10:56:43.467025'),(27,'pbkdf2_sha256$36000$oxFLb8DhFZot$7hDYpgVAATS9Yxd4gANtouHGcuVzfttyR03Q3h93PX0=','2018-08-20 13:01:25.097650',0,'Nipul','','','nipul00rock@gmail.com',0,1,'2018-08-16 10:59:19.795769'),(28,'pbkdf2_sha256$36000$QowSVKRKPVVK$5pBP8+sswow+oLBigF6KVvbsuuFFqqqkkpXfvj1+/MA=','2018-08-16 12:15:59.718214',0,'Shrey','','','guptashrey2000@gmail.com',0,1,'2018-08-16 12:15:59.343221'),(29,'pbkdf2_sha256$36000$AlXkH4rlRbhz$YnbQ3AB36gU1lbIFK+AS0xg8+LIHvZOhHkoQkfsCJ5s=','2018-08-21 03:41:30.988542',0,'sauravsvt','','','sauravshriwastavaa@gmail.com',0,1,'2018-08-16 12:41:44.462908'),(30,'pbkdf2_sha256$36000$n1PksFKgB8A3$bSJL0aYB4O7c65EHE8EvOGA83Nx8O4HIlGljHP7RttA=','2018-08-21 11:48:27.697942',0,'LiquidatorCoder','','','maurya.abhay30@gmail.com',0,1,'2018-08-16 12:46:41.916128'),(31,'pbkdf2_sha256$36000$Lm4QkVz6RR8f$FAPTq8OwIoWYJ+MFytB7D/rBnLeKkvUCzhbf5wL9NTw=','2018-08-16 12:52:08.954566',0,'Saurav__arya','','','aryasaurav25@gmail.com',0,1,'2018-08-16 12:52:08.670315'),(32,'pbkdf2_sha256$36000$7RHYCYWywTRO$Td+nuhJGlAPDPYYt/oNYD2zrEmrCAEkE+8Lco/j1LX4=','2018-08-16 13:00:11.628226',0,'Kanu_Priya','','','priyakanu1116@gmail.com',0,1,'2018-08-16 13:00:11.356219'),(33,'pbkdf2_sha256$36000$M0zS8PvqM1yB$WYzQmvz4eJ5r4o4CDum+1J6ypO+rmbKau3fgYJOK824=','2018-08-16 14:27:54.434309',0,'Ankit2305','','','kankit2305@gmail.com',0,1,'2018-08-16 13:05:47.598501'),(34,'pbkdf2_sha256$36000$V56Nte5GKzQn$ccrnwF923ol3mNsLx/6u7inCUjemy6i35BnHih+cIt8=','2018-08-22 03:51:01.712758',0,'Saksham_Rohilla','','','rohillasaksham20@gmail.com',0,1,'2018-08-16 13:15:24.903722'),(35,'pbkdf2_sha256$36000$OdEzCuKAfwDm$UT07jstBd4PN++EK9ZFBXQxyQvF4qm6lDxTVW/edX/M=','2018-08-16 14:16:13.820581',0,'yourdad','','','b5314266@nwytg.net',0,1,'2018-08-16 14:16:13.530295'),(36,'pbkdf2_sha256$36000$ftY0GON1YDfV$9w6Jz7pNVNmBijqewSK1fk8znJPsoneA8C0pctBXf4M=','2018-08-16 14:24:47.498953',0,'Vaibhav_cool_007','','','gahlot.love27@gmail.com',0,1,'2018-08-16 14:24:47.226332'),(37,'pbkdf2_sha256$36000$PdHuYs1bvf7l$X0NT4garnVfLuPTWcP4o/2c8UdYftF73HxNPrrdJiWI=','2018-08-16 14:44:26.562817',0,'ASHISH_SASMAL','','','ashishsasmal1@gmail.com',0,1,'2018-08-16 14:44:26.254725'),(38,'pbkdf2_sha256$36000$Gk9QMeC6LTqm$LJijJWdWsH3zSR1035oqEisiktcyPBLx6g9DsADxMk0=','2018-08-16 14:52:11.319726',0,'test','','','b5329687@nwytg.net',0,1,'2018-08-16 14:52:11.046762'),(39,'pbkdf2_sha256$36000$mP04GTAmP6OQ$FiUZVyNAwzMf7KsvNoASGyMA7RYcSq/JbH8ZIz6a5vs=','2018-08-18 09:48:14.101095',0,'rushkin_1998','','','kumarakash0407@gmail.com',0,1,'2018-08-16 15:05:40.109214'),(40,'pbkdf2_sha256$36000$3gdEfQCMifUm$feGomOLO+9k5d/GTnPQxWCzxJ+aw9nksfEDo1cishcQ=','2018-08-16 15:16:30.134321',0,'Karan49s','','','karan49s@yahoo.com',0,1,'2018-08-16 15:16:29.856328'),(41,'pbkdf2_sha256$36000$5JCJx8cmpy83$AmWexZXqDcHG/qQ4uKjwYwJq+w2sUxVdc8AyTKgw1dY=','2018-08-16 15:38:21.093438',0,'Aamir','','','Aamirsaifi00000@gmail.com',0,1,'2018-08-16 15:38:20.808768'),(42,'pbkdf2_sha256$36000$wAIlkwkhaT4v$EeD6eiDus0gHYcw8QJtQqmkXTb5FbRzndsWIpI8ivHs=','2018-08-16 15:43:13.551507',0,'rithikagarwal','','','rithik19901998@gmail.com',0,1,'2018-08-16 15:43:13.269016'),(43,'pbkdf2_sha256$36000$IaWAOhDN4e7P$AMMxsjhsicr0dCtf8qTACdJepMeT9MnjkF3g8y6/kag=','2018-08-23 18:57:09.025445',0,'prafful','','','kumarprafful.54@gmail.com',0,1,'2018-08-16 15:55:23.273273'),(44,'pbkdf2_sha256$36000$2tev1i78j3Su$dPkbHGsbVUp78n7szWa//yFQmDQMAoEyGLKkWhaFuTk=','2018-08-16 16:31:15.343482',0,'gaurav_jain','','','gauravjain2202@gmail.com',0,1,'2018-08-16 16:31:15.045570'),(45,'pbkdf2_sha256$36000$amXu8r25hfA4$4E9Lb6l4v9++5pn9/AhwAGYoXAkkcVLps08JcGMrdCM=','2018-08-16 16:45:23.950379',0,'Swaraj961','','','swarajroutray961@gmail.com',0,1,'2018-08-16 16:45:23.670962'),(46,'pbkdf2_sha256$36000$RBgoRXymDM3w$zcyA6P7hAlIAEfkPFGr+QrSvv76daRTAdTiDdeJLN00=','2018-08-23 07:01:21.594059',0,'tpurang','','','purangt@gmail.com',0,1,'2018-08-16 18:23:49.824766'),(47,'pbkdf2_sha256$36000$gf24mrW8pnQN$qIl8qtq/SjNT/frRKocoG/4L0sS4M1F7bGVHgYsDhfM=','2018-08-17 02:49:35.954183',0,'@Prajwal.singh','','','Prajwal.singh.716@gmail.com',0,1,'2018-08-17 02:49:35.554059'),(48,'pbkdf2_sha256$36000$TvsE3rTlkaV7$NdIkvZo2dve8oXdVvNeksY4fKpdx6+B2i8sOiSCoUxQ=','2018-08-17 04:03:03.721880',0,'Anubhav@rocks','','','anubhav.tomar.7373@gmail.com',0,1,'2018-08-17 04:03:02.938353'),(49,'pbkdf2_sha256$36000$M4ForM3RH8sy$1pNEZUnbYQawB6NRH2FIOWhgZLje838Fg5RDp5TnBHs=','2018-08-17 04:27:45.305774',0,'VinayKushwaha','','','vinaykmw@gmail.com',0,1,'2018-08-17 04:27:44.924322'),(50,'pbkdf2_sha256$36000$1pRaqaTlxjsR$LcfMdn+3opwvpZPHhBwbL+2o+MxYlk+5W9n0tQiAgsw=','2018-08-24 04:42:32.386135',0,'RPandey','','','rishabh42pandey@gmail.com',0,1,'2018-08-17 05:46:15.654502'),(51,'pbkdf2_sha256$36000$yDiX0mETBqRW$6HzUnFbi7O5xtRgY1z/bwUTlHlVoPaK6pLvHdxHOE5s=','2018-08-17 06:17:56.605398',0,'Devansh','','','devanshg2000@icloud.com',0,1,'2018-08-17 06:17:56.333728'),(52,'pbkdf2_sha256$36000$SU5z9KABPJwA$leMBpM3GJvDUsYlSDt8Bua+Z4d/TJjXkklzEDK6Xj8E=','2018-08-17 06:23:18.491804',0,'Manorit2001','','','manorit2001@gmail.com',0,1,'2018-08-17 06:23:18.112450'),(53,'pbkdf2_sha256$36000$A1ZzCETvkzHC$WEBCOKk6fqIB5yaWEsZFGkvxHFqkS8e9RMZoJvFMbiU=','2018-08-17 06:34:50.509016',0,'Garvit','','','Garvit121172@gmail.com',0,1,'2018-08-17 06:34:50.230820'),(54,'pbkdf2_sha256$36000$tj5dnndsXv4G$eGqG3YWpKwj3e5Qlr1UgY3HvRu0Ulzji9HDde1DdzhE=','2018-08-17 06:49:05.436411',0,'yogeshk972','','','yogeshk972@gmail.com',0,1,'2018-08-17 06:49:05.164692'),(55,'pbkdf2_sha256$36000$RiLwNa7xAJnY$A8NOjwQxryp5xgOPNl3/O+5ZT/GZV45BiMkHVkaMw4M=','2018-08-18 15:07:02.519190',0,'munyatam2001','','','munyatam2001@gmail.com',0,1,'2018-08-17 07:50:05.148116'),(56,'pbkdf2_sha256$36000$nQCQlKQVVnNQ$x9D/iPm8fSCND+o1gH1vexOUzJjzisaqIxvUSTSvrwo=','2018-08-17 08:07:53.378413',0,'Prakhartp','','','prakhartp@gmail.com',0,1,'2018-08-17 08:07:53.106843'),(57,'pbkdf2_sha256$36000$1lrt1QVZx8bo$KQw0Tjv19aosbuYD7mpmBBxTWxGOWtkO6NL/6VnG2NQ=','2018-08-17 09:36:11.784532',0,'Tanya','','','tanyaagrawal1006@gmail.com',0,1,'2018-08-17 09:36:11.481395'),(58,'pbkdf2_sha256$36000$9Iw2nXo0omML$gXfYjiQ5vASdm6V1Ekfouktaugl/4RFB/dHj/3UGmgQ=','2018-08-17 12:54:00.000000',0,'techspaceuser','','','tech.space@ipu.ac.in',0,1,'2018-08-17 12:54:00.000000'),(59,'pbkdf2_sha256$36000$LlqvUTKUu4Bv$xUj9LLRWVvuHsdRD4oUdFC2uI5Jma1KPYXacvdoV0xs=','2018-08-17 13:33:13.888505',0,'Ritzing','','','ritviksinghrautela@gmail.com',0,1,'2018-08-17 13:33:13.511828'),(60,'pbkdf2_sha256$36000$NvUFHJjPPTNT$EWVCyv9u0ZEjRdFTyVaY/rUjN9s/r/APd/wLNZAane4=','2018-08-17 14:20:52.043563',0,'Divyansh','','','divyansh000915@gmail.com',0,1,'2018-08-17 14:15:42.254474'),(61,'pbkdf2_sha256$36000$9frqkfBNcQmP$gzi+9JSstA/VXCDvOL4zNASRM5hONxRnsXylpIJr6QY=','2018-08-18 09:30:03.137210',0,'sharmashubham','','','sharmashubham9800@gmail.com',0,1,'2018-08-18 09:30:02.785834'),(62,'pbkdf2_sha256$36000$RmWFL3u69ICe$FVzFgQvzc64e0vCWFeavN6F2x61qRsB982Nax7nS6tM=','2018-08-18 09:50:21.179534',0,'Mackmit001','','','Dr.manojkr001@gmail.com',0,1,'2018-08-18 09:50:20.809845'),(63,'pbkdf2_sha256$36000$fyMAgbDzjl2E$6sRwHwpImvXBwXijtBdu8eV7CYPqy6uqreWPWbg1PwI=','2018-08-18 10:01:00.074239',0,'Prajwal.singh','','','Prajwal.singh.716@gmail.com',0,1,'2018-08-18 10:00:59.805413'),(64,'pbkdf2_sha256$36000$YnkHDoPKRjW2$dMJFBcMstzNetiAsrgV5pgQ6GUdxpE9biruVBKEanH4=','2018-08-18 10:44:48.758093',0,'Amay','','','amaykumar98@gmail.com',0,1,'2018-08-18 10:44:48.478327'),(65,'pbkdf2_sha256$36000$3bltCmli1foN$YK+g4qhmnVS6pFTqMPmT2sxgRfsZZWg34BYIHHuFAsM=','2018-08-18 10:54:11.172007',0,'Yadavsourav111','','','Yadavsourav605@gmail.com',0,1,'2018-08-18 10:54:10.897267'),(66,'pbkdf2_sha256$36000$0EKFLtU4rCAT$Jsm1kobssXsYmd03U1TN9xesC4G8p3z0pyDXpYvLEmQ=','2018-08-18 12:02:19.491025',0,'Sachin9920','','','Sachinbhola947@gmail.com',0,1,'2018-08-18 12:02:19.225605'),(67,'pbkdf2_sha256$36000$ZG4zblffkYW0$dUxNJ1Jh27lA4dXEjVexkcpDjURrI0IerUXSBP/6hGI=','2018-08-18 13:38:28.681269',0,'dukevimes','','','shoryajain1999@gmail.com',0,1,'2018-08-18 13:38:28.267113'),(68,'pbkdf2_sha256$36000$Zk9XFXv3IF0m$1L9lkkqwNGfpsxiMfl7qkm9fhy9L0Gwggbcr4q0rkWI=','2018-08-18 14:32:48.768470',0,'shadman','','','shadmanansari346c@gmail.com',0,1,'2018-08-18 14:32:48.394107'),(69,'pbkdf2_sha256$36000$ptdhVglngU93$2fQrUttxGBRm+nQ9foNnPYxWyNcqpAEwSiQ4nEaQlZA=','2018-08-18 16:10:21.802790',0,'punit123','','','punitm187@gmail.com',0,1,'2018-08-18 16:10:21.525842'),(70,'pbkdf2_sha256$36000$tE5OG8GXTzox$M8pMtxHzs1iTPiQDvVWTm2xG68ULWvF3MpGYTZl2Z9s=','2018-08-18 18:44:50.465469',0,'kanurag94','','','kanurag94@gmail.com',0,1,'2018-08-18 18:44:50.185802'),(71,'pbkdf2_sha256$36000$F2hCxQuENVf6$p4qCBrEmAOHk1mcUWCUyZzAK9TY4lgS/1z3qJVmcleM=','2018-08-19 05:36:18.248360',0,'Sejal','','','sejal2609.sg@gmail.com',0,1,'2018-08-19 05:36:17.973329'),(72,'pbkdf2_sha256$36000$eML80dMYmGQv$CvWeRxPPDlpwjGPgWZAr6ln0k0xCoh9b3SxcRRXw7yk=','2018-08-19 14:04:12.012377',0,'rohangoyal2014','','','rohan.me2014@gmail.com',0,1,'2018-08-19 14:04:11.729631'),(73,'pbkdf2_sha256$36000$BZMfFvGGNUfH$VBY2kt9XyXvv4J9GsaqakRciw8YfRv0bldI/a/J5dBo=','2018-08-19 14:23:11.142851',0,'shantanu','','','shantanuverma022@gmail.com',0,1,'2018-08-19 14:23:10.867187'),(74,'pbkdf2_sha256$36000$f3SJIQKh30Nv$vCuFYRJtMZP5wxyfpH26hMzrihz/zI5mp83KrprsvOw=','2018-08-19 15:52:48.028446',0,'yasser','','','yasserfcb21@gmail.com',0,1,'2018-08-19 15:52:47.760319'),(75,'pbkdf2_sha256$36000$YCb9Ond5EgDX$AETbv7aUQ5aYHtAaD0h/De8GsljexdjJCpBVPLUI1Co=','2018-08-20 03:16:38.455845',0,'Jatinkansal20','','','Jatinkansal97@yahoo.com',0,1,'2018-08-20 03:16:38.062239'),(76,'pbkdf2_sha256$36000$ZUntDaQRgb8y$7R0dp/iYr7lJBl6AqQgV/QQ7N0OT4CbRnGsTxe3FgBI=','2018-08-20 10:12:56.310871',0,'Parth07','','','partharora99160808@gmail.com',0,1,'2018-08-20 10:09:28.796137'),(77,'pbkdf2_sha256$36000$vT49HDC2QyD6$fOer50b3rivga9fyvjP8esCTpiBrd2Y8YqrEw49G0Ys=','2018-08-20 10:36:50.946281',0,'Udit','','','uditgoel.82@gmail.com',0,1,'2018-08-20 10:36:50.646277'),(78,'pbkdf2_sha256$36000$5ZkE3Zb6TSaV$+XX2Mjl0nf4+RJU5FPS+c8+78NP2xv4HuWexPq/yQAE=','2018-08-20 10:37:36.773142',0,'arnav_anand','','','anandarnav2016@gmail.com',0,1,'2018-08-20 10:37:36.479497'),(79,'pbkdf2_sha256$36000$83jRcDe0hVKj$p25BEQgMNq+OEyvjF01UD7EEooDbdfdjWd+D3yPb60o=','2018-08-20 10:40:51.580671',0,'Karansingh','','','karan49s@yahoo.com',0,1,'2018-08-20 10:40:51.304684'),(80,'pbkdf2_sha256$36000$sMuSW3BoDufT$fnVeKCVf4/fQeFazs5xZRQ2kQae8h4d5OGIc3pysEjM=','2018-08-20 10:43:11.302356',0,'Vikas','','','HNJoshi0999@gmail.com',0,1,'2018-08-20 10:43:11.008034'),(81,'pbkdf2_sha256$36000$pzDnBhjdFOh4$iXnPJDj+7+4lpELgKi4PTxCMHJ+d+aeXv0S1S6n11pI=','2018-08-20 10:44:06.019364',0,'Namanjain29','','','namanjain2912@gmail.com',0,1,'2018-08-20 10:44:05.637655'),(82,'pbkdf2_sha256$36000$IhMOYPAu2TGg$AH5z2b4sldge7HiJCYO7tQ4JT1mS6EnbGG2VQjwoecU=','2018-08-20 11:01:19.834690',0,'Rajat','','','rajataggarwal2603@gmail.com',0,1,'2018-08-20 11:01:19.438176'),(83,'pbkdf2_sha256$36000$EOeaG1TM01vA$e3KJICZVLMjnmQX/tCcVv7tDaP1/MRCe/iOH0P4g6Po=','2018-08-20 11:02:14.047201',0,'tkp1999','','','tarunkumarpaul72@gmail.com',0,1,'2018-08-20 11:02:13.655866'),(84,'pbkdf2_sha256$36000$vFjdQCOJAsJt$LWfBgH9fwraex0cA8mbduAcu/hByY5heVGZnLMrCzwY=','2018-08-20 11:09:22.661948',0,'adityak2920','','','adityak2920@gmail.com',0,1,'2018-08-20 11:09:22.387331'),(85,'pbkdf2_sha256$36000$azgYoFBOXqzl$dh3N5Sf8Ei6wDty8wikSlZ+jL3KyWpOeJIwI0qC96tg=','2018-08-20 11:19:17.285613',0,'Pankaj_kaushik','','','kaushikpankaj78@gmail.com',0,1,'2018-08-20 11:19:16.888694'),(86,'pbkdf2_sha256$36000$2DObaIgUIv4N$q87jeJfeBL9fcRdt0g/UOvGwOQiWZRGM88ca5cS1NRQ=','2018-08-20 12:02:05.987758',0,'Dhruv_garg','','','garg.dh123@gmail.com',0,1,'2018-08-20 12:02:05.706754'),(87,'pbkdf2_sha256$36000$S3uO7OpL6eBD$z/aiE+rPq/vsy+HqbcVgLgohiOGsJYZy9s9NwmVgX+c=','2018-08-20 12:07:31.270911',0,'Brownbong','','','vaishalilodh21@gmail.com',0,1,'2018-08-20 12:07:29.883086'),(88,'pbkdf2_sha256$36000$bFNrGDXWrs7e$zYxkczjXBRst6eYWBphomQRPv3p4o08Qm3C2uBRSFSY=','2018-08-20 12:23:08.279301',0,'NKwatra','','','kwatranishkarsh@gmail.com',0,1,'2018-08-20 12:23:07.849237'),(89,'pbkdf2_sha256$36000$1PTSdJLyE73y$J8z+l8YQKdYFF1L2eo+FFcZvx4Ry+d8kdP9CmGJd2qM=','2018-08-21 13:52:47.055836',0,'kapillamba4','','','kapillamba4@gmail.com',0,1,'2018-08-20 12:48:25.239785'),(90,'pbkdf2_sha256$36000$o8kj4jpWeumx$lm5fp5YDiU2okwrYp15Mw3DQsXEUdG2csFz5XD3lj9g=','2018-08-20 13:14:04.901994',0,'abas','','','wijilu@hurify1.com',0,1,'2018-08-20 13:14:04.630546'),(91,'pbkdf2_sha256$36000$R4pe8iyax3FW$hyiClcYNB2T4CGYYCHer3qx38StaZHE/Pk5wyxJBtUA=','2018-08-20 13:17:07.965170',0,'aakash','','','aakashmehtaa1308@gmail.com',0,1,'2018-08-20 13:14:41.690917'),(92,'pbkdf2_sha256$36000$wRoUl5XwrGgy$6x+XWRtrH2FQA19Kj8B7AlDG5rvw55Z3HbicTlb5N+w=','2018-08-20 13:35:09.882261',0,'Bhavik07','','','bothrabhavik@gmail.com',0,1,'2018-08-20 13:35:09.502537'),(93,'pbkdf2_sha256$36000$txwHwI0o4cJa$adiHUGdQWB0vJt4Z1ar7aCrS6woJjsghWwd5kwQIcz4=','2018-08-20 13:59:19.300259',0,'ashutoshvarma','','','ashutoshvarma11@live.com',0,1,'2018-08-20 13:59:18.904229'),(94,'pbkdf2_sha256$36000$trUNT00roStU$3WTLKPir6FgUSsXl1VnrtBCxGszzM+GdHubSAR14pUI=','2018-08-20 13:59:58.594361',0,'Shlok','','','shlok2999@gmail.com',0,1,'2018-08-20 13:59:58.221541'),(95,'pbkdf2_sha256$36000$sWLuFrWeHIui$7SLp8Gmv+qm+iyOPonbY1OXOVPbuGJJid6OoLjkAmAg=','2018-08-20 14:09:23.422753',0,'Ishan@1710','','','ishan.gupta1720@gmail.com',0,1,'2018-08-20 14:09:23.142121'),(96,'pbkdf2_sha256$36000$who5T5U0W9kr$5ptpC/Zl7BT2uZoHkcUR1o7Vqia0RBuOsnAcegkhLJE=','2018-08-20 14:14:02.576056',0,'XxpranjalxX','','','ps9395@gmail.com',0,1,'2018-08-20 14:14:02.304826'),(97,'pbkdf2_sha256$36000$zFddJNx9pzqE$yw/VjKsoAne0M1tuUYkME2aGSkGNdWaeOEB3VBph9C0=','2018-08-21 02:45:48.934552',0,'Abishek','','','abhishekgautam690@gmail.com',0,1,'2018-08-21 02:45:48.370319'),(98,'pbkdf2_sha256$36000$X9niinpZ1VDo$lOZPomPi6c4fABt6pJrHBxqxMNX71UNt9brUfZtmO+Q=','2018-08-21 03:22:36.156230',0,'Vishal@dhankhar','','','dhankhar.vishal23@gmail.com',0,1,'2018-08-21 03:15:25.376550'),(99,'pbkdf2_sha256$36000$wWDPbdoM2Uqm$G8DnLmWhvnHYmQWEAiDcb74CX0Kquk/U/POZDg5RcWI=','2018-08-21 03:22:06.335064',0,'aakash24','','','aakashsangwan024@gmail.com',0,1,'2018-08-21 03:22:05.953634'),(100,'pbkdf2_sha256$36000$tDRFEVohbvvv$FPOKrrZzAr4BDlQ1C3aqmnhBW3/r0N7T5S000VTqSA8=','2018-08-21 05:45:58.225058',0,'kunal_goenka','','','Kunalgoenka83@gmail.com',0,1,'2018-08-21 05:45:57.458366'),(101,'pbkdf2_sha256$36000$tMGpQEIeFTic$cIQZW8Via787S+eC2dquqlAjjaVxeYjdJ8og8bpowPk=','2018-08-21 05:49:04.870922',0,'Suraj_sah','','','Shah.suraj1200@gmail.com',0,1,'2018-08-21 05:49:03.618019'),(102,'pbkdf2_sha256$36000$bU3vdceOaQ2c$teI09IQvubdT8Q6CmgkgR0gYiS0rY27EkseyswnptFs=','2018-08-21 06:51:59.356502',0,'Ashish_kumar','','','Kumar.3338ashish@gmail.com',0,1,'2018-08-21 06:51:58.967115'),(103,'pbkdf2_sha256$36000$uf0wiNpxPn1G$/jlBc4ZE79plj2/xFs8028jG7VmObxecMWtBUfIwxhw=','2018-08-21 11:09:47.763986',0,'user1','','','',0,1,'2018-08-21 11:09:47.375419'),(104,'pbkdf2_sha256$36000$bIrWLig2a6O5$9vIdW1tATR+B921X+qNJ6GKQkeqoAKAlIf8kMpOSXOQ=','2018-08-21 13:58:54.562449',0,'Inderjeet','','','rajputinderjeet2468@gmail.com',0,1,'2018-08-21 13:58:54.182926'),(105,'pbkdf2_sha256$36000$7JzKCYhtp0ba$Kett0kP/dPzHe6el9EoVXkIog0TCB05lvrbYHWm9yrw=','2018-08-21 14:30:35.886303',0,'YashBansal','','','yashbansal349@gmail.com',0,1,'2018-08-21 14:30:35.575142'),(106,'pbkdf2_sha256$36000$Ex0QfgpYn9jH$83QCJkadhc7NskDBtfveWkZHR0djBq9U3y0uFtWnbqs=','2018-08-21 17:11:04.369495',0,'@deepanshu','','','deepanshuhooda97@gmail.com',0,1,'2018-08-21 17:11:04.094944'),(107,'pbkdf2_sha256$36000$CfHdOmoGsqDU$qeVPNAGK+k+I40Dkc83Q/zlTVLBc/EPDIcvFB0/Ay3I=','2018-08-22 15:40:52.124890',0,'s.g.','','','sngargrsd@gmail.com',0,1,'2018-08-21 17:30:32.991886'),(108,'pbkdf2_sha256$36000$0k7k182P197I$NFdVtqmNRtaC8oU6vB/8KgH2PnLr4CajLK4DN+1MsPI=','2018-08-21 19:42:41.558319',0,'Pranavjain','','','jaincoolpranav@gmail.com',0,1,'2018-08-21 19:42:41.284337'),(109,'pbkdf2_sha256$36000$FldiEuWu2YXy$FL/bOOpLNKbG+HPnT9c60PZ1gBGyAmJl4JvsJc+/+H4=','2018-08-22 10:43:09.089572',0,'akumark','','','akumark12315@gmail.com',0,1,'2018-08-22 10:43:08.697947'),(110,'pbkdf2_sha256$36000$jPEAYTfyz75q$nOBCqAxwV9Ydw5LzuHHowpTVYJI4wiZ/hRxrtGnCtx4=','2018-08-22 13:40:56.708658',0,'Anushka','','','s.anushka0804@gmail.com',0,1,'2018-08-22 13:40:56.450428'),(111,'pbkdf2_sha256$36000$79NtJU8VU5b5$MnvTHeC1AuL1PZxgYciOplOrSvN3C4mkfMaHMMQ2DK0=','2018-08-22 13:42:45.694352',0,'Akanksha','','','akasin2701@gmail.com',0,1,'2018-08-22 13:42:45.435627'),(112,'pbkdf2_sha256$36000$ALqbn1xZgOyV$DfMJmByMAGp/0MyFX/Xf2VcaPiHOVwPCii2g+oNKx0I=','2018-08-22 13:47:22.693067',0,'Ananyavsrivastava','','','Ananyavsrivastava@gmail.com',0,1,'2018-08-22 13:47:22.299531'),(113,'pbkdf2_sha256$36000$m50bV3zU4KjX$nM+TvZLlULuUTBW2AEMYTKPZ7p4Gf+eF0olyLAxPetU=','2018-08-23 12:30:40.073292',0,'Ankit777','','','',0,1,'2018-08-23 12:27:22.833909'),(114,'pbkdf2_sha256$36000$hFt8MQOzUJ7D$EkxDHvukKPUW06tWj/6I3UNFfSJN2jUMe87og2I1PpU=','2018-08-23 17:33:11.367945',0,'Foxtrot6','','','',0,1,'2018-08-23 17:28:10.861168'),(115,'pbkdf2_sha256$36000$1UgeOBwG0HJB$Dtx+HqXLap0sxXRrJ7oeXN6h40LX1cz47blzwDnuyow=',NULL,0,'Mohit','','','',0,1,'2018-08-23 18:12:15.316101'),(116,'pbkdf2_sha256$36000$0xlIItMfwCgl$wiCTVXgEKaQl7DyAjcB+VrHO7qzuC+gPLQMI3s98sm4=','2018-08-23 18:53:27.655603',0,'usertest','','','',0,1,'2018-08-23 18:53:27.360991'),(117,'pbkdf2_sha256$36000$acMPFBNJkQIS$Td7rcHSWi9R6MjIskQfW5ur/+U97WOp0ReFDXN3ormc=','2018-08-23 19:02:51.101775',0,'strider','','','',0,1,'2018-08-23 19:02:50.816257'),(118,'pbkdf2_sha256$36000$xrUdfMboFpk9$7LHcfSLzbKP+MdmsZsoapMhgkVFxcKAfFJ4GYiI207w=','2018-08-24 03:33:37.255416',0,'PRATYUSH_TIWARI','','','',0,1,'2018-08-24 02:29:57.874830'),(119,'pbkdf2_sha256$36000$ezsWjatgpDxV$+j2QoTH1FrQPROd2cBTo2609CtyAa3mZxZyaqRtmwYU=','2018-08-24 06:59:18.821256',0,'Rohan1215','','','',0,1,'2018-08-24 06:59:18.440948');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1),(2,10,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost`
--

DROP TABLE IF EXISTS `blog_blogpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `image` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(2024) NOT NULL,
  `isblog` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `club` varchar(200) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost`
--

LOCK TABLES `blog_blogpost` WRITE;
/*!40000 ALTER TABLE `blog_blogpost` DISABLE KEYS */;
INSERT INTO `blog_blogpost` VALUES (5,'prabhanshu','2018-08-15 16:40:38.346851','Introduction post - Welcome to the community!','blog/pexels-photo-242236.jpeg','Hi everyone!\r\nIntroduce yourselves. Type down your name, course in the comments. Share your interests, any work you want to show off or something you want to make. You can tell us what clubs you might want to join.','introduction-post-welcome-to-the-community',0,1,'home.Club.None',''),(6,'sauravsvt','2018-08-16 15:02:25.971856','Problem','blog/Screen_Shot_2018-08-16_at_8.25.35_PM.png','<p>The things that I fill up is not uploading. Maybe because it is still in development. Also, Size more than 1MB is not uploading in <em><u><strong>profile picture section</strong></u></em> or maybe it was not working because I was uploading a .png format. I had to change that photo to .jpeg inorder to make it complete. And also the <u><em><strong>email section</strong></em></u> you can see, it automatically takes <span style=\"color:#c0392b\">&quot;https://&quot;</span> before email address. I didn&#39;t write that. An email addresss should not take <span style=\"color:#c0392b\">&quot; https:// &quot;</span> . I hope this helps.&nbsp;</p>','problem',1,0,'home.Club.None','Uploading'),(7,'tpurang','2018-08-23 07:06:46.275973','Getting started with AR/VR/Game Dev.','blog/23551263_1730502383685531_1659230765719945940_o.jpg','<p style=\"margin-left:0pt; margin-right:0pt\"><em><em>(Wiesner Building,&nbsp; 20 Ames Street,&nbsp; Cambridge, MA 02142)</em></em><br />\r\n<br />\r\n&quot;There are two kinds of people in the world, those who think VR will change the world, and those who haven&#39;t tried VR yet...&quot;<br />\r\nAugmented reality(AR) and Virtual reality(VR) has been evolving by leaps and bounds over the past few years, with it&#39;s use cases ranging from video games to teaching, from remote surgery and physical rehabilitation to architectural visualization. What started as a mere figment of imagination in sci-fi novels has become a tool for developers to bring their imaginations into&nbsp;reality.<br />\r\nAs intimidating as these buzz-words may seem, AR/VR development has become near effort-less [for those who know how to CODE ;D]. Game engines such as Unity3D, Unreal engine, Amazon Sumerian, GameMaker etc have made possible for newbies to create breath-taking AR and VR applications.<br />\r\nHaving been to multiple national and international hackathons, I&#39;ve realized how excited the developer community is with the advent of commercialized AR/VR development tools and devices. Facebook, Google, Apple and several other companies have dedicated a significant amount of resources towards this upcoming technology domain.&nbsp;<br />\r\nProjected impact of AR/VR technologies is estimated to reach 15.6bn$, and Global Augmented and Virtual reality market size to be 209bn$ by 2020.</p>\r\n\r\n<h1><br />\r\n<strong><strong><strong>Getting started with Unity3D:</strong></strong></strong></h1>\r\n\r\n<p style=\"margin-left:0pt; margin-right:0pt\">I would recommend joining CodeSchool&nbsp;to get introduced to the awesome world of programming and algorithms. Those who are eager to jump on the fun part, follow the below steps ;D<br />\r\n-Download and install &quot;Personal&quot; version of Unity3D game engine&nbsp;&nbsp;<a href=\"https://store.unity.com/\"><u><span style=\"color:#0000ff\"><u>https://store.unity.com/</u></span></u></a><br />\r\n-Select the following modules when prompted (select Android build support or iOS build support depending on your workstation&#39;s os)<br />\r\n<img src=\"/media/uploads/2018/08/23/image.png\" style=\"height:481px; width:620px\" /></p>\r\n\r\n<p style=\"margin-left:0pt; margin-right:0pt\">-You can follow the official tutorials&nbsp;<a href=\"https://unity3d.com/learn/tutorials\"><u><span style=\"color:#0000ff\"><u>https://unity3d.com/learn/tutorials</u></span></u></a>&nbsp;or just look up &quot;unity tutorials&quot; on youtube.</p>\r\n\r\n<p style=\"margin-left:0pt; margin-right:0pt\">We will soon be having our orientation class in the upcoming week. Do join our whatsapp&nbsp;&nbsp;<a href=\"https://chat.whatsapp.com/6Yrojv5TmN2DesdbrL3KZP\"><u><span style=\"color:#0000ff\"><u>https://chat.whatsapp.com/6Yrojv5TmN2DesdbrL3KZP</u></span></u></a>&nbsp; and discord group&nbsp;<a href=\"https://discord.gg/Nzn82jP\"><u><span style=\"color:#0000ff\"><u>https://discord.gg/Nzn82jP</u></span></u></a><br />\r\n<em><em>Don&#39;t forget to introduce yourself after you join one of the above groups.</em></em><br />\r\nHere&#39;s a show-reel of the projects done by members of this society in 2017-18&nbsp; &nbsp;<br />\r\n<a href=\"https://drive.google.com/open?id=1ZBHiUz8i8USncNdfHBVpPmEqcLpOjh87\"><u><span style=\"color:#800080\"><u>https://drive.google.com/open?id=1ZBHiUz8i8USncNdfHBVpPmEqcLpOjh87</u></span></u></a></p>\r\n\r\n<p style=\"margin-left:0pt; margin-right:0pt\"><em><em>You can connect with me on Facebook, LinkedIn or just shoot me an email if you have any doubts regarding this society or AR/VR.</em></em></p>\r\n\r\n<p style=\"margin-left:0pt; margin-right:0pt\"><em><em>EDIT: You&#39;ll need a good laptop if you want to join any of the present tech societies, whether it be droid club, codeschool, cogitans and&nbsp;ofc RenderedSpace. Buy a laptop with at least 8GB RAM, i5 or i7 processor, and a good gpu.</em></em><br />\r\nYou can check my <a href=\"http://www.microcenter.com/product/475414/aspire_v15_nitro_black_edition_vn7-593g-70u4_156_gaming_laptop_computer_-_slate_black\"><u><span style=\"color:#800080\"><u>laptop&#39;s specifications</u></span></u></a>&nbsp;that I use for VR development.</p>\r\n\r\n<p style=\"margin-left:0pt; margin-right:0pt\">&nbsp;</p>','getting-started-with-arvrgame-dev',1,0,'home.Club.None',''),(12,'sharmashubham','2018-08-18 09:43:46.950744','Recommended Hardware Specifications for running Game Engines and other Rendering software','blog/c05642410.png','<p style=\"margin-left:0cm; margin-right:0cm\">The specification mentioned below are recommended specification that we feel, will enhance your experience while working on Unity. The recommended specifications are also mentioned on Unity&rsquo;s official website, but might not be same as the one we have mentioned here.</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">Processor: Intel core i5 &gt;above</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">RAM: 8Gb &gt;above</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">GPU: GT 940M &gt; above</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;Hard Drive : SSD ( Will result in&nbsp;much shorter loading times for both Windows and Unity Projects)</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">You can check for counterparts, if going for an AMD based hardware. Also&nbsp;an i3 Processor would work just fine if you want a cut on some pricing. There are some nice sales, going on ecommerce websites like amazon and flipkart, so do check them out for comparing the prices. You can also find some really competitive prices in shops located in Nehru Place Market, so I recommended checking them out too.</p>','recommended-hardware-specifications-for-running-game-engines-and-other-rendering-software',1,0,'home.Club.None','');
/*!40000 ALTER TABLE `blog_blogpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpost_tags`
--

DROP TABLE IF EXISTS `blog_blogpost_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_blogpost_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogpost_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_blogpost_tags_blogpost_id_tag_id_657ed214_uniq` (`blogpost_id`,`tag_id`),
  KEY `blog_blogpost_tags_tag_id_680e7081_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_blogpost_tags_blogpost_id_cdcddf6c_fk_blog_blogpost_id` FOREIGN KEY (`blogpost_id`) REFERENCES `blog_blogpost` (`id`),
  CONSTRAINT `blog_blogpost_tags_tag_id_680e7081_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpost_tags`
--

LOCK TABLES `blog_blogpost_tags` WRITE;
/*!40000 ALTER TABLE `blog_blogpost_tags` DISABLE KEYS */;
INSERT INTO `blog_blogpost_tags` VALUES (3,6,1),(4,6,4),(81,7,3),(82,7,7),(49,12,3);
/*!40000 ALTER TABLE `blog_blogpost_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_author` varchar(200) NOT NULL,
  `comment_text` longtext NOT NULL,
  `comment_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `post_id` int(11) NOT NULL,
  `reply_for_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comments_post_id_7457a902_fk_blog_blogpost_id` (`post_id`),
  KEY `blog_comments_reply_for_id_eca11593_fk_blog_comments_id` (`reply_for_id`),
  CONSTRAINT `blog_comments_post_id_7457a902_fk_blog_blogpost_id` FOREIGN KEY (`post_id`) REFERENCES `blog_blogpost` (`id`),
  CONSTRAINT `blog_comments_reply_for_id_eca11593_fk_blog_comments_id` FOREIGN KEY (`reply_for_id`) REFERENCES `blog_comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
INSERT INTO `blog_comments` VALUES (1,'Asmit007','Hi guys. Im Asmit Papney, Ece 1st year .. and i m interested in Cogitan , Droid club and Electotech. So i just need some guidance.','2018-08-16 07:43:33.962575',1,5,NULL),(2,'Pragatisharma@18','Hlo everyone.I am Pragati Sharma,Cse 1st year.I am interested in codeschool.I just love coding.','2018-08-16 10:52:45.936284',1,5,NULL),(3,'Vaibhavi07','hey guys!!! its vaibhavi cse 1st year . i wanna join codeschool,cogitan,and Ecell','2018-08-16 10:59:13.956042',1,5,NULL),(4,'Shrey','Hey guys!! this is Shrey Gupta , ECE , 1st year , i am interested in joining IEEE , Electrotech and Rendered.','2018-08-16 12:25:51.241450',1,5,NULL),(5,'sauravsvt','Hello! This is Saurav Shriwastav, CSE, 1st Year and I\'ll be joining Codeschool, cogitan, IEEE soon and will join OSLC, Turing AI, Rooters later. I\'ve never done coding before but I\'ll put my best effort in it.','2018-08-16 12:48:57.483110',1,5,NULL),(6,'Saurav__arya','Hi i m Saurav Arya,CSE first year.','2018-08-16 12:52:52.439060',1,5,NULL),(7,'LiquidatorCoder','Hello! I am Abhay Maurya from ECE and I want to join all the clubs as I am connected to all of the clubs\' theme and wanted to give a path to my distributed knowledge...Also I have found a bug in this website. When we enter our email in edit profile form it adds https:// automatically to the email, which should not happen... Thank You from @LiquidatorCoder','2018-08-16 12:56:36.004743',1,5,NULL),(8,'Kanu_Priya','Hi,I m Kanu Priya , IT first year and I will be joining codeschool .','2018-08-16 13:04:29.119626',1,5,NULL),(9,'Ankit2305','Hey Everyone, I am Ankit of CSE 1st year and I am interested in joining Codeschool and Cogitans.','2018-08-16 13:17:21.721072',1,5,NULL),(11,'vishal','Hi, good job finding out this bug. It\'s fixed in the repo and will be live soon. If you find any more bugs be sure to report, you can also open a new issue on the github repo.','2018-08-16 14:24:24.468209',1,5,7),(15,'rushkin_1998','Hello! I\'m akash, CSE. I wanna join codeschool becz i don\'t know nothing about coding. Since i had bio in 11th &12th.','2018-08-16 15:16:54.567281',1,5,NULL),(16,'Karan49s','I am Karan','2018-08-16 15:17:31.841628',1,5,NULL),(17,'Karan49s','We can\'t edit our comments!!!!','2018-08-16 15:18:17.874412',1,5,NULL),(18,'rithikagarwal','Hey everyone, i am Rithik Agarwal student of BTech CSE 1st year and i want to join codeschool to learn coding from scratch','2018-08-16 15:46:16.060405',1,5,NULL),(19,'aryangupta','Hey everyone ,its me ARYAN GUPTA student of Btech ECE 1st year and I want to join codeschool,Electrotech,Rooters,Rendered,droid.','2018-08-16 19:02:16.769469',1,5,NULL),(20,'@Prajwal.singh','Hi everyone,i m Prajwal Singh','2018-08-17 02:51:16.368498',1,5,NULL),(21,'@Prajwal.singh','I m prajwal student of ECE 1st year and wants to join code school,droid ,rooters club','2018-08-17 02:53:25.818463',1,5,20),(22,'@Prajwal.singh','we can,t edit our comments','2018-08-17 02:54:25.920445',1,5,NULL),(23,'Aamir','hi, i m aamir (it) 1st year & I\'ll be joining Rendered,Droid Club,Cogitans,Codeschool...','2018-08-17 04:43:12.885270',1,5,NULL),(24,'Mridul_Gupta','What kind of a laptop I require for unity','2018-08-17 05:54:48.435870',1,7,NULL),(25,'Mridul_Gupta','What kind of a laptop I require for unity','2018-08-17 05:54:53.580316',1,7,NULL),(26,'Mridul_Gupta','What kind of a laptop I require for unity','2018-08-17 05:54:56.477379',1,7,NULL),(27,'Mridul_Gupta','Can we make games similar to EA cricket games','2018-08-17 05:57:22.463924',1,7,NULL),(28,'Devansh','Hi everyone I am Devansh Gupta ECE 1st year and I will glad to join Turing AI , ELECTROTECH, CODESCHOOL. PS: I know basics of java and MySQL but I am not that great coder. So I want to explore and learn new things.','2018-08-17 06:23:49.528446',1,5,NULL),(29,'tpurang','Yeah, if you work hard enough...','2018-08-17 06:44:33.229015',1,7,27),(31,'prabhanshu','Hey @sauravsvt, Nice find. We have added this to the issues list. Will resolve soon. You can also add issues using github\'s issue tracker at http://github.com/techspaceusict/techspace-web.','2018-08-17 08:07:08.345697',1,6,NULL),(32,'prabhanshu','Great read <3','2018-08-17 08:12:06.168692',1,7,NULL),(33,'Prakhartp','Hello World. My name is Prakhar Mishra and I am an ECE first year student. Really enthusiastic about programming and enterpreneurship. Will be joining CODESCHOOL and E-CELL.','2018-08-17 08:12:16.729355',1,5,NULL),(35,'prabhanshu','Hey prajwal, we\'ve added this to the features list. Will release an update soon :)','2018-08-17 08:14:03.918389',1,5,22),(36,'Divyansh','Greetings People , Divyansh IT 1st yr at this end , am feelin\' really excited and looking forward to join most of the clubs and discover my own interests and skill set . Was a fairly good coder (C++) during my school days','2018-08-17 14:46:07.931320',1,5,NULL),(44,'Nipul','Hello everyone. My name is Nipul Singal and i am a IT first year student. A good coder in C++ and want to explore every clubs and discover my own interests.','2018-08-20 13:10:56.166032',1,5,NULL),(48,'prabhanshu','&lt;script&gt;alert(1)&lt;/script&gt;','2018-08-21 11:29:51.135274',1,7,NULL),(53,'akumark','I&#39;m Ashish Kumar student of ECE(1st) year and want to join CODESCHOOL, RENDERED,DROID and ROOTERS.','2018-08-22 10:52:33.058743',1,5,NULL),(54,'akumark','I&#39;m Ashish Kumar student of ECE(1st) year and want to join CODESCHOOL, RENDERED,DROID and ROOTERS.','2018-08-22 10:52:54.478240',1,5,NULL),(55,'akumark','I&#39;m Ashish Kumar student of ECE(1st) year and want to join CODESCHOOL, RENDERED,DROID and ROOTERS.','2018-08-22 10:52:57.059974',1,5,NULL),(56,'pmehndiratta','&lt;script&gt;alert(1)&lt;/script&gt;','2018-08-23 21:03:05.032079',1,7,48),(57,'PRATYUSH_TIWARI','OSL???','2018-08-24 02:34:57.900028',1,5,NULL),(58,'PRATYUSH_TIWARI','I&#39;M PRATYUSH TIWARI (ECE -I)  .I WANT TO JOIN  CODE SCHOOL ,DROID CLUB ,ROOTERS,COGITANS.','2018-08-24 02:42:15.167407',1,5,NULL);
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_commentupvote`
--

DROP TABLE IF EXISTS `blog_commentupvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_commentupvote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_commentupvote_comment_id_username_313076bc_uniq` (`comment_id`,`username`),
  CONSTRAINT `blog_commentupvote_comment_id_df3ac589_fk_blog_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `blog_comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_commentupvote`
--

LOCK TABLES `blog_commentupvote` WRITE;
/*!40000 ALTER TABLE `blog_commentupvote` DISABLE KEYS */;
INSERT INTO `blog_commentupvote` VALUES (2,'LiquidatorCoder',1),(11,'prabhanshu',1),(10,'prabhanshu',2),(12,'prabhanshu',3),(13,'prabhanshu',4),(14,'prabhanshu',5),(15,'prabhanshu',6),(1,'LiquidatorCoder',7),(16,'prabhanshu',7),(7,'vishal',7),(17,'prabhanshu',8),(18,'prabhanshu',9),(23,'prabhanshu',15),(24,'prabhanshu',16),(25,'prabhanshu',17),(26,'prabhanshu',18),(27,'prabhanshu',19),(28,'prabhanshu',20),(29,'prabhanshu',22),(9,'Aamir',23),(30,'prabhanshu',23),(31,'prabhanshu',28),(36,'techspaceuser',32),(34,'tpurang',32),(32,'prabhanshu',33);
/*!40000 ALTER TABLE `blog_commentupvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'Codeschool'),(2,'Droid'),(3,'Renderedspace'),(4,'Cogitans'),(5,'Electrotech'),(6,'Ecell'),(7,'askmeanything'),(8,'Rooters');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_upvote`
--

DROP TABLE IF EXISTS `blog_upvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_upvote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1024) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_upvote_title_username_a5b9d4b6_uniq` (`title`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_upvote`
--

LOCK TABLES `blog_upvote` WRITE;
/*!40000 ALTER TABLE `blog_upvote` DISABLE KEYS */;
INSERT INTO `blog_upvote` VALUES (33,'\"><script>alert(1)</script>','undefined'),(32,'<script>alert(1)</script>','prabhanshu'),(26,'Getting started with AR/VR/Game Dev.','aryangupta'),(20,'Getting started with AR/VR/Game Dev.','LiquidatorCoder'),(13,'Getting started with AR/VR/Game Dev.','Mridul_Gupta'),(36,'Getting started with AR/VR/Game Dev.','pmehndiratta'),(4,'Getting started with AR/VR/Game Dev.','prabhanshu'),(12,'Getting started with AR/VR/Game Dev.','VinayKushwaha'),(17,'Getting started with AR/VR/Game Dev.','vishal'),(35,'Introduction post - Welcome to the community!','akumark'),(28,'Introduction post - Welcome to the community!','aryangupta'),(21,'Introduction post - Welcome to the community!','Divyansh'),(11,'Introduction post - Welcome to the community!','Kushagra_Garg'),(19,'Introduction post - Welcome to the community!','LiquidatorCoder'),(34,'Introduction post - Welcome to the community!','Nipul'),(15,'Introduction post - Welcome to the community!','prabhanshu'),(7,'Introduction post - Welcome to the community!','tpurang'),(3,'Introduction post - Welcome to the community!','vishal'),(2,'Introduction post - Welcome to the community!','yourdad'),(27,'Problem','aryangupta'),(16,'Problem','prabhanshu'),(25,'Recommended Hardware Specifications for running Game Engines and other Rendering software','aryangupta'),(22,'Recommended Hardware Specifications for running Game Engines and other Rendering software','LiquidatorCoder'),(31,'Recommended Hardware Specifications for running Game Engines and other Rendering software','prabhanshu'),(23,'Recommended Hardware Specifications for running Game Engines and other Rendering software','tpurang');
/*!40000 ALTER TABLE `blog_upvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-08-13 19:57:40.497243','1','codeschool',1,'[{\"added\": {}}]',16,1),(2,'2018-08-13 19:57:46.556624','2','droid',1,'[{\"added\": {}}]',16,1),(3,'2018-08-13 19:57:57.426211','3','renderedspace',1,'[{\"added\": {}}]',16,1),(4,'2018-08-13 19:58:01.607484','4','cogitans',1,'[{\"added\": {}}]',16,1),(5,'2018-08-13 19:58:10.101237','5','electrotech',1,'[{\"added\": {}}]',16,1),(6,'2018-08-13 19:58:22.484820','6','Ecell',1,'[{\"added\": {}}]',16,1),(7,'2018-08-13 19:58:34.798286','5','Electrotech',2,'[{\"changed\": {\"fields\": [\"word\"]}}]',16,1),(8,'2018-08-13 19:58:42.752855','4','Cogitans',2,'[{\"changed\": {\"fields\": [\"word\"]}}]',16,1),(9,'2018-08-13 19:58:49.292180','3','Renderedspace',2,'[{\"changed\": {\"fields\": [\"word\"]}}]',16,1),(10,'2018-08-13 19:58:55.412988','2','Droid',2,'[{\"changed\": {\"fields\": [\"word\"]}}]',16,1),(11,'2018-08-13 19:59:01.292224','1','Codeschool',2,'[{\"changed\": {\"fields\": [\"word\"]}}]',16,1),(12,'2018-08-14 18:23:08.693832','1','codeschool',1,'[{\"added\": {}}]',8,1),(13,'2018-08-14 18:23:35.834897','2','Cogitans',1,'[{\"added\": {}}]',8,1),(14,'2018-08-14 18:24:05.110955','3','Droid Club',1,'[{\"added\": {}}]',8,1),(15,'2018-08-14 18:24:28.034180','4','Electrotech',1,'[{\"added\": {}}]',8,1),(16,'2018-08-14 18:25:01.794090','5','Open Source Learning Center',1,'[{\"added\": {}}]',8,1),(17,'2018-08-14 18:25:30.701122','6','Zenith E-Cell',1,'[{\"added\": {}}]',8,1),(18,'2018-08-14 18:25:52.590907','7','Turing AI',1,'[{\"added\": {}}]',8,1),(19,'2018-08-14 18:26:51.815422','8','RenderedSpace USICT',1,'[{\"added\": {}}]',8,1),(20,'2018-08-14 19:08:42.942648','7','askmeanything',1,'[{\"added\": {}}]',16,1),(21,'2018-08-14 19:28:34.215720','5','admin1@techspace',1,'[{\"added\": {}}]',10,1),(22,'2018-08-14 21:23:57.117403','2','test - admin1@techspace',3,'',12,1),(23,'2018-08-15 06:29:46.632588','1','Fresher\'s Orientation - ',1,'[{\"added\": {}}]',17,1),(24,'2018-08-15 06:42:08.584118','1','Fresher\'s Orientation - ',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',17,1),(25,'2018-08-15 14:42:57.995189','1','Fresher\'s Orientation - ',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',17,1),(26,'2018-08-15 16:26:56.605345','5','Introduction post - Welcome to the community! - prabhanshu',2,'[{\"changed\": {\"fields\": [\"image\", \"content\", \"pinned\", \"club\"]}}]',12,1),(27,'2018-08-17 08:04:24.730188','30','Problem - prabhanshu',2,'[{\"changed\": {\"fields\": [\"comment_text\", \"reply_for\"]}}]',15,1),(28,'2018-08-17 08:05:11.590117','30','Problem - prabhanshu',2,'[{\"changed\": {\"fields\": [\"reply_for\"]}}]',15,1),(29,'2018-08-17 08:06:06.548774','30','Problem - prabhanshu',3,'',15,1),(30,'2018-08-17 08:13:07.916113','34','Introduction post - Welcome to the community! - prabhanshu',3,'',15,1),(31,'2018-08-18 18:39:48.266653','8','Rooters',1,'[{\"added\": {}}]',16,1),(32,'2018-08-20 13:56:17.178128','10','chuckie',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"last_login\"]}}]',4,1),(33,'2018-08-20 13:59:30.966349','1','club_admin',1,'[{\"added\": {}}]',2,1),(34,'2018-08-20 14:00:32.071276','3','akshat',2,'[{\"changed\": {\"fields\": [\"last_login\"]}}]',4,1),(35,'2018-08-20 14:12:24.956292','3','akshat',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"last_login\"]}}]',4,1),(36,'2018-08-21 11:13:01.441242','40','Recommended Hardware Specifications for running Game Engines and other Rendering software - prabhanshu',3,'',15,1),(37,'2018-08-21 11:13:01.444155','39','Recommended Hardware Specifications for running Game Engines and other Rendering software - prabhanshu',3,'',15,1),(38,'2018-08-21 11:13:01.445684','38','Recommended Hardware Specifications for running Game Engines and other Rendering software - prabhanshu',3,'',15,1),(39,'2018-08-21 11:13:01.448025','37','Recommended Hardware Specifications for running Game Engines and other Rendering software - prabhanshu',3,'',15,1),(40,'2018-08-21 11:13:01.451427','14','Introduction post - Welcome to the community! - test',3,'',15,1),(41,'2018-08-21 11:13:01.452999','13','Introduction post - Welcome to the community! - test',3,'',15,1),(42,'2018-08-21 11:13:01.454937','43','\"><script>alert(1)</script> - vishal',3,'',15,1),(43,'2018-08-21 11:13:01.456589','42','\"><script>alert(1)</script> - vishal',3,'',15,1),(44,'2018-08-21 11:13:01.458780','41','\"><script>alert(1)</script> - vishal',3,'',15,1),(45,'2018-08-21 11:13:01.460223','12','Introduction post - Welcome to the community! - yourdad',3,'',15,1),(46,'2018-08-21 11:13:01.461882','10','Introduction post - Welcome to the community! - yourdad',3,'',15,1),(47,'2018-08-21 11:13:40.915436','26','</h5><script>alert(1)</script> - prabhanshu',3,'',12,1),(48,'2018-08-21 11:13:40.918080','25','\"><script>alert(1)</script> - punit123',3,'',12,1),(49,'2018-08-21 14:11:23.964809','10','chuckie',2,'[]',4,1),(50,'2018-08-22 19:57:54.382144','39','rushkin_1998',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(51,'2018-08-22 19:58:03.762589','37','ASHISH_SASMAL',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(52,'2018-08-22 19:58:13.508755','34','Saksham_Rohilla',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(53,'2018-08-22 19:58:37.315865','30','LiquidatorCoder',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(54,'2018-08-22 19:58:48.309829','28','Shrey',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(55,'2018-08-22 19:59:26.062237','9','xmax',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(56,'2018-08-22 19:59:52.224201','7','testuser',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(57,'2018-08-22 20:00:06.239625','103','user1',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(58,'2018-08-22 20:00:42.157508','40','Karan49s',3,'',10,1),(59,'2018-08-22 20:01:16.284396','47','@Prajwal.singh',3,'',10,1),(60,'2018-08-22 20:02:30.117462','58','techspaceuser',2,'[{\"changed\": {\"fields\": [\"email\", \"last_login\"]}}]',4,1),(61,'2018-08-22 20:03:34.839064','58','techspaceuser',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(12,'blog','blogpost'),(15,'blog','comments'),(14,'blog','commentupvote'),(16,'blog','tag'),(13,'blog','upvote'),(5,'contenttypes','contenttype'),(17,'event','events'),(8,'home','club'),(7,'home','contact'),(18,'latest','latestpost'),(11,'log','message'),(19,'log','notification'),(9,'log','report'),(10,'log','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-08-13 13:58:24.447135'),(2,'auth','0001_initial','2018-08-13 13:58:24.738454'),(3,'admin','0001_initial','2018-08-13 13:58:24.818449'),(4,'admin','0002_logentry_remove_auto_add','2018-08-13 13:58:24.840255'),(5,'contenttypes','0002_remove_content_type_name','2018-08-13 13:58:24.909235'),(6,'auth','0002_alter_permission_name_max_length','2018-08-13 13:58:24.923534'),(7,'auth','0003_alter_user_email_max_length','2018-08-13 13:58:24.944546'),(8,'auth','0004_alter_user_username_opts','2018-08-13 13:58:24.962044'),(9,'auth','0005_alter_user_last_login_null','2018-08-13 13:58:25.017677'),(10,'auth','0006_require_contenttypes_0002','2018-08-13 13:58:25.020980'),(11,'auth','0007_alter_validators_add_error_messages','2018-08-13 13:58:25.036753'),(12,'auth','0008_alter_user_username_max_length','2018-08-13 13:58:25.056427'),(13,'blog','0001_initial','2018-08-13 13:58:25.216238'),(14,'blog','0002_remove_blogpost_description','2018-08-13 13:58:25.247462'),(15,'blog','0003_blogpost_description','2018-08-13 13:58:25.279054'),(16,'blog','0004_auto_20180812_1044','2018-08-13 13:58:25.292978'),(17,'blog','0005_commentupvote','2018-08-13 13:58:25.335806'),(18,'blog','0006_auto_20180812_1422','2018-08-13 13:58:25.362334'),(19,'blog','0007_comments_reply_for','2018-08-13 13:58:25.419422'),(20,'event','0001_initial','2018-08-13 13:58:25.449552'),(21,'home','0001_initial','2018-08-13 13:58:25.490604'),(22,'latest','0001_initial','2018-08-13 13:58:25.520531'),(23,'log','0001_initial','2018-08-13 13:58:25.926598'),(24,'log','0002_auto_20180812_1656','2018-08-13 13:58:25.980154'),(25,'sessions','0001_initial','2018-08-13 13:58:26.005326'),(26,'log','0003_notification','2018-08-17 12:47:26.688237'),(27,'log','0004_remove_notification_message','2018-08-17 12:47:26.759176'),(28,'log','0005_auto_20180816_1323','2018-08-17 12:47:26.876037'),(29,'log','0006_auto_20180816_1325','2018-08-17 12:47:26.966339'),(30,'log','0007_auto_20180816_1355','2018-08-17 12:47:27.003115'),(31,'log','0008_userprofile_email_activated','2018-08-17 12:47:27.079046'),(32,'log','0009_auto_20180818_1010','2018-08-18 14:54:57.042505'),(33,'log','0010_auto_20180818_1014','2018-08-18 14:54:57.095747'),(34,'log','0011_userprofile_name','2018-08-22 19:44:49.549312'),(35,'log','0012_auto_20180822_2139','2018-08-22 19:52:25.945696'),(36,'log','0013_auto_20180823_0119','2018-08-22 19:52:25.973074'),(37,'log','0014_auto_20180823_0125','2018-08-22 20:03:40.167019'),(38,'log','0013_auto_20180823_2043','2018-08-23 18:20:50.880667');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0925miohleh6gg9js3xbqykgwt6grzlr','YTgzYjBlMWZhOTdjYzQzZDJlZjVhZmFmOGJkZjU2MThmNDFiMWNlYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhNGRhMTViNmU2ZmRiZDBiMWFjZGM5MGM2MWQ3NWY0ODQzMWIwOTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3OSJ9','2018-09-03 10:40:51.583827'),('0n6tdwcnkrqtk29fnwzdwkwiv90vwbsx','OWVhMjcwZDYwZDg2NzZlMjk5NDMyNjdiNzQ3NWU5ZjhiM2ZjY2NiMTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc0NzFiMDM0OTA3OTQ2ZWFlZTQxNjFjYTY3YmM2ODVkOTRhMWUwNTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2018-08-30 07:13:44.173701'),('0rbv40js4193a416w15yuz9c9m5cy3lz','YTJiY2VkN2YxZDUyZGE5NDdlOGQ0OGYxNGRmOTVlYTNjYTYwODhjNDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1MTFkZDNhZmYzZTkzMTZmOWRlMWQ5NTkxNTA2NmI3MmMzZWQzMjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMCJ9','2018-09-04 11:48:27.701102'),('0x0yhqw35bxfa2xo9fz5388rfj9trmz8','MDk0NGJmOGIwNzM3N2VkODQwMzI3YTI4Yjc0NmQxYTFmZmNhMGJhMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzYzFiNmFjZDY0NjkxMDhkMGZkY2RmOGQyNjM3MWUyZDNmYTI4ZTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5MiJ9','2018-09-03 13:35:09.914833'),('0xjbd2ylrvj5qp67j9vfgpisxpol2znb','OTkxZTEzZjlkNDllYTIwNmM2MzU1ZjZjNTRhMzE0Y2ZlZjUwMjE4OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkMDE2MmNmMThmNmVlNzA2NmRlN2EzMWExY2U0OTcxYWZlMWMyYzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSJ9','2018-08-30 10:37:19.005554'),('1jqadsekrb0jp406cjb0pbjnyg5grejx','Y2JmYjE2M2VjNmM5MTBjYzIwMDRlODMxMWY2YTQzOGYzYTFlNjU0Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3YzQ1NTVmY2Q2YTFiMzAwMTIxODM5ZDBmNzRhMDhkMjliZjg5YjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9','2018-08-30 07:12:48.453641'),('1mx8zqehjn1v189sbuonfn5vr1tz5xcg','NjJkOWVhMzRkMmZmYWRlZjgzNzk0OWQwMjIyNzQ3NjNhOGM0NTI4Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjMxZGI1NWQxNmFhZWE4MTljYTI3NTM5MDY1MjEyMzg1NWFiYTAzMjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9','2018-09-05 18:43:42.868769'),('20vgr4472tucp3inv06wnkrhq2z3zo2l','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-03 15:07:16.428166'),('229y18ggaguci9b9zzjnv7cvsu6t7oz6','YzU5MWQwYTdhOTk5NTQxYmUxODk4OWYwMzRhYjU0MmIxNzcwMmMwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwMjdjNzRkMTI0YzkyOTA0N2Y5ZjM0YzEzMWI2MWVhZDJmNzA4ZTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMiJ9','2018-08-30 13:00:11.630826'),('2bnbqa5t2nr0iabcvfi72gkrrffskqge','MDMyZDM0OGMxOTMzNGY5OWI5MTBiMzVjMzNjNjBkMzRhYzM1ZjU5NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjY2E2NjNjYTM1MjM5ZjRiZDYzMTI4ODliZTEyNzRlMGZjNzNkNzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MCJ9','2018-09-03 10:43:11.305409'),('39vm2u9ugmrcrgri0dwfctixaf47nacc','NzEzMjQxNmFkYTFhOGNmYzkyMjYxYzczOGRjZjQzY2NiYzE4MjVjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI5OWRkMDVjYzFmYzg4NmE4MjljMzVjYzBmYmU1ZTE1NDQ5YWI4YjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NyJ9','2018-08-31 09:36:11.787828'),('3a35z3aykhlcsh4axbfj7v6jk1ejtrfk','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-07 07:40:45.053297'),('3h4e0vc0v60vx0j8lj312ftpdzeattkx','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-06 13:20:55.566577'),('43f5772jwipbj2py6fj3552vii3uqz3g','MjE0ZTlhNTNhZmEyMjY3NWZiYjllNDUwNDBkMTkwMTNjNGVkMzk5Yzp7Il9hdXRoX3VzZXJfaGFzaCI6ImE0ZTlmZWJhZDQ3MTZmZjAwYTU1N2VkNGJkZDg3ZDZlNDQzNjc5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5OSJ9','2018-09-04 03:22:06.337927'),('45dl5hxnjnvt1gjvmj3ulk95tgp5dygc','OGJjOWI2MzllZTUzOTZlMTY5NDYyYWI5Y2EyOTZkYTYyYzVhYzY0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjgzNzA5Y2QzNmJkYWM2NDg4MmIxMzNlYjc2N2VhMjMxYWI1ZjAyMzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNCJ9','2018-08-30 07:17:17.578206'),('45ks5elfl2nw44av0s9dkh3b5x7sy4sp','NmRlMmNkYWQwZmVlMjg2MWE4ODYzY2EyZjM2MzA5YTcwY2U0ZTFkNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiODQwNjJhZjY1ZTczMmNhYWNkOWRiNGI4MDkyMDdjYjJmZTg3ODciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4OSJ9','2018-09-04 13:52:47.058437'),('469blcr8hsz1flng5libl4v19zzkxuxm','NmM0ZGU0ZTc3NjUzMDdhNjI0MzIwMDIyYTMyOWI2ZGMzNzk0OGI4MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOTMxOWFkNThkNWNjNDM2YTRiMjY5YTdmYzVhMDdhOTViNDk5NDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2018-08-30 07:14:28.132793'),('46w12ato5p4x67qnvfpzbjdzbgtka3df','ZjU4N2VmYzkxYmI2M2E3MDAxZjA2YTZkNDQzOWYwMDE5OThjOWJiMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkOWFkZGFjMzBlY2FlYWMwYmUyMTYwZjllZWU1N2MwZDc5MDg0ZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9','2018-08-30 14:27:54.437654'),('4nsn7zfiy5374izg3e8k6mttt0fp4u7u','ZWQ3NjE3OTNmYzFmYjAxZDc4YmUyNjE1ZTEzMDUxMzAwYzVhMzM0Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2NWFkMWY0YzNlY2IyMjkxZTY4NzhmMWIwMjA5MzBjZmM2N2U1NDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTkifQ==','2018-09-07 06:59:18.824330'),('4v5hgi8ahgatfxzwkdqxxeutu25lm1f7','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-08-31 08:11:36.330178'),('4vscs80sk29iwvuhboslept63dxrpsxo','ZGNjMzUyM2EyMGI2YzljMzg2ZWNmZDljODBmNmMzNmRhMjcyNjUxYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhOGRlNDBjYWM5NjgzNDI0YzU0YjNmYzUyZmNhMDBiM2VlNDJiMTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NyJ9','2018-08-31 02:49:35.957508'),('5b37e3gmyx0ily6iq088toi8zivceu32','Mzc3MTc4MDMyZTQ3ZWY4NzhkN2I0ZDNiZDhkMGE5NWUxYjAxNzQ4NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwMzZjYzIyMmRkY2UwMDA4NTk3ZjViMzQ0M2I0NGUwNGEwYTU2NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9','2018-08-29 19:11:23.197936'),('5e6sffube4kgqhnwhtat68zu6y4z038p','Y2FkNTczNWM2YjUzOGEwYjA1Mjg1ZGY3MzIyYTRhMjE5NGUwYTk4Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjZhMDhiN2YxODgyNDNjZDZkMDU5ZDBhOTlmNTBkMGQ3MWNhYzcwNzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2018-08-28 19:20:53.778109'),('5lovvcmbcr1w7gbfk5ankbl0dwlz4moz','MGNlZWViZWU2OGI3MGQ2MWM2M2Y4NGMxZTkzMTYwYTVlMGY5NGYwMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImJkYTNmODgxMmIyNDkxNjA5NWRmZjJjMDZhOGIwNDMxZWYwZGNlNzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NSJ9','2018-09-03 03:16:38.458407'),('5n1651tf761vinq1fjfdex7mkduo3cdv','NDljOGMzYmVkZDMxOTBmNGQ4NTdmNzIwZjNhODU5YTFkZmUyYzEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxNTIzYjAxZWM3MDQ5MjdlN2VmYzJjMTkyNGE0MWQzNmFjZmQ1MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMiJ9','2018-09-03 14:29:45.171468'),('6ecogsiyp4rufc7ikmw4hrk0qdw2y6qt','ODI2NGRmODhkNTkwZGQyZjI5N2QzN2E3MDE5ODgzZjdhNDBlZDliOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI1ZmY1N2M2ZjlhNWZlOTE4MzJiYjU4MmU4YjNiMDY4MzQ5ZjlkNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MCJ9','2018-09-01 18:44:50.468364'),('6iszeq9pclzmoi4v0ngdna24wuh8wfnv','NDNlNGJkZTc2ZWIxYTRlOGU1NzRkMjEwZDQyNWNiOWMzYzFjMzhlMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFjZDJlNWNmNDY3NzhlODZiOWZiMjNjN2M0YmRmYjNmOTMyZmM0MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-09-05 02:47:55.223398'),('6rilb6n422bi2slmdvcrp4zyiiv6udd5','YjE1NzI3ZmYzM2U2NTAzN2U2NzY3ZjFiMDg1MTkyYmRiZmZiZGVmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFhYzk3Y2M2MjdmMGU4YjExOTg3YTZhNGJjMTU5NGViYWJiZjA2NjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NiJ9','2018-08-30 20:35:42.270294'),('73trwq3vwdirgj7kfyoyizdsws6vzkhf','NDU2OTNkYjI5YTEyZjNmNzE1MzcwN2MwMWIwMzg0MmE5MDYzY2MxNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIzNzYwMDNmYjU0Y2QyYjgwNjI1OGViYTQyMmNkMWNhYzdkZDc2MzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MSJ9','2018-09-01 09:30:03.140654'),('75kv6fmdanyb0xlo07gxa3nw6p1hkho0','ZDQ4Mzk1MTg2ZTgzZGVmYTdlOGQ3YmVjOWYyMGQwOTA5MzI4ZDUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVlZDdlNDMxMmVmNmJkM2RmMzhkYmI4MWE4NzczNjRlODM3Y2U3ODUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MyJ9','2018-09-01 10:01:00.077667'),('7cqjzc6c9t8wqwfbktpmztnpxp93m2ce','NDNlNGJkZTc2ZWIxYTRlOGU1NzRkMjEwZDQyNWNiOWMzYzFjMzhlMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFjZDJlNWNmNDY3NzhlODZiOWZiMjNjN2M0YmRmYjNmOTMyZmM0MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-08-31 13:17:05.819650'),('7l0w25mglc9q5jy4mhyq26niiy6jxppr','YWVhYmRkMzE2NmUzMjhjYmQxNzk5NTlhNzNlMGIwMTA0MjE3NmNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk1NDA3YzljMDRiYmIwMDA5YzExYjQ4OTliOWE4ZDFmNjMzMWEwZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOSJ9','2018-09-04 03:41:30.991578'),('7r3ic6ikvaeesweb3ojnayg1ysegr05q','OGUyYmY4NDgzOTQ0NDI5ODdjNjc1YWI2YWVjMmJmMDA2ZDI2MDhjNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwMDQwODcyMDNlYjhjN2NkZTg4MjZhYjUxZjdlYjVlYTY1ZWVlYzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NyJ9','2018-09-01 13:38:28.684537'),('7tf3o98fj4c8kf5ersqm2vippuqvo47g','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-06 19:16:15.856036'),('8e8mlxwa268oy3zp39nxrdkbnvtbl1pk','ZmNmNjYxNWNmOThhNmE0YzQ2NjQyZTQ0NDBlMGM0ZDNiMWQ5OTMyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM0YjY3NTgzZDFkZTk3ZTAwMDIzMjk1NjAwZmJmZjgyYTY0NGY3YjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTMifQ==','2018-09-06 12:30:40.103180'),('8k6ybffcazpv99atk8x1it99inw1r22g','ZWM0NmY2MmIyYjc1YzYwMDlmZDBmZjZmZTgzMTY3MzczYzBkMWYxNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxNDI0Zjk2MGJlMzQ2ZTJmZTkyZmJlYjRmMzRjYmY1ZmU4MmVjN2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNiJ9','2018-08-30 10:56:43.862247'),('98lzecs4l34j6feum64q7q6q59xr413d','MDg2NzM1MjIzMTIzNjY2NDY3ZjgxZDQ3ZDUwYWZjODJkN2U1NzVhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNTA0N2E2NTE4MGE1YTYxNzY4YWJiOTc0YjRjMjkzZDFjMDlkODYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNSJ9','2018-08-30 07:38:40.364332'),('amcolt45tk2x7pjnmd5o1yblu986udvy','NjEzN2M3ODlkYWM1NDU3NWZkZjA1OWFjMGZjMmE2YzY1N2MxZmU4Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc0NGQ1MTlkZWI0YTUyMzhjZWI1NGMwYTc2OGU1ZjU3MmViNzhhNmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2018-08-29 08:58:15.581358'),('aoqnt2zdtu4dqufh25txgazcxvcmh1cz','YWVhYmRkMzE2NmUzMjhjYmQxNzk5NTlhNzNlMGIwMTA0MjE3NmNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk1NDA3YzljMDRiYmIwMDA5YzExYjQ4OTliOWE4ZDFmNjMzMWEwZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOSJ9','2018-08-30 12:41:44.838662'),('ayf288hu6vxfdkzsb2ie4prv3w3vkzsd','MmQzOGZjMTZiNmMyNTViODU5NDI5NTQ1MTRkNDM3ZjkzMjFkNmU2YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NTdiMjY5NjY0YWQxYjdjOTllM2U3NWM4OWVlNmMwOTNiMmYxYzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4NyJ9','2018-09-03 12:07:31.274979'),('c9ddqhmn4mebs7gjxa20i5p3km5ptpat','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-06 18:28:53.514233'),('cjva66x2g1h97p31m41xuf3vtxroejtn','YzhmNTE3NzlkOWQzZWU2OWVlMjVhZGJlZjUxYWNkZDIxYmQwMTA0YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyYjI0YzNkYjlmMzllMDZiYTViMWY3MTQ1NDExZDkyNDZhYTcwNmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MiJ9','2018-08-31 06:23:18.494384'),('cw9k54fnvwq1bm0qmp0tx01wnzdskefr','YWQyYzhkMzk3OTFjY2Y2Mzk4OWIxYjhiOWMxMDZiNGFjMzE0Y2ZkNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ1NzVjMzc4YmQyZTY0NDVhMWU4MTQwMTA1MGI1Zjk4MDJiNTVjODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NyJ9','2018-09-03 10:36:50.949452'),('dpy7yh3elcl6ux61afih16ozx55a6g6j','MGUzZTRhM2VjZDZmYTczMzM5NGM5Y2ExMDZhZWRjZWRlZjA4OTYyYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5OGVlODMwNDY3MGQ2ZjVlZGUzZTZiY2E1MWEwOWRlYmM1YWEwZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MiJ9','2018-08-30 15:43:13.554362'),('dss0r9zt5czhgpcopit7imwxzvdor90x','Mzc1M2Q2NGUyNjczZDA0ZWY0MzdmZjBjYmJlMzMyMjk4ODAxOGZlZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjNDlkOWUzMWRiYWVlOWMyMzQ0NDA3OGJmNWNlYzNlZDE2NDY0ZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-09-01 13:43:50.705596'),('dvrtjx38z40ayuo5rnlokqj12097bggk','NGRmMDRhMTQzYWY1M2YyNzdiZjYzMGYxZjQxN2QyNDllZDY4NjNmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVkZmExNzEyZTY1MDdiMmU5M2NmYmVkN2Y5OWVkMDVhNjIyNjI4ZmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMyJ9','2018-08-30 10:50:35.350805'),('gdu714hdrnpwq12yv33izvtffuqxxotl','ODlmNzM0YmRkOTkzMjM4YWI1NzQwOWVmYzM3M2ViNWFjZmYxMjA4ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZkM2Y5N2M5NmIxODI0NThkMzMxNjQ2YjU0ZWQ3NDMzNDM1NDA3ZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMDAifQ==','2018-09-04 05:45:58.228202'),('gen490zzdjhbmzgk1xlp5cdz7e9dduhm','YmM1NDI0ZTRlYjliOGU0NGUzNDY1ZWY1Y2I0ZGZhYTdjNDc3ZTgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2ZDA2YzE1MzQwMDJhODk4Mzg5YjhiZmI4ZjQwZWRkZmNmMTNhZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNyJ9','2018-08-30 10:59:20.177121'),('gk1gwrajg3pyqghpc77lt63o2ky7466v','Y2VmOWZjOWIzYThmMmY5M2EwOGZkZWYzNGY0NjhkMDA2Njk4NGIxMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmMmJmZDZkY2I1ODFjOTE3M2RmNWMzODU5NTdlYmY0MWI3MTFiMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5NyJ9','2018-09-04 02:45:48.937748'),('hd5frzoq3aud3pwdr16r0aptuovkstss','YWVhYmRkMzE2NmUzMjhjYmQxNzk5NTlhNzNlMGIwMTA0MjE3NmNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk1NDA3YzljMDRiYmIwMDA5YzExYjQ4OTliOWE4ZDFmNjMzMWEwZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOSJ9','2018-08-30 14:49:57.015485'),('hkxgtglp18lcjix5of9chpbq0u54hj9y','MjNlNThhOWIxMWJlN2Q0YTE1MGNlN2ZkNzYzNmQwN2IwZjgyZDAzYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImJmZmM4NzE2MTA4ZGYzYWM3YWY4ZDYxNDIxMzFjYTMwNmFjODhmMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2OCJ9','2018-09-01 14:32:48.773724'),('hpe08h98629tgr8zewfojs0kf0z4q2la','YzBiYjJjMWY2NzQ1NmE2YTI5ODBlYjg4ZWM0YjFjYTVlZDcyZGIxMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5MzAzZTE4YTNhM2Y0OTdiN2JjMTMzNTk3MzRkNzA0ZjY1NTM2MzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2018-08-30 09:30:10.864710'),('icx3ptpqldxvohcpovzs6vugyiyys8il','MzlmNzVkZmIxOTdmZDNiOTZiNDMyMTNhN2MwNjhjZTBiMDJlODIzMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5MWIzZWI3YmZhNDY4MTJjMGYwMmMzZmEyYzAwMWRkZGY4NTVkMmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0OSJ9','2018-08-31 04:27:45.309377'),('inp7y40wfku82xffvg9rgvpetrdh02e7','Y2FkMmIzY2VkMWYyNzNlOWFmMTg3MGQ3NjQ0YTA5MTNmM2U5MzY4NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY1ODdkZjE0NGQwYWI5YWE3OTY4NzdkNmFlMGJhM2I5NmUzZjM4NGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMDIifQ==','2018-09-04 06:51:59.360441'),('izlxhm5jokbaoyting6jpkvvs0ljwih3','YjdhZWU1ODBmY2EyNzI4MzhjZGE5YmFmY2IxZjNiMmNjMDhmYjU0NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI0YTI4YWEzZDljNWRiMWMyZmI1Y2IwZGU3NDg2ZDdiYjQyODc3MzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NiJ9','2018-09-06 07:01:21.597475'),('j45noknm0b3441jfy97lov7tqr0up50i','MzAxMzUwZGQ2MzMwNDMxMzRlMjljNWJlMGZhOGE3OGVhNjc0NGQ5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ4ZTkwM2UyYTM5MzczNDk5Mzk5MWEzZmFhNGZjNjFkZTQ3NjY4NDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzNyJ9','2018-08-30 14:44:26.566213'),('j57nxhi85llaikf764px8ugn46jhbf1j','MTUzNTY0NDgzNzQzNzA5OWY3NDhlNDBkMzFkZmIyZDAwOTFjMjM1OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJiM2NhYWYxNjg4MDFiYzJhOTIwYjIzNmNjZDFlMjliMjFkYjM4OGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTIifQ==','2018-09-05 13:47:22.696201'),('jekora0z9y123l1avhfyatiznhncg3y9','NjYxYWRiZmZkMDU3OGNkOTliNDIyMzU4YmU1OTk1NjRhOGEyMzNjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhODZiZTFmMDBkOTkwNDNkZWY2MGNlMDUzNzQxYTZhMjAxY2I5MTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NiJ9','2018-09-03 10:09:29.202478'),('jnzhwre7dd12irdq0idwf0a52i5qfol4','YjA0YzJiMjg3ZWU0ODZhYmFmZWY2MDg0ZDg5NGUzOTAwMmE3YjdlYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ4Mzg2ZDhmZWZiMzAyYzA3OGYxZGRkMGU2ZjdiYjI0NGIzMDc0OTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NiJ9','2018-09-01 12:02:19.493714'),('jpimpvg1fyf1jff7fbgg33srxubxt5oy','OWZmYzM0NmNhNThkYjFmN2M0YzUxYWI5NWVlYzI4ZjE5MGRmNzQ2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjhkMDBlOTU0YmYxZTQ5YTViYmUyN2ZmYjQ3MDA1NmNiNWI4MTA3MjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NCJ9','2018-08-30 16:31:15.346062'),('jrcfngxxhzic797klac8mdgvru9knbev','NTI3YmY4MWQ2MGU1NzUwMjM3ZTliOTY3ZDQ4ZGQ0MDc0ZjkyN2FlNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4YzI4NGFlNWQ3YWM5MGY1MDQwYzlhMDQ0MGMwMmVhNDM0ZTI5NzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NCJ9','2018-08-31 06:49:05.439561'),('jxt8amwjppxdw5gg99tb890t0dbpf7wj','MTUyZWYyZTYyODM1NGE1NzkyYzU1M2YxMWNlYmNhMTAyODBmYTYzNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY5ODNiNTk5YTUyNjMyNmZlMDg4Zjg2MjIxMzg0ODJjNGNjOTA3YmYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MyJ9','2018-09-02 14:23:11.145928'),('k8p1v5uhl0bdp1ozirtqajrodadva1h1','YzdjYzlmMDRmZmZiMTI5OWM0ZjI3MjNkNWQ1OWZlZGEzYjZmNmZkMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgzYmJhNGRiYTg0MDZmYjAzMjIzYzI1NzYwYTFlN2NmYjA2MWY0NjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2018-09-03 14:04:40.954074'),('k8qv5btkcd1atrys5490j8q1ric62871','NGY4NjJiYmNmNDExMGMzMDkzYzFhNGY1YjBkNjQxYmRjN2NlOWY1Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUyZjNjZWEzNmEwNGZjOTQzZjEyMmMwNDQwNTRjYTU1OWJkOTcyNmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MSJ9','2018-09-03 10:44:06.022721'),('kdwc6jvb27t4tr46550e72fmgezg6qds','ZWRiMDUyNjdlZjNkNmZiOThhOWNlMmRkOTE3ZTFmMTg4ODY0OGY0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNGY1OTUyMGZjZmEzZDYzZTIwZjcwMjRlOTY5ZmQ0NWMyNzQ4YzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTgifQ==','2018-09-07 03:33:37.259111'),('kn1j8fjch6ebmwqc36z0mip62j29ihx3','ZGI4ZGIyMzlhNGIyMDY5MGEyZTVmZDNmYzI1N2UzZGI5YjUwYjA0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMxNjNkMDU1YWRmMmMyNjY1M2I4NmFkMjQwMTNmMWFhYzVhYWI3ZmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzOSJ9','2018-09-01 09:48:14.104497'),('kzxjvz7ykoegj68yh3hd7c60rj33qxag','OGZkZjU5NGQ4OTQ3NTBiNzk2OTZkMzI4MjZmMTZlNmE0OGY5YjkzNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjVjZTQ4NzA0ZjM2YzhhNTg4ZDBkYmMxNGM4MjVjM2U0ZmZmODA1MGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMDEifQ==','2018-09-04 05:49:04.873928'),('l26dgou51ow8fljtj3krqa86otz01hic','MmU2ZDE4OTE5ZjU4ZTU4MGZkZjUyMTliOGRmOWE3MzZmNmJlMWIzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImVmOTAzZTNhYjQ5YzUyNjU4OTA0ZmJlOGZmMTU2MDE0MjQyNDFmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNCJ9','2018-08-30 10:50:59.653967'),('lbbpcrhvuqq68nvj8mczbl2q9f71ts0f','ZjQ2YWQzMWJjNWZkZTRlYjg3MjNkZjgzMGQyMzMzODcwZDJiMTc0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjRkNTM0M2FjM2NhMGRkYTcxOGM1ZTYxMDM5MmQ5ZjkzYmIzYmRkMmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MiJ9','2018-09-03 11:01:19.837816'),('lovmdoriphh1p64n726fv0qkji99yyzb','MTBjMThkMGIyYzY2YmZlN2QzMjBhODk4ZGU1ZGE0OTE5ZThjZTY0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkNmJhMTkzMGVkNWE4YTAyMDRhNzdiZWNmZDgxODAyZWRjNzliN2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMDUifQ==','2018-09-04 14:30:35.889404'),('ls58qvdh6zagjvkwbs51jzsk0y4ltk6y','NzRjZWQ0YTVhYjYzZWM0ZTM2MGVmYTNkY2IxY2Y0NjQ0ZjkyMzM5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImE2MDA3MzZkNzQ5ZjIyZWU5YjIwMjIwN2UyZTExMTVlYzgxMTc3NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4NSJ9','2018-09-03 11:19:17.289413'),('muzmgxo4xy8jcjhx18syvpptdqh4d9qb','ZjM2N2FlYWEwNTczNjY1MjgwNTE3M2JjODc1YWJkNDRiZjk1OTJkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ4MTc5MjgxYjUwOWQ3ZjMzNjRjMzcyNjhjZGZjOTI4N2NmYmNmNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1NSJ9','2018-09-01 15:07:02.522734'),('n6jalp6mu2xzzvn0d01qsn9gx8a7aq2h','NDQ1ZTg2NDc5Y2ZmN2U2NjZiOGIzNGEzYjBmMGZjMGFkOTg3MWYzMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMzVhYTQxODFmMzkzOGFjYWMzMDA0ZjdmM2NmNTEzNDE4NzZhY2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2018-08-29 17:18:03.419683'),('n7qs605etnhszgm2vlfbnhep90r7w214','NDkwZGIyNzVmZDkxNjRkZDJlZmU3Y2YyZjk4MzZmOWY2NzZiOTg2MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4ZTQ5N2QzZjE3NDgwZjljMWM1ODllYWY0ZmRkNWU5OGRkZWVkNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MCJ9','2018-08-30 15:16:30.138809'),('ngle9r4hcbtoaeb23zd56qad9bujp6mb','NjYxYWRiZmZkMDU3OGNkOTliNDIyMzU4YmU1OTk1NjRhOGEyMzNjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdhODZiZTFmMDBkOTkwNDNkZWY2MGNlMDUzNzQxYTZhMjAxY2I5MTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NiJ9','2018-09-03 10:12:56.313903'),('nm2uq2b5vys99qr2ediu16snbmvt8xf5','ZjYxMDQ5NDBhYTJjZDAxM2NhZjEzMDZhOTJmN2FlOWQ5YWM5MzExYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwODA3MDdmNjE2ZjRjMTVhODkyZjFiMTAyMDQwZTQyZWU2MzQ1YWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5MSJ9','2018-09-03 13:17:07.970286'),('nr4c2vystglmsrzqtg8rvfd2dv7t7e5q','ZjU4N2VmYzkxYmI2M2E3MDAxZjA2YTZkNDQzOWYwMDE5OThjOWJiMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkOWFkZGFjMzBlY2FlYWMwYmUyMTYwZjllZWU1N2MwZDc5MDg0ZmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzMyJ9','2018-08-30 13:05:47.911748'),('okgs099l89gbvxae47ukqumhts9iuh3t','Yjc2ODFlNWQ2YWQ5NDE0MzE2OWJhYWVlZmMwMzg0ZDllOTlhMmRkNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwNmYyYzBjM2VlODI3MDc0YTE0OThlYjRkYjg3NjdhZjIyYzI0YTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2NCJ9','2018-09-01 10:44:48.761157'),('or5uapgxc19we14348tgrlhgphu8mpc7','OWM5MTQzMDFkNzZmMTUwMDhhOGEwODVmZTY5NWRmMWIyOTNlZjcyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY3NmNlMDM5ZjVjNmQ1NTU3YmJjMjNkY2U5YzljZjc5MmVhYzg1OGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2018-08-30 09:53:23.446663'),('ot8tyz4g8xilvan3s1obef5tdaavdara','NjIxZGMxYmE2MjQ0N2QyMTI0MzEzNjFmNGQyOTJhODhiOTY3YzY0OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFhOWM0MWFiYmIzODljZGY2N2I1NjI5ZTg0NmE2NzY4MWFjYTdmZmMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMDQifQ==','2018-09-04 13:58:54.566406'),('pa8hzpq1vynxo9k5eu8p1gnymx9te4ua','N2YxNDk4M2U1YmNjYTgxZDhjYWEwOTkyN2Q1ODlkN2QzODkzOTYxOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImMxZGVlZjczNjhmYzJjMmMxYTZjYjQyN2M2ODJjNDY3YWM4MDA1MGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-05 19:54:00.268975'),('pb7q9o985w7zyexyuo4v7abqirj4vx91','M2MwMWQ5NzY2NDg0MmFhZWZlNmUxODYxNGQ3M2JlMDU2YTE1NzQ3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjExMjJiNDQxNDQ5OWYzZTdjNjEyMTA0Zjc5ODg0OGI5Y2JlYjZmNjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-09-06 19:27:52.381911'),('pe4ttays69ysp3hskkj9ycq9m5xmcf2u','MDIxMTUyZWJmMDk4YzBmMDBjMmUxMTg3ZDJlNzJlMzllYmM1YjEwNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkN2E1YWUzM2YyMTI2MTY0MjA3YzU3ZWVkYzRjNTRiOGJiYTI3NzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0OCJ9','2018-08-31 04:03:03.725082'),('pf1agsl7l875f3j4uesdiv1mlantydgc','Nzg5NWM5ODhlMTJhNDExMDI4ODNlYTY5YTk0ZTM4ZWM2YTI2ZmE2MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjFjMmYwMWZhNzI5ODMyZDY1NzRkYTBmYjhmNWY5YzBiMTQzNDM5MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2MCJ9','2018-08-31 14:20:52.046079'),('pma9oap37s1f1il1sxkjttcbo33ln9wh','MjM0NjIyMTBiMGMyMWI5ZTM5Mjk2NTZkZjJhNzVlMjZiYTFjYTY2ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmNTBkZTgwZmNmZjcyMDcwMGYwMjdmNGViMTc1MThiNmQ4OTY1NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5NSJ9','2018-09-03 14:09:23.426508'),('pp5lkzkq7c1ipuj0ug3n3dxrd5lm2j2r','NWMzZWJjNzVmY2Q1MWU0MTE5M2UxZTI4NjUyNDU4OWQ3ZWNkZThjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUyMmNlMGJhNjY4ODZjYTE4YzI4MmM3ZDZmOTQ1NjU5OTQyNTczYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3NCJ9','2018-09-02 15:52:48.031337'),('q3c5kdqh6oh12xbvluqp67rilbml7vmt','OTIwNjhmOTUxYjc0YTk3MzIyODE4Mzk0NDFiODQwNzM5YzhlYzU4OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA3MDAxMWM0MjEyNDlkNDc4ZDBlYmE0YzNjYTZlYjJjZDA3YzdhOWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4MyJ9','2018-09-03 11:02:14.049612'),('qlmjaix3jltlhkncpzx3db5jcckgyma2','YzRkMTRmZGI0YTYxMzA5N2VjMjAwMGNjMGVkZjM4ODBmMGY1Zjg1NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE0Mjk0NmRiNDBkNjBiNzE1M2I0NTJkMjkxNWRjOGZjMWU1MDJjM2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMDYifQ==','2018-09-04 17:11:04.372526'),('re3bsgwdmv8h326acw852xublu91khdh','NDNlNGJkZTc2ZWIxYTRlOGU1NzRkMjEwZDQyNWNiOWMzYzFjMzhlMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFjZDJlNWNmNDY3NzhlODZiOWZiMjNjN2M0YmRmYjNmOTMyZmM0MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2018-08-30 13:52:12.164062'),('rim6cxwtmed5wb7s7n9gvmm8w14lyl3f','ZDQwYzU4MzYxNTljNmY5NTEzNzRlYjFlMTI5NDRkZDVkM2M1YjJlMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ1MzFkMGZkYjIxZWJiMGE2NmM1MzE2MjVjMzMxMDhlN2JjMDg0NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4NCJ9','2018-09-03 11:09:22.665065'),('s3441183l2mxcl0qc3blc0uhluu3v9ap','NjU3OTM4ODMwOTVkNzk4MWRmMTMzOTUzNDQyN2QyYWM0NGM1N2M5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjNiYTZiZjNmM2MwMmQxM2ZlOTMxY2YyODY1YzZhNDA5ZjExNmUxNTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTcifQ==','2018-09-06 19:02:51.105046'),('sdgdnxm2kc019rmwg8ihli35woy5kluo','YWVhYmRkMzE2NmUzMjhjYmQxNzk5NTlhNzNlMGIwMTA0MjE3NmNlNDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk1NDA3YzljMDRiYmIwMDA5YzExYjQ4OTliOWE4ZDFmNjMzMWEwZTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOSJ9','2018-09-01 12:32:13.779960'),('sey1hhz552g2bapvvvu1kqrri2ho9wbp','ZWRiMDUyNjdlZjNkNmZiOThhOWNlMmRkOTE3ZTFmMTg4ODY0OGY0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNGY1OTUyMGZjZmEzZDYzZTIwZjcwMjRlOTY5ZmQ0NWMyNzQ4YzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTgifQ==','2018-09-07 02:29:58.221137'),('sl27059f0kg0wgeqat9pdl1x9p4n9v0a','YmM1NDI0ZTRlYjliOGU0NGUzNDY1ZWY1Y2I0ZGZhYTdjNDc3ZTgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2ZDA2YzE1MzQwMDJhODk4Mzg5YjhiZmI4ZjQwZWRkZmNmMTNhZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNyJ9','2018-09-03 13:01:25.101163'),('szgq7605hokpy0yrulqui6yhbwb18pnb','MjYzZjk5NzdjNzRkNWFlNjFiMmViZmU5ZjA3MTAzOGQyYWEzMWE4NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZjNTBhMmYzMDRiY2QyN2U5NmZiMTNmNzJlMDRiYzk1YzBjOTQ3ZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzNiJ9','2018-08-30 14:24:47.502489'),('t2xjx2fnqixfoqg9x1z787f76zya7lk2','Mzg2OWRmN2ZkNzAwMWEwOGIxMTU5NjQyOGNkNmMxMGE3ZjM5MjVjZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImFmMzgwZTlkNDEwYTgxMDIyOGJlOWZiZmY0NjE4MjJlNTU5MWU2MTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNSJ9','2018-08-30 10:52:35.257646'),('t38hxhhcyv7qpoemupqsnqu2i5v6tez2','NGY0Nzk2NjBjZjcwNjdkMTQ0Y2M5NjI4NjFiZWMyOTI0NjE1ZmM1MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImExYzk4YzEzNTc4YTE1Y2UyZjZmNjBkODU4ODBjMDE1Mjk0NWMyMGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1OSJ9','2018-08-31 13:33:13.891615'),('t7rp0u4mk489y84vn1p764hwvmhl9i2n','Mjc1MDg1M2EzNjEwMWU0OTNiOWYwNTgwNTZkYzA2YzljNDU3MWI1ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhMTg0OWM0MzlmYzBiNzViNGZlOTg0MDQ3MzliMDE3ODRmZGI4ZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1MyJ9','2018-08-31 06:34:50.512575'),('u74dm7kgspmfimlxhxmdvxw8irydkhyd','OTcxMjgyYzA4MzlmZTRkMjU1ZGQ4NWUzMjkxMDU1MjMwOGRmMmIzZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhODBiNGRlZjEwZWRmMzczOTFmZTdiY2FiZDVjNDVjZTRjODYyYzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyOCJ9','2018-08-30 12:15:59.721473'),('u8mql3u0jsq3qdt3j6s1r11n14b8ib2k','NDNlNzgyZWFkZTE5MDFkMDFkYzYzZjllY2RmMmRjNDk0MzFiOGI3Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE0OGY4NWExMzMyN2MyNWM5MTk1OTkwMjI5MDBjZjgwMGZiYTRjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-03 10:36:52.207621'),('valoyeg06r5k62ufa6w9ao36ipi4jzxf','OWZhOTgwMzIzYjI5OTNmYWExNmI1Yzk5NmNlOWRmZmM4ZGQwY2E0Mjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk4ODYyOTU5MzRjNGI5NmE1MjAwYmI4OWU5NzkwODYzNzNhNjlkYjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2018-08-29 17:49:58.949727'),('vekeykwpfac7dnqu2sf5q6mteopdpy5u','NmFhZjRmOTM1MTkyMTVmNjI4MmNjNjFmMWU0ZTEwMWU5ZTZlNTI3MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBlMzBlZGMxMGViMjA1MDJjMDllNjQxNTY2M2IxNTMyM2NmMDBjYzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0MSJ9','2018-08-30 15:38:21.096473'),('w507w07m6wp934j6l4p80opzsyyifk7m','NTM3ZDFjNjE0NDdiMWM1YWJhYWQxNTBhMjc0NWEzYzZmNDg5NmU3Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjU3MmNlMjYyZjNlMmVlNTFjN2Q1ZTA4YWRmNmI3NGRmMDgyODcyOTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5MyJ9','2018-09-03 13:59:19.303400'),('wcfsz5xp90wwvh7jlrwoiz9z9bh7dk5p','MWE1YTBkYjhlM2NhMDM5OTI1MzZlYTNhNTk2MDk4OTM1MmIyMWEwNjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzYzg1ZDY5MGUzMDYyMDIxYTNmODQ3ZjkyOTcxMDA2YTI4NWNmZjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0NSJ9','2018-08-30 16:45:23.955126'),('wubfpvrxend0t5v5tq2oaurb752yuljo','MDZhMmM4NzY0MTczNWYzODc4Y2VkMTdiYjg0M2VjMTJjOWZhMmY4Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImRhMjFkZmYxZGI0MGM2NDQyYjg5OTU3NGVjMDMwZmQ0MmI4YmI2YzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3MSJ9','2018-09-02 05:36:18.251203'),('wywrn1ok8bl517ljtm9e9iyust5n9v86','NWI0NDY5YzE1NjA5YWRiMGUxYTkzMmRjMmNiMmZkOWMwYjUxZjk0YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIyZDQ3YzI0Y2Q3YzdlMzQzMWQ1MWIxOTNmYzJmZTAyMzkxNDI0NDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTEifQ==','2018-09-05 13:42:45.697389'),('xp2xctezo3htfs5o745mj92oeqwdl1jx','YTZhYzIxODZhZWU4NmJlZDBmNjNlNGU5NWMyZDY3MzdmMDI4MzA5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkN2MwZThiMWJhZWIzMWY0NDA4MzExNDI5ZjY4MWEyZGY5ZDRiYTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3OCJ9','2018-09-03 10:37:36.776359'),('y3kyzl77ed4or0csqfrut3eg1pxdj21y','YmM1NDI0ZTRlYjliOGU0NGUzNDY1ZWY1Y2I0ZGZhYTdjNDc3ZTgwZjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2ZDA2YzE1MzQwMDJhODk4Mzg5YjhiZmI4ZjQwZWRkZmNmMTNhZWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyNyJ9','2018-09-03 10:38:48.097589'),('y9fjg1a7bwf4s9s751embjy8ysps9idq','OGFlN2RkN2VlNTI3ZGVlYWIyYjZiNjQyMmViZjEwNzY1NDY5Yjk4OTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI3YjUxZDAwZGQ4M2YwZjgyMTM4MGQxMzFlNDFhMTc1Y2FjNmNmMWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNiJ9','2018-08-30 07:42:11.017828'),('yudw12c6mqf18s0an2castr2vz49sr4r','MDE3ZDA1YjM1MmI0MTRmZTI1NDExNTljY2FhY2ZmZTEwMzdjOGQwODp7Il9hdXRoX3VzZXJfaGFzaCI6ImE4ZGVkOTA5NjlmNjYyNzFlNjE2MmQwNmY5YzQxYTFjNzQ0YTY3N2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTAifQ==','2018-09-05 13:40:56.711794'),('zajnmqz6zx3vehc7qlhk682t66g4yinc','ZWRiMDUyNjdlZjNkNmZiOThhOWNlMmRkOTE3ZTFmMTg4ODY0OGY0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjNmNGY1OTUyMGZjZmEzZDYzZTIwZjcwMjRlOTY5ZmQ0NWMyNzQ4YzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMTgifQ==','2018-09-07 03:13:16.620565'),('zd7882d4daakwcyl4khc6a8icg3590vb','ZDk3ODljOGRjNzA1YjkzY2U0ZmFmZDBiODk2OWIwZTE5MTk3MzM1OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjBjYTU4NzQzODdjNmMxM2NiYjZkMGU4MDFjYjJlZWRmODFhMTBmZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzOCJ9','2018-08-30 14:52:11.322644'),('znxffadp4sn3slc3orrlh9g7x239qf3j','YzdjYzlmMDRmZmZiMTI5OWM0ZjI3MjNkNWQ1OWZlZGEzYjZmNmZkMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjgzYmJhNGRiYTg0MDZmYjAzMjIzYzI1NzYwYTFlN2NmYjA2MWY0NjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2018-08-28 21:36:29.384786'),('zz9tzyyw7r81ckkyssvy07ouh1pkxj6u','ZTNkODM2ZmM1YzI4NGIyNjRkY2M1MDY2OWQzYjlkZmRiNzE0NzM1ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImVhYmYxMWNiOWIwZDY1YjhhNGY5NDQ1ZWFiNzMwYTQ5ODZiNzRkNGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9','2018-08-30 07:45:13.756875');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_events`
--

DROP TABLE IF EXISTS `event_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `event_date` date NOT NULL,
  `time` time(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `venue` varchar(1024) NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(2024) NOT NULL,
  `club` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_events`
--

LOCK TABLES `event_events` WRITE;
/*!40000 ALTER TABLE `event_events` DISABLE KEYS */;
INSERT INTO `event_events` VALUES (1,'Fresher\'s Orientation','prafful','2018-08-15 06:29:46.629834','2018-08-16','11:00:00.000000','events/ORIENTATION_POSTER_2_1.png','D Block Auditorium','Techspace is the “of the students, by the students, for the students” technical society of USICT that works towards promoting discussion, creative collaboration, research and skill development. \r\nWe are organizing a fresher\'s orientation of the club on the 16th of August 2018 at 11:00 am.\r\nAll of you are highly encouraged to attend the event and are requested to be seated by 10:45 am.','freshers-orientation','');
/*!40000 ALTER TABLE `event_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_club`
--

DROP TABLE IF EXISTS `home_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_name` varchar(255) NOT NULL,
  `captain` varchar(255) NOT NULL,
  `club_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_club`
--

LOCK TABLES `home_club` WRITE;
/*!40000 ALTER TABLE `home_club` DISABLE KEYS */;
INSERT INTO `home_club` VALUES (1,'codeschool','null','logo/codeschool_tHsfSK2.jpg'),(2,'Cogitans','null','logo/cogitans_nOr3APD.jpg'),(3,'Droid Club','null','logo/droid_13X42jD.jpg'),(4,'Electrotech','null','logo/electrotech_mcfQB4N.jpeg'),(5,'Open Source Learning Center','null','logo/cogitans_aDhne0F.jpg'),(6,'Zenith E-Cell','null','logo/ecell_pJS3Wqk.jpeg'),(7,'Turing AI','null','logo/turingai_080ZqyM.jpeg'),(8,'RenderedSpace USICT','null','logo/renderedusict_ygowP2i.jpg');
/*!40000 ALTER TABLE `home_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_contact`
--

DROP TABLE IF EXISTS `home_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_contact`
--

LOCK TABLES `home_contact` WRITE;
/*!40000 ALTER TABLE `home_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latest_latestpost`
--

DROP TABLE IF EXISTS `latest_latestpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_latestpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(2024) NOT NULL,
  `club` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest_latestpost`
--

LOCK TABLES `latest_latestpost` WRITE;
/*!40000 ALTER TABLE `latest_latestpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `latest_latestpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_message`
--

DROP TABLE IF EXISTS `log_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_message_receiver_id_7172b200_fk_log_userprofile_id` (`receiver_id`),
  KEY `log_message_sender_id_db9c61f5_fk_log_userprofile_id` (`sender_id`),
  CONSTRAINT `log_message_receiver_id_7172b200_fk_log_userprofile_id` FOREIGN KEY (`receiver_id`) REFERENCES `log_userprofile` (`id`),
  CONSTRAINT `log_message_sender_id_db9c61f5_fk_log_userprofile_id` FOREIGN KEY (`sender_id`) REFERENCES `log_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_message`
--

LOCK TABLES `log_message` WRITE;
/*!40000 ALTER TABLE `log_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_notification`
--

DROP TABLE IF EXISTS `log_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_notification_user_id_f8acfdf2_fk_log_userprofile_id` (`user_id`),
  KEY `log_notification_post_id_dada524f_fk_blog_blogpost_id` (`post_id`),
  KEY `log_notification_comment_id_a8b77af3_fk_blog_comments_id` (`comment_id`),
  CONSTRAINT `log_notification_comment_id_a8b77af3_fk_blog_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `blog_comments` (`id`),
  CONSTRAINT `log_notification_post_id_dada524f_fk_blog_blogpost_id` FOREIGN KEY (`post_id`) REFERENCES `blog_blogpost` (`id`),
  CONSTRAINT `log_notification_user_id_f8acfdf2_fk_log_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `log_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_notification`
--

LOCK TABLES `log_notification` WRITE;
/*!40000 ALTER TABLE `log_notification` DISABLE KEYS */;
INSERT INTO `log_notification` VALUES (6,'like_notification',12,61,NULL),(7,'like_notification',12,61,NULL),(8,'like_notification',12,61,NULL),(12,'like_notification',12,61,NULL),(13,'comment_notification',12,61,NULL),(14,'comment_notification',12,61,NULL),(15,'comment_notification',12,61,NULL),(16,'comment_notification',12,61,NULL),(17,'like_notification',12,61,NULL),(27,'like_notification',7,46,NULL),(28,'comment_notification',5,1,NULL),(29,'comment_notification',5,1,NULL);
/*!40000 ALTER TABLE `log_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_report`
--

DROP TABLE IF EXISTS `log_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` longtext NOT NULL,
  `resolved` tinyint(1) NOT NULL,
  `reported_by_id` int(11) NOT NULL,
  `reported_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_report_reported_by_id_c0dbfdfc_fk_log_userprofile_id` (`reported_by_id`),
  KEY `log_report_reported_user_id_7dded961_fk_log_userprofile_id` (`reported_user_id`),
  CONSTRAINT `log_report_reported_by_id_c0dbfdfc_fk_log_userprofile_id` FOREIGN KEY (`reported_by_id`) REFERENCES `log_userprofile` (`id`),
  CONSTRAINT `log_report_reported_user_id_7dded961_fk_log_userprofile_id` FOREIGN KEY (`reported_user_id`) REFERENCES `log_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_report`
--

LOCK TABLES `log_report` WRITE;
/*!40000 ALTER TABLE `log_report` DISABLE KEYS */;
INSERT INTO `log_report` VALUES (1,'Testing report.',0,1,2);
/*!40000 ALTER TABLE `log_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_userprofile`
--

DROP TABLE IF EXISTS `log_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year_of_graduation` int(11) NOT NULL,
  `bio` longtext NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `github` varchar(200) NOT NULL,
  `linkedIn` varchar(200) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `user_badge_text` varchar(255) DEFAULT NULL,
  `user_badge_icon` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `email_activated` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `log_userprofile_email_9fee1c5e_uniq` (`email`),
  CONSTRAINT `log_userprofile_user_id_e5626ea9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_userprofile`
--

LOCK TABLES `log_userprofile` WRITE;
/*!40000 ALTER TABLE `log_userprofile` DISABLE KEYS */;
INSERT INTO `log_userprofile` VALUES (1,'USICT','BTech CSE',2019,'','guptaprabhanshu1@gmail.com','','','https://github.com/prabhanshuguptagit','https://www.linkedin.com/in/prabhanshu-gupta/','user/avatar/15317993_1258987947490688_2839254394292073837_n.jpg',NULL,NULL,2,1,''),(2,'usict','Btech cse',2020,'','akshatpapnoi1110@gmail.com','','','','','user/avatar/Screenshot_from_2018-07-19_16-59-01.png',NULL,NULL,3,1,''),(3,'USICT','BTech CSE',2018,'','ss@ss.com','','','','','default/Default_avatar.jpg',NULL,NULL,4,0,''),(4,'USICT','CSE',2018,'','mehndiratta142@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,5,0,''),(5,'USICT','BTech CSE',2019,'','techspace@ipu.ac.in','','','','','default/Default_avatar.jpg',NULL,NULL,1,0,''),(6,'USICT','BTech CSE',2020,'','b4091604@nwytg.net','','','','','default/Default_avatar.jpg',NULL,NULL,6,0,''),(7,'USICT','',2018,'','test@test1.com','','','','','default/Default_avatar.jpg',NULL,NULL,7,0,''),(8,'USICT','BTech CSE',2020,'','pal.vishal41@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,8,1,''),(9,'USICT','B.Tech',2020,'','rajshiv169@gmail.com','','','http://www.github.com/rajshiv169','','user/avatar/siv.JPG',NULL,NULL,9,0,''),(10,'USICT','Computer science and engineering',2019,'','rajatrooney1234@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,10,0,''),(11,'USICT','IT',2022,'','ishubansal2000@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,11,0,''),(12,'USICT','ECE',2018,'','prasadsushmita2@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,12,0,''),(13,'USICT','IT',2022,'','agsinghgarg131@gmail.com','','','','','user/avatar/IMG_20180819_190741.jpg',NULL,NULL,13,1,''),(14,'GGSIPU','CSE',2018,'','negiujjawal@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,14,0,''),(15,'USICT','BTech ECE',2018,'','asmitpapney007@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,15,0,''),(16,'USICT','BTech ECE',2022,'','shubhamg199630@gmail.com','https://m.facebook.com/aryan.gupta.1840','','','','user/avatar/20626742_1433266116764824_456602576878534529_o.jpg',NULL,NULL,16,1,''),(17,'USICT','B.Tech IT',2022,'C++ enthusiast','siddhu28.ss@gmail.com','https://m.facebook.com/profile.php?v=info&lst=100003268991198%3A100003268991198%3A1534814693&ref=bookmarks','','','https://www.linkedin.com/in/siddharth-s-a64126112','default/Default_avatar.jpg',NULL,NULL,17,1,''),(18,'USICT','BTech IT',2022,'','kushagra.garg19@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,18,0,''),(19,'USICT','IT',2022,'','Mukrsh199894@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,19,0,''),(20,'USICT','BTech IT',2022,'','mridul27gupta@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,20,0,''),(21,'USICT','Ece',2018,'','sachin.sharma.6091@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,21,0,''),(22,'USICT','IT Btech',2022,'','harshitrock111@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,22,1,''),(23,'USICT','BTech CSE',2022,'','sharmagirl808@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,23,0,''),(24,'USICT','BTech CSE',2022,'','saksham091098@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,24,1,''),(25,'Usict','BTech CSE',2018,'','belikenoone2k17@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,25,1,''),(26,'USICT','BTech CSE',2022,'','malikvaibhavi@yahoo.in','','','','','default/Default_avatar.jpg',NULL,NULL,26,0,''),(27,'USICT','BTech IT',2022,'','nipul00rock@gmail.com','','','','','user/avatar/Image_6.3.jpg',NULL,NULL,27,1,''),(28,'USICT','ECE',2022,'','guptashrey2000@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,28,0,''),(29,'USICT','CSE',2018,'','sauravshriwastavaa@gmail.com','','','','','user/avatar/Screenshot_20180709-110743.jpg',NULL,NULL,29,1,''),(30,'USICT','ECE',2018,'Python coder, web developer, enthusiast, professional learner...','maurya.abhay30@gmail.com','','','','','user/avatar/wordswag_1532457393048.png',NULL,NULL,30,1,''),(31,'Usict','Cse',2018,'','aryasaurav25@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,31,0,''),(32,'USICT','BTech IT',2018,'','priyakanu1116@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,32,0,''),(33,'USICT','BTech CSE',2022,'','kankit2305@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,33,0,''),(34,'USICT','Cse',2022,'','rohillasaksham20@gmail.com','','','','','user/avatar/IMG20180718121559.jpg',NULL,NULL,34,0,''),(35,'USICT','BTech CSE',2018,'','b5314266@nwytg.net','','','','','default/Default_avatar.jpg',NULL,NULL,35,0,''),(36,'USICT','Ece',2022,'','gahlot.love27@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,36,0,''),(37,'USICT','IT',2022,'','ashishsasmal1@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,37,0,''),(38,'USICT','BTech CSE',2018,'','b5329687@nwytg.net','','','','','default/Default_avatar.jpg',NULL,NULL,38,0,''),(39,'USICT','BTech CSE',2022,'','kumarakash0407@gmail.com','','','','','user/avatar/IMG_20180304_103132462.jpg',NULL,NULL,39,0,''),(41,'USICT','IT',2022,'','Aamirsaifi00000@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,41,1,''),(42,'USICT','BTech CSE',2022,'','rithik19901998@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,42,0,''),(43,'USICT','BTech CSE',2020,'','kumarprafful.54@gmail.com','','','','','user/avatar/Screenshot_from_2018-05-24_00-12-26.png',NULL,NULL,43,1,''),(44,'USICT','BTech CSE',2022,'','gauravjain2202@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,44,0,''),(45,'USICT','BTech IT',2022,'','http://swarajroutray961@gmail.com','https://m.facebook.com/swaraj.routray.83','','','','user/avatar/InShot_20180605_133425.jpg',NULL,NULL,45,0,''),(46,'USICT','BTech IT',2019,'AR/VR enthusiast, research oriented and an avid hacker. President of AR/VR society at USICT.','purangt@gmail.com','https://www.facebook.com/tpurang','','','https://www.linkedin.com/in/tushar-purang-762513104/','user/avatar/IMG_20180320_1629172.jpg',NULL,NULL,46,1,''),(48,'USICT','ECE',2022,'','anubhav.tomar.7373@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,48,0,''),(49,'USICT','B.tech ECE',2020,'','vinaykmw@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,49,0,''),(50,'USICT','BTech IT',2018,'','rishabh42pandey@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,50,1,''),(51,'USICT','BTech ECE',2022,'','devanshg2000@icloud.com','','','','','default/Default_avatar.jpg',NULL,NULL,51,0,''),(52,'USICT','CSE',2022,'','manorit2001@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,52,0,''),(53,'USICT','BTech IT',2018,'','garvit121172@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,53,1,''),(54,'USICT','BTech CSE',2022,'','yogeshk972@gmail.com','','','','','user/avatar/Gintoki_std_chibi.gif',NULL,NULL,54,1,''),(55,'USICT','B.Tech Information Technology',2022,'','munyatam2001@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,55,1,''),(56,'USICT','BTech ECE',2022,'','prakhartp@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,56,0,''),(57,'USICT','BTech IT',2022,'','tanyaagrawal1006@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,57,0,''),(58,'USICT','BTech CSE',2019,'','tech.space@ipu.ac.in','','','','','default/Default_avatar.jpg',NULL,NULL,58,1,''),(59,'USICT','CSE',2020,'','ritviksinghrautela@gmail.com','https://www.facebook.com/ritzing2201','','https://github.com/Ritzing','https://www.linkedin.com/in/ritviksinghrautela/','user/avatar/WhatsApp_Image_2018-08-15_at_12.00.03_AM.jpeg',NULL,NULL,59,1,''),(60,'USICT','BTech IT',2022,'Day Dreamer to the core with feet Resting in Reality , Bent upon learning n exploring Passionately , have got a penchant for detail , can be the laziest guy in town at times but never wanna stop at all when stuck with a Goal !!!','divyansh000915@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,60,1,''),(61,'USICT','IT',2019,'','sharmashubham9800@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,61,1,''),(62,'USICT','EcE',2022,'','Dr.manojkr001mit@gmail.com','','','','','user/avatar/IMG_20180809_093500.jpg',NULL,NULL,62,0,''),(63,'USICT','BTech ECE',2022,'','Prajwal.singh.716@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,63,0,''),(64,'USICT','IT',2022,'','amaykumar98@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,64,0,''),(65,'USICT','CSE',2018,'','Yadavsourav605@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,65,0,''),(66,'USICT','IT',2022,'','sachinbhola947@gmail.com','','','','','user/avatar/IMG-20180822-WA0037.jpg',NULL,NULL,66,0,''),(67,'USICT','IT',2021,'','shoryajain1999@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,67,0,''),(68,'USICT','cse',2022,'','shadmanansari346c@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,68,0,''),(69,'USICT','IT',2019,'','punitm187@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,69,0,''),(70,'USICT','IT',2021,'','kanurag94@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,70,0,''),(71,'USICT','IT',2022,'','sejal2609.sg@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,71,0,''),(72,'USICT','B.Tech(IT)',2020,'Avid Learner | Competetive Coding Enthusiast| Android Lover | Language Lover','rohan.me2014@gmail.com','https://www.facebook.com/profile.php?id=100005296428946','https://twitter.com/RohanGo71509926','https://github.com/RohanGoyal2014','https://linkedin.com/in/rohan-goyal-10ab60126/','user/avatar/DkTtDaPU8AAtukQ.jpg',NULL,NULL,72,1,''),(73,'USICT','BTech CSE',2022,'','shantanuverma022@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,73,0,''),(74,'USICT','BTech ECE',2018,'','yasserfcb21@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,74,0,''),(75,'USICT','CSE',2022,'','Jatinkansal97@yahoo.com','','','','','default/Default_avatar.jpg',NULL,NULL,75,0,''),(76,'USICT','Cse',2022,'','partharora99160808@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,76,1,''),(77,'USICT','BTech CSE',2021,'','uditgoel.82@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,77,0,''),(78,'USICT','BTech IT',2021,'','anandarnav2016@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,78,1,''),(79,'USICT','Information technology',2022,'','karan49s@yahoo.com','','','','','user/avatar/FB_IMG_1529897261780.jpg',NULL,NULL,79,1,''),(80,'USICT','BTech CSE',2022,'','HNJoshi0999@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,80,0,''),(81,'USICT','BTech IT',2022,'','namanjain2912@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,81,0,''),(82,'USICT','ECe',2021,'','rajataggarwal2603@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,82,1,''),(83,'USICT','BTech ECE',2021,'','tarunkumarpaul72@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,83,0,''),(84,'USICT','Ece',2021,'','adityak2920@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,84,0,''),(85,'USICT','BTech IT',2022,'','kaushikpankaj78@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,85,0,''),(86,'USICT','CSE',2021,'','garg.dh123@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,86,0,''),(87,'USICT','MCA',2020,'','vaishalilodh21@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,87,0,''),(88,'USICT','BTech CSE',2021,'','kwatranishkarsh@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,88,0,''),(89,'USICT','Computer Science',2020,'','kapillamba4@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,89,1,''),(90,'USICT','BTech CSE',2025,'','wijilu@hurify1.com','','','','','default/Default_avatar.jpg',NULL,NULL,90,0,''),(91,'USICT','Information Technology',2022,'','aakashmehtaa1308@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,91,0,''),(92,'USICT','IT',2018,'','bothrabhavik@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,92,1,''),(93,'USICT','BTech CSE',2022,'','ashutoshvarma11@live.com','','','','','default/Default_avatar.jpg',NULL,NULL,93,0,''),(94,'USICT','CSE',2021,'','shlok2999@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,94,0,''),(95,'USICT','IT',2022,'','ishan.gupta1720@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,95,0,''),(96,'USICT','IT',2018,'','ps9395@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,96,0,''),(97,'USICT','Cse',2018,'','abhishekgautam690@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,97,0,''),(98,'University School of information and communication technology','BTech CSE',2022,'','dhankhar.vishal23@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,98,0,''),(99,'USICT','CSE 1st year',2022,'','aakashsangwan024@gmail.com','','','','','user/avatar/IMG-20180809-WA0000.jpg',NULL,NULL,99,0,''),(100,'USICT','BTech CSE',2022,'','Kunalgoenka 83@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,100,1,''),(101,'USICT','Cse',2018,'','Shah.suraj1200@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,101,0,''),(102,'Usict','Cse',2018,'','Kumar.3338@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,102,0,''),(103,'USIC','BTech IT',2018,'','user@test.com','','','','','default/Default_avatar.jpg',NULL,NULL,103,0,''),(104,'USICT','ECE',2018,'','rajputinderjeet2468@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,104,0,''),(105,'USICT','BTech IT',2018,'','yashbansal349@gmail.com','','','','','user/avatar/IMG_20180821_130909_Bokeh_Ojvoq19.jpg',NULL,NULL,105,0,''),(106,'USICT','CSE',2022,'','deepanshuhooda97@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,106,0,''),(107,'USICT','CSE',2022,'','sngargrsd@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,107,0,''),(108,'USICT','BTech CSE',2022,'','jaincoolpranav@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,108,0,''),(109,'USICT','ECE',2018,'','akumark12315@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,109,1,''),(110,'USICT','BTech IT',2021,'','s.anushka0804@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,110,0,''),(111,'USICT','ECE',2021,'','akasin2701@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,111,0,''),(112,'USICT','BTech IT',2021,'','Ananyavsrivastava@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,112,0,''),(113,'USICT','BTech ECE',2022,'','ankitkumar141299y@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,113,1,''),(114,'USICT','MCA',2020,'','','','','','','default/Default_avatar.jpg',NULL,NULL,114,0,''),(116,'','',2021,'','fzcooldude@gmail.com','','','','','user/avatar/arink.png',NULL,NULL,116,0,'Pappu pandi'),(117,'USICT','BTech IT',2020,'','vishutyagi018@gmail.com','','','','','user/avatar/39284532_1150568531749100_380497187181690880_n.jpg',NULL,NULL,117,1,'Vishu'),(118,'B-tech(ECE)-I','',2018,'HI','pratyushtiwarimj@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,118,1,''),(119,'USICT','ECE',2022,'','rohansaini161@gmail.com','','','','','default/Default_avatar.jpg',NULL,NULL,119,1,'');
/*!40000 ALTER TABLE `log_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_userprofile_club`
--

DROP TABLE IF EXISTS `log_userprofile_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_userprofile_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `log_userprofile_club_userprofile_id_club_id_8fedf9f6_uniq` (`userprofile_id`,`club_id`),
  KEY `log_userprofile_club_club_id_43f28029_fk_home_club_id` (`club_id`),
  CONSTRAINT `log_userprofile_club_club_id_43f28029_fk_home_club_id` FOREIGN KEY (`club_id`) REFERENCES `home_club` (`id`),
  CONSTRAINT `log_userprofile_club_userprofile_id_6c8dce90_fk_log_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `log_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_userprofile_club`
--

LOCK TABLES `log_userprofile_club` WRITE;
/*!40000 ALTER TABLE `log_userprofile_club` DISABLE KEYS */;
INSERT INTO `log_userprofile_club` VALUES (1,5,8),(8,7,1),(7,9,1),(6,28,1),(5,30,1),(4,34,1),(3,37,6),(2,39,5),(10,58,2),(9,103,1);
/*!40000 ALTER TABLE `log_userprofile_club` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-24  8:00:01

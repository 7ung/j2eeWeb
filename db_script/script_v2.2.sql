-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: j2ee_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(128) NOT NULL,
  `expired` double NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_token_userid_fk_idx` (`user_id`),
  CONSTRAINT `access_token_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
INSERT INTO `access_token` VALUES (20,'a377990d91bc8345c51083415a06dca5',1492651846,9);
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `development_type`
--

DROP TABLE IF EXISTS `development_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `development_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Có sẵn một số dữ liệu. Người dùng chọn trong danh sách đã có hoặc có thể tạo mới';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `development_type`
--

LOCK TABLES `development_type` WRITE;
/*!40000 ALTER TABLE `development_type` DISABLE KEYS */;
INSERT INTO `development_type` VALUES (1,'full_stack_web','Full Stack Web',NULL),(2,'front_end_web','Front End Web',NULL),(3,'back_end_web','Back End Web',NULL),(4,'mobile','Mobile',NULL),(5,'database_adminstration','Database Adminstration',NULL),(6,'desktop','Desktop',NULL),(7,'system_adminstration','System Adminstration',NULL),(8,'devops','DevOps',NULL),(9,'design','Design',NULL),(10,'machine_learning','Machine Learning',NULL),(11,'product_manager','Product Manager',NULL),(12,'quality_assurance','Quality Assurance',NULL);
/*!40000 ALTER TABLE `development_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Có sẵn một số dữ liệu. Người dùng chọn trong danh sách đã có hoặc có thể tạo mới';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'unity','Unity'),(2,'c_sharp','C#'),(3,'java','Java'),(4,'c_plus_plus','C++'),(5,'angular_js','Angular Js'),(6,'android','Android');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_image_fk_idx` (`user_id`),
  CONSTRAINT `user_image_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(120) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` varchar(8192) NOT NULL,
  `date` double NOT NULL,
  `view` int(11) DEFAULT NULL COMMENT 'Số lượt view',
  `status` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_post_fk_idx` (`user_id`),
  KEY `post_subject_fk_idx` (`subject_id`),
  CONSTRAINT `post_subject_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_post_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'1','Dumm Dumm','<ul>\r\n	<li>\r\n	<h3><strong>M&atilde; HTML</strong></h3>\r\n	</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li><em>Hay v&atilde;i</em></li>\r\n</ol>\r\n\r\n<p><em>áº¢nh:&nbsp;</em></p>\r\n\r\n<p><em><img alt=\"áº¢nh fb\" src=\"https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-9/17884672_813350142148223_5698542332562207933_n.jpg?oh=8d1686b5cd4be37c157771071db056a9&amp;oe=597C4580\" style=\"border-style:solid; border-width:2px; height:220px; width:220px\" /></em></p>\r\n',1492592369,NULL,'published',9,NULL),(2,'2','Dum 2','<p><s>Kh&ocirc;ng biáº¿t viáº¿t g&igrave;</s></p>\r\n',1492592430,NULL,'published',9,NULL),(15,'f','abc','<p>abc</p>\r\n',1492607814,NULL,'published',9,3),(16,'10','abc','<p>abc</p>\r\n',1492607908,NULL,'published',9,3),(17,'11','abc','<p>abc</p>\r\n',1492608660,NULL,'published',9,8);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_image` (
  `post_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `replace_code` varchar(32) NOT NULL,
  PRIMARY KEY (`post_id`,`image_id`),
  KEY `post_image_imageid_fk_idx` (`image_id`),
  CONSTRAINT `post_image_imageid_fk` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_image_postid_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_image`
--

LOCK TABLES `post_image` WRITE;
/*!40000 ALTER TABLE `post_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `post_tag_tagid_fk_idx` (`tag_id`),
  CONSTRAINT `post_tag_postid_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `post_tag_tagid_fk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(128) NOT NULL,
  `dob` datetime(6) DEFAULT NULL COMMENT 'Ngày sinh',
  `gender` varchar(16) NOT NULL DEFAULT 'male' COMMENT 'male, female, unknown',
  `country` varchar(64) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL COMMENT 'Địa điểm làm việc, ví dụ Tp HCM\nDùng thư viện tạo gợi ý nhập.',
  `personal_link` varchar(256) DEFAULT NULL COMMENT 'Trang web cá nhân',
  `about` varchar(512) DEFAULT NULL COMMENT 'Miêu tả về bản thân',
  `profile_picture_id` int(11) DEFAULT NULL COMMENT 'Ảnh đại diện',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_profile_userid_fk_idx` (`user_id`),
  CONSTRAINT `user_profile_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeking_job`
--

DROP TABLE IF EXISTS `seeking_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seeking_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(256) DEFAULT NULL,
  `development_type_id` int(11) DEFAULT NULL,
  `seniority_id` int(11) DEFAULT NULL,
  `min_salary` int(11) DEFAULT NULL,
  `max_salary` int(11) DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'0',
  `view` int(11) DEFAULT NULL,
  `create_date` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seeking_job_development_type_idx` (`development_type_id`),
  KEY `seeking_job_seniority_fk_idx` (`seniority_id`),
  KEY `seeking_job_user_userid_fk_idx` (`user_id`),
  CONSTRAINT `seeking_job_development_type_fk` FOREIGN KEY (`development_type_id`) REFERENCES `development_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seeking_job_seniority_fk` FOREIGN KEY (`seniority_id`) REFERENCES `seniority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `seeking_job_user_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeking_job`
--

LOCK TABLES `seeking_job` WRITE;
/*!40000 ALTER TABLE `seeking_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `seeking_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seniority`
--

DROP TABLE IF EXISTS `seniority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seniority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Có sẵn một số dữ liệu. Người dùng chọn trong danh sách đã có hoặc có thể tạo mới';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seniority`
--

LOCK TABLES `seniority` WRITE;
/*!40000 ALTER TABLE `seniority` DISABLE KEYS */;
INSERT INTO `seniority` VALUES (1,'student','Student',NULL),(2,'junior','Junior',NULL),(3,'mid_level','Mid-Level',NULL),(4,'senior','Senior',NULL),(5,'lead','Lead',NULL),(6,'manager','Manager',NULL);
/*!40000 ALTER TABLE `seniority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `date` double DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_subject_id_idx` (`user_id`),
  CONSTRAINT `user_subject_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (3,'1','dumm dumm',NULL,1492581335,0,9),(4,'2','go go',NULL,1492581353,0,9),(5,'3','chop chop',NULL,1492581368,0,10),(6,'4','bemp bemp',NULL,1492581384,0,10),(7,'5','booom booom',NULL,1492581412,0,10),(8,'8','haha','',1492608659,0,9);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `user_role_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `user_role_role_id_fk_idx` (`user_role_id`),
  CONSTRAINT `user_role_role_id_fk` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test1','test1','test1@gm',1),(3,'hâ ','4a54b1a620bf8cd997ba344e97e2c19d','hoo@hiihi',1),(4,'Há» HoÃ ng TÃ¹ng','5eb689875e154c871b961e061d523103','hohoho@hoho',1),(5,'nguyá»n vÄn trá»i','c6f5770ad8f0d0c4357ff3854d95392f','hohohohoho@hghgh',1),(6,'tÃ¹ng tÃ¹ng','5eb689875e154c871b961e061d523103','hohoangtung12a3@gmail.com',1),(7,'há» hoÃ n kiáº¿m','5eb689875e154c871b961e061d523103','hhhh@hhh',1),(8,'tÃ¹ng há»','b054495f30c8fc74d7d66136781d17ed','ththt@ththt',1),(9,'jobjob','101193d7181cc88340ae5b2b17bba8a1','job@job',1),(10,'123','4297f44b13955235245b2497399d7a93','123@123',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dev_type`
--

DROP TABLE IF EXISTS `user_dev_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_dev_type` (
  `user_id` int(11) NOT NULL,
  `development_type_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`development_type_id`),
  KEY `user_devtype_fk_idx` (`development_type_id`),
  CONSTRAINT `user_devtype_fk` FOREIGN KEY (`development_type_id`) REFERENCES `development_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dev_type`
--

LOCK TABLES `user_dev_type` WRITE;
/*!40000 ALTER TABLE `user_dev_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_dev_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_experience`
--

DROP TABLE IF EXISTS `user_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_experience` (
  `user_id` int(11) NOT NULL,
  `experience_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`experience_id`),
  KEY `user_experience_expid_fk_idx` (`experience_id`),
  CONSTRAINT `user_experience_expid_fk` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_experience_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_experience`
--

LOCK TABLES `user_experience` WRITE;
/*!40000 ALTER TABLE `user_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post_bookmark`
--

DROP TABLE IF EXISTS `user_post_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post_bookmark` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `note` varchar(1024) NOT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `user_post_postid_fk_idx` (`post_id`),
  CONSTRAINT `user_post_postid_fk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_post_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post_bookmark`
--

LOCK TABLES `user_post_bookmark` WRITE;
/*!40000 ALTER TABLE `user_post_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_post_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'user','Người dùng'),(2,'admin','Admin');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subject_bookmark`
--

DROP TABLE IF EXISTS `user_subject_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subject_bookmark` (
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`subject_id`,`user_id`),
  KEY `user_subject_bookmark_subjectid_fk_idx` (`subject_id`),
  KEY `user_subject_bookmark_userid_fk` (`user_id`),
  CONSTRAINT `user_subject_bookmark_subjectid_fk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_subject_bookmark_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subject_bookmark`
--

LOCK TABLES `user_subject_bookmark` WRITE;
/*!40000 ALTER TABLE `user_subject_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subject_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tag_bookmark`
--

DROP TABLE IF EXISTS `user_tag_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tag_bookmark` (
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `user_tag_tagid_fk_idx` (`tag_id`),
  CONSTRAINT `user_tag_tagid_fk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_tag_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tag_bookmark`
--

LOCK TABLES `user_tag_bookmark` WRITE;
/*!40000 ALTER TABLE `user_tag_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tag_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_work`
--

DROP TABLE IF EXISTS `user_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_work` (
  `user_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `role` varchar(128) DEFAULT NULL COMMENT 'Chức vụ',
  PRIMARY KEY (`user_id`,`work_id`),
  KEY `user_work_workid_fk_idx` (`work_id`),
  CONSTRAINT `user_work_userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_work_workid_fk` FOREIGN KEY (`work_id`) REFERENCES `work` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_work`
--

LOCK TABLES `user_work` WRITE;
/*!40000 ALTER TABLE `user_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Các công việc người dùng đã từng làm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19 22:07:41

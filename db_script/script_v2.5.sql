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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
INSERT INTO `access_token` VALUES (20,'a377990d91bc8345c51083415a06dca5',1493613305,9),(21,'6f2bf502281c1aef28bdbec024d00d03',1493574628,10),(22,'b6cfb93f21d63c2f55d94e927df57d12',1493535937,12),(23,'77394a85bd9b92ff99e804457cafeb92',1493583536,11);
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(512) NOT NULL,
  `date` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_post_post_id_idx` (`post_id`),
  KEY `fk_comment_user_user_id_idx` (`user_id`),
  CONSTRAINT `fk_comment_post_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'1','Dumm Dumm','<ul>\r\n	<li>\r\n	<h3><strong>M&atilde; HTML</strong></h3>\r\n	</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li><em>Hay v&atilde;i</em></li>\r\n</ol>\r\n\r\n<p><em>áº¢nh:&nbsp;</em></p>\r\n\r\n<p><em><img alt=\"áº¢nh fb\" src=\"https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-9/17884672_813350142148223_5698542332562207933_n.jpg?oh=8d1686b5cd4be37c157771071db056a9&amp;oe=597C4580\" style=\"border-style:solid; border-width:2px; height:220px; width:220px\" /></em></p>\r\n',1492592369,1,'published',10,NULL),(16,'10','abc','<p>Test chơi cho vui th&ocirc;i h&agrave;</p>\r\n',1493473746,16,'published',9,3),(17,'11','abc','<p>abc</p>\r\n',1492608660,1,'published',9,8),(18,'12','abc','<p>abc</p>\r\n',1492621382,5,'published',10,NULL),(19,'13','hihi','<p>hoho</p>\r\n',1492929943,1,'published',9,3),(20,'14','Bleach','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OxQPw650VkE\" frameborder=\"0\" allowfullscreen></iframe>',1492930017,23,'published',9,9),(23,'17','A town with the ocean view','&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/oVQ3IyKJx2s&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;',1492930626,6,'published',9,12),(30,'1e','Spring Web Services Tutorial','<p><s>Kh&ocirc;ng biáº¿t viáº¿t g&igrave;</s></p>',1493024734,2,'published',10,NULL),(31,'1f','Spring Web Services Tutorial','<p><strong>Update</strong><br />\r\nI&#39;ve recently written a more up to date version of this post which describes how to build a contract first web service using Apache CXF. Check it out&nbsp;<a href=\"http://briansjavablog.blogspot.co.uk/2016/10/apache-cxf-contract-first-web-service.html\" target=\"_blank\">here</a>.<br />\r\n<br />\r\n<strong>Introduction</strong><br />\r\nModern enterprise applications are rarely stand alone and often rely on data and services provided by external systems. In order for different types of systems to communicate there must be a &nbsp;communication protocol of some sort, a standard way of sending and receiving messages in a format that is recognised and supported by all major platforms. SOAP (Simple Object Application Protocol) is such a protocol, and allows applications to communicate by exchanging messages in a standard XML format.<br />\r\nSOAP Web Services provide a platform agnostic integration&nbsp;mechanism&nbsp;that allows disparate systems to exchange data regardless of the platform they are running on. For example, SOAP web services are commonly used to integrate .NET applications with applications running on the Java platform. Almost all modern platforms and frameworks (Java, .Net, Ruby, PHP, etc) provide comprehensive libraries and tooling that allow developers to quickly and easily expose and consume&nbsp;SOAP&nbsp;services.<br />\r\nThis post will look at Spring Web Services and take you through a step by step tutorial for building, deploying and testing a simple contract first SOAP service for retrieving simple bank account details.</p>\r\n',1493029112,57,'published',9,9),(32,'20','jQuery Syntax','<h2>jQuery Syntax</h2>\r\n\r\n<p>The jQuery syntax is tailor-made for&nbsp;<strong>selecting</strong>&nbsp;HTML elements and performing some&nbsp;<strong>action</strong>&nbsp;on the element(s).</p>\r\n\r\n<p>Basic syntax is:&nbsp;<strong>$(<em>selector</em>).<em>action</em>()</strong></p>\r\n\r\n<ul>\r\n	<li>A $ sign to define/access jQuery</li>\r\n	<li>A (<em>selector</em>) to &quot;query (or find)&quot; HTML elements</li>\r\n	<li>A jQuery&nbsp;<em>action</em>() to be performed on the element(s)</li>\r\n</ul>\r\n\r\n<p>Examples:</p>\r\n\r\n<p>$(this).hide() - hides the current element.</p>\r\n\r\n<p>$(&quot;p&quot;).hide() - hides all</p>\r\n\r\n<p>elements.</p>\r\n\r\n<p>$(&quot;.test&quot;).hide() - hides all elements with class=&quot;test&quot;.</p>\r\n\r\n<p>$(&quot;#test&quot;).hide() - hides the element with id=&quot;test&quot;.</p>\r\n\r\n<hr />\r\n<h2>The Document Ready Event</h2>\r\n\r\n<p>You might have noticed that all jQuery methods in our examples, are inside a document ready event:</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>$(document).ready(function(){<br />\r\n			<br />\r\n			&nbsp;&nbsp;&nbsp;<em>// jQuery methods go here...</em><br />\r\n			<br />\r\n			});</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>This is to prevent any jQuery code from running before the document is finished loading (is ready).</p>\r\n\r\n<p>It is good practice to wait for the document to be fully loaded and ready before working with it. This also allows you to have your JavaScript code before the body of your document, in the head section.</p>\r\n\r\n<p>Here are some examples of actions that can fail if methods are run before the document is fully loaded:</p>\r\n\r\n<ul>\r\n	<li>Trying to hide an element that is not created yet</li>\r\n	<li>Trying to get the size of an image that is not loaded yet</li>\r\n</ul>\r\n\r\n<p><strong>Tip:</strong>&nbsp;The jQuery team has also created an even shorter method for the document ready event:</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>$(function(){<br />\r\n			<br />\r\n			&nbsp;&nbsp;&nbsp;<em>// jQuery methods go here...</em><br />\r\n			<br />\r\n			});</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Use the syntax you prefer. We think that the document ready event is easier to understand when reading the code.</p>\r\n\r\n<p>Source:<a href=\"http:// https://www.w3schools.com/jquery/jquery_syntax.asp\">&nbsp;https://www.w3schools.com/jquery/jquery_syntax.asp</a></p>\r\n',1493106629,175,'published',9,13),(36,'24','JavaScript Syntax 1','<p>JavaScript&nbsp;<strong>syntax</strong>&nbsp;is the set of&nbsp;rules, how JavaScript programs are constructed.</p>\r\n\r\n<hr />\r\n<h2>JavaScript Programs</h2>\r\n\r\n<p>A&nbsp;<strong>computer program</strong>&nbsp;is a list of &quot;instructions&quot; to be &quot;executed&quot; by the computer.</p>\r\n\r\n<p>In a programming language, these program instructions are called&nbsp;<strong>statements</strong>.</p>\r\n\r\n<p>JavaScript is a&nbsp;<strong>programming language</strong>.</p>\r\n\r\n<p>JavaScript statements are separated by&nbsp;<strong>semicolons</strong>:</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>var&nbsp;x, y, z;<br />\r\nx =&nbsp;5;<br />\r\ny =&nbsp;6;<br />\r\nz = x + y;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_statements\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>In HTML, JavaScript programs are executed by the web browser.</p>\r\n\r\n<hr />\r\n<h2>JavaScript Statements</h2>\r\n\r\n<p>JavaScript statements are composed of:</p>\r\n\r\n<p>Values, Operators, Expressions,&nbsp;Keywords, and Comments.</p>\r\n\r\n<hr />\r\n<h2>JavaScript Values</h2>\r\n\r\n<p>The JavaScript syntax defines two types of values: Fixed values and variable values.</p>\r\n\r\n<p>Fixed values are called&nbsp;<strong>literals</strong>. Variable values are called&nbsp;<strong>variables</strong>.</p>\r\n\r\n<hr />\r\n<h2>JavaScript Literals</h2>\r\n\r\n<p>The most important rules for writing fixed values are:</p>\r\n\r\n<p><strong>Numbers</strong>&nbsp;are written with or without decimals:</p>\r\n\r\n<p>10.50<br />\r\n<br />\r\n1001</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_numbers\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p><strong>Strings</strong>&nbsp;are text, written within double or single quotes:</p>\r\n\r\n<p>&quot;John Doe&quot;<br />\r\n<br />\r\n&#39;John Doe&#39;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_strings\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<hr />\r\n<h2>JavaScript Variables</h2>\r\n\r\n<p>In a programming language,&nbsp;<strong>variables</strong>&nbsp;are used to&nbsp;<strong>store</strong>&nbsp;data values.</p>\r\n\r\n<p>JavaScript uses the&nbsp;<strong>var&nbsp;</strong>keyword to&nbsp;<strong>declare</strong>&nbsp;variables.</p>\r\n\r\n<p>An&nbsp;<strong>equal sign</strong>&nbsp;is used to&nbsp;<strong>assign values</strong>&nbsp;to variables.</p>\r\n\r\n<p>In this example, x is defined as a variable. Then, x is assigned (given) the value 6:</p>\r\n\r\n<p>var&nbsp;x;<br />\r\n<br />\r\nx =&nbsp;6;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_variables\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n',1493533876,1,'published',11,20),(37,'25','JavaScript Syntax 2','<h2>JavaScript Operators</h2>\r\n\r\n<p>JavaScript uses&nbsp;<strong>arithmetic operators</strong>&nbsp;( + - *&nbsp; / ) to&nbsp;<strong>compute</strong>&nbsp;values:</p>\r\n\r\n<p>(5&nbsp;+&nbsp;6) *&nbsp;10</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_operators\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>JavaScript uses an&nbsp;<strong>assignment operator</strong>&nbsp;( = ) to&nbsp;<strong>assign</strong>&nbsp;values to variables:</p>\r\n\r\n<p>var&nbsp;x, y;<br />\r\nx =&nbsp;5;<br />\r\ny =&nbsp;6;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_assign\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<hr />\r\n<h2>JavaScript Expressions</h2>\r\n\r\n<p>An expression is a combination of values, variables, and operators, which computes to a value.</p>\r\n\r\n<p>The computation is called an evaluation.</p>\r\n\r\n<p>For example, 5 * 10 evaluates to 50:</p>\r\n\r\n<p>5&nbsp;*&nbsp;10</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_expressions\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>Expressions can also contain variable values:</p>\r\n\r\n<p>x *&nbsp;10</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_expressions_variables\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>The values can be of various types, such as numbers and strings.</p>\r\n\r\n<p>For example, &quot;John&quot; + &quot; &quot; + &quot;Doe&quot;, evaluates to &quot;John Doe&quot;:</p>\r\n\r\n<p>&quot;John&quot;&nbsp;+&nbsp;&quot; &quot;&nbsp;+&nbsp;&quot;Doe&quot;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_expressions_strings\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<hr />\r\n<h2>JavaScript Keywords</h2>\r\n\r\n<p>JavaScript&nbsp;<strong>keywords</strong>&nbsp;are used to identify actions to be performed.</p>\r\n\r\n<p>The&nbsp;<strong>var</strong>&nbsp;keyword tells the browser to create variables:</p>\r\n\r\n<p>var&nbsp;x, y;<br />\r\nx =&nbsp;5&nbsp;+&nbsp;6;<br />\r\ny = x *&nbsp;10;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_keywords\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<hr />\r\n<h2>JavaScript Comments</h2>\r\n\r\n<p>Not all JavaScript statements are &quot;executed&quot;.</p>\r\n\r\n<p>Code after double slashes&nbsp;<strong>//</strong>&nbsp;or between&nbsp;<strong>/*</strong>&nbsp;and&nbsp;<strong>*/</strong>&nbsp;is treated as a&nbsp;<strong>comment</strong>.</p>\r\n\r\n<p>Comments are ignored, and will not be executed:</p>\r\n\r\n<p>var&nbsp;x =&nbsp;5;&nbsp;&nbsp;&nbsp;// I will be executed<br />\r\n<br />\r\n// var x = 6;&nbsp;&nbsp; I will NOT be executed</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_comments\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>You will learn more about comments in a later chapter.</p>\r\n\r\n<hr />\r\n<h2>JavaScript Identifiers</h2>\r\n\r\n<p>Identifiers are names.</p>\r\n\r\n<p>In JavaScript, identifiers are used to name variables (and keywords, and functions, and labels).</p>\r\n\r\n<p>The rules for legal names are much the same in most programming languages.</p>\r\n\r\n<p>In JavaScript, the first character must be a letter, an underscore (_), or a dollar sign ($).</p>\r\n\r\n<p>Subsequent characters may be letters, digits, underscores, or dollar signs.</p>\r\n\r\n<p>Numbers are not allowed as the first character.<br />\r\nThis way JavaScript can easily distinguish identifiers from numbers.</p>\r\n\r\n<hr />\r\n<h2>JavaScript is Case Sensitive</h2>\r\n\r\n<p>All JavaScript identifiers are&nbsp;<strong>case sensitive</strong>.&nbsp;</p>\r\n\r\n<p>The variables&nbsp;<strong>lastName</strong>&nbsp;and&nbsp;<strong>lastname</strong>, are two different variables.</p>\r\n\r\n<p>var&nbsp;lastname, lastName;<br />\r\nlastName =&nbsp;&quot;Doe&quot;;<br />\r\nlastname =&nbsp;&quot;Peterson&quot;;</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_syntax_case\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>JavaScript does not interpret&nbsp;<strong>VAR</strong>&nbsp;or&nbsp;<strong>Var</strong>&nbsp;as the keyword&nbsp;<strong>var</strong>.</p>\r\n\r\n<hr />\r\n<h2>JavaScript and Camel Case</h2>\r\n\r\n<p>Historically, programmers have used different ways of joining multiple words into one variable name:</p>\r\n\r\n<p><strong>Hyphens:</strong></p>\r\n\r\n<p>first-name, last-name, master-card, inter-city.</p>\r\n\r\n<p>Hyphens are not allowed in JavaScript. It is reserved for subtractions.</p>\r\n\r\n<p><strong>Underscore:</strong></p>\r\n\r\n<p>first_name, last_name, master_card, inter_city.</p>\r\n\r\n<p><strong>Upper Camel Case (Pascal Case):</strong></p>\r\n\r\n<p>FirstName, LastName, MasterCard, InterCity.</p>\r\n\r\n<p><img alt=\"camelCase\" src=\"https://www.w3schools.com/js/pic_camelcase.jpg\" /></p>\r\n\r\n<p><strong>Lower Camel Case:</strong></p>\r\n\r\n<p>JavaScript programmers tend to use camel case that starts with a lowercase letter:</p>\r\n\r\n<p>firstName, lastName, masterCard, interCity.</p>\r\n\r\n<hr />\r\n<h2>JavaScript Character Set</h2>\r\n\r\n<p>JavaScript uses the&nbsp;<strong>Unicode</strong>&nbsp;character set.</p>\r\n\r\n<p>Unicode covers (almost) all the characters, punctuations, and symbols in the world.</p>\r\n\r\n<p>For a closer look, please study our&nbsp;<a href=\"https://www.w3schools.com/charsets/ref_html_utf8.asp\">Complete Unicode Reference</a>.</p>\r\n',1493533948,2,'published',11,20),(38,'26','JavaScript Events','<p>HTML events are&nbsp;<strong>&quot;things&quot;</strong>&nbsp;that happen to HTML elements.</p>\r\n\r\n<p>When JavaScript is used in HTML pages, JavaScript can&nbsp;<strong>&quot;react&quot;</strong>&nbsp;on these events.</p>\r\n\r\n<hr />\r\n<h2>HTML Events</h2>\r\n\r\n<p>An HTML event can be something the browser does, or something a user does.</p>\r\n\r\n<p>Here are some examples of HTML events:</p>\r\n\r\n<ul>\r\n	<li>An HTML web page has finished loading</li>\r\n	<li>An HTML input field was changed</li>\r\n	<li>An HTML button was clicked</li>\r\n</ul>\r\n\r\n<p>Often, when events happen, you may want to do something.</p>\r\n\r\n<p>JavaScript lets you execute code when events are detected.</p>\r\n\r\n<p>HTML allows event handler attributes,&nbsp;<strong>with JavaScript code</strong>, to be added to HTML elements.</p>\r\n\r\n<p>With single quotes:</p>\r\n\r\n<p>&lt;<em>element</em>&nbsp;<em>event</em>=<strong>&#39;</strong><em><strong>some JavaScript</strong></em><strong>&#39;</strong>&gt;</p>\r\n\r\n<p>With double quotes:</p>\r\n\r\n<p>&lt;<em>element</em>&nbsp;<em>event</em>=<strong>&quot;</strong><em><strong>some JavaScript</strong></em><strong>&quot;</strong>&gt;</p>\r\n\r\n<p>In the following example, an onclick attribute (with code), is added to a button element:</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>The time is?</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_event_onclick1\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>In the example above, the JavaScript code changes the content of the element with id=&quot;demo&quot;.</p>\r\n\r\n<p>In the next example, the code changes the content of its own element (using&nbsp;<strong>this</strong>.innerHTML):</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>The time is?</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_event_onclick\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<p>JavaScript code is often several lines long. It is more common to see event attributes calling functions:</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>The time is?</p>\r\n\r\n<p><a href=\"https://www.w3schools.com/js/tryit.asp?filename=tryjs_events1\" target=\"_blank\">Try it Yourself &raquo;</a></p>\r\n\r\n<hr />\r\n<h2>Common HTML Events</h2>\r\n\r\n<p>Here is a list of some common HTML events:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Event</th>\r\n			<th>Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>onchange</td>\r\n			<td>An HTML element has been changed</td>\r\n		</tr>\r\n		<tr>\r\n			<td>onclick</td>\r\n			<td>The user clicks an HTML element</td>\r\n		</tr>\r\n		<tr>\r\n			<td>onmouseover</td>\r\n			<td>The user moves the mouse over an HTML element</td>\r\n		</tr>\r\n		<tr>\r\n			<td>onmouseout</td>\r\n			<td>The user moves the mouse away from an HTML element</td>\r\n		</tr>\r\n		<tr>\r\n			<td>onkeydown</td>\r\n			<td>The user pushes a keyboard key</td>\r\n		</tr>\r\n		<tr>\r\n			<td>onload</td>\r\n			<td>The browser has finished loading the page</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>The list is much longer:&nbsp;<a href=\"https://www.w3schools.com/jsref/dom_obj_event.asp\">W3Schools JavaScript Reference HTML DOM Events</a>.</p>\r\n\r\n<hr />\r\n<h2>What can JavaScript Do?</h2>\r\n\r\n<p>Event handlers can be used to handle, and verify, user input, user actions, and browser actions:</p>\r\n\r\n<ul>\r\n	<li>Things that should be done every time a page loads</li>\r\n	<li>Things that should be done when the page is closed</li>\r\n	<li>Action that should be performed when a user clicks a button</li>\r\n	<li>Content that should be verified when a user inputs data</li>\r\n	<li>And more ...</li>\r\n</ul>\r\n\r\n<p>Many different methods can be used to let JavaScript work with events:</p>\r\n\r\n<ul>\r\n	<li>HTML event attributes can execute JavaScript code directly</li>\r\n	<li>HTML event attributes can call JavaScript functions</li>\r\n	<li>You can assign your own event handler functions to HTML elements</li>\r\n	<li>You can prevent events from being sent or being handled</li>\r\n	<li>And more ...</li>\r\n</ul>\r\n\r\n<p>You will learn a lot more about events and event handlers in the HTML DOM chapters.</p>\r\n',1493538055,10,'published',11,20),(39,'27','What is Web Service','<p>A&nbsp;<strong>Web Service</strong>&nbsp;is can be defined by following ways:</p>\r\n\r\n<ul>\r\n	<li>is a client server application or application component for communication.</li>\r\n	<li>method of communication between two devices over network.</li>\r\n	<li>is a software system for interoperable machine to machine communication.</li>\r\n	<li>is a collection of standards or protocols for exchanging information between two devices or application.</li>\r\n</ul>\r\n\r\n<p>Let&#39;s understand it by the figure given below:</p>\r\n\r\n<p><img alt=\"web services\" src=\"https://www.javatpoint.com/webservicepages/images/web-services.png\" /></p>\r\n\r\n<p>As you can see in the figure, java, .net or PHP applications can communicate with other applications through web service over the network. For example, java application can interact with Java, .Net and PHP applications. So web service is a language independent way of communication.</p>\r\n\r\n<h2>Types of Web Services</h2>\r\n\r\n<p>There are mainly two types of web services.</p>\r\n\r\n<ol>\r\n	<li>SOAP web services.</li>\r\n	<li>RESTful web services.</li>\r\n</ol>\r\n\r\n<p><img alt=\"types of web services\" src=\"https://www.javatpoint.com/webservicepages/images/typesofwebservices.png\" /></p>\r\n',1493539277,3,'published',11,21),(40,'28','Web Service Components','<p>There are three major web service components.</p>\r\n\r\n<ol>\r\n	<li>SOAP</li>\r\n	<li>WSDL</li>\r\n	<li>UDDI</li>\r\n</ol>\r\n\r\n<hr />\r\n<h2>SOAP</h2>\r\n\r\n<p>SOAP is an acronym for Simple Object Access Protocol.</p>\r\n\r\n<p>SOAP is a XML-based protocol for accessing web services.</p>\r\n\r\n<p>SOAP is a W3C recommendation for communication between applications.</p>\r\n\r\n<p>SOAP is XML based, so it is platform independent and language independent. In other words, it can be used with Java, .Net or PHP language on any platform.</p>\r\n\r\n<hr />\r\n<h2>WSDL</h2>\r\n\r\n<p>WSDL is an acronym for Web Services Description Language.</p>\r\n\r\n<p>WSDL is a xml document containing information about web services such as method name, method parameter and how to access it.</p>\r\n\r\n<p>WSDL is a part of UDDI. It acts as a interface between web service applications.</p>\r\n\r\n<p>WSDL is pronounced as&nbsp;<q>wiz-dull</q>.</p>\r\n\r\n<h2>UDDI</h2>\r\n\r\n<p>UDDI is an acronym for Universal Description, Discovery and Integration.</p>\r\n\r\n<p>UDDI is a XML based framework for describing, discovering and integrating web services.</p>\r\n\r\n<p>UDDI is a directory of web service interfaces described by WSDL, containing information about web services.</p>\r\n',1493539391,1,'published',11,21),(41,'29','SOAP Web Services','<p>SOAP stands for Simple Object Access Protocol. It is a XML-based protocol for accessing web services.</p>\r\n\r\n<p>SOAP is a W3C recommendation for communication between two applications.</p>\r\n\r\n<p>SOAP is XML based protocol. It is platform independent and language independent. By using SOAP, you will be able to interact with other programming language applications.</p>\r\n\r\n<hr />\r\n<h2>Advantages of Soap Web Services</h2>\r\n\r\n<p><strong>WS Security</strong>: SOAP defines its own security known as WS Security.</p>\r\n\r\n<p><strong>Language and Platform independent</strong>: SOAP web services can be written in any programming language and executed in any platform</p>\r\n\r\n<h2>Disadvantages of Soap Web Services</h2>\r\n\r\n<p><strong>Slow</strong>: SOAP uses XML format that must be parsed to be read. It defines many standards that must be followed while developing the SOAP applications. So it is slow and consumes more bandwidth and resource.</p>\r\n\r\n<p><strong>WSDL dependent</strong>: SOAP uses WSDL and doesn&#39;t have any other mechanism to discover the service.</p>\r\n',1493540414,1,'published',11,21),(42,'2a','RESTful Web Services','<p>REST stands for REpresentational State Transfer.</p>\r\n\r\n<p>REST is an architectural style not a protocol.</p>\r\n\r\n<hr />\r\n<h2>Advantages of RESTful Web Services</h2>\r\n\r\n<p><strong>Fast</strong>: RESTful Web Services are fast because there is no strict specification like SOAP. It consumes less bandwidth and resource.</p>\r\n\r\n<p><strong>Language and Platform independent</strong>: RESTful web services can be written in any programming language and executed in any platform.</p>\r\n\r\n<p><strong>Can use SOAP</strong>: RESTful web services can use SOAP web services as the implementation.</p>\r\n\r\n<p><strong>Permits different data format</strong>: RESTful web service permits different data format such as Plain Text, HTML, XML and JSON.</p>\r\n',1493540821,2,'published',11,21),(43,'2b','SOAP vs REST Web Services','<p>There are many differences between SOAP and REST web services. The important 10 differences between SOAP and REST are given below:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>No.</th>\r\n			<th>SOAP</th>\r\n			<th>REST</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1)</td>\r\n			<td>SOAP is a&nbsp;<strong>protocol</strong>.</td>\r\n			<td>REST is an&nbsp;<strong>architectural style</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2)</td>\r\n			<td>SOAP stands for&nbsp;<strong>Simple Object Access Protocol</strong>.</td>\r\n			<td>REST stands for&nbsp;<strong>REpresentational State Transfer</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3)</td>\r\n			<td>SOAP&nbsp;<strong>can&#39;t use REST</strong>&nbsp;because it is a protocol.</td>\r\n			<td>REST&nbsp;<strong>can use SOAP</strong>&nbsp;web services because it is a concept and can use any protocol like HTTP, SOAP.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4)</td>\r\n			<td>SOAP&nbsp;<strong>uses services interfaces to expose the business logic</strong>.</td>\r\n			<td>REST&nbsp;<strong>uses URI to expose business logic</strong>.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5)</td>\r\n			<td><strong>JAX-WS</strong>&nbsp;is the java API for SOAP web services.</td>\r\n			<td><strong>JAX-RS</strong>&nbsp;is the java API for RESTful web services.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6)</td>\r\n			<td>SOAP&nbsp;<strong>defines standards&nbsp;</strong>to be strictly followed.</td>\r\n			<td>REST does not define too much standards like SOAP.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7)</td>\r\n			<td>SOAP&nbsp;<strong>requires more bandwidth</strong>&nbsp;and resource than REST.</td>\r\n			<td>REST&nbsp;<strong>requires less bandwidth</strong>&nbsp;and resource than SOAP.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>8)</td>\r\n			<td>SOAP&nbsp;<strong>defines its own security</strong>.</td>\r\n			<td>RESTful web services&nbsp;<strong>inherits security measures</strong>&nbsp;from the underlying transport.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>9)</td>\r\n			<td>SOAP&nbsp;<strong>permits XML</strong>&nbsp;data format only.</td>\r\n			<td>REST&nbsp;<strong>permits different</strong>&nbsp;data format such as Plain text, HTML, XML, JSON etc.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>10)</td>\r\n			<td>SOAP is&nbsp;<strong>less preferred</strong>&nbsp;than REST.</td>\r\n			<td>REST&nbsp;<strong>more preferred</strong>&nbsp;than SOAP.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n',1493540948,1,'published',11,21),(44,'2c','JAX-WS Tutorial','<p><strong>JAX-WS tutorial</strong>&nbsp;is provides concepts and examples of JAX-WS API. This JAX-WS tutorial is designed for beginners and professionals.</p>\r\n\r\n<p>There are two ways to develop JAX-WS example.</p>\r\n\r\n<ol>\r\n	<li>RPC style</li>\r\n	<li>Document style</li>\r\n</ol>\r\n\r\n<p><img alt=\"JAX-WS tutorial\" src=\"https://www.javatpoint.com/webservicepages/images/jax-ws-tutorial.png\" /><br />\r\n&nbsp;</p>\r\n\r\n<h2>Difference between RPC vs Document style web services</h2>\r\n\r\n<p><a href=\"https://www.javatpoint.com/difference-between-rpc-and-document\">Click me to see difference between RPC and Document</a></p>\r\n\r\n<hr />\r\n<h2>JAX-WS Example RPC Style</h2>\r\n\r\n<p><a href=\"https://www.javatpoint.com/jax-ws-example-rpc-style\">Click me for JAX-WS Example RPC Style</a></p>\r\n\r\n<hr />\r\n<h2>JAX-WS Example Document Style</h2>\r\n',1493541060,1,'published',11,21),(45,'2d','JAX-RS Tutorial','<p><strong>JAX-RS tutorial</strong>&nbsp;is provides concepts and examples of JAX-RS API. This JAX-RS tutorial is designed for beginners and professionals.</p>\r\n\r\n<p>There are two main implementation of JAX-RS API.</p>\r\n\r\n<ol>\r\n	<li>Jersey</li>\r\n	<li>RESTEasy</li>\r\n</ol>\r\n\r\n<p><img alt=\"JAX-RS tutorial\" src=\"https://www.javatpoint.com/webservicepages/images/jax-rs-tutorial.png\" /></p>\r\n\r\n<hr />\r\n<h2>RESTful JAX-RS Example Jersey</h2>\r\n\r\n<p><a href=\"https://www.javatpoint.com/jax-rs-example-jersey\">Click me to see JAX-RS example using Jersey implementation</a></p>\r\n\r\n<hr />\r\n<h2>JAX-WS Annotations Example</h2>\r\n\r\n<p><a href=\"https://www.javatpoint.com/jax-rs-annotations-example\">JAX-RS annotations : @Path, @PathParam, @FormParam, @Produces, @Get, @Post</a></p>\r\n\r\n<hr />\r\n<h2>JAX-RS File Download Example</h2>\r\n\r\n<p><a href=\"https://www.javatpoint.com/jax-rs-file-download-example\">JAX-RS Download Image File, Text File, PDF File, Excel File</a></p>\r\n',1493541177,3,'published',11,21);
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
INSERT INTO `post_tag` VALUES (30,5),(31,5),(39,5),(40,5),(41,5),(42,5),(43,5),(44,5),(45,5),(30,19),(31,20),(31,21),(39,21),(41,21),(42,21),(43,21),(44,21),(45,21),(32,22),(16,23),(36,24),(37,24),(38,24),(41,27),(43,27),(42,28),(43,28),(44,29),(45,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'David Jone','1990-04-04 00:00:00.000000','male','England',NULL,NULL,NULL,NULL,9),(2,'Andrea Collin','1990-04-04 00:00:00.000000','female','USA',NULL,NULL,NULL,NULL,10),(3,'tunghh',NULL,'male',NULL,NULL,NULL,NULL,NULL,11),(4,'luannt',NULL,'male',NULL,NULL,NULL,NULL,NULL,12),(5,'phuhnt',NULL,'male',NULL,NULL,NULL,NULL,NULL,13),(6,'tienlv',NULL,'male',NULL,NULL,NULL,NULL,NULL,14);
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
  `description` varchar(512) DEFAULT NULL,
  `date` double DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_subject_id_idx` (`user_id`),
  CONSTRAINT `user_subject_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (3,'1','Hướng dẫn viết Web Service bằng Spring MVC','Mvc tutorial',1492581335,0,9),(4,'2','Jquery - javascript dễ dàng hơn bao giờ hết','học jquery',1492581353,0,9),(6,'4','bemp bemp','Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',1492581384,0,10),(7,'5','booom booom','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1492581412,0,10),(8,'8','Series những thằng nguy hiểm nhất hành tinh','Những thằng mất dạy nhất hành tinh',1492608659,0,9),(9,'9','Bleach OST','Những bài hát hay nhất phim Bleach',1492930017,0,9),(12,'c','Some kind of music','Nhạc không lời hay',1492930626,0,9),(13,'d','jQuery tutorial','',1493055263,0,9),(20,'14','Javascript Tutorial','JavaScript is the programming language of HTML and the Web.JavaScript is easy to learn.This tutorial will teach you JavaScript from basic to advanced.',1493536308,0,11),(21,'15','Web Services Tutorial','',1493539277,0,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (2,'1','php'),(3,'2','seo'),(4,'3','python'),(5,'4','java'),(6,'5','angularjs'),(7,'6','magento'),(8,'7','ios'),(9,'8','lips'),(10,'9','c++'),(11,'a','c#'),(12,'b','mysql'),(13,'c','sql server'),(14,'d','j2ee'),(15,'e','scala'),(16,'f','android'),(17,'10','regex'),(19,'13','lyric'),(20,'14','spring'),(21,'15','web service'),(22,'16','jQuery'),(23,'17','test'),(24,'18','javascript'),(27,'1b','soap'),(28,'1c','RESTful'),(29,'1d','jax-ws'),(30,'1e','jax-rs');
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
  `last_login` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `user_role_role_id_fk_idx` (`user_role_id`),
  CONSTRAINT `user_role_role_id_fk` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'jobjob','101193d7181cc88340ae5b2b17bba8a1','job@job',1,1493570106),(10,'123','4297f44b13955235245b2497399d7a93','123@123',1,1493531428),(11,'tunghh','101193d7181cc88340ae5b2b17bba8a1','hohoangtung12a3@gmail.com',1,1493540337),(12,'luannt','101193d7181cc88340ae5b2b17bba8a1','abc@xyz',1,1493492737),(13,'phuhnt','101193d7181cc88340ae5b2b17bba8a1','phu@gmail.com',1,NULL),(14,'tienlv','101193d7181cc88340ae5b2b17bba8a1','tien@gmail.com',1,NULL);
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
  `note` varchar(1024) DEFAULT NULL,
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
INSERT INTO `user_post_bookmark` VALUES (9,30,'2017-04-30 22:20:56.591000',''),(10,32,'2017-04-26 00:56:11.925000','');
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
INSERT INTO `user_subject_bookmark` VALUES (10,3,'2017-04-26 00:56:11.925000'),(10,4,'2017-04-26 00:56:11.925000'),(9,6,'2017-04-28 19:18:23.138000'),(10,6,'2017-04-26 00:56:11.925000'),(10,7,'2017-04-26 00:56:11.925000'),(10,8,'2017-04-26 00:56:11.925000'),(10,9,'2017-04-26 00:56:11.925000'),(10,12,'2017-04-26 00:56:11.925000'),(10,13,'2017-04-26 00:56:11.925000');
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
INSERT INTO `user_tag_bookmark` VALUES (9,5,'2017-04-30 23:35:28.760000'),(9,7,NULL),(9,8,NULL),(9,12,NULL),(10,2,NULL),(10,5,NULL),(10,8,NULL),(10,10,NULL),(10,11,NULL);
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

-- Dump completed on 2017-05-01  0:11:09

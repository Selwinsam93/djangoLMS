-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: trainocatedb
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add profile',7,'add_profile'),(26,'Can change profile',7,'change_profile'),(27,'Can delete profile',7,'delete_profile'),(28,'Can view profile',7,'view_profile'),(29,'Can add enrollment',8,'add_enrollment'),(30,'Can change enrollment',8,'change_enrollment'),(31,'Can delete enrollment',8,'delete_enrollment'),(32,'Can view enrollment',8,'view_enrollment'),(33,'Can add trainer',9,'add_trainer'),(34,'Can change trainer',9,'change_trainer'),(35,'Can delete trainer',9,'delete_trainer'),(36,'Can view trainer',9,'view_trainer'),(37,'Can add Category',10,'add_category'),(38,'Can change Category',10,'change_category'),(39,'Can delete Category',10,'delete_category'),(40,'Can view Category',10,'view_category'),(41,'Can add CourseId',11,'add_courseid'),(42,'Can change CourseId',11,'change_courseid'),(43,'Can delete CourseId',11,'delete_courseid'),(44,'Can view CourseId',11,'view_courseid'),(45,'Can add scormcontent',12,'add_scormcontent'),(46,'Can change scormcontent',12,'change_scormcontent'),(47,'Can delete scormcontent',12,'delete_scormcontent'),(48,'Can view scormcontent',12,'view_scormcontent'),(49,'Can add CourseDetails',13,'add_coursedetails'),(50,'Can change CourseDetails',13,'change_coursedetails'),(51,'Can delete CourseDetails',13,'delete_coursedetails'),(52,'Can view CourseDetails',13,'view_coursedetails'),(53,'Can add contact',14,'add_contact'),(54,'Can change contact',14,'change_contact'),(55,'Can delete contact',14,'delete_contact'),(56,'Can view contact',14,'view_contact'),(57,'Can add discussion',15,'add_discussion'),(58,'Can change discussion',15,'change_discussion'),(59,'Can delete discussion',15,'delete_discussion'),(60,'Can view discussion',15,'view_discussion');
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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$FLb5dZzRAVgQ$mlFAS44QOFWippbY+Zq1yQgcYz/QPXBdKLmn61q0jjk=','2020-09-25 05:09:25.713269',1,'admin','','','suresh.s@trainocate.in',1,1,'2020-08-20 07:32:32.055109'),(2,'pbkdf2_sha256$216000$5bx0LNGGOugA$jiaP+k7IBr4slAglbl2FUPXIz0rz5ctwbKXyeKFzXLI=','2020-09-18 12:56:27.287118',0,'Fenila','Fenila','A','fenila.christlin@trainocate.com',0,1,'2020-08-20 09:16:04.814639'),(3,'pbkdf2_sha256$180000$3VmDFWLGfoEt$/chenQgwOfMQc47a4+wskZppvmvIR4XWSaAXo8TO3ZI=','2020-08-20 14:25:51.472624',0,'johnwalt','John','Walt','johnwalt@test.com',0,1,'2020-08-20 13:42:48.000000'),(8,'pbkdf2_sha256$216000$8X1rLtxrR864$Y03MTY5PimPpHf6U0n1Uwg8OEx8FEjKN2wAM1qcw7qY=','2020-09-18 08:44:05.436928',0,'Abraham','Abraham','Vimalkumar','student1trn@gmail.com',0,1,'2020-08-20 14:42:43.648717');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (3,'Cisco'),(4,'Microsoft'),(2,'Trainocate');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_coursedetails`
--

DROP TABLE IF EXISTS `course_coursedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_coursedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `image` varchar(100) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `description` longtext NOT NULL,
  `course_requirements` longtext NOT NULL,
  `target_audience` longtext NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `courseid_id` int(11) DEFAULT NULL,
  `duplicate_price` int(11) DEFAULT NULL,
  `original_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_coursedetails_category_id_e560f981_fk_course_category_id` (`category_id`),
  KEY `course_coursedetails_courseid_id_16a11fae_fk_course_courseid_id` (`courseid_id`),
  CONSTRAINT `course_coursedetails_category_id_e560f981_fk_course_category_id` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`),
  CONSTRAINT `course_coursedetails_courseid_id_16a11fae_fk_course_courseid_id` FOREIGN KEY (`courseid_id`) REFERENCES `course_courseid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_coursedetails`
--

LOCK TABLES `course_coursedetails` WRITE;
/*!40000 ALTER TABLE `course_coursedetails` DISABLE KEYS */;
INSERT INTO `course_coursedetails` VALUES (1,'Python Fundamentals','course_image/0b659905-28ba-4933-8667-8a6aee68df45.jpg','2020-08-20 08:09:10.000000',NULL,'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python\'s design philosophy emphasizes code readability with its notable use of significant white space.','Basic programming knowledge','Interested students',2,1,12000,10000),(2,'Python Core and Advanced','course_image/cb9f537e-4c0d-4f63-95ba-df29e9d63615.jpg','2020-08-20 08:20:33.000000',NULL,'Python is a high-level programming language designed to be easy to read and simple to implement. It is open source, which means it is free to use, even for commercial applications. Python can run on Mac, Windows, and Unix systems and has also been ported to Java and .NET virtual machines.\r\n\r\nPython is considered a scripting language, like Ruby or Perl and is often used for creating Web applications and dynamic Web content. It is also supported by a number of 2D and 3D imaging programs, enabling users to create custom plug-ins and extensions with Python. Examples of applications that support a Python API include GIMP, Inkscape, Blender, and Autodesk Maya.\r\n\r\nScripts written in Python (.PY files) can be parsed and run immediately. They can also be saved as a compiled programs (.PYC files), which are often used as programming modules that can be referenced by other Python programs.','Basic programming knowledge','Interested Students',2,2,12000,10000),(3,'Cisco DNA center Programmability','course_image/fb82c24f-4ee8-4850-8941-3249110b0eb8.png','2020-08-20 08:29:49.000000',NULL,'Cisco IT operates a large, global enterprise network, which means we are always looking for ways to simplify and streamline our operational tasks. Until now, we have used a variety of Cisco solutions for network management, some with a broad scope and others focused on particular types of network elements or services.\r\n\r\nAs we transition the Cisco network to Cisco Digital Network Architecture (DNA), we are making a parallel transition to Cisco DNA Center for all network management activity. Cisco DNA changes the perspective for network management because it moves away from standalone network products to elements that are tightly coupled with automation controllers and assurance engines. This change is reflected in Cisco DNA Center, which integrates the network with IT processes, allowing us to automate workflows across disparate systems and streamline operations across Cisco domains.\r\n\r\nBy adopting Cisco DNA Center we are improving our network management capabilities now and starting the evolution to a future where the network operates as an intent-based platform for IT and business applications. You will see us get even more aggressive with how we deploy new technology in this space and Cisco DNA Center has been an exciting opportunity for Cisco IT to co-develop with engineering. Ultimately, our goal is to be Cisco’s “Customer Zero” – where Cisco IT help validate deployment design, develop operational best practices, and establish use cases that others can learn from.','python program knowledge','Interested students',3,3,12000,10000),(4,'Windows Essentials','course_image/f9477724-d91d-43ea-9f84-9b1913943478.jpg','2020-08-20 08:46:28.000000',NULL,'Windows Essentials (formerly Windows Live Essentials and Windows Live Installer) is a discontinued suite of Microsoft freeware applications that includes email, instant messaging, photo sharing, blogging, and parental control software. Essentials programs are designed to integrate well with each other, with Microsoft Windows, and other Microsoft web-based services such as OneDrive and Outlook.com','No requirements','Interested students',4,4,14000,11000);
/*!40000 ALTER TABLE `course_coursedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_courseid`
--

DROP TABLE IF EXISTS `course_courseid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_courseid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseid` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_courseid`
--

LOCK TABLES `course_courseid` WRITE;
/*!40000 ALTER TABLE `course_courseid` DISABLE KEYS */;
INSERT INTO `course_courseid` VALUES (3,'DN001'),(1,'PY001'),(2,'PY002'),(4,'WI001');
/*!40000 ALTER TABLE `course_courseid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_scormcontent`
--

DROP TABLE IF EXISTS `course_scormcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_scormcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `scorm_type` varchar(40) DEFAULT NULL,
  `package` varchar(100) NOT NULL,
  `courseid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_scormcontent_courseid_id_abd80235_fk_course_courseid_id` (`courseid_id`),
  KEY `course_scormcontent_slug_985d7d4b` (`slug`),
  CONSTRAINT `course_scormcontent_courseid_id_abd80235_fk_course_courseid_id` FOREIGN KEY (`courseid_id`) REFERENCES `course_courseid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_scormcontent`
--

LOCK TABLES `course_scormcontent` WRITE;
/*!40000 ALTER TABLE `course_scormcontent` DISABLE KEYS */;
INSERT INTO `course_scormcontent` VALUES (1,'python 2004 2nd edition','python-2004-2nd-edition','SCORM 2004','course/910d5c59-ca11-43be-b778-6a1f34bbda56.zip',1),(2,'Python 2004 2nd edition','python-2004-2nd-edition-50tq','SCORM 2004','course/731ac08a-cfe6-45fc-a095-125fb6beb6e4.zip',2),(3,'DNAC scorm12','dnac-scorm12','SCORM 1.2','course/98d0e40c-e4b3-4b1e-9080-84f482208412.zip',3),(4,'Windows essentials','windows-essentials','SCORM 1.2','course/36e77cb4-0290-4dd9-8031-77f61bd9f07a.zip',4);
/*!40000 ALTER TABLE `course_scormcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss_discussion`
--

DROP TABLE IF EXISTS `discuss_discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discuss_discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent_date` datetime(6) DEFAULT NULL,
  `student_name` varchar(60) NOT NULL,
  `student_id` varchar(60) NOT NULL,
  `message` longtext NOT NULL,
  `courseid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_discussion_courseid_id_26d0e7e0` (`courseid_id`),
  CONSTRAINT `discuss_discussion_courseid_id_26d0e7e0_fk_course_courseid_id` FOREIGN KEY (`courseid_id`) REFERENCES `course_courseid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss_discussion`
--

LOCK TABLES `discuss_discussion` WRITE;
/*!40000 ALTER TABLE `discuss_discussion` DISABLE KEYS */;
INSERT INTO `discuss_discussion` VALUES (18,'2020-08-20 14:47:20.157812','Fenila','2','test',3),(19,'2020-08-20 14:47:25.193644','admin','1','hi',1),(20,'2020-08-20 14:47:32.564917','admin','1','fr',1),(21,'2020-08-20 14:51:41.056789','Fenila','2','test1',3),(22,'2020-08-20 14:52:55.883651','Fenila','2','test1',3),(23,'2020-09-01 05:09:11.284636','admin','1','hello',1),(24,'2020-09-03 04:04:38.566983','Fenila','2','Hi',3),(25,'2020-09-18 06:30:10.619593','Fenila','2','Hi',1),(26,'2020-09-23 04:22:08.262371','admin','1','Hi',1);
/*!40000 ALTER TABLE `discuss_discussion` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-08-20 08:07:49.886796','1','PY001',1,'[{\"added\": {}}]',10,1),(2,'2020-08-20 08:08:52.577119','1','PY001',3,'',10,1),(3,'2020-08-20 08:09:24.346726','2','Trainocate',1,'[{\"added\": {}}]',10,1),(4,'2020-08-20 08:09:49.671690','1','PY001',1,'[{\"added\": {}}]',11,1),(5,'2020-08-20 08:14:31.528592','1','Python Fundamentals',1,'[{\"added\": {}}]',13,1),(6,'2020-08-20 08:15:31.892493','1','python 2004 2nd edition',1,'[{\"added\": {}}]',12,1),(7,'2020-08-20 08:21:49.343248','2','PY002',1,'[{\"added\": {}}]',11,1),(8,'2020-08-20 08:25:45.546281','2','Python Core and Advanced',1,'[{\"added\": {}}]',13,1),(9,'2020-08-20 08:26:11.385646','1','Python Fundamentals',2,'[{\"changed\": {\"fields\": [\"Course requirements\"]}}]',13,1),(10,'2020-08-20 08:27:27.045242','2','Python 2004 2nd edition',1,'[{\"added\": {}}]',12,1),(11,'2020-08-20 08:30:01.804998','3','Cisco',1,'[{\"added\": {}}]',10,1),(12,'2020-08-20 08:33:03.877063','3','DN001',1,'[{\"added\": {}}]',11,1),(13,'2020-08-20 08:37:43.780423','3','Cisco DNA center Programmability',1,'[{\"added\": {}}]',13,1),(14,'2020-08-20 08:40:24.603999','3','DNAC scorm12',1,'[{\"added\": {}}]',12,1),(15,'2020-08-20 08:46:42.214547','4','Microsoft',1,'[{\"added\": {}}]',10,1),(16,'2020-08-20 08:47:53.678909','4','WI001',1,'[{\"added\": {}}]',11,1),(17,'2020-08-20 08:50:11.581878','4','Windows Essentials',1,'[{\"added\": {}}]',13,1),(18,'2020-08-20 08:51:04.173383','4','Windows essentials',1,'[{\"added\": {}}]',12,1),(19,'2020-08-20 13:57:11.163344','4','johnwalt1',3,'',4,1),(20,'2020-08-20 13:58:16.374197','5','johnwalt1',3,'',4,1),(21,'2020-08-20 13:59:51.062669','6','johnwalt1',3,'',4,1),(22,'2020-08-20 14:10:18.386245','7','johnwalt1',3,'',4,1),(23,'2020-08-20 14:10:53.029884','3','johnwalt',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(24,'2020-08-20 14:11:20.005461','1','Trainer object (1)',1,'[{\"added\": {}}]',9,1),(25,'2020-08-20 14:11:34.589617','2','Trainer object (2)',1,'[{\"added\": {}}]',9,1),(26,'2020-08-20 14:11:46.259467','3','Trainer object (3)',1,'[{\"added\": {}}]',9,1),(27,'2020-08-20 14:12:04.911980','4','Trainer object (4)',1,'[{\"added\": {}}]',9,1),(28,'2020-08-20 14:25:33.465224','3','johnwalt',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(29,'2020-08-20 14:42:09.099855','17','Discussion object (17)',3,'',15,1),(30,'2020-08-20 14:42:09.120001','16','Discussion object (16)',3,'',15,1),(31,'2020-08-20 14:42:09.366814','15','Discussion object (15)',3,'',15,1),(32,'2020-08-20 14:42:09.383729','14','Discussion object (14)',3,'',15,1),(33,'2020-08-20 14:42:09.400921','13','Discussion object (13)',3,'',15,1),(34,'2020-08-20 14:42:09.418136','12','Discussion object (12)',3,'',15,1),(35,'2020-08-20 14:42:09.435497','11','Discussion object (11)',3,'',15,1),(36,'2020-08-20 14:42:09.452540','10','Discussion object (10)',3,'',15,1),(37,'2020-08-20 14:42:09.469752','9','Discussion object (9)',3,'',15,1),(38,'2020-08-20 14:42:09.486979','8','Discussion object (8)',3,'',15,1),(39,'2020-08-20 14:42:09.504178','7','Discussion object (7)',3,'',15,1),(40,'2020-08-20 14:42:09.521579','6','Discussion object (6)',3,'',15,1),(41,'2020-08-20 14:42:09.538779','5','Discussion object (5)',3,'',15,1),(42,'2020-08-20 14:42:09.584724','4','Discussion object (4)',3,'',15,1),(43,'2020-08-20 14:42:09.601901','3','Discussion object (3)',3,'',15,1),(44,'2020-08-20 14:42:09.619145','2','Discussion object (2)',3,'',15,1),(45,'2020-08-20 14:42:09.636326','1','Discussion object (1)',3,'',15,1),(46,'2020-08-25 05:22:14.130790','2','admin',2,'[{\"changed\": {\"fields\": [\"Progress Measure\"]}}]',8,1),(47,'2020-08-25 05:28:38.369327','2','admin',3,'',8,1),(48,'2020-09-03 11:38:43.408524','12','admin',3,'',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'course','category'),(13,'course','coursedetails'),(11,'course','courseid'),(12,'course','scormcontent'),(15,'discuss','discussion'),(14,'messenger','contact'),(6,'sessions','session'),(8,'user','enrollment'),(7,'user','profile'),(9,'user','trainer');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-08-20 07:30:20.887061'),(2,'auth','0001_initial','2020-08-20 07:30:22.142612'),(3,'admin','0001_initial','2020-08-20 07:30:26.729111'),(4,'admin','0002_logentry_remove_auto_add','2020-08-20 07:30:27.675708'),(5,'admin','0003_logentry_add_action_flag_choices','2020-08-20 07:30:27.715368'),(6,'contenttypes','0002_remove_content_type_name','2020-08-20 07:30:28.568968'),(7,'auth','0002_alter_permission_name_max_length','2020-08-20 07:30:29.037735'),(8,'auth','0003_alter_user_email_max_length','2020-08-20 07:30:29.476388'),(9,'auth','0004_alter_user_username_opts','2020-08-20 07:30:29.503203'),(10,'auth','0005_alter_user_last_login_null','2020-08-20 07:30:29.890982'),(11,'auth','0006_require_contenttypes_0002','2020-08-20 07:30:29.913466'),(12,'auth','0007_alter_validators_add_error_messages','2020-08-20 07:30:29.950623'),(13,'auth','0008_alter_user_username_max_length','2020-08-20 07:30:30.367903'),(14,'auth','0009_alter_user_last_name_max_length','2020-08-20 07:30:30.829757'),(15,'auth','0010_alter_group_name_max_length','2020-08-20 07:30:31.298293'),(16,'auth','0011_update_proxy_permissions','2020-08-20 07:30:31.330809'),(17,'course','0001_initial','2020-08-20 07:30:32.199433'),(18,'course','0002_auto_20200228_1512','2020-08-20 07:30:34.984747'),(19,'course','0003_auto_20200817_1513','2020-08-20 07:30:35.558688'),(20,'discuss','0001_initial','2020-08-20 07:30:35.776365'),(21,'messenger','0001_initial','2020-08-20 07:30:36.469475'),(22,'messenger','0002_auto_20200220_1249','2020-08-20 07:30:36.498475'),(23,'messenger','0003_auto_20200228_1250','2020-08-20 07:30:36.525944'),(24,'sessions','0001_initial','2020-08-20 07:30:36.738181'),(25,'user','0001_initial','2020-08-20 07:30:37.447145'),(26,'user','0002_enrollment_enrolled_date','2020-08-20 07:30:38.890661'),(27,'user','0003_auto_20200228_1254','2020-08-20 07:30:38.948303'),(28,'user','0004_auto_20200402_1648','2020-08-20 07:30:38.980034'),(29,'user','0005_auto_20200817_1513','2020-08-20 07:30:40.739064'),(30,'user','0006_auto_20200818_1636','2020-08-20 07:30:42.148835'),(31,'user','0007_auto_20200819_1134','2020-08-20 07:30:44.388813'),(32,'discuss','0002_auto_20200828_1845','2020-08-31 13:35:33.822147'),(33,'discuss','0003_auto_20200831_1830','2020-08-31 13:35:35.454962'),(34,'auth','0012_alter_user_first_name_max_length','2020-09-01 05:05:08.051584');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0h7rvqg5lx25vzowi7e8r1xrw1fs27z3','OTU5MTA1NjJmZmExNGE3ZGZlYjNlMDJkMzllYTAzYzkyNjY0OWY2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDE1ODNhZjA5MmY2ZTVhOTQ2MDY1NmQ3MWE3NTdhOTM0NWEyNDJhIn0=','2020-09-28 12:44:41.527807'),('18zrzhs5yop501d3wop6z48kr3c6ely5','.eJxVjMsOwiAQRf-FtSHDG1y69xsIw1CpGkhKuzL-uzbpQrf3nHNfLKZtrXEbZYkzsTMT7PS7YcqP0nZA99Runefe1mVGviv8oINfO5Xn5XD_Dmoa9VsroyFgMFA8iSK880Bgs7DeO8DJmcmpIFGTzpKCA6usQEMJQtHSkmTvD7PyNr4:1kJp0g:dFRmGq6z1PiTSpD0YUvm-Y4qDIvNzc7mLFAf226a2WQ','2020-10-04 02:23:26.949016'),('23eezlhxyh52zrl30hr3eqpcvwgrshoo','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:16.171516'),('3zc4dyrgt874cfqmbma7uvds9ysqs6q2','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 08:07:27.687494'),('45gw087tm9y7zxzc7o11pzln0pblz9eh','.eJxVjDsOwjAQBe_iGllZ_0NJzxms9XpNAsiW4qRC3B0ipYD2zcx7iYjbOsWt8xLnLM4CxOl3S0gPrjvId6y3JqnVdZmT3BV50C6vLfPzcrh_BxP26VsbRQ406IAAHDyPKhdjB8M8FsRRg9PZeFBYgNKgjLFeWe2IrA_kXBLvD8MBNws:1kDkyw:4BJ4aMH6ClQ8T4xP76eVhQUwDhvAtmATeXVuuk06LTw','2020-09-17 08:52:34.710573'),('4cedd9h9ayrdpsht712i6ajux91ohuxm','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.572140'),('6jn7ao6undp4o7lgew0r60bcwnl137dh','NDFmNTYzNGVmYjQyOThjMDkyMGJkNzg1NmU3YTI4NTBhZTc0ZmJiNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmODVlZjRlNjZiY2EyMDdmOTc3NzFkNGVjZmNjMDUwYjc0NjQxNzI3In0=','2020-10-09 05:09:25.747874'),('6ygbqzpe2khefb54kaxmjcewzm8k3w5a','OTU5MTA1NjJmZmExNGE3ZGZlYjNlMDJkMzllYTAzYzkyNjY0OWY2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNDE1ODNhZjA5MmY2ZTVhOTQ2MDY1NmQ3MWE3NTdhOTM0NWEyNDJhIn0=','2020-09-17 11:37:42.638624'),('6zjd1uin6zioq8g8dlz7u8daitmjkxdp','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:18.643328'),('89oe5toqfj6drqnyvdu5sqwc1j3a06vr','.eJxVjMsOwiAQRf-FtSHDG1y69xsIw1CpGkhKuzL-uzbpQrf3nHNfLKZtrXEbZYkzsTMT7PS7YcqP0nZA99Runefe1mVGviv8oINfO5Xn5XD_Dmoa9VsroyFgMFA8iSK880Bgs7DeO8DJmcmpIFGTzpKCA6usQEMJQtHSkmTvD7PyNr4:1kKwGq:awZhpBMG72uNlEtqImojEiTbPfb2szVOPmmygHH2UxI','2020-10-07 04:20:44.352467'),('8k0kpv2ybnnx5bis9kjelyztjudya8zu','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.511257'),('a9bse29xo1nillzxwdpp1l4sif5v8dxp','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.040099'),('albmp96k9c1r22e8hvefsj41zsjzxlzp','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.099150'),('bdseqn90s7njq7etp5ahqhb0kpb39dm5','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.335659'),('cnbtiu4scsyx0l55ziqmr9z570rf8xap','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.514073'),('e4ics21xx49uw50shmr51nqruok24thd','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:18.084557'),('ej1fzpnhy5fpsim95oz3bbapnynw87vn','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.524642'),('fsvckfuy3lo98p4nxezesirb4emjr3sd','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.557403'),('g8c8k2405aexkgpsn2kkjssmh7eq89sp','.eJxVjDsOwjAQBe_iGllZ_0NJzxms9XpNAsiW4qRC3B0ipYD2zcx7iYjbOsWt8xLnLM4CxOl3S0gPrjvId6y3JqnVdZmT3BV50C6vLfPzcrh_BxP26VsbRQ406IAAHDyPKhdjB8M8FsRRg9PZeFBYgNKgjLFeWe2IrA_kXBLvD8MBNws:1kDl35:RRWotmausBzJ9PanB2eLz9-qBMQnnNalCTtp4tBkTU4','2020-09-17 08:56:51.980977'),('grcel22eezcybqzq4wlr7qycka2s25xq','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.553868'),('hgz875bqovrvixr5hyfn5a74fwlbiie1','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.137669'),('hkemorfsi9zmrdzwo09cvryhs1jjalk4','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.450977'),('kg3zghj0g21fd19ckgg0qmcvjfsnm8bj','NDU4ZGJiMDIwZTgyMGQxMDVkMTQ0MmQ4ZTZiNjk3NGZhMWRiYzMxYTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMzJkZDFkMDdiNWNmZmNmYWIwMmY3ZjIzODg3ZmYyOGEwZmFlYmIwIn0=','2020-09-03 14:25:51.507277'),('la6figrsmjaueulq5yrmmgfrn1b09mao','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.508465'),('m3h5ivew97mj6i0vukl2bdbmmg175ylu','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.363953'),('nrgzj7oj9nfeln2a7kdi6qx9xaxrg1rt','ZTFiZjgxNGFhMDg1NmNhMzQ5Mzk1ZjcxM2M0MTVjNWVjYmZhMTJkZTp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNmQzMmQ1ZDAyZDQ0ODM3NmQ2NjZlZmJhNzRmMjg5Yzg5ZGI0MDU4In0=','2020-09-03 16:08:46.961179'),('oxbsmggjwgr9r6vl5yh1vu3ph2rj1ee1','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:18.842335'),('q1a2mhbficsqo5tityaj6urd7wmogly6','.eJxVjDsOwjAQBe_iGlns4i8lPWew7N0NDiBHipMKcXeIlALaNzPvpVJel5rWLnMaWZ0VqsPvVjI9pG2A77ndJk1TW-ax6E3RO-36OrE8L7v7d1Bzr98aYswnsmDZFgQjxIAGB-NYUBgFg8UAhN7nIxXn0ZuA1kewYXBUvHp_AM5ZNxc:1kJFwB:zs-W-FgFI2HEgf4GnIduycZAGHrfV8aY6HuGCOzxdmg','2020-10-02 12:56:27.327563'),('qh7vt97wcqxf9aqybt57sxzfaanxq50e','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.561843'),('r6e19d5iyq0upcwwssxt4mfi6qt43481','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.576072'),('s9qgy7il98nb1m6xzna12qbd9stywj36','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 08:20:22.482148'),('tuws5ud6z2s6i6lr5nqw192lnsk7o3q8','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.238171'),('uqlngz7apf4wp82m498dn5wo3knug0wc','.eJxVjMsOwiAQRf-FtSHDG1y69xsIw1CpGkhKuzL-uzbpQrf3nHNfLKZtrXEbZYkzsTMT7PS7YcqP0nZA99Runefe1mVGviv8oINfO5Xn5XD_Dmoa9VsroyFgMFA8iSK880Bgs7DeO8DJmcmpIFGTzpKCA6usQEMJQtHSkmTvD7PyNr4:1kJE2u:szkOkvRm7-v0ErbmBbFmKc0R6KYxdI4Ooz_QdT6hjWA','2020-10-02 10:55:16.215068'),('vj93vfwfcssg35hfxzuart4h7de9fv0x','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-06 18:24:37.883345'),('wopm0ntdkz6kgy64owhwm492qxvdoyjm','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:18.825200'),('y73txmv3f7x571ojafx4222zb25f3snx','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 14:25:33.528354'),('yfqqza67jhtdq0vpuono5xbdli9lukor','NThmZThmOGM1MTI2NjY0MTdlOWEzOTI3ZDJkYmVjNDE5MWQ4NTljNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTk2NTQ3N2Q3MjY3YzJiOTYzZmFkMjE2ODc0ZTUyNDk3ZjY3MmU1In0=','2020-09-03 12:58:19.400965'),('ys092bdwwunnfm7qxcn5nnvn0focal18','.eJxVjDsOwjAQBe_iGlns4i8lPWew7N0NDiBHipMKcXeIlALaNzPvpVJel5rWLnMaWZ0VqsPvVjI9pG2A77ndJk1TW-ax6E3RO-36OrE8L7v7d1Bzr98aYswnsmDZFgQjxIAGB-NYUBgFg8UAhN7nIxXn0ZuA1kewYXBUvHp_AM5ZNxc:1kDgTi:4zVsQeZacxBaPCNOK5kSD7QtPBNPMU8Y-Ha3xa-WgUc','2020-09-17 04:04:02.529683');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_contact`
--

DROP TABLE IF EXISTS `messenger_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messenger_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `messages` longtext NOT NULL,
  `sent_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_contact`
--

LOCK TABLES `messenger_contact` WRITE;
/*!40000 ALTER TABLE `messenger_contact` DISABLE KEYS */;
INSERT INTO `messenger_contact` VALUES (1,'Fenila','fenila.christlin@trainocate.com','Test','Test','2020-08-20 13:33:10.719808'),(2,'Fenila','fenila.christlin@trainocate.com','Test','Test','2020-08-20 13:34:04.860417'),(3,'admin','suresh.s@trainocate.in','Test','final test','2020-09-08 13:36:46.402670');
/*!40000 ALTER TABLE `messenger_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_enrollment`
--

DROP TABLE IF EXISTS `user_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorm_type` varchar(60) DEFAULT NULL,
  `student_id` varchar(60) NOT NULL,
  `student_name` varchar(60) NOT NULL,
  `lesson_location` varchar(60) DEFAULT NULL,
  `max_score` varchar(60) DEFAULT NULL,
  `raw_score` varchar(60) DEFAULT NULL,
  `min_score` varchar(60) DEFAULT NULL,
  `lesson_mode` varchar(60) DEFAULT NULL,
  `lesson_status` varchar(60) DEFAULT NULL,
  `entry` varchar(60) DEFAULT NULL,
  `credit` varchar(60) DEFAULT NULL,
  `session_time` varchar(60) DEFAULT NULL,
  `total_time` varchar(60) DEFAULT NULL,
  `exit` varchar(60) DEFAULT NULL,
  `suspend_data` varchar(10000) DEFAULT NULL,
  `scaled_passing_score` varchar(60) DEFAULT NULL,
  `success_status` varchar(60) DEFAULT NULL,
  `progress_measure` varchar(60) DEFAULT NULL,
  `courseid_id` int(11) DEFAULT NULL,
  `enrolled_date` datetime(6) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `course_name` varchar(250) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_enrollment_courseid_id_66b7fe56_fk_course_courseid_id` (`courseid_id`),
  KEY `user_enrollment_category_id_9c213a74_fk_course_category_id` (`category_id`),
  CONSTRAINT `user_enrollment_category_id_9c213a74_fk_course_category_id` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`),
  CONSTRAINT `user_enrollment_courseid_id_66b7fe56_fk_course_courseid_id` FOREIGN KEY (`courseid_id`) REFERENCES `course_courseid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_enrollment`
--

LOCK TABLES `user_enrollment` WRITE;
/*!40000 ALTER TABLE `user_enrollment` DISABLE KEYS */;
INSERT INTO `user_enrollment` VALUES (1,'SCORM 2004','2','Fenila','','100','6.6',NULL,'normal','incomplete','','credit','PT0H11M18S','0','suspend','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','','failed','0.3676471',2,'2020-08-20 09:55:52.183972',2,'Python Core and Advanced','course_image/cb9f537e-4c0d-4f63-95ba-df29e9d63615.jpg'),(3,'SCORM 2004','1','admin','','100','10',NULL,'normal','incomplete','','credit','PT0H1M8S','0','suspend','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','','failed','0.3529412',2,'2020-08-20 10:57:07.251589',2,'Python Core and Advanced','course_image/cb9f537e-4c0d-4f63-95ba-df29e9d63615.jpg'),(4,'SCORM 2004','2','Fenila','','','',NULL,'normal','completed','','credit','PT0H0M37S','0','suspend','N4IgJiBcCMDMAMA2RB2ANCANla8MDcoBtPaNAJjVjQBY0BWNRNdADjQE41cBdAgC2J8QANWKkKVWgyYs07LrwwAHKKEwBDAM4AXEQEsApgHdDYAMqZ9YQzjwh8R4wBEArgCcNO/QHsAdlCw1CBaVjbmOl6GWmog8LEAxj4AtsqYhjpmUDruroYE+lr6mRCQOXkFRSUAEgCeyobuVn4A1jGQRDwAvhjQiSlpGVllufkOhcXD5WOOVWZ1DU36re2dPSDk/anpJdmjlZOl0wc19Y3NbULrsFuDuyMV43NH+0+HC+fLlx3dGDS3Oymr1mhz2jxBp0WF1WvxA9ABQxe4Im92Ob0hnxWVwwiARqOBKKByOeHyWWJ+6xQeKJM0JSNpJLOZO+awwrGp9JONK5YFJ0OxIA4HLBDNBD1FGOZMPWuGF4p5Ip5fK+0vWAC8fCkIlFYssbAAPaLibiSah0RjMNicYQarWRTKrPyuTCYNBOl1u52u93er2ej0+/2+gNe2GhayGAAq+mShmahm1Dti8UgoHa9h0UHgADp4PBcHnC/AaCgaBxS/Q4BhzLFkrF2iAkttESAMJmYLmi3mS2WK1WQJHYu2SNxhF5iKB2/ZVB1JzHbJB7AASAByOHo5Y45Ho5FQ8F3GAAZu5DIY1QvDxpMFpDF1fpOsyoJyBvLHHyBV+vN9vdygkHQQGPU9zygS9r1vNA5zfDsu27UtyxoStgk/GANxQLd6BLehEFgShAJPM8LyvG871I9Z9CuGV63fKdOwLLsewQpDq1rajIEbAZAQgNscE7Bj4L7YJB1TF9jWgMdhwfRcn1nF953fFDoDQjCaFYaBEHoRh8OAojwNIyDROkkAZyIKCF2XNdUO/TC1OQdhtMI0DiNvbpunIyiME2ET0x4xc6Ng4sBMQ/saxEutvKgDjm12XzoD4otGMEjBhKkkdxIwcdZKnGTTLk6CLK/dDt1UoIyyPAiQMgMCSPvQzp2fV9zIwRTlOK1ggkQLgHMq6qXLIjAKIpa42IzLN/NgxLguCULQHCtNIqbO4sli+LC0m5iByHMSJIa98TLMhTLKU6zVJoDSAKAxyquc/SpPqrL5KMlqTtYM6UDIbrdJq/qQEGtZ1n+CKjNovN6ISoKNpmkA5pCBbOJbFaAvW/sUsMtKdqyvaGsegqrKKmzEBoWALoqr6+oM7LjOx/LmqO1qCcQ+xLp6m6KceuKkYh/tnvQ0r3vUj7mbJ0i3IGjy4RG3yc1BzneymliwrYqKlu4wyOYmrmhK2jpSAx3LKf2vKmo/OnN1K1gOEJrShacvTaoN6njZ5jhzct1hrdJ23vtF37xdxIHRr8mWNblyHWKB5WuNbNXVrg0OUe19GMskuqcoOp7Td54mMOQcqdK98m7rTo3DsKl3s+3Vh7Jt667Z+v6fapAOpfG/j4+m8P5vYxao8RkOmITkTh115PdqMw3GtLvHy7LGhyHUvOrt627U6ph6aZNsvSo4OeaBJ/Pa+9rp3KGtlJbq1vwfbhXZqVnuEZj2WB61ofttHzHx8dqfjqzstsLOxeLM64UyxuvJ2mcZ4cGwoTQBwtXLHzFqfQU58Qb5ifklEAUMYYNnvjFR+/cMGo2HqOd++tQH6xxrTLe2cUA7kFp7Q+hdV4T0oZvae29aF71gQXEWCDfZINlM3C+wc27PxvtDO+8M8HtnVqIwhicR4gEymQz+YDv7KSCPQfceZgg12Xvbch6dcY/3Llo8gxYmYMP0fXSifCACOahj5AAAA','','unknown','',1,'2020-08-20 12:06:16.674111',2,'Python Fundamentals','course_image/0b659905-28ba-4933-8667-8a6aee68df45.jpg'),(5,'SCORM 1.2','2','Fenila','','100','',NULL,'normal','incomplete','','','00:17:58','','suspend','N4IgJiBcCMAMDsAOAzANmgGhAGyrLAblANqwC6hAFiRSAGon6YBMGyGALBgKwaobwMiDAE4MccZmito7aF2i9o/aIOjDoY5vmYtWzdsy7Nezfs0HNhzMcnzJMyVsnbIuyXmjaDkw5GI58DkwOVg52Di4OXg5+DkEOYQ4xbnxuTG5WbnZuLm5ebn5uQW5hbjFUfHQ+VlR2VC5UXlR+VEFUYVQxeHx4THhWeHZ4LnheeH54QSQBMUR8RExEVhQhLkReRH5EQURhRDERfBFMEVYRdhEuEV4RfhFBEWERMTgmWClYGVg5WAVYJSwFQIcSwDSwV4SaDQyQyWSSBSKSQqVSSDSacTaTFSAyYhRmTFqKyY152cQOckyFzkhQeckqZBqXzk16BcTBdkycLshTRdkqeLsjTJcSpUVSTKiuS5UVKQqitSlUWvSriarKGR1NUKJpqlRtNUaLriAYmuQjE1KCYmtQzVSvebiRZOmSrdQKDZOlQ7J0aA7iI4BqRnANyK4BlQPAMaF4YbQ6D5xr5Jwx/JOmIFJyxgpNaCS6FjSOPw3TGJG6cyo3TWDHMLF1vT6XF14wmOMEuuWYl1rRkgwsJxx6kGYx0gzmRlD6z+ONsowsUKzwyRWemWKzyyJWdaMUmFiSkyGGUmUzykyWJUmLSqswsVD6LVmYy6szmA1mazGiw6Ppx00WQwLQsUxrQsSwZgsLRHSsFhljjVYrGMT0rHMH0rGsf0bB0E44xDGxDHDGxTDuXDLCeXDbFgexEzsZwfjYP5aAABygUBsAAQwAZwAFzoABLABTAB3ASwAAZWwPiwAEvBCEEoSABEAFcACd2O4viAHsADsoDgU0QE4yTpLE7j1IEzjWJAWArIAY00gBbJjsAE7jRKgbiVKUgS5M4vi3IgSBPO83z/NEgAJABPJiBJUyTtIAa0syBiDIABfNKsCMqSBIAFT4hyBPigTTPM5LQBsyBQGS/AQG4vAADoqLeKjWviZIRnSdgQDEqyHKs5KQGc9jIr47SAHMQCweqYCa1q2pGB5onhEBcqsmbSHEWh1JIUAZtqliUr2gqZMgWqABIADk9PKeALjuhAwUEEAADMVIEgSAC9Tpe9jsE4gS0vSjA9tkobdrqk6waum6Hnuo4+nSLA3o+76oF+/7AfS9LMpAPiaAyjKsAAR1YjKgAA=','','','',3,'2020-08-20 13:45:18.759215',3,'Cisco DNA center Programmability','course_image/fb82c24f-4ee8-4850-8941-3249110b0eb8.png'),(6,'SCORM 1.2','2','Fenila','2','100','34',NULL,'normal','incomplete','','','00:00:07','','','1,1,1,0,0,0,0,0,0','','','',4,'2020-08-20 14:11:30.814473',4,'Windows Essentials','course_image/f9477724-d91d-43ea-9f84-9b1913943478.jpg'),(7,'SCORM 2004','3','johnwalt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2020-08-20 14:26:59.307812',2,'Python Fundamentals','course_image/0b659905-28ba-4933-8667-8a6aee68df45.jpg'),(8,'SCORM 2004','3','johnwalt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2020-08-20 14:27:47.453179',2,'Python Core and Advanced','course_image/cb9f537e-4c0d-4f63-95ba-df29e9d63615.jpg'),(9,'SCORM 1.2','3','johnwalt','','100','',NULL,'normal','','','','','','','','','','',3,'2020-08-20 14:29:57.671378',3,'Cisco DNA center Programmability','course_image/fb82c24f-4ee8-4850-8941-3249110b0eb8.png'),(10,'SCORM 1.2','3','johnwalt','','100','',NULL,'normal','','','','','','','','','','',4,'2020-08-20 14:31:50.279586',4,'Windows Essentials','course_image/f9477724-d91d-43ea-9f84-9b1913943478.jpg'),(11,'SCORM 2004','8','Abraham','','','',NULL,'normal','unknown','','credit','','0','','','','unknown','',2,'2020-08-20 15:19:26.432158',2,'Python Core and Advanced','course_image/cb9f537e-4c0d-4f63-95ba-df29e9d63615.jpg'),(12,'SCORM 2004','1','admin','','','',NULL,'normal','incomplete','','credit','PT0H0M26S','0','suspend','N4IgJiBcCsCcAM8DMAaEAbKB2NA3KA2vCgIwoBMKqALCtCgGwpYC6eAFoWyAGqHFlKNOo2YoAHClil43AA5RQ6AIYBnAC48AlgFMA7jrABldFrA7seXXoAiAVwBOy9VoD2AOyjl6IVafNG6s46qoog8GEAxq4AtnLoOuqGUOoOdjpWqlpJEJCp6ZnZhgASAJ5yOg6m7gDWoZAELAC+aCRRsfGJyXlpGSC4Wlk5Kb2FOWUVVVq19Y0tIOTtcQnDPQX9g0W5+X0DQyXlldV1XPNIS52rO2Pd1xv7YBNH0ycNzWjUFyu3o/dbI+s9lsnlMZqc0NAvl1tr8gVdYZtxodQa85mgGFD4YDET9sQ8QcdZu8QFhMbjdjiYXjgcjCad5gAvVyxQLBMLTcwADxC/FIFCoKFo9AY3CZLKCSVm7js6HQKGlsvlMrlCpVyqVitVxL8Zh0ABUtDEdNUdKzJWEIpBQPViCB1FB4AA6RAkRBuxDULDUWBe6AkVAgIxhGJheogaLLaEgND2yAkZ3uj1en3UP0BvVhWNEUjcZyEUCx20KBoFw0WSC2gAkADkoCQGB6kORyF7yEgcCAAGYOHQ6BnlzvKdCqHRNd4Fh1oYsEUtGycgGt1hvwahNlvUbxkLs9vsDocjseH+ZaemtUPzwsJ12JlfJ33+tBBq0gEPPsMRy7JGN1hOJz3e+900zXkSFzLMJwrKd8ztMt50XONl1XZtxHgFDbW7Xt+ygQdh1Hcc7XnadZ3LKtawQxtkNQh9t0wvdcMPZpj1PBZz0ggiKyvG9bwA1NqKfUBX2tKBww6b4IG/ONf3df8UzTNAM2fLMBDA6DCygksYLnNj4PrCjyHEJB/SYGjd2w/c8JaCCi1U2DtLI3SVzXAySGgSgTKwyAcIPFBiJ/LiZMAtAdMQpAkHgWAkAYFy0Aw0zPPMhimiYt4krQc43wvB1OJvALeIDfiX1YkTI2GCT438u88vk4CGmUtA8w0tSQCIzSSKC+yQrC2BxGgXqYp3DyvIsnz2OsxrbNIpdGy6nqGGkdy6O83zJIqni5IXDrEGgBhxHEZtoCQHxYsGhLmkYtATxS+ZPgytjLxdVbZL44Mio/MTo3Y8qcsq9aFIg7NQPq8DRvUmdWrgzb4G23byB9eA3OOxbhqs0Hlsm8ioZ2vaU1oBazPos7UpAS65nmSFbtte74GvP8fue59BN8YS3qjMqpLdXLfpqgGVMawibK09GHOhgyor9fraPxg98KalqXEF9qpsx3bIpIWBccRqWLPO4nmIxCmJKdB7vrW+mBNe0TWc+9mk1NoDFJA3mwdlgW2o2pWReoFcWwluKhsPEaXfGhX3Yxz2V3FvH4oJo8LuY0kDdG7Labtx8Xtu4rP3E63HsCkA/vYnmgdU/ng7d4Ktqx1M5q3TXo+lyyQea12IY9qvoCwbxfZOmOdZJxiiYAR0UJKgA=','','unknown','0.7272727',1,'2020-09-18 12:30:51.475135',2,'Python Fundamentals','course_image/0b659905-28ba-4933-8667-8a6aee68df45.jpg');
/*!40000 ALTER TABLE `user_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `education` varchar(40) DEFAULT NULL,
  `about` varchar(1200) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_profile_user_id_8fdce8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,NULL,NULL,NULL,NULL,NULL,1),(2,'9500061846','IN','Female','doctorate','To learn',2),(3,'9876545667','IN','Male','master','i like',3),(8,'9500061846','IN','Male','master','Test',8);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_trainer`
--

DROP TABLE IF EXISTS `user_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_trainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_name_id` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `courseid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_trainer_courseid_id_778e9b55_fk_course_courseid_id` (`courseid_id`),
  KEY `user_trainer_trainer_name_id_2a72e434` (`trainer_name_id`),
  CONSTRAINT `user_trainer_courseid_id_778e9b55_fk_course_courseid_id` FOREIGN KEY (`courseid_id`) REFERENCES `course_courseid` (`id`),
  CONSTRAINT `user_trainer_trainer_name_id_2a72e434_fk_auth_user_id` FOREIGN KEY (`trainer_name_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trainer`
--

LOCK TABLES `user_trainer` WRITE;
/*!40000 ALTER TABLE `user_trainer` DISABLE KEYS */;
INSERT INTO `user_trainer` VALUES (1,3,'2020-08-20 14:11:06.000000',3),(2,3,'2020-08-20 14:11:22.000000',1),(3,3,'2020-08-20 14:11:35.000000',2),(4,3,'2020-08-20 14:11:48.000000',4);
/*!40000 ALTER TABLE `user_trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25 13:49:21

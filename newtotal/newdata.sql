-- MySQL dump 10.13  Distrib 5.7.24, for Linux (i686)
--
-- Host: localhost    Database: management
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add student_course',1,'add_student_course'),(2,'Can change student_course',1,'change_student_course'),(3,'Can delete student_course',1,'delete_student_course'),(4,'Can view student_course',1,'view_student_course'),(5,'Can add almanac',2,'add_almanac'),(6,'Can change almanac',2,'change_almanac'),(7,'Can delete almanac',2,'delete_almanac'),(8,'Can view almanac',2,'view_almanac'),(9,'Can add criteria_ta',3,'add_criteria_ta'),(10,'Can change criteria_ta',3,'change_criteria_ta'),(11,'Can delete criteria_ta',3,'delete_criteria_ta'),(12,'Can view criteria_ta',3,'view_criteria_ta'),(13,'Can add schedule_history',4,'add_schedule_history'),(14,'Can change schedule_history',4,'change_schedule_history'),(15,'Can delete schedule_history',4,'delete_schedule_history'),(16,'Can view schedule_history',4,'view_schedule_history'),(17,'Can add exam',5,'add_exam'),(18,'Can change exam',5,'change_exam'),(19,'Can delete exam',5,'delete_exam'),(20,'Can view exam',5,'view_exam'),(21,'Can add slot_timings',6,'add_slot_timings'),(22,'Can change slot_timings',6,'change_slot_timings'),(23,'Can delete slot_timings',6,'delete_slot_timings'),(24,'Can view slot_timings',6,'view_slot_timings'),(25,'Can add faculty_students',7,'add_faculty_students'),(26,'Can change faculty_students',7,'change_faculty_students'),(27,'Can delete faculty_students',7,'delete_faculty_students'),(28,'Can view faculty_students',7,'view_faculty_students'),(29,'Can add ta_alloc',8,'add_ta_alloc'),(30,'Can change ta_alloc',8,'change_ta_alloc'),(31,'Can delete ta_alloc',8,'delete_ta_alloc'),(32,'Can view ta_alloc',8,'view_ta_alloc'),(33,'Can add event',9,'add_event'),(34,'Can change event',9,'change_event'),(35,'Can delete event',9,'delete_event'),(36,'Can view event',9,'view_event'),(37,'Can add exam_slot',10,'add_exam_slot'),(38,'Can change exam_slot',10,'change_exam_slot'),(39,'Can delete exam_slot',10,'delete_exam_slot'),(40,'Can view exam_slot',10,'view_exam_slot'),(41,'Can add faculty',11,'add_faculty'),(42,'Can change faculty',11,'change_faculty'),(43,'Can delete faculty',11,'delete_faculty'),(44,'Can view faculty',11,'view_faculty'),(45,'Can add room',12,'add_room'),(46,'Can change room',12,'change_room'),(47,'Can delete room',12,'delete_room'),(48,'Can view room',12,'view_room'),(49,'Can add timetable',13,'add_timetable'),(50,'Can change timetable',13,'change_timetable'),(51,'Can delete timetable',13,'delete_timetable'),(52,'Can view timetable',13,'view_timetable'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add student_grade',15,'add_student_grade'),(58,'Can change student_grade',15,'change_student_grade'),(59,'Can delete student_grade',15,'delete_student_grade'),(60,'Can view student_grade',15,'view_student_grade'),(61,'Can add faculty_ meetings',16,'add_faculty_meetings'),(62,'Can change faculty_ meetings',16,'change_faculty_meetings'),(63,'Can delete faculty_ meetings',16,'delete_faculty_meetings'),(64,'Can view faculty_ meetings',16,'view_faculty_meetings'),(65,'Can add student',17,'add_student'),(66,'Can change student',17,'change_student'),(67,'Can delete student',17,'delete_student'),(68,'Can view student',17,'view_student'),(69,'Can add break',18,'add_break'),(70,'Can change break',18,'change_break'),(71,'Can delete break',18,'delete_break'),(72,'Can view break',18,'view_break'),(73,'Can add faculty_course',19,'add_faculty_course'),(74,'Can change faculty_course',19,'change_faculty_course'),(75,'Can delete faculty_course',19,'delete_faculty_course'),(76,'Can view faculty_course',19,'view_faculty_course'),(77,'Can add course',20,'add_course'),(78,'Can change course',20,'change_course'),(79,'Can delete course',20,'delete_course'),(80,'Can view course',20,'view_course'),(81,'Can add log entry',21,'add_logentry'),(82,'Can change log entry',21,'change_logentry'),(83,'Can delete log entry',21,'delete_logentry'),(84,'Can view log entry',21,'view_logentry'),(85,'Can add group',22,'add_group'),(86,'Can change group',22,'change_group'),(87,'Can delete group',22,'delete_group'),(88,'Can view group',22,'view_group'),(89,'Can add permission',23,'add_permission'),(90,'Can change permission',23,'change_permission'),(91,'Can delete permission',23,'delete_permission'),(92,'Can view permission',23,'view_permission'),(93,'Can add content type',24,'add_contenttype'),(94,'Can change content type',24,'change_contenttype'),(95,'Can delete content type',24,'delete_contenttype'),(96,'Can view content type',24,'view_contenttype'),(97,'Can add session',25,'add_session'),(98,'Can change session',25,'change_session'),(99,'Can delete session',25,'delete_session'),(100,'Can view session',25,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_timetable_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_timetable_user_id` FOREIGN KEY (`user_id`) REFERENCES `timetable_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (21,'admin','logentry'),(22,'auth','group'),(23,'auth','permission'),(24,'contenttypes','contenttype'),(25,'sessions','session'),(2,'timetable','almanac'),(18,'timetable','break'),(20,'timetable','course'),(3,'timetable','criteria_ta'),(9,'timetable','event'),(5,'timetable','exam'),(10,'timetable','exam_slot'),(11,'timetable','faculty'),(19,'timetable','faculty_course'),(16,'timetable','faculty_meetings'),(7,'timetable','faculty_students'),(12,'timetable','room'),(4,'timetable','schedule_history'),(6,'timetable','slot_timings'),(17,'timetable','student'),(1,'timetable','student_course'),(15,'timetable','student_grade'),(8,'timetable','ta_alloc'),(13,'timetable','timetable'),(14,'timetable','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-16 20:33:10.332570'),(2,'contenttypes','0002_remove_content_type_name','2018-11-16 20:33:11.448565'),(3,'auth','0001_initial','2018-11-16 20:33:15.406356'),(4,'auth','0002_alter_permission_name_max_length','2018-11-16 20:33:15.585679'),(5,'auth','0003_alter_user_email_max_length','2018-11-16 20:33:15.647557'),(6,'auth','0004_alter_user_username_opts','2018-11-16 20:33:15.714031'),(7,'auth','0005_alter_user_last_login_null','2018-11-16 20:33:15.783609'),(8,'auth','0006_require_contenttypes_0002','2018-11-16 20:33:15.830368'),(9,'auth','0007_alter_validators_add_error_messages','2018-11-16 20:33:15.891519'),(10,'auth','0008_alter_user_username_max_length','2018-11-16 20:33:15.946493'),(11,'auth','0009_alter_user_last_name_max_length','2018-11-16 20:33:16.003113'),(12,'timetable','0001_initial','2018-11-16 20:33:41.611089'),(13,'admin','0001_initial','2018-11-16 20:33:43.431314'),(14,'admin','0002_logentry_remove_auto_add','2018-11-16 20:33:43.549014'),(15,'admin','0003_logentry_add_action_flag_choices','2018-11-16 20:33:43.642852'),(16,'sessions','0001_initial','2018-11-16 20:33:44.153881'),(17,'timetable','0002_auto_20181208_2254','2018-12-10 23:08:07.000930'),(18,'timetable','0003_faculty_students','2018-12-10 23:08:08.801091');
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
INSERT INTO `django_session` VALUES ('1q3hf5i59d7vm6eijnsolc93rlork462','NmEzYTk5ZjVlMTY1ODdmNzFjMzYzNGUzMWY3YmFmNGM0NGExNjNmYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Ijk5IiwiX2F1dGhfdXNlcl9oYXNoIjoiZWNmNTc3OGY3N2EzOGNlYmVhOGQzNWYyNjcwY2UyMjgzYmE2NjJlYiJ9','2018-12-22 20:13:56.764436'),('xnleu2kcm4nnlb98ltndfqdobm5i5tr2','ODdiZDdlMTliNTE4YjBhMTg3MjQ2MTQyMmUyODBjNzM0ZWRiZGZiMjp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDE5NGU5NWNkZmU2YjhmNGE3YjBmMjY3NTJkNzEzYTYwYzVkNjdkOCJ9','2018-12-01 14:03:15.804436');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_almanac`
--

DROP TABLE IF EXISTS `timetable_almanac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_almanac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `day` varchar(250) NOT NULL,
  `event_type` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_almanac`
--

LOCK TABLES `timetable_almanac` WRITE;
/*!40000 ALTER TABLE `timetable_almanac` DISABLE KEYS */;
INSERT INTO `timetable_almanac` VALUES (1,'2018-09-27','Thrusday','E','Mid'),(2,'2018-09-28','Friday','E','Mid'),(3,'2018-09-29','Saturday','E','Mid'),(4,'2018-09-30','Saturday','E','Mid'),(5,'2018-10-01','Saturday','E','Mid'),(6,'2018-11-28','Wednesday','E','End'),(7,'2018-11-29','Thrusday','E','End'),(8,'2018-11-30','Friday','E','End'),(9,'2018-12-01','Saturday','E','End'),(10,'2018-12-02','Sunday','E','End'),(11,'2018-12-03','Monday','E','End'),(12,'2018-12-04','Tuesday','E','End'),(13,'2018-12-05','Wednesday','E','End'),(14,'2018-12-06','Thrusday','E','End'),(15,'2018-12-07','Friday','E','End'),(16,'2018-11-03','Monday','H','Diwali'),(17,'2018-11-06','Thursday','N','Normal ');
/*!40000 ALTER TABLE `timetable_almanac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_break`
--

DROP TABLE IF EXISTS `timetable_break`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_break` (
  `batch_no` int(11) NOT NULL,
  `slot_no` int(11) NOT NULL,
  PRIMARY KEY (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_break`
--

LOCK TABLES `timetable_break` WRITE;
/*!40000 ALTER TABLE `timetable_break` DISABLE KEYS */;
INSERT INTO `timetable_break` VALUES (1,5),(2,7),(3,7),(4,7);
/*!40000 ALTER TABLE `timetable_break` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_course`
--

DROP TABLE IF EXISTS `timetable_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_course` (
  `cid` int(11) NOT NULL,
  `c_name` varchar(250) NOT NULL,
  `no_credits` int(11) NOT NULL,
  `no_hours` int(11) NOT NULL,
  PRIMARY KEY (`c_name`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_course`
--

LOCK TABLES `timetable_course` WRITE;
/*!40000 ALTER TABLE `timetable_course` DISABLE KEYS */;
INSERT INTO `timetable_course` VALUES (24,'Algo',4,4),(18,'APT',2,3),(25,'ASE_1',4,6),(28,'CommSkills_1',2,3),(23,'CommSkills_3',2,3),(6,'CSD',4,3),(13,'DE',4,3),(30,'decr',4,6),(3,'Digicomm',4,4),(9,'DIP',4,3),(10,'DM',4,3),(27,'DMPT',4,4),(21,'DSAA',4,6),(4,'EMT',4,3),(16,'FA',2,3),(14,'GE',2,3),(8,'IOT',4,3),(7,'IR',4,3),(1,'ITS_A',4,4),(31,'ITS_B',4,4),(15,'LS',2,3),(22,'Maths_3',4,4),(11,'MERS',4,3),(29,'OC',4,6),(20,'OS',4,3),(26,'PC',4,6),(12,'STATS',4,3),(2,'TOC',4,4),(5,'VLSI',4,3),(17,'YW',2,3);
/*!40000 ALTER TABLE `timetable_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_criteria_ta`
--

DROP TABLE IF EXISTS `timetable_criteria_ta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_criteria_ta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Criteria` double DEFAULT NULL,
  `Grade` int(11) NOT NULL,
  `Count` int(11) NOT NULL,
  `c_name_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_criteria_t_c_name_id_fe3ce92b_fk_timetable` (`c_name_id`),
  CONSTRAINT `timetable_criteria_t_c_name_id_fe3ce92b_fk_timetable` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_criteria_ta`
--

LOCK TABLES `timetable_criteria_ta` WRITE;
/*!40000 ALTER TABLE `timetable_criteria_ta` DISABLE KEYS */;
INSERT INTO `timetable_criteria_ta` VALUES (2,9,9,3,'DSAA'),(3,8,8,5,'DM'),(4,8.5,8,5,'TOC'),(5,8.5,8,6,'DMPT'),(6,9,8,5,'DIP'),(7,9,9,1,'YW'),(8,9,9,1,'ITS_A'),(9,9,9,2,'Digicomm'),(10,8.5,8,5,'PC'),(11,9,8,5,'IR'),(12,8.5,9,7,'decr'),(13,8.5,9,6,'OC'),(14,8,9,7,'Maths_3'),(15,8.5,8,8,'Algo'),(16,8.5,9,10,'DSAA'),(17,8.5,8,7,'OS'),(18,8.5,8,3,'Digicomm');
/*!40000 ALTER TABLE `timetable_criteria_ta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_event`
--

DROP TABLE IF EXISTS `timetable_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `day` varchar(250) NOT NULL,
  `event_type` varchar(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_event`
--

LOCK TABLES `timetable_event` WRITE;
/*!40000 ALTER TABLE `timetable_event` DISABLE KEYS */;
INSERT INTO `timetable_event` VALUES (1,'2018-10-29','Monday','OPTIONAL','nss'),(2,'2018-10-14','Tuesday','COMPULSORY','Treckking'),(3,'2018-11-17','Saturday','OPTIONAL','Planting Trees');
/*!40000 ALTER TABLE `timetable_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_exam`
--

DROP TABLE IF EXISTS `timetable_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `slot_no` int(11) NOT NULL,
  `exam_type` varchar(250) NOT NULL,
  `c_name_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_exam_c_name_id_05232dd4_fk_timetable_course_c_name` (`c_name_id`),
  CONSTRAINT `timetable_exam_c_name_id_05232dd4_fk_timetable_course_c_name` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_exam`
--

LOCK TABLES `timetable_exam` WRITE;
/*!40000 ALTER TABLE `timetable_exam` DISABLE KEYS */;
INSERT INTO `timetable_exam` VALUES (85,'2018-09-27',1,'Mid','TOC'),(86,'2018-09-27',2,'Mid','Digicomm'),(87,'2018-09-27',5,'Mid','CSD'),(88,'2018-09-28',1,'Mid','IR'),(89,'2018-09-28',4,'Mid','DM'),(90,'2018-09-28',5,'Mid','MERS'),(91,'2018-09-29',1,'Mid','STATS'),(92,'2018-09-29',2,'Mid','DE'),(93,'2018-09-29',5,'Mid','FA'),(94,'2018-09-30',1,'Mid','YW'),(96,'2018-09-30',3,'Mid','OS'),(97,'2018-10-01',1,'Mid','CommSkills_3'),(98,'2018-10-01',4,'Mid','PC'),(99,'2018-09-27',1,'Mid','CommSkills_1'),(100,'2018-09-27',4,'Mid','OC'),(101,'2018-09-28',1,'Mid','EMT'),(102,'2018-09-28',2,'Mid','decr'),(103,'2018-09-28',4,'Mid','VLSI'),(104,'2018-09-30',1,'Mid','IOT'),(105,'2018-09-28',5,'Mid','DIP'),(106,'2018-09-30',4,'Mid','GE'),(107,'2018-09-27',5,'Mid','LS'),(108,'2018-09-27',2,'Mid','DSAA'),(109,'2018-09-29',1,'Mid','Maths_3'),(110,'2018-09-28',2,'Mid','Algo'),(111,'2018-09-29',4,'Mid','ASE_1'),(112,'2018-09-29',2,'Mid','DMPT');
/*!40000 ALTER TABLE `timetable_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_exam_slot`
--

DROP TABLE IF EXISTS `timetable_exam_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_exam_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_type` varchar(250) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `slot_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_exam_slot`
--

LOCK TABLES `timetable_exam_slot` WRITE;
/*!40000 ALTER TABLE `timetable_exam_slot` DISABLE KEYS */;
INSERT INTO `timetable_exam_slot` VALUES (1,'Mid','08:30:00.000000','10:00:00.000000',1),(2,'Mid','10:30:00.000000','12:00:00.000000',2),(3,'Mid','13:00:00.000000','14:30:00.000000',3),(4,'Mid','15:00:00.000000','16:30:00.000000',4),(5,'Mid','17:00:00.000000','18:30:00.000000',5),(6,'End','09:30:00.000000','12:30:00.000000',1),(7,'End','14:00:00.000000','17:00:00.000000',2);
/*!40000 ALTER TABLE `timetable_exam_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_faculty`
--

DROP TABLE IF EXISTS `timetable_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_faculty` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `day_1` varchar(30) DEFAULT NULL,
  `day_2` varchar(30) DEFAULT NULL,
  `day_3` varchar(30) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `timetable_faculty_user_id_18f983fc_fk_timetable_user_id` FOREIGN KEY (`user_id`) REFERENCES `timetable_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_faculty`
--

LOCK TABLES `timetable_faculty` WRITE;
/*!40000 ALTER TABLE `timetable_faculty` DISABLE KEYS */;
INSERT INTO `timetable_faculty` VALUES (1,'Monday','Saturday','Friday',1),(2,'Monday','Tuesday','Friday',2),(3,'Wednesday','Friday','Saturday',3),(4,'Tuesday','Wednesday','Saturday',4),(5,'Wednesday','Friday','Saturday',5),(6,'Saturday','Tuesday','Thursday',6),(7,'Wednesday','Tuesday','Thursday',7),(8,'Monday','Tuesday','Friday',8),(9,'Wednesday','Thursday','Friday',9),(10,'Monday','Tuesday','Friday',10),(11,'Thursday','Friday','Monday',11),(12,'Tuesday','Friday','Thursday',12),(13,'Wednesday','Friday','Thursday',13),(14,'Monday','Friday','Saturday',14),(15,'Tuesday','Thursday','Friday',15),(16,'Wednesday','Friday','Saturday',16),(17,'Monday','Wednesday','Thursday',17),(18,'Tuesday','Wednesday','Saturday',18),(19,'Monday','Wednesday','Friday',19),(20,'Monday','Tuesday','Friday',20),(21,'Monday','Tuesday','Saturday',21),(22,'Tuesday','Thursday','Saturday',22),(23,'Tuesday','Wednesday','Saturday',23),(24,'Friday','Wednesday','Saturday',24),(25,'Monday','Wednesday','Thursday',25);
/*!40000 ALTER TABLE `timetable_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_faculty_course`
--

DROP TABLE IF EXISTS `timetable_faculty_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_faculty_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name_id` varchar(250) NOT NULL,
  `fid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_faculty_co_c_name_id_9f178ad8_fk_timetable` (`c_name_id`),
  KEY `timetable_faculty_co_fid_id_5056025b_fk_timetable` (`fid_id`),
  CONSTRAINT `timetable_faculty_co_c_name_id_9f178ad8_fk_timetable` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`),
  CONSTRAINT `timetable_faculty_co_fid_id_5056025b_fk_timetable` FOREIGN KEY (`fid_id`) REFERENCES `timetable_faculty` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_faculty_course`
--

LOCK TABLES `timetable_faculty_course` WRITE;
/*!40000 ALTER TABLE `timetable_faculty_course` DISABLE KEYS */;
INSERT INTO `timetable_faculty_course` VALUES (1,'DM',1),(2,'TOC',1),(3,'DMPT',2),(4,'DIP',2),(5,'PC',3),(6,'IR',3),(7,'decr',4),(8,'OC',5),(9,'OC',24),(10,'CommSkills_1',6),(11,'CommSkills_1',7),(12,'CommSkills_3',6),(13,'CommSkills_3',7),(14,'Maths_3',8),(15,'Algo',9),(16,'DSAA',10),(17,'OS',11),(18,'DE',12),(19,'DMPT',12),(20,'IOT',13),(21,'EMT',14),(22,'MERS',14),(23,'CSD',15),(24,'DigiComm',16),(25,'ITS_B',18),(26,'YW',17),(27,'ITS_A',17),(29,'STATS',19),(30,'GE',20),(31,'LS',21),(32,'FA',22),(33,'VLSI',23),(34,'ASE_1',25),(35,'APT',22),(36,'ITS_B',17);
/*!40000 ALTER TABLE `timetable_faculty_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_faculty_meetings`
--

DROP TABLE IF EXISTS `timetable_faculty_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_faculty_meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `slot_no` int(11) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `purpose` varchar(250) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_faculty_meetings`
--

LOCK TABLES `timetable_faculty_meetings` WRITE;
/*!40000 ALTER TABLE `timetable_faculty_meetings` DISABLE KEYS */;
INSERT INTO `timetable_faculty_meetings` VALUES (1,'2018-08-08',8,'14:30:00.000000','15:30:00.000000','Regarding course registration',5),(2,'2018-08-23',1,'09:00:00.000000','10:00:00.000000','Regarding timetable',2),(3,'2018-09-15',9,'15:30:00.000000','16:30:00.000000','Regarding Exams',1),(4,'2018-10-07',2,'10:00:00.000000','11:00:00.000000','Regarding answerscripts',2),(5,'2018-10-21',8,'14:30:00.000000','15:30:00.000000','Regarding attendancepolicy',5),(6,'2018-10-29',9,'15:30:00.000000','16:30:00.000000','Regarding placements',1),(7,'2018-11-03',4,'11:15:00.000000','12:15:00.000000','Regarding email issues',3),(8,'2018-11-19',2,'10:00:00.000000','11:15:00.000000','Regarding events',5),(9,'2018-11-27',11,'17:30:00.000000','18:30:00.000000','Regarding endexams',1),(10,'2018-12-01',7,'13:30:00.000000','14:30:00.000000','Regarding evaluations',1),(11,'2018-12-08',2,'10:00:00.000000','11:15:00.000000','Regarding internships',3);
/*!40000 ALTER TABLE `timetable_faculty_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_faculty_students`
--

DROP TABLE IF EXISTS `timetable_faculty_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_faculty_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_type` smallint(5) unsigned NOT NULL,
  `fid_id` int(11) NOT NULL,
  `student_id_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_faculty_st_fid_id_24c35499_fk_timetable` (`fid_id`),
  KEY `timetable_faculty_st_student_id_id_48429e1c_fk_timetable` (`student_id_id`),
  CONSTRAINT `timetable_faculty_st_fid_id_24c35499_fk_timetable` FOREIGN KEY (`fid_id`) REFERENCES `timetable_faculty` (`fid`),
  CONSTRAINT `timetable_faculty_st_student_id_id_48429e1c_fk_timetable` FOREIGN KEY (`student_id_id`) REFERENCES `timetable_student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_faculty_students`
--

LOCK TABLES `timetable_faculty_students` WRITE;
/*!40000 ALTER TABLE `timetable_faculty_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_faculty_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_room`
--

DROP TABLE IF EXISTS `timetable_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `day` varchar(250) NOT NULL,
  `slot_no` int(11) NOT NULL,
  `availability_status` int(11) NOT NULL,
  `capacity` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timetable_room_rid_day_slot_no_9902cec3_uniq` (`rid`,`day`,`slot_no`)
) ENGINE=InnoDB AUTO_INCREMENT=207108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_room`
--

LOCK TABLES `timetable_room` WRITE;
/*!40000 ALTER TABLE `timetable_room` DISABLE KEYS */;
INSERT INTO `timetable_room` VALUES (1,101,'Monday',2,1,'130'),(2,101,'Monday',3,0,'130'),(3,101,'Monday',4,0,'130'),(4,101,'Monday',5,1,'130'),(5,101,'Monday',6,0,'130'),(6,101,'Monday',7,0,'130'),(7,101,'Monday',8,1,'130'),(8,101,'Monday',9,0,'130'),(9,101,'Monday',10,0,'130'),(10,101,'Monday',11,0,'130'),(11,101,'Tuesday',1,0,'130'),(12,101,'Tuesday',2,1,'130'),(13,101,'Tuesday',3,0,'130'),(14,101,'Tuesday',4,0,'130'),(15,101,'Tuesday',5,0,'130'),(16,101,'Tuesday',6,0,'130'),(17,101,'Tuesday',7,0,'130'),(18,101,'Tuesday',8,1,'130'),(19,101,'Tuesday',9,0,'130'),(20,101,'Tuesday',10,1,'130'),(21,101,'Tuesday',11,0,'130'),(22,101,'Wednesday',1,1,'130'),(23,101,'Wednesday',2,1,'130'),(24,101,'Wednesday',3,0,'130'),(25,101,'Wednesday',4,1,'130'),(26,101,'Wednesday',5,1,'130'),(27,101,'Wednesday',6,0,'130'),(28,101,'Wednesday',7,1,'130'),(29,101,'Wednesday',8,0,'130'),(30,101,'Wednesday',9,0,'130'),(31,101,'Wednesday',10,0,'130'),(32,101,'Wednesday',11,0,'130'),(33,101,'Thursday',1,0,'130'),(34,101,'Thursday',2,0,'130'),(35,101,'Thursday',3,0,'130'),(36,101,'Thursday',4,0,'130'),(37,101,'Thursday',5,1,'130'),(38,101,'Thursday',6,0,'130'),(39,101,'Thursday',7,0,'130'),(40,101,'Thursday',8,0,'130'),(41,101,'Thursday',9,1,'130'),(42,101,'Thursday',10,0,'130'),(43,101,'Thursday',11,0,'130'),(44,101,'Friday',1,1,'130'),(45,101,'Friday',2,0,'130'),(46,101,'Friday',3,0,'130'),(47,101,'Friday',4,0,'130'),(48,101,'Friday',5,0,'130'),(49,101,'Friday',6,0,'130'),(50,101,'Friday',7,0,'130'),(51,101,'Friday',8,0,'130'),(52,101,'Friday',9,0,'130'),(53,101,'Friday',10,0,'130'),(54,101,'Friday',11,1,'130'),(55,101,'Saturday',1,1,'130'),(56,101,'Saturday',2,1,'130'),(57,101,'Saturday',3,0,'130'),(58,101,'Saturday',4,1,'130'),(59,101,'Saturday',5,1,'130'),(60,101,'Saturday',6,0,'130'),(61,101,'Saturday',7,1,'130'),(62,101,'Saturday',8,0,'130'),(63,1,'Saturday',9,0,'130'),(64,101,'Saturday',10,1,'130'),(65,101,'Saturday',11,0,'130'),(66,103,'Monday',1,0,'130'),(67,103,'Monday',2,1,'130'),(68,103,'Monday',3,0,'130'),(69,103,'Monday',4,1,'130'),(70,103,'Monday',5,1,'130'),(71,103,'Monday',6,0,'130'),(72,103,'Monday',7,0,'130'),(73,103,'Monday',8,0,'130'),(74,103,'Monday',9,1,'130'),(75,103,'Monday',10,0,'130'),(76,103,'Monday',11,0,'130'),(77,103,'Tuesday',1,0,'130'),(78,103,'Tuesday',2,0,'130'),(79,103,'Tuesday',3,0,'130'),(80,103,'Tuesday',4,1,'130'),(81,103,'Tuesday',5,0,'130'),(82,103,'Tuesday',6,0,'130'),(83,103,'Tuesday',7,1,'130'),(84,103,'Tuesday',8,0,'130'),(85,103,'Tuesday',9,0,'130'),(86,103,'Tuesday',10,1,'130'),(87,103,'Tuesday',11,0,'130'),(88,103,'Wednesday',1,1,'130'),(89,103,'Wednesday',2,0,'130'),(90,103,'Wednesday',3,0,'130'),(91,103,'Wednesday',4,0,'130'),(92,103,'Wednesday',5,1,'130'),(94,103,'Wednesday',7,0,'130'),(95,103,'Wednesday',8,0,'130'),(96,103,'Wednesday',9,1,'130'),(97,103,'Wednesday',10,0,'130'),(98,103,'Wednesday',11,0,'130'),(99,103,'Thursday',1,0,'130'),(100,103,'Thursday',2,0,'130'),(101,103,'Thursday',3,0,'130'),(102,103,'Thursday',4,1,'130'),(103,103,'Thursday',5,1,'130'),(104,103,'Thursday',6,0,'130'),(105,103,'Thursday',7,0,'130'),(106,103,'Thursday',8,0,'130'),(107,103,'Thursday',9,0,'130'),(108,103,'Thursday',10,1,'130'),(109,103,'Thursday',11,0,'130'),(110,103,'Friday',1,0,'130'),(111,103,'Friday',2,1,'130'),(112,103,'Friday',3,0,'130'),(113,103,'Friday',4,0,'130'),(114,103,'Friday',5,1,'130'),(115,103,'Friday',6,0,'130'),(116,103,'Friday',7,1,'130'),(117,103,'Friday',8,1,'130'),(118,103,'Friday',9,0,'130'),(119,103,'Friday',10,0,'130'),(120,103,'Friday',11,1,'130'),(121,103,'Saturday',1,0,'130'),(122,103,'Saturday',2,0,'130'),(123,103,'Saturday',3,0,'130'),(124,103,'Saturday',4,0,'130'),(125,103,'Saturday',5,0,'130'),(126,103,'Saturday',6,0,'130'),(127,103,'Saturday',7,0,'130'),(128,103,'Saturday',8,0,'130'),(129,103,'Saturday',9,0,'130'),(130,103,'Saturday',10,0,'130'),(131,103,'Saturday',11,0,'130'),(132,105,'Monday',1,0,'130'),(133,105,'Monday',2,0,'130'),(134,105,'Monday',3,0,'130'),(135,105,'Monday',4,1,'130'),(136,105,'Monday',5,0,'130'),(137,105,'Monday',6,0,'130'),(138,105,'Monday',7,0,'130'),(139,105,'Monday',8,0,'130'),(140,105,'Monday',9,0,'130'),(141,105,'Monday',10,0,'130'),(142,105,'Monday',11,0,'130'),(143,105,'Tuesday',1,0,'130'),(144,105,'Tuesday',2,0,'130'),(145,105,'Tuesday',3,0,'130'),(146,105,'Tuesday',4,0,'130'),(147,105,'Tuesday',5,0,'130'),(148,105,'Tuesday',6,0,'130'),(149,105,'Tuesday',7,0,'130'),(150,105,'Tuesday',8,0,'130'),(151,105,'Tuesday',9,1,'130'),(152,105,'Tuesday',10,0,'130'),(153,105,'Tuesday',11,1,'130'),(154,105,'Wednesday',1,0,'130'),(155,105,'Wednesday',2,1,'130'),(156,105,'Wednesday',3,0,'130'),(157,105,'Wednesday',4,0,'130'),(158,105,'Wednesday',5,1,'130'),(159,105,'Wednesday',6,0,'130'),(160,105,'Wednesday',7,0,'130'),(161,105,'Wednesday',8,0,'130'),(162,105,'Wednesday',9,1,'130'),(163,105,'Wednesday',10,0,'130'),(164,105,'Wednesday',11,0,'130'),(165,105,'Thursday',1,0,'130'),(166,105,'Thursday',2,0,'130'),(167,105,'Thursday',3,0,'130'),(168,105,'Thursday',4,1,'130'),(169,105,'Thursday',5,0,'130'),(170,105,'Thursday',6,0,'130'),(171,105,'Thursday',7,0,'130'),(172,105,'Thursday',8,1,'130'),(173,105,'Thursday',9,0,'130'),(174,105,'Thursday',10,1,'130'),(175,105,'Thursday',11,0,'130'),(176,105,'Friday',1,1,'130'),(177,105,'Friday',2,0,'130'),(178,105,'Friday',3,0,'130'),(179,105,'Friday',4,0,'130'),(180,105,'Friday',5,1,'130'),(181,105,'Friday',6,0,'130'),(182,105,'Friday',7,0,'130'),(183,105,'Friday',8,0,'130'),(184,105,'Friday',9,0,'130'),(185,105,'Friday',10,0,'130'),(186,105,'Friday',11,0,'130'),(187,105,'Saturday',1,1,'130'),(188,105,'Saturday',2,1,'130'),(189,105,'Saturday',3,0,'130'),(190,105,'Saturday',4,0,'130'),(191,105,'Saturday',5,1,'130'),(192,105,'Saturday',6,0,'130'),(193,105,'Saturday',7,0,'130'),(194,105,'Saturday',8,0,'130'),(195,105,'Saturday',9,1,'130'),(196,105,'Saturday',10,0,'130'),(197,105,'Saturday',11,0,'130'),(198,107,'Monday',1,0,'130'),(199,107,'Monday',2,1,'130'),(200,107,'Monday',3,0,'130'),(201,107,'Monday',4,0,'130'),(202,107,'Monday',5,0,'130'),(203,107,'Monday',6,0,'130'),(204,107,'Monday',7,0,'130'),(205,107,'Monday',8,0,'130'),(206,107,'Monday',9,0,'130'),(208,107,'Monday',11,0,'130'),(209,107,'Tuesday',1,1,'130'),(210,107,'Tuesday',2,1,'130'),(211,107,'Tuesday',3,0,'130'),(212,107,'Tuesday',4,0,'130'),(213,107,'Tuesday',5,0,'130'),(214,107,'Tuesday',6,0,'130'),(215,107,'Tuesday',7,0,'130'),(216,107,'Tuesday',8,0,'130'),(217,107,'Tuesday',9,1,'130'),(218,107,'Tuesday',10,0,'130'),(219,107,'Tuesday',11,1,'130'),(220,107,'Wednesday',1,0,'130'),(221,107,'Wednesday',2,0,'130'),(222,107,'Wednesday',3,0,'130'),(223,107,'Wednesday',4,0,'130'),(224,107,'Wednesday',5,0,'130'),(225,107,'Wednesday',6,0,'130'),(226,107,'Wednesday',7,0,'130'),(227,107,'Wednesday',8,0,'130'),(228,107,'Wednesday',9,0,'130'),(229,107,'Wednesday',10,0,'130'),(230,107,'Wednesday',11,0,'130'),(231,107,'Thursday',1,0,'130'),(232,107,'Thursday',2,1,'130'),(233,107,'Thursday',3,0,'130'),(234,107,'Thursday',4,0,'130'),(235,107,'Thursday',5,1,'130'),(236,107,'Thursday',6,0,'130'),(237,107,'Thursday',7,1,'130'),(238,107,'Thursday',8,0,'130'),(239,107,'Thursday',9,0,'130'),(240,107,'Thursday',10,0,'130'),(241,107,'Thursday',11,0,'130'),(242,107,'Friday',1,0,'130'),(243,107,'Friday',2,1,'130'),(244,107,'Friday',3,0,'130'),(245,107,'Friday',4,0,'130'),(246,107,'Friday',5,0,'130'),(247,107,'Friday',6,0,'130'),(248,107,'Friday',7,0,'130'),(249,107,'Friday',8,0,'130'),(250,107,'Friday',9,1,'130'),(251,107,'Friday',10,1,'130'),(252,107,'Friday',11,0,'130'),(253,107,'Saturday',1,0,'130'),(254,107,'Saturday',2,0,'130'),(255,107,'Saturday',3,0,'130'),(256,107,'Saturday',4,1,'130'),(257,107,'Saturday',5,1,'130'),(258,107,'Saturday',6,0,'130'),(259,107,'Saturday',7,0,'130'),(260,107,'Saturday',8,0,'130'),(261,107,'Saturday',9,0,'130'),(262,107,'Saturday',10,1,'130'),(263,107,'Saturday',11,0,'130'),(264,113,'Monday',1,0,'130'),(265,113,'Monday',2,0,'130'),(266,113,'Monday',3,0,'130'),(267,113,'Monday',4,0,'130'),(268,113,'Monday',5,1,'130'),(269,113,'Monday',6,0,'130'),(270,113,'Monday',7,0,'130'),(271,113,'Monday',8,0,'130'),(272,113,'Monday',9,0,'130'),(273,113,'Monday',10,0,'130'),(274,113,'Monday',11,0,'130'),(275,113,'Tuesday',1,0,'130'),(276,113,'Tuesday',2,0,'130'),(277,113,'Tuesday',3,0,'130'),(278,113,'Tuesday',4,0,'130'),(279,113,'Tuesday',5,0,'130'),(280,113,'Tuesday',6,0,'130'),(281,113,'Tuesday',7,1,'130'),(282,113,'Tuesday',8,0,'130'),(283,113,'Tuesday',9,0,'130'),(284,113,'Tuesday',10,0,'130'),(285,113,'Tuesday',11,0,'130'),(286,113,'Wednesday',1,1,'130'),(287,113,'Wednesday',2,0,'130'),(288,113,'Wednesday',3,0,'130'),(289,113,'Wednesday',4,0,'130'),(290,113,'Wednesday',5,0,'130'),(291,113,'Wednesday',6,0,'130'),(292,113,'Wednesday',7,0,'130'),(293,113,'Wednesday',8,0,'130'),(294,113,'Wednesday',9,0,'130'),(295,113,'Wednesday',10,0,'130'),(296,113,'Wednesday',11,0,'130'),(297,113,'Thursday',1,0,'130'),(298,113,'Thursday',2,0,'130'),(299,113,'Thursday',3,0,'130'),(300,113,'Thursday',4,0,'130'),(301,113,'Thursday',5,0,'130'),(302,113,'Thursday',6,0,'130'),(303,113,'Thursday',7,0,'130'),(304,113,'Thursday',8,0,'130'),(305,113,'Thursday',9,0,'130'),(306,113,'Thursday',10,0,'130'),(307,113,'Thursday',11,1,'130'),(308,113,'Friday',1,1,'130'),(309,113,'Friday',2,1,'130'),(310,113,'Friday',3,0,'130'),(311,113,'Friday',4,1,'130'),(312,113,'Friday',5,0,'130'),(313,113,'Friday',6,0,'130'),(314,113,'Friday',7,0,'130'),(315,113,'Friday',8,0,'130'),(316,113,'Friday',9,1,'130'),(317,113,'Friday',10,0,'130'),(318,113,'Friday',11,0,'130'),(319,113,'Saturday',1,0,'130'),(320,113,'Saturday',2,0,'130'),(321,113,'Saturday',3,0,'130'),(322,113,'Saturday',4,0,'130'),(323,113,'Saturday',5,0,'130'),(324,113,'Saturday',6,0,'130'),(325,113,'Saturday',7,1,'130'),(326,113,'Saturday',8,1,'130'),(327,113,'Saturday',9,0,'130'),(328,113,'Saturday',10,0,'130'),(329,113,'Saturday',11,1,'130'),(330,115,'Monday',1,1,'130'),(331,115,'Monday',2,1,'130'),(332,115,'Monday',3,0,'130'),(333,115,'Monday',4,1,'130'),(334,115,'Monday',5,1,'130'),(335,115,'Monday',6,0,'130'),(336,115,'Monday',7,1,'130'),(337,115,'Monday',8,0,'130'),(338,115,'Monday',9,0,'130'),(339,115,'Monday',10,0,'130'),(340,115,'Monday',11,1,'130'),(341,115,'Tuesday',1,1,'130'),(342,115,'Tuesday',2,1,'130'),(343,115,'Tuesday',3,0,'130'),(344,115,'Tuesday',4,0,'130'),(345,115,'Tuesday',5,0,'130'),(346,115,'Tuesday',6,0,'130'),(347,115,'Tuesday',7,1,'130'),(348,115,'Tuesday',8,1,'130'),(349,115,'Tuesday',9,0,'130'),(350,115,'Tuesday',10,0,'130'),(351,115,'Tuesday',11,0,'130'),(352,115,'Wednesday',1,0,'130'),(353,115,'Wednesday',2,1,'130'),(354,115,'Wednesday',3,0,'130'),(355,115,'Wednesday',4,0,'130'),(356,115,'Wednesday',5,0,'130'),(357,115,'Wednesday',6,0,'130'),(358,115,'Wednesday',7,1,'130'),(359,115,'Wednesday',8,1,'130'),(360,115,'Wednesday',9,0,'130'),(361,115,'Wednesday',10,0,'130'),(362,115,'Wednesday',11,1,'130'),(363,115,'Thursday',1,0,'130'),(364,115,'Thursday',2,1,'130'),(365,115,'Thursday',3,0,'130'),(366,115,'Thursday',4,0,'130'),(367,115,'Thursday',5,0,'130'),(368,115,'Thursday',6,0,'130'),(369,115,'Thursday',7,0,'130'),(370,115,'Thursday',8,0,'130'),(371,115,'Thursday',9,0,'130'),(372,115,'Thursday',10,0,'130'),(373,115,'Thursday',11,0,'130'),(374,115,'Friday',1,0,'130'),(375,115,'Friday',2,0,'130'),(376,115,'Friday',3,0,'130'),(377,115,'Friday',4,1,'130'),(378,115,'Friday',5,1,'130'),(379,115,'Friday',6,0,'130'),(380,115,'Friday',7,0,'130'),(381,115,'Friday',8,0,'130'),(382,115,'Friday',9,0,'130'),(383,115,'Friday',10,0,'130'),(384,115,'Friday',11,0,'130'),(385,101,'Monday',1,1,'130'),(93103,0,'6',0,130,''),(207107,0,'10',0,130,'');
/*!40000 ALTER TABLE `timetable_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_schedule_history`
--

DROP TABLE IF EXISTS `timetable_schedule_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_schedule_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `present_date` date NOT NULL,
  `resc_date` date NOT NULL,
  `day` varchar(250) NOT NULL,
  `c_name` varchar(250) NOT NULL,
  `rid` int(11) NOT NULL,
  `slot_no_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_schedule_h_slot_no_id_fee2a1f3_fk_timetable` (`slot_no_id`),
  CONSTRAINT `timetable_schedule_h_slot_no_id_fee2a1f3_fk_timetable` FOREIGN KEY (`slot_no_id`) REFERENCES `timetable_slot_timings` (`slot_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_schedule_history`
--

LOCK TABLES `timetable_schedule_history` WRITE;
/*!40000 ALTER TABLE `timetable_schedule_history` DISABLE KEYS */;
INSERT INTO `timetable_schedule_history` VALUES (1,'2018-09-10','2018-09-14','Friday','DIP',101,4),(2,'2018-09-19','2018-09-22','Saturday','IOT',103,2),(3,'2018-09-23','2018-09-27','Thursday','PC',113,1),(4,'2018-10-01','2018-10-08','Monday','DMPT',115,8),(5,'2018-10-03','2018-10-10','Wednesday','ASE_1',115,10),(6,'2018-10-15','2018-10-22','Tuesday','IR',107,1),(7,'2018-11-12','2018-10-13','Tuesday','DIP',107,2),(8,'2018-11-15','2018-10-19','Monday','DE',101,9),(9,'2018-11-26','2018-10-29','Thursday','DM',201,1),(10,'2018-11-28','2018-10-29','Thursday','YW',207,7);
/*!40000 ALTER TABLE `timetable_schedule_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_slot_timings`
--

DROP TABLE IF EXISTS `timetable_slot_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_slot_timings` (
  `slot_no` int(11) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  PRIMARY KEY (`slot_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_slot_timings`
--

LOCK TABLES `timetable_slot_timings` WRITE;
/*!40000 ALTER TABLE `timetable_slot_timings` DISABLE KEYS */;
INSERT INTO `timetable_slot_timings` VALUES (1,'09:00:00.000000','10:00:00.000000'),(2,'10:00:00.000000','11:00:00.000000'),(3,'11:00:00.000000','11:15:00.000000'),(4,'11:15:00.000000','12:15:00.000000'),(5,'12:15:00.000000','13:15:00.000000'),(6,'13:15:00.000000','13:30:00.000000'),(7,'13:30:00.000000','14:30:00.000000'),(8,'14:30:00.000000','15:30:00.000000'),(9,'15:30:00.000000','16:30:00.000000'),(10,'16:30:00.000000','17:30:00.000000'),(11,'17:30:00.000000','18:30:00.000000');
/*!40000 ALTER TABLE `timetable_slot_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_student`
--

DROP TABLE IF EXISTS `timetable_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_student` (
  `student_id` varchar(250) NOT NULL,
  `cgpa` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `timetable_student_user_id_78cdced7_fk_timetable_user_id` FOREIGN KEY (`user_id`) REFERENCES `timetable_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_student`
--

LOCK TABLES `timetable_student` WRITE;
/*!40000 ALTER TABLE `timetable_student` DISABLE KEYS */;
INSERT INTO `timetable_student` VALUES ('20150010001',7,57),('20160010002',8.9,91),('20160010004',7.9,109),('20160010005',6.8,59),('20160010006',8.6,60),('20160010007',7.8,113),('20160010009',7,63),('20160010011',9,99),('20160010013',8,61),('20160010015',9,43),('20160010016',7.8,37),('20160010018',8,117),('20160010019',8,30),('20160010021',9.4,58),('20160010022',6.9,119),('20160010026',7.48,74),('20160010030',7.4,64),('20160010034',7.6,88),('20160010035',6.78,52),('20160010036',8.6,90),('20160010037',8.6,76),('20160010038',8.4,111),('20160010040',7.9,72),('20160010041',7.7,120),('20160010042',8.2,33),('20160010044',6.56,54),('20160010045',6.7,67),('20160010047',7.3,83),('20160010048',7.5,66),('20160010049',7.8,77),('20160010051',7.65,39),('20160010052',9.56,70),('20160010054',8.27,98),('20160010055',8.21,62),('20160010056',9.34,114),('20160010057',9.17,122),('20160010058',9.07,108),('20160010059',8.9,32),('20160010060',8.07,102),('20160010063',8.98,121),('20160010067',8.57,34),('20160010068',6.23,53),('20160010069',9.45,89),('20160010073',6.59,40),('20160010077',6.5,42),('20160010078',8.99,112),('20160010080',7.77,69),('20160010081',7.68,38),('20160010084',9.5,29),('20160010086',6.99,126),('20160010089',7.88,105),('20160010090',8.88,104),('20160010091',8.59,101),('20160010093',8.5,96),('20160010094',7.11,128),('20160010095',9.09,78),('20160010096',7.09,85),('20160010097',8.19,124),('20160010098',8.91,110),('20160010099',7.12,94),('20160010100',9.12,73),('20160010104',9.67,93),('20160010105',6.67,95),('20160010106',8.67,127),('20160010107',8.56,92),('20160010145',8.05,125),('20160010162',8.68,31),('20160020109',7.2,51),('20160020111',7.23,48),('20160020112',7.89,49),('20160020113',8.7,50),('20160020116',7.15,47),('20160020117',8.8,75),('20160020118',8.9,87),('20160020122',9.3,80),('20160020123',9.7,107),('20160020125',9.23,115),('20160020126',8.73,71),('20160020127',8.7,129),('20160020128',6.7,84),('20160020129',8.34,46),('20160020130',7.36,123),('20160020131',8.09,86),('20160020132',8.12,44),('20160020133',7.45,41),('20160020134',8.34,79),('20160020138',8.78,35),('20160020140',8.55,97),('20160020142',7.55,65),('20160020143',8.45,45),('20160020144',6.89,82),('20160020147',8.88,36),('20160020148',8.5,28),('20160020149',7.89,106),('20160020153',7.05,68),('20160020154',7.15,118),('20160020155',7.6,116),('20160020158',8.6,130),('20160020159',8.1,81),('20160020160',6.5,100),('20160020163',6.55,103),('20170010035',6.67,55),('20180010060',7.18,56);
/*!40000 ALTER TABLE `timetable_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_student_course`
--

DROP TABLE IF EXISTS `timetable_student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_student_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name_id` varchar(250) NOT NULL,
  `student_id_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_student_co_c_name_id_9227f802_fk_timetable` (`c_name_id`),
  KEY `timetable_student_co_student_id_id_88d5e5ea_fk_timetable` (`student_id_id`),
  CONSTRAINT `timetable_student_co_c_name_id_9227f802_fk_timetable` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`),
  CONSTRAINT `timetable_student_co_student_id_id_88d5e5ea_fk_timetable` FOREIGN KEY (`student_id_id`) REFERENCES `timetable_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_student_course`
--

LOCK TABLES `timetable_student_course` WRITE;
/*!40000 ALTER TABLE `timetable_student_course` DISABLE KEYS */;
INSERT INTO `timetable_student_course` VALUES (1,'DM','20160010059'),(2,'ITS_A','20160010059'),(3,'TOC','20160010059'),(4,'IR','20160010059'),(5,'LS','20160010059'),(6,'DE','20160010059'),(7,'DE','20160010067'),(8,'TOC','20160010067'),(9,'DM','20160010067'),(10,'IR','20160010067'),(11,'LS','20160010067'),(12,'ITS_A','20160010067'),(13,'ITS_A','20160010084'),(14,'DIP','20160010084'),(15,'EMT','20160010084'),(16,'Digicomm','20160010084'),(17,'LS','20160010084'),(18,'DE','20160010084'),(19,'STATS','20160010019'),(20,'TOC','20160010019'),(21,'IR','20160010019'),(22,'IOT','20160010019'),(23,'LS','20160010019'),(24,'ITS_A','20160010019'),(25,'ITS_A','20160020147'),(26,'EMT','20160020147'),(27,'DIP','20160020147'),(28,'GE','20160020147'),(29,'Digicomm','20160020147'),(30,'DE','20160020147'),(31,'ITS_A','20160020148'),(32,'DIP','20160020148'),(33,'DE','20160020148'),(34,'EMT','20160020148'),(35,'Digicomm','20160020148'),(36,'GE','20160020148'),(49,'Digicomm','20160020132'),(50,'CSD','20160020132'),(51,'STATS','20160020132'),(52,'DIP','20160020132'),(53,'ITS_A','20160020132'),(54,'ITS_A','20160010068'),(55,'IOT','20160010068'),(56,'CSD','20160010068'),(57,'TOC','20160010068'),(58,'FA','20160010068'),(59,'GE','20160010068'),(60,'DIP','20160020133'),(61,'ITS_B','20160020133'),(62,'STATS','20160020133'),(63,'Digicomm','20160020133'),(64,'IR','20160020133'),(65,'CSD','20160020133'),(66,'CSD','20160010035'),(67,'TOC','20160010035'),(69,'STATS','20160010035'),(70,'DIP','20160010035'),(71,'DSAA','20170010035'),(72,'OS','20170010035'),(73,'ASE_1','20170010035'),(74,'Maths_3','20170010035'),(75,'CommSkills_3','20170010035'),(76,'Algo','20170010035'),(83,'PC','20180010060'),(84,'OC','20180010060'),(85,'DMPT','20180010060'),(86,'decr','20180010060'),(87,'CommSkills_1','20180010060'),(100,'GE','20160010044'),(101,'STATS','20160010044'),(102,'TOC','20160010044'),(103,'IR','20160010044'),(104,'ITS_B','20160010044'),(111,'CSD','20160020112'),(112,'GE','20160020112'),(113,'ITS_B','20160020112'),(114,'EMT','20160020112'),(115,'Digicomm','20160020112'),(116,'VLSI','20160020112'),(117,'VLSI','20160020111'),(118,'IOT','20160020111'),(119,'EMT','20160020111'),(120,'ITS_B','20160020111'),(121,'Digicomm','20160020111'),(122,'GE','20160020111'),(124,'Digicomm','20160020113'),(125,'VLSI','20160020113'),(126,'EMT','20160020113'),(127,'DE','20160020113'),(128,'LS','20160020113'),(134,'EMT','20160020116'),(135,'ITS_B','20160020116'),(136,'VLSI','20160020116'),(137,'LS','20160020116'),(138,'Digicomm','20160020116'),(139,'Maths_3','20160020116'),(146,'LS','20160020109'),(147,'MERS','20160020109'),(148,'ITS_B','20160020109'),(149,'Digicomm','20160020109'),(150,'EMT','20160020109'),(151,'STATS','20160020109'),(152,'STATS','20150010001'),(153,'APT','20150010001'),(154,'FA','20150010001'),(156,'CSD','20150010001'),(157,'GE','20150010001'),(158,'ITS_A','20160010002'),(159,'TOC','20160010002'),(160,'IR','20160010002'),(161,'DIP','20160010002'),(162,'DE','20160010002'),(163,'ITS_B','20160010004'),(164,'TOC','20160010004'),(165,'IR','20160010004'),(166,'STATS','20160010004'),(167,'GE','20160010004'),(168,'ITS_A','20160010005'),(169,'TOC','20160010005'),(170,'IR','20160010005'),(171,'DIP','20160010005'),(172,'DM','20160010005'),(173,'DE','20160010005'),(174,'ITS_B','20160010006'),(175,'TOC','20160010006'),(176,'IR','20160010006'),(177,'IOT','20160010006'),(178,'DIP','20160010006'),(179,'DE','20160010006'),(180,'ITS_A','20160010007'),(181,'TOC','20160010007'),(182,'IR','20160010007'),(183,'DIP','20160010007'),(184,'STATS','20160010007'),(185,'GE','20160010007'),(186,'ITS_B','20160010009'),(187,'TOC','20160010009'),(188,'IR','20160010009'),(189,'DIP','20160010009'),(190,'STATS','20160010009'),(191,'LS','20160010009'),(192,'ITS_A','20160010011'),(193,'TOC','20160010011'),(194,'IR','20160010011'),(195,'DIP','20160010011'),(196,'DM','20160010011'),(197,'DE','20160010011'),(198,'ITS_B','20160010013'),(199,'TOC','20160010013'),(200,'DIP','20160010013'),(201,'IR','20160010013'),(202,'LS','20160010013'),(203,'STATS','20160010013'),(204,'ITS_A','20160010015'),(205,'TOC','20160010015'),(206,'DIP','20160010015'),(207,'IR','20160010015'),(208,'STATS','20160010015'),(209,'LS','20160010015'),(210,'ITS_B','20160010016'),(211,'TOC','20160010016'),(212,'IR','20160010016'),(213,'CSD','20160010016'),(214,'LS','20160010016'),(215,'STATS','20160010016'),(216,'ITS_A','20160010018'),(217,'TOC','20160010018'),(218,'CSD','20160010018'),(219,'IR','20160010018'),(220,'STATS','20160010018'),(221,'GE','20160010018'),(222,'ITS_B','20160010021'),(223,'TOC','20160010021'),(224,'IR','20160010021'),(225,'DIP','20160010021'),(226,'DM','20160010021'),(227,'STATS','20160010021'),(228,'ITS_A','20160010022'),(229,'TOC','20160010022'),(230,'IR','20160010022'),(231,'DIP','20160010022'),(232,'STATS','20160010022'),(233,'LS','20160010022'),(234,'ITS_B','20160010026'),(235,'TOC','20160010026'),(236,'IR','20160010026'),(237,'DIP','20160010026'),(238,'DM','20160010026'),(239,'STATS','20160010026'),(240,'ITS_A','20160010030'),(241,'TOC','20160010030'),(242,'IR','20160010030'),(243,'DIP','20160010030'),(244,'STATS','20160010030'),(245,'LS','20160010030'),(246,'ITS_B','20160010034'),(247,'TOC','20160010034'),(248,'IR','20160010034'),(249,'DIP','20160010034'),(250,'DE','20160010034'),(251,'ITS_A','20160010036'),(252,'TOC','20160010036'),(253,'IR','20160010036'),(254,'DIP','20160010036'),(255,'STATS','20160010036'),(256,'GE','20160010036'),(257,'ITS_B','20160010037'),(258,'TOC','20160010037'),(259,'IR','20160010037'),(260,'DIP','20160010037'),(261,'DM','20160010037'),(262,'STATS','20160010037'),(263,'ITS_A','20160010038'),(264,'TOC','20160010038'),(265,'IR','20160010038'),(266,'DIP','20160010038'),(267,'STATS','20160010038'),(268,'LS','20160010038'),(269,'ITS_B','20160010040'),(270,'TOC','20160010040'),(271,'IR','20160010040'),(272,'DIP','20160010040'),(273,'DE','20160010040'),(274,'LS','20160010040'),(275,'ITS_A','20160010041'),(276,'TOC','20160010041'),(277,'IR','20160010041'),(278,'DIP','20160010041'),(279,'STATS','20160010041'),(280,'GE','20160010041'),(281,'ITS_B','20160010042'),(282,'TOC','20160010042'),(283,'IR','20160010042'),(284,'DIP','20160010042'),(285,'LS','20160010042'),(286,'Maths_3','20160010042'),(287,'ITS_A','20160010045'),(288,'TOC','20160010045'),(289,'CSD','20160010045'),(290,'IR','20160010045'),(291,'STATS','20160010045'),(292,'LS','20160010045'),(293,'ITS_B','20160010047'),(294,'TOC','20160010047'),(295,'IR','20160010047'),(296,'DIP','20160010047'),(297,'STATS','20160010047'),(298,'LS','20160010047'),(299,'ITS_A','20160010048'),(300,'TOC','20160010048'),(301,'IR','20160010048'),(302,'DIP','20160010048'),(303,'DE','20160010048'),(304,'LS','20160010048'),(305,'ITS_B','20160010049'),(306,'TOC','20160010049'),(307,'DM','20160010049'),(308,'STATS','20160010049'),(309,'DIP','20160010049'),(310,'IR','20160010049'),(311,'ITS_A','20160010051'),(312,'TOC','20160010051'),(313,'IOT','20160010051'),(314,'IR','20160010051'),(315,'LS','20160010051'),(316,'STATS','20160010051'),(317,'ITS_B','20160010052'),(318,'TOC','20160010052'),(319,'IR','20160010052'),(320,'DIP','20160010052'),(321,'DM','20160010052'),(322,'STATS','20160010052'),(323,'ITS_A','20160010054'),(324,'TOC','20160010054'),(325,'IR','20160010054'),(326,'DIP','20160010054'),(327,'STATS','20160010054'),(328,'LS','20160010054'),(329,'ITS_B','20160010055'),(330,'ITS_B','20160010057'),(331,'TOC','20160010057'),(332,'IR','20160010057'),(333,'DIP','20160010057'),(334,'STATS','20160010057'),(335,'LS','20160010057'),(336,'ITS_A','20160010058'),(337,'TOC','20160010058'),(338,'IR','20160010058'),(339,'DIP','20160010058'),(340,'STATS','20160010058'),(341,'LS','20160010058'),(342,'ITS_B','20160010060'),(343,'TOC','20160010060'),(344,'DIP','20160010060'),(345,'IR','20160010060'),(346,'STATS','20160010060'),(347,'FA','20160010060'),(348,'ITS_A','20160010063'),(349,'TOC','20160010063'),(350,'CSD','20160010063'),(351,'DIP','20160010063'),(352,'STATS','20160010063'),(353,'ITS_B','20160010069'),(354,'TOC','20160010069'),(355,'IR','20160010069'),(356,'CSD','20160010069'),(357,'GE','20160010069'),(358,'Maths_3','20160010069'),(359,'ITS_A','20160010073'),(360,'TOC','20160010073'),(361,'IR','20160010073'),(362,'DIP','20160010073'),(363,'STATS','20160010073'),(364,'GE','20160010073'),(365,'ITS_B','20160010077'),(366,'TOC','20160010077'),(367,'DIP','20160010077'),(368,'DM','20160010077'),(369,'LS','20160010077'),(370,'DE','20160010077'),(371,'FA','20160010077'),(372,'ITS_A','20160010078'),(373,'TOC','20160010078'),(374,'CSD','20160010078'),(375,'IR','20160010078'),(376,'STATS','20160010078'),(377,'LS','20160010078'),(378,'ITS_B','20160010080'),(379,'TOC','20160010080'),(380,'STATS','20160010080'),(381,'CSD','20160010080'),(382,'IR','20160010080'),(383,'LS','20160010080'),(384,'ITS_A','20160010081'),(388,'TOC','20160010081'),(389,'DE','20160010081'),(390,'IR','20160010081'),(391,'IOT','20160010081'),(392,'LS','20160010081'),(393,'ITS_B','20160010086'),(394,'TOC','20160010086'),(395,'LS','20160010086'),(396,'IR','20160010086'),(399,'DIP','20160010086'),(400,'IR','20160010099'),(401,'DIP','20160010099'),(402,'DM','20160010099'),(403,'DE','20160010099'),(404,'ITS_A','20160010100'),(405,'TOC','20160010100'),(406,'LS','20160010100'),(407,'YW','20160010100'),(408,'IR','20160010100'),(409,'IOT','20160010100'),(410,'ITS_B','20160010104'),(411,'TOC','20160010104'),(412,'IR','20160010104'),(413,'DIP','20160010104'),(414,'DM','20160010104'),(415,'STATS','20160010104'),(416,'ITS_A','20160010105'),(417,'TOC','20160010105'),(418,'CSD','20160010105'),(419,'DIP','20160010105'),(420,'STATS','20160010105'),(421,'ITS_B','20160010106'),(422,'TOC','20160010106'),(423,'DM','20160010106'),(424,'DIP','20160010106'),(425,'STATS','20160010106'),(426,'IR','20160010106'),(427,'ITS_A','20160010107'),(428,'TOC','20160010107'),(429,'IR','20160010107'),(430,'DIP','20160010107'),(431,'STATS','20160010107'),(432,'LS','20160010107'),(433,'ITS_B','20160010145'),(434,'TOC','20160010145'),(435,'IR','20160010145'),(436,'DIP','20160010145'),(437,'DM','20160010145'),(438,'STATS','20160010145'),(439,'ITS_A','20160020117'),(440,'Digicomm','20160020117'),(441,'CSD','20160020117'),(442,'IR','20160020117'),(443,'DIP','20160020117'),(444,'STATS','20160020117'),(445,'ITS_B','20160020118'),(446,'Digicomm','20160020118'),(447,'VLSI','20160020118'),(448,'LS','20160020118'),(449,'Maths_3','20160020118'),(450,'ITS_A','20160020122'),(451,'Digicomm','20160020122'),(452,'VLSI','20160020122'),(453,'DIP','20160020122'),(454,'STATS','20160020122'),(455,'ITS_B','20160020123'),(456,'Digicomm','20160020123'),(457,'VLSI','20160020123'),(458,'DIP','20160020123'),(459,'STATS','20160020123'),(460,'ITS_A','20160020125'),(461,'Digicomm','20160020125'),(462,'EMT','20160020125'),(463,'IR','20160020125'),(464,'DIP','20160020125'),(465,'ITS_B','20160020126'),(466,'Digicomm','20160020126'),(467,'EMT','20160020126'),(468,'DIP','20160020126'),(469,'DE','20160020126'),(470,'EMT','20160020127'),(471,'CSD','20160020127'),(472,'LS','20160020127'),(473,'ITS_B','20160020128'),(474,'Digicomm','20160020128'),(475,'EMT','20160020128'),(476,'VLSI','20160020128'),(477,'DE','20160020128'),(478,'LS','20160020128'),(479,'ITS_A','20160020129'),(480,'Digicomm','20160020129'),(481,'EMT','20160020129'),(482,'VLSI','20160020129'),(483,'DE','20160020129'),(484,'ITS_B','20160020130'),(485,'Digicomm','20160020130'),(486,'EMT','20160020130'),(487,'VLSI','20160020130'),(488,'LS','20160020130'),(489,'FA','20160020130'),(490,'ITS_A','20160020131'),(491,'Digicomm','20160020131'),(492,'EMT','20160020131'),(493,'VLSI','20160020131'),(494,'DIP','20160020131'),(495,'DE','20160020131'),(496,'ITS_B','20160020133'),(497,'Digicomm','20160020133'),(498,'IR','20160020133'),(499,'CSD','20160020133'),(500,'STATS','20160020133'),(501,'DIP','20160020133'),(502,'ITS_A','20160020134'),(503,'Digicomm','20160020134'),(504,'VLSI','20160020134'),(505,'STATS','20160020134'),(506,'FA','20160020134'),(507,'LS','20160020134'),(508,'ITS_B','20160020138'),(509,'Digicomm','20160020138'),(510,'EMT','20160020138'),(511,'DIP','20160020138'),(512,'LS','20160020138'),(513,'DE','20160020138'),(514,'ITS_A','20160020140'),(515,'Digicomm','20160020140'),(516,'VLSI','20160020140'),(517,'CSD','20160020140'),(518,'DE','20160020140'),(519,'ITS_B','20160020142'),(520,'Digicomm','20160020142'),(521,'IR','20160020142'),(522,'CSD','20160020142'),(523,'DIP','20160020142'),(524,'STATS','20160020142'),(525,'ITS_A','20160020143'),(526,'Digicomm','20160020143'),(527,'EMT','20160020143'),(528,'VLSI','20160020143'),(529,'GE','20160020143'),(530,'FA','20160020143'),(531,'ITS_B','20160020144'),(532,'Digicomm','20160020144'),(533,'EMT','20160020144'),(534,'CSD','20160020144'),(535,'DIP','20160020144'),(536,'ITS_A','20160020149'),(537,'Digicomm','20160020149'),(538,'EMT','20160020149'),(539,'VLSI','20160020149'),(540,'LS','20160020149'),(541,'ITS_B','20160020153'),(542,'Digicomm','20160020153'),(543,'EMT','20160020153'),(544,'DIP','20160020153'),(545,'STATS','20160020153'),(546,'ITS_A','20160020154'),(547,'Digicomm','20160020154'),(548,'CSD','20160020154'),(549,'DIP','20160020154'),(550,'DE','20160020154'),(551,'LS','20160020154'),(552,'ITS_B','20160020155'),(553,'TOC','20160020155'),(554,'DM','20160020155'),(555,'IR','20160020155'),(556,'DIP','20160020155'),(557,'STATS','20160020155'),(558,'ITS_A','20160020158'),(559,'Digicomm','20160020158'),(560,'EMT','20160020158'),(561,'VLSI','20160020158'),(562,'DE','20160020158'),(563,'LS','20160020158'),(564,'ITS_B','20160020159'),(565,'Digicomm','20160020159'),(566,'EMT','20160020159'),(567,'VLSI','20160020159'),(568,'DE','20160020159'),(569,'LS','20160020159'),(570,'ITS_A','20160020160'),(571,'Digicomm','20160020160'),(572,'VLSI','20160020160'),(573,'DIP','20160020160'),(574,'STATS','20160020160'),(575,'ITS_B','20160020163'),(576,'Digicomm','20160020163'),(577,'VLSI','20160020163'),(578,'CSD','20160020163'),(579,'IOT','20160020163'),(580,'LS','20160020126'),(581,'ITS_A','20160020127'),(582,'Digicomm','20160020127'),(583,'VLSI','20160020127'),(584,'STATS','20160010086'),(585,'ITS_A','20160010089'),(586,'TOC','20160010089'),(587,'LS','20160010089'),(588,'IR','20160010089'),(589,'DIP','20160010089'),(590,'STATS','20160010089'),(591,'ITS_B','20160010090'),(592,'TOC','20160010090'),(593,'IR','20160010090'),(594,'DIP','20160010090'),(595,'STATS','20160010090'),(596,'GE','20160010090'),(597,'ITS_A','20160010091'),(598,'TOC','20160010091'),(599,'GE','20160010091'),(600,'CSD','20160010091'),(601,'IR','20160010091'),(602,'STATS','20160010091'),(603,'ITS_B','20160010093'),(604,'TOC','20160010093'),(605,'VLSI','20160010093'),(606,'LS','20160010093'),(607,'OS','20160010093'),(608,'CommSkills_3','20160010093'),(609,'ITS_A','20160010094'),(610,'TOC','20160010094'),(611,'IR','20160010094'),(612,'DIP','20160010094'),(613,'STATS','20160010094'),(614,'LS','20160010094'),(615,'ITS_B','20160010095'),(616,'TOC','20160010095'),(617,'IR','20160010095'),(618,'DIP','20160010095'),(619,'DM','20160010095'),(620,'STATS','20160010095'),(621,'ITS_A','20160010096'),(622,'TOC','20160010096'),(623,'IR','20160010096'),(624,'DIP','20160010096'),(625,'DM','20160010096'),(626,'DE','20160010096'),(627,'ITS_B','20160010097'),(628,'TOC','20160010097'),(629,'VLSI','20160010097'),(630,'CSD','20160010097'),(631,'DE','20160010097'),(632,'LS','20160010097'),(633,'ITS_A','20160010098'),(634,'TOC','20160010098'),(635,'IR','20160010098'),(636,'DIP','20160010098'),(637,'STATS','20160010098'),(638,'LS','20160010098'),(639,'ITS_B','20160010099'),(640,'TOC','20160010099'),(641,'TOC','20160010055'),(642,'IR','20160010055'),(643,'DIP','20160010055'),(644,'DM','20160010055'),(645,'STATS','20160010055'),(646,'ITS_A','20160010056'),(647,'TOC','20160010056'),(648,'DIP','20160010056'),(649,'STATS','20160010056'),(650,'GE','20160010056');
/*!40000 ALTER TABLE `timetable_student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_student_grade`
--

DROP TABLE IF EXISTS `timetable_student_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_student_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL,
  `c_name_id` varchar(250) NOT NULL,
  `student_id_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_student_gr_c_name_id_dd70ce01_fk_timetable` (`c_name_id`),
  KEY `timetable_student_gr_student_id_id_7d74ef51_fk_timetable` (`student_id_id`),
  CONSTRAINT `timetable_student_gr_c_name_id_dd70ce01_fk_timetable` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`),
  CONSTRAINT `timetable_student_gr_student_id_id_7d74ef51_fk_timetable` FOREIGN KEY (`student_id_id`) REFERENCES `timetable_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_student_grade`
--

LOCK TABLES `timetable_student_grade` WRITE;
/*!40000 ALTER TABLE `timetable_student_grade` DISABLE KEYS */;
INSERT INTO `timetable_student_grade` VALUES (1,8,'DSAA','20160010035'),(2,10,'Algo','20160010035'),(3,10,'PC','20160010035'),(4,9,'OS','20160010035'),(5,7,'CommSkills_1','20160010035'),(6,8,'decr','20160010035'),(7,8,'CommSkills_3','20160010035'),(8,6,'DE','20160010035'),(9,9,'TOC','20160010035'),(10,7,'Maths_3','20160010035'),(11,10,'OC','20160010035'),(12,8,'DMPT','20160010035'),(13,10,'ASE_1','20160010035'),(15,8,'IR','20160010035'),(16,9,'LS','20160010035'),(17,10,'DM','20160010035'),(18,6,'DSAA','20160010068'),(19,8,'Algo','20160010068'),(20,9,'PC','20160010068'),(21,10,'OS','20160010068'),(22,8,'CommSkills_1','20160010068'),(23,9,'decr','20160010068'),(24,9,'CommSkills_3','20160010068'),(25,7,'DE','20160010068'),(26,10,'TOC','20160010068'),(27,5,'Maths_3','20160010068'),(28,9,'OC','20160010068'),(29,4,'DMPT','20160010068'),(30,6,'ASE_1','20160010068'),(32,8,'DIP','20160010068'),(33,6,'CSD','20160010068'),(34,8,'GE','20160010068'),(35,9,'DMPT','20160010067'),(36,7,'PC','20160010067'),(37,9,'decr','20160010067'),(38,7,'OC','20160010067'),(39,8,'CommSkills_1','20160010067'),(40,8,'Maths_3','20160010067'),(41,8,'Algo','20160010067'),(42,8,'CommSkills_3','20160010067'),(43,9,'DSAA','20160010067'),(44,7,'OS','20160010067'),(45,8,'ASE_1','20160010067'),(46,10,'DMPT','20160010042'),(47,5,'PC','20160010042'),(48,9,'decr','20160010042'),(49,9,'OC','20160010042'),(50,7,'CommSkills_1','20160010042'),(51,6,'Maths_3','20160010042'),(52,10,'Algo','20160010042'),(53,8,'CommSkills_3','20160010042'),(54,5,'DSAA','20160010042'),(55,8,'OS','20160010042'),(56,4,'ASE_1','20160010042'),(57,7,'DMPT','20160010084'),(58,10,'PC','20160010084'),(59,6,'decr','20160010084'),(60,5,'OC','20160010084'),(61,9,'CommSkills_1','20160010084'),(62,8,'Maths_3','20160010084'),(63,7,'Algo','20160010084'),(64,8,'CommSkills_3','20160010084'),(65,10,'DSAA','20160010084'),(66,6,'OS','20160010084'),(67,9,'ASE_1','20160010084'),(68,8,'DMPT','20160010019'),(69,5,'PC','20160010019'),(70,10,'decr','20160010019'),(71,8,'OC','20160010019'),(72,9,'CommSkills_1','20160010019'),(73,8,'Maths_3','20160010019'),(74,6,'Algo','20160010019'),(75,7,'CommSkills_3','20160010019'),(76,9,'DSAA','20160010019'),(77,8,'OS','20160010019'),(78,8,'ASE_1','20160010019'),(79,8,'DSAA','20150010001'),(80,10,'Algo','20150010001'),(81,10,'PC','20150010001'),(82,9,'OS','20150010001'),(83,7,'CommSkills_1','20150010001'),(84,8,'decr','20150010001'),(85,8,'CommSkills_3','20150010001'),(86,6,'DE','20150010001'),(87,9,'TOC','20150010001'),(88,7,'Maths_3','20150010001'),(89,10,'OC','20150010001'),(90,8,'DMPT','20150010001'),(91,10,'ASE_1','20150010001'),(93,8,'IR','20150010001'),(94,9,'LS','20150010001'),(95,10,'DM','20150010001'),(126,9,'DMPT','20160020113'),(127,5,'PC','20160020113'),(128,4,'decr','20160020113'),(129,7,'OC','20160020113'),(130,8,'CommSkills_1','20160020113'),(131,10,'Maths_3','20160020113'),(132,7,'Algo','20160020113'),(133,5,'CommSkills_3','20160020113'),(134,9,'DSAA','20160020113'),(135,6,'OS','20160020113'),(136,7,'ASE_1','20160020113'),(137,7,'DSAA','20160010002'),(138,8,'OC','20160010002'),(139,8,'Algo','20160010002'),(140,9,'OS','20160010002'),(141,7,'ASE_1','20160010002'),(142,9,'CommSkills_1','20160010002'),(143,8,'CommSkills_3','20160010002'),(144,8,'decr','20160010002'),(145,9,'DMPT','20160010002'),(146,8,'Maths_3','20160010002'),(147,9,'PC','20160010002'),(148,9,'DSAA','20160010004'),(149,7,'OC','20160010004'),(150,8,'Algo','20160010004'),(151,8,'OS','20160010004'),(152,9,'ASE_1','20160010004'),(153,8,'CommSkills_1','20160010004'),(154,9,'CommSkills_3','20160010004'),(155,7,'decr','20160010004'),(156,8,'DMPT','20160010004'),(157,9,'Maths_3','20160010004'),(158,7,'PC','20160010004'),(159,8,'DSAA','20160010005'),(160,9,'OC','20160010005'),(161,7,'Algo','20160010005'),(162,9,'OS','20160010005'),(163,10,'ASE_1','20160010005'),(164,9,'CommSkills_1','20160010005'),(165,8,'CommSkills_3','20160010005'),(166,8,'decr','20160010005'),(167,7,'DMPT','20160010005'),(168,9,'Maths_3','20160010005'),(169,8,'PC','20160010005'),(170,10,'DSAA','20160010006'),(171,9,'OC','20160010006'),(172,6,'Algo','20160010006'),(173,8,'OS','20160010006'),(174,9,'ASE_1','20160010006'),(175,8,'CommSkills_1','20160010006'),(176,9,'CommSkills_3','20160010006'),(177,9,'decr','20160010006'),(178,8,'DMPT','20160010006'),(179,8,'Maths_3','20160010006'),(180,8,'PC','20160010006'),(181,9,'DSAA','20160010007'),(182,7,'OC','20160010007'),(183,8,'Algo','20160010007'),(184,7,'OS','20160010007'),(185,6,'ASE_1','20160010007'),(186,9,'CommSkills_1','20160010007'),(187,7,'CommSkills_3','20160010007'),(188,9,'decr','20160010007'),(189,7,'DMPT','20160010007'),(190,9,'Maths_3','20160010007'),(191,7,'PC','20160010007'),(192,6,'DSAA','20160010009'),(193,8,'OC','20160010009'),(194,7,'Algo','20160010009'),(195,8,'OS','20160010009'),(196,7,'ASE_1','20160010009'),(197,8,'CommSkills_1','20160010009'),(198,8,'CommSkills_3','20160010009'),(199,9,'decr','20160010009'),(200,8,'DMPT','20160010009'),(201,8,'Maths_3','20160010009'),(202,10,'PC','20160010009'),(203,9,'DSAA','20160010011'),(204,7,'OC','20160010011'),(205,8,'Algo','20160010011'),(206,9,'OS','20160010011'),(207,8,'ASE_1','20160010011'),(208,9,'CommSkills_1','20160010011'),(209,10,'CommSkills_3','20160010011'),(210,8,'decr','20160010011'),(211,9,'DMPT','20160010011'),(212,9,'Maths_3','20160010011'),(213,9,'PC','20160010011'),(214,7,'DSAA','20160010013'),(215,8,'OC','20160010013'),(216,9,'Algo','20160010013'),(217,8,'OS','20160010013'),(218,9,'ASE_1','20160010013'),(219,8,'CommSkills_1','20160010013'),(220,9,'CommSkills_3','20160010013'),(221,7,'decr','20160010013'),(222,9,'DMPT','20160010013'),(223,8,'Maths_3','20160010013'),(224,7,'PC','20160010013'),(225,8,'DSAA','20160010015'),(226,9,'OC','20160010015'),(227,8,'Algo','20160010015'),(228,9,'OS','20160010015'),(229,8,'ASE_1','20160010015'),(230,9,'CommSkills_1','20160010015'),(231,10,'CommSkills_3','20160010015'),(232,8,'decr','20160010015'),(233,8,'DMPT','20160010015'),(234,9,'Maths_3','20160010015'),(235,8,'PC','20160010015'),(236,9,'DSAA','20160010016'),(237,8,'OC','20160010016'),(238,10,'Algo','20160010016'),(239,10,'OS','20160010016'),(240,9,'ASE_1','20160010016'),(241,8,'CommSkills_1','20160010016'),(242,9,'CommSkills_3','20160010016'),(243,8,'decr','20160010016'),(244,7,'DMPT','20160010016'),(245,8,'Maths_3','20160010016'),(246,9,'PC','20160010016'),(247,8,'DSAA','20160010018'),(248,9,'OC','20160010018'),(249,10,'Algo','20160010018'),(250,9,'OS','20160010018'),(251,8,'ASE_1','20160010018'),(252,9,'CommSkills_1','20160010018'),(253,8,'CommSkills_3','20160010018'),(254,9,'decr','20160010018'),(255,8,'DMPT','20160010018'),(256,9,'Maths_3','20160010018'),(257,9,'PC','20160010018'),(258,9,'DSAA','20160010021'),(259,8,'OC','20160010021'),(260,9,'Algo','20160010021'),(261,8,'OS','20160010021'),(262,9,'ASE_1','20160010021'),(263,10,'CommSkills_1','20160010021'),(264,8,'CommSkills_3','20160010021'),(265,8,'decr','20160010021'),(266,7,'DMPT','20160010021'),(267,8,'Maths_3','20160010021'),(268,8,'PC','20160010021'),(269,9,'DSAA','20160010022'),(270,8,'OC','20160010022'),(271,9,'Algo','20160010022'),(272,8,'OS','20160010022'),(273,9,'ASE_1','20160010022'),(274,10,'CommSkills_1','20160010022'),(275,8,'CommSkills_3','20160010022'),(276,8,'decr','20160010022'),(277,7,'DMPT','20160010022'),(278,8,'Maths_3','20160010022'),(279,8,'PC','20160010022'),(280,6,'DSAA','20160010026'),(281,7,'OC','20160010026'),(282,8,'Algo','20160010026'),(283,7,'OS','20160010026'),(284,7,'ASE_1','20160010026'),(285,8,'CommSkills_1','20160010026'),(286,7,'CommSkills_3','20160010026'),(287,6,'decr','20160010026'),(288,8,'DMPT','20160010026'),(289,8,'Maths_3','20160010026'),(290,9,'PC','20160010026'),(291,7,'DSAA','20160010030'),(292,8,'OC','20160010030'),(293,8,'Algo','20160010030'),(294,9,'OS','20160010030'),(295,7,'ASE_1','20160010030'),(296,9,'CommSkills_1','20160010030'),(297,7,'CommSkills_3','20160010030'),(298,7,'decr','20160010030'),(299,8,'DMPT','20160010030'),(300,7,'Maths_3','20160010030'),(301,7,'PC','20160010030'),(302,7,'DSAA','20160010034'),(303,6,'OC','20160010034'),(304,7,'Algo','20160010034'),(305,8,'OS','20160010034'),(306,7,'ASE_1','20160010034'),(307,8,'CommSkills_1','20160010034'),(308,9,'CommSkills_3','20160010034'),(309,7,'decr','20160010034'),(310,8,'DMPT','20160010034'),(311,9,'Maths_3','20160010034'),(312,8,'PC','20160010034'),(324,7,'DSAA','20160010036'),(325,6,'OC','20160010036'),(326,8,'Algo','20160010036'),(327,5,'OS','20160010036'),(328,7,'ASE_1','20160010036'),(329,7,'CommSkills_1','20160010036'),(330,5,'CommSkills_3','20160010036'),(331,8,'decr','20160010036'),(332,7,'DMPT','20160010036'),(333,5,'Maths_3','20160010036'),(334,6,'PC','20160010036'),(335,7,'DSAA','20160010037'),(336,8,'OC','20160010037'),(337,8,'Algo','20160010037'),(340,9,'OS','20160010037'),(341,7,'ASE_1','20160010037'),(342,6,'CommSkills_1','20160010037'),(343,7,'CommSkills_3','20160010037'),(344,7,'decr','20160010037'),(345,9,'DMPT','20160010037'),(346,8,'Maths_3','20160010037'),(347,9,'PC','20160010037'),(348,6,'DSAA','20160010038'),(349,8,'OC','20160010038'),(350,7,'Algo','20160010038'),(351,6,'OS','20160010038'),(352,8,'ASE_1','20160010038'),(353,7,'CommSkills_1','20160010038'),(354,8,'CommSkills_3','20160010038'),(356,7,'decr','20160010038'),(357,8,'DMPT','20160010038'),(358,5,'Maths_3','20160010038'),(359,9,'PC','20160010038'),(360,7,'DSAA','20160010040'),(361,6,'OC','20160010040'),(362,5,'Algo','20160010040'),(363,8,'OS','20160010040'),(364,7,'ASE_1','20160010040'),(365,9,'CommSkills_1','20160010040'),(366,9,'CommSkills_3','20160010040'),(367,7,'decr','20160010040'),(368,7,'DMPT','20160010040'),(369,8,'Maths_3','20160010040'),(370,7,'PC','20160010040'),(371,7,'DSAA','20160010041'),(372,6,'OC','20160010041'),(373,5,'Algo','20160010041'),(374,7,'OS','20160010041'),(375,7,'ASE_1','20160010041'),(376,9,'CommSkills_1','20160010041'),(377,9,'CommSkills_3','20160010041'),(378,7,'decr','20160010041'),(379,7,'DMPT','20160010041'),(380,8,'Maths_3','20160010041'),(381,7,'PC','20160010041'),(393,7,'DSAA','20160010044'),(394,6,'OC','20160010044'),(395,8,'Algo','20160010044'),(396,9,'OS','20160010044'),(397,7,'ASE_1','20160010044'),(398,8,'CommSkills_1','20160010044'),(399,8,'CommSkills_3','20160010044'),(400,7,'decr','20160010044'),(401,8,'DMPT','20160010044'),(402,7,'Maths_3','20160010044'),(403,7,'PC','20160010044'),(404,7,'DSAA','20160010045'),(405,7,'OC','20160010045'),(406,7,'Algo','20160010045'),(407,8,'OS','20160010045'),(408,7,'ASE_1','20160010045'),(409,9,'CommSkills_1','20160010045'),(410,7,'CommSkills_3','20160010045'),(411,7,'decr','20160010045'),(412,8,'DMPT','20160010045'),(413,7,'Maths_3','20160010045'),(414,7,'PC','20160010045'),(415,9,'DSAA','20160010047'),(416,9,'OC','20160010047'),(417,7,'Algo','20160010047'),(418,8,'OS','20160010047'),(419,7,'ASE_1','20160010047'),(420,8,'CommSkills_1','20160010047'),(421,8,'CommSkills_3','20160010047'),(422,7,'decr','20160010047'),(423,8,'DMPT','20160010047'),(424,9,'Maths_3','20160010047'),(425,7,'PC','20160010047'),(426,7,'DSAA','20160010048'),(427,8,'OC','20160010048'),(428,8,'Algo','20160010048'),(429,7,'OS','20160010048'),(430,9,'ASE_1','20160010048'),(431,9,'CommSkills_1','20160010048'),(432,8,'CommSkills_3','20160010048'),(433,7,'decr','20160010048'),(434,8,'DMPT','20160010048'),(435,7,'Maths_3','20160010048'),(436,7,'PC','20160010048'),(437,10,'DSAA','20160010049'),(438,8,'OC','20160010049'),(439,8,'Algo','20160010049'),(440,9,'OS','20160010049'),(441,7,'ASE_1','20160010049'),(442,9,'CommSkills_1','20160010049'),(443,7,'CommSkills_3','20160010049'),(444,7,'decr','20160010049'),(445,9,'DMPT','20160010049'),(446,8,'Maths_3','20160010049'),(447,10,'PC','20160010049'),(448,8,'DSAA','20160010051'),(449,8,'OC','20160010051'),(450,8,'Algo','20160010051'),(451,9,'OS','20160010051'),(452,10,'ASE_1','20160010051'),(453,9,'CommSkills_1','20160010051'),(454,7,'CommSkills_3','20160010051'),(456,9,'decr','20160010051'),(457,10,'DMPT','20160010051'),(458,8,'Maths_3','20160010051'),(459,9,'PC','20160010051'),(460,10,'DSAA','20160010052'),(461,9,'OC','20160010052'),(462,8,'Algo','20160010052'),(463,10,'OS','20160010052'),(464,6,'ASE_1','20160010052'),(465,8,'CommSkills_1','20160010052'),(466,8,'CommSkills_3','20160010052'),(467,9,'decr','20160010052'),(468,8,'DMPT','20160010052'),(469,9,'Maths_3','20160010052'),(470,7,'PC','20160010052'),(471,6,'DSAA','20160010054'),(472,6,'OC','20160010054'),(473,10,'Algo','20160010054'),(474,9,'OS','20160010054'),(475,6,'ASE_1','20160010054'),(476,8,'CommSkills_1','20160010054'),(477,8,'CommSkills_3','20160010054'),(478,9,'decr','20160010054'),(479,8,'DMPT','20160010054'),(480,7,'Maths_3','20160010054'),(481,9,'PC','20160010054'),(482,5,'DSAA','20160010055'),(483,10,'OC','20160010055'),(484,8,'Algo','20160010055'),(485,9,'OS','20160010055'),(486,7,'ASE_1','20160010055'),(487,8,'CommSkills_1','20160010055'),(488,8,'CommSkills_3','20160010055'),(489,7,'decr','20160010055'),(490,10,'DMPT','20160010055'),(491,9,'Maths_3','20160010055'),(492,10,'PC','20160010055'),(493,7,'DSAA','20160010056'),(494,10,'OC','20160010056'),(495,8,'Algo','20160010056'),(496,9,'OS','20160010056'),(497,6,'ASE_1','20160010056'),(498,6,'CommSkills_1','20160010056'),(499,8,'CommSkills_3','20160010056'),(500,10,'decr','20160010056'),(501,8,'DMPT','20160010056'),(502,7,'Maths_3','20160010056'),(503,10,'PC','20160010056'),(504,9,'DSAA','20160010057'),(505,8,'OC','20160010057'),(506,8,'Algo','20160010057'),(507,10,'OS','20160010057'),(508,7,'ASE_1','20160010057'),(509,10,'CommSkills_1','20160010057'),(510,8,'CommSkills_3','20160010057'),(511,9,'decr','20160010057'),(512,10,'DMPT','20160010057'),(513,10,'Maths_3','20160010057'),(514,7,'PC','20160010057'),(515,5,'DSAA','20160010058'),(516,10,'OC','20160010058'),(517,8,'Algo','20160010058'),(518,9,'OS','20160010058'),(519,8,'ASE_1','20160010058'),(520,9,'CommSkills_1','20160010058'),(521,8,'CommSkills_3','20160010058'),(522,9,'decr','20160010058'),(523,8,'DMPT','20160010058'),(524,7,'Maths_3','20160010058'),(525,10,'PC','20160010058'),(526,7,'DSAA','20160010059'),(527,6,'OC','20160010059'),(528,8,'Algo','20160010059'),(529,9,'OS','20160010059'),(530,8,'ASE_1','20160010059'),(531,8,'CommSkills_1','20160010059'),(532,8,'CommSkills_3','20160010059'),(533,7,'decr','20160010059'),(534,8,'DMPT','20160010059'),(535,7,'Maths_3','20160010059'),(536,8,'PC','20160010059'),(537,9,'DSAA','20160010060'),(538,6,'OC','20160010060'),(539,10,'Algo','20160010060'),(540,10,'OS','20160010060'),(541,8,'ASE_1','20160010060'),(542,9,'CommSkills_1','20160010060'),(543,10,'CommSkills_3','20160010060'),(544,8,'decr','20160010060'),(545,9,'DMPT','20160010060'),(546,9,'Maths_3','20160010060'),(547,7,'PC','20160010060'),(548,10,'DSAA','20160010063'),(549,8,'OC','20160010063'),(550,8,'Algo','20160010063'),(551,9,'OS','20160010063'),(552,9,'ASE_1','20160010063'),(553,8,'CommSkills_1','20160010063'),(554,8,'CommSkills_3','20160010063'),(555,7,'decr','20160010063'),(556,8,'DMPT','20160010063'),(557,7,'Maths_3','20160010063'),(558,7,'PC','20160010063'),(559,7,'DSAA','20160010081'),(560,6,'OC','20160010081'),(561,8,'Algo','20160010081'),(562,9,'OS','20160010081'),(563,10,'ASE_1','20160010081'),(564,8,'CommSkills_1','20160010081'),(565,10,'CommSkills_3','20160010081'),(566,9,'decr','20160010081'),(567,8,'DMPT','20160010081'),(568,9,'Maths_3','20160010081'),(569,7,'PC','20160010081'),(570,7,'DSAA','20160010086'),(571,10,'OC','20160010086'),(572,8,'Algo','20160010086'),(573,9,'OS','20160010086'),(574,7,'ASE_1','20160010086'),(575,6,'CommSkills_1','20160010086'),(576,8,'CommSkills_3','20160010086'),(577,10,'decr','20160010086'),(578,10,'DMPT','20160010086'),(579,9,'Maths_3','20160010086'),(580,7,'PC','20160010086'),(581,9,'DSAA','20160010069'),(582,9,'OC','20160010069'),(583,8,'Algo','20160010069'),(584,6,'OS','20160010069'),(585,7,'ASE_1','20160010069'),(586,8,'CommSkills_1','20160010069'),(587,8,'CommSkills_3','20160010069'),(588,7,'decr','20160010069'),(589,8,'DMPT','20160010069'),(590,7,'Maths_3','20160010069'),(591,9,'PC','20160010069'),(592,7,'DSAA','20160010073'),(593,8,'OC','20160010073'),(594,8,'Algo','20160010073'),(595,9,'OS','20160010073'),(596,7,'ASE_1','20160010073'),(597,8,'CommSkills_1','20160010073'),(598,8,'CommSkills_3','20160010073'),(599,7,'decr','20160010073'),(600,9,'DMPT','20160010073'),(601,10,'Maths_3','20160010073'),(602,9,'PC','20160010073'),(603,9,'DSAA','20160010077'),(604,9,'OC','20160010077'),(605,8,'Algo','20160010077'),(606,9,'OS','20160010077'),(607,10,'ASE_1','20160010077'),(608,6,'CommSkills_1','20160010077'),(609,8,'CommSkills_3','20160010077'),(610,7,'decr','20160010077'),(611,8,'DMPT','20160010077'),(612,7,'Maths_3','20160010077'),(613,5,'PC','20160010077'),(614,7,'DSAA','20160010078'),(615,6,'OC','20160010078'),(616,8,'Algo','20160010078'),(617,6,'OS','20160010078'),(618,7,'ASE_1','20160010078'),(619,8,'CommSkills_1','20160010078'),(620,8,'CommSkills_3','20160010078'),(621,9,'decr','20160010078'),(622,8,'DMPT','20160010078'),(623,7,'Maths_3','20160010078'),(624,7,'PC','20160010078'),(625,7,'DSAA','20160010080'),(626,6,'OC','20160010080'),(627,8,'Algo','20160010080'),(628,9,'OS','20160010080'),(629,7,'ASE_1','20160010080'),(630,8,'CommSkills_1','20160010080'),(631,8,'CommSkills_3','20160010080'),(632,7,'decr','20160010080'),(633,8,'DMPT','20160010080'),(634,7,'Maths_3','20160010080'),(635,5,'PC','20160010080'),(636,7,'DSAA','20160010089'),(637,9,'OC','20160010089'),(638,10,'Algo','20160010089'),(639,7,'OS','20160010089'),(640,7,'ASE_1','20160010089'),(641,8,'CommSkills_1','20160010089'),(642,8,'CommSkills_3','20160010089'),(643,7,'decr','20160010089'),(644,8,'DMPT','20160010089'),(645,7,'Maths_3','20160010089'),(646,10,'PC','20160010089'),(647,10,'DSAA','20160010090'),(648,7,'OC','20160010090'),(649,8,'Algo','20160010090'),(650,9,'OS','20160010090'),(651,7,'ASE_1','20160010090'),(652,8,'CommSkills_1','20160010090'),(653,8,'CommSkills_3','20160010090'),(654,10,'decr','20160010090'),(655,10,'DMPT','20160010090'),(656,9,'Maths_3','20160010090'),(657,7,'PC','20160010090'),(658,6,'DSAA','20160010091'),(659,8,'OC','20160010091'),(660,8,'Algo','20160010091'),(661,9,'OS','20160010091'),(662,8,'ASE_1','20160010091'),(663,10,'CommSkills_1','20160010091'),(664,8,'CommSkills_3','20160010091'),(665,7,'decr','20160010091'),(666,8,'DMPT','20160010091'),(667,7,'Maths_3','20160010091'),(668,5,'PC','20160010091'),(669,7,'DSAA','20160010093'),(670,6,'OC','20160010093'),(671,10,'Algo','20160010093'),(672,9,'OS','20160010093'),(673,7,'ASE_1','20160010093'),(674,8,'CommSkills_1','20160010093'),(675,8,'CommSkills_3','20160010093'),(676,9,'decr','20160010093'),(677,8,'DMPT','20160010093'),(678,9,'Maths_3','20160010093'),(679,5,'PC','20160010093'),(680,9,'DSAA','20160010094'),(681,6,'OC','20160010094'),(682,8,'Algo','20160010094'),(683,9,'OS','20160010094'),(684,10,'ASE_1','20160010094'),(685,8,'CommSkills_1','20160010094'),(686,8,'CommSkills_3','20160010094'),(687,7,'decr','20160010094'),(688,8,'DMPT','20160010094'),(689,7,'Maths_3','20160010094'),(690,5,'PC','20160010094'),(691,9,'DSAA','20160010095'),(692,8,'OC','20160010095'),(693,8,'Algo','20160010095'),(694,9,'OS','20160010095'),(695,9,'ASE_1','20160010095'),(696,8,'CommSkills_1','20160010095'),(697,8,'CommSkills_3','20160010095'),(698,7,'decr','20160010095'),(699,8,'DMPT','20160010095'),(700,10,'Maths_3','20160010095'),(701,9,'PC','20160010095'),(702,10,'DSAA','20160010096'),(703,9,'OC','20160010096'),(704,7,'Algo','20160010096'),(705,8,'OS','20160010096'),(706,7,'ASE_1','20160010096'),(707,8,'CommSkills_1','20160010096'),(708,8,'CommSkills_3','20160010096'),(709,10,'decr','20160010096'),(710,8,'DMPT','20160010096'),(711,10,'Maths_3','20160010096'),(712,9,'PC','20160010096'),(713,10,'DSAA','20160010097'),(714,10,'OC','20160010097'),(715,9,'Algo','20160010097'),(716,8,'OS','20160010097'),(717,7,'ASE_1','20160010097'),(718,8,'CommSkills_1','20160010097'),(719,7,'CommSkills_3','20160010097'),(720,10,'decr','20160010097'),(721,8,'DMPT','20160010097'),(722,10,'Maths_3','20160010097'),(723,9,'PC','20160010097'),(724,10,'DSAA','20160010098'),(725,7,'OC','20160010098'),(726,8,'Algo','20160010098'),(727,8,'OS','20160010098'),(728,7,'ASE_1','20160010098'),(729,8,'CommSkills_1','20160010098'),(730,8,'CommSkills_3','20160010098'),(731,10,'decr','20160010098'),(732,8,'DMPT','20160010098'),(733,10,'Maths_3','20160010098'),(734,9,'PC','20160010098'),(735,9,'DSAA','20160010099'),(736,8,'OC','20160010099'),(737,7,'Algo','20160010099'),(738,8,'OS','20160010099'),(739,9,'ASE_1','20160010099'),(740,8,'CommSkills_1','20160010099'),(741,8,'CommSkills_3','20160010099'),(742,9,'decr','20160010099'),(743,7,'DMPT','20160010099'),(744,10,'Maths_3','20160010099'),(745,9,'PC','20160010099'),(746,8,'DSAA','20160010100'),(747,9,'OC','20160010100'),(748,7,'Algo','20160010100'),(749,8,'OS','20160010100'),(750,9,'ASE_1','20160010100'),(751,8,'CommSkills_1','20160010100'),(752,7,'CommSkills_3','20160010100'),(753,7,'decr','20160010100'),(754,8,'DMPT','20160010100'),(755,10,'Maths_3','20160010100'),(756,9,'PC','20160010100'),(757,8,'DSAA','20160010104'),(758,7,'OC','20160010104'),(759,8,'Algo','20160010104'),(760,8,'OS','20160010104'),(761,7,'ASE_1','20160010104'),(762,8,'CommSkills_1','20160010104'),(763,8,'CommSkills_3','20160010104'),(764,10,'decr','20160010104'),(765,8,'DMPT','20160010104'),(766,10,'Maths_3','20160010104'),(767,9,'PC','20160010104'),(768,8,'DSAA','20160010105'),(769,7,'OC','20160010105'),(770,8,'Algo','20160010105'),(771,8,'OS','20160010105'),(772,7,'ASE_1','20160010105'),(773,8,'CommSkills_1','20160010105'),(774,8,'CommSkills_3','20160010105'),(775,10,'decr','20160010105'),(776,8,'DMPT','20160010105'),(777,10,'Maths_3','20160010105'),(778,9,'PC','20160010105'),(779,8,'DSAA','20160010106'),(780,7,'OC','20160010106'),(781,9,'Algo','20160010106'),(782,7,'OS','20160010106'),(783,7,'ASE_1','20160010106'),(784,8,'CommSkills_1','20160010106'),(785,8,'CommSkills_3','20160010106'),(786,10,'decr','20160010106'),(787,8,'DMPT','20160010106'),(788,10,'Maths_3','20160010106'),(789,9,'PC','20160010106'),(790,9,'DSAA','20160010107'),(791,7,'OC','20160010107'),(792,8,'Algo','20160010107'),(793,8,'OS','20160010107'),(794,7,'ASE_1','20160010107'),(795,8,'CommSkills_1','20160010107'),(796,9,'CommSkills_3','20160010107'),(797,9,'decr','20160010107'),(798,8,'DMPT','20160010107'),(799,7,'Maths_3','20160010107'),(800,9,'PC','20160010107'),(801,8,'DSAA','20160010145'),(802,8,'OC','20160010145'),(803,8,'Algo','20160010145'),(804,8,'OS','20160010145'),(805,9,'ASE_1','20160010145'),(806,8,'CommSkills_1','20160010145'),(807,8,'CommSkills_3','20160010145'),(808,10,'decr','20160010145'),(809,8,'DMPT','20160010145'),(810,10,'Maths_3','20160010145'),(811,9,'PC','20160010145'),(812,8,'DSAA','20160020147'),(813,9,'OC','20160020147'),(814,8,'Algo','20160020147'),(815,8,'OS','20160020147'),(816,7,'ASE_1','20160020147'),(817,8,'CommSkills_1','20160020147'),(818,8,'CommSkills_3','20160020147'),(819,10,'decr','20160020147'),(820,8,'DMPT','20160020147'),(821,10,'Maths_3','20160020147'),(822,9,'PC','20160020147'),(823,8,'DSAA','20160020148'),(824,7,'OC','20160020148'),(825,10,'Algo','20160020148'),(826,9,'OS','20160020148'),(827,7,'ASE_1','20160020148'),(828,8,'CommSkills_1','20160020148'),(829,8,'CommSkills_3','20160020148'),(830,10,'decr','20160020148'),(831,8,'DMPT','20160020148'),(832,10,'Maths_3','20160020148'),(833,9,'PC','20160020148'),(834,8,'DSAA','20160020138'),(835,7,'OC','20160020138'),(836,8,'Algo','20160020138'),(837,8,'OS','20160020138'),(838,9,'ASE_1','20160020138'),(839,8,'CommSkills_1','20160020138'),(840,8,'CommSkills_3','20160020138'),(841,10,'decr','20160020138'),(842,8,'DMPT','20160020138'),(843,10,'Maths_3','20160020138'),(844,9,'PC','20160020138');
/*!40000 ALTER TABLE `timetable_student_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_ta_alloc`
--

DROP TABLE IF EXISTS `timetable_ta_alloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_ta_alloc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name_id` varchar(250) NOT NULL,
  `student_id_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_ta_alloc_c_name_id_4e390470_fk_timetable_course_c_name` (`c_name_id`),
  KEY `timetable_ta_alloc_student_id_id_f8056d12_fk_timetable` (`student_id_id`),
  CONSTRAINT `timetable_ta_alloc_c_name_id_4e390470_fk_timetable_course_c_name` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`),
  CONSTRAINT `timetable_ta_alloc_student_id_id_f8056d12_fk_timetable` FOREIGN KEY (`student_id_id`) REFERENCES `timetable_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_ta_alloc`
--

LOCK TABLES `timetable_ta_alloc` WRITE;
/*!40000 ALTER TABLE `timetable_ta_alloc` DISABLE KEYS */;
INSERT INTO `timetable_ta_alloc` VALUES (1,'DSAA','20160010084'),(2,'DSAA','20160020113'),(3,'DSAA','20160010067');
/*!40000 ALTER TABLE `timetable_ta_alloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_timetable`
--

DROP TABLE IF EXISTS `timetable_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(50) NOT NULL,
  `class_type` int(11) DEFAULT NULL,
  `rid` int(11) NOT NULL,
  `c_name_id` varchar(250) NOT NULL,
  `slot_no_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timetable_timetable_slot_no_id_day_c_name_id_rid_b8bc51cb_uniq` (`slot_no_id`,`day`,`c_name_id`,`rid`),
  KEY `timetable_timetable_c_name_id_2f74c078_fk_timetable` (`c_name_id`),
  CONSTRAINT `timetable_timetable_c_name_id_2f74c078_fk_timetable` FOREIGN KEY (`c_name_id`) REFERENCES `timetable_course` (`c_name`),
  CONSTRAINT `timetable_timetable_slot_no_id_412f5d93_fk_timetable` FOREIGN KEY (`slot_no_id`) REFERENCES `timetable_slot_timings` (`slot_no`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_timetable`
--

LOCK TABLES `timetable_timetable` WRITE;
/*!40000 ALTER TABLE `timetable_timetable` DISABLE KEYS */;
INSERT INTO `timetable_timetable` VALUES (1,'Monday',3,221,'ASE_1',8),(2,'Monday',3,221,'ASE_1',9),(3,'Monday',3,221,'ASE_1',10),(4,'Tuesday',3,223,'decr',8),(5,'Tuesday',3,223,'decr',9),(6,'Tuesday',3,223,'decr',10),(7,'Friday',3,221,'DSAA',8),(8,'Friday',3,221,'DSAA',9),(9,'Friday',3,221,'DSAA',10),(10,'Wednesday',3,221,'OC',8),(11,'Wednesday',3,221,'OC',9),(12,'Wednesday',3,221,'OC',10),(13,'Saturday',3,221,'PC',8),(14,'Saturday',3,221,'PC',9),(15,'Saturday',3,221,'PC',10),(16,'Monday',1,103,'ITS_A',9),(17,'Monday',0,103,'TOC',4),(18,'Wednesday',0,115,'Digicomm',7),(19,'Monday',0,101,'EMT',1),(20,'Tuesday',0,115,'VLSI',8),(21,'Tuesday',0,105,'CSD',11),(22,'Wednesday',0,101,'IR',5),(23,'Wednesday',0,101,'IOT',4),(24,'Monday',0,101,'DIP',8),(25,'Monday',0,107,'DM',2),(26,'Monday',0,101,'MERS',5),(27,'Monday',0,115,'STATS',2),(28,'Tuesday',0,101,'DE',10),(29,'Monday',0,113,'GE',5),(30,'Monday',0,115,'LS',7),(31,'Tuesday',0,103,'FA',7),(32,'Monday',0,105,'YW',4),(33,'Tuesday',0,101,'APT',8),(34,'Thursday',0,107,'OS',2),(35,'Monday',0,115,'DSAA',11),(36,'Monday',0,115,'Maths_3',4),(37,'Saturday',0,113,'CommSkills_3',7),(38,'Wednesday',0,105,'Algo',9),(39,'Monday',0,103,'ASE_1',2),(40,'Wednesday',0,105,'PC',2),(41,'Monday',0,115,'DMPT',5),(42,'Saturday',0,101,'CommSkills_1',1),(43,'Wednesday',0,101,'OC',7),(44,'Tuesday',0,107,'decr',1),(45,'Tuesday',2,103,'ITS_B',10),(46,'Wednesday',1,115,'ITS_A',11),(47,'Saturday',0,113,'TOC',8),(48,'Friday',0,115,'Digicomm',4),(49,'Friday',0,103,'EMT',7),(50,'Wednesday',0,103,'VLSI',1),(51,'Thursday',0,105,'CSD',10),(52,'Friday',0,113,'IR',9),(53,'Friday',0,103,'IOT',2),(54,'Tuesday',0,113,'DIP',7),(55,'Saturday',0,107,'DM',5),(56,'Friday',0,115,'MERS',5),(57,'Wednesday',0,113,'STATS',1),(58,'Friday',0,103,'DE',11),(59,'Tuesday',0,101,'GE',2),(60,'Tuesday',0,107,'LS',11),(61,'Thursday',0,113,'FA',11),(62,'Wednesday',0,115,'YW',2),(63,'Thursday',0,101,'APT',5),(64,'Friday',0,101,'OS',11),(65,'Tuesday',0,103,'DSAA',4),(66,'Tuesday',0,107,'Maths_3',2),(67,'Tuesday',0,107,'CommSkills_3',9),(68,'Thursday',0,103,'Algo',10),(69,'Wednesday',0,105,'ASE_1',5),(70,'Friday',0,107,'PC',2),(71,'Tuesday',0,115,'DMPT',2),(72,'Tuesday',0,115,'CommSkills_1',7),(73,'Friday',0,107,'OC',9),(74,'Wednesday',0,103,'decr',5),(75,'Wednesday',2,103,'ITS_B',9),(76,'Thursday',1,115,'ITS_A',2),(77,'Friday',0,105,'TOC',1),(78,'Saturday',0,113,'Digicomm',11),(79,'Saturday',0,107,'EMT',10),(80,'Saturday',0,105,'VLSI',5),(81,'Friday',0,103,'CSD',5),(82,'Saturday',0,101,'IR',2),(83,'Thursday',0,103,'IOT',5),(84,'Friday',0,113,'DIP',2),(85,'Saturday',0,101,'MERS',4),(86,'Friday',0,103,'STATS',8),(87,'Thursday',0,107,'DE',5),(88,'Friday',0,107,'GE',10),(89,'Saturday',0,105,'LS',1),(90,'Saturday',0,101,'FA',10),(91,'Thursday',0,103,'YW',4),(92,'Saturday',0,101,'APT',5),(93,'Monday',0,103,'OS',5),(94,'Friday',0,105,'DSAA',5),(95,'Friday',0,101,'Maths_3',1),(96,'Thursday',0,105,'CommSkills_3',4),(97,'Friday',0,113,'Algo',4),(98,'Thursday',0,105,'ASE_1',8),(99,'Friday',0,113,'DMPT',1),(100,'Thursday',0,107,'CommSkills_1',7),(101,'Saturday',0,105,'OC',2),(102,'Saturday',0,101,'decr',7),(103,'Saturday',2,105,'ITS_B',9),(104,'Monday',0,115,'DM',1),(105,'Wednesday',0,101,'PC',1),(106,'Wednesday',0,101,'Digicomm',2),(107,'Wednesday',0,115,'Algo',8),(108,'Monday',0,101,'DMPT',2),(109,'Tuesday',2,105,'ITS_B',9),(110,'Saturday',0,107,'TOC',4),(111,'Tuesday',0,115,'Maths_3',1),(112,'Thursday',1,101,'ITS_A',9);
/*!40000 ALTER TABLE `timetable_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_user`
--

DROP TABLE IF EXISTS `timetable_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `token` varchar(1000) NOT NULL,
  `user_type` smallint(5) unsigned NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_user`
--

LOCK TABLES `timetable_user` WRITE;
/*!40000 ALTER TABLE `timetable_user` DISABLE KEYS */;
INSERT INTO `timetable_user` VALUES (1,'pbkdf2_sha256$120000$oLmWzKQE0sCg$Z9ZbqNmrTcHBWtrF60dB6b3aA6TFMavRSV1zL+hbyLM=','2018-12-11 02:22:20.714709',0,'viswanath.p@iiits.in','viswanath','p','',2,0,1),(2,'pbkdf2_sha256$120000$XJ1Mo8J38Y61$Ul6fU2nmNceO82GSt12r//L6iMEclRUEb4YjaCo1zJs=','2018-12-11 02:24:27.564299',0,'snehasis.mukherjee@iiits.in','snehasis','mukherjee','',2,0,1),(3,'pbkdf2_sha256$120000$Z4vQw17lqCEj$ly1Gxgy3CZyc67eOl8pXsr0cFZHoROT6g3fwGu5qUp8=','2018-12-11 03:10:18.185719',0,'venkatesh.v@iiits.in','venkatesh','vinayakrao','',2,0,1),(4,'pbkdf2_sha256$120000$9dVdOB0BqYhN$j11dyUhYvyKDygHMyLwrIp/ak1ibdMuSms496qXWDMM=','2018-12-11 03:13:08.725222',0,'siva.k@iiits.in','sivaprasad','kotamaraju','',2,0,1),(5,'pbkdf2_sha256$120000$f8uW5iubrlme$HpycdRCOfRFojA8bl0+9ImAwmZhD7e5RgP4sNIHM8as=','2018-12-11 03:15:13.324814',0,'srdubey@iiits.in','shivram','dubey','',2,0,1),(6,'pbkdf2_sha256$120000$fYY7WwAXJyJ3$MgZ3/GpUk+td5GuZiJX5n80xvHAVv8hHui9/NzXaI0k=','2018-12-11 03:16:29.231164',0,'sukanya.s@iiits.in','sukanya','s','',2,0,1),(7,'pbkdf2_sha256$120000$0bcVjkaV0MmH$wqIdSf+UuCV/5iljFCBPBJVsPGQb/er+vYSi0tYygMo=','2018-11-16 20:40:54.447905',0,'anupama.n@iiits.in','anupama','n','',2,0,1),(8,'pbkdf2_sha256$120000$i0wazS8hcHMk$8Druc83cKF4jfjuIJVDnO5iyzL0PMhgCU6O5Leusx+Y=','2018-12-11 03:17:08.322374',0,'rangeet.mitra@iiits.in','rangeet','mitra','',2,0,1),(9,'pbkdf2_sha256$120000$70z2DfxsOOwo$wddoSUbix74dH7GYZGP9qdWJwgsQHEAzdBXmSpU/IkY=','2018-12-11 03:18:29.609182',0,'rajendra.prasath@iiits.in','rajendra','prasath','',2,0,1),(10,'pbkdf2_sha256$120000$DoTJ4ZEFxlF5$QCqiS0mrE7a4ZqVyFSxu4Xa/sZ4pqcVwuBwfCekaAes=','2018-12-11 03:19:52.353243',0,'anish.turlapaty@iiits.in','anishchand','turlapaty','',2,0,1),(11,'pbkdf2_sha256$120000$g8jSfi0jO2Wt$aeObtpzWHMCIzgGJAXO3kd/DgTeSle1LU07tkfOfYb4=','2018-12-11 03:21:00.853360',0,'balaji.r@iiits.in','balaji','raman','',2,0,1),(12,'pbkdf2_sha256$120000$T8jpkGLyEKwc$TX+OiuGdMjD0iFGAuyU0MwCKRQrLGejMiCYiFbMal6s=','2018-11-16 20:44:46.442302',0,'srivalli.kiranmayee@iiits.in','srivalli','kiranmayee','',2,0,1),(13,'pbkdf2_sha256$120000$Mmt4MJ23wFFe$N8yNM8QK0A6g1UwESzIEHRvFLH5dxtnu62VENH8BrU0=','2018-12-11 03:22:41.050176',0,'yrv.prasad@iiits.in','raja','varaprasad','',2,0,1),(14,'pbkdf2_sha256$120000$gN5B8qgZSfa8$6A8n43ERQMjBOWNqknSe1x3UZejipypVSHkMLqCVfwo=','2018-12-11 03:23:29.181909',0,'divyabramham.k@iiits.in','divya','bramham','',2,0,1),(15,'pbkdf2_sha256$120000$VduyNFewV77j$2HRNcKP8WTdITzn7s8u3c5Yo3k2uRTgioyeENm73Y5A=','2018-11-16 20:47:31.050128',0,'hvraman@iiits.in','hrishikesh','venkataraman','',2,0,1),(16,'pbkdf2_sha256$120000$P3MW1Yi38my8$+K13zjns9fpR7Ywz260EoDMmjaljLbZBMwWKUPOtHTk=','2018-12-11 03:24:56.211884',0,'krishnachaitanya.a@iiits.in','krishna','chaitanya','',2,0,1),(17,'pbkdf2_sha256$120000$8CPCHEQhHaCJ$+GiEgvwMtqQNkX+QdymgGlv9S/hodnEM+hoe7ps4BF4=','2018-12-11 03:25:47.457769',0,'uma.garimella@iiits.in','uma','garimella','',2,0,1),(18,'pbkdf2_sha256$120000$uFPRrhHOCful$u4/LmQ9dvKsAkxIYS/H5xRM064A1mwSjDmQX4G/ui10=','2018-11-16 20:50:40.219592',0,'dr.chs@iiits.in','subrahmanyam','chs','',2,0,1),(19,'pbkdf2_sha256$120000$eYyDFOTvlxy7$DNdqb/b8X9IE++FGWNfz1+yShKKmUg4vXHunV31ZBKU=','2018-11-16 20:51:33.436123',0,'mainak.t@iiits.in','mainak','thakur','',2,0,1),(20,'pbkdf2_sha256$120000$iwbW3O6wwSPM$mBPc/dLaYzl83vKVgf/tJVtVkhuqIAXSlkEoGFLtVxw=','2018-11-16 20:52:30.115390',0,'yogananda.r@iiits.in','yogananda','rao','',2,0,1),(21,'pbkdf2_sha256$120000$pNKpmdXkdX7N$AjOAK/ds0nr1PpmQACnDiRh0sHbK2rYI8rTogP3oZew=','2018-11-16 20:53:48.474732',0,'shrijitha.banerjee@iiits.in','shrijitha','banerjee','',2,0,1),(22,'pbkdf2_sha256$120000$lQzCZT3rhQXM$zdMpJ4BJlkV5eXYgjA/zTv266XcWRMx5S0Cvy8qMJgQ=','2018-11-16 20:54:33.087438',0,'prasanna.g@iiits.in','prasanna','g','',2,0,1),(23,'pbkdf2_sha256$120000$uJ553LYibFy2$xqvBibx8Tl/Y0xmTkSy0Ncc0qwmlBe9TMo63xt3UoC8=','2018-11-16 20:55:33.666985',0,'ebpaul@iiits.in','paul','braineard','',2,0,1),(24,'pbkdf2_sha256$120000$SMvxZK16naOR$nVqVTM6qXt5I91KrtO2gcD0uIX9qgS9dqn/xicdVUmc=','2018-11-16 20:56:24.622013',0,'arpit.d@iiits.in','arpit','d','',2,0,1),(25,'pbkdf2_sha256$120000$NfXfJe5Q0Gul$U/Ltf+1RA2PRJEL3p7Xlg0eeQ9f60Pc0uaaMva+E7gg=','2018-11-16 20:57:06.005478',0,'subu.k@iiits.in','subu','k','',2,0,1),(27,'pbkdf2_sha256$120000$JYvnVF8W5DKH$65uzEfGTKVDFEfGUQet7gchs8PR2U3HmW+epYv67M2I=','2018-12-10 23:09:18.828460',0,'saikrishna.p@iiits.in','saikrishna','p','',3,0,1),(28,'!dtVPx45fSLyuuKTpSbo1IbqHpsh1qMhbIF21VsSo','2018-11-16 21:17:24.944732',0,'rishitha.p16@iiits.in','Rishitha','Pulluru','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAxLCJpYXQiOjE1NDIzODMyNDEsImV4cCI6MTU0NDk3NTI0MX0.4NT056VuRs8T8pGAKFvYBryPqWuK-AjQl6jLR_F8iuw',1,0,1),(29,'!ryzwQoOobVAGB7obW8cLiR6NjbBLjmuHuAZN4agP','2018-12-08 17:06:18.502641',0,'satyabalaanusha.s16@iiits.in','Satya Bala','Satyavolu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImlhdCI6MTU0NDI2ODk3NSwiZXhwIjoxNTQ2ODYwOTc1fQ.0nTg1_snBvtcN2xIa0V44HAZJYgqFaKsrugkqV1cPJU',1,0,1),(30,'!BwuDbKr3jyYqqyJV7VvqsgZKnn98BQh0AzOb8isK','2018-11-16 21:18:51.426302',0,'saisupriya.d16@iiits.in','Sai','Doma','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgxLCJpYXQiOjE1NDIzODMzMjIsImV4cCI6MTU0NDk3NTMyMn0.FujCZWyyrPJNrOEW8RrSRtI_yez1gCnhpm7DP57ZAjQ',1,0,1),(31,'!RW3mOrVR4swUEkk8phXQAhEqVytlCyb6GHv5VPan','2018-11-16 21:19:20.089256',0,'mahathi.d16@iiits.in','Mahathi','Duvvuru','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImlhdCI6MTU0MjM4MzM1NCwiZXhwIjoxNTQ0OTc1MzU0fQ.SxK5RILlHNSdgJsBQvoit_O7FRbt2Eyv-2U3Ki0ygvs',1,0,1),(32,'!K5NijhgE0s7mtSvIYrAhoKqjcnms59kmOG5ye6DZ','2018-11-16 21:19:50.148589',0,'manogna.p16@iiits.in','Manogna','Pagadala','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImlhdCI6MTU0MjM4MzM4NiwiZXhwIjoxNTQ0OTc1Mzg2fQ.nYt-IgRkEsWwSMfltra03OLjFYcG6hwd0AMPX5Dz44M',1,0,1),(33,'!mppKaUNVj8lZXgfWemumw5Ok3ouFW83LLudi9rUc','2018-11-16 21:20:28.640667',0,'keerthipriyanka.l16@iiits.in','Lam','Priyanka','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImlhdCI6MTU0MjM4MzQxOSwiZXhwIjoxNTQ0OTc1NDE5fQ.jiqtbW7UR-2KS75WrfM5F4ZHHJH_AF0yJ9n8riVmeJE',1,0,1),(34,'!fIDDVvFbVaE0v3XV3y63Hnjfwf8c9QChphb3TqxE','2018-11-16 21:21:04.999959',0,'muninihitha.p16@iiits.in','Pulivarthi','Chowdary','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzYxLCJpYXQiOjE1NDIzODM0NjAsImV4cCI6MTU0NDk3NTQ2MH0.biK3poQllPO1ogv1ZE5kT151H_B8kh__dVCZXU8GfzM',1,0,1),(35,'!J3fa0TGbytzOrDrdIx4244Xqc8NCIUHNJOKpjXBU','2018-11-16 21:22:06.250294',0,'saikaranam.m16@iiits.in','Manasa','Karanam','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzUxLCJpYXQiOjE1NDIzODM1MjIsImV4cCI6MTU0NDk3NTUyMn0.lrJ0OyErX9LfFqYweEVX4pjDlIr_JEK1MqwgQ0NAb3M',1,0,1),(36,'!KtOBRQWanER9JrjQ7HRjFI9BScSz8XrxIvVaZBLC','2018-11-16 21:47:14.458179',0,'mrudulashastri.p16@iiits.in','Pullela','Shastri','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjkxLCJpYXQiOjE1NDIzODUwMjYsImV4cCI6MTU0NDk3NzAyNn0.z4MiRRppTKA5diRNsR4o5-o_DLV3Q3pi-gf3PwA8qOw',1,0,1),(37,'!SiDHYCO0aYKvqYLA7RIQ9MFI3pBdqmuPuIy44cPl','2018-11-16 21:47:55.443172',0,'niharika.c16@iiits.in','Niharika','Chalapaka','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNTQyMzg1MDY2LCJleHAiOjE1NDQ5NzcwNjZ9.A7OojQYQFAbXjKqJuvqAZF0eJRjrq-jtvGJASMM7Ahk',1,0,1),(38,'!N6RXOLLU2A3zb6G8CBlrjBPXH73EgrkvIk2xQ68P','2018-11-16 21:48:26.030597',0,'preethi.s16@iiits.in','Preethi','Samala','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTAsImlhdCI6MTU0MjM4NTEwMiwiZXhwIjoxNTQ0OTc3MTAyfQ.8-20pbv8Nb1x1mC6YAnwU_aAwRWMd4yV39LwB7oVxwU',1,0,1),(39,'!tSAhwQcUyUd91yc6oHalGNeTpF0l00C9jw22Y61E','2018-11-16 21:49:08.032701',0,'sowmya.m16@iiits.in','Maheshwaram','Sowmya','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTEsImlhdCI6MTU0MjM4NTE0NCwiZXhwIjoxNTQ0OTc3MTQ0fQ.6hjI459gWtPmclaeJk15mUQlTKXcpGUTuL7RmpQ9eLA',1,0,1),(40,'!ftqwIFBz4MizMbKuMRN43RPWXjg4IhhTMkSsAGrd','2018-11-16 21:49:41.308265',0,'rohan.s16@iiits.in','Rohan','Sukumaran','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzQxLCJpYXQiOjE1NDIzODUxNzcsImV4cCI6MTU0NDk3NzE3N30.ng7VAXm_kbYQfUJxeTpVyxMOYzWyJmTWJJHLgMxzyRM',1,0,1),(41,'!p55CUqvuoRTO4vPeMF7KRiexk3tuDEbRt1eIKrbe','2018-11-16 21:50:33.450884',0,'sriharshitha.k16@iiits.in','Karuturi','Harshitha','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDAsImlhdCI6MTU0MjM4NTIzMCwiZXhwIjoxNTQ0OTc3MjMwfQ.ph3-vtf36r_wuESRw1yT9EgwbV8xJ0LvYi8l_wwIIM8',1,0,1),(42,'!jCZ83xWZauWX2r2sp3wiPJS4gUs94U0aKOYNdoUV','2018-11-16 21:54:49.956628',0,'sahaj.a16@iiits.in','Sahaj','Agarwal','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgsImlhdCI6MTU0MjM4NTQ4NCwiZXhwIjoxNTQ0OTc3NDg0fQ.T-Mqo-Dv_QmiS2EpOl5_IHMRqs_RYDRIuXrbEN3qHbg',1,0,1),(43,'!9ZqnKfBT7zMTdwRmBqq0Ubvl8j63NLgEUp9iE3pR','2018-11-16 22:01:14.888724',0,'veenaprathyusha.b16@iiits.in','Veena','Bollapragada','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDkxLCJpYXQiOjE1NDIzODU4NzAsImV4cCI6MTU0NDk3Nzg3MH0.LLF7nTRbz8eYVc26-mNghPwFCMmHq5c6unKONmdv0aw',1,0,1),(44,'!sqZyqbI00tE4MINwjZisHSqH0e6uV4LFc0ANpjda','2018-11-16 22:01:55.007231',0,'anjalipoornima.k16@iiits.in','Anjali','Karri','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTUsImlhdCI6MTU0MjM4NTkwOSwiZXhwIjoxNTQ0OTc3OTA5fQ.PtlmjNTsN0g7bHO1Wl5464VYGZ8_12aWtXef-b9IphY',1,0,1),(45,'!0pQG9y21wrSzuid8n0USfleKpTdVwBgPj3LTBrbr','2018-11-16 22:02:26.238343',0,'abhilash.p16@iiits.in','Abhilash','Pembarthi','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIxLCJpYXQiOjE1NDIzODU5NDEsImV4cCI6MTU0NDk3Nzk0MX0.-ShWpV7G8n7ZjXzGArVI0TbnUu0PHhEtxgBRlnbb6Y0',1,0,1),(46,'!Dzj14pWW5LpnF0CqZDDCjdX25QxG0hrQ1jdQfJNV','2018-12-08 17:42:37.730522',0,'tripathi.i16@iiits.in','ITI','TRIPATHI','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDIxLCJpYXQiOjE1NDQyNzExNDcsImV4cCI6MTU0Njg2MzE0N30.5EgY7XtTgzgzIy7um-qWH1_XelfH_ulaXreXpKOSkVw',1,0,1),(47,'!FNibmhzQPrS2rMTf133TaFFke38AmCbsdkQO5kfi','2018-11-16 22:06:06.413989',0,'aswanthnayak.b16@iiits.in','BHUKYA','NAYAK','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDMsImlhdCI6MTU0MjM4NjE1OSwiZXhwIjoxNTQ0OTc4MTU5fQ.W7Q8IEJJ_qxJNZVsjS9is6NIR3buqS71kmmz3GnFFjY',1,0,1),(48,'!aLRNsu7tf9i3MckOvi72VcEMQE56AQDRXIT544MH','2018-11-16 22:06:40.365518',0,'ashishkumar.p16@iiits.in','Ashish','Patel','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDYxLCJpYXQiOjE1NDIzODYxOTYsImV4cCI6MTU0NDk3ODE5Nn0.pRRTnpL3yjonrmUQnczzvw6NQjX4ZhrwmPdyUwEArUI',1,0,1),(49,'!TV8s4gHDaZxyOZNtm6ku7xYckke2U3oXVfxIS2LF','2018-11-16 22:08:07.002368',0,'rohitchowdary.a16@iiits.in','Atluri','Chowdary','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImlhdCI6MTU0MjM4NjI4MCwiZXhwIjoxNTQ0OTc4MjgwfQ.GBXdOAqxHwRQnBgZaJNknfc2DYbGLAQ-HyjIdU1xpO4',1,0,1),(50,'!YGjHcg1fKWHKrcJfBoUBLcFot2mj6xAi3ApUfcbD','2018-12-08 19:41:42.568897',0,'saiteja.a16@iiits.in','SAI TEJA','AVADHOOTHA','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDExLCJpYXQiOjE1NDQyNzgyOTksImV4cCI6MTU0Njg3MDI5OX0.ADuSAZf1zRklmmW38JmzETtlJa1N77mjG-Y5nOUF1uM',1,0,1),(51,'!NRdkAhIO4U5Ue9YYNnsVCWTKBjPjEbNKrGHSOW2i','2018-11-16 22:10:07.748275',0,'adamya.g16@iiits.in','Adamya','Gupta','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzgxLCJpYXQiOjE1NDIzODYzOTgsImV4cCI6MTU0NDk3ODM5OH0.orSihoauf8t5FPSwkzBBesCoM0dhkorVAjYj8gscNnM',1,0,1),(52,'!HvapGYTf28fjRSJvrGVNJtephGRwFmQa64beF7G0','2018-11-16 22:10:50.314169',0,'sowmyavasuki.j16@iiits.in','Sowmya','Jallepalli','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNTQyMzg2NDQzLCJleHAiOjE1NDQ5Nzg0NDN9.oNbrdxAxIhh4XUe52iPe3DRV0ySmE43aKYE9spePdP8',1,0,1),(53,'!DOjlP8GgYFI9NxWlowNH22K9oK9dL3OgGNf7FLit','2018-11-16 22:11:33.533870',0,'madhuchandhana.p16@iiits.in','Sai','Chandhana','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDUxLCJpYXQiOjE1NDIzODY0ODEsImV4cCI6MTU0NDk3ODQ4MX0.TbwoyUd3N_eye4VlRQ9nbQRawFoDR3VEUKYUL1pmP2M',1,0,1),(54,'!3RyGBoN4mgGDdby0AK2FmmmAlErCqxtGnJFs4gng','2018-11-16 22:12:18.986768',0,'vinoothnasai.k16@iiits.in','Vinoothna Sai','Kinnera','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDgxLCJpYXQiOjE1NDIzODY1MjIsImV4cCI6MTU0NDk3ODUyMn0.HhMZWJp8GiK5r1xFy0YwFMe9oDF52BNLLphGEJbeuK4',1,0,1),(55,'iamstudent','2018-11-16 22:11:33.533875',0,'sailaja.p17@iiits.in','sailaja','p','NULL',1,0,1),(56,'iamstudent','2018-11-23 21:11:33.533823',0,'krupa.n18@iiits.in','krupa','n','NULL',1,0,1),(57,'iamstudent','2018-11-01 09:11:33.533234',0,'francy.l15@iiits.in','francy','l','NULL',1,0,1),(58,'!HvIAz8naiSbNJ23aBcKN5SS7Jo83O15NyygI8ggA','2018-12-08 17:07:07.846984',0,'subhadeep.d16@iiits.in','Subhadeep','Dash','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTExLCJpYXQiOjE1NDQyNjkwMjMsImV4cCI6MTU0Njg2MTAyM30.-YEmqN7E0350xf25AiJ3-QPYydtWU4ofk8TTaWAuvnE',1,0,1),(59,'!lN6fmfrgx69DTBZ9ZeZ8uVAOEb9jwwSRglJEaBGL','2018-12-08 17:16:12.411263',0,'anubhav.u16@iiits.in','Anubhav','Ujjawal','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzMsImlhdCI6MTU0NDI2OTU2OCwiZXhwIjoxNTQ2ODYxNTY4fQ.6KVhFinVYHikmYnDTa40MtxOSxhD220hc9CBBjkVTlY',1,0,1),(60,'!ZTvimpw7TVD409GVHB3VGkMr1Wetjx46Onn0uSpS','2018-12-08 17:16:55.902358',0,'anurag.g16@iiits.in','Anurag','Gupta','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUxLCJpYXQiOjE1NDQyNjk2MTIsImV4cCI6MTU0Njg2MTYxMn0.HDtbB7GOWMKRHeQlz_WfDV_dwTV468PNyjT2PS7N2ZQ',1,0,1),(61,'!TVJkK490evjGIldzttxQDgIx7aO1dvp67ujMnfLq','2018-12-08 17:18:43.569312',0,'hinduja.b16@iiits.in','Hinduja','B','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTUxLCJpYXQiOjE1NDQyNjk3MjAsImV4cCI6MTU0Njg2MTcyMH0.qvbNvIN7AdH7sO0i2SSyRCO1Uw-bbzSESqUc5nKu4q4',1,0,1),(62,'!XNG8KOiJSse1WNj1XnlnmqDZG231svZgjKXkA054','2018-12-08 17:25:30.660243',0,'srilekha.n16@iiits.in','Srilekha','Naranapuram','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsImlhdCI6MTU0NDI3MDEyNywiZXhwIjoxNTQ2ODYyMTI3fQ.zfXilXqK6OJ3QvATS_9wFPFsbNUes3rlUAyG8FCFmlA',1,0,1),(63,'!ruZiA8aEOvuqLb02TJG1Es7neDt5csnSA7CD30n6','2018-12-08 17:27:28.702258',0,'jahnavi.b16@iiits.in','Barinela','Jahnavi','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTQxLCJpYXQiOjE1NDQyNzAyNDUsImV4cCI6MTU0Njg2MjI0NX0.0Hr78NHfHDVFaKb69F-auURJTDBNGXq4sCOFz7wjOqM',1,0,1),(64,'!KIZDZPgNRtM2AvFQG5fRFGXe6YeEFipjq3Bov1ZB','2018-12-08 17:28:02.108084',0,'jahnavi.g16@iiits.in','Jahnavi','Gujjula','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTcxLCJpYXQiOjE1NDQyNzAyNzgsImV4cCI6MTU0Njg2MjI3OH0.YHuWUeJb6HDz5mMvvioHxkKDNvkTD4Wyw7Kr0c5Q_Lo',1,0,1),(65,'!Lzb8VVoAKoBG3ZCByZamN2NndEm3TgQ8GazCUk8H','2018-12-08 17:33:21.757613',0,'venkatavaishnavi.n16@iiits.in','Venkata Vaishnavi','Nalluri','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQxLCJpYXQiOjE1NDQyNzA1OTgsImV4cCI6MTU0Njg2MjU5OH0.1ejySRjoS7CZsRl0PkTfBG3ri0x5jb6Q7DSN2YbYD_0',1,0,1),(66,'!2bt6i8NqAWra8JDiMXxzFVn0Rlm3l9P8aJtqjTYX','2018-12-08 17:41:35.501451',0,'laisha.w16@iiits.in','Laisha','Wadhwa','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNTQ0MjcxMDkwLCJleHAiOjE1NDY4NjMwOTB9.zrpXGuon2cqOAShXDLpPyTeLiTqUKrV6Sco-mFZWyq4',1,0,1),(67,'!A5DTpUEWFozUYHGqe86E14asFbe4A76wupz46hUq','2018-12-08 17:44:40.757885',0,'sahithikrishna.k16@iiits.in','Sahithi','Kotte','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgsImlhdCI6MTU0NDI3MTI3NiwiZXhwIjoxNTQ2ODYzMjc2fQ.Ye1fS5737rVLIF1SH3ir3UA_2cuTEg1j0YrLl2w8gCY',1,0,1),(68,'!p2Q38rWfcPuh1NFClmT6rvXhnqGneUzVUemNODKs','2018-12-08 17:45:51.978040',0,'srigirinadh.t16@iiits.in','Sri Girinadh','Tanneru','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsImlhdCI6MTU0NDI3MTM0OCwiZXhwIjoxNTQ2ODYzMzQ4fQ.Q55_LHIJms7lHfMTs2lOutLafl5xKvewS4aImcNT63U',1,0,1),(69,'!ifnyXc4PRDeWTyHgAOAI4kR8fMHV7JFRhIsxgpWP','2018-12-08 17:46:49.381494',0,'saivamshi.s16@iiits.in','SALLA DASHARATHA','VAMSHI','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTAxLCJpYXQiOjE1NDQyNzE0MDYsImV4cCI6MTU0Njg2MzQwNn0.setaq67s-rnZ-iYpIGPINWomFHcMi5X_rFdOr3HE3aw',1,0,1),(70,'!yL4SYepv7rCXiU0LbNvGc8wjOT85UwMxUt60G5zK','2018-12-08 17:48:54.388049',0,'subashkarthikeya.m16@iiits.in','Manthri','Karthikeya','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTgxLCJpYXQiOjE1NDQyNzE1MzAsImV4cCI6MTU0Njg2MzUzMH0.ELd4W9ejMX2Ak92iKgQn9ghqgSq74KO13mYsTe6m6MY',1,0,1),(71,'!KypVdUPGViDTQTR5gEVkyVuXV7W37AJ3yiY4raJV','2018-12-08 17:50:05.057356',0,'saikeerthi.d16@iiits.in','Sai','Doma','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgxLCJpYXQiOjE1NDQyNzE2MDAsImV4cCI6MTU0Njg2MzYwMH0.rZGwRDqXJRsb5HkV-dGdwv0ekScrzr5_53yootvYp-8',1,0,1),(72,'!AWQ4fLlfMWmSyQcX02PmyVzLcCMWFviRZ1uoxvxc','2018-12-08 17:50:49.494598',0,'meghana.k16@iiits.in','Meghana','Kanapaneni','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNTQ0MjcxNjQ2LCJleHAiOjE1NDY4NjM2NDZ9.5U4tcmHMtIqHcm-SGYObeI7AR_SF4dZmrjKLn2nevcU',1,0,1),(73,'!JXfrL9jvBHfgQMSrbQTF6fm7ayyiWD4FjhZEyAxx','2018-12-08 17:52:46.641657',0,'deeksha.u16@iiits.in','Deeksha','Ummadi','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjExLCJpYXQiOjE1NDQyNzE3NjMsImV4cCI6MTU0Njg2Mzc2M30.GXP_PXqW_a7ug-9QG3lT08TEdTs0D8uS4lISOkfFXTc',1,0,1),(74,'!YmA203c7oQPK3hBRuye7L0fCy8jbO7vASPgBbtWc','2018-12-08 17:53:44.587092',0,'monicasagar.g16@iiits.in','Monica','Guduru','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksImlhdCI6MTU0NDI3MTgxNywiZXhwIjoxNTQ2ODYzODE3fQ.96esFEA1sjc-pAHHeokyqfNIHIRw5wGoH-EfdaS0aQI',1,0,1),(75,'!4fTkEysrHwnVEkWKmPcoqYSEnuXGDAHgXLJdjogI','2018-12-08 17:55:20.593612',0,'mounika.c16@iiits.in','Chadalavada','Mounika','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTExLCJpYXQiOjE1NDQyNzE5MTcsImV4cCI6MTU0Njg2MzkxN30.ToKORuWlecvt4jroA52QbOi-WXmaVzsidt_rd7ZK48w',1,0,1),(76,'!u8tBF3peiwWKeB60VGgjClj66u6sxq22Cbx5zQoq','2018-12-08 17:57:06.941887',0,'Maheshwari.k16@iiits.in','Maheshwari','Kotha','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMxLCJpYXQiOjE1NDQyNzIwMjMsImV4cCI6MTU0Njg2NDAyM30.VKEowD08CTv8k-wUpbnXL1WGfC_8Zkcy0y__4fVARfY',1,0,1),(77,'!SKiORFzYVO5iGjt2bqTt1nDAdLRyxSSbgPBHdwMv','2018-12-08 17:58:10.237341',0,'shruthi.ms16@iiits.in','Shruthi','S','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcsImlhdCI6MTU0NDI3MjA4NywiZXhwIjoxNTQ2ODY0MDg3fQ.kCNhhsf2NDL0xEUDbditAuCrN0ZVatHlFAkZuifmf_U',1,0,1),(78,'!hkYeryZeVrLgBtiglt3zfXvOOcoxKRPyh15gYN1D','2018-12-08 19:37:07.754537',0,'syedjahangir.p16@iiits.in','Syed','Peeran','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDcsImlhdCI6MTU0NDI3ODAyNCwiZXhwIjoxNTQ2ODcwMDI0fQ.7lZbfB8X48McPvlJBor9-VnduJsGGkOI5_Ejtpc_S2o',1,0,1),(79,'!o8bdxLObJaHqW8SsqBgG9Ie5Vkp8aFMGfqCXqZB4','2018-12-08 19:39:59.084516',0,'vishnuvardhan.k16@iiits.in','VISHNU','VARDHAN','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTkxLCJpYXQiOjE1NDQyNzgxOTEsImV4cCI6MTU0Njg3MDE5MX0.aoLjuzvUMZXr0G9u-tMPH-Di49VKyUTnrv7DlLMuj3U',1,0,1),(80,'!Q4xiahHkdAkBEGZkQbtKGT1aO01vhE9hh87yq8YJ','2018-12-08 19:42:46.605470',0,'nagasivakrishna.c16@iiits.in','Cheruvugattu','Krishna','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzksImlhdCI6MTU0NDI3ODM2MywiZXhwIjoxNTQ2ODcwMzYzfQ.z4sbhy7oRyFAmZ1pkZyb9go5RS-GrsrjWUZ7GpH0bMc',1,0,1),(81,'!pT2vUlxB9PYkhGZGmxnV3jJEvYeyQtdJCwFr0Lg3','2018-12-08 19:43:47.986389',0,'jaswanthkumar.y16@iiits.in','Yadagalla','Kumar','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzYsImlhdCI6MTU0NDI3ODQyNSwiZXhwIjoxNTQ2ODcwNDI1fQ.kwxb1Zw_o_b8coGlHXsT0cXxSxSm19TuXl4nmv-sbvA',1,0,1),(82,'!3I1MOI8CtnvMP4RcsKZUJeqCydI1G2xS6KKxkIVI','2018-12-08 19:44:38.087090',0,'yashwanth.p16@iiits.in','Yaswanth','Pappula','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTMsImlhdCI6MTU0NDI3ODQ3NCwiZXhwIjoxNTQ2ODcwNDc0fQ.0fdbh0f26xH80LYSbYTIC_69jfBmjs2rn7RQTOVC6oo',1,0,1),(83,'!gwTgrh7wmUxkhqIWtTaLBQWRc7nCDo592sVw5sLA','2018-12-08 19:46:12.039419',0,'saiprasannakumar.k16@iiits.in','K.Sai','Kumar','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcsImlhdCI6MTU0NDI3ODU2OCwiZXhwIjoxNTQ2ODcwNTY4fQ.V-25RYVuj_KXa-VSw67wJHZGMtHqnzgK_qsPiPhfb3s',1,0,1),(84,'!Z4i0Yx0Cz1xsamjwWRpd89kyep4KYCKPHHZhFP95','2018-12-08 19:48:06.307785',0,'saisuresh.g16@iiits.in','Sai','Guduru','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTIsImlhdCI6MTU0NDI3ODY4MywiZXhwIjoxNTQ2ODcwNjgzfQ.cEaNCDwTKQqmBLOkn0dIz0K0NkEy9xflJQ_6rAUVEZU',1,0,1),(85,'!ASiKOz9hWAXkJpwpf8cl2ci2QCCqUz6ZW821VnUC','2018-12-08 19:51:16.712507',0,'tanmay.k16@iiits.in','Tanmay','Kalani','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYxLCJpYXQiOjE1NDQyNzg4NzMsImV4cCI6MTU0Njg3MDg3M30.8ZkYC-_GcdheRc3x7V9IpFwcjuRRXH2AnU5l92jsYhE',1,0,1),(86,'!yCKdovqUzAimXfIcoFaMXZZoJCdVkO3P7uuMkOQX','2018-12-08 19:51:50.300295',0,'saisuhastanmay.k16@iiits.in','Sai Suhas','K','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsImlhdCI6MTU0NDI3ODkwNiwiZXhwIjoxNTQ2ODcwOTA2fQ.CLv4lWnXflOkthWzF_ZVxS36qKRcVf0zbrNPObKGyWE',1,0,1),(87,'!BADm0i2bWwhrEUVhFwqWkBDjktzKpDvLEZ7I9LGs','2018-12-08 19:53:02.654212',0,'dheeraj.c16@iiits.in','Dheeraj','Chappidi','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzIxLCJpYXQiOjE1NDQyNzg5NzksImV4cCI6MTU0Njg3MDk3OX0.iIWBfRMElJfPln2nDiSMpKKmGxj5HLCmqeUAPcDfKis',1,0,1),(88,'!yDdfBuKQ4wHu67YQUGwX8v2u3GvnsZEIqIeSYhGI','2018-12-08 19:54:13.463178',0,'jadhavajit.j16@iiits.in','Ajit','Jadhav','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTcxLCJpYXQiOjE1NDQyNzkwNTAsImV4cCI6MTU0Njg3MTA1MH0.spc_yN5oBsyW1_caFj2JIcz8q9CjBoWiTn6t5YaeZJk',1,0,1),(89,'!JHVrQWLAJikDsj4EblixLej4tRC9lGVLvSJgTkTl','2018-12-08 19:57:27.526265',0,'rahul.k16@iiits.in','RAHUL','KUMAR','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTU0NDI3OTI0MywiZXhwIjoxNTQ2ODcxMjQzfQ.nTr6gk6w55jmRiS2luHE_O53Gt5sNl4LKZEJjTj0yH4',1,0,1),(90,'!TPwwOQ05OVLjABOQKQSq5AZipYQmuDrCUZuh7Url','2018-12-08 20:00:15.366273',0,'junaid.nz16@iiits.in','Junaid','Z','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDEsImlhdCI6MTU0NDI3OTQxMSwiZXhwIjoxNTQ2ODcxNDExfQ.4EL3trL4bv9GnNk22HSeMeep7d2FOnCmyUBW30Zb0us',1,0,1),(91,'!Le5qRG9ccmhpAhmFlIstyBsYIxymchk3tGCbBci7','2018-12-08 20:03:53.441624',0,'adityaharidas.m16@iiits.in','Aditya','Menon','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDYsImlhdCI6MTU0NDI3OTYzMCwiZXhwIjoxNTQ2ODcxNjMwfQ.nL4AHFWspv7JnRoMiNdLyEZDwLbPEJKEFyaZt9kuMkY',1,0,1),(92,'!A9qxrkK1gpiOzoinwIqKQg2xSAFgK60mcWme0v06','2018-12-08 20:04:51.773346',0,'wasim.i16@iiits.in','WASIM','KHAN','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImlhdCI6MTU0NDI3OTY4OCwiZXhwIjoxNTQ2ODcxNjg4fQ.2sS-QqCbdpUqXk3lkcrbLt-EaiuWhhq3Ot--MbT4Ads',1,0,1),(93,'!cggemN5DGmClLe9kb1m51Efs2uOWMv40BIFEZjKU','2018-12-08 20:06:17.220218',0,'sairathan.v16@iiits.in','Sai','Rathan','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDQsImlhdCI6MTU0NDI3OTc3NCwiZXhwIjoxNTQ2ODcxNzc0fQ.pTFdtQdBrbJa3wmR3ToP7qJERNLwum0B45YNeUpdjOQ',1,0,1),(94,'!voZgQ6TgvIMMaNr5JtS4gRQqdlmykdSwYDxZoJh4','2018-12-08 20:07:42.962008',0,'udayraj.s16@iiits.in','Uday','Sawhney','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDksImlhdCI6MTU0NDI3OTg1OSwiZXhwIjoxNTQ2ODcxODU5fQ.z5W5_GgvA-Ra77HCaBeW7Gc69KPwZBBhT4_7TMj-C48',1,0,1),(95,'!ahwgIUADesjRZ3Ycj4EpwQgrF7xR84sJ6pmeSFe5','2018-12-08 20:08:27.811448',0,'rutvikreddy.v16@iiits.in','Rutvik','Vijjali','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTIxLCJpYXQiOjE1NDQyNzk5MDQsImV4cCI6MTU0Njg3MTkwNH0.Nnj3qUBm2y6iIjxGHxMdelv_VULbTJhTkYz---zybcI',1,0,1),(96,'!IIdZHuAicXPMb3zioQHdpYVTvAAQ6GCyCWuoBDqe','2018-12-08 20:10:00.795463',0,'sriharshavardhan.s16@iiits.in','SRI','S','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsImlhdCI6MTU0NDI3OTk5NywiZXhwIjoxNTQ2ODcxOTk3fQ.B3Vg7w74OBmphyKmUyaqI2YxGKuS4EgFHxajFnwWOm4',1,0,1),(97,'!FvinGrLrOmskhfx5IlrawwpGsx3N9xvIoGnOCQX2','2018-12-08 20:11:28.582456',0,'pranav.m16@iiits.in','Pranav','Meejuri','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDMxLCJpYXQiOjE1NDQyODAwODUsImV4cCI6MTU0Njg3MjA4NX0.SQD3Ezbfa2A0pgOx9MyCPweDHF8runseufsTjvINmdY',1,0,1),(98,'!KYLPHm7ZuBEo3NGoyE2UMuU3PpNajsOUbXIUk550','2018-12-08 20:12:51.905981',0,'pavansai.m16@iiits.in','Mucherla','Sai','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsImlhdCI6MTU0NDI4MDE2OCwiZXhwIjoxNTQ2ODcyMTY4fQ.FHBgcpsv3Iou2MFWUt0ZrbwJAq2zx8LUpt1KbeplnoA',1,0,1),(99,'!7QbMlaZYMDcEVBvKAukNwwL73sfdBUmkRuWfYupB','2018-12-08 20:13:57.916645',0,'bhavi.c16@iiits.in','Bhavi','Chawla','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDUsImlhdCI6MTU0NDI4MDIzNCwiZXhwIjoxNTQ2ODcyMjM0fQ.zRLrkIYPhOnZX3_-erS-sYpJw5ni2Dg3USG0x2mRCfU',1,0,1),(100,'!dCYQ7SXpPe6782uBitBo7XL1ZSu67xrLLl6I9WMd','2018-12-08 20:23:39.031791',0,'satyasaivenkataraja.y16@iiits.in','SATYA SAI','YALLA','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNTQ0MjgwODE2LCJleHAiOjE1NDY4NzI4MTZ9.ozhLuKFHqDyp0Bh1BnoRi5ffG8GdDF-4hBP6LTE3XX4',1,0,1),(101,'!IDp6A49iwajIeMBPajlYiqACspjCs1If5xkOgG6h','2018-12-08 20:26:44.499748',0,'soumik.m16@iiits.in','Soumik','Mandal','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTMxLCJpYXQiOjE1NDQyODEwMDEsImV4cCI6MTU0Njg3MzAwMX0.lzUiAWhkZ-A_4Vdr0iSVefB2P9yxtglVhk2nxaQdjK0',1,0,1),(102,'!1zoZIO4aHFhhrH6W1vhskI47UI8J6DHWrOiMjtVg','2018-12-08 20:28:15.371301',0,'paras.d16@iiits.in','Paras','Dahiya','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwiaWF0IjoxNTQ0MjgxMDkyLCJleHAiOjE1NDY4NzMwOTJ9.rJXToX2BRQ0D7xbZqCzsUHpoHE3BQnPI6iGuzx71huE',1,0,1),(103,'!ISNnQ3cCEl3b9DFGN8zGxclEZsCk4YFXKXm4UpHK','2018-12-08 20:29:04.935990',0,'prasadvishal.d16@iiits.in','Vishal','Prasad','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NzEsImlhdCI6MTU0NDI4MTE0MCwiZXhwIjoxNTQ2ODczMTQwfQ.w2Mn5S7HiL0Oz_B-9ju1olPD_-8yDpm3yX8HTdW3TEI',1,0,1),(104,'!ueev2QLvxPAyqmWE83JDWtIbFy1bmAmYPBYUqpsW','2018-12-08 20:30:11.694770',0,'siddharth.k16@iiits.in','siddharth','kumar','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzEsImlhdCI6MTU0NDI4MTIwOCwiZXhwIjoxNTQ2ODczMjA4fQ.qNuNKDcqyKpdTKEyB7jwJBDh5RApcYFRppmLv7PGyK0',1,0,1),(105,'!IcSXzGvwvlsKt8aYSPd9O1fboAHjDgcEykxeyI7p','2018-12-08 20:31:15.873147',0,'siddhant.k16@iiits.in','Siddhant','Kushwaha','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjksImlhdCI6MTU0NDI4MTI3MywiZXhwIjoxNTQ2ODczMjczfQ.tkBGOc7OAZZCl07YDPBPSgAhOuY-nKiPXtU7LNen05Y',1,0,1),(106,'!1KBw7Yb0dn9IYrTdJYUSMPKmnXnDrHsRTfhqPKZI','2018-12-08 20:32:00.976796',0,'madhusudhan.p16@iiits.in','Punganoor','MadhuSudhan','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImlhdCI6MTU0NDI4MTMxNSwiZXhwIjoxNTQ2ODczMzE1fQ.hT2uno-OYXGjRV4X2u1BY0pCasFo8MiLGuePk-guJ_k',1,0,1),(107,'!t40NS0r54iABz4XBCXTkKLDIZi7rvDjdW2nz19lo','2018-12-08 20:35:36.621280',0,'nikhilkumar.c16@iiits.in','Nikhil','Chilagani','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImlhdCI6MTU0NDI4MTUzMiwiZXhwIjoxNTQ2ODczNTMyfQ.LezYSGkv6zPM2-wOVS_bEDLf7wDZZ6W6r6CAG5nb5ho',1,0,1),(108,'!DGwaArz9z6S2aeIcEFufgsYvKs4Js8GWLfeGflGl','2018-12-08 20:37:06.736739',0,'nitin.k16@iiits.in','Nitin','Kumar','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsImlhdCI6MTU0NDI4MTYyNCwiZXhwIjoxNTQ2ODczNjI0fQ._Xb59IOrP8-0SHOQ8gf3T93JjCuiqeZXBNN-DvWX4V4',1,0,1),(109,'!oYtbpzzum5QJCZpsif78sjkA0r4fqo1ChKl8t53x','2018-12-08 20:40:18.699028',0,'anirudhkannan.v16@iiits.in','ANIRUDH','KANNAN V P','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzkxLCJpYXQiOjE1NDQyODE4MTUsImV4cCI6MTU0Njg3MzgxNX0.1z1QLv0E2OvGHW8fPjaa7nzRYk1-ELUEPT9AaMvJYrc',1,0,1),(110,'!wahr3Rms5QaFWaZjYDzCbpyzt3NdHC2cYXeky4Pb','2018-12-08 20:41:23.408767',0,'hareesh.t16@iiits.in','Hareesh','Thirukkovalluru','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzMxLCJpYXQiOjE1NDQyODE4NzksImV4cCI6MTU0Njg3Mzg3OX0.a-pRxW7AHR3zDPFeMHoEdjIETt9r2PZC1YPBHs_exkI',1,0,1),(111,'!EkZYxDIB4BpyHhTgxqPhoxY49nJtwJt2aMbYxIV1','2018-12-08 20:42:34.051261',0,'sainathreddy.k16@iiits.in','K Upendra','Reddy','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTYxLCJpYXQiOjE1NDQyODE5NDUsImV4cCI6MTU0Njg3Mzk0NX0.V-REgwSsd9nouc9r6FDuHO1uUMQHH61uO4VDVgGDZYc',1,0,1),(112,'!s7WiUk8rd7lILimUxRBUEBaVW0sCZHhj8Rif85tX','2018-12-08 20:44:10.155971',0,'venkatlokeshkumar.s16@iiits.in','Venkat','Sajjanapu','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcxLCJpYXQiOjE1NDQyODIwNDUsImV4cCI6MTU0Njg3NDA0NX0.V-K-Lsh83javu8KgNWT6-YgPLubTjWkL17xFX-2uaCU',1,0,1),(113,'!hrpIq3YRaLvJCRdRt4aj55DqJam5BvxfKVXFn0BX','2018-12-08 20:52:41.656112',0,'arvind.d16@iiits.in','Arvind','Deshraj','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDIsImlhdCI6MTU0NDI4MjU1OCwiZXhwIjoxNTQ2ODc0NTU4fQ.YI7XLw9vSQx8IPdwTPMimmwRhzYOGTynqYOpkWv15L0',1,0,1),(114,'!eccqjEWU5XyMRROb24KkhzFUzPSG5Pekhl7mW33T','2018-12-08 20:58:28.447859',0,'saisachin.n16@iiits.in','SRIKARA MOHANA','NEKKANTI','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQxLCJpYXQiOjE1NDQyODI5MDEsImV4cCI6MTU0Njg3NDkwMX0.3p2x1WQ2-32QWTGH9nqeMti26E336_2Mt32NBk6HZhA',1,0,1),(115,'!mx5Rce9R07PlUqdxgNHViVKlHa2yfyu5QIFvV0W8','2018-12-08 21:00:31.830478',0,'sumanth.d16@iiits.in','Sumanth','Doddapaneni','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzIsImlhdCI6MTU0NDI4MzAyOSwiZXhwIjoxNTQ2ODc1MDI5fQ.gbYK6Ro9_KqzgkBVNuvilEQ31UwnZMEFRh5m6QAmfMo',1,0,1),(116,'!M3MoAt7qtJXmFYqY3FnjC3l3tNsnvLhBLGWaWDLy','2018-12-08 21:02:41.549061',0,'tejkiran.v16@iiits.in','Tejkiran','V','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzUsImlhdCI6MTU0NDI4MzE1NywiZXhwIjoxNTQ2ODc1MTU3fQ.gEeGk0EUihTSTLR7dCe8AsYQENZzipbufERqpBbeOng',1,0,1),(117,'!lLxBXJVQtYhykOPlfftcOyEwYHMB9kZa60BNLGCa','2018-12-08 21:08:35.637152',0,'chinmay.s16@iiits.in','chinmay','Samal','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDQxLCJpYXQiOjE1NDQyODM1MTIsImV4cCI6MTU0Njg3NTUxMn0.atIg0wKsL3MsG6OspC3A_E842ridriGgObNGtbLDehE',1,0,1),(118,'!g82T0k2xfKrIc155p84NGPBvY5BYDGHG5Xyyka1H','2018-12-08 21:11:25.070672',0,'abhishek.t16@iiits.in','Abhishek','Thripurana','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzQsImlhdCI6MTU0NDI4MzY4MSwiZXhwIjoxNTQ2ODc1NjgxfQ.QLKtQmPq-vRZuk8qKDwzv7uNjhfwpIIEsjoJlHDzvJ0',1,0,1),(119,'!E4eMvJLcZFCzFWrO4mpEQsWWMk2XKz0s22qSNqDB','2018-12-08 21:14:14.125366',0,'deepak.k16@iiits.in','Deepak','Kumar','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMxLCJpYXQiOjE1NDQyODM4NTEsImV4cCI6MTU0Njg3NTg1MX0.rmvoaRMI2j7UUnqYeW3qU9uLuyx1T7WZz9Q9AFFnEE8',1,0,1),(120,'!YhSGrd5Zbq3AoHs6EDe4Cl6gAUOkE1vkrQZUj9b5','2018-12-08 21:17:08.906804',0,'kaustubh.p16@iiits.in','Kaustubh','Pandey','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiaWF0IjoxNTQ0Mjg0MDI1LCJleHAiOjE1NDY4NzYwMjV9.OweIapTBafAWHSypIaPHWS9SqmubAQ6wmRUjQAuSrA4',1,0,1),(121,'!1ovqT8hUwRmRYJ6CFgW8gCnYp0cmD9QDnM1HBBsV','2018-12-08 21:42:14.724109',0,'prathyush.p16@iiits.in','Prathyush','Potluri','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNTQ0Mjg1NTI3LCJleHAiOjE1NDY4Nzc1Mjd9.9sVaV98Y7N88mxNLwOTrKyuz_60V_Kz2W8j5F-XTX3w',1,0,1),(122,'!O5YGiu5BRfFD27OTjTL3iQ6xYls3kSiVAuPlh7Rt','2018-12-08 21:43:27.123693',0,'prudhvikrishna.n16@iiits.in','Satya Sai Prudhvi Krishna','Nikku','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcxLCJpYXQiOjE1NDQyODU2MDMsImV4cCI6MTU0Njg3NzYwM30.f5UwIAQYJBdHSJ3pLEKcHg93obLoj5Hu5-K5LWUSoVs',1,0,1),(123,'!C3XClvQxxeeLgy0fCXKwI2CrI0vfqHih1602x2rj','2018-12-08 21:44:14.495952',0,'prudhviraj.j16@iiits.in','Prudhvi Raj','Jwala','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OTEsImlhdCI6MTU0NDI4NTY1MCwiZXhwIjoxNTQ2ODc3NjUwfQ.t0xISpTyWllJw7ZwHfIioEFpDrT0_aXGY02PPWdd0PY',1,0,1),(124,'!YUGUYGJOnnGgTXMkcgktem8cMX7K1q4FzkKyLOVz','2018-12-08 21:49:58.345261',0,'saikiran.t16@iiits.in','Sai','Thammali','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImlhdCI6MTU0NDI4NTk5NCwiZXhwIjoxNTQ2ODc3OTk0fQ.meO2dn-DjO2nLzc4bofnC_scAjEZmWfvQGN00pUuNvI',1,0,1),(125,'!2YQKCRKThpy480jiuW7ZArbQ713Pxw15Q7f1k5tt','2018-12-08 21:52:32.742793',0,'sandeep.p16@iiits.in','Sandeep','Potla','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjEsImlhdCI6MTU0NDI4NjE0NywiZXhwIjoxNTQ2ODc4MTQ3fQ.Eksk_6bC9xMg1PRQ54wVmefm0EFPMmpuKyIqe_tXrGs',1,0,1),(126,'!fLCbVkXiCi4vlG3Fx5UKei5ZwdFzn9Pns4R3Sz9u','2018-12-08 21:54:02.267909',0,'shivamsingh.y16@iiits.in','Shivam','Yadav','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDcxLCJpYXQiOjE1NDQyODYyMzksImV4cCI6MTU0Njg3ODIzOX0.eiVLPGV8hqrkXnNnRzADvpWCid_uF7ZAnKj5GTSh4ro',1,0,1),(127,'!DU0a7qax9NbWeKbpRMVaFl23nRkOZ9ZbT62KpEPr','2018-12-08 21:55:20.561066',0,'sreepragna.v16@iiits.in','Sree Pragna','Vinnakoti','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAxLCJpYXQiOjE1NDQyODYzMTQsImV4cCI6MTU0Njg3ODMxNH0.Qyhs8XZOuDeAKhkRvdl-UsXosH93V_PUag-PJK9NLSM',1,0,1),(128,'!10yAJn6A0hlcs7ltvJX7fXkYH7yuG9ClMvDAXgjV','2018-12-08 21:56:41.760869',0,'suryateja.a16@iiits.in','SURYA','ACHANTA','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDAxLCJpYXQiOjE1NDQyODYzOTgsImV4cCI6MTU0Njg3ODM5OH0.gtQW_Bb7w1dZeMSb3BS6qLHDeBR4PA8JcucsXVF82wk',1,0,1),(129,'!W0U1YhNxScd4uelPPyE3RYKedLd9vH7DY7SOyloO','2018-12-08 21:58:59.834755',0,'venkatacharan.g16@iiits.in','venkata','gowthukatla','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTQsImlhdCI6MTU0NDI4NjUzNSwiZXhwIjoxNTQ2ODc4NTM1fQ.yofXO5foqaItBkuqfLSsYCApRvwK-WyaZ9PxZb_pIkc',1,0,1),(130,'!Ok8QX3XPoRptcOGwz1CC6ocpoVE4UI6JW0hGBCFb','2018-12-08 21:59:48.512822',0,'venkatasaikrishna.d16@iiits.in','Venkatasaikrishna','Deshineni','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTQ0Mjg2NTg0LCJleHAiOjE1NDY4Nzg1ODR9.nr1ig134vrTjvurY1ShT7s71JhIgerVvJgLeesx-I1o',1,0,1);
/*!40000 ALTER TABLE `timetable_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_user_groups`
--

DROP TABLE IF EXISTS `timetable_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timetable_user_groups_user_id_group_id_ac718f8d_uniq` (`user_id`,`group_id`),
  KEY `timetable_user_groups_group_id_1f291bb9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `timetable_user_groups_group_id_1f291bb9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `timetable_user_groups_user_id_5d871dda_fk_timetable_user_id` FOREIGN KEY (`user_id`) REFERENCES `timetable_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_user_groups`
--

LOCK TABLES `timetable_user_groups` WRITE;
/*!40000 ALTER TABLE `timetable_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_user_user_permissions`
--

DROP TABLE IF EXISTS `timetable_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timetable_user_user_perm_user_id_permission_id_22b58fb9_uniq` (`user_id`,`permission_id`),
  KEY `timetable_user_user__permission_id_f6643a16_fk_auth_perm` (`permission_id`),
  CONSTRAINT `timetable_user_user__permission_id_f6643a16_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `timetable_user_user__user_id_3c18c21b_fk_timetable` FOREIGN KEY (`user_id`) REFERENCES `timetable_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_user_user_permissions`
--

LOCK TABLES `timetable_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `timetable_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-11  8:59:44

# Host: liunar.com  (Version 5.7.16)
# Date: 2017-12-25 19:04:11
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "activity"
#

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

#
# Data for table "activity"
#

INSERT INTO `activity` VALUES (1,'humhub\\modules\\space\\activities\\Created','space','humhub\\modules\\space\\models\\Space',1),(2,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',1),(3,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(4,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(5,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',2),(6,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',1),(7,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',2),(8,'humhub\\modules\\like\\activities\\Liked','like','humhub\\modules\\like\\models\\Like',1),(9,'humhub\\modules\\like\\activities\\Liked','like','humhub\\modules\\like\\models\\Like',2),(10,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\polls\\models\\Poll',1),(11,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1),(12,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',3),(13,'humhub\\modules\\polls\\activities\\NewVote','polls','humhub\\modules\\polls\\models\\Poll',1),(14,'humhub\\modules\\comment\\activities\\NewComment','comment','humhub\\modules\\comment\\models\\Comment',4),(15,'humhub\\modules\\space\\activities\\MemberAdded','space','humhub\\modules\\space\\models\\Space',1),(16,'humhub\\modules\\content\\activities\\ContentCreated','content','humhub\\modules\\post\\models\\Post',3);

#
# Structure for table "contentcontainer"
#

DROP TABLE IF EXISTS `contentcontainer`;
CREATE TABLE `contentcontainer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_target` (`class`,`pk`),
  UNIQUE KEY `unique_guid` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

#
# Data for table "contentcontainer"
#

INSERT INTO `contentcontainer` VALUES (1,'c200f9e8-1d6c-4347-a6e2-4479e824eccc','humhub\\modules\\user\\models\\User',1,1),(2,'e962083e-d72c-47e2-b883-52d8e6352f09','humhub\\modules\\space\\models\\Space',1,1),(3,'e7abc09d-625e-4004-b482-4c7e14221c7e','humhub\\modules\\user\\models\\User',2,2),(4,'87cfd26b-7b42-437b-8f08-b46561f0583b','humhub\\modules\\user\\models\\User',3,3),(5,'bf1de9ff-cfca-4828-846b-3b2668801a18','humhub\\modules\\user\\models\\User',4,4);

#
# Structure for table "content_tag"
#

DROP TABLE IF EXISTS `content_tag`;
CREATE TABLE `content_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-content-tag` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-content-tag-container-id` (`contentcontainer_id`),
  KEY `fk-content-tag-parent-id` (`parent_id`),
  CONSTRAINT `fk-content-tag-container-id` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-parent-id` FOREIGN KEY (`parent_id`) REFERENCES `content_tag` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "content_tag"
#


#
# Structure for table "contentcontainer_permission"
#

DROP TABLE IF EXISTS `contentcontainer_permission`;
CREATE TABLE `contentcontainer_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "contentcontainer_permission"
#


#
# Structure for table "contentcontainer_setting"
#

DROP TABLE IF EXISTS `contentcontainer_setting`;
CREATE TABLE `contentcontainer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(50) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  KEY `fk-contentcontainerx` (`contentcontainer_id`),
  CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "contentcontainer_setting"
#


#
# Structure for table "live"
#

DROP TABLE IF EXISTS `live`;
CREATE TABLE `live` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `visibility` int(1) DEFAULT NULL,
  `serialized_data` text NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentcontainer` (`contentcontainer_id`),
  CONSTRAINT `contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

#
# Data for table "live"
#

INSERT INTO `live` VALUES (1,2,1,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:1;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:1;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:1;}',1514247847),(2,2,1,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:3;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:2;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:1;}',1514247857),(3,2,1,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:2;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:31:\"humhub\\modules\\post\\models\\Post\";s:8:\"sourceId\";i:1;s:6:\"silent\";b:0;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:1;}',1514247858),(4,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:4;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"e7abc09d-625e-4004-b482-4c7e14221c7e\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:3;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247904),(5,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:5;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"87cfd26b-7b42-437b-8f08-b46561f0583b\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:4;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247919),(6,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:7;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:5;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247936),(7,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:6;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:31:\"humhub\\modules\\post\\models\\Post\";s:8:\"sourceId\";i:2;s:6:\"silent\";b:0;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247937),(8,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:8;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"e7abc09d-625e-4004-b482-4c7e14221c7e\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:6;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247944),(9,1,0,'O:38:\"humhub\\modules\\comment\\live\\NewComment\":4:{s:9:\"commentId\";i:1;s:9:\"contentId\";i:6;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:0;}',1514247945),(10,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:9;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"87cfd26b-7b42-437b-8f08-b46561f0583b\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:7;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247954),(11,1,0,'O:38:\"humhub\\modules\\comment\\live\\NewComment\":4:{s:9:\"commentId\";i:2;s:9:\"contentId\";i:6;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:0;}',1514247956),(12,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:10;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"87cfd26b-7b42-437b-8f08-b46561f0583b\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:8;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247966),(13,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:11;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"87cfd26b-7b42-437b-8f08-b46561f0583b\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:9;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247972),(14,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:13;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:10;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247983),(15,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:12;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:32:\"humhub\\modules\\polls\\models\\Poll\";s:8:\"sourceId\";i:1;s:6:\"silent\";b:0;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247984),(16,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:14;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"e7abc09d-625e-4004-b482-4c7e14221c7e\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:11;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247991),(17,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:15;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"e7abc09d-625e-4004-b482-4c7e14221c7e\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:12;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514247996),(18,1,0,'O:38:\"humhub\\modules\\comment\\live\\NewComment\":4:{s:9:\"commentId\";i:3;s:9:\"contentId\";i:12;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:0;}',1514247997),(19,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:16;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"87cfd26b-7b42-437b-8f08-b46561f0583b\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:13;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514248006),(20,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:17;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"87cfd26b-7b42-437b-8f08-b46561f0583b\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:14;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514248010),(21,1,0,'O:38:\"humhub\\modules\\comment\\live\\NewComment\":4:{s:9:\"commentId\";i:4;s:9:\"contentId\";i:12;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:0;}',1514248011),(22,1,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:1;s:4:\"text\";s:95:\"David Roberts commented post \"We&#039;re looking for great slogans of famous brands. Maybe...\".\";s:2:\"ts\";i:1514248020;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:2;}',1514248021),(23,1,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:2;s:4:\"text\";s:95:\"Sara Schuster commented post \"We&#039;re looking for great slogans of famous brands. Maybe...\".\";s:2:\"ts\";i:1514248023;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:2;}',1514248023),(24,3,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:3;s:4:\"text\";s:95:\"Sara Schuster commented post \"We&#039;re looking for great slogans of famous brands. Maybe...\".\";s:2:\"ts\";i:1514248025;s:18:\"contentContainerId\";i:3;s:10:\"visibility\";i:2;}',1514248025),(25,3,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:4;s:4:\"text\";s:52:\"Sara Schuster likes comment \"Nike – Just buy it.\".\";s:2:\"ts\";i:1514248027;s:18:\"contentContainerId\";i:3;s:10:\"visibility\";i:2;}',1514248028),(26,1,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:5;s:4:\"text\";s:91:\"Sara Schuster likes post \"We&#039;re looking for great slogans of famous brands. Maybe...\".\";s:2:\"ts\";i:1514248030;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:2;}',1514248030),(27,1,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:6;s:4:\"text\";s:99:\"David Roberts commented Question \"Right now, we are in the planning stages for our next meetup...\".\";s:2:\"ts\";i:1514248033;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:2;}',1514248033),(28,1,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:7;s:4:\"text\";s:99:\"Sara Schuster commented Question \"Right now, we are in the planning stages for our next meetup...\".\";s:2:\"ts\";i:1514248035;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";i:2;}',1514248036),(29,3,2,'O:48:\"humhub\\modules\\notification\\live\\NewNotification\":5:{s:14:\"notificationId\";i:8;s:4:\"text\";s:99:\"Sara Schuster commented Question \"Right now, we are in the planning stages for our next meetup...\".\";s:2:\"ts\";i:1514248037;s:18:\"contentContainerId\";i:3;s:10:\"visibility\";i:2;}',1514248037),(30,2,0,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:18;s:5:\"sguid\";s:36:\"e962083e-d72c-47e2-b883-52d8e6352f09\";s:5:\"uguid\";N;s:10:\"originator\";s:36:\"bf1de9ff-cfca-4828-846b-3b2668801a18\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:15;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:2;s:10:\"visibility\";i:0;}',1514248518),(31,1,1,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:20;s:5:\"sguid\";N;s:5:\"uguid\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:39:\"humhub\\modules\\activity\\models\\Activity\";s:8:\"sourceId\";i:16;s:6:\"silent\";b:1;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";s:1:\"1\";}',1514249001),(32,1,1,'O:38:\"humhub\\modules\\content\\live\\NewContent\":9:{s:9:\"contentId\";i:19;s:5:\"sguid\";N;s:5:\"uguid\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:10:\"originator\";s:36:\"c200f9e8-1d6c-4347-a6e2-4479e824eccc\";s:11:\"sourceClass\";s:31:\"humhub\\modules\\post\\models\\Post\";s:8:\"sourceId\";i:3;s:6:\"silent\";b:0;s:18:\"contentContainerId\";i:1;s:10:\"visibility\";s:1:\"1\";}',1514249001);

#
# Structure for table "log"
#

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "log"
#

INSERT INTO `log` VALUES (1,1,'yii\\db\\Exception',1514248767.387,'[::1][-][7vflqn3sqh0qik92d4175sbb47]','exception \'PDOException\' with message \'SQLSTATE[HY000] [2006] MySQL server has gone away\' in E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php:646\nStack trace:\n#0 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(646): PDO->__construct(\'mysql:host=liun...\', \'alex\', \'alexsong\', NULL)\n#1 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(579): yii\\db\\Connection->createPdoInstance()\n#2 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(928): yii\\db\\Connection->open()\n#3 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(915): yii\\db\\Connection->getMasterPdo()\n#4 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Schema.php(483): yii\\db\\Connection->getSlavePdo()\n#5 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(824): yii\\db\\Schema->quoteValue(\'7vflqn3sqh0qik9...\')\n#6 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(175): yii\\db\\Connection->quoteValue(\'7vflqn3sqh0qik9...\')\n#7 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(866): yii\\db\\Command->getRawSql()\n#8 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(887): yii\\db\\Command->logQuery(\'yii\\\\db\\\\Command:...\')\n#9 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(388): yii\\db\\Command->queryInternal(\'fetchColumn\', 0)\n#10 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Query.php(269): yii\\db\\Command->queryScalar()\n#11 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\DbSession.php(152): yii\\db\\Query->scalar(Object(yii\\db\\Connection))\n#12 [internal function]: yii\\web\\DbSession->readSession(\'7vflqn3sqh0qik9...\')\n#13 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\Session.php(132): session_start()\n#14 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\Session.php(596): yii\\web\\Session->open()\n#15 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\User.php(650): yii\\web\\Session->get(\'__id\')\n#16 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\User.php(188): yii\\web\\User->renewAuthStatus()\n#17 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\User.php(333): yii\\web\\User->getIdentity()\n#18 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Component.php(132): yii\\web\\User->getIsGuest()\n#19 E:\\humhub\\protected\\humhub\\components\\i18n\\I18N.php(33): yii\\base\\Component->__get(\'isGuest\')\n#20 E:\\humhub\\protected\\humhub\\components\\bootstrap\\LanguageSelector.php(29): humhub\\components\\i18n\\I18N->autosetLocale()\n#21 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Application.php(320): humhub\\components\\bootstrap\\LanguageSelector->bootstrap(Object(humhub\\components\\Application))\n#22 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\Application.php(69): yii\\base\\Application->bootstrap()\n#23 E:\\humhub\\protected\\humhub\\components\\Application.php(46): yii\\web\\Application->bootstrap()\n#24 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Application.php(272): humhub\\components\\Application->bootstrap()\n#25 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Object.php(107): yii\\base\\Application->init()\n#26 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Application.php(205): yii\\base\\Object->__construct(Array)\n#27 E:\\humhub\\index.php(25): yii\\base\\Application->__construct(Array)\n#28 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[HY000] [2006] MySQL server has gone away\' in E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php:584\nStack trace:\n#0 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(928): yii\\db\\Connection->open()\n#1 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(915): yii\\db\\Connection->getMasterPdo()\n#2 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Schema.php(483): yii\\db\\Connection->getSlavePdo()\n#3 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Connection.php(824): yii\\db\\Schema->quoteValue(\'7vflqn3sqh0qik9...\')\n#4 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(175): yii\\db\\Connection->quoteValue(\'7vflqn3sqh0qik9...\')\n#5 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(866): yii\\db\\Command->getRawSql()\n#6 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(887): yii\\db\\Command->logQuery(\'yii\\\\db\\\\Command:...\')\n#7 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php(388): yii\\db\\Command->queryInternal(\'fetchColumn\', 0)\n#8 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\db\\Query.php(269): yii\\db\\Command->queryScalar()\n#9 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\DbSession.php(152): yii\\db\\Query->scalar(Object(yii\\db\\Connection))\n#10 [internal function]: yii\\web\\DbSession->readSession(\'7vflqn3sqh0qik9...\')\n#11 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\Session.php(132): session_start()\n#12 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\Session.php(596): yii\\web\\Session->open()\n#13 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\User.php(650): yii\\web\\Session->get(\'__id\')\n#14 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\User.php(188): yii\\web\\User->renewAuthStatus()\n#15 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\User.php(333): yii\\web\\User->getIdentity()\n#16 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Component.php(132): yii\\web\\User->getIsGuest()\n#17 E:\\humhub\\protected\\humhub\\components\\i18n\\I18N.php(33): yii\\base\\Component->__get(\'isGuest\')\n#18 E:\\humhub\\protected\\humhub\\components\\bootstrap\\LanguageSelector.php(29): humhub\\components\\i18n\\I18N->autosetLocale()\n#19 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Application.php(320): humhub\\components\\bootstrap\\LanguageSelector->bootstrap(Object(humhub\\components\\Application))\n#20 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\web\\Application.php(69): yii\\base\\Application->bootstrap()\n#21 E:\\humhub\\protected\\humhub\\components\\Application.php(46): yii\\web\\Application->bootstrap()\n#22 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Application.php(272): humhub\\components\\Application->bootstrap()\n#23 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Object.php(107): yii\\base\\Application->init()\n#24 E:\\humhub\\protected\\vendor\\yiisoft\\yii2\\base\\Application.php(205): yii\\base\\Object->__construct(Array)\n#25 E:\\humhub\\index.php(25): yii\\base\\Application->__construct(Array)\n#26 {main}\r\nAdditional Information:\r\n'),(2,4,'application',1514248727.2534,'[::1][-][7vflqn3sqh0qik92d4175sbb47]','$_GET = [\n    \'r\' => \'mail/mail/get-new-message-count-json\'\n]\n\n$_SERVER = [\n    \'PROCESSOR_ARCHITEW6432\' => \'AMD64\'\n    \'_FCGI_X_PIPE_\' => \'\\\\\\\\.\\\\pipe\\\\IISFCGI-5d5d5f02-02a2-4db0-95ba-9568539bce5a\'\n    \'PHP_FCGI_MAX_REQUESTS\' => \'10000\'\n    \'PHPRC\' => \'C:\\\\Program Files (x86)\\\\iis express\\\\PHP\\\\v5.6\'\n    \'ALLUSERSPROFILE\' => \'C:\\\\ProgramData\'\n    \'APPDATA\' => \'C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Roaming\'\n    \'APP_POOL_CONFIG\' => \'C:\\\\inetpub\\\\temp\\\\apppools\\\\hum\\\\hum.config\'\n    \'APP_POOL_ID\' => \'hum\'\n    \'asl_log\' => \'Destination=file\'\n    \'CommonProgramFiles\' => \'C:\\\\Program Files (x86)\\\\Common Files\'\n    \'CommonProgramFiles(x86)\' => \'C:\\\\Program Files (x86)\\\\Common Files\'\n    \'CommonProgramW6432\' => \'C:\\\\Program Files\\\\Common Files\'\n    \'COMPUTERNAME\' => \'DESKTOP-ORVCEA0\'\n    \'ComSpec\' => \'C:\\\\WINDOWS\\\\system32\\\\cmd.exe\'\n    \'LOCALAPPDATA\' => \'C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\'\n    \'NUMBER_OF_PROCESSORS\' => \'4\'\n    \'OS\' => \'Windows_NT\'\n    \'Path\' => \'C:\\\\Program Files (x86)\\\\PHP\\\\v7.0;C:\\\\ProgramData\\\\Oracle\\\\Java\\\\javapath;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\Program Files\\\\Microsoft SQL Server\\\\130\\\\Tools\\\\Binn\\\\;C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\Windows Performance Toolkit\\\\;C:\\\\Program Files (x86)\\\\CodeSmith\\\\v5.3\\\\;C:\\\\Program Files\\\\TortoiseHg\\\\;C:\\\\Program Files\\\\Git\\\\cmd;C:\\\\Program Files (x86)\\\\Microsoft SQL Server\\\\Client SDK\\\\ODBC\\\\130\\\\Tools\\\\Binn\\\\;C:\\\\Program Files (x86)\\\\Microsoft SQL Server\\\\130\\\\Tools\\\\Binn\\\\;C:\\\\Program Files (x86)\\\\Microsoft SQL Server\\\\130\\\\DTS\\\\Binn\\\\;C:\\\\Program Files (x86)\\\\Microsoft SQL Server\\\\130\\\\Tools\\\\Binn\\\\ManagementStudio\\\\;C:\\\\Program Files (x86)\\\\Skype\\\\Phone\\\\;C:\\\\Program Files\\\\Microsoft SQL Server\\\\Client SDK\\\\ODBC\\\\130\\\\Tools\\\\Binn\\\\;C:\\\\Program Files\\\\Microsoft SQL Server\\\\130\\\\DTS\\\\Binn\\\\;C:\\\\Program Files\\\\dotnet\\\\;C:\\\\Program Files (x86)\\\\Nmap;C:\\\\Program Files (x86)\\\\Microsoft VS Code\\\\bin;C:\\\\Program Files\\\\Docker Toolbox;C:\\\\Users\\\\songh\\\\AppData\\\\Roaming\\\\npm;C:\\\\;C:\\\\Program Files\\\\MySQL\\\\MySQL Server 5.1\\\\bin;C:\\\\ProgramData\\\\ComposerSetup\\\\bin;C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps\'\n    \'PATHEXT\' => \'.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC\'\n    \'PROCESSOR_ARCHITECTURE\' => \'x86\'\n    \'PROCESSOR_IDENTIFIER\' => \'Intel64 Family 6 Model 69 Stepping 1, GenuineIntel\'\n    \'PROCESSOR_LEVEL\' => \'6\'\n    \'PROCESSOR_REVISION\' => \'4501\'\n    \'ProgramData\' => \'C:\\\\ProgramData\'\n    \'ProgramFiles\' => \'C:\\\\Program Files (x86)\'\n    \'ProgramFiles(x86)\' => \'C:\\\\Program Files (x86)\'\n    \'ProgramW6432\' => \'C:\\\\Program Files\'\n    \'PSModulePath\' => \'C:\\\\Program Files\\\\WindowsPowerShell\\\\Modules;C:\\\\WINDOWS\\\\system32\\\\WindowsPowerShell\\\\v1.0\\\\Modules;C:\\\\Program Files (x86)\\\\Microsoft SQL Server\\\\130\\\\Tools\\\\PowerShell\\\\Modules\\\\\'\n    \'PUBLIC\' => \'C:\\\\Users\\\\Public\'\n    \'SynaProgDir\' => \'Synaptics\\\\SynTP\'\n    \'SystemDrive\' => \'C:\'\n    \'SystemRoot\' => \'C:\\\\WINDOWS\'\n    \'TEMP\' => \'C:\\\\WINDOWS\\\\TEMP\'\n    \'TMP\' => \'C:\\\\WINDOWS\\\\TEMP\'\n    \'USERDOMAIN\' => \'WORKGROUP\'\n    \'USERNAME\' => \'DESKTOP-ORVCEA0$\'\n    \'USERPROFILE\' => \'C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\'\n    \'VBOX_MSI_INSTALL_PATH\' => \'C:\\\\Program Files\\\\Oracle\\\\VirtualBox\\\\\'\n    \'VS110COMNTOOLS\' => \'C:\\\\Program Files (x86)\\\\Microsoft Visual Studio 11.0\\\\Common7\\\\Tools\\\\\'\n    \'VS120COMNTOOLS\' => \'C:\\\\Program Files (x86)\\\\Microsoft Visual Studio 12.0\\\\Common7\\\\Tools\\\\\'\n    \'VS140COMNTOOLS\' => \'C:\\\\Program Files (x86)\\\\Microsoft Visual Studio 14.0\\\\Common7\\\\Tools\\\\\'\n    \'windir\' => \'C:\\\\WINDOWS\'\n    \'ORIG_PATH_INFO\' => \'/index.php\'\n    \'URL\' => \'/index.php\'\n    \'SERVER_SOFTWARE\' => \'Microsoft-IIS/10.0\'\n    \'SERVER_PROTOCOL\' => \'HTTP/1.1\'\n    \'SERVER_PORT_SECURE\' => \'0\'\n    \'SERVER_PORT\' => \'88\'\n    \'SERVER_NAME\' => \'localhost\'\n    \'SCRIPT_NAME\' => \'/index.php\'\n    \'SCRIPT_FILENAME\' => \'E:\\\\humhub\\\\index.php\'\n    \'REQUEST_URI\' => \'/index.php?r=mail%2Fmail%2Fget-new-message-count-json\'\n    \'REQUEST_METHOD\' => \'GET\'\n    \'REMOTE_USER\' => \'\'\n    \'REMOTE_PORT\' => \'29125\'\n    \'REMOTE_HOST\' => \'::1\'\n    \'REMOTE_ADDR\' => \'::1\'\n    \'QUERY_STRING\' => \'r=mail%2Fmail%2Fget-new-message-count-json\'\n    \'PATH_TRANSLATED\' => \'E:\\\\humhub\\\\index.php\'\n    \'LOGON_USER\' => \'\'\n    \'LOCAL_ADDR\' => \'::1\'\n    \'INSTANCE_META_PATH\' => \'/LM/W3SVC/1\'\n    \'INSTANCE_NAME\' => \'HUM\'\n    \'INSTANCE_ID\' => \'1\'\n    \'HTTPS_SERVER_SUBJECT\' => \'\'\n    \'HTTPS_SERVER_ISSUER\' => \'\'\n    \'HTTPS_SECRETKEYSIZE\' => \'\'\n    \'HTTPS_KEYSIZE\' => \'\'\n    \'HTTPS\' => \'off\'\n    \'GATEWAY_INTERFACE\' => \'CGI/1.1\'\n    \'DOCUMENT_ROOT\' => \'E:\\\\humhub\'\n    \'CONTENT_TYPE\' => \'\'\n    \'CONTENT_LENGTH\' => \'0\'\n    \'CERT_SUBJECT\' => \'\'\n    \'CERT_SERIALNUMBER\' => \'\'\n    \'CERT_ISSUER\' => \'\'\n    \'CERT_FLAGS\' => \'\'\n    \'CERT_COOKIE\' => \'\'\n    \'AUTH_USER\' => \'\'\n    \'AUTH_PASSWORD\' => \'\'\n    \'AUTH_TYPE\' => \'\'\n    \'APPL_PHYSICAL_PATH\' => \'E:\\\\humhub\\\\\'\n    \'APPL_MD_PATH\' => \'/LM/W3SVC/1/ROOT\'\n    \'IIS_UrlRewriteModule\' => \'7.1.1952.0\'\n    \'WEBSOCKET_VERSION\' => \'13\'\n    \'HTTP_X_REQUESTED_WITH\' => \'XMLHttpRequest\'\n    \'HTTP_X_CSRF_TOKEN\' => \'rYNoP-IkB5TGl3es72bZNHGPDLEGcu96XOEAtfhfvxyXwA80yObG1Cg_B6UlkUUF0MvKMdnymFZm16nfEGYeHw==\'\n    \'HTTP_USER_AGENT\' => \'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36\'\n    \'HTTP_REFERER\' => \'http://localhost:88/index.php?r=admin%2Fuser\'\n    \'HTTP_HOST\' => \'localhost:88\'\n    \'HTTP_COOKIE\' => \'clientReader=eyJpdiI6IkdHTVZsYzQxUmFJV1ZlU1YrTHJodVE9PSIsInZhbHVlIjoid2h1aE5ncEV1WkNiV0lycDZVTXhEQT09IiwibWFjIjoiYzZmNjdiOGYyY2QzZTliYWZhOTA5MGEzNWQ4YzA3YTNiMTNkZjY0ZjgyYTc0YzAxNTEzYzcxYjM5MjAwMTk1YiJ9; pageReader=0.3944355184506496; Hm_lvt_744edc12315468ba7f6a9ce159e6d177=1506621719,1506641699,1506709761; Abp.TenantId=1; Abp.Localization.CultureName=en; __atuvc=3%7C47; __utma=111872281.42264438.1503972639.1511814946.1511814946.1; __utmz=111872281.1511814946.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); .Nop.Customer=4e261a78-55d9-4e94-b029-baedaf43582f; NOPCOMMERCE.AUTH=E1D5A1A251CFDEF02867B423F6124E8442E687065D0CFE3044A672A83B08265344F0EAF26AB9C0D07E439E8F7FE5C3DFD102E34BEB33836DEAA99B030D6649BE17C34EB062C0B20E9490D9275EDF1BDEB51367E2A26DC5641A5BE4AF49429E77E4677A465091F7DE56EDB8924088F814B78934736D0AD65A8C0B1610C0DB05390815FFE52CE9A7410F1FB26DBB603B908DB03862E0030C2D19EAFB61A9951F4A; Nop.customer=13899de2-3d5c-4db3-815d-86c040bf74f8; Hm_lvt_f256517762bb81bd074627f69b8fe90f=1512247247,1512412586,1512869295,1513106453; _ga=GA1.1.42264438.1503972639; remember_web_59ba36addc2b2f9401580f014c7f58ea4e30989d=eyJpdiI6IjlBaVVlSjRGMXM5Yk1aSXduVSswOHc9PSIsInZhbHVlIjoib0lTTUhcLzRrcFBoXC9Qd2ZXSFg5T3lWUjlFb0F5dzBQWlwvMWUrSDdTR2NESEJ6NFdZdE5nTkcrSmJyWmVoRDlEMk1zQ3JncDNkVFA5aGhDSElWNHQ5NDJmQVc1NDNXNmV3bjlIM09PWGJ0ajgyMFJDOW9YNkw4ODFiaWlaV3hQczQiLCJtYWMiOiI2NDM3N2MyYjc2ZWJjYzZlODljY2E5ZjE4OGI5NWJlMWZkYzcyZDZmYWRhODYwNDJlYmNiYzdhNDJlNDZmMDk0In0%3D; _gid=GA1.1.1582532054.1514246746; _csrf=4a9cfb70abddb9f106b6418da5cf31fb99c58bc23115e96878dde1dfee7c8abda%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22%3ACg%0B%2A%C2%C1%40%EE%A8p%09%CA%F7%9C1%A1D%C6%80%DF%80w%2C%3A6%A9j%E89%A1%03%22%3B%7D; pm_new-people-panel=expanded; pm_new-spaces-panel=expanded; pm_user-statistics-panel=expanded; PHPSESSID=7vflqn3sqh0qik92d4175sbb47; _identity=123f835d99d8c77814535664cec96dddcf67d058fad3e9e8e5dea12f97bc0506a%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%22c200f9e8-1d6c-4347-a6e2-4479e824eccc%22%2C2592000%5D%22%3B%7D; pm_getting-started-panel=expanded; pm_user-tags-panel=expanded; pm_user-spaces-panel=expanded\'\n    \'HTTP_ACCEPT_LANGUAGE\' => \'en-CA,en-GB;q=0.9,en-US;q=0.8,en;q=0.7\'\n    \'HTTP_ACCEPT_ENCODING\' => \'gzip, deflate, br\'\n    \'HTTP_ACCEPT\' => \'application/json, text/javascript, */*; q=0.01\'\n    \'HTTP_CONNECTION\' => \'keep-alive\'\n    \'FCGI_ROLE\' => \'RESPONDER\'\n    \'PHP_SELF\' => \'/index.php\'\n    \'REQUEST_TIME_FLOAT\' => 1514248727.227\n    \'REQUEST_TIME\' => 1514248727\n]');

#
# Structure for table "message"
#

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_updated` (`updated_at`),
  KEY `index_updated_by` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "message"
#


#
# Structure for table "message_entry"
#

DROP TABLE IF EXISTS `message_entry`;
CREATE TABLE `message_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "message_entry"
#


#
# Structure for table "migration"
#

DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "migration"
#

INSERT INTO `migration` VALUES ('m000000_000000_base',1514246986),('m131023_164513_initial',1514247001),('m131023_165411_initial',1514247003),('m131023_165507_initial',1514247736),('m131023_165625_initial',1514247005),('m131023_165755_initial',1514247006),('m131023_165835_initial',1514247007),('m131023_165921_initial',1514247756),('m131023_170033_initial',1514247008),('m131023_170135_initial',1514247009),('m131023_170159_initial',1514247010),('m131023_170253_initial',1514247011),('m131023_170339_initial',1514247012),('m131030_122743_longer_questions',1514247757),('m131203_110444_oembed',1514247014),('m131213_165552_user_optimize',1514247018),('m140226_111945_ldap',1514247021),('m140303_125031_password',1514247023),('m140304_142711_memberautoadd',1514247024),('m140321_000917_content',1514247026),('m140324_170617_membership',1514247027),('m140507_150421_create_settings_table',1514247028),('m140507_171527_create_settings_table',1514247029),('m140512_141414_i18n_profilefields',1514247031),('m140513_180317_createlogging',1514247032),('m140701_000611_profile_genderfield',1514247033),('m140701_074404_protect_default_profilefields',1514247036),('m140702_143912_notify_notification_unify',1514247038),('m140703_104527_profile_birthdayfield',1514247038),('m140704_080659_installationid',1514247039),('m140705_065525_emailing_settings',1514247041),('m140706_135210_lastlogin',1514247042),('m140829_122906_delete',1514247044),('m140830_145504_following',1514247046),('m140901_080147_indizies',1514247047),('m140901_080432_indices',1514247048),('m140901_112246_addState',1514247051),('m140901_153403_addState',1514247054),('m140901_170329_group_create_space',1514247055),('m140902_091234_session_key_length',1514247056),('m140907_140822_zip_field_to_text',1514247057),('m140930_205511_fix_default',1514247058),('m140930_205859_fix_default',1514247059),('m140930_210142_fix_default',1514247061),('m140930_210635_fix_default',1514247063),('m140930_212528_fix_default',1514247065),('m141002_093710_fix_default',1514247758),('m141015_173305_follow_notifications',1514247067),('m141019_093319_mentioning',1514247068),('m141020_162639_fix_default',1514247070),('m141020_193920_rm_alsocreated',1514247071),('m141020_193931_rm_alsoliked',1514247072),('m141021_162639_oembed_setting',1514247074),('m141022_094635_addDefaults',1514247075),('m141106_185632_log_init',1514247077),('m150204_103433_html5_notified',1514247079),('m150210_190006_user_invite_lang',1514247080),('m150302_114347_add_visibility',1514247081),('m150322_194403_remove_type_field',1514247082),('m150322_195619_allowedExt2Text',1514247083),('m150429_190600_indexes',1514247738),('m150429_223856_optimize',1514247085),('m150510_102900_update',1514247085),('m150629_220311_change',1514247088),('m150703_012735_typelength',1514247090),('m150703_024635_activityTypes',1514247093),('m150703_033650_namespace',1514247102),('m150703_130157_migrate',1514247109),('m150704_005338_namespace',1514247116),('m150704_005418_namespace',1514247123),('m150704_005434_namespace',1514247130),('m150704_005452_namespace',1514247137),('m150704_005504_namespace',1514247148),('m150709_050451_namespace',1514247745),('m150709_151858_namespace',1514247766),('m150713_054441_timezone',1514247149),('m150714_093525_activity',1514247153),('m150714_100355_cleanup',1514247159),('m150831_061628_notifications',1514247164),('m150910_223305_fix_user_follow',1514247165),('m150924_133344_update_notification_fix',1514247166),('m150924_154635_user_invite_add_first_lastname',1514247167),('m150927_190830_create_contentcontainer',1514247170),('m150928_103711_permissions',1514247171),('m150928_134934_groups',1514247174),('m150928_140718_setColorVariables',1514247175),('m151010_124437_group_permissions',1514247177),('m151010_175000_default_visibility',1514247178),('m151013_223814_include_dashboard',1514247179),('m151022_131128_module_fix',1514247182),('m151106_090948_addColor',1514247183),('m151223_171310_fix_notifications',1514247183),('m151226_164234_authclient',1514247185),('m160125_053702_stored_filename',1514247186),('m160205_203840_foreign_keys',1514247190),('m160205_203913_foreign_keys',1514247194),('m160205_203939_foreign_keys',1514247195),('m160205_203955_foreign_keys',1514247196),('m160205_204000_foreign_keys',1514247197),('m160205_204010_foreign_keys',1514247198),('m160205_205540_foreign_keys',1514247199),('m160216_160119_initial',1514247201),('m160217_161220_addCanLeaveFlag',1514247202),('m160218_132531_close_and_anonymous_poll',1514247767),('m160220_013525_contentcontainer_id',1514247207),('m160221_222312_public_permission_change',1514247209),('m160225_180229_remove_website',1514247210),('m160227_073020_birthday_date',1514247211),('m160229_162959_multiusergroups',1514247216),('m160309_141222_longerUserName',1514247217),('m160408_100725_rename_groupadmin_to_manager',1514247218),('m160415_180332_wall_remove',1514247222),('m160501_220850_activity_pk_int',1514247223),('m160507_202611_settings',1514247226),('m160508_005740_settings_cleanup',1514247241),('m160509_214811_spaceurl',1514247243),('m160517_132535_group',1514247244),('m160523_105732_profile_searchable',1514247245),('m160714_142827_remove_space_id',1514247246),('m161031_161947_file_directories',1514247247),('m170110_151419_membership_notifications',1514247248),('m170110_152425_space_follow_reset_send_notification',1514247250),('m170111_190400_disable_web_notifications',1514247251),('m170112_115052_settings',1514247255),('m170118_111823_queuetable',1514247256),('m170118_162332_streamchannel',1514247259),('m170119_160740_initial',1514247260),('m170123_125622_pinned',1514247261),('m170211_105743_show_in_stream',1514247262),('m170224_100937_fix_default_modules',1514247265),('m170307_170300_queuelater',1514247266),('m170723_133337_content_tag',1514247269),('m170805_211208_authclient_id',1514247271),('m170810_220543_group_sort',1514247273);

#
# Structure for table "module_enabled"
#

DROP TABLE IF EXISTS `module_enabled`;
CREATE TABLE `module_enabled` (
  `module_id` varchar(100) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "module_enabled"
#

INSERT INTO `module_enabled` VALUES ('mail'),('polls');

#
# Structure for table "poll"
#

DROP TABLE IF EXISTS `poll`;
CREATE TABLE `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `allow_multiple` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `is_random` tinyint(1) DEFAULT '0',
  `closed` tinyint(1) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "poll"
#

INSERT INTO `poll` VALUES (1,'Right now, we are in the planning stages for our next meetup and we would like to know from you, where you would like to go?',0,'2017-12-26 08:26:18',1,'2017-12-26 08:26:18',1,0,0,0);

#
# Structure for table "poll_answer"
#

DROP TABLE IF EXISTS `poll_answer`;
CREATE TABLE `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

#
# Data for table "poll_answer"
#

INSERT INTO `poll_answer` VALUES (1,1,'To Daniel','2017-12-26 08:26:26',1,'2017-12-26 08:26:26',1),(2,1,'Club A Steakhouse','2017-12-26 08:26:26',1,'2017-12-26 08:26:26',1),(3,1,'Pisillo Italian Panini','2017-12-26 08:26:26',1,'2017-12-26 08:26:26',1);

#
# Structure for table "poll_answer_user"
#

DROP TABLE IF EXISTS `poll_answer_user`;
CREATE TABLE `poll_answer_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `poll_answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

#
# Data for table "poll_answer_user"
#

INSERT INTO `poll_answer_user` VALUES (1,1,2,'2017-12-26 08:26:28',2,'2017-12-26 08:26:28',2),(2,1,3,'2017-12-26 08:26:42',3,'2017-12-26 08:26:42',3);

#
# Structure for table "post"
#

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_2trash` text,
  `message` text,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

#
# Data for table "post"
#

INSERT INTO `post` VALUES (1,NULL,'Yay! I\'ve just installed HumHub ;Cool;',NULL,'2017-12-26 08:24:10',1,'2017-12-26 08:24:10',1),(2,NULL,'We\'re looking for great slogans of famous brands. Maybe you can come up with some samples?',NULL,'2017-12-26 08:25:30',1,'2017-12-26 08:25:30',1),(3,NULL,'中文的显示',NULL,'2017-12-26 08:43:15',1,'2017-12-26 08:43:15',1);

#
# Structure for table "profile_field_category"
#

DROP TABLE IF EXISTS `profile_field_category`;
CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

#
# Data for table "profile_field_category"
#

INSERT INTO `profile_field_category` VALUES (1,'General','',100,NULL,1,'2017-12-26 08:14:50',NULL,'2017-12-26 08:14:50',NULL,NULL,1),(2,'Communication','',200,NULL,1,'2017-12-26 08:14:51',NULL,'2017-12-26 08:14:51',NULL,NULL,1),(3,'Social bookmarks','',300,NULL,1,'2017-12-26 08:14:51',NULL,'2017-12-26 08:14:51',NULL,NULL,1);

#
# Structure for table "profile_field"
#

DROP TABLE IF EXISTS `profile_field`;
CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_profile_field_category` (`profile_field_category_id`),
  CONSTRAINT `fk_profile_field-profile_field_category_id` FOREIGN KEY (`profile_field_category_id`) REFERENCES `profile_field_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

#
# Data for table "profile_field"
#

INSERT INTO `profile_field` VALUES (1,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":20,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','firstname','First name',NULL,100,1,1,1,1,'2017-12-26 08:14:52',NULL,'2017-12-26 08:14:54',NULL,'givenName',NULL,1,1),(2,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":30,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','lastname','Last name',NULL,200,1,1,1,1,'2017-12-26 08:14:55',NULL,'2017-12-26 08:14:56',NULL,'sn',NULL,1,1),(3,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":50,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','title','Title',NULL,300,NULL,NULL,1,1,'2017-12-26 08:14:57',NULL,'2017-12-26 08:14:59',NULL,'title',NULL,1,1),(4,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Select','{\"options\":\"male=>Male\\nfemale=>Female\\ncustom=>Custom\",\"fieldTypes\":[]}','gender','Gender',NULL,300,NULL,NULL,1,1,'2017-12-26 08:15:00',NULL,'2017-12-26 08:15:02',NULL,NULL,NULL,1,1),(5,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":150,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','street','Street',NULL,400,NULL,NULL,1,1,'2017-12-26 08:15:03',NULL,'2017-12-26 08:15:04',NULL,NULL,NULL,1,1),(6,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":10,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','zip','Zip',NULL,500,NULL,NULL,1,1,'2017-12-26 08:15:05',NULL,'2017-12-26 08:15:07',NULL,NULL,NULL,1,1),(7,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','city','City',NULL,600,NULL,NULL,1,1,'2017-12-26 08:15:08',NULL,'2017-12-26 08:15:10',NULL,NULL,NULL,1,1),(8,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\CountrySelect','{\"options\":null,\"fieldTypes\":[]}','country','Country',NULL,700,NULL,NULL,1,1,'2017-12-26 08:15:11',NULL,'2017-12-26 08:15:12',NULL,NULL,NULL,1,1),(9,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','state','State',NULL,800,NULL,NULL,1,1,'2017-12-26 08:15:14',NULL,'2017-12-26 08:15:15',NULL,NULL,NULL,1,1),(10,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\Birthday','{\"defaultHideAge\":false,\"fieldTypes\":[]}','birthday','Birthday',NULL,900,NULL,NULL,1,1,'2017-12-26 08:15:16',NULL,'2017-12-26 08:15:19',NULL,NULL,NULL,1,1),(11,1,NULL,'humhub\\modules\\user\\models\\fieldtype\\TextArea','{\"fieldTypes\":[]}','about','About',NULL,900,NULL,NULL,1,1,'2017-12-26 08:15:20',NULL,'2017-12-26 08:15:22',NULL,NULL,NULL,1,1),(12,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','phone_private','Phone Private',NULL,100,NULL,NULL,1,1,'2017-12-26 08:15:23',NULL,'2017-12-26 08:15:24',NULL,NULL,NULL,1,1),(13,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','phone_work','Phone Work',NULL,200,NULL,NULL,1,1,'2017-12-26 08:15:25',NULL,'2017-12-26 08:15:27',NULL,NULL,NULL,1,1),(14,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','mobile','Mobile',NULL,300,NULL,NULL,1,1,'2017-12-26 08:15:28',NULL,'2017-12-26 08:15:30',NULL,NULL,NULL,1,1),(15,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','fax','Fax',NULL,400,NULL,NULL,1,1,'2017-12-26 08:15:31',NULL,'2017-12-26 08:15:32',NULL,NULL,NULL,1,1),(16,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','im_skype','Skype Nickname',NULL,500,NULL,NULL,1,1,'2017-12-26 08:15:34',NULL,'2017-12-26 08:15:35',NULL,NULL,NULL,1,1),(17,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":100,\"validator\":null,\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','im_msn','MSN',NULL,600,NULL,NULL,1,1,'2017-12-26 08:15:36',NULL,'2017-12-26 08:15:38',NULL,NULL,NULL,1,1),(18,2,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"email\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','im_xmpp','XMPP Jabber Address',NULL,800,NULL,NULL,1,1,'2017-12-26 08:15:39',NULL,'2017-12-26 08:15:40',NULL,NULL,NULL,1,1),(19,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url','Url',NULL,100,NULL,NULL,1,1,'2017-12-26 08:15:42',NULL,'2017-12-26 08:15:43',NULL,NULL,NULL,1,1),(20,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_facebook','Facebook URL',NULL,200,NULL,NULL,1,1,'2017-12-26 08:15:44',NULL,'2017-12-26 08:15:46',NULL,NULL,NULL,1,1),(21,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_linkedin','LinkedIn URL',NULL,300,NULL,NULL,1,1,'2017-12-26 08:15:47',NULL,'2017-12-26 08:15:49',NULL,NULL,NULL,1,1),(22,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_xing','Xing URL',NULL,400,NULL,NULL,1,1,'2017-12-26 08:15:50',NULL,'2017-12-26 08:15:51',NULL,NULL,NULL,1,1),(23,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_youtube','Youtube URL',NULL,500,NULL,NULL,1,1,'2017-12-26 08:15:52',NULL,'2017-12-26 08:15:54',NULL,NULL,NULL,1,1),(24,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_vimeo','Vimeo URL',NULL,600,NULL,NULL,1,1,'2017-12-26 08:15:55',NULL,'2017-12-26 08:15:57',NULL,NULL,NULL,1,1),(25,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_flickr','Flickr URL',NULL,700,NULL,NULL,1,1,'2017-12-26 08:15:58',NULL,'2017-12-26 08:15:59',NULL,NULL,NULL,1,1),(26,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_myspace','MySpace URL',NULL,800,NULL,NULL,1,1,'2017-12-26 08:16:01',NULL,'2017-12-26 08:16:02',NULL,NULL,NULL,1,1),(27,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_googleplus','Google+ URL',NULL,900,NULL,NULL,1,1,'2017-12-26 08:16:03',NULL,'2017-12-26 08:16:05',NULL,NULL,NULL,1,1),(28,3,NULL,'humhub\\modules\\user\\models\\fieldtype\\Text','{\"minLength\":null,\"maxLength\":255,\"validator\":\"url\",\"default\":null,\"regexp\":null,\"regexpErrorMessage\":null,\"fieldTypes\":[]}','url_twitter','Twitter URL',NULL,1000,NULL,NULL,1,1,'2017-12-26 08:16:06',NULL,'2017-12-26 08:16:07',NULL,NULL,NULL,1,1);

#
# Structure for table "queue"
#

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `job` blob NOT NULL,
  `created_at` int(11) NOT NULL,
  `timeout` int(11) NOT NULL DEFAULT '0',
  `started_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `started_at` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "queue"
#


#
# Structure for table "setting"
#

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text,
  `module_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unique-setting` (`name`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

#
# Data for table "setting"
#

INSERT INTO `setting` VALUES (1,'oembedProviders','{\"vimeo.com\":\"http:\\/\\/vimeo.com\\/api\\/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450\",\"youtube.com\":\"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450\",\"youtu.be\":\"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450\",\"soundcloud.com\":\"https:\\/\\/soundcloud.com\\/oembed?url=%url%&format=json&maxwidth=450\",\"slideshare.net\":\"https:\\/\\/www.slideshare.net\\/api\\/oembed\\/2?url=%url%&format=json&maxwidth=450\"}','base'),(2,'defaultVisibility','1','space'),(3,'defaultJoinPolicy','1','space'),(4,'name','Utisfy','base'),(5,'baseUrl','http://localhost:88','base'),(6,'paginationSize','10','base'),(7,'displayNameFormat','{profile.firstname} {profile.lastname}','base'),(8,'horImageScrollOnMobile','1','base'),(9,'auth.ldap.refreshUsers','1','user'),(10,'auth.needApproval','1','user'),(11,'auth.anonymousRegistration','1','user'),(12,'auth.internalUsersCanInvite','1','user'),(13,'mailer.transportType','php','base'),(14,'mailer.systemEmailAddress','social@example.com','base'),(15,'mailer.systemEmailName','Utisfy','base'),(16,'mailSummaryInterval','2','activity'),(17,'maxFileSize','5242880','file'),(18,'maxPreviewImageWidth','200','file'),(19,'maxPreviewImageHeight','200','file'),(20,'hideImageFileInfo','0','file'),(21,'cache.class','yii\\caching\\FileCache','base'),(22,'cache.expireTime','3600','base'),(23,'installationId','770ffb9b2d0d821ed29e99a6287580f1','admin'),(24,'theme','HumHub','base'),(25,'spaceOrder','0','space'),(26,'enable','1','tour'),(27,'defaultLanguage','en-US','base'),(28,'enable_html5_desktop_notifications','0','notification'),(29,'useCase','community','base'),(30,'auth.allowGuestAccess','1','user'),(31,'enable','1','friendship'),(32,'sampleData','1','installer'),(33,'secret','81d49962-8f14-4623-8bef-58a2934a3a41','base'),(34,'colorDefault','#ededed','base'),(35,'colorPrimary','#ededed','base'),(36,'colorInfo','#ededed','base'),(37,'colorSuccess','#ededed','base'),(38,'colorWarning','#ededed','base'),(39,'colorDanger','#ededed','base'),(40,'timeZone','America/Los_Angeles','base'),(41,'group.adminGroupId','1','user');

#
# Structure for table "space"
#

DROP TABLE IF EXISTS `space`;
CREATE TABLE `space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tags` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT '1',
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url-unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "space"
#

INSERT INTO `space` VALUES (1,'e962083e-d72c-47e2-b883-52d8e6352f09','Welcome Space','Your first sample space to discover the platform.',2,2,1,NULL,'2017-12-26 08:23:58',1,'2017-12-26 08:23:58',1,NULL,1,2,NULL,'#6fdbe8',1,'welcome-space');

#
# Structure for table "group"
#

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `space_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT '0',
  `show_at_registration` tinyint(1) NOT NULL DEFAULT '1',
  `show_at_directory` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `fk_group-space_id` (`space_id`),
  CONSTRAINT `fk_group-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

#
# Data for table "group"
#

INSERT INTO `group` VALUES (1,NULL,'Administrator','Administrator Group','2017-12-26 08:13:34',NULL,NULL,NULL,NULL,1,0,0,100),(2,NULL,'Users','Example Group by Installer','2017-12-26 08:16:09',NULL,'2017-12-26 08:16:09',NULL,NULL,0,1,0,100);

#
# Structure for table "group_permission"
#

DROP TABLE IF EXISTS `group_permission`;
CREATE TABLE `group_permission` (
  `permission_id` varchar(150) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permission_id`,`group_id`,`module_id`),
  KEY `fk_group_permission-group_id` (`group_id`),
  CONSTRAINT `fk_group_permission-group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "group_permission"
#


#
# Structure for table "space_module"
#

DROP TABLE IF EXISTS `space_module`;
CREATE TABLE `space_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) NOT NULL,
  `space_id` int(11) DEFAULT NULL,
  `state` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_space_module-space_id` (`space_id`),
  KEY `fk_space_module-module_id` (`module_id`),
  CONSTRAINT `fk_space_module-module_id` FOREIGN KEY (`module_id`) REFERENCES `module_enabled` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_space_module-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "space_module"
#

INSERT INTO `space_module` VALUES (1,'polls',1,1);

#
# Structure for table "url_oembed"
#

DROP TABLE IF EXISTS `url_oembed`;
CREATE TABLE `url_oembed` (
  `url` varchar(180) NOT NULL,
  `preview` text NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "url_oembed"
#


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `tags` text,
  `language` varchar(5) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT '1',
  `time_zone` varchar(100) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `authclient_id` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_username` (`username`),
  UNIQUE KEY `unique_guid` (`guid`),
  UNIQUE KEY `unique_authclient_id` (`authclient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'c200f9e8-1d6c-4347-a6e2-4479e824eccc',1,'songhongli','songhongli@gmail.com','local','Administration, Support, HumHub','','2017-12-26 08:23:46',NULL,'2017-12-26 08:23:46',NULL,'2017-12-26 08:39:53',1,NULL,1,NULL),(2,'e7abc09d-625e-4004-b482-4c7e14221c7e',1,'david1986','david.roberts@example.com','local','Microsoft Office, Marketing, SEM, Digital Native','','2017-12-26 08:24:54',1,'2017-12-26 08:24:54',1,NULL,1,NULL,3,NULL),(3,'87cfd26b-7b42-437b-8f08-b46561f0583b',1,'sara1989','sara.schuster@example.com','local','Yoga, Travel, English, German, French','','2017-12-26 08:25:13',1,'2017-12-26 08:25:13',1,NULL,1,NULL,4,NULL),(4,'bf1de9ff-cfca-4828-846b-3b2668801a18',1,'utisfy','info@utisfy.com','local',NULL,'en-US','2017-12-26 08:35:11',1,'2017-12-26 08:36:32',1,'2017-12-26 08:37:22',1,'America/Los_Angeles',5,NULL);

#
# Structure for table "space_membership"
#

DROP TABLE IF EXISTS `space_membership`;
CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT '1',
  `can_cancel_membership` int(11) DEFAULT '1',
  `send_notifications` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`space_id`,`user_id`),
  KEY `index_status` (`status`),
  KEY `fk_space_membership-user_id` (`user_id`),
  CONSTRAINT `fk_space_membership-space_id` FOREIGN KEY (`space_id`) REFERENCES `space` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_space_membership-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "space_membership"
#

INSERT INTO `space_membership` VALUES (1,1,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'admin',1,1,0),(1,2,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,1,0),(1,3,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,1,0),(1,4,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'member',1,1,0);

#
# Structure for table "group_user"
#

DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  KEY `fk-group-group` (`group_id`),
  CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "group_user"
#

INSERT INTO `group_user` VALUES (1,1,1,0,'2017-12-26 08:23:56',NULL,'2017-12-26 08:23:56',NULL),(2,2,2,0,'2017-12-26 08:25:11',1,'2017-12-26 08:25:11',1),(3,3,2,0,'2017-12-26 08:25:25',1,'2017-12-26 08:25:25',1),(4,4,2,0,'2017-12-26 08:35:24',1,'2017-12-26 08:35:24',1);

#
# Structure for table "profile"
#

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_skype` varchar(255) DEFAULT NULL,
  `im_msn` varchar(255) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_flickr` varchar(255) DEFAULT NULL,
  `url_myspace` varchar(255) DEFAULT NULL,
  `url_googleplus` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "profile"
#

INSERT INTO `profile` VALUES (1,'Alex','Song','System Administration',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'David','Roberts','Late riser',NULL,'2443 Queens Lane','24574','Allwood','Virginia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Sara','Schuster','Do-gooder',NULL,'Schmarjestrasse 51','17095','Friedland','Niedersachsen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Utisfy','Song',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "notification"
#

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT '0',
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  `group_key` varchar(75) DEFAULT NULL,
  `send_web_notifications` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`),
  KEY `index_seen` (`seen`),
  KEY `index_desktop_notified` (`desktop_notified`),
  KEY `index_desktop_emailed` (`emailed`),
  KEY `index_groupuser` (`user_id`,`class`,`group_key`),
  CONSTRAINT `fk_notification-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

#
# Data for table "notification"
#

INSERT INTO `notification` VALUES (1,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',1,1,0,'2017-12-26 08:26:59',1,2,'comment','humhub\\modules\\post\\models\\Post-2',1),(2,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',2,1,0,'2017-12-26 08:27:02',1,3,'comment','humhub\\modules\\post\\models\\Post-2',1),(3,'humhub\\modules\\comment\\notifications\\NewComment',2,0,'humhub\\modules\\comment\\models\\Comment',2,1,0,'2017-12-26 08:27:03',0,3,'comment','humhub\\modules\\post\\models\\Post-2',1),(4,'humhub\\modules\\like\\notifications\\NewLike',2,0,'humhub\\modules\\like\\models\\Like',1,1,0,'2017-12-26 08:27:06',0,3,'like','humhub\\modules\\comment\\models\\Comment-1',1),(5,'humhub\\modules\\like\\notifications\\NewLike',1,0,'humhub\\modules\\like\\models\\Like',2,1,0,'2017-12-26 08:27:09',1,3,'like','humhub\\modules\\post\\models\\Post-2',1),(6,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',3,1,0,'2017-12-26 08:27:12',1,2,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(7,'humhub\\modules\\comment\\notifications\\NewComment',1,0,'humhub\\modules\\comment\\models\\Comment',4,1,0,'2017-12-26 08:27:14',1,3,'comment','humhub\\modules\\polls\\models\\Poll-1',1),(8,'humhub\\modules\\comment\\notifications\\NewComment',2,0,'humhub\\modules\\comment\\models\\Comment',4,1,0,'2017-12-26 08:27:16',0,3,'comment','humhub\\modules\\polls\\models\\Poll-1',1);

#
# Structure for table "like"
#

DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_like-created_by` (`created_by`),
  KEY `fk_like-target_user_id` (`target_user_id`),
  CONSTRAINT `fk_like-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like-target_user_id` FOREIGN KEY (`target_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

#
# Data for table "like"
#

INSERT INTO `like` VALUES (1,NULL,'humhub\\modules\\comment\\models\\Comment',1,'2017-12-26 08:26:02',3,'2017-12-26 08:26:02',3),(2,NULL,'humhub\\modules\\post\\models\\Post',2,'2017-12-26 08:26:08',3,'2017-12-26 08:26:08',3);

#
# Structure for table "file"
#

DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) DEFAULT NULL,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `show_in_stream` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_object` (`object_model`,`object_id`),
  KEY `fk_file-created_by` (`created_by`),
  CONSTRAINT `fk_file-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "file"
#


#
# Structure for table "content"
#

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `pinned` tinyint(4) DEFAULT NULL,
  `archived` tinytext,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `stream_sort_date` datetime DEFAULT NULL,
  `stream_channel` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  UNIQUE KEY `index_guid` (`guid`),
  KEY `fk-contentcontainer` (`contentcontainer_id`),
  KEY `fk-create-user` (`created_by`),
  KEY `fk-update-user` (`updated_by`),
  KEY `stream_channe` (`stream_channel`),
  CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

#
# Data for table "content"
#

INSERT INTO `content` VALUES (1,'2dfe1539-dc3a-41b5-ab9c-232fc862b779','humhub\\modules\\activity\\models\\Activity',1,1,0,'0','2017-12-26 08:24:05',1,'2017-12-26 08:24:05',1,2,'2017-12-26 08:24:05','activity'),(2,'e1eff7d8-4cd1-417f-8912-9689a4dac165','humhub\\modules\\post\\models\\Post',1,1,0,'0','2017-12-26 08:24:12',1,'2017-12-26 08:24:12',1,2,'2017-12-26 08:24:12','default'),(3,'dc888d32-34f7-4647-bb70-9df70c139981','humhub\\modules\\activity\\models\\Activity',2,1,0,'0','2017-12-26 08:24:16',1,'2017-12-26 08:24:16',1,2,'2017-12-26 08:24:16','activity'),(4,'e6caddc7-ffa6-4667-9cb4-5571f6114fc9','humhub\\modules\\activity\\models\\Activity',3,0,0,'0','2017-12-26 08:25:02',2,'2017-12-26 08:25:02',1,2,'2017-12-26 08:25:02','activity'),(5,'4e03f321-d8bc-474e-aec3-68d836d3f572','humhub\\modules\\activity\\models\\Activity',4,0,0,'0','2017-12-26 08:25:18',3,'2017-12-26 08:25:18',1,2,'2017-12-26 08:25:18','activity'),(6,'aca301cf-9054-4cbe-bf09-13a26a3bbf02','humhub\\modules\\post\\models\\Post',2,0,0,'0','2017-12-26 08:25:33',1,'2017-12-26 08:25:33',1,2,'2017-12-26 08:26:01','default'),(7,'f750f372-a33d-414f-b93d-0e5c8f0e3b65','humhub\\modules\\activity\\models\\Activity',5,0,0,'0','2017-12-26 08:25:36',1,'2017-12-26 08:25:36',1,2,'2017-12-26 08:25:36','activity'),(8,'0bae1c52-8faa-4827-906e-dbd6be0e865b','humhub\\modules\\activity\\models\\Activity',6,0,0,'0','2017-12-26 08:25:43',2,'2017-12-26 08:25:43',2,2,'2017-12-26 08:25:43','activity'),(9,'a34bd473-af07-44da-830d-38307e1b9239','humhub\\modules\\activity\\models\\Activity',7,0,0,'0','2017-12-26 08:25:53',3,'2017-12-26 08:25:53',3,2,'2017-12-26 08:25:53','activity'),(10,'11db5dd6-99a7-43fc-99d3-262a0dd42938','humhub\\modules\\activity\\models\\Activity',8,0,0,'0','2017-12-26 08:26:05',3,'2017-12-26 08:26:05',3,2,'2017-12-26 08:26:05','activity'),(11,'2ed7c4b7-698a-4b24-bbea-8936985ddf8e','humhub\\modules\\activity\\models\\Activity',9,0,0,'0','2017-12-26 08:26:11',3,'2017-12-26 08:26:11',3,2,'2017-12-26 08:26:11','activity'),(12,'a8ec0a95-2844-4964-bc0c-6b52a3087b5d','humhub\\modules\\polls\\models\\Poll',1,0,0,'0','2017-12-26 08:26:19',1,'2017-12-26 08:26:19',1,2,'2017-12-26 08:26:56','default'),(13,'51ac0976-149a-43a4-b340-a6dd5e943557','humhub\\modules\\activity\\models\\Activity',10,0,0,'0','2017-12-26 08:26:22',1,'2017-12-26 08:26:22',1,2,'2017-12-26 08:26:22','activity'),(14,'58a11ed2-2ea6-4e72-bf8d-37bfb6932fab','humhub\\modules\\activity\\models\\Activity',11,0,0,'0','2017-12-26 08:26:30',2,'2017-12-26 08:26:30',2,2,'2017-12-26 08:26:30','activity'),(15,'a3a6cbae-55c4-4686-b7a1-18d3765c60a0','humhub\\modules\\activity\\models\\Activity',12,0,0,'0','2017-12-26 08:26:35',2,'2017-12-26 08:26:35',2,2,'2017-12-26 08:26:35','activity'),(16,'28efcb42-7ae7-460c-ae71-2a9a3d4b203c','humhub\\modules\\activity\\models\\Activity',13,0,0,'0','2017-12-26 08:26:45',3,'2017-12-26 08:26:45',3,2,'2017-12-26 08:26:45','activity'),(17,'eb9e9c2e-7f52-4686-b9c9-a53eff56fdba','humhub\\modules\\activity\\models\\Activity',14,0,0,'0','2017-12-26 08:26:49',3,'2017-12-26 08:26:49',3,2,'2017-12-26 08:26:49','activity'),(18,'76ec3cf8-301b-482d-9452-e8c718bbc3fb','humhub\\modules\\activity\\models\\Activity',15,0,0,'0','2017-12-26 08:35:17',4,'2017-12-26 08:35:17',1,2,'2017-12-26 08:35:17','activity'),(19,'a686819a-c6d0-4f41-a16f-92bc814210ba','humhub\\modules\\post\\models\\Post',3,1,0,'0','2017-12-26 08:43:17',1,'2017-12-26 08:43:17',1,1,'2017-12-26 08:43:17','default'),(20,'8c45e827-5a9b-41e2-a00f-9f5f1f02b0a9','humhub\\modules\\activity\\models\\Activity',16,1,0,'0','2017-12-26 08:43:20',1,'2017-12-26 08:43:20',1,1,'2017-12-26 08:43:20','activity');

#
# Structure for table "content_tag_relation"
#

DROP TABLE IF EXISTS `content_tag_relation`;
CREATE TABLE `content_tag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-content-tag-rel-content-id` (`content_id`),
  KEY `fk-content-tag-rel-tag-id` (`tag_id`),
  CONSTRAINT `fk-content-tag-rel-content-id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-content-tag-rel-tag-id` FOREIGN KEY (`tag_id`) REFERENCES `content_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "content_tag_relation"
#


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment-created_by` (`created_by`),
  CONSTRAINT `fk_comment-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "comment"
#

INSERT INTO `comment` VALUES (1,'Nike – Just buy it. ;Wink;','humhub\\modules\\post\\models\\Post',2,'2017-12-26 08:25:39',2,'2017-12-26 08:25:39',2),(2,'Calvin Klein – Between love and madness lies obsession.','humhub\\modules\\post\\models\\Post',2,'2017-12-26 08:25:50',3,'2017-12-26 08:25:50',3),(3,'Why don\'t we go to Bemelmans Bar?','humhub\\modules\\polls\\models\\Poll',1,'2017-12-26 08:26:32',2,'2017-12-26 08:26:32',2),(4,'Again? ;Weary;','humhub\\modules\\polls\\models\\Poll',1,'2017-12-26 08:26:46',3,'2017-12-26 08:26:46',3);

#
# Structure for table "user_auth"
#

DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_auth"
#


#
# Structure for table "user_follow"
#

DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_user` (`user_id`),
  KEY `index_object` (`object_model`,`object_id`),
  CONSTRAINT `fk_user_follow-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_follow"
#

INSERT INTO `user_follow` VALUES (1,'humhub\\modules\\post\\models\\Post',1,1,1),(2,'humhub\\modules\\post\\models\\Post',2,1,1),(3,'humhub\\modules\\post\\models\\Post',2,2,1),(4,'humhub\\modules\\post\\models\\Post',2,3,1),(5,'humhub\\modules\\polls\\models\\Poll',1,1,1),(6,'humhub\\modules\\polls\\models\\Poll',1,2,1),(7,'humhub\\modules\\polls\\models\\Poll',1,3,1),(8,'humhub\\modules\\post\\models\\Post',3,1,1);

#
# Structure for table "user_friendship"
#

DROP TABLE IF EXISTS `user_friendship`;
CREATE TABLE `user_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  KEY `fk-friend` (`friend_user_id`),
  CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_friendship"
#


#
# Structure for table "user_http_session"
#

DROP TABLE IF EXISTS `user_http_session`;
CREATE TABLE `user_http_session` (
  `id` char(255) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`),
  KEY `fk_user_http_session-user_id` (`user_id`),
  CONSTRAINT `fk_user_http_session-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_http_session"
#

INSERT INTO `user_http_session` VALUES ('9jpg4ro0of7phcsaqd21b3ec55',1514250233,1,X'5F5F666C6173687C613A303A7B7D5F5F69647C693A313B5F5F6578706972657C693A313531343235303139323B'),('bbi8164d62oog47a2v540j08n7',1514250665,NULL,X'5F5F666C6173687C613A303A7B7D'),('docsu0viif67u30v9l4nqpi6r2',1514250237,1,X'5F5F666C6173687C613A303A7B7D5F5F69647C693A313B5F5F6578706972657C693A313531343235303139343B6C6976652E706F6C6C2E6C617374517565727954696D657C693A313531343234383738373B'),('iv4jm3fr3d68ofr6gu0hpomel3',1514257927,1,X'5F5F666C6173687C613A303A7B7D5F5F69647C693A313B5F5F6578706972657C693A313531343235373838373B6C6976652E706F6C6C2E6C617374517565727954696D657C693A313531343235363438373B757365722E63616E53656541646D696E53656374696F6E7C623A313B');

#
# Structure for table "user_invite"
#

DROP TABLE IF EXISTS `user_invite`;
CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_invite"
#

INSERT INTO `user_invite` VALUES (1,NULL,NULL,'yuhong1220@gmail.com','self','RLKfyCcbRhg4','2017-12-26 08:29:49',NULL,'2017-12-26 08:29:49',NULL,'en-US',NULL,NULL);

#
# Structure for table "user_mentioning"
#

DROP TABLE IF EXISTS `user_mentioning`;
CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user` (`user_id`),
  KEY `i_object` (`object_model`,`object_id`),
  CONSTRAINT `fk_user_mentioning-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_mentioning"
#


#
# Structure for table "user_message"
#

DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_originator` tinyint(4) DEFAULT NULL,
  `last_viewed` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`,`user_id`),
  KEY `index_last_viewed` (`last_viewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_message"
#


#
# Structure for table "user_module"
#

DROP TABLE IF EXISTS `user_module`;
CREATE TABLE `user_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `state` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_module` (`user_id`,`module_id`),
  CONSTRAINT `fk_user_module-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_module"
#


#
# Structure for table "user_password"
#

DROP TABLE IF EXISTS `user_password`;
CREATE TABLE `user_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text,
  `salt` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `fk_user_password-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

#
# Data for table "user_password"
#

INSERT INTO `user_password` VALUES (1,1,'sha512whirlpool','ff30f8ce861f60daca670d392f0c8faf9ada7fbd1eadd8b3a7535eed7671e2471f535d2b15667cc35fd9158bda848e686ee5df4ede402926eb8d0e2e39970418','a8fcabea-9479-43ab-93cd-0685cc7ed01a','2017-12-26 08:23:53'),(2,4,'sha512whirlpool','806378435f0eda027195570fc80e3cf0fd800c1f2b9f31255a8b13a732e10720a9867dfb551f61cef7616b55cb38b86051893633e681ea93ca9b0bbc3a564a08','7b8be068-bbdf-4ea7-928c-997f317d00ec','2017-12-26 08:35:24');

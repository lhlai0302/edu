/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.18 : Database - edu
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`edu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `edu`;

/*Table structure for table `edu_course` */

DROP TABLE IF EXISTS `edu_course`;

CREATE TABLE `edu_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `course_master` varchar(16) DEFAULT NULL,
  `course_master_id` varchar(16) DEFAULT NULL,
  `course_cost` int(11) DEFAULT NULL,
  `course_popularity` int(11) DEFAULT NULL,
  `course_info` varchar(100) DEFAULT NULL,
  `course_date` date DEFAULT NULL,
  `chapter_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `edu_course_ibfk_1` (`course_master_id`),
  CONSTRAINT `edu_course_ibfk_1` FOREIGN KEY (`course_master_id`) REFERENCES `edu_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_course` */

insert  into `edu_course`(`course_id`,`course_name`,`course_master`,`course_master_id`,`course_cost`,`course_popularity`,`course_info`,`course_date`,`chapter_count`) values (9,'Vue.js零基础入门','张三','1',70,0,'Vue.js是前端开发的框架之一，受到很多企业的青睐。','2019-10-22',7),(11,'html+css+javascript','张三','1',40,0,'前端入门必备知识。','2019-10-22',4),(14,'React','张三','1',70,0,'React.js是前端开发的框架之一。','2019-11-22',7),(15,'计算机导论','张三','1',30,0,'','2019-11-22',3),(17,'软件工程','张三','1',70,0,'','2019-11-22',6),(18,'.net技术','张三','1',60,0,NULL,'2019-11-20',6),(19,'操作系统','张三','1',60,0,'目前主要的OS有Windows,Mac','2019-10-22',6),(20,'大数据开发','张三','1',40,0,'大数据挖掘。','2019-10-22',4),(21,'jQuery','张三','1',50,0,'jQuery轻量级。','2019-11-22',5),(23,'jsp','张三','1',60,0,NULL,'2019-11-22',6),(24,'嵌入式系统','张三','1',60,0,'嵌入式系统，硬件集成。','2019-10-24',6),(25,'Spring Boot','张三','1',60,0,'','2019-12-02',6);

/*Table structure for table `edu_course_question` */

DROP TABLE IF EXISTS `edu_course_question`;

CREATE TABLE `edu_course_question` (
  `course_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `answer_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `answer_c` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `true_answer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `question` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`course_id`,`chapter_id`,`question_id`),
  CONSTRAINT `edu_course_question_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `edu_course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_course_question` */

insert  into `edu_course_question`(`course_id`,`chapter_id`,`question_id`,`answer_a`,`answer_b`,`answer_c`,`true_answer`,`question`) values (9,1,1,'6','2','4','6','2+2+2=？'),(9,1,2,'1','2','0','2','1+1=？'),(9,1,3,'4','2','1','4','2*2=？'),(9,1,4,'0','2','1','0','2-2=？'),(9,1,5,'4','0','2','4','2+2=？'),(9,2,1,NULL,NULL,NULL,NULL,NULL),(9,3,1,NULL,NULL,NULL,NULL,NULL),(9,4,1,NULL,NULL,NULL,NULL,NULL),(9,5,1,NULL,NULL,NULL,NULL,NULL),(9,6,1,NULL,NULL,NULL,NULL,NULL),(9,7,1,NULL,NULL,NULL,NULL,NULL),(11,1,1,NULL,NULL,NULL,NULL,NULL),(11,2,1,NULL,NULL,NULL,NULL,NULL),(11,3,1,NULL,NULL,NULL,NULL,NULL),(11,4,1,NULL,NULL,NULL,NULL,NULL),(14,7,1,NULL,NULL,NULL,NULL,NULL),(15,3,1,NULL,NULL,NULL,NULL,NULL),(19,1,1,NULL,NULL,NULL,NULL,NULL),(19,2,1,NULL,NULL,NULL,NULL,NULL),(19,3,1,NULL,NULL,NULL,NULL,NULL),(19,4,1,NULL,NULL,NULL,NULL,NULL),(19,5,1,NULL,NULL,NULL,NULL,NULL),(19,6,1,NULL,NULL,NULL,NULL,NULL),(20,1,1,NULL,NULL,NULL,NULL,NULL),(20,2,1,NULL,NULL,NULL,NULL,NULL),(20,3,1,NULL,NULL,NULL,NULL,NULL),(20,4,1,NULL,NULL,NULL,NULL,NULL),(24,1,1,'2','1','0','2','1+1=？'),(24,1,2,'1','2','0','1','2/2=？'),(24,3,1,NULL,NULL,NULL,NULL,NULL),(24,4,1,NULL,NULL,NULL,NULL,NULL),(24,5,1,NULL,NULL,NULL,NULL,NULL),(24,6,1,NULL,NULL,NULL,NULL,NULL),(25,1,1,NULL,NULL,NULL,NULL,NULL),(25,2,1,NULL,NULL,NULL,NULL,NULL),(25,3,1,NULL,NULL,NULL,NULL,NULL),(25,4,1,NULL,NULL,NULL,NULL,NULL),(25,5,1,NULL,NULL,NULL,NULL,NULL),(25,6,1,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `edu_course_video` */

DROP TABLE IF EXISTS `edu_course_video`;

CREATE TABLE `edu_course_video` (
  `course_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`chapter_id`,`video_id`),
  CONSTRAINT `edu_course_video_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `edu_course` (`course_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_course_video` */

insert  into `edu_course_video`(`course_id`,`chapter_id`,`video_id`,`video_url`) values (9,1,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,1,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,1,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,1,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,1,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,1,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,1,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,1,8,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,1,9,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,1,10,'01HTML5+的介绍.pcf.mp4'),(9,2,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,2,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,2,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,2,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,2,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,2,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,2,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,2,8,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,2,9,'09移动App-企业做移动App开发的3大.pcf.mp4'),(9,3,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,3,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,3,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,3,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,3,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,3,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,3,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,3,8,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,3,9,'09移动App-企业做移动App开发的3大.pcf.mp4'),(9,4,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,4,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,4,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,4,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,4,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,4,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,4,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,4,8,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,4,9,'09移动App-企业做移动App开发的3大.pcf.mp4'),(9,5,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,5,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,5,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,5,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,5,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,5,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,5,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,5,8,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,5,9,'09移动App-企业做移动App开发的3大.pcf.mp4'),(9,6,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,6,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,6,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,6,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,6,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,6,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,6,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,6,8,'08移动App-企业中的项目开发流程.pcf.mp4'),(9,6,9,'09移动App-企业做移动App开发的3大.pcf.mp4'),(9,7,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(9,7,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(9,7,3,'03移动App-App的分类和App与We.pcf.mp4'),(9,7,4,'04移动App-从程序员自身角度分.pcf.mp4'),(9,7,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(9,7,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(9,7,7,'07移动App-企业如何选择适合自.pcf.mp4'),(9,7,8,'09移动App-企业做移动App开发的3大.pcf.mp4'),(11,1,1,'01HTML5+的介绍.pcf.mp4'),(11,1,2,'02演示使用HBuilder打包出一个App.pcf.mp4'),(11,1,3,'03介绍H5+和RN这两种App开发技.pcf.mp4'),(11,1,4,'8通过ReactNative中文网说明配.mp4'),(11,1,5,'03介绍H5+和RN这两种App开发技.pcf.mp4'),(11,2,1,NULL),(11,3,1,NULL),(11,4,1,NULL),(14,7,1,NULL),(15,3,1,NULL),(19,1,1,NULL),(19,2,1,NULL),(19,3,1,NULL),(19,4,1,NULL),(19,5,1,NULL),(19,6,1,NULL),(20,1,1,NULL),(20,2,1,NULL),(20,3,1,NULL),(20,4,1,NULL),(24,1,1,'01移动App-什么是前端混合移动A.pcf.mp4'),(24,1,2,'02移动App-什么是原生开发和混合.pcf.mp4'),(24,1,3,'03移动App-App的分类和App与We.pcf.mp4'),(24,1,4,'04移动App-从程序员自身角度分.pcf.mp4'),(24,1,5,'05移动App-从企业角度分析使用移动.pcf.mp4'),(24,1,6,'06移动App-三种开发方式的原理和对.pcf.mp4'),(24,2,1,NULL),(24,3,1,NULL),(24,4,1,NULL),(24,5,1,NULL),(24,6,1,NULL),(25,1,1,NULL),(25,2,1,NULL),(25,3,1,NULL),(25,4,1,NULL),(25,5,1,NULL),(25,6,1,NULL);

/*Table structure for table `edu_integral` */

DROP TABLE IF EXISTS `edu_integral`;

CREATE TABLE `edu_integral` (
  `user_id` varchar(16) DEFAULT NULL,
  `integral_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `integral_cost_count` int(11) DEFAULT NULL,
  `integral_cost_reason` varchar(32) DEFAULT NULL,
  `integral_cost_date` datetime DEFAULT NULL,
  `integral_sum` int(11) DEFAULT NULL,
  PRIMARY KEY (`integral_change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_integral` */

/*Table structure for table `edu_student_course` */

DROP TABLE IF EXISTS `edu_student_course`;

CREATE TABLE `edu_student_course` (
  `student_id` varchar(16) NOT NULL,
  `course_id` varchar(16) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_student_course` */

/*Table structure for table `edu_user` */

DROP TABLE IF EXISTS `edu_user`;

CREATE TABLE `edu_user` (
  `user_id` varchar(16) NOT NULL,
  `user_pass` varchar(16) DEFAULT NULL,
  `user_type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_user` */

insert  into `edu_user`(`user_id`,`user_pass`,`user_type`) values ('1','1','teacher'),('2','2','student');

/*Table structure for table `edu_user_info` */

DROP TABLE IF EXISTS `edu_user_info`;

CREATE TABLE `edu_user_info` (
  `user_id` varchar(16) NOT NULL,
  `user_name` varchar(16) DEFAULT NULL,
  `user_email` varchar(16) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_colleague` varchar(16) DEFAULT NULL,
  `user_message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_user_info` */

insert  into `edu_user_info`(`user_id`,`user_name`,`user_email`,`user_phone`,`user_colleague`,`user_message`) values ('1','张三',NULL,NULL,NULL,NULL),('2','李四',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

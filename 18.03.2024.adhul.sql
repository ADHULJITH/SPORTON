/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - turf_bookingnew
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`turf_bookingnew` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `turf_bookingnew`;

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  `book_type` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `game` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `bookings` */

insert  into `bookings`(`book_id`,`user_id`,`slot_id`,`date_time`,`book_type`,`status`,`game`) values 
(1,5,3,'2021-02-09','outdoor','accept',NULL),
(2,5,3,'2024-03-17','outdoor','accept',NULL),
(3,5,3,'2024-03-17','outdoor','accept',NULL),
(4,5,3,'2024-03-17','outdoor','accept',NULL),
(5,5,3,'2021-02-09 15:48:10','indoor','reject','football'),
(6,5,3,'2024-03-17','indoor','accept','football'),
(7,5,3,'2024-03-17','indoor','paid',NULL),
(8,5,3,'2024-03-17','outdoor','pending',NULL),
(9,5,3,'2024-03-17','outdoor','pending',NULL),
(10,5,3,'2024-03-17','outdoor','pending',NULL),
(11,5,3,'2024-03-17','outdoor','pending',NULL),
(12,5,3,'2024-03-17','outdoor','pending',NULL),
(13,5,3,'2024-03-17','outdoor','pending',NULL),
(14,5,3,'2024-03-17','outdoor','pending',NULL),
(15,5,3,'2024-03-17','outdoor','pending',NULL),
(16,5,3,'2024-03-17','outdoor','pending',NULL),
(17,5,3,'2024-03-17','outdoor','pending',NULL),
(18,5,3,'2021-02-09 15:48:10','outdoor','pending','football'),
(19,6,2,'2021-02-09 15:50:20','indoor','accept','badmiton'),
(20,6,4,'2024-03-18 17:08:30','outdoor','accept','football'),
(21,6,5,'2024-03-18 18:29:24','indoor','paid','badmiton'),
(22,6,5,'2024-03-18 18:29:24','indoor','accept','badminton'),
(23,6,5,'2024-03-18 18:29:24','outdoor','accept','football');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` varchar(50) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(50) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`sender_id`,`sender_type`,`receiver_id`,`receiver_type`,`message`,`date_time`) values 
(1,1,'turf',2,'user','Hai','322'),
(2,1,'user',1,'turf','Hello','32'),
(3,1,'turf',2,'user','hello','2021-02-10 01:22:47'),
(4,1,'turf',1,'user','yes','2021-02-10 01:23:02'),
(5,9,'coach',4,'user','hi','2022-03-28 19:44:25'),
(6,9,'coach',4,'user','haiiiiiiiiii','2022-03-28 19:44:29'),
(7,4,'user',9,'coach','hello','2022-03-28 19:44:29'),
(8,4,'user',3,'truf','hii','2022-03-29 14:03:29'),
(9,4,'user',3,'truf','hlooo','2022-03-29 14:03:43'),
(10,4,'user',3,'truf','hlooo','2022-03-29 14:03:47'),
(11,4,'user',1,'truf','hii','2022-03-29 14:05:39'),
(12,4,'user',1,'truf','hloo','2022-03-29 14:05:44'),
(13,11,'user',9,'coach','hoiii','2022-03-29 14:10:29'),
(14,10,'coach',11,'user','hii','2022-03-29 14:12:06');

/*Table structure for table `coaches` */

DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
  `coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `turf_id` int(11) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sports_type` varchar(100) DEFAULT NULL,
  `fee_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `coaches` */

insert  into `coaches`(`coach_id`,`login_id`,`turf_id`,`fname`,`lname`,`place`,`phone`,`email`,`age`,`gender`,`description`,`sports_type`,`fee_amount`) values 
(1,9,2,'Rio','joy','kochi','9999999999','rio@gmail.com','23','Male','fdghfhtyu','asd','1000'),
(2,10,2,'biya','rose','ernakulam','0987654321','biya@gmail.com','20','Female','ewrertet','saasds','1000');

/*Table structure for table `commision` */

DROP TABLE IF EXISTS `commision`;

CREATE TABLE `commision` (
  `commision_id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` varchar(50) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`commision_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `commision` */

insert  into `commision`(`commision_id`,`percentage`,`date_time`) values 
(8,'90','2021-02-09 11:38:16');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint` varchar(50) DEFAULT NULL,
  `reply` varchar(50) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`user_id`,`complaint`,`reply`,`date_time`) values 
(1,1,'No food ','Sorry',NULL),
(2,2,'Low Quality','ok','2022-03-28 15:03:45'),
(3,1,'nnnnn','pending',NULL),
(4,1,'logib error','pending','2021-04-15'),
(5,1,'login error','pending','2021-04-15'),
(6,1,'login error','pending','2021-04-15'),
(7,1,'stghgb','pending','2021-04-15'),
(8,6,'hhh','sry','2024-03-18 18:04:44'),
(9,6,'still','pending','2024-03-05'),
(10,6,'kjbnijko','pending','2025-05-18'),
(11,6,'wowwww','pending','2024-03-18');

/*Table structure for table `facilities` */

DROP TABLE IF EXISTS `facilities`;

CREATE TABLE `facilities` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `turf_id` int(11) DEFAULT NULL,
  `facility` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `facilities` */

insert  into `facilities`(`facility_id`,`turf_id`,`facility`,`description`,`image`,`date`) values 
(2,1,'Play Ground','Work Place','static/facility_images/ac8ef78a-c910-4130-93c9-3c9a961d3bffPicture1.jpg','2021-02-09'),
(3,1,'Canteen','Food','static/facility_images/316ce1ed-4788-4597-9658-c758aa2fae07brocoli.jpg','2021-02-09'),
(4,1,'Accomodation','Home','static/facility_images/e2f8572e-c6ea-4fd4-abed-45a83eb9a2c25.png','2021-02-09'),
(6,2,'asas','sdsadsad','static/facility_images/11dc78a2-5c58-4237-a31e-c4fafb9132c7trainer-4.jpg','2022-03-28');

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `turf_id` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `feedbacks` */

insert  into `feedbacks`(`feedback_id`,`user_id`,`turf_id`,`title`,`description`,`date_time`) values 
(1,1,1,'bhhbhbhbh','hhghghghh','67/90/90'),
(2,1,1,'tuii','tuii','2021-04-13 14:06:32'),
(3,1,1,'dghj','dghj','2021-04-13 14:06:54'),
(4,1,1,'ryuu','tuii','2021-04-13 14:15:29'),
(5,1,1,'dhj','fjkk','2021-04-13 14:15:40'),
(6,1,1,'ooo','fhh','2021-04-15 11:17:29'),
(7,1,1,'','hhh','2022-03-29 11:39:12'),
(8,5,1,'jhbb','ashd','2024-03-14 10:04:12');

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `turf_id` int(11) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  `image_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `images` */

insert  into `images`(`image_id`,`turf_id`,`image`,`date_time`,`image_type`) values 
(1,1,'static/ec1dce87-f7af-473e-988b-6086cd70a84e5.png','2021-02-10 00:08:05','game'),
(2,2,'static/9decc5cf-8bf4-4a26-8702-00cb0a25a7305.png','2021-03-05 10:17:04','game'),
(3,2,'static/1765a7e5-9dab-4a7a-b145-e835e8853be4brocoli.jpg','2021-03-15 09:22:22','game'),
(4,2,'static/44f70984-d1f1-4bc4-8096-6e7a7f703f33home-image.jpg','2022-03-28 16:32:16','game'),
(5,2,'static/ee25af1b-d0d6-4705-a2f1-87687a97bc2dhome-image-3.jpg','2022-03-28 16:34:15','infrastructure'),
(6,2,'static/1808f235-aeae-428e-87d9-8de49b04f8b8trainer-4.jpg','2022-03-28 16:34:27','facility');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'ann','ann','turf'),
(2,'admin','admin','admin'),
(3,'turf','turf','turf'),
(4,'ammu','ammu','user'),
(5,'hsha','hahah','user'),
(6,'hsha','hahah','user'),
(7,'abijith','abijith','user'),
(9,'rio','rio','coach'),
(10,'biya','biya','coach'),
(11,'tiya','tiya','user'),
(12,'ramzz','Fd12345678','user'),
(15,'shreyas','shreyas','turf');

/*Table structure for table `matches` */

DROP TABLE IF EXISTS `matches`;

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `opp_user_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `matches` */

insert  into `matches`(`match_id`,`book_id`,`opp_user_id`,`status`) values 
(1,1,2,'active'),
(2,1,2,'pending'),
(3,16,3,'pending'),
(4,17,1,'accepted'),
(5,1,4,'pending');

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `paymment_for_id` int(11) DEFAULT NULL,
  `payment_type` varchar(500) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `payments` */

insert  into `payments`(`payment_id`,`paymment_for_id`,`payment_type`,`payment_mode`,`date_time`,`amount`) values 
(1,1,NULL,'online','2/2/2',NULL),
(2,16,NULL,'online','2021-04-22 12:50:18',NULL),
(3,16,NULL,'online','2021-04-22 12:50:21',NULL),
(4,16,NULL,'online','2021-04-22 12:50:28',NULL),
(5,16,NULL,'online','2021-04-22 12:53:09',NULL),
(6,16,NULL,'online','2021-04-22 12:53:34',NULL),
(7,1,'coach','online','2021-04-22 12:53:34','1000'),
(8,4,'coach','online','2022-03-29 14:12:26','1000'),
(9,5,'coach','online','2022-03-29 14:15:23','1000'),
(10,1,'user','online','2024-03-14 09:49:41','100'),
(11,2,'user','online','2024-03-17 18:01:17','100'),
(12,6,'user','online','2024-03-18 01:51:40','100'),
(13,19,'user','online','2024-03-18 17:13:08','100'),
(14,20,'user','online','2024-03-18 17:15:47','2000'),
(15,19,'user','online','2024-03-18 18:06:14','100'),
(16,19,'user','online','2024-03-18 18:06:24','100'),
(25,21,'user','online','2024-03-18 19:06:50','800');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `turf_id` int(11) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `review` varchar(500) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `ratings` */

insert  into `ratings`(`rate_id`,`user_id`,`turf_id`,`rate`,`review`,`date_time`) values 
(7,1,1,'5.0','sfghsd','2021-04-18 11:35:15'),
(8,6,1,'4.0','ggg','2022-03-29 11:37:36'),
(9,6,2,'3','woww','2024-03-18 19:59:57'),
(10,6,1,'5','good','2024-03-18 20:00:27'),
(11,6,5,'4','good','2024-03-18 20:06:41');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`request_id`,`user_id`,`coach_id`,`status`) values 
(1,1,1,'accepted'),
(2,1,1,'pending'),
(3,1,1,'pending'),
(4,6,2,'paid'),
(5,6,1,'paid');

/*Table structure for table `schedule_time` */

DROP TABLE IF EXISTS `schedule_time`;

CREATE TABLE `schedule_time` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `turf_id` int(11) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `schedule_time` */

insert  into `schedule_time`(`schedule_id`,`turf_id`,`coach_id`,`date`,`time`) values 
(1,2,1,'2022-03-31','20:22'),
(2,2,1,'2022-03-31','01:30'),
(3,2,2,'2022-03-30','07:30');

/*Table structure for table `slots` */

DROP TABLE IF EXISTS `slots`;

CREATE TABLE `slots` (
  `slot_id` int(11) NOT NULL AUTO_INCREMENT,
  `turf_id` int(11) DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `from_time` varchar(50) DEFAULT NULL,
  `to_time` varchar(50) DEFAULT NULL,
  `amount` decimal(50,0) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `slots` */

insert  into `slots`(`slot_id`,`turf_id`,`day`,`from_time`,`to_time`,`amount`,`date_time`) values 
(3,1,'Sunday','15:34','15:39',100,'2021-02-09 15:48:10'),
(2,1,'Thursday','15:34','15:34',100,'2021-02-09 15:50:20'),
(4,1,'Sunday','12:00','10:00',2000,'2024-03-18 17:08:30'),
(5,5,'Monday','06:00','07:00',800,'2024-03-18 18:29:24'),
(6,5,'Sunday','07:00','08:00',800,'2024-03-18 18:29:51'),
(7,5,'Sunday','12:00','10:00',120,'2024-03-18 18:49:31');

/*Table structure for table `training` */

DROP TABLE IF EXISTS `training`;

CREATE TABLE `training` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `coach_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `datetime` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `training` */

insert  into `training`(`training_id`,`coach_id`,`description`,`datetime`,`status`) values 
(1,1,'ddd','2022-03-28 17:15:01','pending'),
(2,1,'dasdad','2022-03-28 17:14:41','pending');

/*Table structure for table `turfs` */

DROP TABLE IF EXISTS `turfs`;

CREATE TABLE `turfs` (
  `turf_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `owner_first_name` varchar(50) DEFAULT NULL,
  `owner_last_name` varchar(50) DEFAULT NULL,
  `turf_place` varchar(50) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`turf_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `turfs` */

insert  into `turfs`(`turf_id`,`login_id`,`owner_first_name`,`owner_last_name`,`turf_place`,`landmark`,`pincode`,`latitude`,`longitude`,`phone`,`email`) values 
(1,1,'Ann Treata','Regina T M','Kozhikode','Kochi','688765','98765432101234567','4354334532344433','7012758728','treatspetscorner@gmail.com'),
(2,3,'ammu','turf','turf place','hjhhhj','787878','7778','7887788','7878878799','treatspetscorner@gmail.com'),
(5,15,'shreyas','b','mookkannor','kokun ','683577','10.229941411799652','76.41767009160885','8606282965','shreyasbharathan@gmail.com');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `house_name` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`login_id`,`first_name`,`last_name`,`house_name`,`place`,`pincode`,`phone`,`email`) values 
(1,4,'Ammu','Kutty','Paliyethara','kkd','43434343','989898989','ann@123.com'),
(2,10,'hh','hh','hhnn','vgvtgvg','878778','787878','bhbhb'),
(3,5,'bhbh','hhg','hghgh','87','87bh78v','87878','878hhjjh'),
(4,6,'wtwywg','shshsh','shshshs','bshsjs','123456','9876543210','abc@gmail.com'),
(5,7,'abijith','nm','abcd','kaloor','653008','9876543210','abijith@gmail.com'),
(6,11,'Tiya','t','asdf','erkm','688504','9074125836','aa@gmail.com'),
(7,12,'ramm','syam','alalal','kochuuu','123456','1234567890','ram@gmail.com');

/*Table structure for table `videos` */

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `training_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file_path` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `videos` */

insert  into `videos`(`video_id`,`training_id`,`title`,`file_path`) values 
(1,1,'aasss','static/9c31d462-621d-475b-9fbc-c5895c157f04videoviewdemo.mp4'),
(2,1,'aaa','static/9227a9ac-f34d-446c-8fe7-e54e4873a884videoviewdemo.mp4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

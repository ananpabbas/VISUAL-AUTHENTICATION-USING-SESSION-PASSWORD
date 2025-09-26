/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - python_onlinebanking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`python_onlinebanking` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `python_onlinebanking`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `balance` varchar(100) DEFAULT NULL,
  `datetime` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`account_id`,`customer_id`,`bank_id`,`account_number`,`balance`,`datetime`,`status`,`text`,`image`) values 
(1,1,2,'8507064849','80500','2022-01-19 10:26:59','Accepted','fds','012345'),
(2,3,2,'ac3333','63100','2022-01-19 10:28:08','pending',NULL,NULL),
(3,2,1,'ac908','480000','2022-01-19 10:37:14','pending',NULL,NULL),
(5,4,1,'blank1','50000','2022-02-05 11:32:32','pending',NULL,NULL),
(6,5,2,'aabb','13000','2022-02-05 12:31:12','pending',NULL,'012345'),
(7,5,2,'bbaa','15000','2022-02-05 12:40:46','pending',NULL,NULL),
(10,4,2,'blank1','5000','2022-02-05 13:39:55','pending',NULL,NULL),
(13,1,1,'5486148611','1000','2022-02-12 18:48:25','Accepted',NULL,NULL),
(14,7,1,'8317055346','4000','2022-04-01 17:01:47','Accepted','shemeem','543210'),
(15,8,1,'9887809947','7000','2022-04-01 17:36:46','Accepted','1234','543210'),
(16,8,3,'0','0','2022-04-01 18:01:38','pending','',''),
(17,7,1,'0','0','2025-08-07 15:51:30','pending','','');

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`bank_id`,`login_id`,`bankname`,`place`,`phone`,`email`) values 
(1,2,'SBI','erkm','9078543216','sbi@gmail.com'),
(3,14,'abcd','kochi','7894561230','ab@gamil.com'),
(2,3,'axix','kollam','9874562112','ee@gamil.com');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `reciver_id` int(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`sender_id`,`reciver_id`,`message`,`date`) values 
(1,2,5,'hhii','2022-01-22'),
(3,5,2,'kdjf','2022-01-22'),
(4,5,2,'dkfj','2022-01-22'),
(5,5,11,'sjkg','2022-01-22'),
(6,3,8,'hhhhiiii','2022-01-22'),
(7,8,3,'hlo','2022-01-22'),
(8,12,6,'hiii','2022-01-22'),
(9,6,12,'hlo','2022-01-22'),
(10,12,6,'hiiiiiiiiiii','2022-01-22'),
(11,7,3,'hlo','2022-01-22'),
(12,3,7,'hlooo','2022-01-22'),
(13,3,8,'hiii','2022-01-22'),
(14,6,17,'ho','2022-02-05'),
(15,17,16,'ok','2022-02-05'),
(16,17,15,'ok','2022-02-05'),
(17,15,17,'hlo','2022-02-05'),
(18,8,18,'try','2022-02-05'),
(19,17,5,'vishak','2022-02-05'),
(20,18,7,'hlo','2022-04-01'),
(21,18,7,'hlo','2022-04-01'),
(22,7,20,'hai','2022-04-01'),
(23,7,20,'hlo','2022-04-01'),
(24,20,5,'hloo','2022-04-01'),
(25,5,20,'hi','2022-04-01'),
(26,20,5,'hai','2025-08-07');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`customer_id`,`complaint`,`reply`,`date`) values 
(1,3,'vvvv','okkk','2025-01-19'),
(2,2,'bbbb','pending','2025-08-19'),
(3,3,'my account blocked','pending','2025-02-04'),
(4,5,'trial complaint','pending','2025-02-05');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `housename` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`login_id`,`firstname`,`lastname`,`housename`,`place`,`pincode`,`phone`,`email`) values 
(1,11,'Sree','Leskshmi','aabcedfg','Malapuram','666777','9067543210','rosemarytiss111@gmail.com'),
(2,12,'AnuSree','K','azxs','malapuram','666888','7890765431','anu@gamil.com'),
(3,13,'Sreeku','M','mmm','Malapuram','666888','900213456','sreeku@gamil.com'),
(4,17,'b','lank','hj','tcr','680681','8826493789','vishnuddhrt@gmail.com'),
(5,18,'aa','bb','adf','tcr','680681','8826478912','vishnuddhrt@gmail.com'),
(6,19,'v','v','v','v','789845','7894561230','v@gmail.com'),
(7,20,'ann','aby','eee','der','682002','8848790166','antonyplaison@gmail.com'),
(8,21,'joyel','kr','asdfghj','qwertyui','123456','9876543211','j@gmail.com'),
(9,22,'dfghj','sdfghj','sdfghj','dfgtyh','123456','987654321','j@gmail.com'),
(10,23,'kai','j','hkjfadhlj','hadjhf','123456','9876543210','an@gmail.com'),
(11,24,'sahed','ckjhjehdc','sabhgdhed','sjagdwhd','545454','5455545454','ss@gmail.com');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `housename` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`employee_id`,`login_id`,`bank_id`,`firstname`,`lastname`,`housename`,`place`,`gender`,`phone`,`email`,`qualification`) values 
(1,5,1,'Anna','Philip','edfsef','ktym','female','9078543216','qwe@gmail.com','Bcom'),
(2,6,1,'Mariya','Thomas','padamittam','alappuzha','female','9078543216','mariya@gmail.com','BCA'),
(3,7,2,'Sruthi','Mol','qwert','Malapuram','female','9078543216','sruthimol@gmail.com','Philo'),
(4,8,2,'Anu','Kurian','mkl','erm','female','9087542134','annakurian@gmail.com','Mcom'),
(5,15,1,'praveen','praveen','praveen','praveen','male','7894561230','vishnuddhrt@gmail.com','ma'),
(6,16,1,'praveen','praveen','praveen','praveen','male','1234567890','vishnuddhrt@gmail.com','praveen');

/*Table structure for table `loanrequest` */

DROP TABLE IF EXISTS `loanrequest`;

CREATE TABLE `loanrequest` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `datetime` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `loanrequest` */

insert  into `loanrequest`(`request_id`,`customer_id`,`loan_id`,`datetime`,`status`) values 
(1,3,1,'2022-01-19 13:48:44','Approved'),
(2,3,3,'2022-01-19 13:49:04','Approved'),
(3,2,1,'2022-01-19 13:49:41','pending'),
(4,2,2,'2022-01-19 13:49:51','pending'),
(5,8,1,'2022-04-01 17:24:05','Approved'),
(6,1,1,'2022-04-01 17:54:22','pending'),
(7,7,1,'2024-12-19 00:05:15','pending'),
(8,7,1,'2025-08-07 15:51:19','pending');

/*Table structure for table `loans` */

DROP TABLE IF EXISTS `loans`;

CREATE TABLE `loans` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `loan_name` varchar(100) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `interest_rate` varchar(100) DEFAULT NULL,
  `max_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `loans` */

insert  into `loans`(`loan_id`,`bank_id`,`loan_name`,`details`,`interest_rate`,`max_amount`) values 
(1,1,'gold','wert','30000','20000'),
(2,1,'orna','vbnm','70000','60000'),
(3,2,'gold','dfghjk','60000','40000');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'sbi','sbi','bank'),
(3,'south','south','bank'),
(5,'anna','anna','employee'),
(18,'aabb','aabb','customer'),
(7,'sruthi','sruthi','employee'),
(8,'anu','anu','employee'),
(19,'v','v','customer'),
(11,'sreee','sreee','customer'),
(12,'anusree','anusree','customer'),
(13,'sreeku','sreeku','customer'),
(14,'axis','axis','bank'),
(15,'praveen','praveen','employee'),
(16,'praveen','praveen','employee'),
(17,'blank','blank','customer'),
(20,'ann','ann','customer'),
(21,'joyel','joyeljoyel','customer'),
(22,'asdfghjkl','wertyhujik','customer'),
(23,'kai','kai','customer'),
(24,'saded','HGGhjcbhgds456','customer');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_title` varchar(100) DEFAULT NULL,
  `news_details` text,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `news` */

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `notification` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

insert  into `notification`(`notification_id`,`bank_id`,`notification`,`date`) values 
(1,2,'gggg','2022-01-18'),
(2,2,'nnnn','2022-01-18'),
(3,1,'aaaa','2022-01-18'),
(4,1,'fff','2022-01-18'),
(5,1,'jjjj','2022-01-18');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_ac` varchar(100) DEFAULT NULL,
  `to_ac` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `datetime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

insert  into `transactions`(`transaction_id`,`from_ac`,`to_ac`,`amount`,`datetime`) values 
(1,'ac908','ac123','10000','2022-01-20 09:47:37'),
(2,'ac908','ac123','10000','2022-01-20 09:56:14'),
(4,'ac123','ac3333','1000','2022-02-14 15:04:20'),
(5,'ac123','ac3333','1000','2022-02-14 15:05:44'),
(6,'8507064849','ac3333','100','2022-03-23 12:27:11'),
(7,'ann','aabb','1000','2022-04-01 14:25:36'),
(8,'ann','aabb','1000','2022-04-01 16:20:19'),
(9,'ann','aabb','1000','2022-04-01 16:25:24'),
(10,'9887809947','8507064849','600','2022-04-01 17:48:40'),
(11,'8317055346','5486148611','500','2024-12-19 00:02:48'),
(12,'8317055346','5486148611','500','2024-12-19 00:05:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

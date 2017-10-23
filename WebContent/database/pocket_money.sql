/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - pocket_money
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pocket_money` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pocket_money`;

/*Table structure for table `exchange_log` */

DROP TABLE IF EXISTS `exchange_log`;

CREATE TABLE `exchange_log` (
  `id` varchar(20) NOT NULL COMMENT '主键（订单号-非自增）',
  `userId` int(10) NOT NULL COMMENT '用户ID（外键）',
  `produceId` int(10) NOT NULL COMMENT '商品ID（外键）',
  `address` varchar(50) NOT NULL COMMENT '收货地址',
  `consignee` varchar(50) NOT NULL COMMENT '收货人',
  `tellphone` varchar(50) NOT NULL COMMENT '联系方式',
  `createDate` datetime NOT NULL COMMENT '创建时间',
  `expressNo` varchar(50) NOT NULL COMMENT '快递单号',
  `goodsStatus` int(10) NOT NULL COMMENT '状态(1:已发货 2：未发货)',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`userId`),
  KEY `FK_Reference_2` (`produceId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`produceId`) REFERENCES `invest_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分商城商品兑换记录表';

/*Data for the table `exchange_log` */

insert  into `exchange_log`(`id`,`userId`,`produceId`,`address`,`consignee`,`tellphone`,`createDate`,`expressNo`,`goodsStatus`) values ('201710210001',2,1,'深圳市宝安区','李宁','13745679865','2017-10-21 00:00:00','20171021151258',2),('201710210002',3,2,'深圳市南山区','张伟','15986549875','2017-10-21 00:00:00','20171021151390',1);

/*Table structure for table `info_statis` */

DROP TABLE IF EXISTS `info_statis`;

CREATE TABLE `info_statis` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `monthStatis` datetime NOT NULL COMMENT '月统计时间（yyyy-mm）',
  `tradeAmount` double(15,2) NOT NULL COMMENT '当月交易金额',
  `totalAmount` double(15,2) NOT NULL COMMENT '累计交易金额',
  `userAmount` int(10) NOT NULL COMMENT '用户总数',
  `totalIncome` double(15,2) NOT NULL COMMENT '累计收益额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='信息累计表';

/*Data for the table `info_statis` */

insert  into `info_statis`(`id`,`monthStatis`,`tradeAmount`,`totalAmount`,`userAmount`,`totalIncome`) values (1,'2017-05-31 00:00:00',2813988358.00,24202563580.00,5236545,414018835.00),(2,'2017-06-30 00:00:00',3255655451.00,28102563580.00,6566560,514018835.00);

/*Table structure for table `invest_detail` */

DROP TABLE IF EXISTS `invest_detail`;

CREATE TABLE `invest_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `produceId` int(10) NOT NULL COMMENT '产品编号（外键）',
  `userId` int(10) NOT NULL COMMENT '用户编号（外键）',
  `tradeDate` datetime NOT NULL COMMENT '交易日期',
  `tradeMoney` double(10,2) NOT NULL COMMENT '交易金额',
  `tradeStatus` int(10) NOT NULL COMMENT '交易状态(1:已预约2:投资中3：已结束)',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`produceId`),
  KEY `FK_Reference_7` (`userId`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`produceId`) REFERENCES `invest_product` (`id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='投资详情表';

/*Data for the table `invest_detail` */

insert  into `invest_detail`(`id`,`produceId`,`userId`,`tradeDate`,`tradeMoney`,`tradeStatus`) values (1,1,2,'2017-10-21 00:00:00',2000.00,2),(2,2,3,'2017-10-21 00:00:00',1500.00,1);

/*Table structure for table `invest_product` */

DROP TABLE IF EXISTS `invest_product`;

CREATE TABLE `invest_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `produceName` varchar(50) NOT NULL COMMENT '产品名称',
  `invTypeId` int(10) NOT NULL COMMENT '产品类别（外键）',
  `annualYield` double(10,2) NOT NULL COMMENT '年化收益率',
  `purchaseMoney` double(10,2) NOT NULL COMMENT '起购金额',
  `deadline` int(10) NOT NULL COMMENT '投资期限（天）',
  `investor` int(10) NOT NULL COMMENT '投资人数',
  `totalAmount` double(10,2) NOT NULL COMMENT '本期可投总金额',
  `residueAmount` double(10,2) NOT NULL COMMENT '剩余可投金额',
  `invStatus` int(10) NOT NULL COMMENT '产品投资状态(1:未发布2:可投3:已投满)\n            \n            ',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`invTypeId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`invTypeId`) REFERENCES `invest_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='投资产品信息表';

/*Data for the table `invest_product` */

insert  into `invest_product`(`id`,`produceName`,`invTypeId`,`annualYield`,`purchaseMoney`,`deadline`,`investor`,`totalAmount`,`residueAmount`,`invStatus`) values (1,'新手宝-信17JQO1期',1,0.10,1000.00,15,36,1000000.00,394000.00,2),(2,'月盈宝-信17JWQ4期',2,0.06,1000.00,31,24,1000000.00,580000.00,2);

/*Table structure for table `invest_type` */

DROP TABLE IF EXISTS `invest_type`;

CREATE TABLE `invest_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invTypeName` varchar(50) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='投资产品类别表';

/*Data for the table `invest_type` */

insert  into `invest_type`(`id`,`invTypeName`) values (1,'新手宝'),(2,'月盈宝'),(3,'季盈宝'),(4,'双季盈');

/*Table structure for table `msg_push` */

DROP TABLE IF EXISTS `msg_push`;

CREATE TABLE `msg_push` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msgType` int(10) NOT NULL COMMENT '类型(1:充值2:提现3:积分兑现4:公告)',
  `content` varchar(250) NOT NULL COMMENT '内容',
  `releaseDate` datetime NOT NULL COMMENT '发送时间\n            ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='消息推送表';

/*Data for the table `msg_push` */

insert  into `msg_push`(`id`,`msgType`,`content`,`releaseDate`) values (1,4,'国庆期间运营公告','2017-09-29 00:00:00'),(2,3,'签到赚积分活动','2017-10-21 00:00:00');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `contentPath` varchar(200) NOT NULL COMMENT '内容文件路径',
  `releaseDate` datetime NOT NULL COMMENT '发布时间',
  `newsType` int(10) NOT NULL COMMENT '类别（1:公告2：媒体报道）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公告、媒体报道表';

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`contentPath`,`releaseDate`,`newsType`) values (1,'口袋理财为青年圆梦','d:/news/medie_20170911.txt','2017-09-11 00:00:00',2),(2,'2017朗迪金融科技峰会','d:/news/medie_20170717.txt','2017-07-17 00:00:00',2),(3,'国庆期间维修公告','d:/news/publish_20170929.txt','2017-09-29 00:00:00',1);

/*Table structure for table `pocket_stamp` */

DROP TABLE IF EXISTS `pocket_stamp`;

CREATE TABLE `pocket_stamp` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pocketType` int(10) NOT NULL COMMENT '类型（1:体验金券2:增长券）',
  `money` double(10,2) NOT NULL COMMENT '金额',
  `deadline` int(10) NOT NULL COMMENT '有效期（天）',
  `useStatus` int(10) NOT NULL COMMENT '使用状态（1:未使用2:已使用3:已过期）',
  `changeValue` int(10) NOT NULL COMMENT '兑换值',
  `range` varchar(50) NOT NULL COMMENT '使用范围',
  `stock` int(10) NOT NULL COMMENT '库存量',
  `rate` double(10,4) NOT NULL COMMENT '增长率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='口袋券表';

/*Data for the table `pocket_stamp` */

insert  into `pocket_stamp`(`id`,`pocketType`,`money`,`deadline`,`useStatus`,`changeValue`,`range`,`stock`,`rate`) values (1,1,30.00,15,1,30,'15天以上的项目',1000,0.0000),(2,2,0.00,30,1,0,'30天以上的项目',50,0.0002);

/*Table structure for table `score_goods` */

DROP TABLE IF EXISTS `score_goods`;

CREATE TABLE `score_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键（商品ID）',
  `goodsName` varchar(50) NOT NULL COMMENT '商品名称',
  `changeValue` int(10) NOT NULL COMMENT '兑换值',
  `picturePath` varchar(50) NOT NULL COMMENT '图片存储路径',
  `stock` int(10) NOT NULL COMMENT '库存量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='积分商城商品表';

/*Data for the table `score_goods` */

insert  into `score_goods`(`id`,`goodsName`,`changeValue`,`picturePath`,`stock`) values (1,'维达纸巾',15,'d:/pic/pic_001',100),(2,'乐派保温杯',50,'d:/pic/pic_002',20);

/*Table structure for table `trade_record` */

DROP TABLE IF EXISTS `trade_record`;

CREATE TABLE `trade_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(10) NOT NULL COMMENT '用户编号（外键）',
  `produceId` int(10) NOT NULL COMMENT '产品编号（外键）',
  `tradeMoney` double(10,2) NOT NULL COMMENT '交易金额',
  `tradeDate` datetime NOT NULL COMMENT '交易日期',
  `tradeStatus` varchar(50) NOT NULL COMMENT '交易状态(1:未完成2:已完成)',
  `tradeTypeId` int(10) NOT NULL COMMENT '交易类别（外键）',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`tradeTypeId`),
  KEY `FK_Reference_4` (`produceId`),
  KEY `FK_Reference_5` (`userId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`tradeTypeId`) REFERENCES `trade_type` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`produceId`) REFERENCES `invest_product` (`id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='个人交易记录表';

/*Data for the table `trade_record` */

insert  into `trade_record`(`id`,`userId`,`produceId`,`tradeMoney`,`tradeDate`,`tradeStatus`,`tradeTypeId`) values (1,2,1,1500.00,'2017-10-21 00:00:00','2',1),(2,3,2,2000.00,'2017-08-25 00:00:00','2',1);

/*Table structure for table `trade_type` */

DROP TABLE IF EXISTS `trade_type`;

CREATE TABLE `trade_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tradeName` varchar(50) NOT NULL COMMENT '交易名称(投资、提现等)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='交易类别表';

/*Data for the table `trade_type` */

insert  into `trade_type`(`id`,`tradeName`) values (1,'投资'),(2,'充值'),(3,'提现');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键（编号）',
  `loginName` varchar(50) NOT NULL COMMENT '登陆名（手机号码）',
  `password` varchar(50) NOT NULL COMMENT '登陆密码',
  `idNumber` varchar(50) NOT NULL COMMENT '身份证号码',
  `bankNumber` varchar(50) NOT NULL COMMENT '银行卡号',
  `exchangePassword` varchar(50) NOT NULL COMMENT '交易密码',
  `userName` varchar(50) NOT NULL COMMENT '姓名',
  `userType` int(10) NOT NULL COMMENT '用户类型(1:管理员 2：普通用户)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户注册信息表';

/*Data for the table `user` */

insert  into `user`(`id`,`loginName`,`password`,`idNumber`,`bankNumber`,`exchangePassword`,`userName`,`userType`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','422312199602123569','95989965465465466','admin666666','管理员',1),(2,'zhangsan','e10adc3949ba59abbe56e057f20f883e','430231201011256535','54645654165465456','666666','张三',2),(3,'lisi','e10adc3949ba59abbe56e057f20f883e','421321198011034568','46455144114564664','666666','李四',2);

/*Table structure for table `user_income` */

DROP TABLE IF EXISTS `user_income`;

CREATE TABLE `user_income` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(10) NOT NULL COMMENT '用户（外键）',
  `dayAccount` double(10,2) NOT NULL COMMENT '日收益金额',
  `incomeDay` datetime NOT NULL COMMENT '时间（每天）',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`userId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='个人收益表';

/*Data for the table `user_income` */

insert  into `user_income`(`id`,`userId`,`dayAccount`,`incomeDay`) values (1,2,26.00,'2017-10-13 00:00:00'),(2,2,30.00,'2017-10-14 00:00:00'),(3,3,60.00,'2017-10-13 00:00:00'),(4,3,50.00,'2017-10-14 00:00:00');

/*Table structure for table `user_property` */

DROP TABLE IF EXISTS `user_property`;

CREATE TABLE `user_property` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pocketId` int(10) NOT NULL COMMENT '口袋券（外键）',
  `userId` int(10) NOT NULL COMMENT '用户编号（外键）',
  `balance` double(10,2) NOT NULL COMMENT '余额 ',
  `score` int(10) NOT NULL COMMENT '积分',
  `withdrawMoney` double(10,2) NOT NULL COMMENT '提现金额',
  `invProperty` double(10,2) NOT NULL COMMENT '投资资产（持有资产）',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`pocketId`),
  KEY `FK_Reference_9` (`userId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`pocketId`) REFERENCES `pocket_stamp` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='个人资产详情表';

/*Data for the table `user_property` */

insert  into `user_property`(`id`,`pocketId`,`userId`,`balance`,`score`,`withdrawMoney`,`invProperty`) values (1,1,2,3000.00,86,0.00,3000.00),(2,1,3,2000.00,77,2000.00,5000.00);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

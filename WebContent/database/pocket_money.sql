/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.56 : Database - pocket_money
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

/*Table structure for table `bank_type` */

DROP TABLE IF EXISTS `bank_type`;

CREATE TABLE `bank_type` (
  `bankCode` int(10) unsigned NOT NULL COMMENT '主键（调用外部银行接口参数）',
  `bankName` varchar(50) NOT NULL COMMENT '银行名称',
  PRIMARY KEY (`bankCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bank_type` */

insert  into `bank_type`(`bankCode`,`bankName`) values (3001,'招商银行'),(3002,'中国工商银行'),(3003,'中国建设银行'),(3005,'中国农业银行'),(3006,'中国民生银行'),(3009,'兴业银行'),(3020,'交通银行'),(3022,'中国光大银行'),(3026,'中国银行'),(3032,'北京银行'),(3035,'平安银行'),(3036,'广发银行|CGB'),(3037,'上海农商银行'),(3038,'中国邮政储蓄银行'),(3039,'中信银行'),(3050,'华夏银行'),(3059,'上海银行'),(3060,'北京农商银行'),(3100000,'浦发银行'),(3170000,'渤海银行'),(3200000,'BEA东亚银行'),(4083320,'宁波银行'),(4243010,'南京银行');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='信息累计表';

/*Data for the table `info_statis` */

insert  into `info_statis`(`id`,`monthStatis`,`tradeAmount`,`totalAmount`,`userAmount`,`totalIncome`) values (1,'2017-01-31 00:00:00',2813988358.00,19202563580.00,4036545,444018835.00),(2,'2017-02-28 00:00:00',3255456646.00,20004463585.00,4566560,453018835.00),(5,'2017-03-31 00:00:00',3255686875.00,20102563780.00,4766575,454018835.00),(6,'2017-04-30 00:00:00',3158765578.00,21002563740.00,4823553,463767868.00),(7,'2017-05-31 00:00:00',3255655451.00,21202565860.00,5345354,464564564.00),(8,'2017-06-30 00:00:00',2255655471.00,22102585427.00,5643453,486565658.00),(9,'2017-07-31 00:00:00',3255655478.00,22805434354.00,6534534,496464564.00),(10,'2017-08-31 00:00:00',3675568685.00,23156557573.00,7553563,504046617.00),(11,'2017-09-30 00:00:00',3466655121.00,25104687678.00,7563453,515468665.00),(12,'2017-10-31 00:00:00',3245559651.00,28468754786.00,7863758,528686835.00);

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

insert  into `invest_detail`(`id`,`produceId`,`userId`,`tradeDate`,`tradeMoney`,`tradeStatus`) values (1,1,2,'2017-10-21 00:00:00',2000.00,2),(2,2,3,'2017-10-21 00:00:00',1500.00,2);

/*Table structure for table `invest_product` */

DROP TABLE IF EXISTS `invest_product`;

CREATE TABLE `invest_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `produceName` varchar(50) NOT NULL COMMENT '产品名称',
  `invTypeId` int(10) NOT NULL COMMENT '产品类别（外键）',
  `investor` int(10) NOT NULL COMMENT '投资人数',
  `totalAmount` double(10,2) NOT NULL COMMENT '本期可投总金额',
  `residueAmount` double(10,2) NOT NULL COMMENT '剩余可投金额',
  `invStatus` int(10) NOT NULL COMMENT '产品投资状态(1:未发布2:可投3:已投满)\n            \n            ',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`invTypeId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`invTypeId`) REFERENCES `invest_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='投资产品信息表';

/*Data for the table `invest_product` */

insert  into `invest_product`(`id`,`produceName`,`invTypeId`,`investor`,`totalAmount`,`residueAmount`,`invStatus`) values (1,'新手宝-信17JQO1期',1,36,1000000.00,383000.00,2),(2,'月盈宝-信17JWQ4期',2,24,1000000.00,578000.00,2),(3,'新手宝-信17JQ01期',1,36,1000000.00,394000.00,2),(4,'月盈宝-信17JQ04期',2,24,1000000.00,0.00,3),(5,'季盈宝-信17JQ02期',3,28,1000000.00,600000.00,2),(6,'双季盈-信17JQ03期',4,35,1000000.00,480000.00,2),(7,'年盈宝-信17JWT7期',5,4,1000000.00,955000.00,2),(8,'月盈宝-信17EQ02期',2,22,1000000.00,0.00,3),(9,'双季盈-信17SJ03期',4,13,1000000.00,450000.00,2),(10,'年盈宝-信17JWT5期',5,18,1000000.00,939000.00,2),(11,'新手宝-信17JQO5期',1,40,1000000.00,463000.00,2),(12,'新手宝-信17JQO3期',1,52,1000000.00,531000.00,2);

/*Table structure for table `invest_type` */

DROP TABLE IF EXISTS `invest_type`;

CREATE TABLE `invest_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invTypeName` varchar(50) NOT NULL COMMENT '类别名称',
  `annualYield` double(10,4) NOT NULL COMMENT '年化收益率',
  `purchaseMoney` double(10,2) NOT NULL COMMENT '起购金额',
  `deadline` int(10) NOT NULL COMMENT '投资期限（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='投资产品类别表';

/*Data for the table `invest_type` */

insert  into `invest_type`(`id`,`invTypeName`,`annualYield`,`purchaseMoney`,`deadline`) values (1,'新手宝',0.1000,1000.00,15),(2,'月盈宝',0.0652,1000.00,31),(3,'季盈宝',0.0750,1000.00,92),(4,'双季盈',0.0850,1000.00,183),(5,'年盈宝',0.0950,1000.00,365);

/*Table structure for table `msg_push` */

DROP TABLE IF EXISTS `msg_push`;

CREATE TABLE `msg_push` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msgType` int(10) NOT NULL COMMENT '类型(1:充值2:提现3:积分兑现4:公告)',
  `content` varchar(500) NOT NULL COMMENT '内容',
  `releaseDate` datetime NOT NULL COMMENT '发送时间\n            ',
  `title` varchar(50) NOT NULL COMMENT '消息标题',
  `userId` int(10) NOT NULL COMMENT '用户Id',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `msg_push_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='消息推送表';

/*Data for the table `msg_push` */

insert  into `msg_push`(`id`,`msgType`,`content`,`releaseDate`,`title`,`userId`) values (6,1,'您在2017-10-29 14:52:15成功充值了50元！','2017-10-29 00:00:00','用户充值消息',2),(7,1,'您在2017-10-29 14:53:03成功充值了100元！','2017-10-29 00:00:00','用户充值消息',3),(8,1,'您在2017-10-29 19:37:12成功充值了120元！','2017-10-29 00:00:00','用户充值消息',2),(9,2,'您在2017-10-30 08:10:46成功提现了11.0元！','2017-10-30 00:00:00','用户提现消息',2),(10,2,'您在2017-10-30 08:26:24成功提现了1009.12元！','2017-10-30 00:00:00','用户提现消息',2),(11,2,'您在2017-10-30 08:30:12成功提现了1000.0元！','2017-10-30 00:00:00','用户提现消息',2),(12,1,'您在2017-11-01 22:20:22成功充值了11.0元！','2017-11-01 00:00:00','用户充值消息',2),(13,1,'您在2017-11-08 12:08:59成功充值了1200.0元！','2017-11-08 00:00:00','用户充值消息',2),(14,2,'您在2017-11-08 12:09:40成功提现了1200.0元！','2017-11-08 00:00:00','用户提现消息',2),(15,1,'您在2017-11-08 17:46:31成功充值了1000.0元！','2017-11-08 00:00:00','用户充值消息',2),(16,4,'数字经济，无限未来”，口袋理财携“海清”亮相上海国际信息消费博览会','2017-07-05 00:00:00','数字经济，无限未来”，口袋理财携“海清”亮相上海国际信息消费博览会',1),(17,4,'平台【4000020802】客服呼入电话线路升级维护已完成，400客服电话可正常呼入，给您带来的不便敬请谅解 。您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','0217-11-03 00:00:00','400客服呼入电话已恢复正常',1),(18,4,'平台近日会对【4000020802】客服呼入电话线路进行升级维护，届时客服电话将无法正常呼入，敬请谅解 。这段时间内袋王们可以拨打【021-8031-1208】电话联系我们，或者通过客服QQ【4000020802】、社区答疑、口袋小妹【koudaixiaom】、微信公众号【koudailc88】、口袋君微信号与我们联系。您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','2017-11-03 00:00:00','400客服呼入电话线路维护',1),(19,4,'人行将于2017年10月27日23:30至2017年10月28日8:30期间进行系统维护，期间存管提现业务暂停，部分充值业务可能会延迟到账。对您造成的不便，再次表示歉意！','2017-10-27 00:00:00','人行10月28日维护通知',1),(20,4,'平台于10月24日16:00-18:00之间对客服呼入电话线路进行升级维护，整个检测过程大约持续40分钟左右，届时客服电话将无法正常呼入，敬请谅解 。袋王们可以通过客服QQ【4000020802】、社区答疑、口袋小妹【koudaixiaom】、微信公众号【koudailc88】、口袋君微信号与我们联系。您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','2017-10-24 00:00:00','10月24日客服呼入电话线路进行升级维护',1),(21,4,'很抱歉，因为银行通道维护原因，造成午饭时间的提现临时紧急暂停，现口袋技术人员正全力修复该问题，预计下午13:30恢复正常，对您造成的不便，再次表示歉意！','2017-09-29 00:00:00','提通道紧急维护通知',1),(22,4,'十一长假将至，特此将国庆期间的运营情况通知如下：国庆期间，因银行相关系统进行维护，在2017年9月30日18:00至10月8日24:00期间，所有提现将于10月9日到账，请袋王们做好资金安排。节假日期间，口袋理财投资和充值功能均正常进行，不受影响。另外国庆期间平台和社区都有丰富的活动，欢迎袋王们的参与。10月1日 ~ 10月8日为国庆假期，客服服务时间为9:00 ~ 18:00,10月9日起恢复正常 ：工作日9:00 ~ 21:00  节假日9:00 ~ 18:00','2017-09-29 00:00:00','国庆期间运营公告',1),(23,4,'1、央行将于9月22日 23:00~9月23日 9:00 进行维护，期间平台所有提现业务暂停。部分存管用户的大额充值和线下转账充值暂停，其余用户充值不受影响。2、工商银行将于9月22日 19:30~9月23日 0:30 进行维护，期间开户、提现业务暂停。感谢各位袋王的理解与支持。','2017-09-22 00:00:00','9月22~23日银行维护通知',1),(24,4,'平台于9月2日12:00-13:00之间对客服呼入电话线路进行检测维护，整个检测过程大约持续一个小时左右，届时客服电话将无法正常呼入，敬请谅解 。袋王们可以通过客服QQ、社区答疑、口袋小妹、微信公众号、口袋君微信号与我们联系。   您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','2017-09-01 00:00:00','9月2日客服呼入电话线路进行检测维护',1);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `contentPath` varchar(500) NOT NULL COMMENT '内容文件路径',
  `releaseDate` datetime NOT NULL COMMENT '发布时间',
  `newsType` int(10) NOT NULL COMMENT '类别（1:公告2：媒体报道）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='公告、媒体报道表';

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`contentPath`,`releaseDate`,`newsType`) values (2,'口袋理财为青年圆梦，助力英雄再缔传奇','d:/news/medie_20170911.txt','2017-09-11 00:00:00',2),(3,'共话前沿金融科技”口袋理财受邀出席2017朗迪金融科技峰会','d:/news/publish_20170717.txt','2017-07-17 00:00:00',2),(4,'数字经济，无限未来”，口袋理财携“海清”亮相上海国际信息消费博览会','d:/mews/publis_20170705.txt','2017-07-05 00:00:00',2),(5,'400客服呼入电话已恢复正常','平台【4000020802】客服呼入电话线路升级维护已完成，400客服电话可正常呼入，给您带来的不便敬请谅解 。您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','0217-11-03 00:00:00',1),(6,'400客服呼入电话线路维护','平台近日会对【4000020802】客服呼入电话线路进行升级维护，届时客服电话将无法正常呼入，敬请谅解 。这段时间内袋王们可以拨打【021-8031-1208】电话联系我们，或者通过客服QQ【4000020802】、社区答疑、口袋小妹【koudaixiaom】、微信公众号【koudailc88】、口袋君微信号与我们联系。您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','2017-11-03 00:00:00',1),(7,'人行10月28日维护通知','人行将于2017年10月27日23:30至2017年10月28日8:30期间进行系统维护，期间存管提现业务暂停，部分充值业务可能会延迟到账。对您造成的不便，再次表示歉意！','2017-10-27 00:00:00',1),(8,'10月24日客服呼入电话线路进行升级维护','平台于10月24日16:00-18:00之间对客服呼入电话线路进行升级维护，整个检测过程大约持续40分钟左右，届时客服电话将无法正常呼入，敬请谅解 。袋王们可以通过客服QQ【4000020802】、社区答疑、口袋小妹【koudaixiaom】、微信公众号【koudailc88】、口袋君微信号与我们联系。您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','2017-10-24 00:00:00',1),(9,'提通道紧急维护通知','很抱歉，因为银行通道维护原因，造成午饭时间的提现临时紧急暂停，现口袋技术人员正全力修复该问题，预计下午13:30恢复正常，对您造成的不便，再次表示歉意！','2017-09-29 00:00:00',1),(10,'国庆期间运营公告','十一长假将至，特此将国庆期间的运营情况通知如下：国庆期间，因银行相关系统进行维护，在2017年9月30日18:00至10月8日24:00期间，所有提现将于10月9日到账，请袋王们做好资金安排。节假日期间，口袋理财投资和充值功能均正常进行，不受影响。另外国庆期间平台和社区都有丰富的活动，欢迎袋王们的参与。10月1日 ~ 10月8日为国庆假期，客服服务时间为9:00 ~ 18:00,10月9日起恢复正常 ：工作日9:00 ~ 21:00  节假日9:00 ~ 18:00','2017-09-29 00:00:00',1),(11,'9月22~23日银行维护通知','1、央行将于9月22日 23:00~9月23日 9:00 进行维护，期间平台所有提现业务暂停。部分存管用户的大额充值和线下转账充值暂停，其余用户充值不受影响。2、工商银行将于9月22日 19:30~9月23日 0:30 进行维护，期间开户、提现业务暂停。感谢各位袋王的理解与支持。','2017-09-22 00:00:00',1),(12,'9月2日客服呼入电话线路进行检测维护','平台于9月2日12:00-13:00之间对客服呼入电话线路进行检测维护，整个检测过程大约持续一个小时左右，届时客服电话将无法正常呼入，敬请谅解 。袋王们可以通过客服QQ、社区答疑、口袋小妹、微信公众号、口袋君微信号与我们联系。   您的支持是我们前进的动力，愿口袋理财做您最贴心的理财专家。','2017-09-01 00:00:00',1);

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
  `produceId` int(10) DEFAULT NULL COMMENT '产品编号（外键）',
  `tradeMoney` double(10,2) NOT NULL COMMENT '交易金额',
  `tradeDate` datetime NOT NULL COMMENT '交易日期',
  `tradeStatus` int(10) NOT NULL COMMENT '交易状态(1:未完成2:已完成)',
  `tradeTypeId` int(10) NOT NULL COMMENT '交易类别（外键）',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`tradeTypeId`),
  KEY `FK_Reference_4` (`produceId`),
  KEY `FK_Reference_5` (`userId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`tradeTypeId`) REFERENCES `trade_type` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`produceId`) REFERENCES `invest_product` (`id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='个人交易记录表';

/*Data for the table `trade_record` */

insert  into `trade_record`(`id`,`userId`,`produceId`,`tradeMoney`,`tradeDate`,`tradeStatus`,`tradeTypeId`) values (4,2,NULL,3450.00,'2017-10-28 17:06:27',2,2),(5,2,NULL,360.00,'2017-10-28 17:15:56',2,2),(10,2,NULL,1230.00,'2017-10-29 14:41:17',2,2),(11,3,NULL,8000.00,'2017-10-29 14:46:12',2,2),(12,3,NULL,1200.00,'2017-10-29 14:48:45',2,2),(13,2,NULL,50.00,'2017-10-29 14:52:15',2,2),(14,3,NULL,100.00,'2017-10-29 14:53:03',2,2),(15,2,NULL,120.00,'2017-10-29 19:37:12',2,3),(16,2,NULL,11.00,'2017-10-30 08:10:46',2,3),(17,2,NULL,1009.12,'2017-10-30 08:26:24',2,3),(18,2,NULL,1000.00,'2017-10-30 08:30:12',2,3);

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
  `idNumber` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `bankNumber` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `exchangePassword` varchar(50) DEFAULT NULL COMMENT '交易密码',
  `userName` varchar(50) DEFAULT NULL COMMENT '姓名',
  `userType` int(10) NOT NULL COMMENT '用户类型(1:管理员 2：普通用户)',
  `bankName` int(10) unsigned DEFAULT NULL COMMENT '银行名称',
  PRIMARY KEY (`id`),
  KEY `bankName` (`bankName`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`bankName`) REFERENCES `bank_type` (`bankCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户注册信息表';

/*Data for the table `user` */

insert  into `user`(`id`,`loginName`,`password`,`idNumber`,`bankNumber`,`exchangePassword`,`userName`,`userType`,`bankName`) values (1,'13123456789','21232f297a57a5a743894a0e4a801fc3','422312199602123569','95989965465465466','e10adc3949ba59abbe56e057f20f883e','管理员',1,3039),(2,'15123456789','e10adc3949ba59abbe56e057f20f883e','430231201011256535','54645654165465456','e10adc3949ba59abbe56e057f20f883e','张三',2,3009),(3,'18123456789','e10adc3949ba59abbe56e057f20f883e','421321198011034568','46455144114564664','e10adc3949ba59abbe56e057f20f883e','李四',2,3020);

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

insert  into `user_income`(`id`,`userId`,`dayAccount`,`incomeDay`) values (1,2,126.00,'2017-11-07 00:00:00'),(2,2,130.00,'2017-11-08 00:00:00'),(3,3,160.00,'2017-10-13 00:00:00'),(4,3,150.00,'2017-11-08 00:00:00');

/*Table structure for table `user_property` */

DROP TABLE IF EXISTS `user_property`;

CREATE TABLE `user_property` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pocketId` int(10) NOT NULL COMMENT '口袋券（外键）',
  `userId` int(10) NOT NULL COMMENT '用户编号（外键）',
  `balance` double(10,2) NOT NULL COMMENT '余额 ',
  `score` int(10) DEFAULT NULL COMMENT '积分',
  `withdrawMoney` double(10,2) DEFAULT NULL COMMENT '提现金额',
  `invProperty` double(10,2) NOT NULL COMMENT '投资资产（持有资产）',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`pocketId`),
  KEY `FK_Reference_9` (`userId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`pocketId`) REFERENCES `pocket_stamp` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='个人资产详情表';

/*Data for the table `user_property` */

insert  into `user_property`(`id`,`pocketId`,`userId`,`balance`,`score`,`withdrawMoney`,`invProperty`) values (1,1,2,7011.00,86,10.12,14000.00),(2,1,3,11300.13,77,2000.00,5000.00);

/*Table structure for table `invest_msg` */

DROP TABLE IF EXISTS `invest_msg`;

/*!50001 DROP VIEW IF EXISTS `invest_msg` */;
/*!50001 DROP TABLE IF EXISTS `invest_msg` */;

/*!50001 CREATE TABLE  `invest_msg`(
 `produceName` varchar(50) ,
 `invTypeId` int(10) ,
 `tradeMoney` double(10,2) ,
 `tradeDate` datetime ,
 `tradeStatus` int(10) 
)*/;

/*View structure for view invest_msg */

/*!50001 DROP TABLE IF EXISTS `invest_msg` */;
/*!50001 DROP VIEW IF EXISTS `invest_msg` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `invest_msg` AS (select `p`.`produceName` AS `produceName`,`p`.`invTypeId` AS `invTypeId`,`r`.`tradeMoney` AS `tradeMoney`,`r`.`tradeDate` AS `tradeDate`,`r`.`tradeStatus` AS `tradeStatus` from ((`invest_product` `p` join `invest_type` `t`) join `trade_record` `r`) where ((`r`.`produceId` = `p`.`id`) and (`p`.`invTypeId` = `t`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

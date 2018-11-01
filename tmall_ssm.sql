/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : tmall_ssm

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-01 10:50:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('60', '安全座椅');
INSERT INTO `category` VALUES ('64', '太阳镜');
INSERT INTO `category` VALUES ('68', '品牌女装');
INSERT INTO `category` VALUES ('69', '时尚男鞋');
INSERT INTO `category` VALUES ('71', '男士西服');
INSERT INTO `category` VALUES ('72', '男士手拿包 ');
INSERT INTO `category` VALUES ('73', '男表');
INSERT INTO `category` VALUES ('74', '女表');
INSERT INTO `category` VALUES ('75', '空调');
INSERT INTO `category` VALUES ('76', '冰箱');
INSERT INTO `category` VALUES ('77', '原汁机');
INSERT INTO `category` VALUES ('78', '扫地机器人 ');
INSERT INTO `category` VALUES ('79', '平衡车');
INSERT INTO `category` VALUES ('81', '沙发');
INSERT INTO `category` VALUES ('82', '马桶');
INSERT INTO `category` VALUES ('83', '平板电视');
INSERT INTO `category` VALUES ('357', '怪物猎人世界');
INSERT INTO `category` VALUES ('358', '英雄联盟');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_user` (`uid`),
  KEY `fk_orderitem_order` (`oid`),
  KEY `fk_orderitem_product` (`pid`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('10', '11', '11', '2', '5');
INSERT INTO `orderitem` VALUES ('14', '17', '15', '2', '1');
INSERT INTO `orderitem` VALUES ('16', '14', '12', '2', '1');
INSERT INTO `orderitem` VALUES ('18', '16', '13', '2', '1');
INSERT INTO `orderitem` VALUES ('19', '21', '14', '2', '1');
INSERT INTO `orderitem` VALUES ('20', '14', '15', '2', '1');
INSERT INTO `orderitem` VALUES ('21', '15', '15', '2', '1');
INSERT INTO `orderitem` VALUES ('22', '12', '15', '2', '1');
INSERT INTO `orderitem` VALUES ('23', '11', '15', '2', '1');
INSERT INTO `orderitem` VALUES ('24', '14', '16', '2', '1');
INSERT INTO `orderitem` VALUES ('25', '11', '17', '2', '1');

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `userMessage` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', '201608241638122609867', '某某市，某某区，某某街道，某某号 ', '610000', '某某某', '15111111111', null, '2016-12-30 00:00:00', null, '2018-09-28 19:37:49', null, '6', 'waitConfirm');
INSERT INTO `order_` VALUES ('2', '20181002183221386278', '13432', '12321', '2143', '2313', '', '2018-10-02 18:32:22', null, null, null, '2', 'waitPay');
INSERT INTO `order_` VALUES ('3', '20181002183731406542', '31243', '34', '123', '123', '', '2018-10-02 18:37:31', null, null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('4', '20181002184448033986', '31243', '34', '123', '123', '', '2018-10-02 18:44:48', null, null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('5', '20181002190801949270', '345', '432', '23', '234', '', '2018-10-02 19:08:02', '2018-10-04 12:38:39', null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('6', '20181002191036077871', '2143', '12312', '3124', '143', '', '2018-10-02 19:10:36', '2018-10-02 19:10:51', null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('7', '20181004114111010653', '324', '32423', '4324', '4324', '', '2018-10-04 11:41:11', '2018-10-04 11:41:14', null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('8', '20181004121346372123', '43', '123', '213', '213', '', '2018-10-04 12:13:46', '2018-10-04 12:13:49', null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('9', '20181004123615991400', '213', '432', '423', '324', '', '2018-10-04 12:36:16', '2018-10-04 12:36:19', null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('10', '20181004123921756508', '123', '1324', '67', '0978', '', '2018-10-04 12:39:22', null, null, null, '2', 'delete');
INSERT INTO `order_` VALUES ('11', '20181009163653299408', '1234', '123', '213', '12413', '', '2018-10-09 16:36:53', '2018-10-09 16:36:56', '2018-10-13 10:53:29', null, '2', 'waitConfirm');
INSERT INTO `order_` VALUES ('12', '20181011115229108651', '1234', '432', '432', '432', '', '2018-10-11 11:52:29', null, null, null, '2', 'waitPay');
INSERT INTO `order_` VALUES ('13', '20181013104447702762', '214', '234', '4324', '3424', '', '2018-10-13 10:44:48', '2018-10-13 10:44:59', '2018-10-13 10:53:29', '2018-10-13 11:08:03', '2', 'waitReview');
INSERT INTO `order_` VALUES ('14', '20181013114209740397', '67866', '4864', '867', '68675', '', '2018-10-13 11:42:10', '2018-10-13 11:42:12', '2018-10-13 11:42:32', '2018-10-13 11:42:51', '2', 'delete');
INSERT INTO `order_` VALUES ('15', '20181013143117507343', '34325', '43534', '435', '5435', '', '2018-10-13 14:31:18', '2018-10-13 14:31:20', '2018-10-13 14:31:32', '2018-10-13 14:31:59', '2', 'finish');
INSERT INTO `order_` VALUES ('16', '20181028121215842797', '14312', '123', '213', '3213', '', '2018-10-28 12:12:16', '2018-10-29 17:05:22', '2018-10-29 17:05:31', '2018-10-29 17:05:46', '2', 'waitReview');
INSERT INTO `order_` VALUES ('17', '20181029170308809801', '67', '098-', '0-', '=-0', '', '2018-10-29 17:03:09', '2018-10-29 17:03:14', '2018-10-29 17:04:24', '2018-10-29 17:05:00', '2', 'waitReview');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `promotePrice` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('11', '太刀', '帅是一辈子的事情', '99.98', '19.98', '199', '357', '2018-10-05 11:01:13');
INSERT INTO `product` VALUES ('12', '盾斧', '性感超解，在线释放', '99.98', '19.98', '199', '357', '2018-10-05 11:08:04');
INSERT INTO `product` VALUES ('13', '铳枪', '无敌小钢炮', '99.98', '19.98', '199', '357', '2018-10-05 11:09:34');
INSERT INTO `product` VALUES ('14', '双刀', '人晕晕的', '99.98', '19.98', '199', '357', '2018-10-05 11:10:40');
INSERT INTO `product` VALUES ('15', '大剑', '有了它，雕兄不在寂寞', '99.98', '19.98', '199', '357', '2018-10-05 11:15:31');
INSERT INTO `product` VALUES ('16', 'EZ', 'EZ', '99.98', '19.98', '199', '358', '2018-10-05 11:36:14');
INSERT INTO `product` VALUES ('17', '辛德拉', '辛德拉', '99.98', '19.98', '199', '358', '2018-10-05 11:36:21');
INSERT INTO `product` VALUES ('18', '娑娜', '娑娜', '99.98', '19.98', '199', '358', '2018-10-05 11:36:29');
INSERT INTO `product` VALUES ('19', '金克斯', '金克斯', '99.98', '19.98', '199', '358', '2018-10-05 11:36:41');
INSERT INTO `product` VALUES ('20', '波比', '波比', '99.98', '19.98', '199', '358', '2018-10-05 11:36:52');
INSERT INTO `product` VALUES ('21', '小炮', '小炮', '99.98', '19.98', '199', '358', '2018-10-05 11:37:00');
INSERT INTO `product` VALUES ('22', '阿狸', '阿狸', '99.98', '19.98', '199', '358', '2018-10-05 11:37:18');
INSERT INTO `product` VALUES ('23', '拉克丝', '拉克丝', '99.98', '19.98', '199', '358', '2018-10-05 11:37:29');

-- ----------------------------
-- Table structure for productimage
-- ----------------------------
DROP TABLE IF EXISTS `productimage`;
CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`),
  CONSTRAINT `fk_productimage_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productimage
-- ----------------------------
INSERT INTO `productimage` VALUES ('48', '15', 'type_single');
INSERT INTO `productimage` VALUES ('49', '14', 'type_single');
INSERT INTO `productimage` VALUES ('50', '13', 'type_single');
INSERT INTO `productimage` VALUES ('51', '12', 'type_single');
INSERT INTO `productimage` VALUES ('52', '11', 'type_single');
INSERT INTO `productimage` VALUES ('53', '23', 'type_single');
INSERT INTO `productimage` VALUES ('54', '22', 'type_single');
INSERT INTO `productimage` VALUES ('55', '21', 'type_single');
INSERT INTO `productimage` VALUES ('56', '20', 'type_single');
INSERT INTO `productimage` VALUES ('57', '19', 'type_single');
INSERT INTO `productimage` VALUES ('58', '18', 'type_single');
INSERT INTO `productimage` VALUES ('59', '17', 'type_single');
INSERT INTO `productimage` VALUES ('60', '16', 'type_single');
INSERT INTO `productimage` VALUES ('61', '23', 'type_detail');
INSERT INTO `productimage` VALUES ('62', '23', 'type_single');
INSERT INTO `productimage` VALUES ('63', '23', 'type_detail');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `fk_Property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('15', '357', '攻击力');
INSERT INTO `property` VALUES ('16', '357', '武器属性');
INSERT INTO `property` VALUES ('17', '357', '孔');
INSERT INTO `property` VALUES ('18', '358', '英雄皮肤');

-- ----------------------------
-- Table structure for propertyvalue
-- ----------------------------
DROP TABLE IF EXISTS `propertyvalue`;
CREATE TABLE `propertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyvalue_property` (`ptid`),
  KEY `fk_propertyvalue_product` (`pid`),
  CONSTRAINT `fk_propertyvalue_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_propertyvalue_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of propertyvalue
-- ----------------------------
INSERT INTO `propertyvalue` VALUES ('7', '15', '17', '0');
INSERT INTO `propertyvalue` VALUES ('8', '15', '16', '雷');
INSERT INTO `propertyvalue` VALUES ('9', '15', '15', '315');
INSERT INTO `propertyvalue` VALUES ('10', '14', '17', '0');
INSERT INTO `propertyvalue` VALUES ('11', '14', '16', '水');
INSERT INTO `propertyvalue` VALUES ('12', '14', '15', '150');
INSERT INTO `propertyvalue` VALUES ('13', '13', '17', '0');
INSERT INTO `propertyvalue` VALUES ('14', '13', '16', '火');
INSERT INTO `propertyvalue` VALUES ('15', '13', '15', '215');
INSERT INTO `propertyvalue` VALUES ('16', '12', '17', '0');
INSERT INTO `propertyvalue` VALUES ('17', '12', '16', '龙');
INSERT INTO `propertyvalue` VALUES ('18', '12', '15', '220');
INSERT INTO `propertyvalue` VALUES ('19', '11', '17', '0');
INSERT INTO `propertyvalue` VALUES ('20', '11', '16', '龙');
INSERT INTO `propertyvalue` VALUES ('21', '11', '15', '245');
INSERT INTO `propertyvalue` VALUES ('22', '23', '18', '拉克丝');
INSERT INTO `propertyvalue` VALUES ('23', '22', '18', '狐狸');
INSERT INTO `propertyvalue` VALUES ('24', '21', '18', '小炮');
INSERT INTO `propertyvalue` VALUES ('25', '20', '18', '波比');
INSERT INTO `propertyvalue` VALUES ('26', '19', '18', '金克斯');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`pid`),
  KEY `fk_review_user` (`uid`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES ('1', '到1 2321432', '2', '11', '2018-10-14 03:21:31');
INSERT INTO `review` VALUES ('2', '32432543', '2', '21', '2018-10-19 09:40:07');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '测试用户0', 'password0');
INSERT INTO `user` VALUES ('2', '测试用户1', 'password1');
INSERT INTO `user` VALUES ('3', '测试用户2', 'password2');
INSERT INTO `user` VALUES ('4', '测试用户3', 'password3');
INSERT INTO `user` VALUES ('5', '测试用户4', 'password4');
INSERT INTO `user` VALUES ('6', '测试用户7', 'password7');
INSERT INTO `user` VALUES ('7', '测试用户8', 'password8');
INSERT INTO `user` VALUES ('8', '测试用户9', 'password9');
INSERT INTO `user` VALUES ('9', '赛文721', '123');
INSERT INTO `user` VALUES ('10', '龙卷', '123');

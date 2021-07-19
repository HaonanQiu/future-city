/*
Navicat MySQL Data Transfer

Source Server         : myconnection
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2021-07-16 14:43:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for balance
-- ----------------------------
DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance` (
  `hid` int(11) DEFAULT NULL COMMENT '户主id',
  `rid` varchar(20) DEFAULT NULL COMMENT '房屋编号',
  `water` decimal(6,2) DEFAULT '0.00' COMMENT '水费余额',
  `electric` decimal(6,2) DEFAULT '0.00' COMMENT '电费余额',
  `gas` decimal(6,2) DEFAULT '0.00' COMMENT '燃气费余额',
  `property` decimal(6,2) DEFAULT '0.00' COMMENT '物业费余额',
  KEY `fk_balance_hid` (`hid`),
  KEY `fk_balance_rid` (`rid`),
  CONSTRAINT `fk_balance_hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_balance_rid` FOREIGN KEY (`rid`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for complaint_information
-- ----------------------------
DROP TABLE IF EXISTS `complaint_information`;
CREATE TABLE `complaint_information` (
  `id` int(11) NOT NULL COMMENT '信息id',
  `message` mediumtext COMMENT '投诉信息内容',
  `hid` int(11) DEFAULT NULL COMMENT '投诉人id（匿名，不匿名）',
  `createTime` datetime DEFAULT NULL COMMENT '投诉时间',
  `state` int(11) DEFAULT NULL COMMENT '事件状态（0未读；1已读）',
  PRIMARY KEY (`id`),
  KEY `fk_com_cid` (`hid`),
  CONSTRAINT `fk_com_cid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `rid` int(11) DEFAULT NULL COMMENT '报修id',
  `star` decimal(2,1) DEFAULT '0.0' COMMENT '星级',
  `content` mediumtext COMMENT '评价内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for householder
-- ----------------------------
DROP TABLE IF EXISTS `householder`;
CREATE TABLE `householder` (
  `id` int(11) NOT NULL COMMENT '户主id',
  `name` varchar(20) DEFAULT NULL COMMENT '户主姓名',
  `identification` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '123456' COMMENT '密码',
  `state` int(11) DEFAULT NULL COMMENT '账号状态（0未启用；1启用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资讯id  自增',
  `title` varchar(60) DEFAULT NULL COMMENT '资讯标题',
  `content` mediumtext COMMENT '资讯内容',
  `readCount` int(11) DEFAULT '0' COMMENT '阅读次数',
  `sendTime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for life_cost
-- ----------------------------
DROP TABLE IF EXISTS `life_cost`;
CREATE TABLE `life_cost` (
  `rid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '房屋编号',
  `hid` int(11) DEFAULT NULL COMMENT '户主编号',
  `category` int(11) DEFAULT NULL COMMENT '费用类别（0水表；1电表；2燃气表；3物业费）',
  `consumption` decimal(6,2) DEFAULT '0.00' COMMENT '当前用量',
  `difference` decimal(6,2) DEFAULT '0.00' COMMENT '差量',
  `inputDate` datetime DEFAULT NULL COMMENT '记录日期',
  `price` decimal(6,2) DEFAULT '0.00' COMMENT '小计',
  KEY `fk_cost_rid` (`rid`),
  KEY `fk_cost_hid` (`hid`),
  CONSTRAINT `fk_cost_hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cost_rid` FOREIGN KEY (`rid`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(20) NOT NULL COMMENT '订单id',
  `hid` int(11) DEFAULT NULL COMMENT '户主id',
  `payDate` datetime DEFAULT NULL COMMENT '支付日期',
  `payment` int(11) DEFAULT NULL COMMENT '支付方式（0支付宝；1现金）',
  `money` decimal(6,2) DEFAULT NULL COMMENT '支付金额',
  `type` int(11) DEFAULT NULL COMMENT '订单类型（0水费；1电费；2燃气费；3物业费）',
  PRIMARY KEY (`id`),
  KEY `fk_orders_hid` (`hid`),
  CONSTRAINT `fk_orders_hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for parking
-- ----------------------------
DROP TABLE IF EXISTS `parking`;
CREATE TABLE `parking` (
  `id` varchar(50) NOT NULL COMMENT '停车位编号',
  `area` varchar(2) DEFAULT NULL COMMENT '区域号',
  `startDate` datetime DEFAULT NULL COMMENT '起始日期',
  `endDate` datetime DEFAULT NULL COMMENT '终止日期',
  `state` int(11) DEFAULT NULL COMMENT '停车位状态（0闲置；1租赁；2售出）',
  `hid` int(11) DEFAULT NULL COMMENT '业主id',
  PRIMARY KEY (`id`),
  KEY `fk_paking_hid` (`hid`),
  CONSTRAINT `fk_paking_hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for repair_information
-- ----------------------------
DROP TABLE IF EXISTS `repair_information`;
CREATE TABLE `repair_information` (
  `id` int(11) NOT NULL COMMENT '信息id',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `message` mediumtext COMMENT '报修信息内容',
  `hid` int(11) DEFAULT NULL COMMENT '户主编号',
  `createTime` datetime DEFAULT NULL COMMENT '报修时间',
  `finishTime` datetime DEFAULT NULL COMMENT '完成时间',
  `state` int(11) DEFAULT NULL COMMENT '事件状态（0未处理；1处理中；2待评价；3已完成）',
  PRIMARY KEY (`id`),
  KEY `fk_rep_hid` (`hid`),
  CONSTRAINT `fk_rep_hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` varchar(255) DEFAULT NULL,
  `hid` int(11) DEFAULT NULL,
  `water` decimal(6,2) DEFAULT NULL,
  `electric` decimal(6,2) DEFAULT NULL,
  `gas` decimal(6,2) DEFAULT NULL,
  `property` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hid` (`hid`),
  KEY `rid` (`rid`),
  CONSTRAINT `hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rid` FOREIGN KEY (`rid`) REFERENCES `room` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` varchar(20) NOT NULL COMMENT '房屋编号',
  `buildingNum` int(11) DEFAULT NULL COMMENT '楼号',
  `unitNum` int(11) DEFAULT NULL COMMENT '单元号',
  `roomNum` int(11) DEFAULT NULL COMMENT '门牌号',
  `area` int(11) DEFAULT NULL COMMENT '房屋面积',
  `hid` int(11) DEFAULT NULL COMMENT '户主id',
  `state` int(11) DEFAULT NULL COMMENT '房屋状态（0无人；1有人）',
  PRIMARY KEY (`id`),
  KEY `fk_hid` (`hid`),
  CONSTRAINT `fk_hid` FOREIGN KEY (`hid`) REFERENCES `householder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for unit_price
-- ----------------------------
DROP TABLE IF EXISTS `unit_price`;
CREATE TABLE `unit_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单价名',
  `price` decimal(6,2) DEFAULT '0.00' COMMENT '单价',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

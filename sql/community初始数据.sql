/*
Navicat MySQL Data Transfer

Source Server         : myconnection
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : community

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2021-07-16 09:25:41
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
-- Records of balance
-- ----------------------------
INSERT INTO `balance` VALUES ('3129647', 'jK32rAkZ', '99.00', '99.00', '99.00', '100.00');

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
-- Records of complaint_information
-- ----------------------------

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
-- Records of evaluate
-- ----------------------------

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
-- Records of householder
-- ----------------------------
INSERT INTO `householder` VALUES ('3129647', '邱浩蓝', '120225196606045861', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('8224967', '虹村亿泰', '150640199010054896', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('11576555', '卡塔库栗', '120540198605316541', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('15564852', '祖仨月', '120223196502284562', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('17553548', '阿古茹', '203650196603286591', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('17847877', '福葛', '420630198912099421', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('17887271', '艾克赛德', '450650194404063579', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('18583080', '普罗修特', '162045198710304587', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('21016885', '赵老五', '130230196912080578', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('25673238', '高原', '120223200208070158', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('25763906', '里苏特', '920310198804042511', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('25794355', '贝西', '420350199001061467', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('34629624', '广濑康一', '130450199405084533', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('37755530', '欧兹', '268453194406150009', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('38369099', '零一', '120660194401013561', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('38858540', '甲斗', '420660194406063599', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('40622246', '王宇冻', '430235200105085132', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('40646140', '空条承太郎', '120420198005067854', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('42077730', '空我', '194403056217', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('45731342', '米斯达', '540901199206084561', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('46433657', '王老四', '650302198811064895', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('48546269', '泽塔', '860340196602084565', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('55240870', '纳兰迦', '450150199206143577', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('56496295', '东方仗助', '156024199503045641', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('61044770', '吉良吉影', '540260198506064211', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('62278338', '麦套房', '120224199309250507', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('62914766', '张老三', '205456185603052548', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('65611727', '麦克斯', '150640196604124231', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('66487234', '罗宾', '120650199403065612', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('66856752', '赛罗', '470350196602042561', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('69898629', '戴两天', '120223199412301548', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('71342761', '艾斯', '568410196603206851', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('72735245', '乔鲁诺', '120680199009074239', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('75037905', '檀黎斗', '120223198811070110', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('76273805', '龙骑', '620330194403071639', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('78655868', '迪奥', '560230196502041568', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('78700200', '花京院', '540236198810063658', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('80258327', '高斯', '190940196610315429', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('82735276', '电王', '660440194408086897', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('84842412', '盖亚', '540920196603193965', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('87900573', '布加拉提', '160380198905041397', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('88606171', '朱一年', '120223195406266548', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('89216366', '迪亚波罗', '120380198502045623', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('90183479', '岸边露伴', '520320198605034971', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('92465813', '王号', '510269200712053285', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('94705632', '乔瑟夫', '120546196010154895', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('99606738', '欧布', '520610196610053647', '', '', '123456', '0');
INSERT INTO `householder` VALUES ('99855505', '路飞', '540320198605041247', '', '', '123456', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('7', '好消息，水费大减价！', '即日起，每平米水单价减少0.1元！！', '0', '2021-07-16 01:15:36');
INSERT INTO `information` VALUES ('8', '近期降温预警', '最近气温将会骤降，大家做好保暖措施，防止感冒。', '0', '2021-07-16 01:17:01');
INSERT INTO `information` VALUES ('9', '扫黑除恶，共创绿色家园', '本小区积极配合扫黑除恶专项斗争，望大家互相监督，发现恶性事件及时举报，不要助长恶势力！', '0', '2021-07-16 01:18:23');
INSERT INTO `information` VALUES ('10', '出入请戴口罩', '积极响应新冠肺炎预防措施，请大家外出进入时带好口罩，严防病毒传播，共创健康家园。', '0', '2021-07-16 01:20:31');
INSERT INTO `information` VALUES ('11', '7月19日活动预告', '7月19日中午12点，正阳春鸭子楼将于本小区展开“谁是大胃王”比赛，诚邀各路大胃王参与比赛，所有参与者将获得正阳春精品纪念品一份！', '0', '2021-07-16 01:25:07');
INSERT INTO `information` VALUES ('12', '施工提醒', '近期物业将派施工队来小区内为管道换新，白天将会有很大动静，请夜晚工作者做好防护措施，望大家理解，谢谢！', '0', '2021-07-16 01:27:08');

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
-- Records of life_cost
-- ----------------------------
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '0', '0.00', '0.00', '2021-07-16 09:05:28', '0.00');
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '1', '0.00', '0.00', '2021-07-16 09:05:51', '0.00');
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '2', '0.00', '0.00', '2021-07-16 09:06:08', '0.00');
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '3', '0.00', '0.00', '2021-07-16 09:06:26', '0.00');
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '0', '1.00', '1.00', '2021-07-16 09:19:42', '2.00');
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '1', '1.00', '1.00', '2021-07-16 09:19:45', '0.80');
INSERT INTO `life_cost` VALUES ('jK32rAkZ', '3129647', '2', '1.00', '1.00', '2021-07-16 09:19:46', '5.80');

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
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('李四', '111111');
INSERT INTO `login` VALUES ('王五', '123456');

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
-- Records of orders
-- ----------------------------

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
-- Records of parking
-- ----------------------------

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
-- Records of repair_information
-- ----------------------------

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
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('3', 'jK32rAkZ', '3129647', '1.00', '1.00', '1.00', '0.00');

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
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('AUUTezNm', '1', '2', '1202', '150', '92465813', '1');
INSERT INTO `room` VALUES ('DKi8J2lC', '1', '2', '1203', '150', '62278338', '1');
INSERT INTO `room` VALUES ('HEKDbFHR', '4', '1', '502', '120', '69898629', '1');
INSERT INTO `room` VALUES ('jK32rAkZ', '1', '1', '1102', '150', '3129647', '1');
INSERT INTO `room` VALUES ('K8OqYixr', '1', '1', '1103', '150', '40622246', '1');
INSERT INTO `room` VALUES ('n9IWqe40', '1', '1', '1101', '150', '75037905', '1');
INSERT INTO `room` VALUES ('UIgB1XG6', '5', '2', '1206', '120', '88606171', '1');
INSERT INTO `room` VALUES ('YQUeT7G7', '1', '2', '1201', '150', '25673238', '1');
INSERT INTO `room` VALUES ('ZXAVftoo', '1', '3', '301', '120', '15564852', '1');

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

-- ----------------------------
-- Records of unit_price
-- ----------------------------
INSERT INTO `unit_price` VALUES ('1', '水费', '2.00', '每立方米');
INSERT INTO `unit_price` VALUES ('2', '电费', '0.80', '每度');
INSERT INTO `unit_price` VALUES ('3', '燃气费', '5.80', '每立方米');
INSERT INTO `unit_price` VALUES ('4', '物业费', '1.00', '每平方米一月');

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : crm-test

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-03-18 09:50:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for care
-- ----------------------------
DROP TABLE IF EXISTS `care`;
CREATE TABLE `care` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `executor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of care
-- ----------------------------
INSERT INTO `care` VALUES ('1', '哈哈', '2019-03-09', 'OOOO');
INSERT INTO `care` VALUES ('2', '呵呵', '2019-03-09', '哈哈');
INSERT INTO `care` VALUES ('3', '太棒', '2019-03-09', '哈哈');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `customer_category_value` varchar(50) DEFAULT NULL,
  `stage_value` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `care_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '疯不觉哈哈哈', '1231', '2210384480@qq.com', '深圳', null, null, null, '1', '1', '1');

-- ----------------------------
-- Table structure for customer_category
-- ----------------------------
DROP TABLE IF EXISTS `customer_category`;
CREATE TABLE `customer_category` (
  `customer_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_category_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_category
-- ----------------------------
INSERT INTO `customer_category` VALUES ('1', '1');

-- ----------------------------
-- Table structure for customer_stage
-- ----------------------------
DROP TABLE IF EXISTS `customer_stage`;
CREATE TABLE `customer_stage` (
  `stage_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_stage
-- ----------------------------
INSERT INTO `customer_stage` VALUES ('1', 'O(∩_∩)O', '33');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `percode` varchar(50) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `seq` varchar(50) DEFAULT NULL,
  `available` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '服务管理', '666', '', null, null, '1', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('2', '客户管理', '666', '', null, null, '1', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('4', '系统管理', '666', '', null, null, '1', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('5', '统计分析', '666', '', null, null, '1', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('10', '客户监控', '666', '/custom/control', null, '2', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('11', '客户分析', '66', '/custom/analy', null, '2', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('12', '客户关怀', '66', '/custom/care', null, '2', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('13', '客户信息', '66', '/custom/new', null, '2', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('14', '添加功能', '66', '/count/add', null, '5', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('15', '费用分析', '66', '/count/cost', null, '5', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('16', '市场分析', '66', '/count/market', null, '5', '', null, '2019-03-06 15:03:34', '1');
INSERT INTO `permission` VALUES ('17', '采购分析', '66', '/count/purchase', null, '5', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('18', '客户来源分析', '66', '/count/sales', null, '5', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('19', '客户反馈', '66', '/serve/feedback', null, '1', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('20', '产品类别', '66', '/serve/kind', null, '1', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('21', '产品信息', '66', '/serve/order', null, '1', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('22', 'QA库管理', null, '/serve/QA', null, '1', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('23', '用户管理', '66', '/system/user', null, '4', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('24', '权限管理', '66', '/system/power', null, '4', null, null, '2019-03-06 15:03:34', null);
INSERT INTO `permission` VALUES ('25', '合同订单分析', '66', '/count/contract', null, '5', null, null, '2019-03-06 15:03:34', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'user');
INSERT INTO `role` VALUES ('3', 'visitor');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permission_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('4', '1');
INSERT INTO `role_permission` VALUES ('5', '1');
INSERT INTO `role_permission` VALUES ('6', '1');
INSERT INTO `role_permission` VALUES ('7', '1');
INSERT INTO `role_permission` VALUES ('8', '1');
INSERT INTO `role_permission` VALUES ('9', '1');
INSERT INTO `role_permission` VALUES ('10', '1');
INSERT INTO `role_permission` VALUES ('11', '1');
INSERT INTO `role_permission` VALUES ('12', '1');
INSERT INTO `role_permission` VALUES ('13', '1');
INSERT INTO `role_permission` VALUES ('14', '1');
INSERT INTO `role_permission` VALUES ('15', '1');
INSERT INTO `role_permission` VALUES ('16', '1');
INSERT INTO `role_permission` VALUES ('17', '1');
INSERT INTO `role_permission` VALUES ('18', '1');
INSERT INTO `role_permission` VALUES ('19', '1');
INSERT INTO `role_permission` VALUES ('20', '1');
INSERT INTO `role_permission` VALUES ('21', '1');
INSERT INTO `role_permission` VALUES ('22', '1');
INSERT INTO `role_permission` VALUES ('23', '1');
INSERT INTO `role_permission` VALUES ('24', '1');
INSERT INTO `role_permission` VALUES ('25', '1');

-- ----------------------------
-- Table structure for stage
-- ----------------------------
DROP TABLE IF EXISTS `stage`;
CREATE TABLE `stage` (
  `stage_id` int(11) NOT NULL,
  `stage_value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stage
-- ----------------------------
INSERT INTO `stage` VALUES ('1', 'O(∩_∩)O');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `department` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Mark', 'Mark', '2019-03-06 15:03:34', '1', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', '男');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('1', '2');

/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ring

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-12-03 14:42:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_act
-- ----------------------------
DROP TABLE IF EXISTS `t_act`;
CREATE TABLE `t_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `act_name` varchar(20) DEFAULT NULL,
  `act_loca` varchar(10) DEFAULT NULL,
  `act_address` varchar(20) DEFAULT NULL,
  `admin` varchar(10) DEFAULT NULL,
  `act_form` varchar(1) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `editorValue` varchar(1000) DEFAULT NULL,
  `money` double(10,3) DEFAULT NULL,
  `act_state` varchar(1) DEFAULT NULL COMMENT '0.待审核 1.已审核，准备 2.一开始 3.已结束',
  `act_date` datetime DEFAULT NULL,
  `act_end` datetime DEFAULT NULL COMMENT '结束时间',
  `acount` int(11) DEFAULT NULL COMMENT '人数上限',
  `pay_type` varchar(1) DEFAULT NULL COMMENT '付费方式',
  `pay_range` varchar(20) DEFAULT NULL COMMENT '付费范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : ring

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 02/02/2019 15:54:21 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_act`
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
  `act_state` varchar(1) DEFAULT NULL COMMENT '0.待审核 1.已审核，准备 2.一开始 3.已结束 4.拒绝',
  `act_date` datetime DEFAULT NULL,
  `act_end` datetime DEFAULT NULL COMMENT '结束时间',
  `acount` int(11) DEFAULT NULL COMMENT '人数上限',
  `pay_type` varchar(1) DEFAULT NULL COMMENT '付费方式',
  `pay_range` varchar(20) DEFAULT NULL COMMENT '付费范围',
  `singleflag` varchar(1) DEFAULT NULL COMMENT '是否是单身活动',
  `remark` varchar(100) DEFAULT NULL,
  `actimg` varchar(150) DEFAULT NULL COMMENT '活动封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_act_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_act_detail`;
CREATE TABLE `t_act_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `detail_state` varchar(1) DEFAULT NULL COMMENT '0取消申请 1.申请 2.同意 3.缴费 4退出 5结束 6未参加 7拒绝',
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

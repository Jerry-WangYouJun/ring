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

 Date: 12/01/2018 04:30:56 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(30) DEFAULT NULL,
  `examine` varchar(1) DEFAULT '0' COMMENT '审核状态-关联字典表  0 默认未审核  9 ： 约会中   ',
  `head_image` int(11) DEFAULT NULL COMMENT '头像表',
  `ch_name` varchar(30) DEFAULT NULL COMMENT '中文名',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(1) DEFAULT '1' COMMENT '性别  1：男  0：女',
  `birthday2` date DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hometown2` varchar(100) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL COMMENT '家乡',
  `loca` varchar(20) DEFAULT NULL COMMENT '范围1',
  `addtress` varchar(100) DEFAULT NULL COMMENT '现住址',
  `height2` double DEFAULT NULL,
  `height` double(5,2) DEFAULT '0.00' COMMENT '身高',
  `weight2` double(5,2) DEFAULT NULL,
  `weight` double(5,2) DEFAULT NULL COMMENT '体重',
  `marriage2` varchar(1) DEFAULT NULL,
  `marriage` varchar(1) DEFAULT '0' COMMENT '0：未婚   1:离异   2：丧偶',
  `children` varchar(2) DEFAULT NULL COMMENT '子女人数',
  `degree2` varchar(2) DEFAULT NULL,
  `degree` varchar(2) DEFAULT NULL COMMENT '学历  -  关联字典表',
  `house_status2` varchar(2) DEFAULT NULL,
  `house_status` varchar(2) DEFAULT NULL COMMENT '住房状态-关联字典表',
  `industry` varchar(20) DEFAULT NULL COMMENT '行业',
  `income2` varchar(2) DEFAULT NULL,
  `income` varchar(2) DEFAULT NULL COMMENT '收入 -  关联字典表',
  `qq` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `referee` varchar(10) DEFAULT NULL COMMENT '推荐人 ',
  `introduction` varchar(150) DEFAULT NULL COMMENT '自我介绍',
  `declaration` varchar(50) DEFAULT NULL COMMENT '爱情宣言',
  `ask` varchar(100) DEFAULT NULL COMMENT '择偶要求',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `flag` varchar(1000) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 01/16/2019 20:17:14 PM
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
  `head_image` varchar(50) DEFAULT NULL COMMENT '头像表',
  `ch_name` varchar(30) DEFAULT NULL COMMENT '中文名',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(1) DEFAULT '1' COMMENT '性别  1：男  0：女',
  `birthday2` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hometown2` varchar(100) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL COMMENT '家乡',
  `loca` varchar(100) DEFAULT NULL COMMENT '范围1',
  `addtress` varchar(100) DEFAULT NULL COMMENT '现住址',
  `height` double(5,2) DEFAULT '0.00' COMMENT '身高',
  `weight2` double(5,2) DEFAULT NULL,
  `weight` double(5,2) DEFAULT NULL COMMENT '体重',
  `marriage2` varchar(1) DEFAULT NULL,
  `marriage` varchar(1) DEFAULT '0' COMMENT '0：未婚   1:离异   2：丧偶',
  `children` varchar(2) DEFAULT NULL COMMENT '子女人数',
  `degree2` varchar(2) DEFAULT NULL,
  `degree` varchar(2) DEFAULT NULL COMMENT '学历  -  关联字典表',
  `house_status2` varchar(2) DEFAULT NULL COMMENT '择偶要求-住房状态-字典表',
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
  `economic` varchar(100) DEFAULT NULL COMMENT '择偶要求 经济能力-税前月收入',
  `looks` varchar(50) DEFAULT NULL COMMENT '择偶要求 外貌',
  `disposition` varchar(50) DEFAULT NULL COMMENT '本人 性格',
  `life_role` varchar(50) DEFAULT NULL COMMENT '择偶要求 生活角色',
  `life_type` varchar(50) DEFAULT NULL COMMENT '择偶要求 对象类型',
  `non_type` varchar(50) DEFAULT NULL COMMENT '择偶类型  不接收类型',
  `other` varchar(50) DEFAULT NULL COMMENT '择偶类型  其他',
  `car_status` varchar(2) DEFAULT '0' COMMENT '车状态 ， 字典表',
  `car_status2` varchar(2) DEFAULT NULL COMMENT '择偶要求    用车状态2',
  `disposition2` varchar(50) DEFAULT NULL COMMENT '择偶要求-性格',
  `wx` varchar(30) DEFAULT NULL COMMENT '微信号',
  `hobby` varchar(3) DEFAULT NULL COMMENT '爱好，字典表',
  `hobby2` varchar(3) DEFAULT NULL,
  `weekday` varchar(2) DEFAULT NULL COMMENT '工作日，字典',
  `weekday2` varchar(2) DEFAULT NULL COMMENT '择偶条件 工作日',
  `travel` varchar(2) DEFAULT NULL COMMENT '工作性质 出差情况， 字典表',
  `travel2` varchar(2) DEFAULT NULL COMMENT '择偶条件-工作性质',
  `age1` int(11) DEFAULT NULL COMMENT '择偶年龄1',
  `age2` int(11) DEFAULT NULL COMMENT '择偶要求2',
  `height1` double(5,2) DEFAULT NULL COMMENT '择偶要求-身高',
  `height2` double(5,2) DEFAULT NULL COMMENT '择偶要求-身高2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 11/21/2018 10:27:55 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examine` varchar(1) DEFAULT '0' COMMENT '审核状态-关联字典表  0 默认未审核  9 ： 约会中   ',
  `head_image` int(11) DEFAULT NULL COMMENT '头像表',
  `ch_name` varchar(30) DEFAULT NULL COMMENT '中文名',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(1) DEFAULT '1' COMMENT '性别  1：男  0：女',
  `birthday` date DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL COMMENT '家乡',
  `addtress` varchar(100) DEFAULT NULL COMMENT '现住址',
  `height` double(5,2) DEFAULT '0.00' COMMENT '身高',
  `weight` double(5,2) DEFAULT NULL COMMENT '体重',
  `marriage` varchar(1) DEFAULT '0' COMMENT '0：未婚   1:离异   2：丧偶',
  `children` varchar(2) DEFAULT NULL COMMENT '子女人数',
  `degree` varchar(2) DEFAULT NULL COMMENT '学历  -  关联字典表',
  `house_status` varchar(2) DEFAULT NULL COMMENT '住房状态-关联字典表',
  `industry` varchar(20) DEFAULT NULL COMMENT '行业',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer` VALUES ('1', null, null, '蔡妍', '蔡文姬', '3', '2000-06-06', '', '', null, null, '0', '', '1', '2', '', '', '', '1', '', '', '', '', '', '1', null), ('2', '9', null, '赵云', '赵子龙', '1', '2000-05-30', '1231', '12312', '110.00', '11.00', '0', '0', '2', '2', '教师', '1', '1', '123456789', '', '', '奥术大师大多', '奥术大师多', '', '', null), ('10', '1', null, '123', '123', '1', '2018-11-08', '', '', null, null, '0', '', '1', '1', '', '', '', '', '', '', '', '', '', '', null), ('11', null, null, '孙尚香', '1111', '3', '2018-11-13', '123123', '', null, null, '0', '', '2', '1', '', '', '', '', '', '', '大叔大婶大所', '123123123231', '123 123', '123123', 'hometown:1,addtress:0,height:1,weight:0,hometown:0,hometown:0,addtress:0,height:1'), ('12', null, null, '孙尚香2', '1111', '3', '2018-10-29', '111111', '12312', null, null, '1', '', '2', '2', '', '', '', '', '', '111111', '', '', '', '', 'hometown:1,addtress:0'), ('13', null, null, '张郃', '123', '1', '2018-11-21', '1231', '123', '111.00', null, '2', '', '2', '1', '', '', '', '', '', '', '', '', '', '', 'hometown:1,addtress:1,height:0,weight:1,marriage:1,children:1,degree:1,houseStatus:0,industry:1,income:1,qq:1,telephone:1,email:1,referee:1');
COMMIT;

-- ----------------------------
--  Table structure for `t_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col` varchar(20) DEFAULT NULL COMMENT '字段名-表名',
  `name` varchar(20) DEFAULT NULL COMMENT '字段名-中文',
  `code` varchar(5) DEFAULT NULL COMMENT '值',
  `describ` varchar(20) DEFAULT NULL COMMENT '描述',
  `flag` varchar(2) DEFAULT '1' COMMENT '1:可用 0 ：不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_dictionary`
-- ----------------------------
BEGIN;
INSERT INTO `t_dictionary` VALUES ('1', 'sex', '性别', '1', '男', '1'), ('2', 'sex', '性别', '3', '女', '1'), ('3', 'sex', '性别', '2', 'gay', '1'), ('4', 'marriage', '婚姻状况', '0', '未婚', '1'), ('5', 'marriage', '婚姻状况', '1', '离异', '1'), ('6', 'marriage', '婚姻状况', '2', '丧偶', '1'), ('9', 'examine', '审核状态', '1', '已审核', '1'), ('10', 'location', '地区', '1', '市南区', '1'), ('11', 'location', '地区', '2', '市北区', '1'), ('12', 'location', '地区', '3', '崂山区', '1'), ('13', 'location', '地区', '4', '城阳区', '1'), ('14', 'remindType', '提醒类型', '1', '定时提醒', '1'), ('15', 'remindType', '提醒类型', '2', '提前提醒', '1'), ('16', 'flag', '积分是否冻结', '1', '有效', '1'), ('17', 'flag', '积分是否冻结', '0', '冻结', '1'), ('18', 'inviteStates', '约会状态', '1', '已发出邀请', '1'), ('19', 'examine', '审核状态', '2', '冻结', '1'), ('20', 'examine', '审核状态', '3', '黑名单', '1'), ('21', 'degree', '学历', '1', '本科', '1'), ('22', 'degree', '学历', '2', '研究生', '1'), ('23', 'houseStatus', '住房状态', '1', '租房', '1'), ('24', 'houseStatus', '住房状态', '2', '自有', '1'), ('25', 'inviteStates', '邀约状态', '2', '接收邀请', '1'), ('26', 'inviteStates', '邀约状态', '3', '拒绝', '1'), ('27', 'examine', '审核状态', '0', '待审核', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateing_id` int(11) DEFAULT NULL COMMENT '约会id',
  `from_id` int(11) DEFAULT NULL COMMENT '评价人id',
  `to_id` int(11) DEFAULT NULL COMMENT '被评价人id',
  `evaluate_msg` varchar(100) DEFAULT NULL COMMENT '评价内容',
  `evaluate_ids` varchar(50) DEFAULT NULL COMMENT '评价标签列表',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_evaluate`
-- ----------------------------
BEGIN;
INSERT INTO `t_evaluate` VALUES ('1', '1', '1', '2', '123', null, null), ('2', '1', '2', '1', '1321', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_examine`
-- ----------------------------
DROP TABLE IF EXISTS `t_examine`;
CREATE TABLE `t_examine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL COMMENT '客户id',
  `reason` varchar(255) DEFAULT NULL,
  `through_time` datetime DEFAULT NULL COMMENT '通过时间',
  `examine_user` int(11) DEFAULT NULL COMMENT '审核人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_invite`
-- ----------------------------
DROP TABLE IF EXISTS `t_invite`;
CREATE TABLE `t_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL COMMENT '邀请人id',
  `join_id` int(11) DEFAULT NULL COMMENT '受邀人id',
  `point_id` int(11) DEFAULT NULL COMMENT '约会地点id',
  `invite_date` datetime DEFAULT NULL COMMENT '约会时间',
  `invite_states` varchar(1) DEFAULT NULL COMMENT '约会状态-关联字典表 1邀请 2 同意 3 拒绝 4 邀请方发出时间地点 5应邀确认 6 邀约结束 7 A评价  8 B评价  9 取消 0 爽约',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_invite`
-- ----------------------------
BEGIN;
INSERT INTO `t_invite` VALUES ('1', '1', '2', '1', '2018-10-09 13:30:00', '1', '1'), ('2', '1', '10', null, '2018-11-08 16:41:57', '3', null), ('3', '1', '10', null, '2018-11-08 16:45:15', '3', null), ('4', '10', '1', null, '2018-11-08 16:58:50', '3', null), ('5', '1', '10', null, '2018-11-08 18:46:49', '3', null), ('6', '1', '10', null, '2018-11-08 18:50:04', '3', null), ('7', '1', '10', null, '2018-11-08 18:53:26', '1', null), ('8', '19', null, null, '2018-11-10 15:41:00', '1', '周六,太原'), ('9', '2', '1', null, '2018-11-10 15:50:59', '2', '周六,太原');
COMMIT;

-- ----------------------------
--  Table structure for `t_location`
-- ----------------------------
DROP TABLE IF EXISTS `t_location`;
CREATE TABLE `t_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_name` varchar(30) DEFAULT NULL COMMENT '地点名称',
  `location` varchar(10) DEFAULT NULL COMMENT '区域-关联字典表',
  `address` varchar(100) DEFAULT NULL COMMENT '具体地址',
  `manager` varchar(10) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `work_date` varchar(30) DEFAULT NULL COMMENT '工作日',
  `work_time` varchar(30) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_location`
-- ----------------------------
BEGIN;
INSERT INTO `t_location` VALUES ('1', '太原', '1', '1', '1', '1', '1', '1', '1'), ('2', '111', '2', '123', '123', '123', '123', null, '123');
COMMIT;

-- ----------------------------
--  Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL COMMENT '发送用户id',
  `to_id` int(11) DEFAULT NULL COMMENT '接收用户id',
  `msg` varchar(100) DEFAULT NULL,
  `msg_date` datetime DEFAULT NULL COMMENT '留言时间',
  `follow_id` int(11) DEFAULT NULL COMMENT '回复的消息id',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_message`
-- ----------------------------
BEGIN;
INSERT INTO `t_message` VALUES ('1', '1', '2', '1111', '2018-11-29 23:43:44', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_point_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_point_detail`;
CREATE TABLE `t_point_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) DEFAULT NULL COMMENT '当前总积分',
  `point` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `point_date` datetime DEFAULT NULL COMMENT '添加时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_point_detail`
-- ----------------------------
BEGIN;
INSERT INTO `t_point_detail` VALUES ('1', '100', '100', '1', '注册成功', '2018-10-17 16:00:11', null), ('2', '101', '1', '1', '签到', '2018-10-10 16:28:20', null), ('3', '105', '5', '1', '转发推荐', '2018-10-25 16:28:25', null), ('4', '106', '1', '1', '评价得分', '2018-10-08 16:28:28', null), ('5', '10000', '10000', '2', '首次充值', null, null), ('6', '0', '-10000', '2', '约会爽约', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_points`
-- ----------------------------
DROP TABLE IF EXISTS `t_points`;
CREATE TABLE `t_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL COMMENT '客户id',
  `point` int(11) DEFAULT NULL COMMENT '积分',
  `flag` varchar(1) DEFAULT '1' COMMENT '积分状态- 1：有效 0 ：冻结 ',
  `wave_point` int(11) DEFAULT NULL COMMENT '积分波动',
  `wave_reason` varchar(2) DEFAULT NULL COMMENT '积分波动原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_points`
-- ----------------------------
BEGIN;
INSERT INTO `t_points` VALUES ('1', '1', '107', '1', null, null), ('2', '2', '0', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_remind`
-- ----------------------------
DROP TABLE IF EXISTS `t_remind`;
CREATE TABLE `t_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '提醒名称',
  `remind_time` varchar(30) DEFAULT NULL COMMENT '提醒时间（约会前多久/固定时间提醒）',
  `remind` varchar(100) DEFAULT NULL COMMENT '提醒内容',
  `remind_type` varchar(1) DEFAULT NULL COMMENT '提醒类型-关联字典表',
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_remind`
-- ----------------------------
BEGIN;
INSERT INTO `t_remind` VALUES ('1', '穿着提醒', '10', '注意穿着得体，干净简洁', '1', ''), ('2', '时间提醒', '10', '马上就要约会啦，不要误了时间', '2', '');
COMMIT;

-- ----------------------------
--  Table structure for `t_sign`
-- ----------------------------
DROP TABLE IF EXISTS `t_sign`;
CREATE TABLE `t_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '签到id',
  `invite_id` int(11) DEFAULT NULL COMMENT '邀约id',
  `sign_flag` varchar(1) DEFAULT NULL COMMENT '签到标志-关联字典表',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(20) DEFAULT NULL COMMENT '客户账号 存储公众号openId',
  `pwd` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', '123456', 'admin', '1', '1'), ('2', 'wyj1', '123456', '王友君1', '1', '10'), ('19', 'zy', '123456', '赵云', '2', '2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

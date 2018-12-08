/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : ring

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2018-12-08 13:59:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_act`
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_act
-- ----------------------------
INSERT INTO `t_act` VALUES ('10', '41', '哈哈', '宁夏路', '宁夏路', '1', '1', '', null, null, '1', '2018-12-13 18:00:00', '2018-12-27 22:00:00', null, '1', '付费');

-- ----------------------------
-- Table structure for `t_act_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_act_detail`;
CREATE TABLE `t_act_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `detail_state` varchar(1) DEFAULT NULL COMMENT '0取消申请 1.申请 2.同意 3.缴费 4退出 5结束 6未参加 7拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_act_detail
-- ----------------------------
INSERT INTO `t_act_detail` VALUES ('17', '10', '39', '1');
INSERT INTO `t_act_detail` VALUES ('18', '10', '43', '1');
INSERT INTO `t_act_detail` VALUES ('19', '10', '44', '1');

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `discrib` varchar(50) DEFAULT NULL,
  `editorValue` varchar(1000) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `article_img` varchar(50) DEFAULT NULL,
  `article_state` varchar(2) DEFAULT NULL,
  `article_date` datetime DEFAULT NULL,
  `article_type` varchar(2) DEFAULT NULL,
  `article_tag` varchar(100) DEFAULT NULL,
  `article_read` int(7) DEFAULT NULL,
  `article_transmit` int(7) DEFAULT NULL,
  `article_mark` int(7) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('4', '18', '是个好', '少废话', '<p><img src=\"/upload/1543515207088005004.jpg\" title=\"1543515207088005004.jpg\" alt=\"Screenshot_20181128-042256.jpg\"/></p>', '友君', '1543514830104044558.jpg', '1', '2018-11-30 02:13:00', null, '', null, null, null, '都关好');
INSERT INTO `t_article` VALUES ('5', '11', '文章1130', '1130新文章', '<p><img src=\"/ring/upload/1543541242211015894.jpg\" title=\"1543541242211015894.jpg\" alt=\"eat_08.jpg\"/></p>', '1111', '1543541242211015894.jpg', '1', '2018-11-30 09:27:00', '4', '1111,', null, null, null, '12312321');
INSERT INTO `t_article` VALUES ('6', '11', '测试文章1129', '测试文章简介', '<p><img src=\"/ring/upload/1543541957899012631.jpg\" title=\"1543541957899012631.jpg\" alt=\"eat_04.jpg\"/></p>', '1111', '1543541957899012631.jpg', '1', '2018-11-30 09:40:00', '3', '运动,', null, null, null, '1111');

-- ----------------------------
-- Table structure for `t_customer`
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
  `birthday2` varchar(30) DEFAULT NULL,
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
  `economic` varchar(100) DEFAULT NULL COMMENT '择偶要求 经济能力',
  `looks` varchar(50) DEFAULT NULL COMMENT '择偶要求 外貌',
  `disposition` varchar(50) DEFAULT NULL COMMENT '择偶要求 性格',
  `life_role` varchar(50) DEFAULT NULL COMMENT '择偶要求 生活角色',
  `life_type` varchar(50) DEFAULT NULL COMMENT '择偶要求 对象类型',
  `non_type` varchar(50) DEFAULT NULL COMMENT '择偶类型  不接收类型',
  `other` varchar(50) DEFAULT NULL COMMENT '择偶类型  其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('40', 'oD4sW58DIXiS592bFF6qe-16TteE', '1', null, '杨海霞', '呆小虾', '0', null, '1990-08-06', null, '青岛,山东,青岛市,四方区', null, '1', null, '182.00', null, '70.00', null, '0', '0', null, '4', null, '1', null, null, '6', '403316279', '15265210813', 'Channelyhx@126.com', '测试', '我是小虾你们好', '寻找有缘人', null, '你好你好', null, null, '有房有车 月薪上万', '185', '55', null, null, null, null);
INSERT INTO `t_customer` VALUES ('41', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '1', null, '孙磊', 'rock', '0', null, '1980-07-10', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '110.00', null, '2', '0', null, '1', null, '7', null, null, '1', '555156', '15966937828', '', '楼外', '你问问', '安利', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('42', 'oD4sW50lLbsCrdl8KCuf1os0g_N8', '1', null, '李小辉', '蛇口岛', '1', null, '1989-03-03', null, '山东省泰安市东平县,山东,青岛市,四方区', null, '2', null, '172.00', null, '70.00', null, '0', '0', null, '4', null, '3', null, null, '4', '', '15588979027', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('43', 'oD4sW54YwspZ9i64zTmHMe4pxqzM', '0', null, '更更', '更更', '0', null, '2018-12-04', null, '', null, '1', null, null, null, null, null, '0', '0', null, '1', null, '1', null, null, '1', '', '00000000', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('44', 'oD4sW5zV0B2aH9mt5IEcG3KOtehQ', '0', null, '张三', '思睿', '0', null, '1980-07-10', null, '青岛,山东,青岛市,市南区', null, '1', null, '166.00', null, '55.00', null, '0', '0', null, '1', null, '1', null, null, '1', '', '15966937828', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('46', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '1', null, '王友君', '四七', '1', null, '2018-12-04', null, '', null, '1', null, null, null, null, null, '0', '0', null, '0', null, '1', null, null, '1', '', '15012345678', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('49', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('50', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('51', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('52', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('53', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('54', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('55', '', '0', null, '李四', '福', '1', null, '1989-02-01', null, '青岛,山东,青岛市,市南区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', null, null, '1', '', '15020060210', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('56', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('57', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('58', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('59', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('60', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('61', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);
INSERT INTO `t_customer` VALUES ('62', '', '0', null, '李四', '富二', '1', null, '1989-01-01', null, '青岛,山东,青岛市,市辖区', null, '1', null, '180.00', null, '80.00', null, '0', '0', null, '5', null, '1', null, null, '1', '42162218', '1502006021', '', '', '', '', null, '', null, null, '', '', '', null, null, null, null);

-- ----------------------------
-- Table structure for `t_dictionary`
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------
INSERT INTO `t_dictionary` VALUES ('1', 'sex', '性别', '1', '男', '1');
INSERT INTO `t_dictionary` VALUES ('2', 'sex', '性别', '0', '女', '1');
INSERT INTO `t_dictionary` VALUES ('4', 'marriage', '婚姻状况', '0', '未婚', '1');
INSERT INTO `t_dictionary` VALUES ('5', 'marriage', '婚姻状况', '1', '离异', '1');
INSERT INTO `t_dictionary` VALUES ('6', 'marriage', '婚姻状况', '2', '丧偶', '1');
INSERT INTO `t_dictionary` VALUES ('9', 'examine', '审核状态', '1', '已审核', '1');
INSERT INTO `t_dictionary` VALUES ('10', 'location', '地区', '1', '市南区', '1');
INSERT INTO `t_dictionary` VALUES ('11', 'location', '地区', '2', '市北区', '1');
INSERT INTO `t_dictionary` VALUES ('12', 'location', '地区', '3', '崂山区', '1');
INSERT INTO `t_dictionary` VALUES ('13', 'location', '地区', '4', '城阳区', '1');
INSERT INTO `t_dictionary` VALUES ('14', 'remindType', '提醒类型', '1', '定时提醒', '1');
INSERT INTO `t_dictionary` VALUES ('15', 'remindType', '提醒类型', '2', '提前提醒', '1');
INSERT INTO `t_dictionary` VALUES ('16', 'flag', '积分是否冻结', '1', '有效', '1');
INSERT INTO `t_dictionary` VALUES ('17', 'flag', '积分是否冻结', '0', '冻结', '1');
INSERT INTO `t_dictionary` VALUES ('18', 'inviteStates', '约会状态', '1', '已发出邀请', '1');
INSERT INTO `t_dictionary` VALUES ('19', 'examine', '审核状态', '2', '冻结', '1');
INSERT INTO `t_dictionary` VALUES ('20', 'examine', '审核状态', '3', '黑名单', '1');
INSERT INTO `t_dictionary` VALUES ('21', 'degree', '学历', '1', '本科', '1');
INSERT INTO `t_dictionary` VALUES ('22', 'degree', '学历', '2', '研究生', '1');
INSERT INTO `t_dictionary` VALUES ('23', 'houseStatus', '住房状态', '1', '租房', '1');
INSERT INTO `t_dictionary` VALUES ('24', 'houseStatus', '住房状态', '2', '自有', '1');
INSERT INTO `t_dictionary` VALUES ('25', 'inviteStates', '邀约状态', '2', '接收邀请', '1');
INSERT INTO `t_dictionary` VALUES ('26', 'inviteStates', '邀约状态', '3', '拒绝', '1');
INSERT INTO `t_dictionary` VALUES ('27', 'examine', '审核状态', '0', '待审核', '1');
INSERT INTO `t_dictionary` VALUES ('28', 'children', '子女人数', '0', '无', '1');
INSERT INTO `t_dictionary` VALUES ('29', 'children', '子女人数', '1', '1人', '1');
INSERT INTO `t_dictionary` VALUES ('30', 'children', '子女人数', '2', '2人', '1');
INSERT INTO `t_dictionary` VALUES ('31', 'children', '子女人数', '3', '3人', '1');
INSERT INTO `t_dictionary` VALUES ('32', 'degree', '学历', '0', '初中', '1');
INSERT INTO `t_dictionary` VALUES ('33', 'degree', '学历', '2', '高中/中专', '1');
INSERT INTO `t_dictionary` VALUES ('34', 'degree', '学历', '3', '大专', '1');
INSERT INTO `t_dictionary` VALUES ('35', 'degree', '学历', '4', '本科', '1');
INSERT INTO `t_dictionary` VALUES ('36', 'degree', '学历', '5', '双学士', '1');
INSERT INTO `t_dictionary` VALUES ('37', 'degree', '学历', '6', '硕士', '1');
INSERT INTO `t_dictionary` VALUES ('38', 'degree', '学历', '7', '双硕士', '1');
INSERT INTO `t_dictionary` VALUES ('39', 'degree', '学历', '8', '博士及以上', '1');
INSERT INTO `t_dictionary` VALUES ('40', 'houseStatus', '住房状态', '1', '和家人同住', '1');
INSERT INTO `t_dictionary` VALUES ('41', 'houseStatus', '住房状态', '2', '购房无按揭', '1');
INSERT INTO `t_dictionary` VALUES ('42', 'houseStatus', '住房状态', '3', '购房有按揭', '1');
INSERT INTO `t_dictionary` VALUES ('43', 'houseStatus', '住房状态', '4', '租房', '1');
INSERT INTO `t_dictionary` VALUES ('44', 'houseStatus', '住房状态', '5', '单位宿舍', '1');
INSERT INTO `t_dictionary` VALUES ('45', 'houseStatus', '住房状态', '6', '打算婚后购房', '1');
INSERT INTO `t_dictionary` VALUES ('46', 'houseStatus', '住房状态', '7', '两套以上', '1');
INSERT INTO `t_dictionary` VALUES ('47', 'income', '税前月薪', '1', '1000-3000', '1');
INSERT INTO `t_dictionary` VALUES ('48', 'income', '税前月薪', '2', '3000-5000', '1');
INSERT INTO `t_dictionary` VALUES ('49', 'income', '税前月薪', '3', '5000-8000', '1');
INSERT INTO `t_dictionary` VALUES ('50', 'income', '税前月薪', '4', '8000-10000', '1');
INSERT INTO `t_dictionary` VALUES ('51', 'income', '税前月薪', '5', '10000-15000', '1');
INSERT INTO `t_dictionary` VALUES ('52', 'income', '税前月薪', '6', '15000以上', '1');
INSERT INTO `t_dictionary` VALUES ('53', 'loca', '所在地', '1', '青岛', '1');
INSERT INTO `t_dictionary` VALUES ('54', 'loca', '所在地', '2', '省内', '1');
INSERT INTO `t_dictionary` VALUES ('55', 'loca', '所在地', '3', '国内', '1');
INSERT INTO `t_dictionary` VALUES ('56', 'loca', '所在地', '4', '国外', '1');
INSERT INTO `t_dictionary` VALUES ('57', 'addtress', '活动区域', '1', '市南', '1');
INSERT INTO `t_dictionary` VALUES ('58', 'addtress', '活动区域', '2', '市北', '1');
INSERT INTO `t_dictionary` VALUES ('59', 'addtress', '活动区域', '3', '李沧', '1');
INSERT INTO `t_dictionary` VALUES ('60', 'addtress', '活动区域', '4', '崂山', '1');
INSERT INTO `t_dictionary` VALUES ('61', 'addtress', '活动区域', '5', '即墨', '1');
INSERT INTO `t_dictionary` VALUES ('62', 'addtress', '活动区域', '6', '其他', '1');
INSERT INTO `t_dictionary` VALUES ('63', 'admin', '主办方', '1', '无名指之约', '1');
INSERT INTO `t_dictionary` VALUES ('64', 'admin', '主办方', '2', '个人', '1');
INSERT INTO `t_dictionary` VALUES ('65', 'admin', '主办方', '3', '团体', '1');
INSERT INTO `t_dictionary` VALUES ('66', 'actForm', '活动形式', '1', '沙龙', '1');
INSERT INTO `t_dictionary` VALUES ('67', 'actForm', '活动形式', '2', '户外', '1');
INSERT INTO `t_dictionary` VALUES ('68', 'actForm', '活动形式', '3', '趴体', '1');
INSERT INTO `t_dictionary` VALUES ('70', 'actState', '活动状态', '1', '活动发起', '1');
INSERT INTO `t_dictionary` VALUES ('71', 'actState', '活动状态', '2', '活动预热', '1');
INSERT INTO `t_dictionary` VALUES ('72', 'actState', '活动状态', '3', '活动报名', '1');
INSERT INTO `t_dictionary` VALUES ('73', 'actState', '活动状态', '4', '活动中', '1');
INSERT INTO `t_dictionary` VALUES ('74', 'actState', '活动状态', '5', '已取消', '1');
INSERT INTO `t_dictionary` VALUES ('75', 'actState', '活动状态', '6', '活动结束', '1');
INSERT INTO `t_dictionary` VALUES ('76', 'detailState', '参加状态', '0', '已取消', '0');
INSERT INTO `t_dictionary` VALUES ('77', 'detailState', '参加状态', '1', '已申请', '1');
INSERT INTO `t_dictionary` VALUES ('78', 'detailState', '参加状态', '2', '已同意', '1');
INSERT INTO `t_dictionary` VALUES ('79', 'detailState', '参加状态', '3', '已缴费', '1');
INSERT INTO `t_dictionary` VALUES ('80', 'detailState', '参加状态', '4', '已退出', '1');
INSERT INTO `t_dictionary` VALUES ('81', 'detailState', '参加状态', '5', '已结束', '1');
INSERT INTO `t_dictionary` VALUES ('82', 'detailState', '参加状态', '6', '未参加', '1');
INSERT INTO `t_dictionary` VALUES ('83', 'detailState', '参加状态', '7', '已拒绝', '1');
INSERT INTO `t_dictionary` VALUES ('84', 'compare', '是否系统内描述一致', '1', '严重不符', '1');
INSERT INTO `t_dictionary` VALUES ('85', 'compare', '是否系统内描述一致', '2', '基本不符', '1');
INSERT INTO `t_dictionary` VALUES ('86', 'compare', '是否系统内描述一致', '3', '基本相符', '1');
INSERT INTO `t_dictionary` VALUES ('87', 'compare', '是否系统内描述一致', '4', '与描述一致', '1');
INSERT INTO `t_dictionary` VALUES ('88', 'compare', '是否系统内描述一致', '5', '超出预期', '1');
INSERT INTO `t_dictionary` VALUES ('89', 'next', '是否期待下一次约会', '1', '再也不见', '1');
INSERT INTO `t_dictionary` VALUES ('90', 'next', '是否期待下一次约会', '2', '看情况而定', '1');
INSERT INTO `t_dictionary` VALUES ('91', 'next', '是否期待下一次约会', '3', '对方约我，我会考虑', '1');
INSERT INTO `t_dictionary` VALUES ('92', 'next', '是否期待下一次约会', '4', '对方约我我就去', '1');
INSERT INTO `t_dictionary` VALUES ('93', 'next', '是否期待下一次约会', '5', '主动邀约对方', '1');
INSERT INTO `t_dictionary` VALUES ('94', 'late', '是否迟到', '1', '未迟到', '1');
INSERT INTO `t_dictionary` VALUES ('95', 'late', '是否迟到', '2', '迟到十分钟以内', '1');
INSERT INTO `t_dictionary` VALUES ('96', 'late', '是否迟到', '3', '10分-30分', '1');
INSERT INTO `t_dictionary` VALUES ('97', 'late', '是否迟到', '4', '30分-1小时', '1');
INSERT INTO `t_dictionary` VALUES ('98', 'late', '是否迟到', '5', '一小时以上', '1');
INSERT INTO `t_dictionary` VALUES ('99', 'late', '是否迟到', '6', '未赴约或当天取消', '1');
INSERT INTO `t_dictionary` VALUES ('100', 'talk', '是否健谈', '1', '有吵架，翻脸等', '1');
INSERT INTO `t_dictionary` VALUES ('101', 'talk', '是否健谈', '2', '经常冷场', '1');
INSERT INTO `t_dictionary` VALUES ('102', 'talk', '是否健谈', '3', '偶尔交流', '1');
INSERT INTO `t_dictionary` VALUES ('103', 'talk', '是否健谈', '4', '正常交流', '1');
INSERT INTO `t_dictionary` VALUES ('104', 'talk', '是否健谈', '5', '相谈甚欢', '1');
INSERT INTO `t_dictionary` VALUES ('105', 'examine', '会员状态', '0', '待审核', '1');
INSERT INTO `t_dictionary` VALUES ('106', 'examine', '会员状态', '2', '冻结', '1');
INSERT INTO `t_dictionary` VALUES ('107', 'actState', '活动状态', '0', '待审核', '1');
INSERT INTO `t_dictionary` VALUES ('108', 'articleState', '文章状态', '0', '草稿', '1');
INSERT INTO `t_dictionary` VALUES ('109', 'articleState', '文章状态', '1', '审核中', '1');
INSERT INTO `t_dictionary` VALUES ('110', 'articleState', '文章状态', '2', '美文', '1');
INSERT INTO `t_dictionary` VALUES ('111', 'articleState', '文章状态', '3', '精品', '1');
INSERT INTO `t_dictionary` VALUES ('112', 'articleState', '文章状态', '4', '置顶', '1');
INSERT INTO `t_dictionary` VALUES ('113', 'articleType', '文章类型', '1', '活动回顾', '1');
INSERT INTO `t_dictionary` VALUES ('114', 'articleType', '文章类型', '2', '爱情三十六计', '1');
INSERT INTO `t_dictionary` VALUES ('115', 'articleType', '文章类型', '3', '遇见系列', '1');
INSERT INTO `t_dictionary` VALUES ('116', 'articleType', '文章类型', '4', '毒舌-你为什么是单身', '1');
INSERT INTO `t_dictionary` VALUES ('117', 'payType', '费用类型', '1', 'AA', '1');
INSERT INTO `t_dictionary` VALUES ('118', 'payType', '费用类型', '2', '免费', '1');

-- ----------------------------
-- Table structure for `t_evaluate`
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
  `compare` varchar(10) DEFAULT NULL,
  `late` varchar(10) DEFAULT NULL,
  `talk` varchar(10) DEFAULT NULL,
  `next` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------
INSERT INTO `t_evaluate` VALUES ('11', '51', '44', null, '就解决了', '', null, '3', '2', '2', null);
INSERT INTO `t_evaluate` VALUES ('12', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_examine`
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
-- Records of t_examine
-- ----------------------------

-- ----------------------------
-- Table structure for `t_focus`
-- ----------------------------
DROP TABLE IF EXISTS `t_focus`;
CREATE TABLE `t_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_focus
-- ----------------------------
INSERT INTO `t_focus` VALUES ('14', '40', '39');
INSERT INTO `t_focus` VALUES ('15', '40', '45');

-- ----------------------------
-- Table structure for `t_invite`
-- ----------------------------
DROP TABLE IF EXISTS `t_invite`;
CREATE TABLE `t_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL COMMENT '邀请人id',
  `join_id` int(11) DEFAULT NULL COMMENT '受邀人id',
  `point_id` int(11) DEFAULT NULL COMMENT '约会地点id',
  `invite_date` datetime DEFAULT NULL COMMENT '约会时间',
  `invite_states` varchar(2) DEFAULT NULL COMMENT '约会状态-关联字典表 1邀请 2 同意,选择时间地点 3 拒绝 4 确定约会 5取消  6 申请取消 7 已结束  8 驳回取消  9 取消 0 爽约',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_invite
-- ----------------------------
INSERT INTO `t_invite` VALUES ('47', '38', '39', '1', '2018-12-04 18:22:17', '4', null);
INSERT INTO `t_invite` VALUES ('48', '40', '39', null, '2018-12-04 18:25:54', '1', null);
INSERT INTO `t_invite` VALUES ('49', '41', '42', '2', '2018-12-04 19:53:30', '4', null);
INSERT INTO `t_invite` VALUES ('50', '42', '38', null, '2018-12-04 19:54:13', '1', null);
INSERT INTO `t_invite` VALUES ('51', '44', '42', '2', '2018-12-04 20:03:33', '7', null);
INSERT INTO `t_invite` VALUES ('52', '43', '42', null, '2018-12-04 20:04:37', '1', null);
INSERT INTO `t_invite` VALUES ('53', '41', '42', null, '2018-12-04 20:04:58', '1', null);

-- ----------------------------
-- Table structure for `t_invite_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_invite_detail`;
CREATE TABLE `t_invite_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_id` int(11) DEFAULT NULL,
  `pre_date` varchar(100) DEFAULT NULL COMMENT '预约时间',
  `confirm_date` varchar(30) DEFAULT NULL COMMENT '邀请时间',
  `confirm_time` varchar(10) DEFAULT NULL,
  `confirm_loc` varchar(10) DEFAULT NULL COMMENT '邀请人活动范围',
  `update_times` int(11) DEFAULT '0' COMMENT '修改次数  不能超过2次',
  `update_time_join` int(11) DEFAULT '0',
  `sign_from` varchar(1) DEFAULT NULL COMMENT '0未签到 1签到 2 店家确认签到',
  `sign_join` varchar(1) DEFAULT NULL COMMENT '0未签到 1签到 2 店家确认签到',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_invite_detail
-- ----------------------------
INSERT INTO `t_invite_detail` VALUES ('29', '44', null, null, null, '2', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('30', '45', null, null, null, '1,2', '0', '1', null, null);
INSERT INTO `t_invite_detail` VALUES ('31', '46', null, null, null, '1,2', '0', '1', null, null);
INSERT INTO `t_invite_detail` VALUES ('32', '47', null, null, null, '1,2', '0', '1', null, null);
INSERT INTO `t_invite_detail` VALUES ('33', '48', '2018-12-13 17:00,2018-12-14 14:00,2018-12-14 14:00,', null, null, '1,2', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('34', '49', null, null, null, '2', '0', '0', '1', null);
INSERT INTO `t_invite_detail` VALUES ('35', '50', '2018-12-04 22:00,', null, null, '1,2', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('36', '51', null, null, null, '2', '0', '0', '1', '1');
INSERT INTO `t_invite_detail` VALUES ('37', '53', '2018-12-12 01:00,', null, null, null, '0', '0', null, null);

-- ----------------------------
-- Table structure for `t_location`
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
-- Records of t_location
-- ----------------------------
INSERT INTO `t_location` VALUES ('1', '太原', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `t_location` VALUES ('2', '111', '2', '123', '123', '123', '123', null, '123');

-- ----------------------------
-- Table structure for `t_message`
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('2', '38', null, '123', '2018-12-04 17:43:21', null, null);
INSERT INTO `t_message` VALUES ('3', '43', null, 'ç¬¨å°ç°', '2018-12-04 20:07:03', null, null);
INSERT INTO `t_message` VALUES ('4', '41', null, 'æçå¾®ä¿¡å·ï¼å æ', '2018-12-04 20:07:35', null, null);
INSERT INTO `t_message` VALUES ('5', '41', null, 'å æï¼å æï¼ï¼ï¼ï¼', '2018-12-04 20:21:52', null, null);
INSERT INTO `t_message` VALUES ('6', '40', null, 'ä½ å¥½', '2018-12-06 22:40:05', null, null);

-- ----------------------------
-- Table structure for `t_points`
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
-- Records of t_points
-- ----------------------------
INSERT INTO `t_points` VALUES ('1', '1', '107', '1', null, null);
INSERT INTO `t_points` VALUES ('2', '2', '0', '1', null, null);

-- ----------------------------
-- Table structure for `t_point_detail`
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
-- Records of t_point_detail
-- ----------------------------
INSERT INTO `t_point_detail` VALUES ('1', '100', '100', '1', '注册成功', '2018-10-17 16:00:11', null);
INSERT INTO `t_point_detail` VALUES ('2', '101', '1', '1', '签到', '2018-10-10 16:28:20', null);
INSERT INTO `t_point_detail` VALUES ('3', '105', '5', '1', '转发推荐', '2018-10-25 16:28:25', null);
INSERT INTO `t_point_detail` VALUES ('4', '106', '1', '1', '评价得分', '2018-10-08 16:28:28', null);
INSERT INTO `t_point_detail` VALUES ('5', '10000', '10000', '2', '首次充值', null, null);
INSERT INTO `t_point_detail` VALUES ('6', '0', '-10000', '2', '约会爽约', null, null);

-- ----------------------------
-- Table structure for `t_remind`
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
-- Records of t_remind
-- ----------------------------
INSERT INTO `t_remind` VALUES ('1', '穿着提醒', '10', '注意穿着得体，干净简洁', '1', '');
INSERT INTO `t_remind` VALUES ('2', '时间提醒', '10', '马上就要约会啦，不要误了时间', '2', '');

-- ----------------------------
-- Table structure for `t_sign`
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
-- Records of t_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sign_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_sign_type`;
CREATE TABLE `t_sign_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sign_type
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(50) DEFAULT NULL COMMENT '客户账号 存储公众号openId',
  `pwd` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123', 'admin', '1', '1');
INSERT INTO `t_user` VALUES ('51', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '王', '11', '38');
INSERT INTO `t_user` VALUES ('53', 'oD4sW58DIXiS592bFF6qe-16TteE', '123', '杨海霞', '2', '40');
INSERT INTO `t_user` VALUES ('55', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '123', '孙磊', '2', '41');
INSERT INTO `t_user` VALUES ('56', 'oD4sW50lLbsCrdl8KCuf1os0g_N8', '123', '李小辉', '2', '42');
INSERT INTO `t_user` VALUES ('57', 'oD4sW54YwspZ9i64zTmHMe4pxqzM', '123', '更更', '2', '43');
INSERT INTO `t_user` VALUES ('58', 'oD4sW5zV0B2aH9mt5IEcG3KOtehQ', '123', '张三', '2', '44');
INSERT INTO `t_user` VALUES ('59', 'oD4sW50lLbsCrdl8KCuf1os0g_N8', '123', null, '2', '42');
INSERT INTO `t_user` VALUES ('62', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '王友君', '1', '46');

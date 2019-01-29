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

 Date: 01/29/2019 22:59:06 PM
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
  `act_state` varchar(1) DEFAULT NULL COMMENT '0.待审核 1.已审核，准备 2.一开始 3.已结束',
  `act_date` datetime DEFAULT NULL,
  `act_end` datetime DEFAULT NULL COMMENT '结束时间',
  `acount` int(11) DEFAULT NULL COMMENT '人数上限',
  `pay_type` varchar(1) DEFAULT NULL COMMENT '付费方式',
  `pay_range` varchar(20) DEFAULT NULL COMMENT '付费范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_act`
-- ----------------------------
BEGIN;
INSERT INTO `t_act` VALUES ('10', '41', '哈哈', '宁夏路', '宁夏路', '1', '1', '', null, null, '2', '2018-12-13 18:00:00', '2018-12-27 22:00:00', '1', '1', '付费'), ('11', '46', '测试活动', '大', '打打', '1', '1', '', '<p>21312312<img src=\"/ring/upload/1544839293586044468.gif\" title=\"1544839293586044468.gif\" alt=\"035.gif\"/></p>', null, '2', '2018-12-17 09:00:00', '2018-12-17 10:00:00', '5', '1', '100以内');
COMMIT;

-- ----------------------------
--  Table structure for `t_act_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_act_detail`;
CREATE TABLE `t_act_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `detail_state` varchar(1) DEFAULT NULL COMMENT '0取消申请 1.申请 2.同意 3.缴费 4退出 5结束 6未参加 7拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_act_detail`
-- ----------------------------
BEGIN;
INSERT INTO `t_act_detail` VALUES ('17', '10', '39', '1'), ('18', '10', '43', '1'), ('19', '10', '44', '1'), ('26', null, '46', '2'), ('27', null, '46', '2'), ('28', '10', '46', '6'), ('29', '10', '46', '6'), ('30', '10', '46', '2');
COMMIT;

-- ----------------------------
--  Table structure for `t_article`
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_article`
-- ----------------------------
BEGIN;
INSERT INTO `t_article` VALUES ('5', '11', '文章1130', '1130新文章', '<p><img src=\"/ring/upload/1543541242211015894.jpg\" title=\"1543541242211015894.jpg\" alt=\"eat_08.jpg\"/></p>', '1111', '1543541242211015894.jpg', '0', '2018-11-30 09:27:00', '4', '1111,', null, null, null, '111'), ('6', '11', '测试文章1129', '测试文章简介', '<p><img src=\"/ring/upload/1543541957899012631.jpg\" title=\"1543541957899012631.jpg\" alt=\"eat_04.jpg\"/></p>', '1111', '1543541957899012631.jpg', '0', '2018-11-30 09:40:00', '3', '运动,', null, null, null, '11'), ('7', null, '测试文章12151111', '简介', '<p>1231231231232123<img src=\"/ring/upload/1544867050461053337.gif\" title=\"1544867050461053337.gif\" alt=\"061.gif\"/></p>', null, '1544867050461053337.gif', '2', '2018-12-15 17:32:00', '4', '阿斯达,', null, null, null, 'q\'q\'q\'q');
COMMIT;

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
  `hobby` varchar(30) DEFAULT NULL COMMENT '爱好，字典表',
  `hobby2` varchar(30) DEFAULT NULL,
  `weekday` varchar(2) DEFAULT NULL COMMENT '工作日，字典',
  `weekday2` varchar(2) DEFAULT NULL COMMENT '择偶条件 工作日',
  `travel` varchar(2) DEFAULT NULL COMMENT '工作性质 出差情况， 字典表',
  `travel2` varchar(2) DEFAULT NULL COMMENT '择偶条件-工作性质',
  `age1` int(11) DEFAULT NULL COMMENT '择偶年龄1',
  `age2` int(11) DEFAULT NULL COMMENT '择偶要求2',
  `height1` double(5,2) DEFAULT NULL COMMENT '择偶要求-身高',
  `height2` double(5,2) DEFAULT NULL COMMENT '择偶要求-身高2',
  `front_img` varchar(100) DEFAULT NULL,
  `back_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_customer`
-- ----------------------------
BEGIN;
INSERT INTO `t_customer` VALUES ('70', '', '1', null, '孙尚香', '孙尚香', '0', '', '1980-01-29', null, '山东,青岛市,市辖区', '市南,市北,崂山', '山东,青岛市,市辖区', '180.00', null, '80.00', null, '0', '0', null, '0', '3', '1', '1', null, '1', null, '13112312312', '123@163.com', '', '地方的小黄瓜检查结果吃个饭成就感和是hcfcjgjg', '九号公馆郭富城工程竣工从小就GV客户GV就郭富城GV', null, '', null, null, '2', null, '温柔,过日子,阳光', '1', '1', 'asdasd', null, '1', '2', '过日子,阳光', '', '逛吃,运动', '逛吃,运动', '2', '3', '2', '4', '1989', '1995', '160.00', '175.00', null, null), ('71', '', '1', null, '赵云', '赵子龙', '1', null, '1998-12-27', null, '山东,青岛市,市辖区', '市北,崂山,李沧', '山东,青岛市,市辖区', '180.00', null, '80.00', null, '0', '0', null, '0', '2', '1', '1', null, '1', null, '13123123123', '', '', '地方的小黄瓜检查结果吃个饭成就感和是hcfcjgjg', '九号公馆郭富城工程竣工从小就GV客户GV就郭富城GV', null, '', null, null, '3', null, null, '2', '2', 'asdasd ', null, '1', '1', '过日子,阳光', '', '唱歌,旅游', '逛吃,运动', '1', '2', '3', '4', '1980', '1990', '170.00', '180.00', null, null), ('72', '', '1', null, '蔡妍', '蔡文姬', '0', null, '1988-12-26', null, '山东,青岛市,市辖区', '市南,市北', null, '178.00', null, '78.00', null, '0', '0', null, '0', null, '1', '1', null, '1', null, '13212312312', '', '', '', '', null, '', null, null, null, null, '温柔,过日子,阳光', null, null, null, null, '1', null, null, '', '唱歌,逛吃,运动', null, null, null, null, null, null, null, null, null, null, null), ('76', '', '1', null, '刘备', '刘皇叔', '1', null, '1988-12-25', null, '天津,市辖区,和平区', '市南,市北,城阳', null, '180.00', null, '80.00', null, '0', '0', null, '0', null, '1', '1', null, '1', null, '13412312312', 'lb@163.com', '', '', '', null, '', null, null, null, null, '过日子,阳光', null, null, null, null, '1', null, null, 'liubei', '唱歌,旅游', null, null, null, null, null, null, null, null, null, '201901242037824_DSC00597.JPG', '201901242037862_DSC00598.JPG');
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
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_dictionary`
-- ----------------------------
BEGIN;
INSERT INTO `t_dictionary` VALUES ('1', 'sex', '性别', '1', '男', '1'), ('2', 'sex', '性别', '0', '女', '1'), ('4', 'marriage', '婚姻状况', '0', '未婚', '1'), ('5', 'marriage', '婚姻状况', '1', '离异', '1'), ('6', 'marriage', '婚姻状况', '2', '丧偶', '1'), ('9', 'examine', '审核状态', '1', '已审核', '1'), ('10', 'location', '地区', '1', '市南区', '1'), ('11', 'location', '地区', '2', '市北区', '1'), ('12', 'location', '地区', '3', '崂山区', '1'), ('13', 'location', '地区', '4', '城阳区', '1'), ('14', 'remindType', '提醒类型', '1', '定时提醒', '1'), ('15', 'remindType', '提醒类型', '2', '提前提醒', '1'), ('16', 'flag', '积分是否冻结', '1', '有效', '1'), ('17', 'flag', '积分是否冻结', '0', '冻结', '1'), ('18', 'inviteStates', '约会状态', '1', '已发出邀请', '1'), ('19', 'examine', '审核状态', '2', '冻结', '1'), ('20', 'examine', '审核状态', '3', '黑名单', '1'), ('21', 'degree', '学历', '1', '本科', '1'), ('22', 'degree', '学历', '2', '研究生', '1'), ('23', 'houseStatus', '住房状态', '1', '租房', '1'), ('24', 'houseStatus', '住房状态', '2', '自有', '1'), ('25', 'inviteStates', '邀约状态', '2', '接收邀请', '1'), ('26', 'inviteStates', '邀约状态', '3', '拒绝', '1'), ('27', 'examine', '审核状态', '0', '待审核', '1'), ('28', 'children', '子女人数', '0', '无', '1'), ('29', 'children', '子女人数', '1', '1人', '1'), ('30', 'children', '子女人数', '2', '2人', '1'), ('31', 'children', '子女人数', '3', '3人', '1'), ('32', 'degree', '学历', '0', '初中', '1'), ('33', 'degree', '学历', '2', '高中/中专', '1'), ('34', 'degree', '学历', '3', '大专', '1'), ('35', 'degree', '学历', '4', '本科', '1'), ('36', 'degree', '学历', '5', '双学士', '1'), ('37', 'degree', '学历', '6', '硕士', '1'), ('38', 'degree', '学历', '7', '双硕士', '1'), ('39', 'degree', '学历', '8', '博士及以上', '1'), ('40', 'houseStatus', '住房状态', '1', '和家人同住', '1'), ('41', 'houseStatus', '住房状态', '2', '购房无按揭', '1'), ('42', 'houseStatus', '住房状态', '3', '购房有按揭', '1'), ('43', 'houseStatus', '住房状态', '4', '租房', '1'), ('44', 'houseStatus', '住房状态', '5', '单位宿舍', '1'), ('45', 'houseStatus', '住房状态', '6', '打算婚后购房', '1'), ('46', 'houseStatus', '住房状态', '7', '两套以上', '1'), ('47', 'income', '税前月薪', '1', '1000-3000', '1'), ('48', 'income', '税前月薪', '2', '3000-5000', '1'), ('49', 'income', '税前月薪', '3', '5000-8000', '1'), ('50', 'income', '税前月薪', '4', '8000-10000', '1'), ('51', 'income', '税前月薪', '5', '10000-15000', '1'), ('52', 'income', '税前月薪', '6', '15000以上', '1'), ('53', 'loca', '所在地', '1', '青岛', '1'), ('54', 'loca', '所在地', '2', '省内', '1'), ('55', 'loca', '所在地', '3', '国内', '1'), ('56', 'loca', '所在地', '4', '国外', '1'), ('57', 'addtress', '活动区域', '1', '市南', '1'), ('58', 'addtress', '活动区域', '2', '市北', '1'), ('59', 'addtress', '活动区域', '3', '李沧', '1'), ('60', 'addtress', '活动区域', '4', '崂山', '1'), ('61', 'addtress', '活动区域', '5', '即墨', '1'), ('62', 'addtress', '活动区域', '6', '其他', '1'), ('63', 'admin', '主办方', '1', '无名指之约', '1'), ('64', 'admin', '主办方', '2', '个人', '1'), ('65', 'admin', '主办方', '3', '团体', '1'), ('66', 'actForm', '活动形式', '1', '沙龙', '1'), ('67', 'actForm', '活动形式', '2', '户外', '1'), ('68', 'actForm', '活动形式', '3', '趴体', '1'), ('70', 'actState', '活动状态', '1', '活动发起', '1'), ('71', 'actState', '活动状态', '2', '活动预热', '1'), ('72', 'actState', '活动状态', '3', '活动报名', '1'), ('73', 'actState', '活动状态', '4', '活动中', '1'), ('74', 'actState', '活动状态', '5', '已取消', '1'), ('75', 'actState', '活动状态', '6', '活动结束', '1'), ('76', 'detailState', '参加状态', '0', '已取消', '0'), ('77', 'detailState', '参加状态', '1', '已申请', '1'), ('78', 'detailState', '参加状态', '2', '已同意', '1'), ('79', 'detailState', '参加状态', '3', '已缴费', '1'), ('80', 'detailState', '参加状态', '4', '已退出', '1'), ('81', 'detailState', '参加状态', '5', '已结束', '1'), ('82', 'detailState', '参加状态', '6', '未参加', '1'), ('83', 'detailState', '参加状态', '7', '已拒绝', '1'), ('84', 'compare', '是否系统内描述一致', '1', '严重不符', '1'), ('85', 'compare', '是否系统内描述一致', '2', '基本不符', '1'), ('86', 'compare', '是否系统内描述一致', '3', '基本相符', '1'), ('87', 'compare', '是否系统内描述一致', '4', '与描述一致', '1'), ('88', 'compare', '是否系统内描述一致', '5', '超出预期', '1'), ('89', 'next', '是否期待下一次约会', '1', '再也不见', '1'), ('90', 'next', '是否期待下一次约会', '2', '看情况而定', '1'), ('91', 'next', '是否期待下一次约会', '3', '对方约我，我会考虑', '1'), ('92', 'next', '是否期待下一次约会', '4', '对方约我我就去', '1'), ('93', 'next', '是否期待下一次约会', '5', '主动邀约对方', '1'), ('94', 'late', '是否迟到', '1', '未迟到', '1'), ('95', 'late', '是否迟到', '2', '迟到十分钟以内', '1'), ('96', 'late', '是否迟到', '3', '10分-30分', '1'), ('97', 'late', '是否迟到', '4', '30分-1小时', '1'), ('98', 'late', '是否迟到', '5', '一小时以上', '1'), ('99', 'late', '是否迟到', '6', '未赴约或当天取消', '1'), ('100', 'talk', '是否健谈', '1', '有吵架，翻脸等', '1'), ('101', 'talk', '是否健谈', '2', '经常冷场', '1'), ('102', 'talk', '是否健谈', '3', '偶尔交流', '1'), ('103', 'talk', '是否健谈', '4', '正常交流', '1'), ('104', 'talk', '是否健谈', '5', '相谈甚欢', '1'), ('105', 'examine', '会员状态', '0', '待审核', '1'), ('106', 'examine', '会员状态', '2', '冻结', '1'), ('107', 'actState', '活动状态', '0', '待审核', '1'), ('108', 'articleState', '文章状态', '0', '草稿', '1'), ('109', 'articleState', '文章状态', '1', '审核中', '1'), ('110', 'articleState', '文章状态', '2', '美文', '1'), ('111', 'articleState', '文章状态', '3', '精品', '1'), ('112', 'articleState', '文章状态', '4', '置顶', '1'), ('113', 'articleType', '文章类型', '1', '活动回顾', '1'), ('114', 'articleType', '文章类型', '2', '爱情三十六计', '1'), ('115', 'articleType', '文章类型', '3', '遇见系列', '1'), ('116', 'articleType', '文章类型', '4', '毒舌-你为什么是单身', '1'), ('117', 'payType', '费用类型', '1', 'AA', '1'), ('118', 'payType', '费用类型', '2', '免费', '1'), ('119', 'articleState', '文章状态', '9', '审核不通过', '0'), ('120', 'industry', '行业', '1', 'IT', '1'), ('121', 'carStatus', '用车状态', '1', '无车', '0'), ('122', 'loca', '活动区域', '1', '市南', '1'), ('123', 'custLoca', '会员活动区域', '1', '市南', '1'), ('124', 'custLoca', '用户活动区域', '2', '市北', '1'), ('125', 'custLoca', '用户活动区域', '3', '崂山', '1'), ('126', 'custLoca', '用户活动区域', '4', '李沧', '1'), ('127', 'custLoca', '用户互动区域', '5', '城阳', '1'), ('128', 'custLoca', '用户活动区域', '6', '其他', '1'), ('129', 'disposition', '性格', '1', '温柔', '1'), ('130', 'disposition', '性格', '2', '阳光', '1'), ('131', 'disposition', '性格', '3', '开朗', '1'), ('132', 'disposition', '性格', '4', '可爱', '1'), ('133', 'disposition', '性格', '5', '外冷内热', '1'), ('134', 'hobby', '兴趣爱好', '1', '运动', '1'), ('135', 'hobby', '兴趣爱好', '2', '读书', '1'), ('136', 'hobby', '兴趣爱好', '3', '电影', '1'), ('137', 'hobby', '兴趣爱好', '4', '旅行', '1'), ('138', 'hobby', '兴趣爱好', '5', '摄影', '1'), ('139', 'hobby', '兴趣爱好', '6', '吃货', '1'), ('140', 'hobby', '兴趣爱好', '7', '逛街', '1'), ('141', 'weekday', '工作时间', '1', '周一至周五', '0'), ('142', 'weekday', '工作时间', '2', '周一至周六', '1'), ('143', 'weekday', '工作时间', '3', '大小周（一周单休一周双休）', '0'), ('144', 'weekday', '工作时间', '4', '调班制（工作几天休几天）', '0'), ('145', 'travel', '工作性质', '1', '基本不出差', '0'), ('146', 'travel', '工作性质', '2', '偶尔出差', '0'), ('147', 'travel', '工作性质', '3', '经常出差', '0'), ('148', 'travel', '工作性质', '4', '基本不在青岛范围', '0'), ('149', 'economic', '择偶税前月薪', '1', '1000-3000', '1'), ('150', 'economic', '择偶税前月薪', '2', '3000-5000', '1'), ('151', 'economic', '择偶税前月薪', '3', '5000-8000', '1'), ('152', 'economic', '择偶税前月薪', '4', '8000-10000', '1'), ('153', 'economic', '择偶税前月薪', '5', '10000-15000', '1'), ('154', 'economic', '择偶税前月薪', '6', '15000以上', '1'), ('156', 'houseStatus2', '择偶住房状态', '1', '租房', '1'), ('157', 'houseStatus2', '择偶住房状态', '2', '自有', '1'), ('158', 'houseStatus2', '择偶住房状态', '1', '和家人同住', '1'), ('159', 'houseStatus2', '择偶住房状态', '2', '购房无按揭', '1'), ('160', 'houseStatus2', '择偶住房状态', '3', '购房有按揭', '1'), ('161', 'houseStatus2', '择偶住房状态', '4', '租房', '1'), ('162', 'houseStatus2', '择偶住房状态', '5', '单位宿舍', '1'), ('163', 'houseStatus2', '择偶住房状态', '6', '打算婚后购房', '1'), ('164', 'houseStatus2', '择偶住房状态', '7', '两套以上', '1'), ('171', 'carStatus2', '择偶用车状态', '1', '无车', '0'), ('172', 'disposition2', '择偶性格', '1', '温柔', '1'), ('173', 'disposition2', '择偶性格', '2', '阳光', '1'), ('174', 'disposition2', '择偶性格', '3', '开朗', '1'), ('175', 'disposition2', '择偶性格', '4', '可爱', '1'), ('176', 'disposition2', '择偶性格', '5', '外冷内热', '1'), ('179', 'hobby2', '择偶兴趣爱好', '1', '运动', '1'), ('180', 'hobby2', '择偶兴趣爱好', '2', '读书', '1'), ('181', 'hobby2', '择偶兴趣爱好', '3', '电影', '1'), ('182', 'hobby2', '择偶兴趣爱好', '4', '旅行', '1'), ('183', 'hobby2', '择偶兴趣爱好', '5', '摄影', '1'), ('184', 'hobby2', '择偶兴趣爱好', '6', '吃货', '1'), ('185', 'hobby2', '择偶兴趣爱好', '7', '逛街', '1'), ('186', 'lifeRole', '择偶对方生活中的角色', '1', '角色1', '1'), ('187', 'lifeRole', '择偶对方生活中的角色', '2', '角色2', '1'), ('188', 'lifeType', '期待配偶的类型', '1', '配偶类型1', '1'), ('189', 'lifeType', '期待配偶类型', '2', '配偶类型2', '1'), ('190', 'weekday2', '择偶工作时间', '1', '周一至周五', '0'), ('191', 'weekday2', '择偶工作时间', '2', '周一至周六', '1'), ('192', 'weekday2', '择偶工作时间', '3', '大小周（一周单休一周双休）', '0'), ('193', 'weekday2', '择偶工作时间', '4', '调班制（工作几天休几天）', '0'), ('197', 'travel2', '择偶工作性质', '1', '基本不出差', '0'), ('198', 'travel2', '择偶工作性质', '2', '偶尔出差', '0'), ('199', 'travel2', '择偶工作性质', '3', '经常出差', '0'), ('200', 'travel2', '择偶工作性质', '4', '基本不在青岛范围', '0'), ('204', 'remark', '拒绝原因', '1', '不好看', null), ('205', 'remark', '拒绝原因', '2', '性别不合适', null);
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
  `compare` varchar(10) DEFAULT NULL,
  `late` varchar(10) DEFAULT NULL,
  `talk` varchar(10) DEFAULT NULL,
  `next` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_evaluate`
-- ----------------------------
BEGIN;
INSERT INTO `t_evaluate` VALUES ('11', '51', '44', null, '就解决了', '', null, '3', '2', '2', null), ('12', null, null, null, null, null, null, null, null, null, null), ('13', '48', '40', '41', '1323', '好看,', null, '3', '2', '3', '4'), ('14', '61', '46', '40', '123123123', '13,', null, '3', '4', '3', '3');
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
--  Table structure for `t_focus`
-- ----------------------------
DROP TABLE IF EXISTS `t_focus`;
CREATE TABLE `t_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_focus`
-- ----------------------------
BEGIN;
INSERT INTO `t_focus` VALUES ('14', '40', '39'), ('15', '40', '45'), ('21', '63', '42'), ('22', '63', '42'), ('23', '63', '42'), ('24', '63', '42'), ('25', '63', '42'), ('26', '63', '42'), ('27', '63', '42'), ('28', '63', '42'), ('29', '63', '42'), ('30', '63', '42'), ('31', '63', '42'), ('32', '63', '42'), ('33', '63', '42'), ('34', '63', '42'), ('35', '63', '42'), ('36', '63', '42'), ('37', '46', '44'), ('38', '46', '44'), ('39', '46', '44'), ('40', '46', '44'), ('41', '46', '44');
COMMIT;

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
  `invite_states` varchar(2) DEFAULT NULL COMMENT '约会状态-关联字典表 1邀请 2 同意,选择时间地点 3 拒绝 4 确定约会 5取消  6 申请取消 7 已结束  8 驳回取消  9 取消 0 爽约',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_invite`
-- ----------------------------
BEGIN;
INSERT INTO `t_invite` VALUES ('47', '38', '39', '1', '2018-12-04 18:22:17', '9', null), ('48', '40', '41', null, '2018-12-04 18:25:54', '7', null), ('49', '41', '42', '2', '2018-12-04 19:53:30', '7', null), ('50', '42', '38', null, '2018-12-04 19:54:13', '7', null), ('51', '44', '42', '2', '2018-12-04 20:03:33', '7', null), ('52', '43', '42', '1', '2018-12-04 20:04:37', '4', null), ('53', '43', '42', '2', '2018-12-16 20:04:58', '4', '1231'), ('54', '46', '41', '1', '2018-12-16 10:32:23', '4', null), ('61', '46', '40', '2', '2018-12-14 17:37:25', '4', '123123123aaaa'), ('62', '41', '46', null, '2018-12-15 21:26:36', '1', null), ('64', '70', '71', '2', '2019-01-29 20:57:20', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `t_invite_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_invite_detail`;
CREATE TABLE `t_invite_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_id` int(11) DEFAULT NULL,
  `pre_date2` varchar(30) DEFAULT NULL,
  `pre_date` varchar(100) DEFAULT NULL COMMENT '预约时间',
  `pre_date3` varchar(30) DEFAULT NULL,
  `confirm_date` varchar(30) DEFAULT NULL COMMENT '邀请时间',
  `confirm_time` varchar(10) DEFAULT NULL,
  `confirm_loc` varchar(10) DEFAULT NULL COMMENT '邀请人活动范围',
  `confirm_loc3` varchar(10) DEFAULT NULL,
  `confirm_loc2` varchar(10) DEFAULT NULL,
  `update_times` int(11) DEFAULT '0' COMMENT '修改次数  不能超过2次',
  `update_time_join` int(11) DEFAULT '0',
  `sign_from` varchar(1) DEFAULT NULL COMMENT '0未签到 1签到 2 店家确认签到',
  `sign_join` varchar(1) DEFAULT NULL COMMENT '0未签到 1签到 2 店家确认签到',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_invite_detail`
-- ----------------------------
BEGIN;
INSERT INTO `t_invite_detail` VALUES ('29', '44', null, null, null, null, null, '2', null, null, '0', '0', null, null), ('30', '45', null, null, null, null, null, '1', null, null, '0', '1', null, null), ('31', '46', null, null, null, null, null, '1', null, null, '0', '1', null, null), ('32', '47', null, null, null, null, null, '1', null, null, '0', '1', null, null), ('33', '48', null, '2018-12-13 17:00,2018-12-14 14:00,2018-12-14 14:00,', null, null, null, '2', null, null, '0', '0', null, null), ('34', '49', null, null, null, null, null, '2', null, null, '0', '0', '1', null), ('35', '50', null, '2018-12-04 22:00,', null, null, null, '1', null, null, '0', '0', null, null), ('36', '52', null, null, null, '2018-12-16 04:00', null, '2', null, null, '0', '0', '1', '1'), ('37', '53', null, '2018-12-12 01:00,', null, '2018-12-16 04:00', null, null, null, null, '0', '0', null, null), ('38', '54', null, '2018-12-10 04:00', null, '2018-12-16 04:00', null, '1', null, null, '0', '0', null, null), ('39', '55', null, '', null, null, null, '2', null, null, '0', '0', null, null), ('40', '56', null, '', null, null, null, '2', null, null, '0', '0', null, null), ('41', '57', null, '', null, null, null, '2', null, null, '0', '0', null, null), ('42', '58', null, '2018-12-19 09:00', null, null, null, '1', null, null, '0', '0', null, null), ('43', '61', '2018-12-19 09:00', null, '2018-12-19 17:00', '2018-12-19 17:00', null, null, '2', '1', '0', '0', '1', '1'), ('45', '63', '', '2018-12-18 09:00', '', null, null, '2', null, null, '0', '0', null, null), ('46', '62', '', '2018-12-18 13:00', '', null, null, '2', null, null, '0', '0', null, null), ('47', '63', '2019-01-31 14:00', '', '', null, null, '', '', '2', '0', '0', null, null), ('48', '64', '', '2019-01-30 13:00', '', '2019-01-30 13:00', null, '2', '', '', '0', '0', null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_message`
-- ----------------------------
BEGIN;
INSERT INTO `t_message` VALUES ('2', '38', null, '123', '2018-12-04 17:43:21', null, null), ('3', '43', null, 'ç¬¨å°ç°', '2018-12-04 20:07:03', null, null), ('4', '41', null, 'æçå¾®ä¿¡å·ï¼å æ', '2018-12-04 20:07:35', null, null), ('5', '41', null, 'å æï¼å æï¼ï¼ï¼ï¼', '2018-12-04 20:21:52', null, null), ('6', '40', null, 'ä½ å¥½', '2018-12-06 22:40:05', null, null), ('7', '46', null, '123123', '2018-12-14 15:42:19', null, '0');
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
INSERT INTO `t_remind` VALUES ('1', '穿着提醒', '10', '注意穿着得体，干净简洁', '1', ''), ('2', '时间提醒', '2', '马上就要约会啦，不要误了时间', '2', '');
COMMIT;

-- ----------------------------
--  Table structure for `t_require`
-- ----------------------------
DROP TABLE IF EXISTS `t_require`;
CREATE TABLE `t_require` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height` double(7,2) DEFAULT NULL,
  `weight` double(5,2) DEFAULT NULL,
  `hometown` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `t_sign_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_sign_type`;
CREATE TABLE `t_sign_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', '123', 'admin', '1', '1'), ('65', '13112312312', '123', '孙尚香', '2', ''), ('66', '13123123123', '123', '赵云', '2', ''), ('67', '13212312312', '123', '蔡妍', '2', ''), ('71', '13412312312', '123', '刘备', '2', '');
COMMIT;

-- ----------------------------
--  Function structure for `INTE_ARRAY`
-- ----------------------------
DROP FUNCTION IF EXISTS `INTE_ARRAY`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `INTE_ARRAY`() RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE idx INT DEFAULT 0 ; -- B 集合单元索引 
    DECLARE len INT DEFAULT 0;-- B 集合表达式长度
    DECLARE llen INT DEFAULT 0;-- 最后检查位置
    DECLARE clen INT DEFAULT 0;-- 当前检查位置
    DECLARE tmpStr varchar(255);-- 临时检查数据集
    DECLARE curt varchar(255);-- B 当前检查的单元
    SET len = LENGTH(setB);
    WHILE idx < len DO
        SET idx = idx + 1;
        SET tmpStr = SUBSTRING_INDEX(setB,",",idx);
        SET clen = LENGTH(tmpStr);
-- 获取当前 setB 中的单元
        IF idx = 1 THEN SET curt = tmpStr;
        ELSE SET curt = SUBSTRING(setB,llen+2,clen-llen-1);
        END IF;
-- 检查是否存在于 setA 中
        IF curt != '' and FIND_IN_SET(curt,setA) > 0 THEN RETURN 1;
        END IF;
-- 当前检查终点与上次检查终点相同则跳出
        IF clen <= llen THEN RETURN 0;
        END IF;
 
        SET llen = clen;
    END WHILE;
    RETURN 0;
END
 ;;
delimiter ;

-- ----------------------------
--  Function structure for `IN_SET`
-- ----------------------------
DROP FUNCTION IF EXISTS `IN_SET`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IN_SET`(setA TEXT,setB TEXT) RETURNS int(1)
BEGIN
    DECLARE rtval INT DEFAULT 0 ; -- RETURN 结果
    DECLARE idx INT DEFAULT 0 ; -- B 集合单元索引
    DECLARE len INT DEFAULT 0;-- B 集合表达式长度
    DECLARE llen INT DEFAULT 0;-- 最后检查位置
    DECLARE clen INT DEFAULT 0;-- 当前检查位置
    DECLARE tmpStr TEXT;-- 临时检查数据集
    DECLARE curt TEXT;-- B 当前检查的单元
    DECLARE debugStr TEXT;-- 调试数据
    SET len = LENGTH(setB);
    WHILE idx < len DO
        SET idx = idx + 1;
        SET tmpStr = SUBSTRING_INDEX(setB,",",idx);
        SET clen = LENGTH(tmpStr);

        -- 获取当前 setB 中的单元
        IF idx = 1 THEN SET curt = tmpStr;  
        ELSE SET curt = SUBSTRING(setB,llen+2,clen-llen-1);
        END IF;

        -- 检查是否存在于 setA 中
        IF LENGTH(curt) > 0 THEN
            IF FIND_IN_SET(curt,setA) > 0 THEN SET rtval=1;
            ELSE RETURN 0;
            END IF;
        END IF;

        SET llen = clen;
    END WHILE;
    RETURN rtval;
END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : ring

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2018-12-03 09:07:36
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_act
-- ----------------------------
INSERT INTO `t_act` VALUES ('1', '11', '聚跑', '五四广场', '安达市大所', '3', '2', '', '<p>按时打算打算大</p>', '0.000', '2', '2018-12-06 13:00:00');
INSERT INTO `t_act` VALUES ('2', '11', '读书会', '不是书院', '万象城', '1', '3', null, null, '20.000', '1', '2018-11-29 19:50:03');
INSERT INTO `t_act` VALUES ('3', '11', '踏青', '石老人浴场', '石老人浴场  规划展览馆', '1', '2', '踏青,,', '<p>123123123123<br/></p><p>奥术大师</p><p>奥术大师</p><p>奥术大师多</p><p>阿萨德</p><p>阿萨德</p><p>阿萨德</p>', '20.000', null, '2018-12-06 11:00:00');
INSERT INTO `t_act` VALUES ('4', '11', '踏青', '石老人浴场', '石老人浴场  规划展览馆', '1', '1', '阿萨德,', '<p>奥术大师</p><p>阿萨德</p><p>阿萨德</p><p>阿萨德</p><p>阿萨德</p><p>阿萨德as的</p><p>as的</p>', '20.000', null, '2018-12-06 11:00:00');
INSERT INTO `t_act` VALUES ('5', '11', '的', '2额', '1212 大叔大婶', '2', '3', '1阿诗丹顿2  ,', '<p>驱蚊器无</p><p>&nbsp;</p><p>qw qw&nbsp;</p><p>请问</p><p>&nbsp;</p>', '12.000', null, '2018-11-27 23:00:00');
INSERT INTO `t_act` VALUES ('6', '21', '活动2018', '星巴克', '南京路25号', '1', '1', '', '', '20.000', '0', '2018-11-30 14:00:00');
INSERT INTO `t_act` VALUES ('7', '22', '篮球比赛', '体育馆', '人民路', '1', '2', '', '<p>这是个什么呀</p>', '0.000', '0', '2018-11-29 14:00:00');
INSERT INTO `t_act` VALUES ('8', '23', '测试gtmdng', '青岛', '哈哈哈', '1', '1', '哈哈哈,', '<p>你好</p>', '0.000', '0', '2018-12-01 12:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_act_detail
-- ----------------------------
INSERT INTO `t_act_detail` VALUES ('1', '1', '11', '2');
INSERT INTO `t_act_detail` VALUES ('7', '1', '11', '7');
INSERT INTO `t_act_detail` VALUES ('8', '1', '14', '7');
INSERT INTO `t_act_detail` VALUES ('9', '1', '14', '2');
INSERT INTO `t_act_detail` VALUES ('10', '1', '14', '2');
INSERT INTO `t_act_detail` VALUES ('11', '1', '19', '1');
INSERT INTO `t_act_detail` VALUES ('12', '1', '21', '0');
INSERT INTO `t_act_detail` VALUES ('13', '2', '21', '1');
INSERT INTO `t_act_detail` VALUES ('14', '2', '22', '1');
INSERT INTO `t_act_detail` VALUES ('15', '1', '23', '1');
INSERT INTO `t_act_detail` VALUES ('16', '2', '24', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('18', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '1', null, '王友君', '王友君', '1', '', '2018-12-12', '', '', '1', '1', null, null, null, null, '0', '0', '0', '1', '1', '1', '1', '', '1', '1', '', '', '', '', '', '', null, '可是放暑假', null, null);
INSERT INTO `t_customer` VALUES ('23', 'oD4sW58DIXiS592bFF6qe-16TteE', '0', null, '杨海霞', '呆小虾', '0', '', '2018-12-05', '', '青岛市', '1', '1', null, '180.00', null, '70.00', '0', '0', '0', '2', '4', '1', '1', '食品检测', '6', '6', '403316279', '15265210513', 'Channelyhx@126.com', '孙磊', '哈哈哈哈 你猜猜', '这就是❤️', null, '', null, null);
INSERT INTO `t_customer` VALUES ('24', 'oD4sW50lLbsCrdl8KCuf1os0g_N8', '0', null, '李辉', '回轮车', '1', '1990-03-06', '1989-03-04', '', '山东省泰安市东平县', '1', '2', '162', '172.00', '50.00', '70.00', '0', '0', '0', '4', '4', '1', '3', 'IT开发', '3', '4', '786455881', '15588979027', '786455881@qq.com', 'rock', 'IT男，稳重，成熟', '眼缘最重要', null, '', null, null);
INSERT INTO `t_customer` VALUES ('25', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '0', null, '王友君', '王友君', '1', '', '2018-12-27', '', '', '1', '1', null, null, null, null, '0', '0', '0', '1', '1', '1', '1', '', '1', '1', '', '', '', '', '', '', null, '', null, null);
INSERT INTO `t_customer` VALUES ('26', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '0', null, '孙磊', 'rock', '1', '', '1978-06-23', '', '青岛', '1', '1', null, '181.00', null, '105.00', '0', '0', '0', '1', '1', '1', '1', '', '1', '1', '', '', '', '', '', '', null, '', null, null);
INSERT INTO `t_customer` VALUES ('27', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '0', null, '孙磊', 'rock', '1', '', '1978-06-23', '', '青岛', '1', '1', null, '181.00', null, '105.00', '0', '0', '0', '1', '1', '1', '1', '', '1', '1', '', '', '', '', '', '', null, '', null, null);
INSERT INTO `t_customer` VALUES ('28', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '0', null, '孙磊', 'rock', '1', '', '1978-06-23', '', '青岛', '1', '1', null, '181.00', null, '105.00', '0', '0', '0', '1', '1', '1', '1', '', '1', '1', '', '', '', '', '', '', null, '', null, null);
INSERT INTO `t_customer` VALUES ('29', 'oD4sW5zV0B2aH9mt5IEcG3KOtehQ', '0', null, '张三', '思睿', '0', '', '1990-01-01', '', '青岛', '1', '1', null, '166.00', null, '55.00', '0', '0', '0', '1', '1', '1', '1', '财务', '1', '1', '', '', '', '', '', '', null, '', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_dictionary` VALUES ('32', 'degree', '学历', '1', '初中', '1');
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
INSERT INTO `t_dictionary` VALUES ('113', 'articleType', '文章类型', '1', '游记', '1');
INSERT INTO `t_dictionary` VALUES ('114', 'articleType', '文章类型', '2', '美食', '1');
INSERT INTO `t_dictionary` VALUES ('115', 'articleType', '文章类型', '3', '健康', '1');
INSERT INTO `t_dictionary` VALUES ('116', 'articleType', '文章类型', '4', '感想', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------
INSERT INTO `t_evaluate` VALUES ('1', '1', '1', '2', '123', null, '1', '1', '1', '1', '2');
INSERT INTO `t_evaluate` VALUES ('2', '1', '2', '1', '1321', null, null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('3', '22', '2', '11', null, '123,å¸,', null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('4', '22', '2', '11', null, '', null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('5', '22', '2', '11', null, '123,å¸,é«,', null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('6', '22', '2', '11', null, '123,帅,高,', null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('7', '22', '2', '11', null, '帅,', null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('8', '22', '2', '11', null, '好看,', null, null, null, null, null);
INSERT INTO `t_evaluate` VALUES ('9', '37', '24', '23', '挺好', '', null, '3', '1', '4', '3');
INSERT INTO `t_evaluate` VALUES ('10', null, null, null, null, null, null, null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_focus
-- ----------------------------
INSERT INTO `t_focus` VALUES ('5', '11', '2');
INSERT INTO `t_focus` VALUES ('6', '11', '2');
INSERT INTO `t_focus` VALUES ('7', '22', '14');
INSERT INTO `t_focus` VALUES ('8', '21', '11');
INSERT INTO `t_focus` VALUES ('9', '24', '23');
INSERT INTO `t_focus` VALUES ('10', '28', '23');
INSERT INTO `t_focus` VALUES ('11', '29', '28');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_invite
-- ----------------------------
INSERT INTO `t_invite` VALUES ('1', '1', '2', '1', '2018-10-09 13:30:00', '3', '123123123');
INSERT INTO `t_invite` VALUES ('2', '1', '10', null, '2018-11-08 16:41:57', '3', null);
INSERT INTO `t_invite` VALUES ('3', '1', '10', null, '2018-11-08 16:45:15', '3', null);
INSERT INTO `t_invite` VALUES ('4', '10', '1', null, '2018-11-08 16:58:50', '3', null);
INSERT INTO `t_invite` VALUES ('5', '1', '10', null, '2018-11-08 18:46:49', '3', null);
INSERT INTO `t_invite` VALUES ('6', '1', '10', null, '2018-11-08 18:50:04', '3', null);
INSERT INTO `t_invite` VALUES ('7', '1', '10', null, '2018-11-08 18:53:26', '3', null);
INSERT INTO `t_invite` VALUES ('8', '19', null, null, '2018-11-10 15:41:00', '3', '周六,太原');
INSERT INTO `t_invite` VALUES ('9', '2', '1', null, '2018-11-10 15:50:59', '3', '周六,太原');
INSERT INTO `t_invite` VALUES ('10', '2', '11', null, '2018-11-21 10:50:56', '3', '周六,太原');
INSERT INTO `t_invite` VALUES ('11', '11', '13', null, '2018-11-21 10:58:33', '9', '周六,太原');
INSERT INTO `t_invite` VALUES ('13', '11', '2', null, '2018-11-21 14:47:57', '4', null);
INSERT INTO `t_invite` VALUES ('14', '11', '2', null, '2018-11-21 15:15:30', '8', null);
INSERT INTO `t_invite` VALUES ('15', '2', '11', '2', null, '9', '12323');
INSERT INTO `t_invite` VALUES ('22', '2', '11', '1', '2018-11-23 09:58:58', '7', '时间不合适');
INSERT INTO `t_invite` VALUES ('25', '18', '19', null, '2018-11-28 03:31:20', '3', '是都管');
INSERT INTO `t_invite` VALUES ('26', '18', '19', null, '2018-11-28 03:37:12', '3', '说得好');
INSERT INTO `t_invite` VALUES ('33', '19', '18', '1', '2018-11-28 04:06:49', '4', null);
INSERT INTO `t_invite` VALUES ('35', '18', '19', '1', '2018-11-28 04:21:52', '4', 'null');
INSERT INTO `t_invite` VALUES ('36', '21', '11', null, '2018-11-28 12:17:44', '1', null);
INSERT INTO `t_invite` VALUES ('37', '24', '23', '1', '2018-12-01 11:26:44', '7', null);
INSERT INTO `t_invite` VALUES ('38', '25', '23', '1', '2018-12-01 12:37:05', '2', null);
INSERT INTO `t_invite` VALUES ('39', '24', '23', null, '2018-12-01 12:38:16', '1', null);
INSERT INTO `t_invite` VALUES ('40', '28', '23', '1', '2018-12-01 19:56:29', '5', null);
INSERT INTO `t_invite` VALUES ('41', '29', '28', null, '2018-12-02 09:26:42', '5', 'null');
INSERT INTO `t_invite` VALUES ('42', '29', '28', null, '2018-12-02 09:45:19', '1', null);

-- ----------------------------
-- Table structure for `t_invite_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_invite_detail`;
CREATE TABLE `t_invite_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_id` int(11) DEFAULT NULL,
  `pre_date` datetime DEFAULT NULL COMMENT '预约时间',
  `confirm_date` varchar(30) DEFAULT NULL COMMENT '邀请时间',
  `confirm_time` varchar(10) DEFAULT NULL,
  `confirm_loc` varchar(10) DEFAULT NULL COMMENT '邀请人活动范围',
  `update_times` int(11) DEFAULT '0' COMMENT '修改次数  不能超过2次',
  `update_time_join` int(11) DEFAULT '0',
  `sign_from` varchar(1) DEFAULT NULL COMMENT '0未签到 1签到 2 店家确认签到',
  `sign_join` varchar(1) DEFAULT NULL COMMENT '0未签到 1签到 2 店家确认签到',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_invite_detail
-- ----------------------------
INSERT INTO `t_invite_detail` VALUES ('1', '13', null, '太原', null, '周六', '0', null, null, null);
INSERT INTO `t_invite_detail` VALUES ('2', '14', null, '太原', null, '周六', '0', null, null, null);
INSERT INTO `t_invite_detail` VALUES ('3', '15', '2018-10-30 09:00:00', '太原', null, '周六', '0', null, null, null);
INSERT INTO `t_invite_detail` VALUES ('4', '16', null, '123', null, '周一~五下班', '0', null, null, null);
INSERT INTO `t_invite_detail` VALUES ('7', '22', '2018-11-24 11:00:00', '1,4', '10-12', '1', '1', '0', '1', '1');
INSERT INTO `t_invite_detail` VALUES ('8', '23', null, '2,5', '11', '2', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('9', '24', null, '5,6', '11', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('10', '25', null, '5,6', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('11', '26', null, '1,5', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('12', '27', null, '2,6', '11', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('13', '28', null, '1,5', '11', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('14', '29', null, '2,6', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('15', '30', null, '2,6', '11', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('16', '31', null, '2,6', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('17', '32', null, '5', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('18', '33', '2018-11-29 10:00:00', '1,5', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('19', '34', null, '5', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('20', '35', '2018-11-29 10:00:00', '2,6', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('21', '36', null, '3', '9', '2', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('22', '37', '2018-12-06 12:00:00', '6,7', '12', '1', '0', '0', '1', '1');
INSERT INTO `t_invite_detail` VALUES ('23', '38', '2018-12-13 10:00:00', '3,7', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('24', '39', null, '6', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('25', '40', '2018-12-14 10:00:00', '4', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('26', '41', null, '3', '10', '1', '0', '0', null, null);
INSERT INTO `t_invite_detail` VALUES ('27', '42', null, '7', '3', '1', '0', '0', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '1', '2', '1111', '2018-11-29 23:43:44', null, null);

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
INSERT INTO `t_sign_type` VALUES ('1', '阳光', 'label-default', '1');
INSERT INTO `t_sign_type` VALUES ('2', '帅气', 'label-primary', '1');
INSERT INTO `t_sign_type` VALUES ('3', '高大', 'label-success', '1');
INSERT INTO `t_sign_type` VALUES ('4', '娇小', 'label-info', '0');
INSERT INTO `t_sign_type` VALUES ('5', '温柔', 'label-warning', '0');
INSERT INTO `t_sign_type` VALUES ('6', '高挑', 'abel-danger', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123', 'admin', '1', '1');
INSERT INTO `t_user` VALUES ('2', 'wyj', '123', '王友君1', '1', '10');
INSERT INTO `t_user` VALUES ('19', 'zy', '123', '赵云', '3', '14');
INSERT INTO `t_user` VALUES ('20', 'ssx', '123', '孙尚香', '2', '11');
INSERT INTO `t_user` VALUES ('21', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '王友君', '2', '16');
INSERT INTO `t_user` VALUES ('22', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '昭君', '2', '17');
INSERT INTO `t_user` VALUES ('23', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '友君', '2', '18');
INSERT INTO `t_user` VALUES ('24', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '昭君', '2', '19');
INSERT INTO `t_user` VALUES ('25', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '123', '孙磊', '2', '20');
INSERT INTO `t_user` VALUES ('26', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '123', '孙磊', '2', '21');
INSERT INTO `t_user` VALUES ('27', 'oD4sW58DIXiS592bFF6qe-16TteE', '123', '你好', '2', '22');
INSERT INTO `t_user` VALUES ('28', 'oD4sW57RBe-ZUAgoXQAT-VrxK_Eo', '123', '还没回家', '2', '23');
INSERT INTO `t_user` VALUES ('29', 'oD4sW54wM4mG9Msiq2QywDGBGG9c', '123', '你就', '2', '24');
INSERT INTO `t_user` VALUES ('30', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '王友君', '11', '25');
INSERT INTO `t_user` VALUES ('31', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '王友君', '2', '26');
INSERT INTO `t_user` VALUES ('32', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '解释的好', '2', '27');
INSERT INTO `t_user` VALUES ('33', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '解释的好', '2', '28');
INSERT INTO `t_user` VALUES ('34', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '发广告好', '2', '29');
INSERT INTO `t_user` VALUES ('35', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '儿童', '2', '15');
INSERT INTO `t_user` VALUES ('36', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '儿童', '2', '16');
INSERT INTO `t_user` VALUES ('37', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '儿童', '2', '17');
INSERT INTO `t_user` VALUES ('38', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', '王友君', '2', '18');
INSERT INTO `t_user` VALUES ('39', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '李子', '2', '19');
INSERT INTO `t_user` VALUES ('40', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '李子', '2', '20');
INSERT INTO `t_user` VALUES ('41', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '李子', '2', '21');
INSERT INTO `t_user` VALUES ('42', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '李子', '2', '22');
INSERT INTO `t_user` VALUES ('43', 'oD4sW58DIXiS592bFF6qe-16TteE', '123', '杨海霞', '2', '23');
INSERT INTO `t_user` VALUES ('44', 'oD4sW53wND1Rdpo3eUhEQ4rhXtg4', '123', null, '2', null);
INSERT INTO `t_user` VALUES ('45', 'oD4sW50lLbsCrdl8KCuf1os0g_N8', '123', '李辉', '2', '24');
INSERT INTO `t_user` VALUES ('46', 'oD4sW53lRYOQqAiwt-6XF4q96NRE', '123', '王友君', '2', '25');
INSERT INTO `t_user` VALUES ('47', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '123', '孙磊', '2', '26');
INSERT INTO `t_user` VALUES ('48', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '123', '孙磊', '2', '27');
INSERT INTO `t_user` VALUES ('49', 'oD4sW59CLdSyqoPESr7WhnXy9nvI', '123', '孙磊', '2', '28');
INSERT INTO `t_user` VALUES ('50', 'oD4sW5zV0B2aH9mt5IEcG3KOtehQ', '123', '张三', '2', '29');

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

 Date: 12/15/2018 11:17:40 AM
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
--  Table structure for `t_act_detail`
-- ----------------------------
DROP TABLE IF EXISTS `t_act_detail`;
CREATE TABLE `t_act_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `detail_state` varchar(1) DEFAULT NULL COMMENT '0取消申请 1.申请 2.同意 3.缴费 4退出 5结束 6未参加 7拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
  `birthday2` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `hometown2` varchar(100) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL COMMENT '家乡',
  `loca` varchar(100) DEFAULT NULL COMMENT '范围1',
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

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

/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ring

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-11-29 17:29:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

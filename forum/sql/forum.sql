/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50523
Source Host           : localhost:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 50523
File Encoding         : 65001

Date: 2016-04-29 00:32:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for forum_article
-- ----------------------------
DROP TABLE IF EXISTS `forum_article`;
CREATE TABLE `forum_article` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_user_id` (`user_id`),
  CONSTRAINT `article_user_id` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_article
-- ----------------------------

-- ----------------------------
-- Table structure for forum_authority
-- ----------------------------
DROP TABLE IF EXISTS `forum_authority`;
CREATE TABLE `forum_authority` (
  `id` int(1) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_authority
-- ----------------------------
INSERT INTO `forum_authority` VALUES ('1', '普通会员');
INSERT INTO `forum_authority` VALUES ('2', '版主');
INSERT INTO `forum_authority` VALUES ('3', '管理员');
INSERT INTO `forum_authority` VALUES ('4', '黑名单');

-- ----------------------------
-- Table structure for forum_business
-- ----------------------------
DROP TABLE IF EXISTS `forum_business`;
CREATE TABLE `forum_business` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `business_admin_id` (`user_id`),
  CONSTRAINT `business_admin_id` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_business
-- ----------------------------

-- ----------------------------
-- Table structure for forum_content
-- ----------------------------
DROP TABLE IF EXISTS `forum_content`;
CREATE TABLE `forum_content` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_user_id` (`user_id`),
  CONSTRAINT `content_user_id` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_content
-- ----------------------------

-- ----------------------------
-- Table structure for forum_document
-- ----------------------------
DROP TABLE IF EXISTS `forum_document`;
CREATE TABLE `forum_document` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `upload_time` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_user_id` (`user_id`),
  CONSTRAINT `document_user_id` FOREIGN KEY (`user_id`) REFERENCES `forum_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_document
-- ----------------------------

-- ----------------------------
-- Table structure for forum_section
-- ----------------------------
DROP TABLE IF EXISTS `forum_section`;
CREATE TABLE `forum_section` (
  `id` int(2) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_section
-- ----------------------------
INSERT INTO `forum_section` VALUES ('1', '计算机专业课');
INSERT INTO `forum_section` VALUES ('2', '考研公共课');
INSERT INTO `forum_section` VALUES ('3', '交流互动');
INSERT INTO `forum_section` VALUES ('4', '资料下载');
INSERT INTO `forum_section` VALUES ('5', '名校交流');
INSERT INTO `forum_section` VALUES ('6', '二手市场');
INSERT INTO `forum_section` VALUES ('7', '休闲角落');
INSERT INTO `forum_section` VALUES ('8', '事务专区');

-- ----------------------------
-- Table structure for forum_subsection
-- ----------------------------
DROP TABLE IF EXISTS `forum_subsection`;
CREATE TABLE `forum_subsection` (
  `id` int(2) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `section_id` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_ref_section_id` (`section_id`),
  CONSTRAINT `sub_ref_section_id` FOREIGN KEY (`section_id`) REFERENCES `forum_section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_subsection
-- ----------------------------
INSERT INTO `forum_subsection` VALUES ('1', '数据结构', '1');
INSERT INTO `forum_subsection` VALUES ('2', '操作系统', '1');
INSERT INTO `forum_subsection` VALUES ('3', '计算机网络', '1');
INSERT INTO `forum_subsection` VALUES ('4', '计算机组成原理', '1');
INSERT INTO `forum_subsection` VALUES ('5', '考研数学', '2');
INSERT INTO `forum_subsection` VALUES ('6', '考研英语', '2');
INSERT INTO `forum_subsection` VALUES ('7', '考研政治', '2');
INSERT INTO `forum_subsection` VALUES ('8', '生活交流', '3');
INSERT INTO `forum_subsection` VALUES ('9', '心路历程', '3');
INSERT INTO `forum_subsection` VALUES ('10', '跨考专版', '3');
INSERT INTO `forum_subsection` VALUES ('11', '面试经验', '3');
INSERT INTO `forum_subsection` VALUES ('12', '视频资料', '4');
INSERT INTO `forum_subsection` VALUES ('13', '历年真题', '4');
INSERT INTO `forum_subsection` VALUES ('14', '华北、东北地区', '5');
INSERT INTO `forum_subsection` VALUES ('15', '华东、华中、华南地区', '5');
INSERT INTO `forum_subsection` VALUES ('16', '西北、西南地区', '5');
INSERT INTO `forum_subsection` VALUES ('17', '考研资料', '6');
INSERT INTO `forum_subsection` VALUES ('18', '其他', '6');
INSERT INTO `forum_subsection` VALUES ('19', '原创美文', '7');
INSERT INTO `forum_subsection` VALUES ('20', '好书推荐', '7');
INSERT INTO `forum_subsection` VALUES ('21', '电影推荐', '7');
INSERT INTO `forum_subsection` VALUES ('22', '站务公告', '8');
INSERT INTO `forum_subsection` VALUES ('23', '友链申请', '8');
INSERT INTO `forum_subsection` VALUES ('24', '建议反馈', '8');
INSERT INTO `forum_subsection` VALUES ('25', '为贵检举', '8');

-- ----------------------------
-- Table structure for forum_user
-- ----------------------------
DROP TABLE IF EXISTS `forum_user`;
CREATE TABLE `forum_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `authority_id` int(1) NOT NULL DEFAULT '1',
  `last_login_time` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `user_authority_id` (`authority_id`),
  CONSTRAINT `user_authority_id` FOREIGN KEY (`authority_id`) REFERENCES `forum_authority` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_user
-- ----------------------------
INSERT INTO `forum_user` VALUES ('1', '12', '男', 'wzNncBURtPYCDsYd7TUgWQ==', '123@12.com', '1', '2016-04-28 18:59:39');
INSERT INTO `forum_user` VALUES ('2', '知识', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123@123.com', '1', '2016-04-28 19:36:56');
INSERT INTO `forum_user` VALUES ('3', '方式', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123@123.com', '1', '2016-04-28 19:49:09');
INSERT INTO `forum_user` VALUES ('4', '打扰', '女', '4QrcOUm6Wau+VuBX8g+IPg==', '1234@111.com', '1', '2016-04-28 19:56:37');
INSERT INTO `forum_user` VALUES ('5', 'et', '女', '4QrcOUm6Wau+VuBX8g+IPg==', 'et@163.com', '1', '2016-04-29 00:32:01');

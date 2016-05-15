/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50523
Source Host           : localhost:3306
Source Database       : forum

Target Server Type    : MYSQL
Target Server Version : 50523
File Encoding         : 65001

Date: 2016-05-16 03:30:30
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
INSERT INTO `forum_business` VALUES ('1462015151025', '121wesdsfd', '12');
INSERT INTO `forum_business` VALUES ('1463246051474', 'gjghgyuyiu', '10');

-- ----------------------------
-- Table structure for forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `forum_comment`;
CREATE TABLE `forum_comment` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_content_id` (`content_id`),
  CONSTRAINT `comment_content_id` FOREIGN KEY (`content_id`) REFERENCES `forum_content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_comment
-- ----------------------------

-- ----------------------------
-- Table structure for forum_content
-- ----------------------------
DROP TABLE IF EXISTS `forum_content`;
CREATE TABLE `forum_content` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `post_time` varchar(255) CHARACTER SET utf8 NOT NULL,
  `section_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_section_id` (`section_id`),
  CONSTRAINT `content_section_id` FOREIGN KEY (`section_id`) REFERENCES `forum_section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_content
-- ----------------------------
INSERT INTO `forum_content` VALUES ('1462131771392', ' 1', '巍', '12', '2016-05-02 03:42:51', '1');
INSERT INTO `forum_content` VALUES ('1462132594369', '额', '给他我的风格', '12', '2016-05-02 03:56:34', '1');
INSERT INTO `forum_content` VALUES ('1463246154948', '123', 'sfdfsd顺丰到付12133ssssssf谔谔谔谔俄方', 'et', '2016-05-15 01:15:54', '1');
INSERT INTO `forum_content` VALUES ('1463246286357', '2342', 'sdgf 啊手动阀手动阀121323查v对方', 'et', '2016-05-15 01:18:06', '1');
INSERT INTO `forum_content` VALUES ('1463246426454', 'de', 'sdfdsdsgf撒地方啊的身份的123332342342423', 'et', '2016-05-15 01:20:26', '1');
INSERT INTO `forum_content` VALUES ('1463246572821', 'wr', 'sdfgffgdsfgfddgs', 'et', '2016-05-15 01:22:52', '1');
INSERT INTO `forum_content` VALUES ('1463247183728', 'fd', 'fgdf顺丰大概是法国的非官方', 'et', '2016-05-15 01:33:03', '1');
INSERT INTO `forum_content` VALUES ('1463247483757', 'fgfg', 'sfhgjhgjkkdsd山豆根山豆根岁的法国', 'et', '2016-05-15 01:38:03', '1');
INSERT INTO `forum_content` VALUES ('1463247870190', 'fs', 'dsfgdfgs阿斯顿啊时代的乳房士大夫士大夫双方发生发射点犯得上123123232334445344223231·1342342343的风格发布', 'et', '2016-05-15 01:44:30', '1');
INSERT INTO `forum_content` VALUES ('1463248507683', 'fddf', 'dfsdfsdfsdfsfwer23wdc ', 'et', '2016-05-15 01:55:07', '1');
INSERT INTO `forum_content` VALUES ('1463248928213', 'fgh', 'dfhfghdfh', 'et', '2016-05-15 02:02:08', '1');
INSERT INTO `forum_content` VALUES ('1463249112923', 'vbdfg', 'sdfgffg的法国法国海军kiloilo；聚会风格和今天', 'et', '2016-05-15 02:05:12', '1');
INSERT INTO `forum_content` VALUES ('1463249415332', 'hj', 'dgretrhghf', 'et', '2016-05-15 02:10:15', '1');
INSERT INTO `forum_content` VALUES ('1463249833541', 'ljk', 'hvhilujjb搅拌机', 'et', '2016-05-15 02:17:13', '1');
INSERT INTO `forum_content` VALUES ('1463324570994', '电费', '发给对方', 'et', '2016-05-15 23:02:50', '1');
INSERT INTO `forum_content` VALUES ('1463324607342', '实现', '冯绍峰地方', 'et', '2016-05-15 23:03:27', '2');

-- ----------------------------
-- Table structure for forum_document
-- ----------------------------
DROP TABLE IF EXISTS `forum_document`;
CREATE TABLE `forum_document` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `upload_time` varchar(255) CHARACTER SET utf8 NOT NULL,
  `save_path` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_document
-- ----------------------------
INSERT INTO `forum_document` VALUES ('1462074290397', '120708.xls', 'op', '2016-05-01 11:44:50', '049ce415-85d9-4254-9e4a-d3decf904975_120708.xls');
INSERT INTO `forum_document` VALUES ('1462157460093', '简历.docx', 'op', '2016-05-02 10:51:00', 'c5eff90a-b93e-45b3-a50a-0f31dbbca089_简历.docx');
INSERT INTO `forum_document` VALUES ('1462769359789', 'com.forum.checkcode.bmp', 'op', '2016-05-09 12:49:19', 'cf4403fa-7e8e-4bb3-9617-fafcd81ae0e3_com.forum.checkcode.bmp');
INSERT INTO `forum_document` VALUES ('1462769659793', 'com.forum.model.bmp', 'op', '2016-05-09 12:54:19', '7a290fbe-9132-4656-9e48-36842f81a81b_com.forum.model.bmp');
INSERT INTO `forum_document` VALUES ('1462935124976', 'jstl.jar', 'op', '2016-05-11 10:52:04', 'ebf5f9ef-4953-4cbc-8a13-506e7a64b291_jstl.jar');
INSERT INTO `forum_document` VALUES ('1463324767458', 'forum.sql', 'et', '2016-05-15 23:06:07', 'aad01216-6716-46a0-8edd-ebfd3bd9deae_forum.sql');
INSERT INTO `forum_document` VALUES ('1463330758765', 'index.html', 'admin', '2016-05-16 00:45:58', '0645b5bc-dac8-4788-a7b8-80f2325b1fdf_index.html');
INSERT INTO `forum_document` VALUES ('1463331389799', 'build.gradle', 'admin', '2016-05-16 00:56:29', 'f4a72d9c-cae1-4f15-bd3b-4a9c7e54129d_build.gradle');
INSERT INTO `forum_document` VALUES ('1463331984664', 'compiler.xml', 'admin', '2016-05-16 01:06:24', 'f569b0b1-37ee-47ad-a3c7-21ae638b6dc1_compiler.xml');
INSERT INTO `forum_document` VALUES ('1463332521027', 'workspace.xml', 'admin', '2016-05-16 01:15:21', '0e9f8fb5-7f50-4e72-bbb0-dd41ac0447a5_workspace.xml');
INSERT INTO `forum_document` VALUES ('1463332580866', 'modules.xml', 'admin', '2016-05-16 01:16:20', '7324bc81-42fc-40af-9569-29952d886f79_modules.xml');
INSERT INTO `forum_document` VALUES ('1463333018746', 'gradle.xml', 'admin', '2016-05-16 01:23:38', 'deb59558-0959-41d7-8f52-89d3f4838f00_gradle.xml');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forum_user
-- ----------------------------
INSERT INTO `forum_user` VALUES ('1', '12', '男', 'wzNncBURtPYCDsYd7TUgWQ==', '123@12.com', '1', '2016-05-02 03:56:05');
INSERT INTO `forum_user` VALUES ('2', '知识', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123@123.com', '1', '2016-04-28 19:36:56');
INSERT INTO `forum_user` VALUES ('3', '方式', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123@123.com', '1', '2016-04-28 19:49:09');
INSERT INTO `forum_user` VALUES ('4', '打扰', '女', '4QrcOUm6Wau+VuBX8g+IPg==', '1234@111.com', '1', '2016-04-28 19:56:37');
INSERT INTO `forum_user` VALUES ('5', 'et', '女', '83nq88gxsE3hU0adG+w0Xg==', 'et@163.com', '1', '2016-05-15 23:02:09');
INSERT INTO `forum_user` VALUES ('6', '给他', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123456@12.com', '1', '2016-04-30 00:49:41');
INSERT INTO `forum_user` VALUES ('7', '虎牙', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123456@22.com', '1', '2016-04-30 00:52:17');
INSERT INTO `forum_user` VALUES ('8', '考研', '男', '4QrcOUm6Wau+VuBX8g+IPg==', '123456@12.com', '1', '2016-04-30 16:24:02');
INSERT INTO `forum_user` VALUES ('9', '一条', '女', '4QrcOUm6Wau+VuBX8g+IPg==', '123456@123.com', '3', '2016-04-30 11:39:53');
INSERT INTO `forum_user` VALUES ('10', 'op', '女', '4QrcOUm6Wau+VuBX8g+IPg==', 'op@163.com', '3', '2016-05-15 23:05:05');
INSERT INTO `forum_user` VALUES ('11', 'hy', '男', '4QrcOUm6Wau+VuBX8g+IPg==', 'hy@123.com', '3', '2016-04-30 14:32:42');
INSERT INTO `forum_user` VALUES ('12', 'iu', '男', '4QrcOUm6Wau+VuBX8g+IPg==', 'iu@123.com', '3', '2016-05-02 11:50:38');
INSERT INTO `forum_user` VALUES ('13', 'yy', '男', '4QrcOUm6Wau+VuBX8g+IPg==', 'yy123@163.com', '3', '2016-05-16 02:24:16');

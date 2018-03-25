/*
 Navicat Premium Data Transfer

 Source Server         : L1ANN
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : offer++

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 25/03/2018 20:53:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `pk_administrator_name` int(10) NOT NULL,
  `administrator_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pk_administrator_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES (123456, '123456');

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application`  (
  `pk_apply_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `position_id` int(8) NOT NULL COMMENT '岗位id',
  `application_status` int(2) NOT NULL COMMENT '简历状态（未查阅，已查阅，接收）',
  PRIMARY KEY (`pk_apply_id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  INDEX `pid`(`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES (4, 1, 4, -1);
INSERT INTO `application` VALUES (36, 16, 1, 0);
INSERT INTO `application` VALUES (37, 16, 2, 0);
INSERT INTO `application` VALUES (38, 17, 1, 0);
INSERT INTO `application` VALUES (39, 19, 1, 0);
INSERT INTO `application` VALUES (66, 7, 57, 1);

-- ----------------------------
-- Table structure for career
-- ----------------------------
DROP TABLE IF EXISTS `career`;
CREATE TABLE `career`  (
  `pk_direction_id` int(4) NOT NULL,
  `direction_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pk_direction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `pk_collection_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL COMMENT '用户id',
  `position_id` int(8) NOT NULL COMMENT '岗位id',
  PRIMARY KEY (`pk_collection_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (3, 1, 2);
INSERT INTO `collection` VALUES (192, 7, 2);
INSERT INTO `collection` VALUES (193, 7, 3);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `pk_com_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '企业id，自增长',
  `com_no` int(16) NOT NULL COMMENT '企业工商注册号',
  `com_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `com_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `com_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `com_industry` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `com_location` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `com_size` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规模',
  `com_legalperson` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人名称',
  `com_intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司介绍',
  `com_contact` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `com_postlimit` int(4) NOT NULL COMMENT '企业发布岗位上限',
  `com_pass` tinyint(1) NOT NULL COMMENT '企业注册是否通过标识',
  PRIMARY KEY (`pk_com_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, 2548979, 'alibb@ali.com', '123456', '阿里巴巴', '通讯', '杭州江干区58号', '50-100人', '马云', '阿里公司', '135497851564', 5, 1);
INSERT INTO `company` VALUES (2, 3256987, 'wangyi@163.com', '456789', '网易', '游戏', '北京', '1000人以上', '丁磊', '中国最先进的游戏开发公司', '125874698521', 100, 1);
INSERT INTO `company` VALUES (3, 2569874, 'getui@gmail.com', '369258', '个推', '移动互联网', '上海', '500-1000人', '方毅', '个推是独立的全领域移动大数据服务商，[1]  提供消息推送解决方案，帮助企业和开发者快捷高效地建立推送系统。以推送技术为基础，依托庞大的移动终端覆盖，个推同时发展了大数据和移动营销业务，目前已成为基于大数据的移动互联网综合服务提供商，旗下拥有个推推送、个推大数据和个灯数据营销平台等众多产品。个推致力于用大数据提升产业价值。', '123548975214', 50, 1);
INSERT INTO `company` VALUES (4, 12345, '254708919@qq.com', '1234567', '腾讯', '移动互联网', '深圳', '1000人以上', '马化腾', NULL, NULL, 50, 1);
INSERT INTO `company` VALUES (9, 258698, '256482158@qq,com', '123456', '58到家', NULL, NULL, NULL, '李勤', NULL, NULL, 50, 0);
INSERT INTO `company` VALUES (10, 25698847, '354879978@qq.com', '123456', '博普科技', NULL, NULL, NULL, '广灿烈', NULL, NULL, 100, 0);
INSERT INTO `company` VALUES (11, 2156488, '354878912@qq.com', '123456', 'Sohu', NULL, NULL, NULL, '张朝阳', NULL, NULL, 50, 1);
INSERT INTO `company` VALUES (42, 123, '342141672@qq.com', '123456', '振兴科技', NULL, NULL, NULL, '王振兴', NULL, NULL, 10, 1);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `pk_position_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '职位id，自增长',
  `com_id` int(8) NOT NULL COMMENT '公司id',
  `position_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `position_property` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性质',
  `position_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `position_education` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历要求',
  `position_experiment` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作经验',
  `position_salary` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位薪资',
  `position_welfare` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司福利',
  `position_introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司介绍',
  `position_skill` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能要求',
  `position_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pk_position_id`) USING BTREE,
  INDEX `com_id`(`com_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 1, '大数据研发', '全职', '杭州', '本科', '二年及以上', '15~17k * 12月', '股票期权；绩效奖金；弹性工作；年底双薪', '岗位来自网易云课堂 \r\n网易云课堂，是网易公司倾力打造的在线实用技能学习平台，主要为学习者提供海量、优质的课程，立足于实用性的要求，课程结构严谨，用户可以根据自身的学习程度，自主安排学习进度。云课堂的宗旨是，为每一位想真真正正学到些实用知识、技能的学习者，提供贴心的一站式学习服务。', 'Java;架构;大数据', '杭州江干路58号');
INSERT INTO `position` VALUES (2, 3, '大数据运维', '实习', '杭州', '', NULL, '12~17k * 13月', '16-18薪; 生日party', '岗位描述 \r\n1. 参与需求评审、迭代设计、编码、Code Review等环节的工作 \r\n2. 能不断改善产品的使用体验，对产品的上线及服务、问题反馈的处理 \r\n岗位要求 \r\n1. 计算机相关专业本科或以上学历，2年以上Java项目开发经验； \r\n2. 扎实的编程基础，精通java开发语言，熟悉jvm，web开发、缓存，分布式架构、消息中间件等核心技术； \r\n3. 熟悉Java EE相关的主流开源框架，了解原理和机制，有Spring、Dubbo、spring cloud 等分布式框架使用者优先； \r\n4. 熟悉Oracle、MySql等数据库技术，对sql优化有一定的经验； \r\n5. 诚恳、踏实、对技术和工作充满热情，具有owner意识； \r\n6. 有大型互联网应用产品开发优先考虑 \r\n7. 有优秀github项目或参与过开源项目优先；', 'Java;大数据;Git;Redis', NULL);
INSERT INTO `position` VALUES (3, 1, 'Java研发', '实习', '上海', '本科', '一年及以上', '13~17k * 12月', '绩效奖金', '岗位来自网易云课堂 \r\n网易云课堂，是网易公司倾力打造的在线实用技能学习平台，主要为学习者提供海量、优质的课程，立足于实用性的要求，课程结构严谨，用户可以根据自身的学习程度，自主安排学习进度。云课堂的宗旨是，为每一位想真真正正学到些实用知识、技能的学习者，提供贴心的一站式学习服务。', 'Java;架构', NULL);
INSERT INTO `position` VALUES (4, 2, '产品经理', '全职', '武汉', NULL, NULL, '13k~15k * 13月', '弹性工作；年底双薪', '我们通过大数据和人工智能的技术为阿里数千万的商家及服务商提供全域数据产品和技术平台。我们为商家及品牌商提供独立大数据产品有：客户运营平台 （为阿里商家打造的数据驱动的客户精细化运营平台）、数据银行（为品牌商提供的从经营决策到营销优化全方位商业技术产品解决方案，包括面向营销的策略中心和企业自己的数据银行，以及定制化的PAAS的大数据分析建模平台）。 ', '架构', NULL);
INSERT INTO `position` VALUES (5, 1, '算法工程师', '全职', '深圳', '硕士', '三年及以上', '15~20k * 13月', '股票期权', '岗位来自网易云课堂 \r\n网易云课堂，是网易公司倾力打造的在线实用技能学习平台，主要为学习者提供海量、优质的课程，立足于实用性的要求，课程结构严谨，用户可以根据自身的学习程度，自主安排学习进度。云课堂的宗旨是，为每一位想真真正正学到些实用知识、技能的学习者，提供贴心的一站式学习服务。', '算法', NULL);
INSERT INTO `position` VALUES (6, 3, '大数据推荐算法', '全职', '杭州', '博士', '', '20~30k * 16月', '股票期权；绩效奖金', '岗位来自网易云课堂 \r\n网易云课堂，是网易公司倾力打造的在线实用技能学习平台，主要为学习者提供海量、优质的课程，立足于实用性的要求，课程结构严谨，用户可以根据自身的学习程度，自主安排学习进度。云课堂的宗旨是，为每一位想真真正正学到些实用知识、技能的学习者，提供贴心的一站式学习服务。', 'Java;算法', NULL);
INSERT INTO `position` VALUES (7, 2, '游戏设计师', '实习', '北京', '本科', NULL, '15~20k * 12月', '绩效奖金; 年底双薪; 股票期权; 专项奖金', '职位介绍\r\n1、负责基于Linux平台进行大型多人在线游戏服务器的开发； \r\n2、负责游戏后台分布式系统中的设计、实现及性能调优工作。 \r\n•职位要求： \r\n1、计算机类或相关专业本科以上学历，两年以上互联网、游戏或通讯行业工作经验； \r\n2、精通C/C++，熟练掌握面向对象软件设计思想； \r\n3、熟悉网络编程以及数据库使用； \r\n4、对海量、高性能、分布式开发有经验者优先； \r\n5、具备优秀的分析解决问题能力与优秀的沟通协作能力。', 'C/C++;游戏服务器', NULL);
INSERT INTO `position` VALUES (9, 4, 'Java后台研发', '全职', '北京', '本科', '一年及以上', '15~17k * 12月', '股票期权；绩效奖金；弹性工作；年底双薪', '岗位来自网易云课堂  网易云课堂，是网易公司倾力打造的在线实用技能学习平台，主要为学习者提供海量、优质的课程，立足于实用性的要求，课程结构严谨，用户可以根据自身的学习程度，自主安排学习进度。云课堂的宗旨是，为每一位想真真正正学到些实用知识、技能的学习者，提供贴心的一站式学习服务。', 'Java;架构;大数据', NULL);
INSERT INTO `position` VALUES (33, 1, '菜鸟研发', '全职', '杭州', '本科', '一年及以上', '12~16k * 12月', '带薪休假', '菜鸟研发岗', 'Java', '杭州市江干区58号');
INSERT INTO `position` VALUES (57, 1, '大数据研发工程师（杭州）', '全职', '北京', '本科', '三年及以上', '10~20k * 12月', '绩效奖金 生日party', '1、精通java或scala语言，具有面向对象编程思想，对底层实现有一定研究； \n  \n2、精通spark sql、spark streaming等编程，具有实际大型分布式集群项目开发经验；', 'Java', '杭州市江干区58号');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `pk_station_id` int(4) NOT NULL,
  `direction_id` int(4) NOT NULL,
  `station_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pk_station_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `pk_user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id,自增长',
  `user_email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `user_age` int(4) NULL DEFAULT NULL COMMENT '年龄',
  `user_address_country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址（国家）',
  `user_address_city` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址（城市）',
  `user_direction` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业方向',
  `user_station` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从事岗位（最多2个）',
  `user_experience` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作经验',
  `user_skill` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业技能',
  `user_work_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作地点',
  `user_education` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `user_work_experience` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作经历',
  `user_introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人描述',
  `user_top` tinyint(1) NULL DEFAULT NULL COMMENT '置顶标识',
  `user_last_login` bigint(20) NULL DEFAULT NULL COMMENT '用户上线时间',
  `user_edu_experience` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教育经历',
  PRIMARY KEY (`pk_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (7, '342141672@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'fad9a9064d7a4df987a0db5dd6ac7e38.jpg', '连鹏飞', '135882540292222', 22, NULL, '上海', '技术', '.Net工程师,c++工程师', '三年及以上', 'Java SSM JVM', NULL, '硕士', '<p class=\"MsoNormal\" align=\"left\"><span style=\"font-size:12.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#333333;mso-font-kerning:0pt\">北京振兴网络有限公司</span><span lang=\"EN-US\" style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n宋体;color:#333333;mso-font-kerning:0pt\"><o:p></o:p></span></p><p>\n\n</p><p class=\"MsoNormal\" align=\"left\"><span style=\"font-size:12.0pt;font-family:宋体;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#666666;mso-font-kerning:0pt\">开发工程师</span><span lang=\"EN-US\" style=\"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:\n宋体;color:#666666;mso-font-kerning:0pt\"><o:p></o:p></span></p>', '<p style=\"margin:0cm;margin-bottom:.0001pt\"><span style=\"font-size:10.0pt;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;color:#434855\">个人简介</span><span lang=\"EN-US\" style=\"font-size:10.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span style=\"font-size:10.0pt;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;color:#434855\">学习能力强，思维缜密，逻辑性强，胆大心细</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">善于分析问题，解决问题</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">手速快，代码优雅，有代码洁癖</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">喜欢困难和挑战，热衷学习，自我驱动</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">性格随和，责任心强，能承担较大的工作压力</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span lang=\"EN-US\" style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p>&nbsp;</o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span style=\"font-size:10.0pt;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;color:#434855\">技术能力</span><span lang=\"EN-US\" style=\"font-size:10.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span lang=\"EN-US\" style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">1.</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> Java</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">语言。</span><span style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">有</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> 3 </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">年以上</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> Java </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">开发经验，</span><span style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">熟练</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> JVM/JMM</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">，</span><span style=\"font-size:10.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;color:#434855\"> </span><span style=\"font-size:\n10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;color:#434855\">熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;color:#434855\">Spring/MVC/Thrift</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">等主流的开发框架，熟练</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> Maven </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">项目开发；</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n2.</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">熟练</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> MySQL</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">。熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nInnoDB/MyISAM </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;\nmso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">存储引擎，掌握索引</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">/</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">聚簇索引的实现原理，对</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> SQL </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">优化有丰富的经验；</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n3.</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">熟练</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> NoSQL </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">及主要产品。精通</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> Redis</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">，掌握其实现原理及各种数据结构；熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">MongoDB;<o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span lang=\"EN-US\" style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">4.</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> Web </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">开发。熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nNginx/Tomcat/Resin </span><span style=\"font-size:10.0pt;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">等服务器，了解</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nHTML/JS/Ajax </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;\nmso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">等，掌握与前端的交互方式；</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><br>\n5.</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">了解大数据处理相关框架，能够通过</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nHadoop </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;\nmso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">等技术进行大批量数据的分析。熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">Kafka/Pig/Zookeeper\n</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:\nArial;mso-bidi-font-family:Arial;color:#434855\">等，了解</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nHadoop/Hive/Spark </span><span style=\"font-size:10.0pt;mso-ascii-font-family:\nArial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">等；</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span lang=\"EN-US\" style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">6.</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"> Linux </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">操作系统及其下开发环境，熟悉</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nShell </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;\nmso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">脚本语言，熟练使用</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">\nGit/SVN </span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;\nmso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#434855\">等。</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span lang=\"EN-US\" style=\"font-size:\n10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p>&nbsp;</o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span style=\"font-size:10.0pt;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;color:#434855\">我的理想团队</span><span lang=\"EN-US\" style=\"font-size:10.0pt;\nfont-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p style=\"margin:0cm;margin-bottom:.0001pt\"><span style=\"font-size:10.0pt;\nmso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:\nArial;color:#434855\">气氛轻松，压力适中；有大牛，有激情；重视代码质量，重视分享</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\">/</span><span style=\"font-size:10.0pt;mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;\nmso-bidi-font-family:Arial;color:#434855\">学习</span><span lang=\"EN-US\" style=\"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#434855\"><o:p></o:p></span></p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size:14.0pt\"><o:p>&nbsp;</o:p></span></p>', NULL, 1521184585966, '<p style=\"margin-top:0cm;margin-right:0cm;margin-bottom:7.5pt;margin-left:0cm\">浙江工商大学<span style=\"font-family: Helvetica, sans-serif;\"> </span>通信工程，本科<span lang=\"EN-US\" style=\"font-family: Helvetica, sans-serif;\"><o:p></o:p></span></p><p style=\"margin-top:0cm;margin-right:0cm;margin-bottom:7.5pt;margin-left:0cm\">华中科技大学<span lang=\"EN-US\" style=\"font-family: Helvetica, sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;</span>软件工程，硕士<span lang=\"EN-US\" style=\"font-family: Helvetica, sans-serif;\"><o:p></o:p></span></p><p>\n\n\n\n</p><p class=\"MsoNormal\"><span lang=\"EN-US\" style=\"font-size:14.0pt\"><o:p>&nbsp;</o:p></span></p>');
INSERT INTO `user` VALUES (9, '12154892@qq.com', '123456', NULL, '周政', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (10, '2165498798@qq.com', '123456', NULL, '邱嘉航', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, '1536835189@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', NULL, '高平航', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1520825369999, NULL);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26)
 Source Host           : localhost:3306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26)
 File Encoding         : 65001

 Date: 06/04/2023 15:46:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '章节编号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '章节名称',
  `courseid` int NULL DEFAULT NULL COMMENT '课程id',
  `orderNum` int NULL DEFAULT NULL COMMENT '显示顺序',
  `parentid` int NULL DEFAULT NULL COMMENT '章节对应的父章节',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '章节表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES (1, '第一章-初始Python', 1, 1, 0);
INSERT INTO `chapter` VALUES (2, '第二章-Python语言基础', 1, 2, NULL);
INSERT INTO `chapter` VALUES (3, '第三章-运算符与表达式', 1, 3, NULL);
INSERT INTO `chapter` VALUES (4, '第四章-流程控制语句', 1, 4, NULL);
INSERT INTO `chapter` VALUES (5, '第五章-列表与元组', 1, 5, NULL);
INSERT INTO `chapter` VALUES (6, '第六章-字典与集合', 1, 6, NULL);
INSERT INTO `chapter` VALUES (7, '第七章-字符串', 1, 7, NULL);
INSERT INTO `chapter` VALUES (8, '第八章-Python中使用正则表达式', 1, 8, NULL);
INSERT INTO `chapter` VALUES (9, '第九章-函数', 1, 9, NULL);
INSERT INTO `chapter` VALUES (10, '第1章 初始MyBatis框架', 2, 1, NULL);
INSERT INTO `chapter` VALUES (11, '第2章 MyBatis的核心配置', 2, 2, NULL);
INSERT INTO `chapter` VALUES (12, '第3章 动态SQL', 2, 3, NULL);
INSERT INTO `chapter` VALUES (13, '第4章 MyBatis的关系映射和缓冲机制', 2, 4, NULL);
INSERT INTO `chapter` VALUES (14, '1.1 Python简介', 1, 1, 1);
INSERT INTO `chapter` VALUES (15, '1.2搭建Python开发环境', 1, 2, 1);
INSERT INTO `chapter` VALUES (16, '1.1.1什么是Python', 1, 1, 14);
INSERT INTO `chapter` VALUES (17, '1.1.2Python的版本', 1, 2, 14);
INSERT INTO `chapter` VALUES (18, '1.1.3Python能做什么', 1, 3, 14);
INSERT INTO `chapter` VALUES (19, '1.2.1开发环境概述', 1, 1, 15);
INSERT INTO `chapter` VALUES (20, '2.1Python语法特点', 1, 1, 2);
INSERT INTO `chapter` VALUES (23, '管理员测试章节1', 4, 0, 0);

-- ----------------------------
-- Table structure for classfile
-- ----------------------------
DROP TABLE IF EXISTS `classfile`;
CREATE TABLE `classfile`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `fileaddress` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件地址',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程文件资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classfile
-- ----------------------------
INSERT INTO `classfile` VALUES (1, 'C语言自主练习二', '/profile/upload/2023/04/06/自主练习二 (1)_20230406121016A001.pdf', 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NULL DEFAULT NULL COMMENT '学生id,或者老师id',
  `oid` int NULL DEFAULT NULL COMMENT '题目id',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 101, 1, '万事开头难');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `teacher` int NULL DEFAULT NULL COMMENT '教师id',
  `introduce` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程介绍',
  `picture` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程图片',
  `ispublic` bit(1) NULL DEFAULT NULL COMMENT '是否公开',
  `period` int NULL DEFAULT NULL COMMENT '期次',
  `starttime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `progress` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教学进度(预报名,进行中,已结束)',
  `hours` int NULL DEFAULT NULL COMMENT '学时',
  `sayabout` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '这门课讲什么',
  `peculiarity` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '这门课的特点',
  `request` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '这门课的要求',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Python程序设计', 1, '操作系统是管理计算机硬件资源，控制其他程序运行并为用户提供交互操作界面的系统软件的集合。操作系统是计算机系统的关键组成部分，负责管理与配置内存、决定系统资源供需的优先次序、控制输入与输出设备、操作网络与管理文件系统等基本任务。', '/profile/upload/2023/03/28/python_20230328181608A003.jpg', b'1', 1, '2023-03-30 00:00:00', '2023-06-30 00:00:00', '预报名', 48, '操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源，直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，提供人机交互界面，为其它应用软件提供支持等。', '使学生掌握计算机操作系统的基本原理及组成结构、基本概念和相关的新概念、名词及术语；理解操作系统各组成部分之间的关系、总体结构和综合工作原理；了解计算机操作系统的发展特点、设计技巧和方法；培养学生分析、修改和设计操作系统的能力。', '计算机类专业本科学生，及从事该类工作的人群');
INSERT INTO `course` VALUES (2, 'javaWeb框架技术', 100, 'javaEE', '/profile/upload/2023/03/28/hello_20230328184832A006.jpg', b'1', 1, '2023-03-30 00:00:00', '2023-07-01 00:00:00', '进行中', 48, NULL, NULL, NULL);
INSERT INTO `course` VALUES (3, '毛泽东思想和中国特色社会主义理论体系概论', 100, NULL, '/profile/upload/2023/03/28/maogai_20230328184618A004.jpg', b'1', 1, '2023-03-30 00:00:00', '2023-06-14 00:00:00', '进行中', 48, NULL, NULL, NULL);
INSERT INTO `course` VALUES (4, '管理员测试课程', 1, NULL, '/profile/upload/2023/03/28/caozxt_20230328184634A005.jpg', b'1', 1, '2023-03-30 00:00:00', '2023-05-24 00:00:00', '进行中', 56, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cs
-- ----------------------------
DROP TABLE IF EXISTS `cs`;
CREATE TABLE `cs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NULL DEFAULT NULL COMMENT '课程id',
  `sid` int NULL DEFAULT NULL COMMENT '学生id',
  `grade` float NULL DEFAULT NULL COMMENT '学生成绩',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '选课表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cs
-- ----------------------------
INSERT INTO `cs` VALUES (1, 1, 101, NULL);
INSERT INTO `cs` VALUES (2, 4, 101, NULL);
INSERT INTO `cs` VALUES (3, 1, 100, NULL);
INSERT INTO `cs` VALUES (4, 1, 102, NULL);
INSERT INTO `cs` VALUES (5, 1, 103, NULL);
INSERT INTO `cs` VALUES (6, 1, 104, NULL);
INSERT INTO `cs` VALUES (7, 1, 105, NULL);
INSERT INTO `cs` VALUES (8, 1, 106, NULL);
INSERT INTO `cs` VALUES (9, 1, 107, NULL);
INSERT INTO `cs` VALUES (10, 1, 108, NULL);
INSERT INTO `cs` VALUES (11, 1, 109, NULL);
INSERT INTO `cs` VALUES (12, 1, 110, NULL);
INSERT INTO `cs` VALUES (13, 1, 111, NULL);
INSERT INTO `cs` VALUES (14, 1, 112, NULL);
INSERT INTO `cs` VALUES (15, 2, 107, NULL);

-- ----------------------------
-- Table structure for es
-- ----------------------------
DROP TABLE IF EXISTS `es`;
CREATE TABLE `es`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sid` int NULL DEFAULT NULL COMMENT '学生id',
  `eid` int NULL DEFAULT NULL COMMENT '试卷id',
  `score` int NULL DEFAULT NULL COMMENT '成绩',
  `answer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生考试答案记录',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷学生成绩表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of es
-- ----------------------------
INSERT INTO `es` VALUES (9, 1, 12, 15, '[[{\"id\":1,\"answer\":\"A\"},{\"id\":5,\"answer\":\"A\"}],[{\"id\":2,\"answer\":\"ABC\"}],[{\"id\":3,\"answer\":\"对\"}],[{\"id\":4,\"answer\":null}],[]]');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '截止时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (1, 'python考试一', 1, '2023-04-05 05:55:11', '2023-04-05 05:55:13', '2023-04-05 17:38:20', '罗鸿运');
INSERT INTO `exam` VALUES (12, 'python基础', 1, '2023-04-02 00:00:00', '2023-04-03 00:00:00', '2023-04-05 16:04:02', '罗鸿运');
INSERT INTO `exam` VALUES (13, '1111111', 1, '2023-04-03 00:00:00', '2023-03-27 00:00:00', '2023-04-05 23:53:12', 'admin');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'oj', '题目列表', 'testcase', 'oid', 'Oj', 'sub', 'com.ruoyi.oj', 'oj', 'oj', 'oj', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-03-26 21:27:35', '', '2023-03-28 17:21:12', NULL);
INSERT INTO `gen_table` VALUES (3, 'chapter', '章节', '', '', 'Chapter', 'tree', 'com.ruoyi.chapter', 'chapter', 'chapter', 'chapter', 'ruoyi', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"parentid\",\"parentMenuId\":2007}', 'admin', '2023-03-27 22:47:15', '', '2023-03-28 13:00:13', NULL);
INSERT INTO `gen_table` VALUES (4, 'comments', '题目评论', NULL, NULL, 'Comments', 'crud', 'com.ruoyi.comments', 'comments', 'comments', 'comments', 'ruoyi', '0', '/', '{\"parentMenuId\":2007}', 'admin', '2023-03-27 22:47:15', '', '2023-03-28 12:41:45', NULL);
INSERT INTO `gen_table` VALUES (5, 'course', '课程', NULL, NULL, 'Course', 'crud', 'com.ruoyi.course', 'system', 'course', '课程', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2023-03-27 22:47:15', '', '2023-03-29 20:28:21', NULL);
INSERT INTO `gen_table` VALUES (6, 'cs', '选课表', NULL, NULL, 'Cs', 'crud', 'com.ruoyi.system', 'system', 'cs', '选课', 'ruoyi', '0', '/', NULL, 'admin', '2023-03-27 22:47:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'so', '学生刷题表', NULL, NULL, 'So', 'crud', 'com.ruoyi.system', 'system', 'so', '学生刷题', 'ruoyi', '0', '/', '{}', 'admin', '2023-03-27 22:47:15', '', '2023-03-28 19:57:19', NULL);
INSERT INTO `gen_table` VALUES (8, 'testcase', '用例与答案表', '', '', 'Testcase', 'crud', 'com.ruoyi.system', 'system', 'testcase', '用例与答案', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2007\"}', 'admin', '2023-03-28 16:43:32', '', '2023-03-28 17:20:40', NULL);
INSERT INTO `gen_table` VALUES (9, 'signin', '签到表', NULL, NULL, 'Signin', 'crud', 'com.ruoyi.system', 'system', 'signin', '签到', 'ruoyi', '0', '/', NULL, 'admin', '2023-04-02 10:37:35', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'signrecord', '签到记录信息', 'signin', 'sign_id', 'Signrecord', 'sub', 'com.ruoyi.signin', 'signin', 'signin', '签到记录信息', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:55:58', NULL);
INSERT INTO `gen_table` VALUES (11, 'notice', '课程通知公告', NULL, NULL, 'Notice', 'crud', 'com.ruoyi.notice', 'notice', 'notice', '课程通知公告', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-04 20:41:40', '', '2023-04-04 20:42:35', NULL);
INSERT INTO `gen_table` VALUES (12, 'exam', '试卷表', 'question', 'exam_id', 'Exam', 'sub', 'com.ruoyi.exam', 'exam', 'exam', '试卷', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53', NULL);
INSERT INTO `gen_table` VALUES (13, 'question', '题目表', NULL, NULL, 'Question', 'crud', 'com.ruoyi.system', 'system', 'question', '题目', 'ruoyi', '0', '/', NULL, 'admin', '2023-04-05 05:59:32', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'es', '试卷学生成绩表', NULL, NULL, 'Es', 'crud', 'com.ruoyi.es', 'es', 'es', '试卷学生成绩', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-05 19:45:36', '', '2023-04-05 19:46:14', NULL);
INSERT INTO `gen_table` VALUES (15, 'classfile', '课程文件资源', NULL, NULL, 'Classfile', 'crud', 'com.ruoyi.classfile', 'classfile', 'classfile', 'classfile', 'ruoyi', '0', '/', '{}', 'admin', '2023-04-06 11:59:06', '', '2023-04-06 12:01:59', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (15, '2', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-26 21:27:36', '', '2023-03-28 17:22:32');
INSERT INTO `gen_table_column` VALUES (16, '3', 'id', '章节编号', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 13:00:13');
INSERT INTO `gen_table_column` VALUES (17, '3', 'name', '章节名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 13:00:13');
INSERT INTO `gen_table_column` VALUES (18, '3', 'courseid', '课程id', 'int', 'Long', 'courseid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 13:00:13');
INSERT INTO `gen_table_column` VALUES (19, '4', 'id', '评论编号', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 12:41:45');
INSERT INTO `gen_table_column` VALUES (20, '4', 'sid', '学生id,或者老师id', 'int', 'Long', 'sid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 12:41:45');
INSERT INTO `gen_table_column` VALUES (21, '4', 'oid', '题目id', 'int', 'Long', 'oid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 12:41:45');
INSERT INTO `gen_table_column` VALUES (22, '4', 'content', '评论内容', 'varchar(200)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 12:41:45');
INSERT INTO `gen_table_column` VALUES (23, '5', 'id', '', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-27 22:47:15', '', '2023-03-30 16:46:50');
INSERT INTO `gen_table_column` VALUES (24, '5', 'name', '课程名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-27 22:47:15', '', '2023-03-30 16:46:50');
INSERT INTO `gen_table_column` VALUES (25, '5', 'teacher', '教师id', 'int', 'Long', 'teacher', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-27 22:47:15', '', '2023-03-30 16:46:50');
INSERT INTO `gen_table_column` VALUES (26, '6', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-27 22:47:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '6', 'cid', '课程id', 'int', 'Long', 'cid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-27 22:47:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '6', 'sid', '学生id', 'int', 'Long', 'sid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-27 22:47:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '7', 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 19:57:19');
INSERT INTO `gen_table_column` VALUES (30, '7', 'sid', '学生id', 'int', 'Long', 'sid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 19:57:19');
INSERT INTO `gen_table_column` VALUES (31, '7', 'oid', '题目id', 'int', 'Long', 'oid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2023-03-27 22:47:15', '', '2023-03-28 19:57:19');
INSERT INTO `gen_table_column` VALUES (32, '2', 'title', '标题', 'varchar(100)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2023-03-27 22:47:26', '', '2023-03-28 17:22:32');
INSERT INTO `gen_table_column` VALUES (33, '2', 'difficulty', '难度(简单，中等，困难)', 'varchar(10)', 'String', 'difficulty', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2023-03-27 22:47:26', '', '2023-03-28 17:22:32');
INSERT INTO `gen_table_column` VALUES (35, '2', 'description', '描述', 'varchar(1000)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, '', '2023-03-27 22:47:26', '', '2023-03-28 17:22:32');
INSERT INTO `gen_table_column` VALUES (36, '2', 'chapterid', '章节id,无id表示在线题目', 'int', 'Long', 'chapterid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2023-03-27 22:47:26', '', '2023-03-28 17:22:32');
INSERT INTO `gen_table_column` VALUES (37, '5', 'introduce', '课程介绍', 'varchar(500)', 'String', 'introduce', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, '', '2023-03-27 22:51:38', '', '2023-03-30 16:46:50');
INSERT INTO `gen_table_column` VALUES (38, '5', 'picture', '课程图片', 'varchar(500)', 'String', 'picture', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, '', '2023-03-27 22:57:58', '', '2023-03-30 16:46:50');
INSERT INTO `gen_table_column` VALUES (40, '3', 'orderNum', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2023-03-28 10:22:37', '', '2023-03-28 13:00:13');
INSERT INTO `gen_table_column` VALUES (41, '3', 'parentid', '章节对应的父章节', 'int', 'Long', 'parentid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, '', '2023-03-28 12:56:11', '', '2023-03-28 13:00:13');
INSERT INTO `gen_table_column` VALUES (42, '2', 'likeNum', '点赞', 'int', 'Long', 'likeNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2023-03-28 13:43:05', '', '2023-03-28 17:22:32');
INSERT INTO `gen_table_column` VALUES (43, '8', 'id', '测试编号', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-28 16:43:32', '', '2023-03-28 17:22:28');
INSERT INTO `gen_table_column` VALUES (44, '8', 'testcases', '测试用例', 'varchar(1000)', 'String', 'testcases', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-28 16:43:32', '', '2023-03-28 17:22:28');
INSERT INTO `gen_table_column` VALUES (45, '8', 'answer', '每个测试用例对应的答案', 'varchar(1000)', 'String', 'answer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-28 16:43:32', '', '2023-03-28 17:22:28');
INSERT INTO `gen_table_column` VALUES (46, '8', 'oid', '题目id', 'int', 'Long', 'oid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-03-28 16:43:32', '', '2023-03-28 17:22:28');
INSERT INTO `gen_table_column` VALUES (47, '8', 'mark', '解释', 'varchar(100)', 'String', 'mark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-28 16:43:32', '', '2023-03-28 17:22:28');
INSERT INTO `gen_table_column` VALUES (49, '5', 'ispublic', '是否公开', 'bit(1)', 'Integer', 'ispublic', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '5', 'period', '期次', 'int', 'Long', 'period', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '5', 'starttime', '开始时间', 'datetime', 'Date', 'starttime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '5', 'endtime', '结束时间', 'datetime', 'Date', 'endtime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '5', 'progress', '教学进度(预报名,进行中,已结束)', 'varchar(20)', 'String', 'progress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '5', 'hours', '学时', 'int', 'Long', 'hours', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '5', 'sayabout', '这门课讲什么', 'varchar(500)', 'String', 'sayabout', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '5', 'peculiarity', '这门课的特点', 'varchar(500)', 'String', 'peculiarity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 13, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '5', 'request', '这门课的要求', 'varchar(500)', 'String', 'request', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 14, '', '2023-03-30 16:46:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '9', 'id', '签到id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:42:25');
INSERT INTO `gen_table_column` VALUES (59, '9', 'user_id', '用户id，一般为学生', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:42:25');
INSERT INTO `gen_table_column` VALUES (61, '10', 'id', '签到id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:55:58');
INSERT INTO `gen_table_column` VALUES (62, '10', 'course_id', '课程id', 'int', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:55:58');
INSERT INTO `gen_table_column` VALUES (63, '10', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:55:58');
INSERT INTO `gen_table_column` VALUES (64, '10', 'end_time', '结束时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:55:58');
INSERT INTO `gen_table_column` VALUES (65, '10', 'status', '状态', 'int', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2023-04-02 10:37:35', '', '2023-04-02 10:55:58');
INSERT INTO `gen_table_column` VALUES (66, '9', 'sign_id', '签到记录对应的id', 'int', 'Long', 'signId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2023-04-02 10:40:48', '', '2023-04-02 10:42:25');
INSERT INTO `gen_table_column` VALUES (67, '11', 'id', '公告id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-04 20:41:40', '', '2023-04-04 20:42:35');
INSERT INTO `gen_table_column` VALUES (68, '11', 'title', '对应课程通知标题', 'varchar(100)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-04 20:41:40', '', '2023-04-04 20:42:35');
INSERT INTO `gen_table_column` VALUES (69, '11', 'context', '通知内容', 'varchar(1000)', 'String', 'context', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2023-04-04 20:41:40', '', '2023-04-04 20:42:35');
INSERT INTO `gen_table_column` VALUES (70, '11', 'course_id', '课程id', 'int', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-04 20:41:40', '', '2023-04-04 20:42:35');
INSERT INTO `gen_table_column` VALUES (71, '11', 'publish_time', '课程通告发布时间', 'datetime', 'Date', 'publishTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-04-04 20:41:40', '', '2023-04-04 20:42:35');
INSERT INTO `gen_table_column` VALUES (72, '12', 'id', '试卷id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (73, '12', 'name', '试卷名称', 'varchar(100)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (74, '12', 'course_id', '课程id', 'int', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (75, '12', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (76, '12', 'end_time', '截止时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (77, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (78, '12', 'create_by', '创建者', 'varchar(100)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-04-05 05:56:14', '', '2023-04-05 06:01:53');
INSERT INTO `gen_table_column` VALUES (79, '13', 'id', '问题id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (80, '13', 'question_type', '题目类型(1单选2多选3判断4简答)', 'int', 'Long', 'questionType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (81, '13', 'context', '题目', 'varchar(200)', 'String', 'context', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (82, '13', 'answer', '答案', 'varchar(200)', 'String', 'answer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (83, '13', 'select_a', '选项A', 'varchar(200)', 'String', 'selectA', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (84, '13', 'select_b', '选项B', 'varchar(200)', 'String', 'selectB', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (85, '13', 'select_c', '选项C', 'varchar(200)', 'String', 'selectC', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:36');
INSERT INTO `gen_table_column` VALUES (86, '13', 'select_d', '选项D', 'varchar(200)', 'String', 'selectD', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-04-05 05:59:32', '', '2023-04-05 06:01:37');
INSERT INTO `gen_table_column` VALUES (87, '13', 'exam_id', '试卷id', 'int', 'Long', 'examId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2023-04-05 06:01:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '14', 'id', 'id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-05 19:45:36', '', '2023-04-05 19:46:14');
INSERT INTO `gen_table_column` VALUES (89, '14', 'sid', '学生id', 'int', 'Long', 'sid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-04-05 19:45:36', '', '2023-04-05 19:46:14');
INSERT INTO `gen_table_column` VALUES (90, '14', 'eid', '试卷id', 'int', 'Long', 'eid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-04-05 19:45:36', '', '2023-04-05 19:46:14');
INSERT INTO `gen_table_column` VALUES (91, '14', 'score', '成绩', 'int', 'Long', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-04-05 19:45:36', '', '2023-04-05 19:46:14');
INSERT INTO `gen_table_column` VALUES (92, '14', 'answer', '学生考试答案记录', 'varchar(500)', 'String', 'answer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2023-04-05 19:45:36', '', '2023-04-05 19:46:14');
INSERT INTO `gen_table_column` VALUES (93, '15', 'id', '文件id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-04-06 11:59:06', '', '2023-04-06 12:01:59');
INSERT INTO `gen_table_column` VALUES (94, '15', 'name', '文件名称', 'varchar(100)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, '', '2023-04-06 12:01:09', '', '2023-04-06 12:01:59');
INSERT INTO `gen_table_column` VALUES (95, '15', 'fileaddress', '文件地址', 'varchar(500)', 'String', 'fileaddress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'fileUpload', '', 3, '', '2023-04-06 12:01:09', '', '2023-04-06 12:01:59');
INSERT INTO `gen_table_column` VALUES (96, '15', 'course_id', '课程id', 'int', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, '', '2023-04-06 12:01:09', '', '2023-04-06 12:01:59');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对应课程通知标题',
  `context` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通知内容',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '课程通告发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程通知公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '考试通知', '2023年6月25号参加考试,请同学们安排好时间,带好考试物品参加考试', 1, '2023-04-04 20:38:54');
INSERT INTO `notice` VALUES (2, '测试', '11111', 1, '2023-04-04 21:53:31');
INSERT INTO `notice` VALUES (3, '测试', '22222', 1, '2023-04-04 21:55:15');
INSERT INTO `notice` VALUES (4, '测试2', '223333', 1, '2023-04-04 21:56:44');

-- ----------------------------
-- Table structure for oj
-- ----------------------------
DROP TABLE IF EXISTS `oj`;
CREATE TABLE `oj`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `difficulty` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '难度(简单，中等，困难)',
  `likeNum` int NULL DEFAULT 0 COMMENT '点赞',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `chapterid` int NULL DEFAULT NULL COMMENT '章节id,无id表示在线题目',
  `code` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预置代码',
  `codemethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '代码后台验证的主函数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '刷题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oj
-- ----------------------------
INSERT INTO `oj` VALUES (1, '两数之和', '简单', 16673, '<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>', 17, 'class Solution(object):\n    def twoSum(self, nums, target):\n        \"\"\"\n        :type nums: List[int]\n        :type target: int\n        :rtype: List[int]\n        \"\"\"', 'twoSum');
INSERT INTO `oj` VALUES (2, '两数相加', '简单', NULL, '<p>给你两个&nbsp;非空 的链表，表示两个非负的整数。它们每位数字都是按照&nbsp;逆序&nbsp;的方式存储的，并且每个节点只能存储&nbsp;一位&nbsp;数字。</p><p><br></p><p>请你将两个数相加，并以相同形式返回一个表示和的链表。</p><p><br></p><p>你可以假设除了数字 0 之外，这两个数都不会以 0&nbsp;开头。</p><p><img src=\"/dev-api/profile/upload/2023/03/28/addtwonumber1_20230328211341A001.jpg\"></p>', 18, '# Definition for singly-linked list.\n# class ListNode(object):\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution(object):\n    def addTwoNumbers(self, l1, l2):\n        \"\"\"\n        :type l1: ListNode\n        :type l2: ListNode\n        :rtype: ListNode\n        \"\"\"', 'addTwoNumbers');
INSERT INTO `oj` VALUES (3, '整数反转', '中等', NULL, '<p>给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。</p><p><br></p><p>如果反转后整数超过 32 位的有符号整数的范围&nbsp;[−231,&nbsp; 231&nbsp;− 1] ，就返回 0。</p><p><br></p><p><strong>假设环境不允许存储 64 位整数（有符号或无符号）。</strong></p>', 18, 'class Solution(object):\n    def reverse(self, x):\n        \"\"\"\n        :type x: int\n        :rtype: int\n        \"\"\"', 'reverse');
INSERT INTO `oj` VALUES (4, '接雨水', '困难', NULL, '<p><span style=\"color: rgb(38, 38, 38);\">给定&nbsp;</span><code style=\"color: rgba(var(--grey-7-rgb),1);\">n</code><span style=\"color: rgb(38, 38, 38);\">&nbsp;个非负整数表示每个宽度为&nbsp;</span><code style=\"color: rgba(var(--grey-7-rgb),1);\">1</code><span style=\"color: rgb(38, 38, 38);\">&nbsp;的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。</span></p><p><span style=\"color: rgb(38, 38, 38);\">﻿</span><img src=\"/dev-api/profile/upload/2023/03/28/rainwatertrap_20230328213545A001.png\"></p>', 19, 'class Solution(object):\n    def trap(self, height):\n        \"\"\"\n        :type height: List[int]\n        :rtype: int\n        \"\"\"', 'trap');
INSERT INTO `oj` VALUES (5, '两数之和', '简单', 16673, '<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>', 16, 'class Solution(object):\n    def twoSum(self, nums, target):\n        \"\"\"\n        :type nums: List[int]\n        :type target: int\n        :rtype: List[int]\n        \"\"\"', 'twoSum');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `exam_id` int NULL DEFAULT NULL COMMENT '试卷id',
  `question_type` int NULL DEFAULT NULL COMMENT '题目类型(1单选2多选3判断4简答)',
  `context` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目',
  `answer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案',
  `select_a` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项A',
  `select_b` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项B',
  `select_c` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项C',
  `select_d` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选项D',
  `score` int NULL DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 12, 1, '[1,2,3]+[4,5,6] 的结果是多少？', 'D', '[6][15]', '[1,2,3][4,5,6]', '[21]', '[1,2,3,4,5,6]', 5);
INSERT INTO `question` VALUES (2, 12, 2, '可以避免类型错误的函数是？', 'ABC', '1', '2', '3', '4', 5);
INSERT INTO `question` VALUES (3, 12, 3, '测试3', '对', '', '', '', '', 5);
INSERT INTO `question` VALUES (4, 12, 4, '测试', '测试', '', '', '', '', 5);
INSERT INTO `question` VALUES (5, 12, 1, '测试', 'A', 'A', 'B', 'C', 'D', 5);
INSERT INTO `question` VALUES (6, 13, 2, '11', 'ABCD', '11', '11', '11', '11', 1);

-- ----------------------------
-- Table structure for signin
-- ----------------------------
DROP TABLE IF EXISTS `signin`;
CREATE TABLE `signin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '签到id',
  `sign_id` int NULL DEFAULT NULL COMMENT '签到记录对应的id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id，一般为学生',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '签到表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signin
-- ----------------------------
INSERT INTO `signin` VALUES (1, 1, 1);
INSERT INTO `signin` VALUES (2, 1, 103);
INSERT INTO `signin` VALUES (3, 1, 107);

-- ----------------------------
-- Table structure for signrecord
-- ----------------------------
DROP TABLE IF EXISTS `signrecord`;
CREATE TABLE `signrecord`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '签到id',
  `course_id` int NULL DEFAULT NULL COMMENT '课程id',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '签到记录信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signrecord
-- ----------------------------
INSERT INTO `signrecord` VALUES (1, 1, '2023-04-02 11:22:35', '2023-04-03 11:27:28', 0);
INSERT INTO `signrecord` VALUES (3, 1, '2023-04-05 05:25:56', '2023-05-04 00:00:00', NULL);

-- ----------------------------
-- Table structure for so
-- ----------------------------
DROP TABLE IF EXISTS `so`;
CREATE TABLE `so`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NULL DEFAULT NULL COMMENT '学生id',
  `oid` int NULL DEFAULT NULL COMMENT '题目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生刷题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of so
-- ----------------------------
INSERT INTO `so` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-26 18:54:41', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-26 18:54:41', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-26 18:54:41', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-03-26 18:54:41', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-26 18:54:41', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-26 18:54:41', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '华东交通大学', 0, '校长', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:27:11');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '软件学院', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:27:43');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '计算机学院', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:28:09');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '软件开发1班', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:28:32');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '软件开发2班', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:28:49');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '软件开发3班', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:29:01');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '软件开发4班', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:29:14');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '网络安全1班', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:29:27');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '2020级1班', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:29:43');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '2020级2班', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:30:00');
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '软件学院教师', 0, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-28 08:32:00', 'admin', '2023-03-28 08:33:46');
INSERT INTO `sys_dept` VALUES (201, 102, '0,100,102', '计算机学院教师', 0, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-28 08:32:14', 'admin', '2023-03-28 08:33:58');
INSERT INTO `sys_dept` VALUES (202, 100, '0,100', '电气学院', 3, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-28 09:33:54', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-26 18:54:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 19:08:00');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 19:13:29');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 20:35:42');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 21:10:18');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 22:28:38');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:10:24');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:40:21');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:42:04');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:53:33');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:12:56');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:19:50');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:30:36');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:41:58');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:45:10');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:48:02');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 00:51:53');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:01:29');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:02:07');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:05:37');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:06:32');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:07:20');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-27 01:09:34');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:09:39');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:14:30');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-27 01:18:33');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:18:37');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 01:22:12');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 07:53:11');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 07:56:24');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 07:58:21');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 09:07:05');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-27 12:47:30');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 12:47:35');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 14:12:08');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 17:31:57');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:22:17');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 21:01:49');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 21:50:30');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-27 22:42:20');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 22:42:24');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-28 07:30:16');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 07:30:21');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 11:21:58');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-28 12:30:50');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 12:30:56');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-28 13:16:09');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 13:16:13');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 15:04:04');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '192.168.43.78', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 19:51:30');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 19:54:56');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '192.168.43.78', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 20:34:00');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 20:48:01');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 20:51:59');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 21:40:52');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 21:42:23');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:27:15');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:09:32');
INSERT INTO `sys_logininfor` VALUES (157, 'Ricky', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：Ricky 不存在', '2023-03-29 21:09:43');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:09:52');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:10:11');
INSERT INTO `sys_logininfor` VALUES (160, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-29 21:10:23');
INSERT INTO `sys_logininfor` VALUES (161, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:10:27');
INSERT INTO `sys_logininfor` VALUES (162, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:10:43');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-29 21:10:49');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:10:56');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:23:25');
INSERT INTO `sys_logininfor` VALUES (166, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:23:34');
INSERT INTO `sys_logininfor` VALUES (167, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:24:12');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:24:17');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:38:59');
INSERT INTO `sys_logininfor` VALUES (170, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:39:08');
INSERT INTO `sys_logininfor` VALUES (171, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:39:36');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:39:47');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 22:05:13');
INSERT INTO `sys_logininfor` VALUES (174, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 22:05:23');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 10:46:47');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 10:47:26');
INSERT INTO `sys_logininfor` VALUES (177, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 10:47:35');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 10:49:12');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 10:49:20');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 10:55:01');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 10:55:13');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 11:04:28');
INSERT INTO `sys_logininfor` VALUES (183, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 11:04:37');
INSERT INTO `sys_logininfor` VALUES (184, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 11:05:37');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 11:05:43');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 11:54:40');
INSERT INTO `sys_logininfor` VALUES (187, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 11:54:50');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 12:13:10');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 13:46:36');
INSERT INTO `sys_logininfor` VALUES (190, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 13:46:48');
INSERT INTO `sys_logininfor` VALUES (191, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 13:48:46');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 13:48:52');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 13:48:56');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 13:49:05');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 16:29:57');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 18:55:21');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:25:10');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 13:35:11');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 18:11:49');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-31 19:07:23');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 19:07:27');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 22:18:40');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-31 23:42:08');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 12:02:31');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 12:55:32');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 14:35:11');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 15:27:34');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 18:33:33');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 10:36:16');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 13:55:08');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 14:21:38');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 15:58:40');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:16:57');
INSERT INTO `sys_logininfor` VALUES (214, '邓宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:17:07');
INSERT INTO `sys_logininfor` VALUES (215, '邓宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:17:52');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:17:57');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:18:30');
INSERT INTO `sys_logininfor` VALUES (218, '邓宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:18:41');
INSERT INTO `sys_logininfor` VALUES (219, '邓宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:32:29');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:32:33');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:49:51');
INSERT INTO `sys_logininfor` VALUES (222, '郭宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:50:03');
INSERT INTO `sys_logininfor` VALUES (223, '郭宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:50:19');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:50:24');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 17:51:15');
INSERT INTO `sys_logininfor` VALUES (226, '郭宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 17:51:28');
INSERT INTO `sys_logininfor` VALUES (227, '郭宇宁', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-02 18:01:37');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-02 18:01:43');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 20:52:28');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-03 21:22:43');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 21:22:55');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-03 21:23:17');
INSERT INTO `sys_logininfor` VALUES (233, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 21:23:28');
INSERT INTO `sys_logininfor` VALUES (234, '石岚', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-03 21:47:24');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 21:47:34');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 21:50:37');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-04 20:40:58');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 04:59:03');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 05:56:00');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 10:18:22');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 13:09:07');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-05 14:23:41');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 14:23:46');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 15:55:46');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 15:59:02');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-05 16:01:57');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 16:02:02');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '192.168.43.78', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 18:10:35');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 18:11:18');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-05 20:57:29');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-06 10:20:25');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-06 11:57:59');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-06 13:35:32');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-06 14:53:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-26 18:54:41', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 20:06:18', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 20:06:01', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-26 18:54:41', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-26 18:54:41', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-26 18:54:41', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '班级管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:30:34', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-26 18:54:41', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-26 18:54:41', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-26 18:54:41', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-26 18:54:41', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-03-26 18:54:41', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-26 18:54:41', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-26 18:54:41', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-26 18:54:41', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-26 18:54:41', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-26 18:54:41', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-26 18:54:41', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-26 18:54:41', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-26 18:54:41', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-03-26 18:54:41', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-03-26 18:54:41', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-03-26 18:54:41', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-03-26 18:54:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '在线编程', 0, 2, 'oj', 'oj/index', NULL, 1, 0, 'C', '0', '0', 'system:oj:list', 'code', 'admin', '2023-03-26 21:11:43', 'admin', '2023-03-29 21:34:51', '');
INSERT INTO `sys_menu` VALUES (2007, '课程管理', 0, 1, '/course', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'date', 'admin', '2023-03-27 22:55:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '课程', 2007, 1, 'course', 'course/index', NULL, 1, 0, 'C', '0', '0', 'system:course:list', '#', 'admin', '2023-03-27 23:07:43', '', NULL, '课程菜单');
INSERT INTO `sys_menu` VALUES (2009, '课程查询', 2008, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:course:query', '#', 'admin', '2023-03-27 23:07:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '课程新增', 2008, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:course:add', '#', 'admin', '2023-03-27 23:07:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '课程修改', 2008, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:course:edit', '#', 'admin', '2023-03-27 23:07:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '课程删除', 2008, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:course:remove', '#', 'admin', '2023-03-27 23:07:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '课程导出', 2008, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:course:export', '#', 'admin', '2023-03-27 23:07:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '章节', 2007, 1, 'chapter', 'chapter/index', NULL, 1, 0, 'C', '0', '0', 'chapter:chapter:list', '#', 'admin', '2023-03-28 09:53:35', 'admin', '2023-03-28 09:58:15', '章节菜单');
INSERT INTO `sys_menu` VALUES (2016, '章节查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'chapter:chapter:query', '#', 'admin', '2023-03-28 09:53:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '章节新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'chapter:chapter:add', '#', 'admin', '2023-03-28 09:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '章节修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'chapter:chapter:edit', '#', 'admin', '2023-03-28 09:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '章节删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'chapter:chapter:remove', '#', 'admin', '2023-03-28 09:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '章节导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'chapter:chapter:export', '#', 'admin', '2023-03-28 09:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '题目', 2007, 1, 'oj', 'oj/page', NULL, 1, 0, 'C', '0', '0', 'oj:oj:list', '#', 'admin', '2023-03-28 13:32:19', 'admin', '2023-03-28 13:34:17', '题目菜单');
INSERT INTO `sys_menu` VALUES (2022, '题目查询', 2021, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'oj:oj:query', '#', 'admin', '2023-03-28 13:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '题目新增', 2021, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'oj:oj:add', '#', 'admin', '2023-03-28 13:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '题目修改', 2021, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'oj:oj:edit', '#', 'admin', '2023-03-28 13:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '题目删除', 2021, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'oj:oj:remove', '#', 'admin', '2023-03-28 13:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '题目导出', 2021, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'oj:oj:export', '#', 'admin', '2023-03-28 13:32:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '代码列表', 0, 3, 'oj/list', 'oj/list', NULL, 1, 0, 'C', '0', '0', '', 'nested', 'admin', '2023-03-28 20:04:31', 'admin', '2023-03-28 20:05:43', '');
INSERT INTO `sys_menu` VALUES (2029, '我的课堂', 0, 4, 'classroom/classroom', 'classroom/classroom', NULL, 1, 0, 'C', '0', '0', NULL, 'education', 'admin', '2023-03-31 18:21:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '签到记录信息', 0, 8, 'signin/index', 'signin/index', NULL, 1, 0, 'C', '0', '0', 'signin:signin:list', 'log', 'admin', '2023-04-02 10:57:37', 'admin', '2023-04-02 11:06:44', '签到记录信息菜单');
INSERT INTO `sys_menu` VALUES (2031, '签到记录查询', 2030, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'signin:signin:query', '#', 'admin', '2023-04-02 10:57:38', 'admin', '2023-04-02 11:03:21', '');
INSERT INTO `sys_menu` VALUES (2032, '签到记录新增', 2030, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'signin:signin:add', '#', 'admin', '2023-04-02 10:57:38', 'admin', '2023-04-02 11:03:28', '');
INSERT INTO `sys_menu` VALUES (2033, '签到记录修改', 2030, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'signin:signin:edit', '#', 'admin', '2023-04-02 10:57:38', 'admin', '2023-04-02 11:03:34', '');
INSERT INTO `sys_menu` VALUES (2034, '签到记录删除', 2030, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'signin:signin:remove', '#', 'admin', '2023-04-02 10:57:38', 'admin', '2023-04-02 11:03:39', '');
INSERT INTO `sys_menu` VALUES (2035, '签到信息导出', 2030, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'signin:signin:export', '#', 'admin', '2023-04-02 10:57:38', 'admin', '2023-04-02 11:03:45', '');
INSERT INTO `sys_menu` VALUES (2036, '试卷管理', 0, 6, 'exam', 'exam/index', NULL, 1, 0, 'C', '0', '0', 'exam:exam:list', 'form', 'admin', '2023-04-05 06:10:22', 'admin', '2023-04-05 06:14:54', '试卷菜单');
INSERT INTO `sys_menu` VALUES (2037, '试卷查询', 2036, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'exam:exam:query', '#', 'admin', '2023-04-05 06:10:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '试卷新增', 2036, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'exam:exam:add', '#', 'admin', '2023-04-05 06:10:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '试卷修改', 2036, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'exam:exam:edit', '#', 'admin', '2023-04-05 06:10:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '试卷删除', 2036, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'exam:exam:remove', '#', 'admin', '2023-04-05 06:10:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '试卷导出', 2036, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'exam:exam:export', '#', 'admin', '2023-04-05 06:10:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-03-26 18:54:41', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-03-26 18:54:41', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 473 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"在线编程\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/oj\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:11:43', 25);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/oj\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:12:32', 15);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:14:39', 108);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dept\"}', NULL, 0, NULL, '2023-03-26 21:14:44', 227);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/oj/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:18:10', 12);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/index\",\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/oj/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:24:06', 9);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"oj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:27:36', 19);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:27:41', 12);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"oj\"}', NULL, 0, NULL, '2023-03-26 21:27:45', 27);
INSERT INTO `sys_oper_log` VALUES (109, '【请填写功能名称】', 1, 'com.ruoyi.oj.controller.OjController.add()', 'POST', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\oj\\OjMapper.xml]\r\n### The error may involve com.ruoyi.oj.mapper.OjMapper.insertOj-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into oj\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-03-26 21:49:34', 53);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"oj\",\"perms\":\"system:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:56:07', 22);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/index\",\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"oj\",\"perms\":\"system:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-26 21:56:49', 9);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"comments,so,cs,chapter,course\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:47:15', 147);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/oj', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:47:26', 33);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/oj', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:48:43', 33);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chapter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:49:24', 21);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/comments', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:49:27', 21);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:51:39', 22);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"课程管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/course\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:55:17', 15);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:51:38\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:51:38\",\"usableColumn\":false},{\"capJavaField\":\"Teacher\",\"columnComment\":\"教师id\",\"columnId\":25,\"columnName\":\"teacher\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"teacher\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:51:38\",\"usableColumn\":false},{\"capJavaField\":\"Introduce\",\"columnComment\":\"课程介绍\",\"columnId\":37,\"columnName\":\"introduce\",\"columnType\":\"varchar(500)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:51:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:56:28', 22);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:57:58', 27);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:57:58\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:57:58\",\"usableColumn\":false},{\"capJavaField\":\"Teacher\",\"columnComment\":\"教师id\",\"columnId\":25,\"columnName\":\"teacher\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"teacher\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:57:58\",\"usableColumn\":false},{\"capJavaField\":\"Introduce\",\"columnComment\":\"课程介绍\",\"columnId\":37,\"columnName\":\"introduce\",\"columnType\":\"varchar(500)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:51:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 22:58:40', 18);
INSERT INTO `sys_oper_log` VALUES (122, '课程', 1, 'com.ruoyi.course.controller.CourseController.add()', 'POST', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"数据库是程序设计的基础\",\"name\":\"数据库程序设计\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 23:08:55', 91);
INSERT INTO `sys_oper_log` VALUES (123, '课程', 1, 'com.ruoyi.course.controller.CourseController.add()', 'POST', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":2,\"introduce\":\"javaEE\",\"name\":\"javaWeb框架技术\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-27 23:09:59', 7);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2007,2008,2009,2010,2011,2012,2013,2000,2002,2003,2004,2005,2006,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"教师\",\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:21:38', 47);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2003,2004,2005,2006],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:22:08', 19);
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"100\",\"userIds\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:23:02', 6);
INSERT INTO `sys_oper_log` VALUES (127, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"华东交通大学\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:26:56', 21);
INSERT INTO `sys_oper_log` VALUES (128, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"华东交通大学\",\"email\":\"ry@qq.com\",\"leader\":\"校长\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:27:11', 14);
INSERT INTO `sys_oper_log` VALUES (129, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"软件学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"华东交通大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:27:43', 27);
INSERT INTO `sys_oper_log` VALUES (130, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"计算机学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"华东交通大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:28:09', 22);
INSERT INTO `sys_oper_log` VALUES (131, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"软件学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:28:32', 20);
INSERT INTO `sys_oper_log` VALUES (132, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"软件开发2班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"软件学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:28:49', 19);
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"软件开发3班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"软件学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:29:01', 19);
INSERT INTO `sys_oper_log` VALUES (134, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"软件开发4班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"软件学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:29:14', 20);
INSERT INTO `sys_oper_log` VALUES (135, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"网络安全1班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"软件学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:29:27', 21);
INSERT INTO `sys_oper_log` VALUES (136, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"2020级1班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:29:43', 24);
INSERT INTO `sys_oper_log` VALUES (137, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"2020级2班\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:30:00', 20);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-03-26 18:54:41\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:30:34', 12);
INSERT INTO `sys_oper_log` VALUES (139, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"教师\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:32:00', 11);
INSERT INTO `sys_oper_log` VALUES (140, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"教师\",\"orderNum\":0,\"params\":{},\"parentId\":102,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:32:14', 11);
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":200,\"deptName\":\"软件学院教师\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"parentName\":\"软件学院\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:33:46', 19);
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":201,\"deptName\":\"计算机学院教师\",\"orderNum\":0,\"params\":{},\"parentId\":102,\"parentName\":\"计算机学院\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:33:58', 26);
INSERT INTO `sys_oper_log` VALUES (143, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"email\":\"1580575248@qq.com\",\"nickName\":\"lhy\",\"params\":{},\"phonenumber\":\"18870745179\",\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"罗鸿运\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:39:32', 83);
INSERT INTO `sys_oper_log` VALUES (144, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"校长\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:43:33', 15);
INSERT INTO `sys_oper_log` VALUES (145, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"副校长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:45:45', 10);
INSERT INTO `sys_oper_log` VALUES (146, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":3,\"postName\":\"教师\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:46:08', 14);
INSERT INTO `sys_oper_log` VALUES (147, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"student\",\"postId\":4,\"postName\":\"学生\",\"postSort\":4,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:46:26', 9);
INSERT INTO `sys_oper_log` VALUES (148, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"headmaster\",\"postId\":1,\"postName\":\"校长\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:46:54', 8);
INSERT INTO `sys_oper_log` VALUES (149, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"vice-principal\",\"postId\":2,\"postName\":\"副校长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:47:13', 9);
INSERT INTO `sys_oper_log` VALUES (150, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":102,\"roleKey\":\"guest\",\"roleName\":\"游客\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:48:16', 13);
INSERT INTO `sys_oper_log` VALUES (151, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 08:39:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":200,\"deptName\":\"软件学院教师\",\"orderNum\":0,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"1580575248@qq.com\",\"loginIp\":\"\",\"nickName\":\"lhy\",\"params\":{},\"phonenumber\":\"18870745179\",\"postIds\":[3],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"罗鸿运\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:49:57', 26);
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"软件开发3班\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-03-26 18:54:41\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"三好学生\",\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 08:50:43', 20);
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@163.com\",\"loginDate\":\"2023-03-28 07:30:21\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1,100],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2023-03-28 08:55:47', 1);
INSERT INTO `sys_oper_log` VALUES (154, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"tutor\",\"postId\":5,\"postName\":\"助教\",\"postSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:10:26', 11);
INSERT INTO `sys_oper_log` VALUES (155, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-03-26 18:54:41\",\"flag\":false,\"params\":{},\"postCode\":\"student\",\"postId\":4,\"postName\":\"学生\",\"postSort\":5,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:10:33', 11);
INSERT INTO `sys_oper_log` VALUES (156, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"monitor\",\"postId\":6,\"postName\":\"班长\",\"postSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:11:40', 8);
INSERT INTO `sys_oper_log` VALUES (157, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.add()', 'POST', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"leader\",\"postId\":7,\"postName\":\"小组长\",\"postSort\":7,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:12:40', 9);
INSERT INTO `sys_oper_log` VALUES (158, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"11\",\"params\":{},\"phonenumber\":\"18807774574\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":112,\"userName\":\"1111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:31:14', 74);
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/112', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:31:23', 11);
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"lshi@gmail.com\",\"loginIp\":\"\",\"nickName\":\"Ricky\",\"params\":{},\"phonenumber\":\"18870745175\",\"postIds\":[4],\"roleIds\":[101],\"roles\":[],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"石岚\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:32:11', 18);
INSERT INTO `sys_oper_log` VALUES (161, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"电气学院\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:33:54', 8);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"章节\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"capter\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:39:19', 11);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chapter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:41:50', 32);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-28 09:39:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"章节\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:42:04', 8);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chapter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:42:37', 20);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chapter\",\"className\":\"Chapter\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"章节编号\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 09:42:37\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"章节名称\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 09:42:37\",\"usableColumn\":false},{\"capJavaField\":\"Courseid\",\"columnComment\":\"课程id\",\"columnId\":18,\"columnName\":\"courseid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 09:42:37\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"chapter\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"chapter\",\"options\":\"{\\\"parentMenuId\\\":2014}\",\"packageName\":\"com.ruoyi.chapter\",\"params\":{\"parentMenuId\":2014},\"parentMenuId\":\"2014\",\"sub\":false,\"tableComment\":\"章节\",\"tableId\":3,\"tableName\":\"chapter\",\"tplCategory\":\"crud\",\"t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:43:45', 23);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-28 09:39:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"章节\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:54:16', 8);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chapter\",\"createTime\":\"2023-03-28 09:39:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"章节\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:54:41', 9);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chapter/index\",\"createTime\":\"2023-03-28 09:39:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"章节\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:54:54', 8);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chapter/index\",\"createTime\":\"2023-03-28 09:39:19\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"章节\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"system:chapter:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:55:12', 7);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chapter/chapter/index\",\"createTime\":\"2023-03-28 09:53:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"chapter\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"chapter:chapter:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:57:03', 25);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2014', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:57:10', 15);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chapter/chapter/index\",\"createTime\":\"2023-03-28 09:53:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"章节\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"chapter:chapter:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:57:23', 14);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"chapter/index\",\"createTime\":\"2023-03-28 09:53:35\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"章节\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"chapter\",\"perms\":\"chapter:chapter:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 09:58:15', 10);
INSERT INTO `sys_oper_log` VALUES (175, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:09:45', 99);
INSERT INTO `sys_oper_log` VALUES (176, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":2,\"name\":\"第二章-Python语言基础\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:10:18', 6);
INSERT INTO `sys_oper_log` VALUES (177, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":3,\"name\":\"第三章-运算符与表达式\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:10:39', 6);
INSERT INTO `sys_oper_log` VALUES (178, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":4,\"name\":\"第四章-流程控制语句\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:11:10', 7);
INSERT INTO `sys_oper_log` VALUES (179, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":5,\"name\":\"第五章-列表与元组\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:11:34', 5);
INSERT INTO `sys_oper_log` VALUES (180, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":6,\"name\":\"第六章-字典与集合\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:11:55', 6);
INSERT INTO `sys_oper_log` VALUES (181, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":7,\"name\":\"第七章-字符串\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:12:14', 7);
INSERT INTO `sys_oper_log` VALUES (182, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":8,\"name\":\"第八章-Python中使用正则表达式\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:12:57', 7);
INSERT INTO `sys_oper_log` VALUES (183, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":9,\"name\":\"第九章-函数\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:13:21', 6);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chapter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:15:38', 54);
INSERT INTO `sys_oper_log` VALUES (185, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:21:32', 3);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chapter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:22:38', 35);
INSERT INTO `sys_oper_log` VALUES (187, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:25:34', 12);
INSERT INTO `sys_oper_log` VALUES (188, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":2,\"name\":\"第二章-Python语言基础\",\"orderNum\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:27:04', 6);
INSERT INTO `sys_oper_log` VALUES (189, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":3,\"name\":\"第三章-运算符与表达式\",\"orderNum\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:27:09', 6);
INSERT INTO `sys_oper_log` VALUES (190, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":4,\"name\":\"第四章-流程控制语句\",\"orderNum\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:27:50', 6);
INSERT INTO `sys_oper_log` VALUES (191, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":5,\"name\":\"第五章-列表与元组\",\"orderNum\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:27:55', 7);
INSERT INTO `sys_oper_log` VALUES (192, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":6,\"name\":\"第六章-字典与集合\",\"orderNum\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:28:00', 6);
INSERT INTO `sys_oper_log` VALUES (193, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":7,\"name\":\"第七章-字符串\",\"orderNum\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:28:06', 6);
INSERT INTO `sys_oper_log` VALUES (194, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":8,\"name\":\"第八章-Python中使用正则表达式\",\"orderNum\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:28:14', 6);
INSERT INTO `sys_oper_log` VALUES (195, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":9,\"name\":\"第九章-函数\",\"orderNum\":9,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 10:28:18', 7);
INSERT INTO `sys_oper_log` VALUES (196, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 11:22:37', 13);
INSERT INTO `sys_oper_log` VALUES (197, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 11:22:42', 6);
INSERT INTO `sys_oper_log` VALUES (198, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":8,\"name\":\"第八章-Python中使用正则表达式\",\"orderNum\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:06:18', 16);
INSERT INTO `sys_oper_log` VALUES (199, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":8,\"name\":\"第八章-Python中使用正则表达式\",\"orderNum\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:06:31', 7);
INSERT INTO `sys_oper_log` VALUES (200, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:31:19', 7);
INSERT INTO `sys_oper_log` VALUES (201, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:31:29', 5);
INSERT INTO `sys_oper_log` VALUES (202, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:33:07', 6);
INSERT INTO `sys_oper_log` VALUES (203, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:33:18', 6);
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"comments,oj\"}', NULL, 0, NULL, '2023-03-28 12:38:15', 213);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comments\",\"className\":\"Comments\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"评论编号\",\"columnId\":19,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:49:27\",\"usableColumn\":false},{\"capJavaField\":\"Sid\",\"columnComment\":\"学生id,或者老师id\",\"columnId\":20,\"columnName\":\"sid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:49:27\",\"usableColumn\":false},{\"capJavaField\":\"Oid\",\"columnComment\":\"题目id\",\"columnId\":21,\"columnName\":\"oid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:49:27\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"评论内容\",\"columnId\":22,\"columnName\":\"content\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"conte', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:41:45', 41);
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"oj\",\"className\":\"Oj\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 21:27:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:48:43\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:48:43\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度(简单，中等，困难)\",\"columnId\":33,\"columnName\":\"difficulty\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"difficulty\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:48:43\",\"usableColumn\":false},{\"capJavaField\":\"Like\",\"columnComment\":\"点赞\",\"columnId\":34,\"columnName\":\"like\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"like\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:42:19', 31);
INSERT INTO `sys_oper_log` VALUES (207, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":10,\"name\":\"第1章 初始MyBatis框架\",\"orderNum\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:51:19', 94);
INSERT INTO `sys_oper_log` VALUES (208, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":11,\"name\":\"第2章 MyBatis的核心配置\",\"orderNum\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:51:46', 7);
INSERT INTO `sys_oper_log` VALUES (209, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":12,\"name\":\"第3章 动态SQL\",\"orderNum\":0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:52:18', 7);
INSERT INTO `sys_oper_log` VALUES (210, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":13,\"name\":\"第4章 MyBatis的关系映射和缓冲机制\",\"orderNum\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:53:05', 7);
INSERT INTO `sys_oper_log` VALUES (211, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"courseid\":2,\"id\":12,\"name\":\"第3章 动态SQL\",\"orderNum\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:53:10', 8);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/chapter', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:56:11', 64);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chapter\",\"className\":\"Chapter\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"章节编号\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 12:56:11\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"章节名称\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 12:56:11\",\"usableColumn\":false},{\"capJavaField\":\"Courseid\",\"columnComment\":\"课程id\",\"columnId\":18,\"columnName\":\"courseid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 12:56:11\",\"usableColumn\":false},{\"capJavaField\":\"OrderNum\",\"columnComment\":\"显示顺序\",\"columnId\":40,\"columnName\":\"orderNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 10:22:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaFiel', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 12:56:47', 51);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"chapter\",\"className\":\"Chapter\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"章节编号\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 12:56:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"章节名称\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 12:56:47\",\"usableColumn\":false},{\"capJavaField\":\"Courseid\",\"columnComment\":\"课程id\",\"columnId\":18,\"columnName\":\"courseid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 12:56:47\",\"usableColumn\":false},{\"capJavaField\":\"OrderNum\",\"columnComment\":\"显示顺序\",\"columnId\":40,\"columnName\":\"orderNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 10:22:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaFiel', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:00:13', 32);
INSERT INTO `sys_oper_log` VALUES (215, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":14,\"name\":\"1.1 Python介绍\",\"params\":{},\"parentid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:08:39', 93);
INSERT INTO `sys_oper_log` VALUES (216, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":1,\"name\":\"第一章-初始Python\",\"orderNum\":1,\"params\":{},\"parentid\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:16:52', 6);
INSERT INTO `sys_oper_log` VALUES (217, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":14,\"name\":\"1.1 Python介绍\",\"orderNum\":1,\"params\":{},\"parentid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:20:13', 6);
INSERT INTO `sys_oper_log` VALUES (218, 'chapter', 2, 'com.ruoyi.chapter.controller.ChapterController.edit()', 'PUT', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":14,\"name\":\"1.1 Python简介\",\"orderNum\":1,\"params\":{},\"parentid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:20:45', 6);
INSERT INTO `sys_oper_log` VALUES (219, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":15,\"name\":\"1.2搭建Python开发环境\",\"orderNum\":2,\"params\":{},\"parentid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:21:24', 6);
INSERT INTO `sys_oper_log` VALUES (220, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":16,\"name\":\"1.1.1什么是Python\",\"orderNum\":1,\"params\":{},\"parentid\":14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:22:05', 6);
INSERT INTO `sys_oper_log` VALUES (221, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":17,\"name\":\"1.1.2Python的版本\",\"orderNum\":2,\"params\":{},\"parentid\":14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:22:29', 7);
INSERT INTO `sys_oper_log` VALUES (222, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":18,\"name\":\"1.1.3Python能做什么\",\"orderNum\":3,\"params\":{},\"parentid\":14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:22:51', 7);
INSERT INTO `sys_oper_log` VALUES (223, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":19,\"name\":\"1.2.1开发环境概述\",\"orderNum\":1,\"params\":{},\"parentid\":15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:23:18', 7);
INSERT INTO `sys_oper_log` VALUES (224, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":20,\"name\":\"2.1Python语法特点\",\"orderNum\":1,\"params\":{},\"parentid\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:24:08', 6);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/oj/page\",\"createTime\":\"2023-03-28 13:32:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"oj\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"oj\",\"perms\":\"oj:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:33:24', 18);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/oj/page\",\"createTime\":\"2023-03-28 13:32:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"oj\",\"perms\":\"oj:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:33:44', 9);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/page\",\"createTime\":\"2023-03-28 13:32:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"oj\",\"perms\":\"oj:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:34:17', 11);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/oj', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 13:43:05', 182);
INSERT INTO `sys_oper_log` VALUES (229, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":16,\"description\":\"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\\n\\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\\n\\n你可以按任意顺序返回答案。\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 15:46:11', 15);
INSERT INTO `sys_oper_log` VALUES (230, '课程', 5, 'com.ruoyi.course.controller.CourseController.export()', 'POST', 1, 'admin', NULL, '/course/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-03-28 16:27:35', 769);
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"testcase\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:43:32', 60);
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"testcase\",\"className\":\"Testcase\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"测试编号\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Testcases\",\"columnComment\":\"测试用例\",\"columnId\":44,\"columnName\":\"testcases\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"testcases\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Answer\",\"columnComment\":\"每个测试用例对应的答案\",\"columnId\":45,\"columnName\":\"answer\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"answer\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Oid\",\"columnComment\":\"题目id\",\"columnId\":46,\"columnName\":\"oid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:45:31', 41);
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"oj\",\"className\":\"Oj\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 21:27:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 13:43:05\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 13:43:05\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度(简单，中等，困难)\",\"columnId\":33,\"columnName\":\"difficulty\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"difficulty\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 13:43:05\",\"usableColumn\":false},{\"capJavaField\":\"LikeNum\",\"columnComment\":\"点赞\",\"columnId\":42,\"columnName\":\"likeNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 13:43:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"l', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 16:53:36', 31);
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"oj\",\"className\":\"Oj\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 21:27:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:53:36\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:53:36\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度(简单，中等，困难)\",\"columnId\":33,\"columnName\":\"difficulty\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"difficulty\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 16:53:36\",\"usableColumn\":false},{\"capJavaField\":\"LikeNum\",\"columnComment\":\"点赞\",\"columnId\":42,\"columnName\":\"likeNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 13:43:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"l', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:17:04', 26);
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/oj', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:17:14', 30);
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/testcase', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:17:17', 27);
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"oj\",\"className\":\"Oj\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 21:27:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:14\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:14\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度(简单，中等，困难)\",\"columnId\":33,\"columnName\":\"difficulty\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"difficulty\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:14\",\"usableColumn\":false},{\"capJavaField\":\"LikeNum\",\"columnComment\":\"点赞\",\"columnId\":42,\"columnName\":\"likeNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 13:43:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"l', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:17:22', 20);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"testcase\",\"className\":\"Testcase\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"测试编号\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:17\",\"usableColumn\":false},{\"capJavaField\":\"Testcases\",\"columnComment\":\"测试用例\",\"columnId\":44,\"columnName\":\"testcases\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"testcases\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:17\",\"usableColumn\":false},{\"capJavaField\":\"Answer\",\"columnComment\":\"每个测试用例对应的答案\",\"columnId\":45,\"columnName\":\"answer\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"answer\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:17\",\"usableColumn\":false},{\"capJavaField\":\"Oid\",\"columnComment\":\"题目id\",\"columnId\":46,\"columnName\":\"oid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 16:43:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:20:40', 24);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"oj\",\"className\":\"Oj\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 21:27:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:22\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:22\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度(简单，中等，困难)\",\"columnId\":33,\"columnName\":\"difficulty\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"difficulty\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:17:22\",\"usableColumn\":false},{\"capJavaField\":\"LikeNum\",\"columnComment\":\"点赞\",\"columnId\":42,\"columnName\":\"likeNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 13:43:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"l', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:20:51', 22);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"oj\",\"className\":\"Oj\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-26 21:27:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:20:51\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":32,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:20:51\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度(简单，中等，困难)\",\"columnId\":33,\"columnName\":\"difficulty\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:47:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"difficulty\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-03-28 17:20:51\",\"usableColumn\":false},{\"capJavaField\":\"LikeNum\",\"columnComment\":\"点赞\",\"columnId\":42,\"columnName\":\"likeNum\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-03-28 13:43:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"l', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:21:12', 22);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/testcase', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:22:28', 22);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/oj', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:22:32', 30);
INSERT INTO `sys_oper_log` VALUES (243, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":16,\"description\":\"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\\n\\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\\n\\n你可以按任意顺序返回答案。\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"testcaseList\":[{\"answer\":\"[0,1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1,2,3]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:40:02', 115);
INSERT INTO `sys_oper_log` VALUES (244, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":16,\"description\":\"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\\n\\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\\n\\n你可以按任意顺序返回答案。\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"testcaseList\":[{\"answer\":\"[0,1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1,2,3]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"},{\"answer\":\"11\",\"mark\":\"\",\"oid\":1,\"params\":{},\"testcases\":\"11\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:40:54', 13);
INSERT INTO `sys_oper_log` VALUES (245, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":16,\"description\":\"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\\n\\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\\n\\n你可以按任意顺序返回答案。\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"testcaseList\":[{\"answer\":\"[0,1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1,2,3]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:40:59', 12);
INSERT INTO `sys_oper_log` VALUES (246, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":16,\"description\":\"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\\n\\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\\n\\n你可以按任意顺序返回答案。\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"testcaseList\":[{\"answer\":\"[0,1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1,2,3]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 17:47:48', 13);
INSERT INTO `sys_oper_log` VALUES (247, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"数据库是程序设计的基础\",\"name\":\"Python程序设计\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:05:51', 8);
INSERT INTO `sys_oper_log` VALUES (248, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"name\":\"Python程序设计\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:06:07', 6);
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:58:40\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:58:40\",\"usableColumn\":false},{\"capJavaField\":\"Teacher\",\"columnComment\":\"教师id\",\"columnId\":25,\"columnName\":\"teacher\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"teacher\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-27 22:58:40\",\"usableColumn\":false},{\"capJavaField\":\"Introduce\",\"columnComment\":\"课程介绍\",\"columnId\":37,\"columnName\":\"introduce\",\"columnType\":\"varchar(500)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:51:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:07:13', 41);
INSERT INTO `sys_oper_log` VALUES (250, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/QQ图片20221108224418_20230328180936A001.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:09:41', 6);
INSERT INTO `sys_oper_log` VALUES (251, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":2,\"introduce\":\"javaEE\",\"name\":\"javaWeb框架技术\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/QQ图片20221108224413_20230328180957A002.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:09:58', 6);
INSERT INTO `sys_oper_log` VALUES (252, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:16:10', 6);
INSERT INTO `sys_oper_log` VALUES (253, '课程', 1, 'com.ruoyi.course.controller.CourseController.add()', 'POST', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":3,\"name\":\"毛泽东思想和中国特色社会主义理论体系概论\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/maogai_20230328184618A004.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:46:20', 9);
INSERT INTO `sys_oper_log` VALUES (254, '课程', 1, 'com.ruoyi.course.controller.CourseController.add()', 'POST', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":4,\"name\":\"操作系统\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/caozxt_20230328184634A005.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:46:35', 5);
INSERT INTO `sys_oper_log` VALUES (255, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":2,\"introduce\":\"javaEE\",\"name\":\"javaWeb框架技术\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/hello_20230328184832A006.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 18:48:33', 7);
INSERT INTO `sys_oper_log` VALUES (256, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"so\",\"className\":\"So\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":29,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sid\",\"columnComment\":\"学生id\",\"columnId\":30,\"columnName\":\"sid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Oid\",\"columnComment\":\"题目id\",\"columnId\":31,\"columnName\":\"oid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"oid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"学生刷题\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"学生刷题表\",\"tableId\":7,\"tableName\":\"so\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 19:57:19', 42);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/list\",\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"代码列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"oj/list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:04:31', 18);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/index\",\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"oj\",\"perms\":\"system:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:05:19', 10);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/list\",\"createTime\":\"2023-03-28 20:04:31\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"代码列表\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"oj/list\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:05:43', 14);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-26 18:54:41\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:06:01', 9);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-26 18:54:41\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:06:05', 14);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-26 18:54:41\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:06:18', 12);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-26 18:54:41\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 20:06:23', 11);
INSERT INTO `sys_oper_log` VALUES (264, 'oj', 1, 'com.ruoyi.oj.controller.OjController.add()', 'POST', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"code\":\"# Definition for singly-linked list.\\n# class ListNode(object):\\n#     def __init__(self, val=0, next=None):\\n#         self.val = val\\n#         self.next = next\\nclass Solution(object):\\n    def addTwoNumbers(self, l1, l2):\\n        \\\"\\\"\\\"\\n        :type l1: ListNode\\n        :type l2: ListNode\\n        :rtype: ListNode\\n        \\\"\\\"\\\"\",\"description\":\"<p>给你两个&nbsp;非空 的链表，表示两个非负的整数。它们每位数字都是按照&nbsp;逆序&nbsp;的方式存储的，并且每个节点只能存储&nbsp;一位&nbsp;数字。</p><p><br></p><p>请你将两个数相加，并以相同形式返回一个表示和的链表。</p><p><br></p><p>你可以假设除了数字 0 之外，这两个数都不会以 0&nbsp;开头。</p>\",\"difficulty\":\"简单\",\"id\":2,\"params\":{},\"testcaseList\":[{\"answer\":\"[7,0,8]\",\"mark\":\"342 + 465 = 807.\",\"oid\":2,\"params\":{},\"testcases\":\"[2,4,3]\\n[5,6,4]\"}],\"title\":\"两数相加\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:13:04', 23);
INSERT INTO `sys_oper_log` VALUES (265, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"code\":\"# Definition for singly-linked list.\\n# class ListNode(object):\\n#     def __init__(self, val=0, next=None):\\n#         self.val = val\\n#         self.next = next\\nclass Solution(object):\\n    def addTwoNumbers(self, l1, l2):\\n        \\\"\\\"\\\"\\n        :type l1: ListNode\\n        :type l2: ListNode\\n        :rtype: ListNode\\n        \\\"\\\"\\\"\",\"description\":\"<p>给你两个&nbsp;非空 的链表，表示两个非负的整数。它们每位数字都是按照&nbsp;逆序&nbsp;的方式存储的，并且每个节点只能存储&nbsp;一位&nbsp;数字。</p><p><br></p><p>请你将两个数相加，并以相同形式返回一个表示和的链表。</p><p><br></p><p>你可以假设除了数字 0 之外，这两个数都不会以 0&nbsp;开头。</p><p><img src=\\\"/dev-api/profile/upload/2023/03/28/addtwonumber1_20230328211341A001.jpg\\\"></p>\",\"difficulty\":\"简单\",\"id\":2,\"params\":{},\"testcaseList\":[{\"answer\":\"[7,0,8]\",\"id\":6,\"mark\":\"342 + 465 = 807.\",\"oid\":2,\"params\":{},\"testcases\":\"[2,4,3]\\n[5,6,4]\"}],\"title\":\"两数相加\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:13:47', 13);
INSERT INTO `sys_oper_log` VALUES (266, 'oj', 1, 'com.ruoyi.oj.controller.OjController.add()', 'POST', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"description\":\"<p>给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。</p><p><br></p><p>如果反转后整数超过 32 位的有符号整数的范围&nbsp;[−231,&nbsp; 231&nbsp;− 1] ，就返回 0。</p><p><br></p><p><strong>假设环境不允许存储 64 位整数（有符号或无符号）。</strong></p><p><br></p>\",\"difficulty\":\"中等\",\"id\":3,\"params\":{},\"testcaseList\":[{\"answer\":\"321\",\"mark\":\"123反转后是321\",\"oid\":3,\"params\":{},\"testcases\":\"123\"},{\"answer\":\"-321\",\"mark\":\"-123反转后是-321\",\"oid\":3,\"params\":{},\"testcases\":\"-123\"}],\"title\":\"整数反转\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:32:55', 114);
INSERT INTO `sys_oper_log` VALUES (267, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"code\":\"class Solution(object):\\n    def reverse(self, x):\\n        \\\"\\\"\\\"\\n        :type x: int\\n        :rtype: int\\n        \\\"\\\"\\\"\",\"description\":\"<p>给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。</p><p><br></p><p>如果反转后整数超过 32 位的有符号整数的范围&nbsp;[−231,&nbsp; 231&nbsp;− 1] ，就返回 0。</p><p><br></p><p><strong>假设环境不允许存储 64 位整数（有符号或无符号）。</strong></p>\",\"difficulty\":\"中等\",\"id\":3,\"params\":{},\"testcaseList\":[{\"answer\":\"321\",\"id\":7,\"mark\":\"123反转后是321\",\"oid\":3,\"params\":{},\"testcases\":\"123\"},{\"answer\":\"-321\",\"id\":8,\"mark\":\"-123反转后是-321\",\"oid\":3,\"params\":{},\"testcases\":\"-123\"}],\"title\":\"整数反转\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:34:11', 18);
INSERT INTO `sys_oper_log` VALUES (268, 'oj', 1, 'com.ruoyi.oj.controller.OjController.add()', 'POST', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"code\":\"class Solution(object):\\n    def trap(self, height):\\n        \\\"\\\"\\\"\\n        :type height: List[int]\\n        :rtype: int\\n        \\\"\\\"\\\"\",\"description\":\"<p><span style=\\\"color: rgb(38, 38, 38);\\\">给定&nbsp;</span><code style=\\\"color: rgba(var(--grey-7-rgb),1);\\\">n</code><span style=\\\"color: rgb(38, 38, 38);\\\">&nbsp;个非负整数表示每个宽度为&nbsp;</span><code style=\\\"color: rgba(var(--grey-7-rgb),1);\\\">1</code><span style=\\\"color: rgb(38, 38, 38);\\\">&nbsp;的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。</span></p><p><span style=\\\"color: rgb(38, 38, 38);\\\"><span class=\\\"ql-cursor\\\">﻿</span></span><img src=\\\"/dev-api/profile/upload/2023/03/28/rainwatertrap_20230328213545A001.png\\\"></p>\",\"difficulty\":\"困难\",\"id\":4,\"params\":{},\"testcaseList\":[{\"answer\":\"6\",\"mark\":\"上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。\",\"oid\":4,\"params\":{},\"testcases\":\"[0,1,0,2,1,0,1,3,2,1,2,1]\"},{\"answer\":\"9\",\"mark\":\"\",\"oid\":4,\"params\":{},\"testcases\":\"[4,2,0,3,2,5]\"}],\"title\":\"接雨水\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-28 21:36:31', 13);
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:27:36', 103);
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"\",\"columnId\":23,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 20:27:36\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 20:27:36\",\"usableColumn\":false},{\"capJavaField\":\"Teacher\",\"columnComment\":\"教师id\",\"columnId\":25,\"columnName\":\"teacher\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-27 22:47:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"teacher\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-03-29 20:27:36\",\"usableColumn\":false},{\"capJavaField\":\"Introduce\",\"columnComment\":\"课程介绍\",\"columnId\":37,\"columnName\":\"introduce\",\"columnType\":\"varchar(500)\",\"createBy\":\"\",\"createTime\":\"2023-03-27 22:51:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:28:21', 125);
INSERT INTO `sys_oper_log` VALUES (271, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:35:15', 28);
INSERT INTO `sys_oper_log` VALUES (272, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:35:22', 13);
INSERT INTO `sys_oper_log` VALUES (273, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:38:21', 5);
INSERT INTO `sys_oper_log` VALUES (274, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:38:26', 6);
INSERT INTO `sys_oper_log` VALUES (275, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:39:18', 5);
INSERT INTO `sys_oper_log` VALUES (276, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:39:23', 6);
INSERT INTO `sys_oper_log` VALUES (277, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:43:58', 6);
INSERT INTO `sys_oper_log` VALUES (278, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":2,\"introduce\":\"javaEE\",\"ispublic\":0,\"name\":\"javaWeb框架技术\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/hello_20230328184832A006.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:46:07', 11);
INSERT INTO `sys_oper_log` VALUES (279, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":2,\"introduce\":\"javaEE\",\"ispublic\":1,\"name\":\"javaWeb框架技术\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/hello_20230328184832A006.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:46:14', 10);
INSERT INTO `sys_oper_log` VALUES (280, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:47:19', 15);
INSERT INTO `sys_oper_log` VALUES (281, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:47:26', 17);
INSERT INTO `sys_oper_log` VALUES (282, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:51:54', 8);
INSERT INTO `sys_oper_log` VALUES (283, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 20:51:59', 10);
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:09:26', 143);
INSERT INTO `sys_oper_log` VALUES (285, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:22:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:11:20', 36);
INSERT INTO `sys_oper_log` VALUES (286, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 09:32:37\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"lshi@gmail.com\",\"loginDate\":\"2023-03-29 21:10:28\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Ricky\",\"params\":{},\"phonenumber\":\"18870745175\",\"postIds\":[4],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"石岚\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:12:01', 53);
INSERT INTO `sys_oper_log` VALUES (287, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:22:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2002,2027],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:13:09', 41);
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createBy\":\"admin\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:15:07', 30);
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-03-29 21:15:07\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"首页1\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:21:16', 32);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-03-29 21:15:07\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"首页1\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"perms\":\"index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:22:10', 14);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-03-29 21:15:07\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"perms\":\"index\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:22:21', 14);
INSERT INTO `sys_oper_log` VALUES (292, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:22:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2028,2002,2027],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:22:35', 40);
INSERT INTO `sys_oper_log` VALUES (293, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 09:32:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"cal10@yahoo.com\",\"loginIp\":\"\",\"nickName\":\"Jean\",\"params\":{},\"phonenumber\":\"18875421145\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"蔡岚\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:23:10', 40);
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:33:02', 11);
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:33:16', 13);
INSERT INTO `sys_oper_log` VALUES (296, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:22:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2028,2027],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:33:31', 31);
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:33:40', 12);
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:33:44', 7);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:33:48', 10);
INSERT INTO `sys_oper_log` VALUES (300, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:21:38\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2008,2009,2010,2011,2012,2013,3,115,116,1055,1056,1057,1058,1059,1060,117,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"remark\":\"教师\",\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:05', 41);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:13', 12);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:18', 18);
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:22', 16);
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:26', 18);
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:30', 16);
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"oj/index\",\"createTime\":\"2023-03-26 21:11:43\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"在线编程\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"oj\",\"perms\":\"system:oj:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:34:51', 14);
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-03-29 21:15:07\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:35:11', 14);
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-03-29 21:40:01', 12);
INSERT INTO `sys_oper_log` VALUES (309, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:22:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2027],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:40:17', 51);
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:40:27', 17);
INSERT INTO `sys_oper_log` VALUES (311, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:22:08\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2027],\"params\":{},\"remark\":\"学生\",\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:40:46', 29);
INSERT INTO `sys_oper_log` VALUES (312, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-28 08:21:38\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2009,2010,2011,2012,2013,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2000,2027,3,115,116,1055,1056,1057,1058,1059,1060,117,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"教师\",\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:41:09', 37);
INSERT INTO `sys_oper_log` VALUES (313, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-26 18:54:41\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,115,116,1055,1056,1057,1058,1059,1060,117,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:41:16', 41);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-29 21:41:40', 17);
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 13:44:40', 18);
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 13:44:45', 6);
INSERT INTO `sys_oper_log` VALUES (317, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"101,100,2,102\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 13:45:11', 41);
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, '石岚', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"101\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 13:47:18', 12);
INSERT INTO `sys_oper_log` VALUES (319, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:19:24', 15);
INSERT INTO `sys_oper_log` VALUES (320, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:19:38', 3);
INSERT INTO `sys_oper_log` VALUES (321, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:21:59', 16);
INSERT INTO `sys_oper_log` VALUES (322, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":2,\"introduce\":\"javaEE\",\"ispublic\":1,\"name\":\"javaWeb框架技术\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/hello_20230328184832A006.jpg\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:44:21', 10);
INSERT INTO `sys_oper_log` VALUES (323, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":3,\"ispublic\":1,\"name\":\"毛泽东思想和中国特色社会主义理论体系概论\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/maogai_20230328184618A004.jpg\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:44:26', 9);
INSERT INTO `sys_oper_log` VALUES (324, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":4,\"ispublic\":1,\"name\":\"操作系统\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/caozxt_20230328184634A005.jpg\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:44:32', 6);
INSERT INTO `sys_oper_log` VALUES (325, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"id\":1,\"introduce\":\"Python语言强大\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 15:45:09', 6);
INSERT INTO `sys_oper_log` VALUES (326, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/course', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:46:50', 139);
INSERT INTO `sys_oper_log` VALUES (327, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-06-30\",\"hours\":48,\"id\":1,\"introduce\":\"操作系统是管理计算机硬件资源，控制其他程序运行并为用户提供交互操作界面的系统软件的集合。操作系统是计算机系统的关键组成部分，负责管理与配置内存、决定系统资源供需的优先次序、控制输入与输出设备、操作网络与管理文件系统等基本任务。\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"period\":1,\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"progress\":\"进行中\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:58:46', 19);
INSERT INTO `sys_oper_log` VALUES (328, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-07-01\",\"hours\":48,\"id\":2,\"introduce\":\"javaEE\",\"ispublic\":1,\"name\":\"javaWeb框架技术\",\"params\":{},\"period\":1,\"picture\":\"/profile/upload/2023/03/28/hello_20230328184832A006.jpg\",\"progress\":\"进行中\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:59:43', 7);
INSERT INTO `sys_oper_log` VALUES (329, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-06-14\",\"hours\":48,\"id\":3,\"ispublic\":1,\"name\":\"毛泽东思想和中国特色社会主义理论体系概论\",\"params\":{},\"period\":1,\"picture\":\"/profile/upload/2023/03/28/maogai_20230328184618A004.jpg\",\"progress\":\"进行中\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 16:59:52', 9);
INSERT INTO `sys_oper_log` VALUES (330, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-05-24\",\"hours\":56,\"id\":4,\"ispublic\":1,\"name\":\"操作系统\",\"params\":{},\"period\":1,\"picture\":\"/profile/upload/2023/03/28/caozxt_20230328184634A005.jpg\",\"progress\":\"进行中\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:00:02', 7);
INSERT INTO `sys_oper_log` VALUES (331, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-06-30\",\"hours\":48,\"id\":1,\"introduce\":\"操作系统是管理计算机硬件资源，控制其他程序运行并为用户提供交互操作界面的系统软件的集合。操作系统是计算机系统的关键组成部分，负责管理与配置内存、决定系统资源供需的优先次序、控制输入与输出设备、操作网络与管理文件系统等基本任务。\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"period\":1,\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"progress\":\"进行中\",\"sayabout\":\"操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源，直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，提供人机交互界面，为其它应用软件提供支持等。\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:01:17', 7);
INSERT INTO `sys_oper_log` VALUES (332, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-06-30\",\"hours\":48,\"id\":1,\"introduce\":\"操作系统是管理计算机硬件资源，控制其他程序运行并为用户提供交互操作界面的系统软件的集合。操作系统是计算机系统的关键组成部分，负责管理与配置内存、决定系统资源供需的优先次序、控制输入与输出设备、操作网络与管理文件系统等基本任务。\",\"ispublic\":0,\"name\":\"Python程序设计\",\"params\":{},\"peculiarity\":\"使学生掌握计算机操作系统的基本原理及组成结构、基本概念和相关的新概念、名词及术语；理解操作系统各组成部分之间的关系、总体结构和综合工作原理；了解计算机操作系统的发展特点、设计技巧和方法；培养学生分析、修改和设计操作系统的能力。\",\"period\":1,\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"progress\":\"进行中\",\"request\":\"计算机类专业本科学生，及从事该类工作的人群\",\"sayabout\":\"操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源，直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，提供人机交互界面，为其它应用软件提供支持等。\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:01:44', 7);
INSERT INTO `sys_oper_log` VALUES (333, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-06-30\",\"hours\":48,\"id\":1,\"introduce\":\"操作系统是管理计算机硬件资源，控制其他程序运行并为用户提供交互操作界面的系统软件的集合。操作系统是计算机系统的关键组成部分，负责管理与配置内存、决定系统资源供需的优先次序、控制输入与输出设备、操作网络与管理文件系统等基本任务。\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"peculiarity\":\"使学生掌握计算机操作系统的基本原理及组成结构、基本概念和相关的新概念、名词及术语；理解操作系统各组成部分之间的关系、总体结构和综合工作原理；了解计算机操作系统的发展特点、设计技巧和方法；培养学生分析、修改和设计操作系统的能力。\",\"period\":1,\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"progress\":\"进行中\",\"request\":\"计算机类专业本科学生，及从事该类工作的人群\",\"sayabout\":\"操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源，直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，提供人机交互界面，为其它应用软件提供支持等。\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:02:24', 7);
INSERT INTO `sys_oper_log` VALUES (334, '课程', 2, 'com.ruoyi.course.controller.CourseController.edit()', 'PUT', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-06-30\",\"hours\":48,\"id\":1,\"introduce\":\"操作系统是管理计算机硬件资源，控制其他程序运行并为用户提供交互操作界面的系统软件的集合。操作系统是计算机系统的关键组成部分，负责管理与配置内存、决定系统资源供需的优先次序、控制输入与输出设备、操作网络与管理文件系统等基本任务。\",\"ispublic\":1,\"name\":\"Python程序设计\",\"params\":{},\"peculiarity\":\"使学生掌握计算机操作系统的基本原理及组成结构、基本概念和相关的新概念、名词及术语；理解操作系统各组成部分之间的关系、总体结构和综合工作原理；了解计算机操作系统的发展特点、设计技巧和方法；培养学生分析、修改和设计操作系统的能力。\",\"period\":1,\"picture\":\"/profile/upload/2023/03/28/python_20230328181608A003.jpg\",\"progress\":\"预报名\",\"request\":\"计算机类专业本科学生，及从事该类工作的人群\",\"sayabout\":\"操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源，直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，提供人机交互界面，为其它应用软件提供支持等。\",\"starttime\":\"2023-03-30\",\"teacher\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 17:19:38', 8);
INSERT INTO `sys_oper_log` VALUES (335, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":0,\"code\":\"class Solution(object):\\n    def twoSum(self, nums, target):\\n        \\\"\\\"\\\"\\n        :type nums: List[int]\\n        :type target: int\\n        :rtype: List[int]\\n        \\\"\\\"\\\"\",\"codemethod\":\"twoSum\",\"description\":\"给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\\n\\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\\n\\n你可以按任意顺序返回答案。\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"testcaseList\":[{\"answer\":\"[0,1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1,2]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:04:12', 208);
INSERT INTO `sys_oper_log` VALUES (336, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":0,\"code\":\"class Solution(object):\\n    def twoSum(self, nums, target):\\n        \\\"\\\"\\\"\\n        :type nums: List[int]\\n        :type target: int\\n        :rtype: List[int]\\n        \\\"\\\"\\\"\",\"codemethod\":\"twoSum\",\"description\":\"<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"testcaseList\":[{\"answer\":\"[0, 1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1, 2]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 21:05:37', 25);
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"classroom/classroom\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的课堂\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"classroom/classroom\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 18:21:00', 43);
INSERT INTO `sys_oper_log` VALUES (338, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":1,\"code\":\"class Solution(object):\\n    def twoSum(self, nums, target):\\n        \\\"\\\"\\\"\\n        :type nums: List[int]\\n        :type target: int\\n        :rtype: List[int]\\n        \\\"\\\"\\\"\",\"codemethod\":\"twoSum\",\"description\":\"<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>\",\"difficulty\":\"简单\",\"id\":5,\"likeNum\":16673,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"\",\"mark\":\"\",\"oid\":5,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 23:51:10', 36);
INSERT INTO `sys_oper_log` VALUES (339, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":1,\"code\":\"class Solution(object):\\n    def twoSum(self, nums, target):\\n        \\\"\\\"\\\"\\n        :type nums: List[int]\\n        :type target: int\\n        :rtype: List[int]\\n        \\\"\\\"\\\"\",\"codemethod\":\"twoSum\",\"description\":\"<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>\",\"difficulty\":\"简单\",\"id\":5,\"likeNum\":16673,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"[0, 1]\",\"id\":11,\"mark\":\"\",\"oid\":5,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 23:51:22', 12);
INSERT INTO `sys_oper_log` VALUES (340, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":1,\"code\":\"class Solution(object):\\n    def twoSum(self, nums, target):\\n        \\\"\\\"\\\"\\n        :type nums: List[int]\\n        :type target: int\\n        :rtype: List[int]\\n        \\\"\\\"\\\"\",\"codemethod\":\"twoSum\",\"description\":\"<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>\",\"difficulty\":\"简单\",\"id\":5,\"likeNum\":16673,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"[0, 1]\",\"id\":11,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":5,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-31 23:51:33', 11);
INSERT INTO `sys_oper_log` VALUES (341, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":21,\"name\":\"111\",\"orderNum\":1,\"params\":{},\"parentid\":16}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 12:29:37', 15);
INSERT INTO `sys_oper_log` VALUES (342, 'chapter', 3, 'com.ruoyi.chapter.controller.ChapterController.remove()', 'DELETE', 1, 'admin', NULL, '/chapter/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 12:29:45', 7);
INSERT INTO `sys_oper_log` VALUES (343, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":1,\"id\":22,\"name\":\"1.1.4\",\"orderNum\":4,\"params\":{},\"parentid\":14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 12:30:03', 7);
INSERT INTO `sys_oper_log` VALUES (344, 'chapter', 3, 'com.ruoyi.chapter.controller.ChapterController.remove()', 'DELETE', 1, 'admin', NULL, '/chapter/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 12:30:08', 6);
INSERT INTO `sys_oper_log` VALUES (345, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":17,\"code\":\"class Solution(object):\\n    def twoSum(self, nums, target):\\n        \\\"\\\"\\\"\\n        :type nums: List[int]\\n        :type target: int\\n        :rtype: List[int]\\n        \\\"\\\"\\\"\",\"codemethod\":\"twoSum\",\"description\":\"<p>给定一个整数数组 nums&nbsp;和一个整数目标值 target，请你在该数组中找出 和为目标值 target&nbsp; 的那&nbsp;两个&nbsp;整数，并返回它们的数组下标。</p><p><br></p><p>你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。</p><p><br></p><p>你可以按任意顺序返回答案。</p>\",\"difficulty\":\"简单\",\"id\":1,\"likeNum\":16673,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"[0, 1]\",\"id\":1,\"mark\":\"因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\",\"oid\":1,\"params\":{},\"testcases\":\"[2,7,11,15]\\n9\"},{\"answer\":\"[1, 2]\",\"id\":2,\"mark\":\"因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。\",\"oid\":1,\"params\":{},\"testcases\":\"[3,2,4]\\n6\"}],\"title\":\"两数之和\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 13:46:13', 64);
INSERT INTO `sys_oper_log` VALUES (346, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":18,\"code\":\"# Definition for singly-linked list.\\n# class ListNode(object):\\n#     def __init__(self, val=0, next=None):\\n#         self.val = val\\n#         self.next = next\\nclass Solution(object):\\n    def addTwoNumbers(self, l1, l2):\\n        \\\"\\\"\\\"\\n        :type l1: ListNode\\n        :type l2: ListNode\\n        :rtype: ListNode\\n        \\\"\\\"\\\"\",\"codemethod\":\"addTwoNumbers\",\"description\":\"<p>给你两个&nbsp;非空 的链表，表示两个非负的整数。它们每位数字都是按照&nbsp;逆序&nbsp;的方式存储的，并且每个节点只能存储&nbsp;一位&nbsp;数字。</p><p><br></p><p>请你将两个数相加，并以相同形式返回一个表示和的链表。</p><p><br></p><p>你可以假设除了数字 0 之外，这两个数都不会以 0&nbsp;开头。</p><p><img src=\\\"/dev-api/profile/upload/2023/03/28/addtwonumber1_20230328211341A001.jpg\\\"></p>\",\"difficulty\":\"简单\",\"id\":2,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"[7,0,8]\",\"id\":6,\"mark\":\"342 + 465 = 807.\",\"oid\":2,\"params\":{},\"testcases\":\"[2,4,3]\\n[5,6,4]\"}],\"title\":\"两数相加\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 13:46:25', 11);
INSERT INTO `sys_oper_log` VALUES (347, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":18,\"code\":\"class Solution(object):\\n    def reverse(self, x):\\n        \\\"\\\"\\\"\\n        :type x: int\\n        :rtype: int\\n        \\\"\\\"\\\"\",\"codemethod\":\"reverse\",\"description\":\"<p>给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。</p><p><br></p><p>如果反转后整数超过 32 位的有符号整数的范围&nbsp;[−231,&nbsp; 231&nbsp;− 1] ，就返回 0。</p><p><br></p><p><strong>假设环境不允许存储 64 位整数（有符号或无符号）。</strong></p>\",\"difficulty\":\"中等\",\"id\":3,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"321\",\"id\":7,\"mark\":\"123反转后是321\",\"oid\":3,\"params\":{},\"testcases\":\"123\"},{\"answer\":\"-321\",\"id\":8,\"mark\":\"-123反转后是-321\",\"oid\":3,\"params\":{},\"testcases\":\"-123\"}],\"title\":\"整数反转\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 13:46:35', 10);
INSERT INTO `sys_oper_log` VALUES (348, 'oj', 2, 'com.ruoyi.oj.controller.OjController.edit()', 'PUT', 1, 'admin', NULL, '/oj', '127.0.0.1', '内网IP', '{\"chapterid\":19,\"code\":\"class Solution(object):\\n    def trap(self, height):\\n        \\\"\\\"\\\"\\n        :type height: List[int]\\n        :rtype: int\\n        \\\"\\\"\\\"\",\"codemethod\":\"trap\",\"description\":\"<p><span style=\\\"color: rgb(38, 38, 38);\\\">给定&nbsp;</span><code style=\\\"color: rgba(var(--grey-7-rgb),1);\\\">n</code><span style=\\\"color: rgb(38, 38, 38);\\\">&nbsp;个非负整数表示每个宽度为&nbsp;</span><code style=\\\"color: rgba(var(--grey-7-rgb),1);\\\">1</code><span style=\\\"color: rgb(38, 38, 38);\\\">&nbsp;的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。</span></p><p><span style=\\\"color: rgb(38, 38, 38);\\\">﻿</span><img src=\\\"/dev-api/profile/upload/2023/03/28/rainwatertrap_20230328213545A001.png\\\"></p>\",\"difficulty\":\"困难\",\"id\":4,\"params\":{},\"status\":0,\"testcaseList\":[{\"answer\":\"6\",\"id\":9,\"mark\":\"上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。\",\"oid\":4,\"params\":{},\"testcases\":\"[0,1,0,2,1,0,1,3,2,1,2,1]\"},{\"answer\":\"9\",\"id\":10,\"mark\":\"\",\"oid\":4,\"params\":{},\"testcases\":\"[4,2,0,3,2,5]\"}],\"title\":\"接雨水\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-01 13:46:43', 16);
INSERT INTO `sys_oper_log` VALUES (349, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"signrecord,signin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:37:35', 115);
INSERT INTO `sys_oper_log` VALUES (350, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"signin\",\"className\":\"Signrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"签到id\",\"columnId\":61,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":62,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":63,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":64,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"endTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:39:33', 39);
INSERT INTO `sys_oper_log` VALUES (351, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/signin', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:40:48', 36);
INSERT INTO `sys_oper_log` VALUES (352, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/signrecord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:40:51', 36);
INSERT INTO `sys_oper_log` VALUES (353, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"signin\",\"className\":\"Signrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"签到id\",\"columnId\":61,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:40:51\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":62,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:40:51\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":63,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:40:51\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":64,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:41:25', 31);
INSERT INTO `sys_oper_log` VALUES (354, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/signin', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:25', 30);
INSERT INTO `sys_oper_log` VALUES (355, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/signrecord', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:27', 26);
INSERT INTO `sys_oper_log` VALUES (356, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"signin\",\"className\":\"Signrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"签到id\",\"columnId\":61,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:42:27\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":62,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:42:27\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":63,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:42:27\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":64,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:42:40', 24);
INSERT INTO `sys_oper_log` VALUES (357, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"signinrecord\",\"className\":\"Signrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"签到id\",\"columnId\":61,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:42:40\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":62,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:42:40\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":63,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:42:40\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":64,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:54:36', 25);
INSERT INTO `sys_oper_log` VALUES (358, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"signin\",\"className\":\"Signrecord\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"签到id\",\"columnId\":61,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:54:35\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":62,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:54:35\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":63,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-04-02 10:54:35\",\"usableColumn\":false},{\"capJavaField\":\"EndTime\",\"columnComment\":\"结束时间\",\"columnId\":64,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-02 10:37:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:55:58', 59);
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin\",\"perms\":\"signin:signin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 10:59:27', 17);
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin/index\",\"perms\":\"signin:signin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:00:00', 10);
INSERT INTO `sys_oper_log` VALUES (361, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"index\",\"perms\":\"signin:signin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:01:00', 12);
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin/index\",\"perms\":\"signin:signin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:01:45', 10);
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-04-02 10:57:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"签到记录查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2030,\"path\":\"#\",\"perms\":\"signin:signin:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:03:21', 11);
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-04-02 10:57:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"签到记录新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2030,\"path\":\"#\",\"perms\":\"signin:signin:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:03:28', 13);
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-04-02 10:57:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"签到记录修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2030,\"path\":\"#\",\"perms\":\"signin:signin:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:03:34', 12);
INSERT INTO `sys_oper_log` VALUES (366, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-04-02 10:57:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"签到记录删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2030,\"path\":\"#\",\"perms\":\"signin:signin:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:03:39', 10);
INSERT INTO `sys_oper_log` VALUES (367, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-04-02 10:57:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2035,\"menuName\":\"签到信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2030,\"path\":\"#\",\"perms\":\"signin:signin:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:03:45', 9);
INSERT INTO `sys_oper_log` VALUES (368, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin/index\",\"perms\":\"signin:signin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:04:55', 10);
INSERT INTO `sys_oper_log` VALUES (369, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin/index\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:05:29', 9);
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin/index\",\"perms\":\"signin:index:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:06:18', 11);
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"signin/index\",\"createTime\":\"2023-04-02 10:57:37\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"签到记录信息\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"signin/index\",\"perms\":\"signin:signin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:06:44', 8);
INSERT INTO `sys_oper_log` VALUES (372, '签到记录信息', 1, 'com.ruoyi.signin.controller.SignrecordController.add()', 'POST', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"endTime\":\"2023-04-03\",\"id\":1,\"params\":{},\"signinList\":[{\"params\":{},\"signId\":1,\"userId\":1}],\"startTime\":\"2023-04-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:10:57', 21);
INSERT INTO `sys_oper_log` VALUES (373, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.edit()', 'PUT', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"endTime\":\"2023-04-03\",\"id\":1,\"params\":{},\"signinList\":[{\"id\":1,\"params\":{},\"signId\":1,\"userId\":1}],\"startTime\":\"2023-04-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:15:50', 28);
INSERT INTO `sys_oper_log` VALUES (374, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.edit()', 'PUT', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"endTime\":\"2023-04-03 00:00:00\",\"id\":1,\"params\":{},\"signinList\":[{\"id\":1,\"params\":{},\"signId\":1,\"userId\":1}],\"startTime\":\"2023-04-02 11:22:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:22:38', 115);
INSERT INTO `sys_oper_log` VALUES (375, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.edit()', 'PUT', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"endTime\":\"2023-04-02 11:27:28\",\"id\":1,\"params\":{},\"signinList\":[{\"id\":1,\"params\":{},\"signId\":1,\"userId\":1}],\"startTime\":\"2023-04-02 11:22:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 11:25:35', 13);
INSERT INTO `sys_oper_log` VALUES (376, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.edit()', 'PUT', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"endTime\":\"2023-04-03 11:27:28\",\"id\":1,\"params\":{},\"signinList\":[{\"id\":1,\"params\":{},\"signId\":1,\"userId\":1}],\"startTime\":\"2023-04-02 11:22:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 12:36:49', 114);
INSERT INTO `sys_oper_log` VALUES (377, '签到记录信息', 1, 'com.ruoyi.signin.controller.SignrecordController.add()', 'POST', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 14:54:20', 108);
INSERT INTO `sys_oper_log` VALUES (378, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, 'admin', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您不是学生，无法签到\",\"code\":500}', 0, NULL, '2023-04-02 17:15:12', 21);
INSERT INTO `sys_oper_log` VALUES (379, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, 'admin', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您不是学生，无法签到\",\"code\":500}', 0, NULL, '2023-04-02 17:15:19', 4);
INSERT INTO `sys_oper_log` VALUES (380, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, 'admin', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您不是学生，无法签到\",\"code\":500}', 0, NULL, '2023-04-02 17:15:21', 4);
INSERT INTO `sys_oper_log` VALUES (381, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:16:52', 83);
INSERT INTO `sys_oper_log` VALUES (382, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 09:32:42\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"dengyun@icloud.com\",\"loginDate\":\"2023-04-02 17:17:08\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Doris\",\"params\":{},\"phonenumber\":\"18770765852\",\"postIds\":[4],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"邓宇宁\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:18:26', 45);
INSERT INTO `sys_oper_log` VALUES (383, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '邓宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到成功\",\"code\":200}', 0, NULL, '2023-04-02 17:25:14', 9);
INSERT INTO `sys_oper_log` VALUES (384, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '邓宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:25:19', 3);
INSERT INTO `sys_oper_log` VALUES (385, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '邓宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:25:22', 3);
INSERT INTO `sys_oper_log` VALUES (386, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '邓宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:27:14', 3);
INSERT INTO `sys_oper_log` VALUES (387, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '邓宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:27:39', 3);
INSERT INTO `sys_oper_log` VALUES (388, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '邓宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:32:23', 5);
INSERT INTO `sys_oper_log` VALUES (389, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:49:28', 85);
INSERT INTO `sys_oper_log` VALUES (390, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:49:43', 71);
INSERT INTO `sys_oper_log` VALUES (391, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-28 09:32:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"软件开发1班\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"guo63@gmail.com\",\"loginDate\":\"2023-04-02 17:50:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"Gary\",\"params\":{},\"phonenumber\":\"15646424833\",\"postIds\":[4],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"郭宇宁\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-02 17:51:08', 40);
INSERT INTO `sys_oper_log` VALUES (392, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '郭宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到成功\",\"code\":200}', 0, NULL, '2023-04-02 17:51:45', 11);
INSERT INTO `sys_oper_log` VALUES (393, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '郭宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:51:53', 3);
INSERT INTO `sys_oper_log` VALUES (394, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '郭宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:51:55', 2);
INSERT INTO `sys_oper_log` VALUES (395, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '郭宇宁', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"您已经签到过了\",\"code\":500}', 0, NULL, '2023-04-02 17:52:31', 5);
INSERT INTO `sys_oper_log` VALUES (396, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:31:07', 21);
INSERT INTO `sys_oper_log` VALUES (397, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:31:15', 10);
INSERT INTO `sys_oper_log` VALUES (398, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:31:16', 9);
INSERT INTO `sys_oper_log` VALUES (399, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:31:31', 10);
INSERT INTO `sys_oper_log` VALUES (400, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:40:26', 9);
INSERT INTO `sys_oper_log` VALUES (401, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:40:29', 8);
INSERT INTO `sys_oper_log` VALUES (402, '签到记录信息', 2, 'com.ruoyi.signin.controller.SignrecordController.sign()', 'POST', 1, '石岚', NULL, '/signin/signin/signin', '127.0.0.1', '内网IP', '1', '{\"msg\":\"签到已截止\",\"code\":500}', 0, NULL, '2023-04-03 21:40:32', 8);
INSERT INTO `sys_oper_log` VALUES (403, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"notice\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 20:41:40', 125);
INSERT INTO `sys_oper_log` VALUES (404, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"notice\",\"className\":\"Notice\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"公告id\",\"columnId\":67,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 20:41:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"对应课程通知标题\",\"columnId\":68,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 20:41:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Context\",\"columnComment\":\"通知内容\",\"columnId\":69,\"columnName\":\"context\",\"columnType\":\"varchar(1000)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 20:41:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"context\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":70,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-04 20:41:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 20:42:35', 60);
INSERT INTO `sys_oper_log` VALUES (405, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":100,\"nickName\":\"1111\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"admin\"}', '{\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2023-04-04 21:40:29', 34529);
INSERT INTO `sys_oper_log` VALUES (406, '课程通知公告', 1, 'com.ruoyi.notice.controller.NoticeController.add()', 'POST', 1, 'admin', NULL, '/notice/notice', '127.0.0.1', '内网IP', '{\"context\":\"11111\",\"courseId\":1,\"id\":2,\"params\":{},\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:53:31', 163);
INSERT INTO `sys_oper_log` VALUES (407, '课程通知公告', 1, 'com.ruoyi.notice.controller.NoticeController.add()', 'POST', 1, 'admin', NULL, '/notice/notice', '127.0.0.1', '内网IP', '{\"context\":\"22222\",\"courseId\":1,\"id\":3,\"params\":{},\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:55:15', 10);
INSERT INTO `sys_oper_log` VALUES (408, '课程通知公告', 1, 'com.ruoyi.notice.controller.NoticeController.add()', 'POST', 1, 'admin', NULL, '/notice/notice', '127.0.0.1', '内网IP', '{\"context\":\"223333\",\"courseId\":1,\"id\":4,\"params\":{},\"title\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-04 21:56:44', 12);
INSERT INTO `sys_oper_log` VALUES (409, '签到记录信息', 1, 'com.ruoyi.signin.controller.SignrecordController.add()', 'POST', 1, 'admin', NULL, '/signin/signin', '127.0.0.1', '内网IP', '{\"courseId\":1,\"endTime\":\"2023-05-04 00:00:00\",\"id\":3,\"params\":{},\"startTime\":\"2023-04-05 05:25:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 05:26:03', 193);
INSERT INTO `sys_oper_log` VALUES (410, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"exam\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 05:56:14', 120);
INSERT INTO `sys_oper_log` VALUES (411, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"exam\",\"className\":\"Exam\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷id\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"试卷名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":74,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":75,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 05:57:57', 104);
INSERT INTO `sys_oper_log` VALUES (412, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"question\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 05:59:32', 74);
INSERT INTO `sys_oper_log` VALUES (413, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"exam\",\"className\":\"Exam\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷id\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-05 05:57:57\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"试卷名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-05 05:57:57\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":74,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-05 05:57:57\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":75,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:00:23', 53);
INSERT INTO `sys_oper_log` VALUES (414, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/question', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:01:37', 65);
INSERT INTO `sys_oper_log` VALUES (415, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"exam\",\"className\":\"Exam\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷id\",\"columnId\":72,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-05 06:00:23\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"试卷名称\",\"columnId\":73,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-05 06:00:23\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":74,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2023-04-05 06:00:23\",\"usableColumn\":false},{\"capJavaField\":\"StartTime\",\"columnComment\":\"开始时间\",\"columnId\":75,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 05:56:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:01:53', 47);
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"exam/exam/index\",\"createTime\":\"2023-04-05 06:10:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"试卷\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"exam\",\"perms\":\"exam:exam:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:11:31', 23);
INSERT INTO `sys_oper_log` VALUES (417, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"exam/exam/index\",\"createTime\":\"2023-04-05 06:10:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"试卷\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"exam\",\"perms\":\"exam:exam:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:11:52', 14);
INSERT INTO `sys_oper_log` VALUES (418, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"exam/index\",\"createTime\":\"2023-04-05 06:10:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"试卷\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"exam\",\"perms\":\"exam:exam:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:12:21', 14);
INSERT INTO `sys_oper_log` VALUES (419, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"exam/index\",\"createTime\":\"2023-04-05 06:10:22\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"试卷管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"exam\",\"perms\":\"exam:exam:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 06:14:54', 50);
INSERT INTO `sys_oper_log` VALUES (420, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:10:13\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:10:13', 61);
INSERT INTO `sys_oper_log` VALUES (421, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:10:15\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:10:15', 7);
INSERT INTO `sys_oper_log` VALUES (422, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:13:22\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:13:22', 7);
INSERT INTO `sys_oper_log` VALUES (423, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:13:24\",\"id\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:13:24', 7);
INSERT INTO `sys_oper_log` VALUES (424, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:13:27\",\"id\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:13:27', 7);
INSERT INTO `sys_oper_log` VALUES (425, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:13:29\",\"id\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:13:29', 8);
INSERT INTO `sys_oper_log` VALUES (426, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:13:30\",\"id\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:13:30', 7);
INSERT INTO `sys_oper_log` VALUES (427, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:13:31\",\"id\":9,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:13:31', 9);
INSERT INTO `sys_oper_log` VALUES (428, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-04-05 12:18:05\",\"id\":10,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 12:18:05', 8);
INSERT INTO `sys_oper_log` VALUES (429, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"courseId\":1,\"createTime\":\"2023-04-05 15:18:56\",\"endTime\":\"2023-04-19\",\"id\":11,\"name\":\"11111111\",\"params\":{},\"startTime\":\"2023-04-03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 15:18:56', 32442);
INSERT INTO `sys_oper_log` VALUES (430, '试卷', 3, 'com.ruoyi.exam.controller.ExamController.remove()', 'DELETE', 1, 'admin', NULL, '/exam/exam/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 15:23:06', 31);
INSERT INTO `sys_oper_log` VALUES (431, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"courseId\":1,\"createTime\":\"2023-04-05 16:04:02\",\"endTime\":\"2023-04-19\",\"id\":12,\"name\":\"测试试卷\",\"params\":{},\"questionList\":[{\"answer\":\"C\",\"context\":\"测试1\",\"examId\":12,\"params\":{},\"questionType\":1,\"score\":5,\"selectA\":\"1\",\"selectB\":\"2\",\"selectC\":\"3\",\"selectD\":\"4\"},{\"answer\":\"B,A,C\",\"context\":\"测试2\",\"examId\":12,\"params\":{},\"questionType\":2,\"score\":5,\"selectA\":\"1\",\"selectB\":\"2\",\"selectC\":\"3\",\"selectD\":\"4\"},{\"answer\":\"对\",\"context\":\"测试3\",\"examId\":12,\"params\":{},\"questionType\":3,\"score\":5,\"selectA\":\"\",\"selectB\":\"\",\"selectC\":\"\",\"selectD\":\"\"},{\"answer\":\"测试\",\"context\":\"测试\",\"examId\":12,\"params\":{},\"questionType\":4,\"score\":5,\"selectA\":\"\",\"selectB\":\"\",\"selectC\":\"\",\"selectD\":\"\"}],\"startTime\":\"2023-04-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 16:04:02', 23);
INSERT INTO `sys_oper_log` VALUES (432, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"es\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 19:45:36', 66);
INSERT INTO `sys_oper_log` VALUES (433, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"es\",\"className\":\"Es\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":88,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 19:45:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sid\",\"columnComment\":\"学生id\",\"columnId\":89,\"columnName\":\"sid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 19:45:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"sid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Eid\",\"columnComment\":\"试卷id\",\"columnId\":90,\"columnName\":\"eid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 19:45:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"eid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Score\",\"columnComment\":\"成绩\",\"columnId\":91,\"columnName\":\"score\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-05 19:45:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"score\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":false,\"tableId', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 19:46:14', 43);
INSERT INTO `sys_oper_log` VALUES (434, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[\\\"A\\\"],[\\\"ACD\\\"],[\\\"错\\\"],[],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:41:46', 9);
INSERT INTO `sys_oper_log` VALUES (435, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[\\\"A\\\",\\\"B\\\"],[\\\"ABCD\\\"],[\\\"错\\\"],[],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 21:48:59', 0);
INSERT INTO `sys_oper_log` VALUES (436, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:28:10', 8);
INSERT INTO `sys_oper_log` VALUES (437, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"A\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"AB\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":\\\"\\\"}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:29:13', 1);
INSERT INTO `sys_oper_log` VALUES (438, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":1,\\\"examId\\\":12,\\\"questionType\\\":1,\\\"context\\\":\\\"[1,2,3]+[4,5,6] 的结果是多少？\\\",\\\"answer\\\":\\\"A\\\",\\\"selectA\\\":\\\"[6][15]\\\",\\\"selectB\\\":\\\"[1,2,3][4,5,6]\\\",\\\"selectC\\\":\\\"[21]\\\",\\\"selectD\\\":\\\"[1,2,3,4,5,6]\\\",\\\"score\\\":5},{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":5,\\\"examId\\\":12,\\\"questionType\\\":1,\\\"context\\\":\\\"测试\\\",\\\"answer\\\":\\\"B\\\",\\\"selectA\\\":\\\"A\\\",\\\"selectB\\\":\\\"B\\\",\\\"selectC\\\":\\\"C\\\",\\\"selectD\\\":\\\"D\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":2,\\\"examId\\\":12,\\\"questionType\\\":2,\\\"context\\\":\\\"可以避免类型错误的函数是？\\\",\\\"answer\\\":null,\\\"selectA\\\":\\\"1\\\",\\\"selectB\\\":\\\"2\\\",\\\"selectC\\\":\\\"3\\\",\\\"selectD\\\":\\\"4\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":3,\\\"examId\\\":12,\\\"questionType\\\":3,\\\"context\\\":\\\"测试3\\\",\\\"answer\\\":\\\"对\\\",\\\"selectA\\\":\\\"\\\",\\\"selectB\\\":\\\"\\\",\\\"selectC\\\":\\\"\\\",\\\"selectD\\\":\\\"\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":4,\\\"examId\\\":12,\\\"questionType\\\":4,\\\"context\\\":\\\"测试\\\",\\\"answer\\\":null,\\\"selectA\\\":\\\"\\\",\\\"selectB\\\":\\\"\\\",\\\"selectC\\\":\\\"\\\",\\\"selectD\\\":\\\"\\\",\\\"score\\\":5}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:42:16', 0);
INSERT INTO `sys_oper_log` VALUES (439, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":1,\\\"examId\\\":12,\\\"questionType\\\":1,\\\"context\\\":\\\"[1,2,3]+[4,5,6] 的结果是多少？\\\",\\\"answer\\\":\\\"A\\\",\\\"selectA\\\":\\\"[6][15]\\\",\\\"selectB\\\":\\\"[1,2,3][4,5,6]\\\",\\\"selectC\\\":\\\"[21]\\\",\\\"selectD\\\":\\\"[1,2,3,4,5,6]\\\",\\\"score\\\":5},{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":5,\\\"examId\\\":12,\\\"questionType\\\":1,\\\"context\\\":\\\"测试\\\",\\\"answer\\\":\\\"B\\\",\\\"selectA\\\":\\\"A\\\",\\\"selectB\\\":\\\"B\\\",\\\"selectC\\\":\\\"C\\\",\\\"selectD\\\":\\\"D\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":2,\\\"examId\\\":12,\\\"questionType\\\":2,\\\"context\\\":\\\"可以避免类型错误的函数是？\\\",\\\"answer\\\":\\\"ABCD\\\",\\\"selectA\\\":\\\"1\\\",\\\"selectB\\\":\\\"2\\\",\\\"selectC\\\":\\\"3\\\",\\\"selectD\\\":\\\"4\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":3,\\\"examId\\\":12,\\\"questionType\\\":3,\\\"context\\\":\\\"测试3\\\",\\\"answer\\\":\\\"错\\\",\\\"selectA\\\":\\\"\\\",\\\"selectB\\\":\\\"\\\",\\\"selectC\\\":\\\"\\\",\\\"selectD\\\":\\\"\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":4,\\\"examId\\\":12,\\\"questionType\\\":4,\\\"context\\\":\\\"测试\\\",\\\"answer\\\":null,\\\"selectA\\\":\\\"\\\",\\\"selectB\\\":\\\"\\\",\\\"selectC\\\":\\\"\\\",\\\"selectD\\\":\\\"\\\",\\\"score\\\":5}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:48:15', 0);
INSERT INTO `sys_oper_log` VALUES (440, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":1,\\\"examId\\\":12,\\\"questionType\\\":1,\\\"context\\\":\\\"[1,2,3]+[4,5,6] 的结果是多少？\\\",\\\"answer\\\":\\\"A\\\",\\\"selectA\\\":\\\"[6][15]\\\",\\\"selectB\\\":\\\"[1,2,3][4,5,6]\\\",\\\"selectC\\\":\\\"[21]\\\",\\\"selectD\\\":\\\"[1,2,3,4,5,6]\\\",\\\"score\\\":5},{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":5,\\\"examId\\\":12,\\\"questionType\\\":1,\\\"context\\\":\\\"测试\\\",\\\"answer\\\":\\\"C\\\",\\\"selectA\\\":\\\"A\\\",\\\"selectB\\\":\\\"B\\\",\\\"selectC\\\":\\\"C\\\",\\\"selectD\\\":\\\"D\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":2,\\\"examId\\\":12,\\\"questionType\\\":2,\\\"context\\\":\\\"可以避免类型错误的函数是？\\\",\\\"answer\\\":\\\"ABD\\\",\\\"selectA\\\":\\\"1\\\",\\\"selectB\\\":\\\"2\\\",\\\"selectC\\\":\\\"3\\\",\\\"selectD\\\":\\\"4\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":3,\\\"examId\\\":12,\\\"questionType\\\":3,\\\"context\\\":\\\"测试3\\\",\\\"answer\\\":\\\"对\\\",\\\"selectA\\\":\\\"\\\",\\\"selectB\\\":\\\"\\\",\\\"selectC\\\":\\\"\\\",\\\"selectD\\\":\\\"\\\",\\\"score\\\":5}],[{\\\"createBy\\\":null,\\\"createTime\\\":null,\\\"updateBy\\\":null,\\\"updateTime\\\":null,\\\"remark\\\":null,\\\"id\\\":4,\\\"examId\\\":12,\\\"questionType\\\":4,\\\"context\\\":\\\"测试\\\",\\\"answer\\\":null,\\\"selectA\\\":\\\"\\\",\\\"selectB\\\":\\\"\\\",\\\"selectC\\\":\\\"\\\",\\\"selectD\\\":\\\"\\\",\\\"score\\\":5}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:52:20', 0);
INSERT INTO `sys_oper_log` VALUES (441, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"C\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABD\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 22:56:20', 0);
INSERT INTO `sys_oper_log` VALUES (442, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"B\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"C\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABCD\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:00:49', 8);
INSERT INTO `sys_oper_log` VALUES (443, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"C\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"AC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', NULL, 1, 'Range [1, 0) out of bounds for length 1', '2023-04-05 23:04:17', 12);
INSERT INTO `sys_oper_log` VALUES (444, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"B\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"AC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:07:47', 9);
INSERT INTO `sys_oper_log` VALUES (445, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"B\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"B\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"BC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', NULL, 1, 'illegal input, offset 1, char {', '2023-04-05 23:09:40', 13);
INSERT INTO `sys_oper_log` VALUES (446, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"B\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"D\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"BD\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', NULL, 1, 'input not end, offset 23, character {, line 1, column 24, fastjson-version 2.0.25 {\"id\":1,\"answer\":\"B\"},{\"id\":5,\"answer\":\"D\"}', '2023-04-05 23:10:41', 11);
INSERT INTO `sys_oper_log` VALUES (447, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"B\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"B\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"AC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:14:04', 11);
INSERT INTO `sys_oper_log` VALUES (448, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"C\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABD\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"params\":{},\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:15:53', 11);
INSERT INTO `sys_oper_log` VALUES (449, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"B\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"D\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABCD\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"id\":2,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:24:36', 111);
INSERT INTO `sys_oper_log` VALUES (450, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"D\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"D\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":3,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:27:23', 10);
INSERT INTO `sys_oper_log` VALUES (451, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"D\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"A\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":4,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:29:43', 24623);
INSERT INTO `sys_oper_log` VALUES (452, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"D\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"D\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":5,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:33:40', 112);
INSERT INTO `sys_oper_log` VALUES (453, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"C\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":6,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:37:49', 150737);
INSERT INTO `sys_oper_log` VALUES (454, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"D\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":7,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:38:40', 111);
INSERT INTO `sys_oper_log` VALUES (455, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"B\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":8,\"params\":{},\"score\":0,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:42:11', 148002);
INSERT INTO `sys_oper_log` VALUES (456, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"D\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"params\":{},\"sid\":1}', NULL, 1, 'Cannot invoke \"Object.toString()\" because the return value of \"java.util.HashMap.get(Object)\" is null', '2023-04-05 23:43:06', 12);
INSERT INTO `sys_oper_log` VALUES (457, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"A\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"ABC\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"对\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"id\":9,\"params\":{},\"score\":15,\"sid\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:45:41', 123);
INSERT INTO `sys_oper_log` VALUES (458, '试卷', 1, 'com.ruoyi.exam.controller.ExamController.add()', 'POST', 1, 'admin', NULL, '/exam/exam', '127.0.0.1', '内网IP', '{\"courseId\":1,\"createBy\":\"admin\",\"createTime\":\"2023-04-05 23:53:12\",\"endTime\":\"2023-03-27 00:00:00\",\"id\":13,\"name\":\"1111111\",\"params\":{},\"questionList\":[{\"answer\":\"A,B,C,D\",\"context\":\"11\",\"examId\":13,\"params\":{},\"questionType\":2,\"score\":1,\"selectA\":\"11\",\"selectB\":\"11\",\"selectC\":\"11\",\"selectD\":\"11\"}],\"startTime\":\"2023-04-03 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-05 23:53:12', 38);
INSERT INTO `sys_oper_log` VALUES (459, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":\\\"A\\\"},{\\\"id\\\":5,\\\"answer\\\":\\\"C\\\"}],[{\\\"id\\\":2,\\\"answer\\\":\\\"A\\\"}],[{\\\"id\\\":3,\\\"answer\\\":\\\"错\\\"}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"params\":{},\"sid\":1}', '{\"msg\":\"您已经提交过试卷了,不能重复提交\",\"code\":500}', 0, NULL, '2023-04-05 23:58:52', 13);
INSERT INTO `sys_oper_log` VALUES (460, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":null},{\\\"id\\\":5,\\\"answer\\\":null}],[{\\\"id\\\":2,\\\"answer\\\":\\\"\\\"}],[{\\\"id\\\":3,\\\"answer\\\":null}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"params\":{},\"sid\":1}', '{\"msg\":\"您已经提交过试卷了,不能重复提交\",\"code\":500}', 0, NULL, '2023-04-05 23:59:03', 3);
INSERT INTO `sys_oper_log` VALUES (461, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":null},{\\\"id\\\":5,\\\"answer\\\":null}],[{\\\"id\\\":2,\\\"answer\\\":\\\"\\\"}],[{\\\"id\\\":3,\\\"answer\\\":null}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"params\":{},\"sid\":1}', '{\"msg\":\"您已经提交过试卷了,不能重复提交\",\"code\":500}', 0, NULL, '2023-04-06 10:21:53', 11);
INSERT INTO `sys_oper_log` VALUES (462, '试卷学生成绩', 1, 'com.ruoyi.es.controller.EsController.add()', 'POST', 1, 'admin', NULL, '/es/es', '127.0.0.1', '内网IP', '{\"answer\":\"[[{\\\"id\\\":1,\\\"answer\\\":null},{\\\"id\\\":5,\\\"answer\\\":null}],[{\\\"id\\\":2,\\\"answer\\\":\\\"\\\"}],[{\\\"id\\\":3,\\\"answer\\\":null}],[{\\\"id\\\":4,\\\"answer\\\":null}],[]]\",\"eid\":12,\"params\":{},\"sid\":1}', '{\"msg\":\"您已经提交过试卷了,不能重复提交\",\"code\":500}', 0, NULL, '2023-04-06 10:47:08', 11);
INSERT INTO `sys_oper_log` VALUES (463, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"classfile\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 11:59:06', 54);
INSERT INTO `sys_oper_log` VALUES (464, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/classfile', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 12:01:09', 35);
INSERT INTO `sys_oper_log` VALUES (465, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"classfile\",\"className\":\"Classfile\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"文件id\",\"columnId\":93,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-04-06 11:59:06\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2023-04-06 12:01:09\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"文件名称\",\"columnId\":94,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"\",\"createTime\":\"2023-04-06 12:01:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Fileaddress\",\"columnComment\":\"文件地址\",\"columnId\":95,\"columnName\":\"fileaddress\",\"columnType\":\"varchar(500)\",\"createBy\":\"\",\"createTime\":\"2023-04-06 12:01:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"fileUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fileaddress\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseId\",\"columnComment\":\"课程id\",\"columnId\":96,\"columnName\":\"course_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2023-04-06 12:01:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseId\",\"javaType\":\"Long\",\"list\":true,\"pa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 12:01:59', 30);
INSERT INTO `sys_oper_log` VALUES (466, 'classfile', 1, 'com.ruoyi.classfile.controller.ClassfileController.add()', 'POST', 1, 'admin', NULL, '/classfile/classfile', '127.0.0.1', '内网IP', '{\"courseId\":1,\"fileaddress\":\"/profile/upload/2023/04/06/自主练习二 (1)_20230406121016A001.pdf\",\"id\":1,\"name\":\"C语言\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 12:10:28', 93);
INSERT INTO `sys_oper_log` VALUES (467, 'classfile', 2, 'com.ruoyi.classfile.controller.ClassfileController.edit()', 'PUT', 1, 'admin', NULL, '/classfile/classfile', '127.0.0.1', '内网IP', '{\"courseId\":1,\"fileaddress\":\"/profile/upload/2023/04/06/自主练习二 (1)_20230406121016A001.pdf\",\"id\":1,\"name\":\"C语言11\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 12:16:59', 8);
INSERT INTO `sys_oper_log` VALUES (468, 'classfile', 2, 'com.ruoyi.classfile.controller.ClassfileController.edit()', 'PUT', 1, 'admin', NULL, '/classfile/classfile', '127.0.0.1', '内网IP', '{\"courseId\":1,\"fileaddress\":\"/profile/upload/2023/04/06/自主练习二 (1)_20230406121016A001.pdf\",\"id\":1,\"name\":\"C语言\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 12:17:06', 6);
INSERT INTO `sys_oper_log` VALUES (469, 'classfile', 2, 'com.ruoyi.classfile.controller.ClassfileController.edit()', 'PUT', 1, 'admin', NULL, '/classfile/classfile', '127.0.0.1', '内网IP', '{\"courseId\":1,\"fileaddress\":\"/profile/upload/2023/04/06/自主练习二 (1)_20230406121016A001.pdf\",\"id\":1,\"name\":\"C语言自主练习二\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 12:27:10', 6);
INSERT INTO `sys_oper_log` VALUES (470, '课程', 1, 'com.ruoyi.course.controller.CourseController.add()', 'POST', 1, 'admin', NULL, '/course', '127.0.0.1', '内网IP', '{\"endtime\":\"2023-04-12\",\"hours\":11,\"id\":5,\"introduce\":\"111\",\"ispublic\":0,\"name\":\"111\",\"params\":{},\"peculiarity\":\"1\",\"period\":1,\"progress\":\"进行中\",\"request\":\"1\",\"sayabout\":\"1\",\"starttime\":\"2023-04-03\",\"teacher\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 13:10:54', 98);
INSERT INTO `sys_oper_log` VALUES (471, '课程', 3, 'com.ruoyi.course.controller.CourseController.remove()', 'DELETE', 1, 'admin', NULL, '/course/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 13:11:04', 9);
INSERT INTO `sys_oper_log` VALUES (472, 'chapter', 1, 'com.ruoyi.chapter.controller.ChapterController.add()', 'POST', 1, 'admin', NULL, '/chapter', '127.0.0.1', '内网IP', '{\"children\":[],\"courseid\":4,\"id\":23,\"name\":\"管理员测试章节1\",\"orderNum\":0,\"params\":{},\"parentid\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-06 15:33:06', 15);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'headmaster', '校长', 1, '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:46:54', '');
INSERT INTO `sys_post` VALUES (2, 'vice-principal', '副校长', 2, '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:47:13', '');
INSERT INTO `sys_post` VALUES (3, 'teacher', '教师', 3, '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:46:08', '');
INSERT INTO `sys_post` VALUES (4, 'student', '学生', 5, '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 09:10:33', '');
INSERT INTO `sys_post` VALUES (5, 'tutor', '助教', 4, '0', 'admin', '2023-03-28 09:10:26', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, 'monitor', '班长', 6, '0', 'admin', '2023-03-28 09:11:40', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (7, 'leader', '小组长', 7, '0', 'admin', '2023-03-28 09:12:40', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-26 18:54:41', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-29 21:41:15', '普通角色');
INSERT INTO `sys_role` VALUES (100, '教师', 'teacher', 3, '1', 1, 1, '0', '0', 'admin', '2023-03-28 08:21:38', 'admin', '2023-03-29 21:41:09', '教师');
INSERT INTO `sys_role` VALUES (101, '学生', 'student', 4, '1', 1, 1, '0', '0', 'admin', '2023-03-28 08:22:08', 'admin', '2023-03-29 21:40:46', '学生');
INSERT INTO `sys_role` VALUES (102, '游客', 'guest', 5, '1', 1, 1, '0', '0', 'admin', '2023-03-28 08:48:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2027);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-06 14:53:55', 'admin', '2023-03-26 18:54:41', '', '2023-04-06 14:53:54', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-26 18:54:41', 'admin', '2023-03-26 18:54:41', 'admin', '2023-03-28 08:50:43', '三好学生');
INSERT INTO `sys_user` VALUES (100, 200, '罗鸿运', 'lhy', '00', '1580575248@qq.com', '18870745179', '0', '', '$2a$10$dRAbrW8Kwt21vF7PYxlNrOb4qSuqUWf4yGFmcdxbY5MbSB5l4K8qq', '0', '0', '', NULL, 'admin', '2023-03-28 08:39:32', 'admin', '2023-03-28 08:49:57', NULL);
INSERT INTO `sys_user` VALUES (101, 103, '石岚', 'Ricky', '00', 'lshi@gmail.com', '18870745175', '1', '', '$2a$10$lnPO84Y1sieuCAKruiAJ2Ojy6D6H4dx47tCtOtu7eh3xo.d2nd3qa', '0', '0', '127.0.0.1', '2023-04-03 21:23:28', 'admin', '2023-03-28 09:32:37', 'admin', '2023-04-03 21:23:28', NULL);
INSERT INTO `sys_user` VALUES (102, 103, '蔡岚', 'Jean', '00', 'cal10@yahoo.com', '18875421145', '0', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:40', 'admin', '2023-03-29 21:23:10', NULL);
INSERT INTO `sys_user` VALUES (103, 103, '邓宇宁', 'Doris', '00', 'dengyun@icloud.com', '18770765852', '0', '', '$2a$10$sno39eSTBH8VFzOdyBM.YuRyt.AItCLOBnXkbTyz.GhwJtMexurv.', '0', '0', '127.0.0.1', '2023-04-02 17:18:41', 'admin', '2023-03-28 09:32:42', 'admin', '2023-04-02 17:49:28', NULL);
INSERT INTO `sys_user` VALUES (104, 103, '萧致远', 'Lawrence', '00', 'xiao2@hotmail.com', '17979306640', '0', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:44', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 103, '严致远', 'Juanita', '00', 'yanzhiyuan430@hotmail.com', '76099905085', '0', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:45', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 103, '魏安琪', 'Julia', '00', 'anqi8@gmail.com', '2147911588', '0', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:48', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 103, '郭宇宁', 'Gary', '00', 'guo63@gmail.com', '15646424833', '0', '', '$2a$10$CK8iNvsGVKQYvwQTpqn.ieixOLrZFDb.pFnPaUmn7xcDI7kZ14wfu', '0', '0', '127.0.0.1', '2023-04-02 17:51:28', 'admin', '2023-03-28 09:32:50', 'admin', '2023-04-02 17:51:28', NULL);
INSERT INTO `sys_user` VALUES (108, 103, '罗杰宏', 'Sandra', '00', 'luojiehong@icloud.com', '19225973842', '0', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (109, 103, '龚震南', 'Nicole', '00', 'gong44@outlook.com', '15437168108', '0', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:52', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (110, 103, '姚宇宁', 'Helen', '00', 'yuningyao7@hotmail.com', '2085347823', '1', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:53', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (111, 103, '魏安琪', 'Carrie', '00', 'weianqi@gmail.com', '14506045128', '1', '', '', '0', '0', '', NULL, 'admin', '2023-03-28 09:32:54', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (112, 103, '1111', '11', '00', '', '18807774574', '0', '', '$2a$10$YA/9VqJELN95j.zHA.DHSupgO.ZKNK9WguZHfz3ZFn10uSwbPDMfK', '0', '2', '', NULL, 'admin', '2023-03-28 09:31:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 4);
INSERT INTO `sys_user_post` VALUES (100, 3);
INSERT INTO `sys_user_post` VALUES (101, 4);
INSERT INTO `sys_user_post` VALUES (103, 4);
INSERT INTO `sys_user_post` VALUES (107, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 100);
INSERT INTO `sys_user_role` VALUES (2, 101);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 101);
INSERT INTO `sys_user_role` VALUES (103, 101);
INSERT INTO `sys_user_role` VALUES (107, 101);

-- ----------------------------
-- Table structure for testcase
-- ----------------------------
DROP TABLE IF EXISTS `testcase`;
CREATE TABLE `testcase`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '测试编号',
  `testcases` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '测试用例',
  `answer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '每个测试用例对应的答案',
  `oid` int NULL DEFAULT NULL COMMENT '题目id',
  `mark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '解释',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用例与答案表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testcase
-- ----------------------------
INSERT INTO `testcase` VALUES (1, '[2,7,11,15]\n9', '[0, 1]', 1, '因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。');
INSERT INTO `testcase` VALUES (2, '[3,2,4]\n6', '[1, 2]', 1, '因为 nums[1] + nums[2] == 9 , 返回 [1, 2]。');
INSERT INTO `testcase` VALUES (6, '[2,4,3]\n[5,6,4]', '[7,0,8]', 2, '342 + 465 = 807.');
INSERT INTO `testcase` VALUES (7, '123', '321', 3, '123反转后是321');
INSERT INTO `testcase` VALUES (8, '-123', '-321', 3, '-123反转后是-321');
INSERT INTO `testcase` VALUES (9, '[0,1,0,2,1,0,1,3,2,1,2,1]', '6', 4, '上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。');
INSERT INTO `testcase` VALUES (10, '[4,2,0,3,2,5]', '9', 4, '');
INSERT INTO `testcase` VALUES (11, '[2,7,11,15]\n9', '[0, 1]', 5, '因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。');

SET FOREIGN_KEY_CHECKS = 1;

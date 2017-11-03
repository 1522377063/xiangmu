/*
Navicat MySQL Data Transfer

Source Server         : guoruan
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : changshixi

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2017-11-03 21:45:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(20) NOT NULL,
  `admin_pwd` varchar(20) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'zhangsan', '123456', '张三');

-- ----------------------------
-- Table structure for t_banji
-- ----------------------------
DROP TABLE IF EXISTS `t_banji`;
CREATE TABLE `t_banji` (
  `banji_id` int(11) NOT NULL AUTO_INCREMENT,
  `zhuanye_id` int(11) DEFAULT NULL,
  `banji_name` varchar(10) NOT NULL,
  `nianji_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`banji_id`),
  KEY `FKps6gujo5l3wyj70fiu7xxlere` (`nianji_id`),
  KEY `FKifskqtk86xymx4lnekv3gxf4v` (`zhuanye_id`),
  CONSTRAINT `FKifskqtk86xymx4lnekv3gxf4v` FOREIGN KEY (`zhuanye_id`) REFERENCES `t_zhuanye` (`zhuanye_id`),
  CONSTRAINT `FKps6gujo5l3wyj70fiu7xxlere` FOREIGN KEY (`nianji_id`) REFERENCES `t_nianji` (`nianji_id`),
  CONSTRAINT `nianji_id` FOREIGN KEY (`nianji_id`) REFERENCES `t_nianji` (`nianji_id`),
  CONSTRAINT `zhuanye_id` FOREIGN KEY (`zhuanye_id`) REFERENCES `t_zhuanye` (`zhuanye_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_banji
-- ----------------------------
INSERT INTO `t_banji` VALUES ('1', '1', '1班', '1');
INSERT INTO `t_banji` VALUES ('2', '2', '2班', '1');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FKqif388cc6nuitg5yp5viaqtvj` (`teacher_id`),
  CONSTRAINT `FKqif388cc6nuitg5yp5viaqtvj` FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher` (`teacher_id`),
  CONSTRAINT `teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '1', '汇编语言');
INSERT INTO `t_course` VALUES ('2', '2', 'Android移动应用基础教程');
INSERT INTO `t_course` VALUES ('3', '3', '算法设计与分析');
INSERT INTO `t_course` VALUES ('4', '6', '英语');
INSERT INTO `t_course` VALUES ('5', '2', '系统平台');

-- ----------------------------
-- Table structure for t_jiaoxuejindu
-- ----------------------------
DROP TABLE IF EXISTS `t_jiaoxuejindu`;
CREATE TABLE `t_jiaoxuejindu` (
  `jxjd_id` int(11) NOT NULL AUTO_INCREMENT,
  `jxjd_data` varchar(20) NOT NULL,
  `jxjd_zhouci` int(11) NOT NULL,
  `jxjd_jieci` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `jxjd_didian` varchar(20) NOT NULL,
  `jxjd_neirong` varchar(255) NOT NULL,
  PRIMARY KEY (`jxjd_id`),
  KEY `FKeh0hw0hb4t8lmlvl74cu7eovg` (`course_id`),
  KEY `FKj18rmvioll5s6sj6egibrbh69` (`teacher_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`),
  CONSTRAINT `FKeh0hw0hb4t8lmlvl74cu7eovg` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`),
  CONSTRAINT `FKj18rmvioll5s6sj6egibrbh69` FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher` (`teacher_id`),
  CONSTRAINT `t_id` FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jiaoxuejindu
-- ----------------------------
INSERT INTO `t_jiaoxuejindu` VALUES ('2', '2017-9-19', '3', '3', '1', '1', '4-103', '进制和逻辑运算');
INSERT INTO `t_jiaoxuejindu` VALUES ('3', '2017-8-16', '1', '2', '1', '1', '3-203', '计算机组织');
INSERT INTO `t_jiaoxuejindu` VALUES ('4', '2017-9-20', '3', '1', '1', '1', '3-304', '80x86的指令系统');
INSERT INTO `t_jiaoxuejindu` VALUES ('5', '2017-9-22', '3', '2', '1', '1', '3-103', '80x86的寻址方式');
INSERT INTO `t_jiaoxuejindu` VALUES ('6', '2017-9-24', '3', '3', '1', '1', '3-304', '汇编语言程序格式');
INSERT INTO `t_jiaoxuejindu` VALUES ('7', '2017-9-27', '4', '2', '1', '1', '3-103', '循环与分支与程序设计');
INSERT INTO `t_jiaoxuejindu` VALUES ('11', '2017-10-10', '5', '3', '2', '2', '3-111', 'Android UI 开发');
INSERT INTO `t_jiaoxuejindu` VALUES ('12', '2017-9-8', '3', '2', '3', '3', '3-211', '算法概述与了解');
INSERT INTO `t_jiaoxuejindu` VALUES ('14', '2017-10-11', '7', '2', '1', '1', '4-311', '输入输出程序设计');
INSERT INTO `t_jiaoxuejindu` VALUES ('15', '2017-9-22', '8', '4', '1', '1', '2-311', '宏汇编基础知识');
INSERT INTO `t_jiaoxuejindu` VALUES ('16', '2017-10-13', '8', '2', '1', '1', '2-113', '重复汇编的基础知识');
INSERT INTO `t_jiaoxuejindu` VALUES ('17', '2017-10-15', '9', '1', '1', '1', '3-111', '条件汇编的基础知识');
INSERT INTO `t_jiaoxuejindu` VALUES ('19', '2017-10-21', '10', '1', '1', '1', '2-113', '输入输出程序设计实践');
INSERT INTO `t_jiaoxuejindu` VALUES ('22', '2017-10-21', '8', '3', '1', '1', '2-211', '汇编总结知识');

-- ----------------------------
-- Table structure for t_nianji
-- ----------------------------
DROP TABLE IF EXISTS `t_nianji`;
CREATE TABLE `t_nianji` (
  `nianji_id` int(11) NOT NULL AUTO_INCREMENT,
  `nianji_name` varchar(10) NOT NULL,
  PRIMARY KEY (`nianji_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_nianji
-- ----------------------------
INSERT INTO `t_nianji` VALUES ('1', '2014级');
INSERT INTO `t_nianji` VALUES ('2', '2015级');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `xi_id` int(11) DEFAULT NULL,
  `nianji_id` int(11) DEFAULT NULL,
  `zhuanye_id` int(11) DEFAULT NULL,
  `bianji_id` int(11) DEFAULT NULL,
  `student_name` varchar(20) NOT NULL,
  `student_user` varchar(20) NOT NULL,
  `student_pwd` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `FKhtrb7qpk78c8yx8iwly8a1x7m` (`bianji_id`),
  KEY `FKl6yu5dn61buwxk5stmgvpuvou` (`nianji_id`),
  KEY `FK1bdpua68kqi2xsass5hdnyfse` (`zhuanye_id`),
  KEY `FKfjfpla0hnis5lpfrgg41yces6` (`xi_id`),
  CONSTRAINT `FK1bdpua68kqi2xsass5hdnyfse` FOREIGN KEY (`zhuanye_id`) REFERENCES `t_zhuanye` (`zhuanye_id`),
  CONSTRAINT `FKfjfpla0hnis5lpfrgg41yces6` FOREIGN KEY (`xi_id`) REFERENCES `t_xi` (`xi_id`),
  CONSTRAINT `FKhtrb7qpk78c8yx8iwly8a1x7m` FOREIGN KEY (`bianji_id`) REFERENCES `t_banji` (`banji_id`),
  CONSTRAINT `FKl6yu5dn61buwxk5stmgvpuvou` FOREIGN KEY (`nianji_id`) REFERENCES `t_nianji` (`nianji_id`),
  CONSTRAINT `sbanji_id` FOREIGN KEY (`bianji_id`) REFERENCES `t_banji` (`banji_id`),
  CONSTRAINT `snianji_id` FOREIGN KEY (`nianji_id`) REFERENCES `t_nianji` (`nianji_id`),
  CONSTRAINT `sxi_id` FOREIGN KEY (`xi_id`) REFERENCES `t_xi` (`xi_id`),
  CONSTRAINT `szhuanye` FOREIGN KEY (`zhuanye_id`) REFERENCES `t_zhuanye` (`zhuanye_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1', '1', '1', '1', '1', '潘益益', 'panyiyi', '123456');
INSERT INTO `t_student` VALUES ('2', '1', '1', '2', '2', '张三', 'zhangsan', '123456');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `xi_id` int(11) DEFAULT NULL,
  `teacher_user` varchar(20) NOT NULL,
  `teacher_pwd` varchar(20) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `teacher_position` varchar(20) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `FK879y01b6p5vyfxojxetyy0lo8` (`xi_id`),
  CONSTRAINT `FK879y01b6p5vyfxojxetyy0lo8` FOREIGN KEY (`xi_id`) REFERENCES `t_xi` (`xi_id`),
  CONSTRAINT `x_id` FOREIGN KEY (`xi_id`) REFERENCES `t_xi` (`xi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', '1', 'heyin', '123456', '何颖', '副教授');
INSERT INTO `t_teacher` VALUES ('2', '1', 'jianghui', '123456', '蒋辉', '副教授');
INSERT INTO `t_teacher` VALUES ('3', '1', 'zhanglei', '123456', '张磊', '讲师');
INSERT INTO `t_teacher` VALUES ('4', '2', 'zhanghaiwei', '123456', '张海玮', '讲师');
INSERT INTO `t_teacher` VALUES ('5', '2', 'liuhaibing', '123456', '刘海冰', '副教授');
INSERT INTO `t_teacher` VALUES ('6', '3', 'wangwu', '123456', '王五', '副教授');

-- ----------------------------
-- Table structure for t_xi
-- ----------------------------
DROP TABLE IF EXISTS `t_xi`;
CREATE TABLE `t_xi` (
  `xi_id` int(11) NOT NULL AUTO_INCREMENT,
  `xi_name` varchar(10) NOT NULL,
  PRIMARY KEY (`xi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_xi
-- ----------------------------
INSERT INTO `t_xi` VALUES ('1', '计算机系');
INSERT INTO `t_xi` VALUES ('2', '艺术系');
INSERT INTO `t_xi` VALUES ('3', '建工系');
INSERT INTO `t_xi` VALUES ('4', '信息工程系');

-- ----------------------------
-- Table structure for t_xuanxiu
-- ----------------------------
DROP TABLE IF EXISTS `t_xuanxiu`;
CREATE TABLE `t_xuanxiu` (
  `xuanxiu_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`xuanxiu_id`),
  KEY `FKpbusrkl4codkqhrxllty0mwe6` (`course_id`),
  KEY `FKcsh5juv4q05ac10xga1446qms` (`student_id`),
  CONSTRAINT `FKcsh5juv4q05ac10xga1446qms` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`student_id`),
  CONSTRAINT `FKpbusrkl4codkqhrxllty0mwe6` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`),
  CONSTRAINT `xc_id` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`course_id`),
  CONSTRAINT `xs_id` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_xuanxiu
-- ----------------------------
INSERT INTO `t_xuanxiu` VALUES ('1', '1', '1');
INSERT INTO `t_xuanxiu` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for t_zhuanye
-- ----------------------------
DROP TABLE IF EXISTS `t_zhuanye`;
CREATE TABLE `t_zhuanye` (
  `zhuanye_id` int(11) NOT NULL AUTO_INCREMENT,
  `xi_id` int(11) DEFAULT NULL,
  `zhuanye_name` varchar(20) NOT NULL,
  PRIMARY KEY (`zhuanye_id`),
  KEY `FKmnhihcxcfkfuu8k7y9cfpuc7t` (`xi_id`),
  CONSTRAINT `FKmnhihcxcfkfuu8k7y9cfpuc7t` FOREIGN KEY (`xi_id`) REFERENCES `t_xi` (`xi_id`),
  CONSTRAINT `xi_id` FOREIGN KEY (`xi_id`) REFERENCES `t_xi` (`xi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zhuanye
-- ----------------------------
INSERT INTO `t_zhuanye` VALUES ('1', '1', '软件工程');
INSERT INTO `t_zhuanye` VALUES ('2', '1', '计算机科学');
INSERT INTO `t_zhuanye` VALUES ('3', '3', '船舶专业');
INSERT INTO `t_zhuanye` VALUES ('4', '2', '专业英语');

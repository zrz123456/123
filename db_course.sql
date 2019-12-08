/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_course

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-12-08 20:33:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_adminlogon
-- ----------------------------
DROP TABLE IF EXISTS `t_adminlogon`;
CREATE TABLE `t_adminlogon` (
  `adminId` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adminlogon
-- ----------------------------
INSERT INTO `t_adminlogon` VALUES ('11', '11');
INSERT INTO `t_adminlogon` VALUES ('123', '123');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(20) NOT NULL,
  `courseTime` varchar(20) NOT NULL,
  `courseTeacher` varchar(10) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `numSelected` int(10) DEFAULT '0',
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '大学物理', '周四5.6节', '蔡', '50', '1');
INSERT INTO `t_course` VALUES ('2', '大学英语', '周一7.8节', '吴', '40', '2');
INSERT INTO `t_course` VALUES ('3', '体育', '周五3.4节', '王', '45', '2');
INSERT INTO `t_course` VALUES ('4', '马克思主义基本原理', '很快', '很快', '70', '0');

-- ----------------------------
-- Table structure for t_selection
-- ----------------------------
DROP TABLE IF EXISTS `t_selection`;
CREATE TABLE `t_selection` (
  `selectId` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `Sno` int(11) NOT NULL,
  PRIMARY KEY (`courseId`,`Sno`),
  UNIQUE KEY `selectId` (`selectId`),
  KEY `FK2_t_selection` (`Sno`),
  CONSTRAINT `FK2_t_selection` FOREIGN KEY (`Sno`) REFERENCES `t_sinfo` (`Sno`),
  CONSTRAINT `FK_t_selection` FOREIGN KEY (`courseId`) REFERENCES `t_course` (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_selection
-- ----------------------------
INSERT INTO `t_selection` VALUES ('10', '3', '2');
INSERT INTO `t_selection` VALUES ('12', '2', '2');
INSERT INTO `t_selection` VALUES ('26', '1', '1');
INSERT INTO `t_selection` VALUES ('29', '3', '1');
INSERT INTO `t_selection` VALUES ('37', '2', '1');

-- ----------------------------
-- Table structure for t_sinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_sinfo`;
CREATE TABLE `t_sinfo` (
  `Sno` int(11) NOT NULL,
  `Sname` varchar(10) NOT NULL,
  `Ssex` varchar(5) NOT NULL,
  `Smajor` varchar(20) NOT NULL,
  `Stele` varchar(20) NOT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sinfo
-- ----------------------------
INSERT INTO `t_sinfo` VALUES ('1', '张三', '男', '计算机', '12345');
INSERT INTO `t_sinfo` VALUES ('2', '李四', '男', '机电', '120');
INSERT INTO `t_sinfo` VALUES ('3', '王一', '女', '英语', '88888');

-- ----------------------------
-- Table structure for t_slogon
-- ----------------------------
DROP TABLE IF EXISTS `t_slogon`;
CREATE TABLE `t_slogon` (
  `Sno` int(11) NOT NULL,
  `Spassword` varchar(20) NOT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_slogon
-- ----------------------------
INSERT INTO `t_slogon` VALUES ('1', '3');
INSERT INTO `t_slogon` VALUES ('2', '2');
INSERT INTO `t_slogon` VALUES ('3', '3');

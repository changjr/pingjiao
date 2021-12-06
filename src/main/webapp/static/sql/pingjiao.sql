/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : pingjiao

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/12/2021 21:43:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (4, '大学物理');
INSERT INTO `course` VALUES (5, 'C语言程序设计');
INSERT INTO `course` VALUES (6, 'Java语言程序设计');
INSERT INTO `course` VALUES (7, '数据结构');
INSERT INTO `course` VALUES (8, '汇编语言');

-- ----------------------------
-- Table structure for matchpkinfo
-- ----------------------------
DROP TABLE IF EXISTS `matchpkinfo`;
CREATE TABLE `matchpkinfo`  (
  `matchId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `battleId` int(10) NOT NULL AUTO_INCREMENT,
  `firstPlayerId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondTicketCount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `battleFlag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondPlayerId` int(10) NULL DEFAULT NULL,
  `grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`battleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of matchpkinfo
-- ----------------------------
INSERT INTO `matchpkinfo` VALUES ('3', 6, '3', '4', NULL, 4, '4');
INSERT INTO `matchpkinfo` VALUES ('3', 7, '4', NULL, NULL, 5, '4');
INSERT INTO `matchpkinfo` VALUES ('3', 8, '4', NULL, NULL, 7, '4');
INSERT INTO `matchpkinfo` VALUES ('3', 9, '3', '4', NULL, 8, '4');
INSERT INTO `matchpkinfo` VALUES ('4', 10, '3', NULL, NULL, 5, '1');
INSERT INTO `matchpkinfo` VALUES ('4', 11, '4', NULL, NULL, 8, '1');
INSERT INTO `matchpkinfo` VALUES ('4', 12, '6', NULL, NULL, 7, '1');
INSERT INTO `matchpkinfo` VALUES ('4', 13, '5', NULL, NULL, 6, '1');

-- ----------------------------
-- Table structure for matchtable
-- ----------------------------
DROP TABLE IF EXISTS `matchtable`;
CREATE TABLE `matchtable`  (
  `matchName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matchAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matchTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matchInfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matchImage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matchId` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`matchId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of matchtable
-- ----------------------------
INSERT INTO `matchtable` VALUES ('东方学院最受欢迎教师评选', '黑龙江东方学院', '2021-12-01 00:00:00', '东方学院最受欢迎教师评选', '/vote/static/upload/微信图片.png', 3);
INSERT INTO `matchtable` VALUES ('计算机学院最美老师', '东方学院-线上评选', '2021-12-06 00:00:00', '计算机学院最美老师', '/vote/static/upload/微信图片.png', 4);

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `playerNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playerImage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playerInfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playerId` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`playerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES ('t20110000', '赵老师', NULL, '最受欢迎的教师之一', 3);
INSERT INTO `player` VALUES ('t20110001', '钱老师', NULL, '最受欢迎的教师之一', 4);
INSERT INTO `player` VALUES ('t20110002', '孙老师', NULL, '最受欢迎的教师之一', 5);
INSERT INTO `player` VALUES ('t20110003', '李老师', NULL, '最受欢迎的教师之一', 6);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scale` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2',
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `grade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`userId`, `account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20112273', '123456', '常峻瑞', '1', '18501365444', '2', 3, '1');
INSERT INTO `user` VALUES ('admin', 'admin', '系统管理员', '1', '0451-88888888', '0', 4, '0');
INSERT INTO `user` VALUES ('t20110000', '123456', '张老师', '男', '13333333333', '1', 5, '1');

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote`  (
  `matchId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `battleId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playerId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Ticket` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vote
-- ----------------------------
INSERT INTO `vote` VALUES ('3', '6', '3', NULL, '1');
INSERT INTO `vote` VALUES ('3', '9', '3', NULL, '1');

SET FOREIGN_KEY_CHECKS = 1;

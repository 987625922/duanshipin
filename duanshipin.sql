/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : duanshipin

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 09/10/2020 17:44:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '账号状态，1为使用，2为禁用',
  `last_update_time` datetime(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `last_control_admin_id` bigint(255) NOT NULL COMMENT '操作过这个管理员的管理员id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (9, 'Admin', '', '123', 1, '2020-09-21 11:19:17', '2020-09-21 11:19:17', 1, 4, '4280d89a5a03f812751f504cc10ee8a5', 'Admin');
INSERT INTO `admin` VALUES (12, 'Admin', '', NULL, 1, '2020-09-22 11:14:50', '2020-09-22 11:14:50', 1, 1, '4280d89a5a03f812751f504cc10ee8a5', 'Admin1');
INSERT INTO `admin` VALUES (14, 'ljf@qq.com', '', NULL, 1, '2020-09-25 17:19:17', '2020-09-25 17:19:17', 1, 1, '123456', 'admin2');

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introduction` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `img_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total_mun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_mun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `update_admin_id` bigint(11) NOT NULL,
  `update_admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT 2 COMMENT '1.上线 2.草稿 3.回收站 4.推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES (2, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-09 11:08:27', '2020-10-09 11:08:27', 9, 'Admin', 2);
INSERT INTO `album` VALUES (3, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-09 11:19:26', '2020-10-09 11:19:26', 9, 'Admin', 2);

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `last_time` datetime(0) NOT NULL,
  `login_mun` bigint(255) NOT NULL,
  `last_last_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (4, 9, '2020-09-25 14:49:41', '2020-10-09 17:38:22', 50, '2020-10-09 17:36:17');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_catalog` int(1) NULL DEFAULT NULL COMMENT '是否是目录',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限的url',
  `the_last_level_catalog_id` bigint(255) NULL DEFAULT NULL COMMENT '上一级目录的id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `last_control_admin_id` bigint(20) NULL DEFAULT NULL COMMENT '上一个控制的admin的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '测试', 0, '', NULL, '2020-09-22 14:15:08', '2020-09-22 14:15:08', 1);
INSERT INTO `permission` VALUES (2, '测试', 0, '', NULL, '2020-09-25 17:36:15', '2020-09-25 17:36:15', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色标识程序中判断使用,如\"admin\",这个是唯一的:',
  `munber` int(255) NOT NULL COMMENT '角色下的用户数量',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `last_time` datetime(0) NOT NULL,
  `last_control_admin_id` bigint(20) NOT NULL COMMENT '上次操作这个角色的用户id',
  `is_available` int(1) NOT NULL COMMENT '是否可以使用',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述,UI界面显示使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role`(`role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (4, 'admin', 0, NULL, '2020-09-22 11:36:38', '2020-09-22 11:36:38', 1, 1, '管理员');
INSERT INTO `role` VALUES (5, 'operate', 0, NULL, '2020-09-22 11:36:38', '2020-09-22 11:36:38', 1, 1, '运营');
INSERT INTO `role` VALUES (6, 'generalStaff', 0, NULL, '2020-09-22 11:36:38', '2020-09-22 11:36:38', 1, 1, '普通人员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (4, 1);

SET FOREIGN_KEY_CHECKS = 1;

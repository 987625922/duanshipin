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

 Date: 02/11/2020 17:13:16
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
  `is_robot` int(1) NOT NULL DEFAULT 0 COMMENT '1 为机器人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (9, 'Admin', '', '123', 1, '2020-09-21 11:19:17', '2020-09-21 11:19:17', 1, 4, '4280d89a5a03f812751f504cc10ee8a5', 'Admin', 0);
INSERT INTO `admin` VALUES (12, 'Admin', '', NULL, 1, '2020-09-22 11:14:50', '2020-09-22 11:14:50', 1, 1, '4280d89a5a03f812751f504cc10ee8a5', 'Admin1', 0);
INSERT INTO `admin` VALUES (14, 'ljf@qq.com', '', NULL, 1, '2020-09-25 17:19:17', '2020-09-25 17:19:17', 1, 1, '123456', 'admin2', 0);
INSERT INTO `admin` VALUES (26, '测试机器人', '', NULL, 1, '2020-10-30 16:55:20', '2020-10-30 16:55:20', 1, 1, '123456', 'admin122', 1);

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `img_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total_mun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_mun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `update_admin_id` bigint(11) NOT NULL,
  `update_admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT 2 COMMENT '1.上线 2.草稿 3.回收站 4.推荐',
  `is_complete` int(1) NOT NULL COMMENT '是否完结 1 为完结 2 为未完结',
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '导演',
  `one_class_tag_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `two_class_tag_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `three_class_tag_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publish_admin_id` bigint(20) NOT NULL COMMENT '绑定用户',
  `is_block_search` int(1) NOT NULL COMMENT '是否屏蔽搜索 1 为屏蔽 2 为不屏蔽',
  `performer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_user_publish` int(1) NULL DEFAULT 0 COMMENT '0 为运营方提交 1 为用户提交',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 629 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES (629, '12', '123', NULL, '123', '0', '2020-11-02 15:33:17', '2020-11-02 15:33:17', 9, 'Admin', 1, 1, '123', '2', '18,42', '19', 26, 2, NULL, 0);
INSERT INTO `album` VALUES (630, '123', '123', NULL, '13', '0', '2020-11-02 15:34:54', '2020-11-02 15:34:54', 9, 'Admin', 2, 1, '123', '2', '18,42', '19', 26, 2, NULL, 0);
INSERT INTO `album` VALUES (631, '123', '123', NULL, '13', '0', '2020-11-02 15:35:03', '2020-11-02 15:35:03', 9, 'Admin', 2, 1, '123', '2', '18,42', '19', 26, 2, NULL, 0);
INSERT INTO `album` VALUES (632, '123', '123', NULL, '13', '0', '2020-11-02 15:35:08', '2020-11-02 15:35:08', 9, 'Admin', 2, 1, '123', '2', '18,42', '19', 26, 2, NULL, 0);
INSERT INTO `album` VALUES (633, '123', '123', NULL, '13', '0', '2020-11-02 15:35:17', '2020-11-02 15:35:17', 9, 'Admin', 2, 1, '123', '2', '18,42', '19', 26, 2, NULL, 0);
INSERT INTO `album` VALUES (634, '12', '21233', NULL, '12', '0', '2020-11-02 15:37:20', '2020-11-02 15:37:20', 9, 'Admin', 2, 1, '22', '2', '42,18', '19', 26, 2, NULL, 0);
INSERT INTO `album` VALUES (635, '12', '21233', NULL, '12', '0', '2020-11-02 15:37:25', '2020-11-02 15:37:25', 9, 'Admin', 2, 1, '22', '2', '42,18', '19', 26, 2, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (4, 9, '2020-09-25 14:49:41', '2020-11-02 16:57:01', 181, '2020-11-02 15:47:27');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '测试', 0, '', NULL, '2020-09-22 14:15:08', '2020-09-22 14:15:08', 1);
INSERT INTO `permission` VALUES (2, '测试', 0, '', NULL, '2020-09-25 17:36:15', '2020-09-25 17:36:15', 1);
INSERT INTO `permission` VALUES (3, '测试', 0, '', NULL, '2020-10-16 09:36:17', '2020-10-16 09:36:17', 1);
INSERT INTO `permission` VALUES (4, '测试', 0, '', NULL, '2020-10-16 09:39:49', '2020-10-16 09:39:49', 1);
INSERT INTO `permission` VALUES (5, '测试', 0, '', NULL, '2020-10-16 09:55:33', '2020-10-16 09:55:33', 1);
INSERT INTO `permission` VALUES (6, '测试', 0, '', NULL, '2020-10-16 10:08:54', '2020-10-16 10:08:54', 1);
INSERT INTO `permission` VALUES (7, '测试', 0, '', NULL, '2020-10-16 10:18:17', '2020-10-16 10:18:17', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (4, 'admin', 0, NULL, '2020-09-22 11:36:38', '2020-09-22 11:36:38', 1, 1, '管理员');
INSERT INTO `role` VALUES (5, 'operate', 0, NULL, '2020-09-22 11:36:38', '2020-09-22 11:36:38', 1, 1, '运营');
INSERT INTO `role` VALUES (6, 'generalStaff', 0, NULL, '2020-09-22 11:36:38', '2020-09-22 11:36:38', 1, 1, '普通人员');
INSERT INTO `role` VALUES (7, 'admin1', 0, NULL, '2020-10-16 09:36:17', '2020-10-16 09:36:17', 1, 1, '管理员');

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
INSERT INTO `role_permission` VALUES (7, 2);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `update_admin_id` bigint(20) NOT NULL,
  `update_admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_tag_id` int(11) NOT NULL COMMENT '父标签的id -1为根标签',
  `type` int(1) NOT NULL COMMENT '标签等级 1 一级标签 2 二级标签 3 三级标签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (2, '测试一级标签2', '2020-10-16 10:55:15', '2020-10-16 10:55:15', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (3, '测试一级标签', '2020-10-16 10:56:25', '2020-10-16 10:56:25', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (4, '测试一级标签', '2020-10-16 10:56:27', '2020-10-16 10:56:27', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (5, '测试一级标签', '2020-10-16 10:56:30', '2020-10-16 10:56:30', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (6, '测试一级标签', '2020-10-16 10:56:48', '2020-10-16 10:56:48', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (7, '测试一级标签', '2020-10-16 10:57:04', '2020-10-16 10:57:04', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (8, '测试一级标签', '2020-10-16 10:57:12', '2020-10-16 10:57:12', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (9, '测试一级标签', '2020-10-16 10:57:36', '2020-10-16 10:57:36', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (10, '测试一级标签', '2020-10-21 16:28:11', '2020-10-21 16:28:11', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (11, '测试一级标签', '2020-10-21 16:29:40', '2020-10-21 16:29:40', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (12, 'undefined', '2020-10-21 16:30:57', '2020-10-21 16:30:57', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (13, 'undefined', '2020-10-21 16:32:40', '2020-10-21 16:32:40', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (14, 'undefined', '2020-10-21 16:36:20', '2020-10-21 16:36:20', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (15, '123', '2020-10-21 16:37:21', '2020-10-21 16:37:21', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (16, '123', '2020-10-23 13:49:01', '2020-10-23 13:49:01', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (17, '123', '2020-10-23 14:52:04', '2020-10-23 14:52:04', 9, 'Admin', 1, 2);
INSERT INTO `tag` VALUES (18, '321', '2020-10-23 14:53:05', '2020-10-23 14:53:05', 9, 'Admin', 2, 2);
INSERT INTO `tag` VALUES (19, '123', '2020-10-23 15:04:03', '2020-10-23 15:04:03', 9, 'Admin', 18, 3);
INSERT INTO `tag` VALUES (20, '123', '2020-10-23 15:04:42', '2020-10-23 15:04:42', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (21, '11', '2020-10-23 15:05:10', '2020-10-23 15:05:10', 9, 'Admin', -1, 1);
INSERT INTO `tag` VALUES (22, '测试1', '2020-10-23 15:37:13', '2020-10-23 15:37:13', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (23, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (24, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (25, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (26, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (27, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (28, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (29, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (30, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (31, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (32, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (33, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (34, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (35, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (36, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (37, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (38, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (39, '测试1', '2020-10-23 15:37:14', '2020-10-23 15:37:14', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (40, '测试1', '2020-10-23 15:37:15', '2020-10-23 15:37:15', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (41, '测试1', '2020-10-23 15:37:15', '2020-10-23 15:37:15', 1, '11', 1, 2);
INSERT INTO `tag` VALUES (42, '测试父tag为2 0', '2020-10-29 16:32:37', '2020-10-29 16:32:37', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (43, '测试父tag为2 1', '2020-10-29 16:32:37', '2020-10-29 16:32:37', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (44, '测试父tag为2 2', '2020-10-29 16:32:37', '2020-10-29 16:32:37', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (45, '测试父tag为2 3', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (46, '测试父tag为2 4', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (47, '测试父tag为2 5', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (48, '测试父tag为2 6', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (49, '测试父tag为2 7', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (50, '测试父tag为2 8', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (51, '测试父tag为2 9', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (52, '测试父tag为2 10', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (53, '测试父tag为2 11', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (54, '测试父tag为2 12', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (55, '测试父tag为2 13', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (56, '测试父tag为2 14', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (57, '测试父tag为2 15', '2020-10-29 16:32:38', '2020-10-29 16:32:38', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (58, '测试父tag为2 16', '2020-10-29 16:32:39', '2020-10-29 16:32:39', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (59, '测试父tag为2 17', '2020-10-29 16:32:39', '2020-10-29 16:32:39', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (60, '测试父tag为2 18', '2020-10-29 16:32:39', '2020-10-29 16:32:39', 1, '11', 2, 2);
INSERT INTO `tag` VALUES (61, '测试父tag为2 19', '2020-10-29 16:32:39', '2020-10-29 16:32:39', 1, '11', 2, 2);

SET FOREIGN_KEY_CHECKS = 1;

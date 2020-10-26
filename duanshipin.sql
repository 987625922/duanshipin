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

 Date: 26/10/2020 18:06:27
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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `img_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total_mun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_mun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `update_admin_id` bigint(11) NOT NULL,
  `update_admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT 2 COMMENT '1.上线 2.草稿 3.回收站 4.推荐',
  `is_commplete` int(1) NOT NULL COMMENT '是否完结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 625 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES (2, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-09 11:08:27', '2020-10-09 11:08:27', 9, 'Admin', 4, 0);
INSERT INTO `album` VALUES (3, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-09 11:19:26', '2020-10-09 11:19:26', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (5, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:48', '2020-10-10 10:47:48', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (6, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (7, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (8, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (9, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (10, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (11, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (12, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (13, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (14, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:47:49', '2020-10-10 10:47:49', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (15, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (16, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (17, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (18, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (19, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (20, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (21, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 1, 0);
INSERT INTO `album` VALUES (22, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (23, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (24, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-10 10:48:30', '2020-10-10 10:48:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (25, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (26, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (27, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (28, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (29, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (30, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (31, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (32, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (33, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (34, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (35, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (36, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (37, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (38, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:29', '2020-10-12 11:09:29', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (39, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (40, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (41, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (42, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (43, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 3, 0);
INSERT INTO `album` VALUES (44, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (45, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (46, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (47, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (48, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (49, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (50, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (51, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (52, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (53, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (54, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (55, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:30', '2020-10-12 11:09:30', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (56, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (57, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (58, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (59, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (60, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (61, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (62, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (63, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (64, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (65, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (66, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (67, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (68, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (69, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (70, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (71, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:31', '2020-10-12 11:09:31', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (72, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:32', '2020-10-12 11:09:32', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (73, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:32', '2020-10-12 11:09:32', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (74, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:09:32', '2020-10-12 11:09:32', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (75, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (76, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (77, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (78, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (79, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (80, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (81, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (82, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (83, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (84, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (85, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (86, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (87, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (88, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (89, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:17', '2020-10-12 11:29:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (90, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (91, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (92, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (93, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (94, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (95, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (96, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (97, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (98, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (99, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (100, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (101, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (102, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (103, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (104, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:18', '2020-10-12 11:29:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (105, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (106, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (107, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (108, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (109, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (110, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (111, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (112, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (113, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (114, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (115, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (116, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (117, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:19', '2020-10-12 11:29:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (118, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (119, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (120, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (121, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (122, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (123, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (124, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-12 11:29:20', '2020-10-12 11:29:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (125, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (126, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (127, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (128, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (129, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (130, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (131, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (132, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (133, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (134, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:18', '2020-10-16 09:36:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (135, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (136, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (137, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (138, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (139, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (140, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (141, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (142, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (143, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (144, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (145, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:19', '2020-10-16 09:36:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (146, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (147, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (148, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (149, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (150, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (151, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (152, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (153, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (154, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (155, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (156, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (157, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (158, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (159, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:20', '2020-10-16 09:36:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (160, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (161, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (162, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (163, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (164, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (165, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (166, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (167, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (168, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (169, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (170, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (171, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:21', '2020-10-16 09:36:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (172, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (173, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (174, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (175, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (176, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (177, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (178, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (179, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (180, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (181, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (182, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (183, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (184, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:22', '2020-10-16 09:36:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (185, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (186, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (187, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (188, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (189, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (190, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (191, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (192, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (193, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (194, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (195, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (196, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (197, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (198, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:23', '2020-10-16 09:36:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (199, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (200, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (201, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (202, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (203, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (204, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (205, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (206, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (207, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (208, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (209, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (210, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (211, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (212, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:24', '2020-10-16 09:36:24', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (213, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (214, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (215, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (216, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (217, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (218, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (219, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (220, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (221, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (222, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (223, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (224, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:36:25', '2020-10-16 09:36:25', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (225, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (226, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (227, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (228, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (229, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (230, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (231, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (232, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (233, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (234, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:49', '2020-10-16 09:39:49', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (235, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (236, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (237, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (238, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (239, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (240, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (241, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (242, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (243, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (244, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (245, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (246, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (247, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:50', '2020-10-16 09:39:50', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (248, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (249, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (250, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (251, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (252, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (253, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (254, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (255, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (256, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (257, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (258, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (259, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (260, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (261, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (262, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:51', '2020-10-16 09:39:51', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (263, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (264, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (265, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (266, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (267, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (268, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (269, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (270, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (271, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (272, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (273, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (274, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (275, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:52', '2020-10-16 09:39:52', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (276, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (277, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (278, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (279, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (280, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (281, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (282, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (283, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (284, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (285, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (286, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (287, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (288, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:53', '2020-10-16 09:39:53', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (289, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (290, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (291, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (292, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (293, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (294, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (295, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (296, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (297, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (298, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (299, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (300, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (301, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (302, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:54', '2020-10-16 09:39:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (303, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (304, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (305, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (306, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (307, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (308, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (309, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (310, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (311, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (312, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (313, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (314, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (315, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (316, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (317, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:55', '2020-10-16 09:39:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (318, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (319, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (320, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (321, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (322, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (323, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (324, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:39:56', '2020-10-16 09:39:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (325, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:33', '2020-10-16 09:55:33', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (326, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:33', '2020-10-16 09:55:33', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (327, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:33', '2020-10-16 09:55:33', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (328, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:33', '2020-10-16 09:55:33', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (329, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:33', '2020-10-16 09:55:33', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (330, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (331, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (332, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (333, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (334, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (335, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (336, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (337, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (338, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (339, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (340, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (341, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (342, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (343, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:34', '2020-10-16 09:55:34', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (344, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (345, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (346, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (347, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (348, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (349, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (350, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (351, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (352, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (353, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (354, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (355, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (356, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (357, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:35', '2020-10-16 09:55:35', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (358, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (359, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (360, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (361, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (362, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (363, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (364, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (365, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (366, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (367, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (368, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (369, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (370, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (371, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (372, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:36', '2020-10-16 09:55:36', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (373, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (374, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (375, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (376, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (377, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (378, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (379, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (380, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (381, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (382, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (383, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (384, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (385, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (386, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (387, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:37', '2020-10-16 09:55:37', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (388, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (389, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (390, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (391, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (392, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (393, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (394, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (395, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (396, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (397, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (398, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:38', '2020-10-16 09:55:38', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (399, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (400, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (401, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (402, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (403, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (404, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (405, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (406, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (407, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (408, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (409, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (410, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (411, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (412, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:39', '2020-10-16 09:55:39', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (413, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (414, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (415, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (416, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (417, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (418, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (419, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (420, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (421, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (422, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (423, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (424, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 09:55:40', '2020-10-16 09:55:40', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (425, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:54', '2020-10-16 10:08:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (426, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:54', '2020-10-16 10:08:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (427, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:54', '2020-10-16 10:08:54', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (428, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (429, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (430, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (431, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (432, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (433, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (434, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (435, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (436, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (437, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (438, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (439, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (440, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:55', '2020-10-16 10:08:55', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (441, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (442, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (443, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (444, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (445, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (446, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (447, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (448, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (449, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (450, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (451, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (452, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (453, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (454, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:56', '2020-10-16 10:08:56', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (455, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (456, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (457, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (458, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (459, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (460, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (461, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (462, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (463, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (464, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (465, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (466, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (467, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (468, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (469, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:57', '2020-10-16 10:08:57', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (470, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (471, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (472, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (473, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (474, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (475, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (476, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (477, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (478, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (479, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (480, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (481, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (482, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (483, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:58', '2020-10-16 10:08:58', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (484, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (485, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (486, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (487, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (488, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (489, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (490, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (491, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (492, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (493, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (494, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (495, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (496, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (497, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (498, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:08:59', '2020-10-16 10:08:59', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (499, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (500, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (501, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (502, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (503, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (504, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (505, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (506, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (507, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (508, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (509, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (510, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (511, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (512, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:00', '2020-10-16 10:09:00', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (513, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (514, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (515, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (516, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (517, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (518, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (519, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (520, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (521, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (522, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (523, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (524, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:09:01', '2020-10-16 10:09:01', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (525, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:17', '2020-10-16 10:18:17', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (526, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (527, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (528, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (529, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (530, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (531, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (532, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (533, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (534, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (535, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (536, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (537, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (538, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (539, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (540, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (541, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:18', '2020-10-16 10:18:18', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (542, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (543, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (544, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (545, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (546, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (547, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (548, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (549, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (550, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (551, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (552, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (553, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (554, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (555, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (556, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (557, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (558, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (559, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (560, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (561, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:19', '2020-10-16 10:18:19', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (562, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (563, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (564, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (565, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (566, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (567, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (568, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (569, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (570, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (571, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (572, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (573, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (574, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (575, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (576, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (577, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (578, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (579, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:20', '2020-10-16 10:18:20', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (580, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (581, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (582, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (583, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (584, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (585, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (586, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (587, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (588, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (589, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (590, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (591, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (592, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (593, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (594, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (595, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:21', '2020-10-16 10:18:21', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (596, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (597, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (598, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (599, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (600, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (601, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (602, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (603, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (604, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (605, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (606, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (607, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (608, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (609, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (610, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (611, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (612, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:22', '2020-10-16 10:18:22', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (613, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (614, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (615, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (616, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (617, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (618, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (619, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (620, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (621, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (622, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (623, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (624, '测试的专辑标题', NULL, NULL, '30', '0', '2020-10-16 10:18:23', '2020-10-16 10:18:23', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (625, '1', '1', NULL, '0', '0', '2020-10-26 17:35:41', '2020-10-26 17:35:41', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (626, '1', '1', NULL, '0', '0', '2020-10-26 17:36:45', '2020-10-26 17:36:45', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (627, '1', '', NULL, '0', '0', '2020-10-26 17:42:45', '2020-10-26 17:42:45', 9, 'Admin', 2, 0);
INSERT INTO `album` VALUES (628, '1', '', '586cb5a6-c258-437f-b739-3ee8b4b95261.jpg', '0', '0', '2020-10-26 17:47:58', '2020-10-26 17:47:58', 9, 'Admin', 2, 0);

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
INSERT INTO `login_log` VALUES (4, 9, '2020-09-25 14:49:41', '2020-10-26 17:50:41', 160, '2020-10-26 17:42:29');

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (2, '测试一级标签', '2020-10-16 10:55:15', '2020-10-16 10:55:15', 9, 'Admin', -1, 1);
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
INSERT INTO `tag` VALUES (19, '123', '2020-10-23 15:04:03', '2020-10-23 15:04:03', 9, 'Admin', -1, 3);
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

SET FOREIGN_KEY_CHECKS = 1;

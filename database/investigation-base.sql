/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 127.0.0.1:33060
 Source Schema         : inv

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 23/06/2019 22:09:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inv_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `inv_advertisement`;
CREATE TABLE `inv_advertisement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `incarnation_id` int(11) NOT NULL COMMENT '化身id',
  `on_file_id` int(11) NOT NULL COMMENT '广告在化身上的图片文件id',
  `side_file_id` int(11) NOT NULL COMMENT '广告在化身旁边的图片文件id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_answer
-- ----------------------------
DROP TABLE IF EXISTS `inv_answer`;
CREATE TABLE `inv_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `option_id` int(11) NOT NULL COMMENT '选项id',
  `grades` int(11) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_approve
-- ----------------------------
DROP TABLE IF EXISTS `inv_approve`;
CREATE TABLE `inv_approve`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `incarnation_id` int(10) NOT NULL COMMENT '化身id',
  `order` int(1) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`, `user_id`, `incarnation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_approve
-- ----------------------------
INSERT INTO `inv_approve` VALUES (1, 10, 5, 6);

-- ----------------------------
-- Table structure for inv_file
-- ----------------------------
DROP TABLE IF EXISTS `inv_file`;
CREATE TABLE `inv_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_file
-- ----------------------------
INSERT INTO `inv_file` VALUES (15, 'http://inv.test/storage', '/1/9fJeKWi-OCY4l78Lq-RiOMTtilyLY6k-.png', 'image/png', 533781, 'QQ截图20161108124455.png');
INSERT INTO `inv_file` VALUES (24, 'http://inv.test/storage', '/1/coNRWtx6Udmxdj2SoUhms4Jr5TksDoS3.png', 'image/png', 12137, 'recommend.png');
INSERT INTO `inv_file` VALUES (25, 'http://inv.test/storage', '/1/jOHxKLn8SQ6GKHGzcMWDBEfjZrRJaCxe.png', 'image/png', 11956, 'audit.png');
INSERT INTO `inv_file` VALUES (26, 'http://inv.test/storage', '/1/6rhHN8Qg6hY1mvsYtJhlNRaW-SPydZ6r.png', 'image/png', 12137, 'recommend.png');
INSERT INTO `inv_file` VALUES (27, 'http://inv.test/storage', '/1/D0ltGCx7_weoAm1V85NxWoV9vJ0hHt_u.png', 'image/png', 11956, 'audit.png');

-- ----------------------------
-- Table structure for inv_immerse
-- ----------------------------
DROP TABLE IF EXISTS `inv_immerse`;
CREATE TABLE `inv_immerse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `incarnation_id` int(11) NOT NULL COMMENT '化身id',
  `order` int(1) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`, `user_id`, `incarnation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_immerse
-- ----------------------------
INSERT INTO `inv_immerse` VALUES (1, 10, 5, 6);

-- ----------------------------
-- Table structure for inv_incarnation
-- ----------------------------
DROP TABLE IF EXISTS `inv_incarnation`;
CREATE TABLE `inv_incarnation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '化身名称',
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '化身图片id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_incarnation
-- ----------------------------
INSERT INTO `inv_incarnation` VALUES (5, 'xuzhou', '15', '123456', 'male');

-- ----------------------------
-- Table structure for inv_log
-- ----------------------------
DROP TABLE IF EXISTS `inv_log`;
CREATE TABLE `inv_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `log_time` double NULL DEFAULT NULL,
  `prefix` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_log_level`(`level`) USING BTREE,
  INDEX `idx_log_category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_option
-- ----------------------------
DROP TABLE IF EXISTS `inv_option`;
CREATE TABLE `inv_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grades` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_option
-- ----------------------------
INSERT INTO `inv_option` VALUES (1, 12, 'option', 6, 'desc');

-- ----------------------------
-- Table structure for inv_question
-- ----------------------------
DROP TABLE IF EXISTS `inv_question`;
CREATE TABLE `inv_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `incarnation_id` int(11) NULL DEFAULT NULL COMMENT '化身id',
  `reverse` int(11) NOT NULL DEFAULT 1 COMMENT '答案分支是否反转,1否，2是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_question
-- ----------------------------
INSERT INTO `inv_question` VALUES (12, '10asdasdasd', 'des', 1, NULL, 1);

-- ----------------------------
-- Table structure for inv_realistic_self
-- ----------------------------
DROP TABLE IF EXISTS `inv_realistic_self`;
CREATE TABLE `inv_realistic_self`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '现实自我认知id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '问题id',
  `option_id` int(11) NULL DEFAULT NULL COMMENT '选项id',
  `grades` int(11) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_token
-- ----------------------------
DROP TABLE IF EXISTS `inv_token`;
CREATE TABLE `inv_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `token` varchar(40) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `expire_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_type
-- ----------------------------
DROP TABLE IF EXISTS `inv_type`;
CREATE TABLE `inv_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问题类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_type
-- ----------------------------
INSERT INTO `inv_type` VALUES (1, 'type', 'description');

-- ----------------------------
-- Table structure for inv_user
-- ----------------------------
DROP TABLE IF EXISTS `inv_user`;
CREATE TABLE `inv_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '用户角色，1测试人员，2系统管理员',
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logged_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户状态，0待审核，1启用，2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_user
-- ----------------------------
INSERT INTO `inv_user` VALUES (10, 'xuzhou', '$2y$13$LFT8x8uZRpLpRo91IblZ7.CdxVxKEyyNHcEjZjn6eXaURq1Rxdgo6', 'YKfHNcxpoY1qzVwQQbkxXuTWRxWuRLAW', NULL, '13288888889', 'male', 'cmc', 19, 'admin', '1560578345', '1560578345', '1561298498', '1');
INSERT INTO `inv_user` VALUES (11, '许超password', '$2y$13$UH7T6q9OCBUDngS.8.KbjeEXditXdaVwAr0jr6fyhJVEbLMPOkvui', 'ws-vtd5reEzKCqfBE444LUfIL2MvpT9G', NULL, '13795699480', 'male', '华栖云', 25, 'admin', '1560856999', '1560856999', NULL, '1');
INSERT INTO `inv_user` VALUES (12, '许超2', '$2y$13$opO/120rnCek5aw3b0Q.uOqZUxvUfVW5lhy5VphHZTsXWzlL5FnEW', 'hjVRmxJdVrnLzp8X4-Z4eibwlvdXpIce', NULL, '13795699481', 'male', '野鸡', 25, 'user', '1560859224', '1560859224', NULL, '1');
INSERT INTO `inv_user` VALUES (13, '许超3', '$2y$13$yB7IoMFcsnB0VRpWXCmjVev3qNgDJTIgMsuI0ZQI4qvNPdXsSC0eS', 'KY2vwhkSorwSyqwUxcSZTYrygrussrDS', NULL, '13795699483', 'male', '野鸡', 25, 'user', '1560859251', '1560859251', NULL, '1');
INSERT INTO `inv_user` VALUES (14, 'xuchao', '$2y$13$oUY61gRKEyTbJ1lnd6gI3.tP/zhwmssVYcenYMwbkX83id.rJDkwi', 'qDWSCwQeDBKGvoaAF4ZRqXVpN4hXYxiX', NULL, '13795699484', 'male', '野鸡', 25, 'user', '1560859348', '1560859348', '1560862615', '1');
INSERT INTO `inv_user` VALUES (15, 'niubi', '$2y$13$Vn7htzsTPhoPcLzYu/WS4uR3RRUmCIEdfn1qLZYZem40IsSXyZB42', 'iMYCoyf0dB5F9HhUjjwcTpgvLoB55eaU', NULL, '13795699486', 'male', '野鸡', 25, 'user', '1560860447', '1560860447', NULL, '0');

-- ----------------------------
-- Table structure for inv_virtual_self
-- ----------------------------
DROP TABLE IF EXISTS `inv_virtual_self`;
CREATE TABLE `inv_virtual_self`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟自我认知id',
  `incarnation_id` int(11) NULL DEFAULT NULL COMMENT '化身id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '问题id',
  `option_id` int(11) NULL DEFAULT NULL COMMENT '选项id',
  `grades` int(11) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

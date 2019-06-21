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

 Date: 21/06/2019 14:47:28
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
  `file_id` int(11) NOT NULL COMMENT '图片文件id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告描述',
  `grades` int(1) NOT NULL COMMENT '分值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inv_user
-- ----------------------------
DROP TABLE IF EXISTS `inv_user`;
CREATE TABLE `inv_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
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

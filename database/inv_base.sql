/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云开发环境
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : 118.89.220.158:3306
 Source Schema         : inv

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 09/07/2019 18:52:09
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_advertisement
-- ----------------------------
INSERT INTO `inv_advertisement` VALUES (2, 1, 13, 14, 'aaaaa');
INSERT INTO `inv_advertisement` VALUES (3, 2, 15, 16, 'bbbbb');
INSERT INTO `inv_advertisement` VALUES (4, 3, 17, 18, 'ccccc');
INSERT INTO `inv_advertisement` VALUES (5, 4, 19, 20, 'ddddd');
INSERT INTO `inv_advertisement` VALUES (6, 5, 21, 22, 'eeeeee');
INSERT INTO `inv_advertisement` VALUES (7, 6, 23, 24, 'fffffff');
INSERT INTO `inv_advertisement` VALUES (8, 7, 25, 26, 'ggggggg');
INSERT INTO `inv_advertisement` VALUES (9, 8, 27, 28, 'hhhhhh');
INSERT INTO `inv_advertisement` VALUES (10, 9, 29, 30, 'iiiiii');
INSERT INTO `inv_advertisement` VALUES (11, 10, 31, 32, 'jjjjjjjj');
INSERT INTO `inv_advertisement` VALUES (13, 12, 35, 36, 'llllll');
INSERT INTO `inv_advertisement` VALUES (14, 11, 37, 38, 'llllllllllllllllll');

-- ----------------------------
-- Table structure for inv_advertisement_answer
-- ----------------------------
DROP TABLE IF EXISTS `inv_advertisement_answer`;
CREATE TABLE `inv_advertisement_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `grades` int(2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_advertisement_option
-- ----------------------------
DROP TABLE IF EXISTS `inv_advertisement_option`;
CREATE TABLE `inv_advertisement_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_id` int(11) NULL DEFAULT NULL,
  `grades` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_advertisement_option
-- ----------------------------
INSERT INTO `inv_advertisement_option` VALUES (1, 1, '1.png', 41, 0);
INSERT INTO `inv_advertisement_option` VALUES (2, 1, '2.png', 42, 0);
INSERT INTO `inv_advertisement_option` VALUES (3, 1, '3.png', 43, 0);
INSERT INTO `inv_advertisement_option` VALUES (4, 1, '4.png', 44, 2);
INSERT INTO `inv_advertisement_option` VALUES (5, 1, '5.png', 45, 0);
INSERT INTO `inv_advertisement_option` VALUES (6, 3, '0.png', 46, 2);
INSERT INTO `inv_advertisement_option` VALUES (7, 3, '1.png', 47, 0);
INSERT INTO `inv_advertisement_option` VALUES (8, 3, '2.png', 48, 0);
INSERT INTO `inv_advertisement_option` VALUES (9, 3, '3.png', 49, 0);
INSERT INTO `inv_advertisement_option` VALUES (10, 3, '4.png', 50, 0);
INSERT INTO `inv_advertisement_option` VALUES (11, 2, '我运动我存在', NULL, 0);
INSERT INTO `inv_advertisement_option` VALUES (12, 2, '一切皆有可能', NULL, 0);
INSERT INTO `inv_advertisement_option` VALUES (13, 2, '把精彩留给自己', NULL, 0);
INSERT INTO `inv_advertisement_option` VALUES (14, 2, '一切皆有可能', NULL, 0);
INSERT INTO `inv_advertisement_option` VALUES (15, 2, '让改变发生', NULL, 2);

-- ----------------------------
-- Table structure for inv_advertisement_question
-- ----------------------------
DROP TABLE IF EXISTS `inv_advertisement_question`;
CREATE TABLE `inv_advertisement_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_advertisement_question
-- ----------------------------
INSERT INTO `inv_advertisement_question` VALUES (1, '在前面游戏角色界面中植入的是哪一个样式的品牌Logo？', '图片选择');
INSERT INTO `inv_advertisement_question` VALUES (2, '在前面游戏角色界面植入的Logo中，广告语是以下哪一个？', '广告语');
INSERT INTO `inv_advertisement_question` VALUES (3, '在前面游戏角色界面所植入品牌Logo中，字体位置是以下哪一种？', '位置判断');

-- ----------------------------
-- Table structure for inv_approve
-- ----------------------------
DROP TABLE IF EXISTS `inv_approve`;
CREATE TABLE `inv_approve`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `incarnation_id` int(10) NOT NULL COMMENT '化身id',
  `grades` int(1) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`, `user_id`, `incarnation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_approve
-- ----------------------------

-- ----------------------------
-- Table structure for inv_config
-- ----------------------------
DROP TABLE IF EXISTS `inv_config`;
CREATE TABLE `inv_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `required` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_config
-- ----------------------------
INSERT INTO `inv_config` VALUES (1, 'round', '0', '当前系统分组轮数', 'text', '1');

-- ----------------------------
-- Table structure for inv_ego_answer
-- ----------------------------
DROP TABLE IF EXISTS `inv_ego_answer`;
CREATE TABLE `inv_ego_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `incarnation_id` int(11) NOT NULL DEFAULT -1,
  `grades` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 495 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_answer
-- ----------------------------

-- ----------------------------
-- Table structure for inv_ego_difference_grades
-- ----------------------------
DROP TABLE IF EXISTS `inv_ego_difference_grades`;
CREATE TABLE `inv_ego_difference_grades`  (
  `user_id` int(11) NOT NULL,
  `incarnation_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1外倾性，2宜人性，3尽责性，4神经质，5开放性',
  `grades` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `incarnation_id`, `type`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_difference_grades
-- ----------------------------

-- ----------------------------
-- Table structure for inv_ego_option
-- ----------------------------
DROP TABLE IF EXISTS `inv_ego_option`;
CREATE TABLE `inv_ego_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grades` int(2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_option
-- ----------------------------
INSERT INTO `inv_ego_option` VALUES (1, 1, '非常反对', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (2, 1, '比较反对', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (3, 1, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (4, 1, '比较认同', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (5, 1, '非常认同', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (6, 2, '非常反对', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (7, 2, '比较反对', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (8, 2, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (9, 2, '比较认同', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (10, 2, '非常认同', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (11, 3, '非常反对', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (12, 3, '比较反对', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (13, 3, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (14, 3, '比较认同', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (15, 3, '非常认同', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (16, 4, '非常反对', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (17, 4, '比较反对', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (18, 4, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (19, 4, '比较认同', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (20, 4, '非常认同', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (21, 5, '非常反对', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (22, 5, '比较反对', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (23, 5, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (24, 5, '比较认同', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (25, 5, '非常认同', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (26, 6, '非常反对', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (27, 6, '比较反对', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (28, 6, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (29, 6, '比较认同', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (30, 6, '非常认同', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (31, 7, '非常反对', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (32, 7, '比较反对', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (33, 7, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (34, 7, '比较认同', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (35, 7, '非常认同', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (36, 8, '非常反对', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (37, 8, '比较反对', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (38, 8, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (39, 8, '比较认同', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (40, 8, '非常认同', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (41, 9, '非常反对', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (42, 9, '比较反对', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (43, 9, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (44, 9, '比较认同', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (45, 9, '非常认同', 5, NULL);
INSERT INTO `inv_ego_option` VALUES (46, 10, '非常反对', 1, NULL);
INSERT INTO `inv_ego_option` VALUES (47, 10, '比较反对', 2, NULL);
INSERT INTO `inv_ego_option` VALUES (48, 10, '既不认同也不反对', 3, NULL);
INSERT INTO `inv_ego_option` VALUES (49, 10, '比较认同', 4, NULL);
INSERT INTO `inv_ego_option` VALUES (50, 10, '非常认同', 5, NULL);

-- ----------------------------
-- Table structure for inv_ego_question
-- ----------------------------
DROP TABLE IF EXISTS `inv_ego_question`;
CREATE TABLE `inv_ego_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1外倾性，2宜人性，3尽责性，4神经质，5开放性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_question
-- ----------------------------
INSERT INTO `inv_ego_question` VALUES (1, '是一个保守的人', '自我差异', '1');
INSERT INTO `inv_ego_question` VALUES (2, '是一个值得信赖的人', '自我差异', '2');
INSERT INTO `inv_ego_question` VALUES (3, '是一个比较有惰性的人', '自我差异', '3');
INSERT INTO `inv_ego_question` VALUES (4, '是一个比较放松，能很好应对压力的人', '自我差异', '4');
INSERT INTO `inv_ego_question` VALUES (5, '是一个对艺术没有什么兴趣的人', '自我差异', '5');
INSERT INTO `inv_ego_question` VALUES (6, '是一个外向的，善于交际的人', '自我差异', '1');
INSERT INTO `inv_ego_question` VALUES (7, '是一个容易对别人吹毛求疵的人', '自我差异', '2');
INSERT INTO `inv_ego_question` VALUES (8, '是一个做事情比较彻底的人', '自我差异', '3');
INSERT INTO `inv_ego_question` VALUES (9, '是一个容易紧张的人', '自我差异', '4');
INSERT INTO `inv_ego_question` VALUES (10, '是一个想象力丰富的人', '自我差异', '5');

-- ----------------------------
-- Table structure for inv_emotion_answer
-- ----------------------------
DROP TABLE IF EXISTS `inv_emotion_answer`;
CREATE TABLE `inv_emotion_answer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_emotion_answer
-- ----------------------------

-- ----------------------------
-- Table structure for inv_emotion_option
-- ----------------------------
DROP TABLE IF EXISTS `inv_emotion_option`;
CREATE TABLE `inv_emotion_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grades` int(2) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_emotion_option
-- ----------------------------
INSERT INTO `inv_emotion_option` VALUES (1, 1, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (2, 1, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (3, 1, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (4, 1, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (5, 1, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (6, 2, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (7, 2, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (8, 2, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (9, 2, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (10, 2, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (11, 3, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (12, 3, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (13, 3, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (14, 3, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (15, 3, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (16, 4, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (17, 4, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (18, 4, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (19, 4, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (20, 4, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (21, 5, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (22, 5, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (23, 5, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (24, 5, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (25, 5, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (26, 6, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (27, 6, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (28, 6, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (29, 6, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (30, 6, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (31, 7, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (32, 7, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (33, 7, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (34, 7, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (35, 7, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (36, 8, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (37, 8, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (38, 8, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (39, 8, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (40, 8, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (41, 9, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (42, 9, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (43, 9, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (44, 9, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (45, 9, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (46, 10, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (47, 10, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (48, 10, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (49, 10, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (50, 10, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (51, 11, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (52, 11, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (53, 11, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (54, 11, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (55, 11, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (56, 12, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (57, 12, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (58, 12, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (59, 12, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (60, 12, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (61, 13, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (62, 13, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (63, 13, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (64, 13, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (65, 13, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (66, 14, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (67, 14, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (68, 14, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (69, 14, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (70, 14, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (71, 15, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (72, 15, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (73, 15, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (74, 15, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (75, 15, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (76, 16, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (77, 16, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (78, 16, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (79, 16, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (80, 16, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (81, 17, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (82, 17, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (83, 17, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (84, 17, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (85, 17, '非常强', 5, NULL);
INSERT INTO `inv_emotion_option` VALUES (86, 18, '非常少或完全没有', 1, NULL);
INSERT INTO `inv_emotion_option` VALUES (87, 18, '有一点', 2, NULL);
INSERT INTO `inv_emotion_option` VALUES (88, 18, '中等', 3, NULL);
INSERT INTO `inv_emotion_option` VALUES (89, 18, '较强', 4, NULL);
INSERT INTO `inv_emotion_option` VALUES (90, 18, '非常强', 5, NULL);

-- ----------------------------
-- Table structure for inv_emotion_question
-- ----------------------------
DROP TABLE IF EXISTS `inv_emotion_question`;
CREATE TABLE `inv_emotion_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_emotion_question
-- ----------------------------
INSERT INTO `inv_emotion_question` VALUES (1, '活跃的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (2, '充满热情的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (3, '快乐的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (4, '兴高采烈的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (5, '兴奋的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (6, '自豪的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (7, '欣喜的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (8, '精神充沛的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (9, '感激的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (10, '难过的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (11, '害怕的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (12, '紧张的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (13, '惊恐的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (14, '内疚的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (15, '战战兢兢的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (16, '恼怒的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (17, '羞愧的', '情绪量化');
INSERT INTO `inv_emotion_question` VALUES (18, '易怒的', '情绪量化');

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_file
-- ----------------------------
INSERT INTO `inv_file` VALUES (1, 'http://188.131.207.200:8009/storage', '/1/yqdb_KNylEGszYIqaXvnQ3v9z6r25AFl.png', 'image/png', 383797, '暗夜男.png');
INSERT INTO `inv_file` VALUES (2, 'http://188.131.207.200:8009/storage', '/1/ZYdZ5G9JxQeTHnHkWMfYqpu4e9sWe-Sv.png', 'image/png', 301283, '暗夜女.png');
INSERT INTO `inv_file` VALUES (3, 'http://188.131.207.200:8009/storage', '/1/j4zYJeUF5DsAmo_iaqPIHBEXijRuEwWA.png', 'image/png', 517185, '德莱尼男.png');
INSERT INTO `inv_file` VALUES (4, 'http://188.131.207.200:8009/storage', '/1/djNfw2_5X1iqQQLP8UNNeDYETh4sQuiH.png', 'image/png', 294498, '德莱尼女.png');
INSERT INTO `inv_file` VALUES (5, 'http://188.131.207.200:8009/storage', '/1/ct6eWOSgJBESzM-QTcEZXuX-IvfAIAEE.png', 'image/png', 492353, '巨魔男.png');
INSERT INTO `inv_file` VALUES (6, 'http://188.131.207.200:8009/storage', '/1/khsOnGpSGEvFnyOSFDAz17jWonV6VoQF.png', 'image/png', 331167, '巨魔女.png');
INSERT INTO `inv_file` VALUES (7, 'http://188.131.207.200:8009/storage', '/1/Dls48oNKwEIl3Mvzr3O6_RFEaUNpE9CG.png', 'image/png', 549665, '牛头男.png');
INSERT INTO `inv_file` VALUES (8, 'http://188.131.207.200:8009/storage', '/1/eZqAUdbYh77OkyQ91wDQ7zIIpHzFHOYN.png', 'image/png', 374689, '牛头女.png');
INSERT INTO `inv_file` VALUES (9, 'http://188.131.207.200:8009/storage', '/1/jjosyM2RaLMwC4V26_HPfCajlUtr430_.png', 'image/png', 304216, '人类男.png');
INSERT INTO `inv_file` VALUES (10, 'http://188.131.207.200:8009/storage', '/1/tFKP91Dj417WjuRNvnQLpWPvqTzSCOqF.png', 'image/png', 206395, '人类女.png');
INSERT INTO `inv_file` VALUES (11, 'http://188.131.207.200:8009/storage', '/1/FYNayeOSW5JPP9WY3x4vnLcjmw7rmLZR.png', 'image/jpeg', 41934, '亡灵女.png');
INSERT INTO `inv_file` VALUES (12, 'http://188.131.207.200:8009/storage', '/1/p34V0h1aKEfFcsblpXXJFn33dyVQm3yi.png', 'image/jpeg', 58309, '亡灵男.png');
INSERT INTO `inv_file` VALUES (13, 'http://188.131.207.200:8009/storage', '/1/o9t2USiGGQg7eGmvaCyDk1B0lUUWoeeL.jpg', 'image/jpeg', 702865, '暗夜男-高关联.jpg');
INSERT INTO `inv_file` VALUES (14, 'http://188.131.207.200:8009/storage', '/1/wpWIKJNs5jc1PT_0-pDIWcCHOBykpafQ.jpg', 'image/jpeg', 700464, '暗夜男-低关联.jpg');
INSERT INTO `inv_file` VALUES (15, 'http://188.131.207.200:8009/storage', '/1/pXYM_43qJI1A_-kKspgENTAg6FrRx8oB.jpg', 'image/jpeg', 678942, '暗夜女-高关联.jpg');
INSERT INTO `inv_file` VALUES (16, 'http://188.131.207.200:8009/storage', '/1/O0ZjedNAhDog4ORrJf8gHpHlZA8mon_4.jpg', 'image/jpeg', 678104, '暗夜女-低关联.jpg');
INSERT INTO `inv_file` VALUES (17, 'http://188.131.207.200:8009/storage', '/1/Og_lBAHeMjTa3xsZK4WwiMq1KzEuKO3N.jpg', 'image/jpeg', 721974, '德莱尼男-高关联.jpg');
INSERT INTO `inv_file` VALUES (18, 'http://188.131.207.200:8009/storage', '/1/CyT9enuq0FRd__Uhf-9coo5L9YnDihtY.jpg', 'image/jpeg', 720518, '德莱尼男-低关联.jpg');
INSERT INTO `inv_file` VALUES (19, 'http://188.131.207.200:8009/storage', '/1/GDLpJI9DX3ZmwJ5qVP6ZWs7YcOu8o2n-.jpg', 'image/jpeg', 674355, '德莱尼女-高关联.jpg');
INSERT INTO `inv_file` VALUES (20, 'http://188.131.207.200:8009/storage', '/1/DXkDlknZyUyvLZ8aCyRlrA5voaka5r8Z.jpg', 'image/jpeg', 678899, '德莱尼女-低关联.jpg');
INSERT INTO `inv_file` VALUES (21, 'http://188.131.207.200:8009/storage', '/1/f8V3eMtWznglH6YLKJ2S9-vPaqT0oFSh.jpg', 'image/jpeg', 733099, '巨魔男-高关联.jpg');
INSERT INTO `inv_file` VALUES (22, 'http://188.131.207.200:8009/storage', '/1/96Q_yZjG0Jjv8HXAu55SnBK7weQAduwm.jpg', 'image/jpeg', 723913, '巨魔男-低关联.jpg');
INSERT INTO `inv_file` VALUES (23, 'http://188.131.207.200:8009/storage', '/1/e01jlSvWu2e3D0itPo-MCLK3r5DoaFep.jpg', 'image/jpeg', 677928, '巨魔女-高关联.jpg');
INSERT INTO `inv_file` VALUES (24, 'http://188.131.207.200:8009/storage', '/1/28xcrhAzFV8WlbzVCmU5s85U35ignPjf.jpg', 'image/jpeg', 676718, '巨魔女-低关联.jpg');
INSERT INTO `inv_file` VALUES (25, 'http://188.131.207.200:8009/storage', '/1/ClS7FJK9Mywa0Wqc0m6B054MS_L-sfn4.jpg', 'image/jpeg', 772311, '牛头男-高关联.jpg');
INSERT INTO `inv_file` VALUES (26, 'http://188.131.207.200:8009/storage', '/1/0p4faBYxDCVXAG5vY_he3XYZHmGxa9Vi.jpg', 'image/jpeg', 757875, '牛头男-低关联.jpg');
INSERT INTO `inv_file` VALUES (27, 'http://188.131.207.200:8009/storage', '/1/Tr4KUwf1O2Leudn2GWlMdXpFyDyCo-jD.jpg', 'image/jpeg', 700292, '牛头女-高关联.jpg');
INSERT INTO `inv_file` VALUES (28, 'http://188.131.207.200:8009/storage', '/1/SfqSGQG35TMHv5uFCK5u7J4qfxAjUIr_.jpg', 'image/jpeg', 691753, '牛头女-低关联.jpg');
INSERT INTO `inv_file` VALUES (29, 'http://188.131.207.200:8009/storage', '/1/iskMIjXofhc8APNv3ziIiPBEsBw0dXwO.jpg', 'image/jpeg', 683025, '人类男-高关联.jpg');
INSERT INTO `inv_file` VALUES (30, 'http://188.131.207.200:8009/storage', '/1/2X8p6PsB1KidinjmK5tJzwp4Qi_PZiKq.jpg', 'image/jpeg', 682309, '人类男-低关联.jpg');
INSERT INTO `inv_file` VALUES (31, 'http://188.131.207.200:8009/storage', '/1/omc8qDw_MbsIMMFKzGMPDfvGESBxps41.jpg', 'image/jpeg', 662009, '人类女-高关联.jpg');
INSERT INTO `inv_file` VALUES (32, 'http://188.131.207.200:8009/storage', '/1/QBFd9nijLESt7iv1ZcquKU-2qCp8LcQb.jpg', 'image/jpeg', 655433, '人类女-低关联.jpg');
INSERT INTO `inv_file` VALUES (35, 'http://188.131.207.200:8009/storage', '/1/PA8gxq-beAXDl0Py8jHNA6dc03-0HxAD.jpg', 'image/jpeg', 698089, '亡灵男-高关联.jpg');
INSERT INTO `inv_file` VALUES (36, 'http://188.131.207.200:8009/storage', '/1/epcVxknZ74nz3Po1Anw3hCVfrAg_dBhK.jpg', 'image/jpeg', 696457, '亡灵男-低关联.jpg');
INSERT INTO `inv_file` VALUES (37, 'http://188.131.207.200:8009/storage', '/1/BwCNQNgnJAUs2ohYJ0bh1-c5VbkBMchy.jpg', 'image/jpeg', 673669, '亡灵女-高关联.jpg');
INSERT INTO `inv_file` VALUES (38, 'http://188.131.207.200:8009/storage', '/1/BAzBjiZwE8G3U55Ubrk63mBzBMSpDd9z.jpg', 'image/jpeg', 676506, '亡灵女-低关联.jpg');
INSERT INTO `inv_file` VALUES (41, 'http://188.131.207.200:8009/storage', '/1/1.png', 'image/png', NULL, '1.png');
INSERT INTO `inv_file` VALUES (42, 'http://188.131.207.200:8009/storage', '/1/2.png', 'image/png', NULL, '2.png');
INSERT INTO `inv_file` VALUES (43, 'http://188.131.207.200:8009/storage', '/1/3.png', 'image/png', NULL, '3.png');
INSERT INTO `inv_file` VALUES (44, 'http://188.131.207.200:8009/storage', '/1/4.png', 'image/png', NULL, '4.png');
INSERT INTO `inv_file` VALUES (45, 'http://188.131.207.200:8009/storage', '/1/5.png', 'image/png', NULL, '5.png');
INSERT INTO `inv_file` VALUES (46, 'http://188.131.207.200:8009/storage', '/1/position-0.png', 'image/png', NULL, 'position-0.png');
INSERT INTO `inv_file` VALUES (47, 'http://188.131.207.200:8009/storage', '/1/position-1.png', 'image/png', NULL, 'position-1.png');
INSERT INTO `inv_file` VALUES (48, 'http://188.131.207.200:8009/storage', '/1/position-2.png', 'image/png', NULL, 'position-2.png');
INSERT INTO `inv_file` VALUES (49, 'http://188.131.207.200:8009/storage', '/1/position-3.png', 'image/png', NULL, 'position-3.png');
INSERT INTO `inv_file` VALUES (50, 'http://188.131.207.200:8009/storage', '/1/position-4.png', 'image/png', NULL, 'position-4.png');

-- ----------------------------
-- Table structure for inv_immerse
-- ----------------------------
DROP TABLE IF EXISTS `inv_immerse`;
CREATE TABLE `inv_immerse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `incarnation_id` int(11) NOT NULL COMMENT '化身id',
  `grades` int(1) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`, `user_id`, `incarnation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 359 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_immerse
-- ----------------------------

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
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '化身分值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_incarnation
-- ----------------------------
INSERT INTO `inv_incarnation` VALUES (1, '暗夜', '1', '', 'male', NULL);
INSERT INTO `inv_incarnation` VALUES (2, '暗夜', '2', '', 'female', NULL);
INSERT INTO `inv_incarnation` VALUES (3, '德莱尼', '3', '', 'male', NULL);
INSERT INTO `inv_incarnation` VALUES (4, '德莱尼', '4', '', 'female', NULL);
INSERT INTO `inv_incarnation` VALUES (5, '巨魔', '5', '', 'male', NULL);
INSERT INTO `inv_incarnation` VALUES (6, '巨魔', '6', '', 'female', NULL);
INSERT INTO `inv_incarnation` VALUES (7, '牛头', '7', '', 'male', NULL);
INSERT INTO `inv_incarnation` VALUES (8, '牛头', '8', '', 'female', NULL);
INSERT INTO `inv_incarnation` VALUES (9, '人类', '9', '', 'male', NULL);
INSERT INTO `inv_incarnation` VALUES (10, '人类', '10', '', 'female', NULL);
INSERT INTO `inv_incarnation` VALUES (11, '亡灵', '11', '', 'female', NULL);
INSERT INTO `inv_incarnation` VALUES (12, '亡灵', '12', '', 'male', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_log
-- ----------------------------

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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '问题调查类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inv_type
-- ----------------------------
INSERT INTO `inv_type` VALUES (1, '现实自我', '我认为现实中的自己');
INSERT INTO `inv_type` VALUES (2, '虚拟自我', '我认为这一个虚拟化身');
INSERT INTO `inv_type` VALUES (3, '情绪量化', '当您在使用该化身时，会出现以下哪些情绪感受');

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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '用户角色，1测试人员，2系统管理员',
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logged_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '用户所处调查阶段',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户问卷步骤',
  `round` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '用户属于第几轮调查',
  `incarnation_divide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '化身认同分组，1大，2小',
  `ego_divide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自我差异分组，1大正，2小正，3大负，4小负',
  `advertisement_divide` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告分组，1有广告，2无广告',
  `incarnation_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告答题落在的化身id',
  `advertisement_grades` int(2) NULL DEFAULT NULL COMMENT '品牌记忆得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 943 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_user
-- ----------------------------

-- ----------------------------
-- Table structure for inv_user_incarnation_grades
-- ----------------------------
DROP TABLE IF EXISTS `inv_user_incarnation_grades`;
CREATE TABLE `inv_user_incarnation_grades`  (
  `user_id` int(11) NOT NULL,
  `incarantion_id` int(11) NOT NULL,
  `grades` float(255, 0) NOT NULL,
  PRIMARY KEY (`user_id`, `incarantion_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

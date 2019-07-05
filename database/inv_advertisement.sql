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

 Date: 05/07/2019 20:02:16
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
) ENGINE = InnoDB AUTO_INCREMENT = 713 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_answer
-- ----------------------------
INSERT INTO `inv_answer` VALUES (663, 37, 11, 51, 5);
INSERT INTO `inv_answer` VALUES (664, 37, 12, 56, 1);
INSERT INTO `inv_answer` VALUES (665, 37, 13, 61, 5);
INSERT INTO `inv_answer` VALUES (666, 37, 14, 66, 1);
INSERT INTO `inv_answer` VALUES (667, 37, 15, 71, 5);
INSERT INTO `inv_answer` VALUES (668, 37, 16, 76, 1);
INSERT INTO `inv_answer` VALUES (669, 37, 17, 81, 5);
INSERT INTO `inv_answer` VALUES (670, 37, 18, 86, 1);
INSERT INTO `inv_answer` VALUES (671, 37, 19, 91, 1);
INSERT INTO `inv_answer` VALUES (672, 37, 20, 96, 1);
INSERT INTO `inv_answer` VALUES (673, 38, 1, 1, 5);
INSERT INTO `inv_answer` VALUES (674, 38, 2, 6, 1);
INSERT INTO `inv_answer` VALUES (675, 38, 3, 11, 5);
INSERT INTO `inv_answer` VALUES (676, 38, 4, 16, 1);
INSERT INTO `inv_answer` VALUES (677, 38, 5, 21, 5);
INSERT INTO `inv_answer` VALUES (678, 38, 6, 26, 1);
INSERT INTO `inv_answer` VALUES (679, 38, 7, 31, 5);
INSERT INTO `inv_answer` VALUES (680, 38, 8, 36, 1);
INSERT INTO `inv_answer` VALUES (681, 38, 9, 41, 1);
INSERT INTO `inv_answer` VALUES (682, 38, 10, 46, 1);
INSERT INTO `inv_answer` VALUES (683, 38, 11, 51, 5);
INSERT INTO `inv_answer` VALUES (684, 38, 12, 56, 1);
INSERT INTO `inv_answer` VALUES (685, 38, 13, 61, 5);
INSERT INTO `inv_answer` VALUES (686, 38, 14, 66, 1);
INSERT INTO `inv_answer` VALUES (687, 38, 15, 71, 5);
INSERT INTO `inv_answer` VALUES (688, 38, 16, 76, 1);
INSERT INTO `inv_answer` VALUES (689, 38, 17, 81, 5);
INSERT INTO `inv_answer` VALUES (690, 38, 18, 86, 1);
INSERT INTO `inv_answer` VALUES (691, 38, 19, 91, 1);
INSERT INTO `inv_answer` VALUES (692, 38, 20, 96, 1);
INSERT INTO `inv_answer` VALUES (693, 37, 1, 1, 5);
INSERT INTO `inv_answer` VALUES (694, 37, 2, 6, 1);
INSERT INTO `inv_answer` VALUES (695, 37, 3, 11, 5);
INSERT INTO `inv_answer` VALUES (696, 37, 4, 16, 1);
INSERT INTO `inv_answer` VALUES (697, 37, 5, 21, 5);
INSERT INTO `inv_answer` VALUES (698, 37, 6, 26, 1);
INSERT INTO `inv_answer` VALUES (699, 37, 7, 31, 5);
INSERT INTO `inv_answer` VALUES (700, 37, 8, 36, 1);
INSERT INTO `inv_answer` VALUES (701, 37, 9, 41, 1);
INSERT INTO `inv_answer` VALUES (702, 37, 10, 46, 1);
INSERT INTO `inv_answer` VALUES (703, 47, 1, 1, 5);
INSERT INTO `inv_answer` VALUES (704, 47, 2, 6, 1);
INSERT INTO `inv_answer` VALUES (705, 47, 3, 11, 5);
INSERT INTO `inv_answer` VALUES (706, 47, 4, 16, 1);
INSERT INTO `inv_answer` VALUES (707, 47, 5, 21, 5);
INSERT INTO `inv_answer` VALUES (708, 47, 6, 26, 1);
INSERT INTO `inv_answer` VALUES (709, 47, 7, 31, 5);
INSERT INTO `inv_answer` VALUES (710, 47, 8, 36, 1);
INSERT INTO `inv_answer` VALUES (711, 47, 9, 41, 1);
INSERT INTO `inv_answer` VALUES (712, 47, 10, 46, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 291 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_approve
-- ----------------------------
INSERT INTO `inv_approve` VALUES (273, 47, 1, 1);
INSERT INTO `inv_approve` VALUES (274, 47, 3, 1);
INSERT INTO `inv_approve` VALUES (275, 47, 5, 1);
INSERT INTO `inv_approve` VALUES (276, 47, 7, 1);
INSERT INTO `inv_approve` VALUES (277, 47, 9, 1);
INSERT INTO `inv_approve` VALUES (278, 47, 12, 1);

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
INSERT INTO `inv_config` VALUES (1, 'stage', '1', '当前系统阶段', 'text', '1');

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
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_answer
-- ----------------------------
INSERT INTO `inv_ego_answer` VALUES (11, 1, 2, 37, -1, '4');
INSERT INTO `inv_ego_answer` VALUES (12, 2, 7, 37, -1, '2');
INSERT INTO `inv_ego_answer` VALUES (13, 3, 12, 37, -1, '4');
INSERT INTO `inv_ego_answer` VALUES (14, 4, 17, 37, -1, '2');
INSERT INTO `inv_ego_answer` VALUES (15, 5, 22, 37, -1, '4');
INSERT INTO `inv_ego_answer` VALUES (16, 6, 27, 37, -1, '2');
INSERT INTO `inv_ego_answer` VALUES (17, 7, 32, 37, -1, '4');
INSERT INTO `inv_ego_answer` VALUES (18, 8, 37, 37, -1, '2');
INSERT INTO `inv_ego_answer` VALUES (19, 9, 42, 37, -1, '2');
INSERT INTO `inv_ego_answer` VALUES (20, 10, 47, 37, -1, '2');
INSERT INTO `inv_ego_answer` VALUES (21, 1, 2, 37, 1, '4');
INSERT INTO `inv_ego_answer` VALUES (22, 2, 7, 37, 1, '2');
INSERT INTO `inv_ego_answer` VALUES (23, 3, 12, 37, 1, '4');
INSERT INTO `inv_ego_answer` VALUES (24, 4, 17, 37, 1, '2');
INSERT INTO `inv_ego_answer` VALUES (25, 5, 22, 37, 1, '4');
INSERT INTO `inv_ego_answer` VALUES (26, 6, 27, 37, 1, '2');
INSERT INTO `inv_ego_answer` VALUES (27, 7, 32, 37, 1, '4');
INSERT INTO `inv_ego_answer` VALUES (28, 8, 37, 37, 1, '2');
INSERT INTO `inv_ego_answer` VALUES (29, 9, 42, 37, 1, '2');
INSERT INTO `inv_ego_answer` VALUES (30, 10, 47, 37, 1, '2');
INSERT INTO `inv_ego_answer` VALUES (31, 1, 2, 37, 3, '4');
INSERT INTO `inv_ego_answer` VALUES (32, 2, 7, 37, 3, '2');
INSERT INTO `inv_ego_answer` VALUES (33, 3, 12, 37, 3, '4');
INSERT INTO `inv_ego_answer` VALUES (34, 4, 17, 37, 3, '2');
INSERT INTO `inv_ego_answer` VALUES (35, 5, 22, 37, 3, '4');
INSERT INTO `inv_ego_answer` VALUES (36, 6, 27, 37, 3, '2');
INSERT INTO `inv_ego_answer` VALUES (37, 7, 32, 37, 3, '4');
INSERT INTO `inv_ego_answer` VALUES (38, 8, 37, 37, 3, '2');
INSERT INTO `inv_ego_answer` VALUES (39, 9, 42, 37, 3, '2');
INSERT INTO `inv_ego_answer` VALUES (40, 10, 47, 37, 3, '2');
INSERT INTO `inv_ego_answer` VALUES (41, 1, 2, 37, 5, '4');
INSERT INTO `inv_ego_answer` VALUES (42, 2, 7, 37, 5, '2');
INSERT INTO `inv_ego_answer` VALUES (43, 3, 12, 37, 5, '4');
INSERT INTO `inv_ego_answer` VALUES (44, 4, 17, 37, 5, '2');
INSERT INTO `inv_ego_answer` VALUES (45, 5, 22, 37, 5, '4');
INSERT INTO `inv_ego_answer` VALUES (46, 6, 27, 37, 5, '2');
INSERT INTO `inv_ego_answer` VALUES (47, 7, 32, 37, 5, '4');
INSERT INTO `inv_ego_answer` VALUES (48, 8, 37, 37, 5, '2');
INSERT INTO `inv_ego_answer` VALUES (49, 9, 42, 37, 5, '2');
INSERT INTO `inv_ego_answer` VALUES (50, 10, 47, 37, 5, '2');
INSERT INTO `inv_ego_answer` VALUES (51, 1, 2, 37, 7, '4');
INSERT INTO `inv_ego_answer` VALUES (52, 2, 7, 37, 7, '2');
INSERT INTO `inv_ego_answer` VALUES (53, 3, 12, 37, 7, '4');
INSERT INTO `inv_ego_answer` VALUES (54, 4, 17, 37, 7, '2');
INSERT INTO `inv_ego_answer` VALUES (55, 5, 22, 37, 7, '4');
INSERT INTO `inv_ego_answer` VALUES (56, 6, 27, 37, 7, '2');
INSERT INTO `inv_ego_answer` VALUES (57, 7, 32, 37, 7, '4');
INSERT INTO `inv_ego_answer` VALUES (58, 8, 37, 37, 7, '2');
INSERT INTO `inv_ego_answer` VALUES (59, 9, 42, 37, 7, '2');
INSERT INTO `inv_ego_answer` VALUES (60, 10, 47, 37, 7, '2');
INSERT INTO `inv_ego_answer` VALUES (61, 1, 2, 37, 9, '4');
INSERT INTO `inv_ego_answer` VALUES (62, 2, 7, 37, 9, '2');
INSERT INTO `inv_ego_answer` VALUES (63, 3, 12, 37, 9, '4');
INSERT INTO `inv_ego_answer` VALUES (64, 4, 17, 37, 9, '2');
INSERT INTO `inv_ego_answer` VALUES (65, 5, 22, 37, 9, '4');
INSERT INTO `inv_ego_answer` VALUES (66, 6, 27, 37, 9, '2');
INSERT INTO `inv_ego_answer` VALUES (67, 7, 32, 37, 9, '4');
INSERT INTO `inv_ego_answer` VALUES (68, 8, 37, 37, 9, '2');
INSERT INTO `inv_ego_answer` VALUES (69, 9, 42, 37, 9, '2');
INSERT INTO `inv_ego_answer` VALUES (70, 10, 47, 37, 9, '2');
INSERT INTO `inv_ego_answer` VALUES (71, 1, 2, 37, 12, '4');
INSERT INTO `inv_ego_answer` VALUES (72, 2, 7, 37, 12, '2');
INSERT INTO `inv_ego_answer` VALUES (73, 3, 12, 37, 12, '4');
INSERT INTO `inv_ego_answer` VALUES (74, 4, 17, 37, 12, '2');
INSERT INTO `inv_ego_answer` VALUES (75, 5, 22, 37, 12, '4');
INSERT INTO `inv_ego_answer` VALUES (76, 6, 27, 37, 12, '2');
INSERT INTO `inv_ego_answer` VALUES (77, 7, 32, 37, 12, '4');
INSERT INTO `inv_ego_answer` VALUES (78, 8, 37, 37, 12, '2');
INSERT INTO `inv_ego_answer` VALUES (79, 9, 42, 37, 12, '2');
INSERT INTO `inv_ego_answer` VALUES (80, 10, 47, 37, 12, '2');

-- ----------------------------
-- Table structure for inv_ego_differences
-- ----------------------------
DROP TABLE IF EXISTS `inv_ego_differences`;
CREATE TABLE `inv_ego_differences`  (
  `user_id` int(11) NOT NULL,
  `incarnation_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1外倾性，2宜人性，3尽责性，4神经质，5开放性',
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `incarnation_id`, `type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_differences
-- ----------------------------
INSERT INTO `inv_ego_differences` VALUES (37, 1, 1, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 1, 2, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 1, 3, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 1, 4, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 1, 5, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 3, 1, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 3, 2, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 3, 3, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 3, 4, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 3, 5, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 5, 1, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 5, 2, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 5, 3, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 5, 4, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 5, 5, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 7, 1, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 7, 2, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 7, 3, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 7, 4, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 7, 5, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 9, 1, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 9, 2, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 9, 3, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 9, 4, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 9, 5, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 12, 1, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 12, 2, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 12, 3, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 12, 4, '0');
INSERT INTO `inv_ego_differences` VALUES (37, 12, 5, '0');

-- ----------------------------
-- Table structure for inv_ego_option
-- ----------------------------
DROP TABLE IF EXISTS `inv_ego_option`;
CREATE TABLE `inv_ego_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_ego_option
-- ----------------------------
INSERT INTO `inv_ego_option` VALUES (1, 1, '非常反对', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (2, 1, '比较反对', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (3, 1, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (4, 1, '比较认同', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (5, 1, '非常认同', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (6, 2, '非常反对', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (7, 2, '比较反对', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (8, 2, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (9, 2, '比较认同', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (10, 2, '非常认同', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (11, 3, '非常反对', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (12, 3, '比较反对', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (13, 3, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (14, 3, '比较认同', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (15, 3, '非常认同', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (16, 4, '非常反对', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (17, 4, '比较反对', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (18, 4, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (19, 4, '比较认同', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (20, 4, '非常认同', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (21, 5, '非常反对', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (22, 5, '比较反对', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (23, 5, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (24, 5, '比较认同', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (25, 5, '非常认同', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (26, 6, '非常反对', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (27, 6, '比较反对', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (28, 6, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (29, 6, '比较认同', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (30, 6, '非常认同', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (31, 7, '非常反对', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (32, 7, '比较反对', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (33, 7, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (34, 7, '比较认同', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (35, 7, '非常认同', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (36, 8, '非常反对', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (37, 8, '比较反对', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (38, 8, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (39, 8, '比较认同', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (40, 8, '非常认同', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (41, 9, '非常反对', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (42, 9, '比较反对', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (43, 9, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (44, 9, '比较认同', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (45, 9, '非常认同', '5', NULL);
INSERT INTO `inv_ego_option` VALUES (46, 10, '非常反对', '1', NULL);
INSERT INTO `inv_ego_option` VALUES (47, 10, '比较反对', '2', NULL);
INSERT INTO `inv_ego_option` VALUES (48, 10, '既不认同也不反对', '3', NULL);
INSERT INTO `inv_ego_option` VALUES (49, 10, '比较认同', '4', NULL);
INSERT INTO `inv_ego_option` VALUES (50, 10, '非常认同', '5', NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_emotion_answer
-- ----------------------------
INSERT INTO `inv_emotion_answer` VALUES (1, 1, 2, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (2, 2, 7, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (3, 3, 12, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (4, 4, 17, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (5, 5, 22, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (6, 6, 27, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (7, 7, 32, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (8, 8, 37, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (9, 9, 42, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (10, 10, 47, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (11, 11, 52, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (12, 12, 57, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (13, 13, 62, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (14, 14, 67, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (15, 15, 72, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (16, 16, 77, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (17, 17, 82, 37, '2');
INSERT INTO `inv_emotion_answer` VALUES (18, 18, 87, 37, '2');

-- ----------------------------
-- Table structure for inv_emotion_option
-- ----------------------------
DROP TABLE IF EXISTS `inv_emotion_option`;
CREATE TABLE `inv_emotion_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_emotion_option
-- ----------------------------
INSERT INTO `inv_emotion_option` VALUES (1, 1, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (2, 1, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (3, 1, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (4, 1, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (5, 1, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (6, 2, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (7, 2, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (8, 2, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (9, 2, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (10, 2, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (11, 3, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (12, 3, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (13, 3, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (14, 3, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (15, 3, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (16, 4, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (17, 4, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (18, 4, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (19, 4, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (20, 4, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (21, 5, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (22, 5, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (23, 5, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (24, 5, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (25, 5, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (26, 6, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (27, 6, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (28, 6, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (29, 6, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (30, 6, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (31, 7, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (32, 7, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (33, 7, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (34, 7, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (35, 7, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (36, 8, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (37, 8, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (38, 8, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (39, 8, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (40, 8, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (41, 9, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (42, 9, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (43, 9, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (44, 9, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (45, 9, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (46, 10, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (47, 10, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (48, 10, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (49, 10, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (50, 10, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (51, 11, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (52, 11, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (53, 11, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (54, 11, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (55, 11, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (56, 12, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (57, 12, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (58, 12, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (59, 12, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (60, 12, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (61, 13, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (62, 13, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (63, 13, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (64, 13, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (65, 13, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (66, 14, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (67, 14, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (68, 14, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (69, 14, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (70, 14, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (71, 15, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (72, 15, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (73, 15, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (74, 15, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (75, 15, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (76, 16, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (77, 16, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (78, 16, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (79, 16, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (80, 16, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (81, 17, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (82, 17, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (83, 17, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (84, 17, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (85, 17, '非常强', '5', NULL);
INSERT INTO `inv_emotion_option` VALUES (86, 18, '非常少或完全没有', '1', NULL);
INSERT INTO `inv_emotion_option` VALUES (87, 18, '有一点', '2', NULL);
INSERT INTO `inv_emotion_option` VALUES (88, 18, '中等', '3', NULL);
INSERT INTO `inv_emotion_option` VALUES (89, 18, '较强', '4', NULL);
INSERT INTO `inv_emotion_option` VALUES (90, 18, '非常强', '5', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_immerse
-- ----------------------------
INSERT INTO `inv_immerse` VALUES (275, 47, 1, 1);
INSERT INTO `inv_immerse` VALUES (276, 47, 3, 1);
INSERT INTO `inv_immerse` VALUES (277, 47, 5, 1);
INSERT INTO `inv_immerse` VALUES (278, 47, 7, 1);
INSERT INTO `inv_immerse` VALUES (279, 47, 9, 1);
INSERT INTO `inv_immerse` VALUES (280, 47, 12, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2104 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_log
-- ----------------------------
INSERT INTO `inv_log` VALUES (1, 1, 'application', 1562147179.5125, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (2, 2, 'yii\\caching\\FileCache::setValue', 1562147233.0902, '[frontend][//v1/incarnation/grades]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (3, 2, 'yii\\caching\\FileCache::setValue', 1562147233.0904, '[frontend][//v1/incarnation/grades]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (4, 1, 'application', 1562147233.1076, '[frontend][//v1/incarnation/grades]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (5, 2, 'yii\\caching\\FileCache::setValue', 1562147250.8768, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (6, 2, 'yii\\caching\\FileCache::setValue', 1562147250.8769, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (7, 1, 'application', 1562147250.8786, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (8, 2, 'yii\\caching\\FileCache::setValue', 1562147250.9326, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (9, 2, 'yii\\caching\\FileCache::setValue', 1562147250.9326, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (10, 2, 'yii\\caching\\FileCache::setValue', 1562147251.4613, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/75/75a1a90e7577b1d7484d2c0baa9a75e0.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/75/75a1a90e7577b1d7484d2c0baa9a75e0.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (11, 2, 'yii\\caching\\FileCache::setValue', 1562147251.5913, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (12, 2, 'yii\\caching\\FileCache::setValue', 1562147251.5914, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (13, 1, 'application', 1562147251.5979, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (14, 2, 'yii\\caching\\FileCache::setValue', 1562152163.0022, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (15, 2, 'yii\\caching\\FileCache::setValue', 1562152163.0023, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (16, 1, 'application', 1562152163.0268, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (17, 2, 'yii\\caching\\FileCache::setValue', 1562152167.8075, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (18, 2, 'yii\\caching\\FileCache::setValue', 1562152167.8076, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (19, 1, 'application', 1562152167.8085, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (20, 2, 'yii\\caching\\FileCache::setValue', 1562152167.832, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (21, 2, 'yii\\caching\\FileCache::setValue', 1562152167.832, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (22, 2, 'yii\\caching\\FileCache::setValue', 1562152168.3581, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/48/48411984bd7798a11c05fa6cb3e7c108.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/48/48411984bd7798a11c05fa6cb3e7c108.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (23, 2, 'yii\\caching\\FileCache::setValue', 1562152168.663, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (24, 2, 'yii\\caching\\FileCache::setValue', 1562152168.6631, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (25, 1, 'application', 1562152168.664, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (26, 2, 'yii\\caching\\FileCache::setValue', 1562152169.1622, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (27, 2, 'yii\\caching\\FileCache::setValue', 1562152169.1623, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (28, 1, 'application', 1562152169.1966, '[frontend][//v1/user/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (29, 2, 'yii\\caching\\FileCache::setValue', 1562152178.4861, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (30, 2, 'yii\\caching\\FileCache::setValue', 1562152178.4861, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (31, 1, 'application', 1562152178.4871, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (32, 2, 'yii\\caching\\FileCache::setValue', 1562152178.8778, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (33, 2, 'yii\\caching\\FileCache::setValue', 1562152178.8779, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (34, 1, 'application', 1562152178.8787, '[frontend][//v1/user/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (35, 2, 'yii\\caching\\FileCache::setValue', 1562152183.9633, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (36, 2, 'yii\\caching\\FileCache::setValue', 1562152183.9634, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (37, 1, 'application', 1562152183.9733, '[frontend][//v1/incarnation/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (38, 2, 'yii\\caching\\FileCache::setValue', 1562152382.3988, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (39, 2, 'yii\\caching\\FileCache::setValue', 1562152382.3989, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (40, 1, 'application', 1562152382.3998, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (41, 2, 'yii\\caching\\FileCache::setValue', 1562152382.4059, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (42, 2, 'yii\\caching\\FileCache::setValue', 1562152382.406, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (43, 2, 'yii\\caching\\FileCache::setValue', 1562152382.9303, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/52/521115cc7576b8e67c67082e34dfd1d8.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/52/521115cc7576b8e67c67082e34dfd1d8.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (44, 2, 'yii\\caching\\FileCache::setValue', 1562152383.1753, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (45, 2, 'yii\\caching\\FileCache::setValue', 1562152383.1754, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (46, 1, 'application', 1562152383.1761, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (47, 2, 'yii\\caching\\FileCache::setValue', 1562152538.3211, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (48, 2, 'yii\\caching\\FileCache::setValue', 1562152538.3212, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (49, 1, 'application', 1562152538.3221, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (50, 2, 'yii\\caching\\FileCache::setValue', 1562152538.425, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (51, 2, 'yii\\caching\\FileCache::setValue', 1562152538.4251, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (52, 1, 'application', 1562152538.4259, '[frontend][//v1/incarnation/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (53, 2, 'yii\\caching\\FileCache::setValue', 1562152541.3852, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (54, 2, 'yii\\caching\\FileCache::setValue', 1562152541.3853, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (55, 1, 'application', 1562152541.3861, '[frontend][//v1/user/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (56, 2, 'yii\\caching\\FileCache::setValue', 1562155981.8839, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (57, 2, 'yii\\caching\\FileCache::setValue', 1562155981.8839, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (58, 1, 'application', 1562155981.885, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (59, 2, 'yii\\caching\\FileCache::setValue', 1562155981.9073, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (60, 2, 'yii\\caching\\FileCache::setValue', 1562155981.9074, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (61, 2, 'yii\\caching\\FileCache::setValue', 1562155982.4346, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/dd/ddd2c5c84dd2644ad546fab51924e7d0.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/dd/ddd2c5c84dd2644ad546fab51924e7d0.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (62, 2, 'yii\\caching\\FileCache::setValue', 1562155982.6404, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (63, 2, 'yii\\caching\\FileCache::setValue', 1562155982.6405, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (64, 1, 'application', 1562155982.6412, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (65, 2, 'yii\\caching\\FileCache::setValue', 1562155983.2396, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (66, 2, 'yii\\caching\\FileCache::setValue', 1562155983.2397, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (67, 1, 'application', 1562155983.2404, '[frontend][//v1/user/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (68, 2, 'yii\\caching\\FileCache::setValue', 1562155987.6628, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (69, 2, 'yii\\caching\\FileCache::setValue', 1562155987.6629, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (70, 1, 'application', 1562155987.6638, '[frontend][//v1/incarnation/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (71, 2, 'yii\\caching\\FileCache::setValue', 1562155990.4048, '[frontend][//v1/advertisement/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (72, 2, 'yii\\caching\\FileCache::setValue', 1562155990.4049, '[frontend][//v1/advertisement/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (73, 1, 'application', 1562155990.4894, '[frontend][//v1/advertisement/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (74, 2, 'yii\\caching\\FileCache::setValue', 1562156001.7637, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (75, 2, 'yii\\caching\\FileCache::setValue', 1562156001.7638, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (76, 1, 'application', 1562156001.7646, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (77, 2, 'yii\\caching\\FileCache::setValue', 1562156001.7701, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (78, 2, 'yii\\caching\\FileCache::setValue', 1562156001.7701, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (79, 2, 'yii\\caching\\FileCache::setValue', 1562156002.3067, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/22/22d75d188d9f96f8f4059a4b8870cb68.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/22/22d75d188d9f96f8f4059a4b8870cb68.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (80, 2, 'yii\\caching\\FileCache::setValue', 1562156002.4945, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (81, 2, 'yii\\caching\\FileCache::setValue', 1562156002.4945, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (82, 1, 'application', 1562156002.4953, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (83, 2, 'yii\\caching\\FileCache::setValue', 1562156002.8125, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (84, 2, 'yii\\caching\\FileCache::setValue', 1562156002.8126, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (85, 1, 'application', 1562156002.8133, '[frontend][//v1/user/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (86, 2, 'yii\\caching\\FileCache::setValue', 1562156018.4799, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (87, 2, 'yii\\caching\\FileCache::setValue', 1562156018.48, '[frontend][//v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (88, 1, 'application', 1562156018.4809, '[frontend][//v1/incarnation/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (89, 2, 'yii\\caching\\FileCache::setValue', 1562156024.3554, '[frontend][//v1/advertisement/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (90, 2, 'yii\\caching\\FileCache::setValue', 1562156024.3555, '[frontend][//v1/advertisement/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (91, 1, 'application', 1562156024.3567, '[frontend][//v1/advertisement/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (92, 2, 'yii\\caching\\FileCache::setValue', 1562160795.0893, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (93, 2, 'yii\\caching\\FileCache::setValue', 1562160795.0894, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (94, 1, 'application', 1562160795.0903, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (95, 2, 'yii\\caching\\FileCache::setValue', 1562160813.8965, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (96, 2, 'yii\\caching\\FileCache::setValue', 1562160813.8966, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (97, 1, 'application', 1562160813.8975, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (98, 2, 'yii\\caching\\FileCache::setValue', 1562160813.9029, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (99, 2, 'yii\\caching\\FileCache::setValue', 1562160813.9029, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (100, 2, 'yii\\caching\\FileCache::setValue', 1562160814.4288, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b9/b95a27ee356404a8bda73f0e69a53e96.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b9/b95a27ee356404a8bda73f0e69a53e96.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (101, 2, 'yii\\caching\\FileCache::setValue', 1562161727.0627, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (102, 2, 'yii\\caching\\FileCache::setValue', 1562161727.0628, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (103, 1, 'application', 1562161727.0638, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (104, 2, 'yii\\caching\\FileCache::setValue', 1562161727.0696, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (105, 2, 'yii\\caching\\FileCache::setValue', 1562161727.0696, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (106, 2, 'yii\\caching\\FileCache::setValue', 1562161727.601, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/c7/c7fc5f2017ac9497cc050829ddf78d13.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/c7/c7fc5f2017ac9497cc050829ddf78d13.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (107, 2, 'yii\\caching\\FileCache::setValue', 1562161730.0147, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (108, 2, 'yii\\caching\\FileCache::setValue', 1562161730.0148, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (109, 1, 'application', 1562161730.0157, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (110, 2, 'yii\\caching\\FileCache::setValue', 1562161821.2832, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (111, 2, 'yii\\caching\\FileCache::setValue', 1562161821.2833, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (112, 1, 'application', 1562161821.2842, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (113, 2, 'yii\\caching\\FileCache::setValue', 1562161834.1425, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (114, 2, 'yii\\caching\\FileCache::setValue', 1562161834.1426, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (115, 1, 'application', 1562161834.1435, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (116, 2, 'yii\\caching\\FileCache::setValue', 1562161834.1492, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (117, 2, 'yii\\caching\\FileCache::setValue', 1562161834.1493, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (118, 2, 'yii\\caching\\FileCache::setValue', 1562161834.6734, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/db/db54a1ad7e2fc4aca686b664f86a6f91.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/db/db54a1ad7e2fc4aca686b664f86a6f91.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (119, 2, 'yii\\caching\\FileCache::setValue', 1562162096.3183, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (120, 2, 'yii\\caching\\FileCache::setValue', 1562162096.3184, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (121, 1, 'application', 1562162096.3193, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (122, 2, 'yii\\caching\\FileCache::setValue', 1562162304.3305, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (123, 2, 'yii\\caching\\FileCache::setValue', 1562162304.3305, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (124, 1, 'application', 1562162304.3315, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (125, 2, 'yii\\caching\\FileCache::setValue', 1562162314.0137, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (126, 2, 'yii\\caching\\FileCache::setValue', 1562162314.0138, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (127, 1, 'application', 1562162314.0147, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (128, 2, 'yii\\caching\\FileCache::setValue', 1562162314.0205, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (129, 2, 'yii\\caching\\FileCache::setValue', 1562162314.0205, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (130, 2, 'yii\\caching\\FileCache::setValue', 1562162314.5509, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/8d/8d93f973a0bf750aafe561a226875efe.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/8d/8d93f973a0bf750aafe561a226875efe.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (131, 2, 'yii\\caching\\FileCache::setValue', 1562162336.525, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (132, 2, 'yii\\caching\\FileCache::setValue', 1562162336.5251, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (133, 1, 'application', 1562162336.5259, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (134, 2, 'yii\\caching\\FileCache::setValue', 1562162336.5312, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (135, 2, 'yii\\caching\\FileCache::setValue', 1562162336.5313, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (136, 2, 'yii\\caching\\FileCache::setValue', 1562162337.0543, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/07/071a25ce6bd82d039dfcc338c0c24cdc.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/07/071a25ce6bd82d039dfcc338c0c24cdc.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (137, 2, 'yii\\caching\\FileCache::setValue', 1562162360.7445, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (138, 2, 'yii\\caching\\FileCache::setValue', 1562162360.7446, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (139, 1, 'application', 1562162360.7454, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (140, 2, 'yii\\caching\\FileCache::setValue', 1562162369.662, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (141, 2, 'yii\\caching\\FileCache::setValue', 1562162369.6621, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (142, 1, 'application', 1562162369.6629, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (143, 2, 'yii\\caching\\FileCache::setValue', 1562162369.6685, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (144, 2, 'yii\\caching\\FileCache::setValue', 1562162369.6686, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (145, 2, 'yii\\caching\\FileCache::setValue', 1562162370.196, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/78/7829d1a67660a320b2897b9604b6d4dd.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/78/7829d1a67660a320b2897b9604b6d4dd.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (146, 2, 'yii\\caching\\FileCache::setValue', 1562162444.7681, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (147, 2, 'yii\\caching\\FileCache::setValue', 1562162444.7682, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (148, 1, 'application', 1562162444.7691, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (149, 2, 'yii\\caching\\FileCache::setValue', 1562162455.0202, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (150, 2, 'yii\\caching\\FileCache::setValue', 1562162455.0203, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (151, 1, 'application', 1562162455.0212, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (152, 2, 'yii\\caching\\FileCache::setValue', 1562162455.0272, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (153, 2, 'yii\\caching\\FileCache::setValue', 1562162455.0273, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (154, 2, 'yii\\caching\\FileCache::setValue', 1562162455.5516, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/a8/a804bfcbc918a2416bbca9e6e3ae904c.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/a8/a804bfcbc918a2416bbca9e6e3ae904c.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (155, 2, 'yii\\caching\\FileCache::setValue', 1562162517.5438, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (156, 2, 'yii\\caching\\FileCache::setValue', 1562162517.5438, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (157, 1, 'application', 1562162517.5447, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (158, 2, 'yii\\caching\\FileCache::setValue', 1562162536.4538, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (159, 2, 'yii\\caching\\FileCache::setValue', 1562162536.4539, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (160, 1, 'application', 1562162536.4548, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (161, 2, 'yii\\caching\\FileCache::setValue', 1562162536.4606, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (162, 2, 'yii\\caching\\FileCache::setValue', 1562162536.4607, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (163, 2, 'yii\\caching\\FileCache::setValue', 1562162536.9852, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/ac/ac41ca185c9a4099f83aaab67f208ca6.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/ac/ac41ca185c9a4099f83aaab67f208ca6.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (164, 2, 'yii\\caching\\FileCache::setValue', 1562162752.3876, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (165, 2, 'yii\\caching\\FileCache::setValue', 1562162752.3877, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (166, 1, 'application', 1562162752.3885, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (167, 2, 'yii\\caching\\FileCache::setValue', 1562162789.497, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (168, 2, 'yii\\caching\\FileCache::setValue', 1562162789.497, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (169, 1, 'application', 1562162789.4979, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (170, 2, 'yii\\caching\\FileCache::setValue', 1562162789.5041, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (171, 2, 'yii\\caching\\FileCache::setValue', 1562162789.5041, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (172, 2, 'yii\\caching\\FileCache::setValue', 1562162790.0329, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/87/87200644c25601b3a03e3047459aabd0.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/87/87200644c25601b3a03e3047459aabd0.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (173, 2, 'yii\\caching\\FileCache::setValue', 1562162815.8934, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (174, 2, 'yii\\caching\\FileCache::setValue', 1562162815.8935, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (175, 1, 'application', 1562162815.8943, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (176, 2, 'yii\\caching\\FileCache::setValue', 1562162951.6668, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (177, 2, 'yii\\caching\\FileCache::setValue', 1562162951.6669, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (178, 1, 'application', 1562162951.6678, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (179, 2, 'yii\\caching\\FileCache::setValue', 1562162965.8598, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (180, 2, 'yii\\caching\\FileCache::setValue', 1562162965.8599, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (181, 1, 'application', 1562162965.8608, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (182, 2, 'yii\\caching\\FileCache::setValue', 1562162965.8661, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (183, 2, 'yii\\caching\\FileCache::setValue', 1562162965.8661, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (184, 2, 'yii\\caching\\FileCache::setValue', 1562162966.4333, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/ae/ae20ab59330f3f1332501be70f2faa03.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/ae/ae20ab59330f3f1332501be70f2faa03.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (185, 2, 'yii\\caching\\FileCache::setValue', 1562163277.2152, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (186, 2, 'yii\\caching\\FileCache::setValue', 1562163277.2153, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (187, 1, 'application', 1562163277.2162, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (188, 2, 'yii\\caching\\FileCache::setValue', 1562163680.8661, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (189, 2, 'yii\\caching\\FileCache::setValue', 1562163680.8662, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (190, 1, 'application', 1562163680.8671, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (191, 2, 'yii\\caching\\FileCache::setValue', 1562163680.8726, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (192, 2, 'yii\\caching\\FileCache::setValue', 1562163680.8727, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (193, 2, 'yii\\caching\\FileCache::setValue', 1562163681.3991, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/0c/0c948cf01c6b8963d52367ff89ade6fd.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/0c/0c948cf01c6b8963d52367ff89ade6fd.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (194, 2, 'yii\\caching\\FileCache::setValue', 1562163724.9056, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (195, 2, 'yii\\caching\\FileCache::setValue', 1562163724.9057, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (196, 1, 'application', 1562163724.9067, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (197, 2, 'yii\\caching\\FileCache::setValue', 1562163724.9122, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (198, 2, 'yii\\caching\\FileCache::setValue', 1562163724.9123, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (199, 2, 'yii\\caching\\FileCache::setValue', 1562163725.4412, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/95/9544c048b245ddc091083a793da96939.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/95/9544c048b245ddc091083a793da96939.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (200, 2, 'yii\\caching\\FileCache::setValue', 1562163785.7692, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (201, 2, 'yii\\caching\\FileCache::setValue', 1562163785.7693, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (202, 1, 'application', 1562163785.7701, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (203, 2, 'yii\\caching\\FileCache::setValue', 1562163801.3896, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (204, 2, 'yii\\caching\\FileCache::setValue', 1562163801.3897, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (205, 1, 'application', 1562163801.3905, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (206, 2, 'yii\\caching\\FileCache::setValue', 1562163801.3964, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (207, 2, 'yii\\caching\\FileCache::setValue', 1562163801.3965, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (208, 2, 'yii\\caching\\FileCache::setValue', 1562163801.9213, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/5c/5cec8b17130c9e5d7bc2ba1d637c4720.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/5c/5cec8b17130c9e5d7bc2ba1d637c4720.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (209, 2, 'yii\\caching\\FileCache::setValue', 1562163845.5289, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (210, 2, 'yii\\caching\\FileCache::setValue', 1562163845.529, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (211, 1, 'application', 1562163845.5299, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (212, 2, 'yii\\caching\\FileCache::setValue', 1562163845.5352, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (213, 2, 'yii\\caching\\FileCache::setValue', 1562163845.5353, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (214, 2, 'yii\\caching\\FileCache::setValue', 1562163846.0595, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/f8/f89f53a5d38a0c93af1c8ceeb53c7f5b.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/f8/f89f53a5d38a0c93af1c8ceeb53c7f5b.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (215, 2, 'yii\\caching\\FileCache::setValue', 1562164969.3193, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (216, 2, 'yii\\caching\\FileCache::setValue', 1562164969.3194, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (217, 2, 'yii\\caching\\FileCache::setValue', 1562165032.0312, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (218, 2, 'yii\\caching\\FileCache::setValue', 1562165032.0313, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (219, 2, 'yii\\caching\\FileCache::setValue', 1562165032.038, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (220, 2, 'yii\\caching\\FileCache::setValue', 1562165032.038, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (221, 2, 'yii\\caching\\FileCache::setValue', 1562165032.5656, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/c5/c5c4f83625c400ef1d4e80b69fc402a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/c5/c5c4f83625c400ef1d4e80b69fc402a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (222, 2, 'yii\\caching\\FileCache::setValue', 1562165033.0326, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (223, 2, 'yii\\caching\\FileCache::setValue', 1562165033.0327, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (224, 2, 'yii\\caching\\FileCache::setValue', 1562165090.3947, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (225, 2, 'yii\\caching\\FileCache::setValue', 1562165090.3947, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (226, 2, 'yii\\caching\\FileCache::setValue', 1562165211.0264, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (227, 2, 'yii\\caching\\FileCache::setValue', 1562165211.0264, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (228, 2, 'yii\\caching\\FileCache::setValue', 1562165211.0329, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (229, 2, 'yii\\caching\\FileCache::setValue', 1562165211.033, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (230, 2, 'yii\\caching\\FileCache::setValue', 1562165211.5556, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/c3/c33880f8b740c4cb660ed48012bf8e35.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/c3/c33880f8b740c4cb660ed48012bf8e35.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (231, 2, 'yii\\caching\\FileCache::setValue', 1562165944.9582, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (232, 2, 'yii\\caching\\FileCache::setValue', 1562165944.9583, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (233, 2, 'yii\\caching\\FileCache::setValue', 1562165998.2875, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (234, 2, 'yii\\caching\\FileCache::setValue', 1562165998.2876, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (235, 2, 'yii\\caching\\FileCache::setValue', 1562166007.4212, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (236, 2, 'yii\\caching\\FileCache::setValue', 1562166007.4213, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (237, 2, 'yii\\caching\\FileCache::setValue', 1562166184.372, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (238, 2, 'yii\\caching\\FileCache::setValue', 1562166184.3721, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (239, 2, 'yii\\caching\\FileCache::setValue', 1562166236.7298, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (240, 2, 'yii\\caching\\FileCache::setValue', 1562166236.7299, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (241, 1, 'application', 1562166236.7312, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (242, 2, 'yii\\caching\\FileCache::setValue', 1562166251.1888, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (243, 2, 'yii\\caching\\FileCache::setValue', 1562166251.1889, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (244, 2, 'yii\\caching\\FileCache::setValue', 1562166251.1955, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (245, 2, 'yii\\caching\\FileCache::setValue', 1562166251.1955, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (246, 2, 'yii\\caching\\FileCache::setValue', 1562166251.7194, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/df/df4823b0c694da287edaea3e4adcc951.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/df/df4823b0c694da287edaea3e4adcc951.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (247, 2, 'yii\\caching\\FileCache::setValue', 1562166309.7365, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (248, 2, 'yii\\caching\\FileCache::setValue', 1562166309.7366, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (249, 2, 'yii\\caching\\FileCache::setValue', 1562166309.7434, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (250, 2, 'yii\\caching\\FileCache::setValue', 1562166309.7435, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (251, 2, 'yii\\caching\\FileCache::setValue', 1562166310.2703, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/98/98f819b141294fa3f58e109e874898a4.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/98/98f819b141294fa3f58e109e874898a4.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (252, 2, 'yii\\caching\\FileCache::setValue', 1562166423.4907, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (253, 2, 'yii\\caching\\FileCache::setValue', 1562166423.4908, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (254, 1, 'application', 1562166423.4918, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (255, 2, 'yii\\caching\\FileCache::setValue', 1562166439.1557, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (256, 2, 'yii\\caching\\FileCache::setValue', 1562166439.1558, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (257, 2, 'yii\\caching\\FileCache::setValue', 1562166439.1626, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (258, 2, 'yii\\caching\\FileCache::setValue', 1562166439.1627, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (259, 2, 'yii\\caching\\FileCache::setValue', 1562166439.692, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/4b/4b4ae4d223d22c207b7b3e05b11da560.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/4b/4b4ae4d223d22c207b7b3e05b11da560.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (260, 2, 'yii\\caching\\FileCache::setValue', 1562166454.9721, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (261, 2, 'yii\\caching\\FileCache::setValue', 1562166454.9722, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (262, 2, 'yii\\caching\\FileCache::setValue', 1562166454.9787, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (263, 2, 'yii\\caching\\FileCache::setValue', 1562166454.9787, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (264, 2, 'yii\\caching\\FileCache::setValue', 1562166455.5057, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/4f/4ff636a471216cc05352305565d10163.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/4f/4ff636a471216cc05352305565d10163.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (265, 2, 'yii\\caching\\FileCache::setValue', 1562166480.6799, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (266, 2, 'yii\\caching\\FileCache::setValue', 1562166480.68, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (267, 1, 'application', 1562166480.6808, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (268, 2, 'yii\\caching\\FileCache::setValue', 1562166497.3871, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (269, 2, 'yii\\caching\\FileCache::setValue', 1562166497.3872, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (270, 1, 'application', 1562166497.3879, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (271, 2, 'yii\\caching\\FileCache::setValue', 1562166505.3112, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (272, 2, 'yii\\caching\\FileCache::setValue', 1562166505.3113, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (273, 2, 'yii\\caching\\FileCache::setValue', 1562166505.3178, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (274, 2, 'yii\\caching\\FileCache::setValue', 1562166505.3179, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (275, 2, 'yii\\caching\\FileCache::setValue', 1562166505.8462, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/96/96563848a4aca4f0eddb2604ace41cd7.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/96/96563848a4aca4f0eddb2604ace41cd7.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (276, 2, 'yii\\caching\\FileCache::setValue', 1562166515.7276, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (277, 2, 'yii\\caching\\FileCache::setValue', 1562166515.7277, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (278, 1, 'application', 1562166515.7285, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (279, 2, 'yii\\caching\\FileCache::setValue', 1562166547.3389, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (280, 2, 'yii\\caching\\FileCache::setValue', 1562166547.339, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (281, 2, 'yii\\caching\\FileCache::setValue', 1562166547.3456, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (282, 2, 'yii\\caching\\FileCache::setValue', 1562166547.3456, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (283, 2, 'yii\\caching\\FileCache::setValue', 1562166547.8908, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/f8/f8be09b212c06c9b0cbfb168f0c64b76.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/f8/f8be09b212c06c9b0cbfb168f0c64b76.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (284, 2, 'yii\\caching\\FileCache::setValue', 1562166574.1851, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (285, 2, 'yii\\caching\\FileCache::setValue', 1562166574.1852, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (286, 2, 'yii\\caching\\FileCache::setValue', 1562166574.1919, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (287, 2, 'yii\\caching\\FileCache::setValue', 1562166574.192, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (288, 2, 'yii\\caching\\FileCache::setValue', 1562166574.7259, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/8e/8e27232155accb4c10f681f1285960c2.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/8e/8e27232155accb4c10f681f1285960c2.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (289, 2, 'yii\\caching\\FileCache::setValue', 1562166612.2999, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (290, 2, 'yii\\caching\\FileCache::setValue', 1562166612.3, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (291, 1, 'application', 1562166612.3009, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (292, 2, 'yii\\caching\\FileCache::setValue', 1562166622.2331, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (293, 2, 'yii\\caching\\FileCache::setValue', 1562166622.2332, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (294, 2, 'yii\\caching\\FileCache::setValue', 1562166622.2398, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (295, 2, 'yii\\caching\\FileCache::setValue', 1562166622.2398, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (296, 2, 'yii\\caching\\FileCache::setValue', 1562166622.7682, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/23/23e67d18750864575ef9bb13759f1b0e.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/23/23e67d18750864575ef9bb13759f1b0e.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (297, 2, 'yii\\caching\\FileCache::setValue', 1562166659.2504, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (298, 2, 'yii\\caching\\FileCache::setValue', 1562166659.2505, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (299, 1, 'application', 1562166659.2513, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (300, 2, 'yii\\caching\\FileCache::setValue', 1562166685.1262, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (301, 2, 'yii\\caching\\FileCache::setValue', 1562166685.1263, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (302, 2, 'yii\\caching\\FileCache::setValue', 1562166685.1351, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (303, 2, 'yii\\caching\\FileCache::setValue', 1562166685.1352, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (304, 2, 'yii\\caching\\FileCache::setValue', 1562166685.6616, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/46/468865a01f24573033b7bec221de3b8a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/46/468865a01f24573033b7bec221de3b8a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (305, 2, 'yii\\caching\\FileCache::setValue', 1562166837.5253, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (306, 2, 'yii\\caching\\FileCache::setValue', 1562166837.5254, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (307, 1, 'application', 1562166837.5263, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (308, 2, 'yii\\caching\\FileCache::setValue', 1562166859.9069, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (309, 2, 'yii\\caching\\FileCache::setValue', 1562166859.907, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (310, 1, 'application', 1562166859.9081, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (311, 2, 'yii\\caching\\FileCache::setValue', 1562166859.9135, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (312, 2, 'yii\\caching\\FileCache::setValue', 1562166859.9136, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (313, 2, 'yii\\caching\\FileCache::setValue', 1562166860.4384, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/c7/c7a833ed8da6d565d65078fc41ddf903.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/c7/c7a833ed8da6d565d65078fc41ddf903.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (314, 2, 'yii\\caching\\FileCache::setValue', 1562166872.8652, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (315, 2, 'yii\\caching\\FileCache::setValue', 1562166872.8653, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (316, 1, 'application', 1562166872.8661, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (317, 2, 'yii\\caching\\FileCache::setValue', 1562166872.8718, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (318, 2, 'yii\\caching\\FileCache::setValue', 1562166872.8719, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (319, 2, 'yii\\caching\\FileCache::setValue', 1562166873.4034, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/ba/baaa468611dcc1deaffefd9a82d4b88e.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/ba/baaa468611dcc1deaffefd9a82d4b88e.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (320, 2, 'yii\\caching\\FileCache::setValue', 1562166953.1021, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (321, 2, 'yii\\caching\\FileCache::setValue', 1562166953.1022, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (322, 1, 'application', 1562166953.103, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (323, 2, 'yii\\caching\\FileCache::setValue', 1562166953.1092, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (324, 2, 'yii\\caching\\FileCache::setValue', 1562166953.1093, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (325, 2, 'yii\\caching\\FileCache::setValue', 1562166953.6334, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3d/3dc37b6a82af527e8aa2ab0150af08c3.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3d/3dc37b6a82af527e8aa2ab0150af08c3.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (326, 2, 'yii\\caching\\FileCache::setValue', 1562166998.047, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (327, 2, 'yii\\caching\\FileCache::setValue', 1562166998.0471, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (328, 1, 'application', 1562166998.048, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (329, 2, 'yii\\caching\\FileCache::setValue', 1562167006.0331, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (330, 2, 'yii\\caching\\FileCache::setValue', 1562167006.0332, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (331, 1, 'application', 1562167006.0341, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (332, 2, 'yii\\caching\\FileCache::setValue', 1562167006.0405, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (333, 2, 'yii\\caching\\FileCache::setValue', 1562167006.0406, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (334, 2, 'yii\\caching\\FileCache::setValue', 1562167006.5679, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/5a/5a788a8ff9803bdda7893f84bc58c585.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/5a/5a788a8ff9803bdda7893f84bc58c585.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (335, 2, 'yii\\caching\\FileCache::setValue', 1562167044.2991, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (336, 2, 'yii\\caching\\FileCache::setValue', 1562167044.2992, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (337, 1, 'application', 1562167044.3, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (338, 2, 'yii\\caching\\FileCache::setValue', 1562167053.5928, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (339, 2, 'yii\\caching\\FileCache::setValue', 1562167053.5929, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (340, 1, 'application', 1562167053.5938, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (341, 2, 'yii\\caching\\FileCache::setValue', 1562167097.89, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (342, 2, 'yii\\caching\\FileCache::setValue', 1562167097.8901, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (343, 1, 'application', 1562167097.8913, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (344, 2, 'yii\\caching\\FileCache::setValue', 1562167109.111, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (345, 2, 'yii\\caching\\FileCache::setValue', 1562167109.1111, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (346, 1, 'application', 1562167109.1119, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (347, 2, 'yii\\caching\\FileCache::setValue', 1562167109.1177, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (348, 2, 'yii\\caching\\FileCache::setValue', 1562167109.1177, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (349, 2, 'yii\\caching\\FileCache::setValue', 1562167109.6443, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/cf/cf8eb5d5d6db6d51c469531a789476f1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/cf/cf8eb5d5d6db6d51c469531a789476f1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (350, 2, 'yii\\caching\\FileCache::setValue', 1562167176.3574, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (351, 2, 'yii\\caching\\FileCache::setValue', 1562167176.3575, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (352, 1, 'application', 1562167176.3584, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (353, 2, 'yii\\caching\\FileCache::setValue', 1562167185.2762, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (354, 2, 'yii\\caching\\FileCache::setValue', 1562167185.2763, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (355, 1, 'application', 1562167185.2771, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (356, 2, 'yii\\caching\\FileCache::setValue', 1562167185.2824, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (357, 2, 'yii\\caching\\FileCache::setValue', 1562167185.2825, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (358, 2, 'yii\\caching\\FileCache::setValue', 1562167185.813, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/86/860ecb495b695c73b1ddc9fbb1b1ccfd.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/86/860ecb495b695c73b1ddc9fbb1b1ccfd.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (359, 2, 'yii\\caching\\FileCache::setValue', 1562167286.3501, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (360, 2, 'yii\\caching\\FileCache::setValue', 1562167286.3501, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (361, 1, 'application', 1562167286.351, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (362, 2, 'yii\\caching\\FileCache::setValue', 1562167286.3564, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (363, 2, 'yii\\caching\\FileCache::setValue', 1562167286.3565, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (364, 2, 'yii\\caching\\FileCache::setValue', 1562167286.8861, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/5e/5e90317a6b1a8ecaa72bbb49c950803a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/5e/5e90317a6b1a8ecaa72bbb49c950803a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (365, 2, 'yii\\caching\\FileCache::setValue', 1562167328.5242, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (366, 2, 'yii\\caching\\FileCache::setValue', 1562167328.5243, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (367, 1, 'application', 1562167328.5252, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (368, 2, 'yii\\caching\\FileCache::setValue', 1562167328.5314, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (369, 2, 'yii\\caching\\FileCache::setValue', 1562167328.5315, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (370, 2, 'yii\\caching\\FileCache::setValue', 1562167329.0578, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/14/146411255e6edd4841890ab2fa705551.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/14/146411255e6edd4841890ab2fa705551.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (371, 2, 'yii\\caching\\FileCache::setValue', 1562167408.1256, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (372, 2, 'yii\\caching\\FileCache::setValue', 1562167408.1257, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (373, 1, 'application', 1562167408.1265, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (374, 2, 'yii\\caching\\FileCache::setValue', 1562167453.4679, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (375, 2, 'yii\\caching\\FileCache::setValue', 1562167453.4681, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (376, 1, 'application', 1562167453.4689, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (377, 2, 'yii\\caching\\FileCache::setValue', 1562167591.1183, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (378, 2, 'yii\\caching\\FileCache::setValue', 1562167591.1184, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (379, 1, 'application', 1562167591.1194, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (380, 2, 'yii\\caching\\FileCache::setValue', 1562167642.5037, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (381, 2, 'yii\\caching\\FileCache::setValue', 1562167642.5038, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (382, 1, 'application', 1562167642.5047, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (383, 2, 'yii\\caching\\FileCache::setValue', 1562167772.6449, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (384, 2, 'yii\\caching\\FileCache::setValue', 1562167772.645, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (385, 1, 'application', 1562167772.6459, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (386, 2, 'yii\\caching\\FileCache::setValue', 1562167772.6518, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (387, 2, 'yii\\caching\\FileCache::setValue', 1562167772.6519, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (388, 2, 'yii\\caching\\FileCache::setValue', 1562167773.1807, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/e2/e23a2aa256b20b38f0d65282b1e20bde.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/e2/e23a2aa256b20b38f0d65282b1e20bde.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (389, 2, 'yii\\caching\\FileCache::setValue', 1562167829.1718, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (390, 2, 'yii\\caching\\FileCache::setValue', 1562167829.1719, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (391, 1, 'application', 1562167829.1727, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (392, 2, 'yii\\caching\\FileCache::setValue', 1562167829.1783, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (393, 2, 'yii\\caching\\FileCache::setValue', 1562167829.1784, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (394, 2, 'yii\\caching\\FileCache::setValue', 1562167829.7085, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/9a/9a463c19f27339bbeead3e6ccc44be72.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/9a/9a463c19f27339bbeead3e6ccc44be72.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (395, 2, 'yii\\caching\\FileCache::setValue', 1562167879.7284, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (396, 2, 'yii\\caching\\FileCache::setValue', 1562167879.7286, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (397, 1, 'application', 1562167879.7296, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (398, 2, 'yii\\caching\\FileCache::setValue', 1562167892.6716, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (399, 2, 'yii\\caching\\FileCache::setValue', 1562167892.6717, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (400, 1, 'application', 1562167892.6725, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (401, 2, 'yii\\caching\\FileCache::setValue', 1562167892.6791, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (402, 2, 'yii\\caching\\FileCache::setValue', 1562167892.6791, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (403, 2, 'yii\\caching\\FileCache::setValue', 1562167893.2076, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/0f/0fc2444b93ff50c7cc199d730aa62695.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/0f/0fc2444b93ff50c7cc199d730aa62695.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (404, 2, 'yii\\caching\\FileCache::setValue', 1562167895.2775, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (405, 2, 'yii\\caching\\FileCache::setValue', 1562167895.2776, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (406, 1, 'application', 1562167895.2786, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (407, 2, 'yii\\caching\\FileCache::setValue', 1562167953.9775, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (408, 2, 'yii\\caching\\FileCache::setValue', 1562167953.9776, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (409, 1, 'application', 1562167953.9786, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (410, 2, 'yii\\caching\\FileCache::setValue', 1562167953.9847, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (411, 2, 'yii\\caching\\FileCache::setValue', 1562167953.9848, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (412, 2, 'yii\\caching\\FileCache::setValue', 1562167954.5281, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/2a/2a3cfd61e99d1016c733a80119962176.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/2a/2a3cfd61e99d1016c733a80119962176.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (413, 2, 'yii\\caching\\FileCache::setValue', 1562167955.0156, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (414, 2, 'yii\\caching\\FileCache::setValue', 1562167955.0157, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (415, 1, 'application', 1562167955.0164, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (416, 2, 'yii\\caching\\FileCache::setValue', 1562167965.8712, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (417, 2, 'yii\\caching\\FileCache::setValue', 1562167965.8713, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (418, 1, 'application', 1562167965.8722, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (419, 2, 'yii\\caching\\FileCache::setValue', 1562167965.8775, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (420, 2, 'yii\\caching\\FileCache::setValue', 1562167965.8775, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (421, 2, 'yii\\caching\\FileCache::setValue', 1562167966.402, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3d/3d6a38df7fe7815d095705dac7ff9f3a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3d/3d6a38df7fe7815d095705dac7ff9f3a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (422, 2, 'yii\\caching\\FileCache::setValue', 1562168036.1163, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (423, 2, 'yii\\caching\\FileCache::setValue', 1562168036.1163, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (424, 1, 'application', 1562168036.1172, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (425, 2, 'yii\\caching\\FileCache::setValue', 1562168053.9834, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (426, 2, 'yii\\caching\\FileCache::setValue', 1562168053.9835, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (427, 1, 'application', 1562168053.9845, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (428, 2, 'yii\\caching\\FileCache::setValue', 1562168053.9901, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (429, 2, 'yii\\caching\\FileCache::setValue', 1562168053.9902, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (430, 2, 'yii\\caching\\FileCache::setValue', 1562168054.5194, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/76/7622d64e9745fac08c88fc5969b8eba7.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/76/7622d64e9745fac08c88fc5969b8eba7.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (431, 2, 'yii\\caching\\FileCache::setValue', 1562168071.7685, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (432, 2, 'yii\\caching\\FileCache::setValue', 1562168071.7686, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (433, 1, 'application', 1562168071.7694, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (434, 2, 'yii\\caching\\FileCache::setValue', 1562168071.7751, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (435, 2, 'yii\\caching\\FileCache::setValue', 1562168071.7751, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (436, 2, 'yii\\caching\\FileCache::setValue', 1562168072.3122, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/32/32a1e0fe78c26e592655e7542716e5a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/32/32a1e0fe78c26e592655e7542716e5a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (437, 2, 'yii\\caching\\FileCache::setValue', 1562168072.6388, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (438, 2, 'yii\\caching\\FileCache::setValue', 1562168072.6389, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (439, 1, 'application', 1562168072.6396, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (440, 2, 'yii\\caching\\FileCache::setValue', 1562168151.477, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (441, 2, 'yii\\caching\\FileCache::setValue', 1562168151.4771, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (442, 1, 'application', 1562168151.4779, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (443, 2, 'yii\\caching\\FileCache::setValue', 1562168160.6915, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (444, 2, 'yii\\caching\\FileCache::setValue', 1562168160.6916, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (445, 1, 'application', 1562168160.6925, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (446, 2, 'yii\\caching\\FileCache::setValue', 1562168160.6984, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (447, 2, 'yii\\caching\\FileCache::setValue', 1562168160.6984, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (448, 2, 'yii\\caching\\FileCache::setValue', 1562168161.2333, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/d8/d807a5640221b297a000cc256e087879.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/d8/d807a5640221b297a000cc256e087879.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (449, 2, 'yii\\caching\\FileCache::setValue', 1562168218.3627, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (450, 2, 'yii\\caching\\FileCache::setValue', 1562168218.3628, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (451, 1, 'application', 1562168218.3637, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (452, 2, 'yii\\caching\\FileCache::setValue', 1562168250.9375, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (453, 2, 'yii\\caching\\FileCache::setValue', 1562168250.9376, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (454, 1, 'application', 1562168250.9384, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (455, 2, 'yii\\caching\\FileCache::setValue', 1562168250.9442, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (456, 2, 'yii\\caching\\FileCache::setValue', 1562168250.9443, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (457, 2, 'yii\\caching\\FileCache::setValue', 1562168251.4752, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/ff/ff3a7f62fa98c3d5f6e079e333849c42.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/ff/ff3a7f62fa98c3d5f6e079e333849c42.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (458, 2, 'yii\\caching\\FileCache::setValue', 1562168262.6264, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (459, 2, 'yii\\caching\\FileCache::setValue', 1562168262.6265, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (460, 1, 'application', 1562168262.6273, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (461, 2, 'yii\\caching\\FileCache::setValue', 1562168271.1482, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (462, 2, 'yii\\caching\\FileCache::setValue', 1562168271.1483, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (463, 1, 'application', 1562168271.1492, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (464, 2, 'yii\\caching\\FileCache::setValue', 1562168277.4358, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (465, 2, 'yii\\caching\\FileCache::setValue', 1562168277.4359, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (466, 1, 'application', 1562168277.4367, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (467, 2, 'yii\\caching\\FileCache::setValue', 1562168277.442, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (468, 2, 'yii\\caching\\FileCache::setValue', 1562168277.442, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (469, 2, 'yii\\caching\\FileCache::setValue', 1562168277.97, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b0/b0def468dd7815f0f6c3c8cf5c2ac425.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b0/b0def468dd7815f0f6c3c8cf5c2ac425.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (470, 2, 'yii\\caching\\FileCache::setValue', 1562168286.4462, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (471, 2, 'yii\\caching\\FileCache::setValue', 1562168286.4463, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (472, 1, 'application', 1562168286.4472, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (473, 2, 'yii\\caching\\FileCache::setValue', 1562168375.2117, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (474, 2, 'yii\\caching\\FileCache::setValue', 1562168375.2118, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (475, 1, 'application', 1562168375.2128, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (476, 2, 'yii\\caching\\FileCache::setValue', 1562168381.7267, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (477, 2, 'yii\\caching\\FileCache::setValue', 1562168381.7267, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (478, 1, 'application', 1562168381.7277, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (479, 2, 'yii\\caching\\FileCache::setValue', 1562168381.7333, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (480, 2, 'yii\\caching\\FileCache::setValue', 1562168381.7334, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (481, 2, 'yii\\caching\\FileCache::setValue', 1562168382.26, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/8317fd34ab4bb2f182b994933ce39116.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/8317fd34ab4bb2f182b994933ce39116.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (482, 2, 'yii\\caching\\FileCache::setValue', 1562168394.4699, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (483, 2, 'yii\\caching\\FileCache::setValue', 1562168394.47, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (484, 1, 'application', 1562168394.4709, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (485, 2, 'yii\\caching\\FileCache::setValue', 1562168430.0284, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (486, 2, 'yii\\caching\\FileCache::setValue', 1562168430.0284, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (487, 1, 'application', 1562168430.0294, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (488, 2, 'yii\\caching\\FileCache::setValue', 1562168571.7568, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (489, 2, 'yii\\caching\\FileCache::setValue', 1562168571.7569, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (490, 1, 'application', 1562168571.7578, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (491, 2, 'yii\\caching\\FileCache::setValue', 1562169054.6704, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (492, 2, 'yii\\caching\\FileCache::setValue', 1562169054.6705, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (493, 1, 'application', 1562169054.6714, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (494, 2, 'yii\\caching\\FileCache::setValue', 1562169054.6772, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (495, 2, 'yii\\caching\\FileCache::setValue', 1562169054.6772, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (496, 2, 'yii\\caching\\FileCache::setValue', 1562169055.2036, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/af/af60e16dc96840c4248824d54c19c167.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/af/af60e16dc96840c4248824d54c19c167.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (497, 2, 'yii\\caching\\FileCache::setValue', 1562169083.8713, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (498, 2, 'yii\\caching\\FileCache::setValue', 1562169083.8714, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (499, 1, 'application', 1562169083.8723, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (500, 2, 'yii\\caching\\FileCache::setValue', 1562169083.8781, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (501, 2, 'yii\\caching\\FileCache::setValue', 1562169083.8782, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (502, 2, 'yii\\caching\\FileCache::setValue', 1562169084.4067, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/62/62a9d1640696a58b267f6bfba663d7a3.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/62/62a9d1640696a58b267f6bfba663d7a3.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (503, 2, 'yii\\caching\\FileCache::setValue', 1562169262.042, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (504, 2, 'yii\\caching\\FileCache::setValue', 1562169262.0421, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (505, 1, 'application', 1562169262.043, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (506, 2, 'yii\\caching\\FileCache::setValue', 1562169262.0487, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (507, 2, 'yii\\caching\\FileCache::setValue', 1562169262.0488, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (508, 2, 'yii\\caching\\FileCache::setValue', 1562169262.5753, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/e3/e3a6fe775a8f1881e5ac75bb1dede40c.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/e3/e3a6fe775a8f1881e5ac75bb1dede40c.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (509, 2, 'yii\\caching\\FileCache::setValue', 1562169263.0649, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (510, 2, 'yii\\caching\\FileCache::setValue', 1562169263.0649, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (511, 1, 'application', 1562169263.0656, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (512, 2, 'yii\\caching\\FileCache::setValue', 1562169275.1865, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (513, 2, 'yii\\caching\\FileCache::setValue', 1562169275.1866, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (514, 1, 'application', 1562169275.1874, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (515, 2, 'yii\\caching\\FileCache::setValue', 1562169275.193, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (516, 2, 'yii\\caching\\FileCache::setValue', 1562169275.193, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (517, 2, 'yii\\caching\\FileCache::setValue', 1562169275.7191, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/dd/dd7858fe6b7f3ff0f7cc7fd01b53c308.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/dd/dd7858fe6b7f3ff0f7cc7fd01b53c308.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (518, 2, 'yii\\caching\\FileCache::setValue', 1562169286.0781, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (519, 2, 'yii\\caching\\FileCache::setValue', 1562169286.0781, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (520, 1, 'application', 1562169286.079, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (521, 2, 'yii\\caching\\FileCache::setValue', 1562169499.6334, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (522, 2, 'yii\\caching\\FileCache::setValue', 1562169499.6335, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (523, 1, 'application', 1562169499.6344, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (524, 2, 'yii\\caching\\FileCache::setValue', 1562169507.5397, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (525, 2, 'yii\\caching\\FileCache::setValue', 1562169507.5398, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (526, 1, 'application', 1562169507.5407, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (527, 2, 'yii\\caching\\FileCache::setValue', 1562169507.5465, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (528, 2, 'yii\\caching\\FileCache::setValue', 1562169507.5466, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (529, 2, 'yii\\caching\\FileCache::setValue', 1562169508.0742, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/e2/e2d3072f3c3a91fa8f52906b66cb0e01.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/e2/e2d3072f3c3a91fa8f52906b66cb0e01.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (530, 2, 'yii\\caching\\FileCache::setValue', 1562169528.9057, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (531, 2, 'yii\\caching\\FileCache::setValue', 1562169528.9057, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (532, 1, 'application', 1562169528.9066, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (533, 2, 'yii\\caching\\FileCache::setValue', 1562169546.3816, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (534, 2, 'yii\\caching\\FileCache::setValue', 1562169546.3817, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (535, 1, 'application', 1562169546.3825, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (536, 2, 'yii\\caching\\FileCache::setValue', 1562169602.8091, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (537, 2, 'yii\\caching\\FileCache::setValue', 1562169602.8091, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (538, 1, 'application', 1562169602.81, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (539, 2, 'yii\\caching\\FileCache::setValue', 1562169617.1079, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (540, 2, 'yii\\caching\\FileCache::setValue', 1562169617.108, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (541, 1, 'application', 1562169617.1089, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (542, 2, 'yii\\caching\\FileCache::setValue', 1562169617.1148, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (543, 2, 'yii\\caching\\FileCache::setValue', 1562169617.1148, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (544, 2, 'yii\\caching\\FileCache::setValue', 1562169617.6379, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/cc/cc3be358bbc24d026583b5cc5d18759d.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/cc/cc3be358bbc24d026583b5cc5d18759d.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (545, 2, 'yii\\caching\\FileCache::setValue', 1562169626.4967, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (546, 2, 'yii\\caching\\FileCache::setValue', 1562169626.4968, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (547, 1, 'application', 1562169626.4976, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (548, 2, 'yii\\caching\\FileCache::setValue', 1562169822.5736, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (549, 2, 'yii\\caching\\FileCache::setValue', 1562169822.5737, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (550, 1, 'application', 1562169822.5746, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (551, 2, 'yii\\caching\\FileCache::setValue', 1562170106.7467, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (552, 2, 'yii\\caching\\FileCache::setValue', 1562170106.7468, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (553, 1, 'application', 1562170106.7478, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (554, 2, 'yii\\caching\\FileCache::setValue', 1562170121.4917, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (555, 2, 'yii\\caching\\FileCache::setValue', 1562170121.4918, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (556, 1, 'application', 1562170121.4927, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (557, 2, 'yii\\caching\\FileCache::setValue', 1562170134.5429, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (558, 2, 'yii\\caching\\FileCache::setValue', 1562170134.543, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (559, 1, 'application', 1562170134.5438, '[frontend][//v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (560, 2, 'yii\\caching\\FileCache::setValue', 1562170158.8244, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (561, 2, 'yii\\caching\\FileCache::setValue', 1562170158.8244, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (562, 1, 'application', 1562170158.8253, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (563, 2, 'yii\\caching\\FileCache::setValue', 1562170189.0198, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (564, 2, 'yii\\caching\\FileCache::setValue', 1562170189.0199, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (565, 1, 'application', 1562170189.0207, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (566, 2, 'yii\\caching\\FileCache::setValue', 1562170235.3337, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (567, 2, 'yii\\caching\\FileCache::setValue', 1562170235.3337, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (568, 1, 'application', 1562170235.3347, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (569, 2, 'yii\\caching\\FileCache::setValue', 1562170245.3467, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (570, 2, 'yii\\caching\\FileCache::setValue', 1562170245.3468, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (571, 1, 'application', 1562170245.3477, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (572, 2, 'yii\\caching\\FileCache::setValue', 1562170245.3532, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (573, 2, 'yii\\caching\\FileCache::setValue', 1562170245.3532, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (574, 2, 'yii\\caching\\FileCache::setValue', 1562170245.8892, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/05/05d2f45791f1f2fd48ae98bcd211556c.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/05/05d2f45791f1f2fd48ae98bcd211556c.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (575, 2, 'yii\\caching\\FileCache::setValue', 1562170246.2878, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (576, 2, 'yii\\caching\\FileCache::setValue', 1562170246.2879, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (577, 1, 'application', 1562170246.2886, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (578, 2, 'yii\\caching\\FileCache::setValue', 1562170264.7413, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (579, 2, 'yii\\caching\\FileCache::setValue', 1562170264.7414, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (580, 1, 'application', 1562170264.7422, '[frontend][/v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (581, 2, 'yii\\caching\\FileCache::setValue', 1562170264.7482, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (582, 2, 'yii\\caching\\FileCache::setValue', 1562170264.7483, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (583, 2, 'yii\\caching\\FileCache::setValue', 1562170265.2768, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/4b/4b275b9fa4918a5c7600083bca1c13ce.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/4b/4b275b9fa4918a5c7600083bca1c13ce.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (584, 2, 'yii\\caching\\FileCache::setValue', 1562170265.5342, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (585, 2, 'yii\\caching\\FileCache::setValue', 1562170265.5343, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (586, 1, 'application', 1562170265.535, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (587, 2, 'yii\\caching\\FileCache::setValue', 1562170359.6681, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (588, 2, 'yii\\caching\\FileCache::setValue', 1562170359.6681, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (589, 1, 'application', 1562170359.669, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (590, 2, 'yii\\caching\\FileCache::setValue', 1562170450.2165, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (591, 2, 'yii\\caching\\FileCache::setValue', 1562170450.2166, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (592, 1, 'application', 1562170450.2175, '[frontend][/v1/user/view]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (593, 2, 'yii\\caching\\FileCache::setValue', 1562170913.3511, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (594, 2, 'yii\\caching\\FileCache::setValue', 1562170913.3511, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (595, 2, 'yii\\caching\\FileCache::setValue', 1562170955.546, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (596, 2, 'yii\\caching\\FileCache::setValue', 1562170955.5461, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (597, 2, 'yii\\caching\\FileCache::setValue', 1562171041.7585, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (598, 2, 'yii\\caching\\FileCache::setValue', 1562171041.7586, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (599, 2, 'yii\\caching\\FileCache::setValue', 1562171052.6264, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (600, 2, 'yii\\caching\\FileCache::setValue', 1562171052.6265, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (601, 2, 'yii\\caching\\FileCache::setValue', 1562171071.8696, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (602, 2, 'yii\\caching\\FileCache::setValue', 1562171071.8697, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (603, 2, 'yii\\caching\\FileCache::setValue', 1562171071.8768, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (604, 2, 'yii\\caching\\FileCache::setValue', 1562171071.8768, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (605, 2, 'yii\\caching\\FileCache::setValue', 1562171072.4055, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/97/9740763ef746829a1b2548ba1a622c59.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/97/9740763ef746829a1b2548ba1a622c59.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (606, 2, 'yii\\caching\\FileCache::setValue', 1562171072.6471, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (607, 2, 'yii\\caching\\FileCache::setValue', 1562171072.6472, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (608, 2, 'yii\\caching\\FileCache::setValue', 1562171098.0142, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (609, 2, 'yii\\caching\\FileCache::setValue', 1562171098.0143, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (610, 2, 'yii\\caching\\FileCache::setValue', 1562171232.2334, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (611, 2, 'yii\\caching\\FileCache::setValue', 1562171232.2335, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (612, 2, 'yii\\caching\\FileCache::setValue', 1562171251.2694, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (613, 2, 'yii\\caching\\FileCache::setValue', 1562171251.2695, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (614, 2, 'yii\\caching\\FileCache::setValue', 1562171251.2765, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (615, 2, 'yii\\caching\\FileCache::setValue', 1562171251.2766, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (616, 2, 'yii\\caching\\FileCache::setValue', 1562171251.8072, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/11/11ce09a35b53b4c7a786e1ed42b0abf4.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/11/11ce09a35b53b4c7a786e1ed42b0abf4.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (617, 2, 'yii\\caching\\FileCache::setValue', 1562171252.1543, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (618, 2, 'yii\\caching\\FileCache::setValue', 1562171252.1544, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (619, 2, 'yii\\caching\\FileCache::setValue', 1562171270.8334, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (620, 2, 'yii\\caching\\FileCache::setValue', 1562171270.8335, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (621, 2, 'yii\\caching\\FileCache::setValue', 1562171270.8399, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (622, 2, 'yii\\caching\\FileCache::setValue', 1562171270.8399, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (623, 2, 'yii\\caching\\FileCache::setValue', 1562171271.3673, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/50/502b966db17ee0fbe828b31999f3a109.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/50/502b966db17ee0fbe828b31999f3a109.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (624, 2, 'yii\\caching\\FileCache::setValue', 1562171271.7553, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (625, 2, 'yii\\caching\\FileCache::setValue', 1562171271.7554, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (626, 2, 'yii\\caching\\FileCache::setValue', 1562171272.1329, '[frontend][/v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (627, 2, 'yii\\caching\\FileCache::setValue', 1562171272.133, '[frontend][/v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (628, 2, 'yii\\caching\\FileCache::setValue', 1562171332.5581, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (629, 2, 'yii\\caching\\FileCache::setValue', 1562171332.5582, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (630, 2, 'yii\\caching\\FileCache::setValue', 1562171333.8379, '[frontend][/v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (631, 2, 'yii\\caching\\FileCache::setValue', 1562171333.838, '[frontend][/v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (632, 2, 'yii\\caching\\FileCache::setValue', 1562171376.7669, '[frontend][/v1/advertisement/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (633, 2, 'yii\\caching\\FileCache::setValue', 1562171376.767, '[frontend][/v1/advertisement/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (634, 2, 'yii\\caching\\FileCache::setValue', 1562171378.9024, '[frontend][/v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (635, 2, 'yii\\caching\\FileCache::setValue', 1562171378.9025, '[frontend][/v1/incarnation/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (636, 2, 'yii\\caching\\FileCache::setValue', 1562207002.3505, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (637, 2, 'yii\\caching\\FileCache::setValue', 1562207002.3506, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (638, 1, 'application', 1562207002.4128, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (639, 2, 'yii\\caching\\FileCache::setValue', 1562207002.4336, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (640, 2, 'yii\\caching\\FileCache::setValue', 1562207002.4337, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (641, 2, 'yii\\caching\\FileCache::setValue', 1562207002.963, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/e9/e96e7115a6d1b839c9075b0999f14903.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/e9/e96e7115a6d1b839c9075b0999f14903.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (642, 2, 'yii\\caching\\FileCache::setValue', 1562207003.7076, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (643, 2, 'yii\\caching\\FileCache::setValue', 1562207003.7077, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (644, 1, 'application', 1562207003.7085, '[frontend][//v1/user/index]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (645, 2, 'yii\\caching\\FileCache::setValue', 1562207034.0841, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (646, 2, 'yii\\caching\\FileCache::setValue', 1562207034.0842, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (647, 1, 'application', 1562207034.085, '[frontend][//v1/user/login]', 'HttpBearerAuth');
INSERT INTO `inv_log` VALUES (648, 2, 'yii\\caching\\FileCache::setValue', 1562207034.0907, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (649, 2, 'yii\\caching\\FileCache::setValue', 1562207034.0907, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (650, 2, 'yii\\caching\\FileCache::setValue', 1562207034.6181, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/4d/4dfc41b2baa1c7c4d9a44bc55bbf8f6c.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/4d/4dfc41b2baa1c7c4d9a44bc55bbf8f6c.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (651, 2, 'yii\\caching\\FileCache::setValue', 1562207061.5428, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (652, 2, 'yii\\caching\\FileCache::setValue', 1562207061.5429, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (653, 2, 'yii\\caching\\FileCache::setValue', 1562207076.7497, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (654, 2, 'yii\\caching\\FileCache::setValue', 1562207076.7498, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (655, 2, 'yii\\caching\\FileCache::setValue', 1562207076.7566, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (656, 2, 'yii\\caching\\FileCache::setValue', 1562207076.7567, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (657, 2, 'yii\\caching\\FileCache::setValue', 1562207077.2948, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/ef/efa938594ec274f57e8ac93be35a3f5f.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/ef/efa938594ec274f57e8ac93be35a3f5f.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (658, 2, 'yii\\caching\\FileCache::setValue', 1562207077.499, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (659, 2, 'yii\\caching\\FileCache::setValue', 1562207077.4991, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (660, 1, 'application', 1562207265.4001, '[frontend][/v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (661, 1, 'application', 1562207404.6267, '[frontend][/v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (662, 1, 'application', 1562207439.4283, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (663, 1, 'application', 1562207447.1875, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (664, 1, 'application', 1562207448.6241, '[frontend][/v1/user/view]', '10');
INSERT INTO `inv_log` VALUES (665, 1, 'application', 1562207449.235, '[frontend][/v1/user/index]', '10');
INSERT INTO `inv_log` VALUES (666, 1, 'application', 1562207450.2661, '[frontend][/v1/incarnation/index]', '10');
INSERT INTO `inv_log` VALUES (667, 1, 'application', 1562207457.2574, '[frontend][/v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (668, 1, 'application', 1562207470.862, '[frontend][/v1/user/view]', '10');
INSERT INTO `inv_log` VALUES (669, 1, 'application', 1562207472.0776, '[frontend][/v1/user/index]', '10');
INSERT INTO `inv_log` VALUES (670, 1, 'application', 1562207472.738, '[frontend][/v1/incarnation/index]', '10');
INSERT INTO `inv_log` VALUES (671, 1, 'application', 1562207489.2318, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (672, 1, 'application', 1562207490.6527, '[frontend][/v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (673, 1, 'application', 1562207491.7377, '[frontend][/v1/incarnation/index]', '21');
INSERT INTO `inv_log` VALUES (674, 1, 'application', 1562207914.7526, '[frontend][/v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (675, 2, 'yii\\caching\\FileCache::setValue', 1562208383.7869, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (676, 2, 'yii\\caching\\FileCache::setValue', 1562208383.787, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (677, 1, 'application', 1562208383.9764, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (678, 2, 'yii\\caching\\FileCache::setValue', 1562208397.914, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (679, 2, 'yii\\caching\\FileCache::setValue', 1562208397.9141, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (680, 2, 'yii\\caching\\FileCache::setValue', 1562208398.0462, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (681, 2, 'yii\\caching\\FileCache::setValue', 1562208398.0462, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (682, 2, 'yii\\caching\\FileCache::setValue', 1562208398.6307, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/42/42efeb50421110b4dd5bc3df97fa587f.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/42/42efeb50421110b4dd5bc3df97fa587f.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (683, 2, 'yii\\caching\\FileCache::setValue', 1562208408.7422, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (684, 2, 'yii\\caching\\FileCache::setValue', 1562208408.7423, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (685, 1, 'application', 1562208408.7431, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (686, 2, 'yii\\caching\\FileCache::setValue', 1562208411.4902, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (687, 2, 'yii\\caching\\FileCache::setValue', 1562208411.4903, '[frontend][/v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (688, 1, 'application', 1562208411.4911, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (689, 2, 'yii\\caching\\FileCache::setValue', 1562208412.5584, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (690, 2, 'yii\\caching\\FileCache::setValue', 1562208412.5585, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (691, 1, 'application', 1562208412.5738, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (692, 2, 'yii\\caching\\FileCache::setValue', 1562208412.579, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (693, 2, 'yii\\caching\\FileCache::setValue', 1562208412.5791, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (694, 2, 'yii\\caching\\FileCache::setValue', 1562208413.1272, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/86/868650f06f1ff4f23d8607420917abb5.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/86/868650f06f1ff4f23d8607420917abb5.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (695, 2, 'yii\\caching\\FileCache::setValue', 1562208413.4144, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (696, 2, 'yii\\caching\\FileCache::setValue', 1562208413.4144, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (697, 1, 'application', 1562208413.4153, '[frontend][//v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (698, 2, 'yii\\caching\\FileCache::setValue', 1562208413.6047, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (699, 2, 'yii\\caching\\FileCache::setValue', 1562208413.6047, '[frontend][//v1/user/index]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (700, 1, 'application', 1562208413.6225, '[frontend][//v1/user/index]', 'false');
INSERT INTO `inv_log` VALUES (701, 2, 'yii\\caching\\FileCache::setValue', 1562208426.6511, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (702, 2, 'yii\\caching\\FileCache::setValue', 1562208426.6512, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (703, 1, 'application', 1562208426.652, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (704, 2, 'yii\\caching\\FileCache::setValue', 1562208426.6573, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (705, 2, 'yii\\caching\\FileCache::setValue', 1562208426.6574, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (706, 2, 'yii\\caching\\FileCache::setValue', 1562208427.1849, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/f7/f799d62c3a2a1485ea51d17d33cc6e1f.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/f7/f799d62c3a2a1485ea51d17d33cc6e1f.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (707, 2, 'yii\\caching\\FileCache::setValue', 1562208427.3056, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (708, 2, 'yii\\caching\\FileCache::setValue', 1562208427.3056, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (709, 1, 'application', 1562208427.3064, '[frontend][//v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (710, 2, 'yii\\caching\\FileCache::setValue', 1562208437.4152, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (711, 2, 'yii\\caching\\FileCache::setValue', 1562208437.4153, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (712, 1, 'application', 1562208437.4161, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (713, 2, 'yii\\caching\\FileCache::setValue', 1562208437.4222, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/83/834ce30e16444cf661ebfb30b5cea54a.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (714, 2, 'yii\\caching\\FileCache::setValue', 1562208437.4223, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/38/38cdfe3b3627a66779a0cda0c87c3d66.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (715, 2, 'yii\\caching\\FileCache::setValue', 1562208437.9516, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/2c/2ce866725ce5be27da0348e3fd38aa59.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/2c/2ce866725ce5be27da0348e3fd38aa59.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (716, 2, 'yii\\caching\\FileCache::setValue', 1562208438.0834, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/3c/3cd1b9c902daca88ccf0819f143038a1.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (717, 2, 'yii\\caching\\FileCache::setValue', 1562208438.0835, '[frontend][//v1/user/view]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b7/b7789052b6e6b48bf8dcbeeefd890e48.bin): failed to open stream: No such file or directory');
INSERT INTO `inv_log` VALUES (718, 1, 'application', 1562208438.0842, '[frontend][//v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (719, 1, 'application', 1562208481.1014, '[frontend][/v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (720, 1, 'application', 1562208490.8429, '[frontend][//v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (721, 1, 'application', 1562208497.4784, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (722, 1, 'application', 1562208498.1042, '[frontend][//v1/user/view]', '10');
INSERT INTO `inv_log` VALUES (723, 1, 'application', 1562208498.2737, '[frontend][//v1/incarnation/index]', '10');
INSERT INTO `inv_log` VALUES (724, 1, 'application', 1562208498.507, '[frontend][//v1/user/index]', '10');
INSERT INTO `inv_log` VALUES (725, 1, 'application', 1562208620.9029, '[frontend][//v1/incarnation/index]', '10');
INSERT INTO `inv_log` VALUES (726, 1, 'application', 1562208627.6681, '[frontend][//v1/incarnation/index]', '10');
INSERT INTO `inv_log` VALUES (727, 1, 'application', 1562208631.2058, '[frontend][//v1/advertisement/index]', '10');
INSERT INTO `inv_log` VALUES (728, 1, 'application', 1562208673.3394, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (729, 1, 'application', 1562208674.0322, '[frontend][//v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (730, 1, 'application', 1562208674.1331, '[frontend][//v1/incarnation/index]', '21');
INSERT INTO `inv_log` VALUES (731, 1, 'application', 1562208681.3434, '[frontend][//v1/incarnation/grades]', '21');
INSERT INTO `inv_log` VALUES (732, 1, 'application', 1562208681.655, '[frontend][//v1/user/state]', '21');
INSERT INTO `inv_log` VALUES (733, 1, 'application', 1562208681.7377, '[frontend][//v1/question/index]', '21');
INSERT INTO `inv_log` VALUES (734, 1, 'application', 1562208700.0627, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (735, 1, 'application', 1562208700.7082, '[frontend][//v1/user/view]', '21');
INSERT INTO `inv_log` VALUES (736, 1, 'application', 1562208701.134, '[frontend][//v1/incarnation/index]', '21');
INSERT INTO `inv_log` VALUES (737, 1, 'application', 1562208711.8283, '[frontend][//v1/incarnation/grades]', '21');
INSERT INTO `inv_log` VALUES (738, 1, 'application', 1562208711.9865, '[frontend][//v1/user/state]', '21');
INSERT INTO `inv_log` VALUES (739, 1, 'application', 1562208712.0777, '[frontend][//v1/question/index]', '21');
INSERT INTO `inv_log` VALUES (740, 1, 'application', 1562208729.8667, '[frontend][//v1/question/answer]', '21');
INSERT INTO `inv_log` VALUES (741, 1, 'application', 1562208731.2646, '[frontend][//v1/question/index]', '21');
INSERT INTO `inv_log` VALUES (742, 1, 'yii\\console\\UnknownCommandException', 1562210315.9871, '[console][]', 'yii\\base\\InvalidRouteException: Unable to resolve the request: swoole/ in /home/vagrant/code/investigation/vendor/yiisoft/yii2/base/Controller.php:128\nStack trace:\n#0 /home/vagrant/code/investigation/vendor/yiisoft/yii2/console/Controller.php(148): yii\\base\\Controller->runAction(\'\', Array)\n#1 /home/vagrant/code/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\console\\Controller->runAction(\'\', Array)\n#2 /home/vagrant/code/investigation/vendor/yiisoft/yii2/console/Application.php(180): yii\\base\\Module->runAction(\'swoole\', Array)\n#3 /home/vagrant/code/investigation/vendor/yiisoft/yii2/console/Application.php(147): yii\\console\\Application->runAction(\'swoole\', Array)\n#4 /home/vagrant/code/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#5 /home/vagrant/code/investigation/console/yii(26): yii\\base\\Application->run()\n#6 {main}\n\nNext yii\\console\\UnknownCommandException: Unknown command \"swoole\". in /home/vagrant/code/investigation/vendor/yiisoft/yii2/console/Application.php:183\nStack trace:\n#0 /home/vagrant/code/investigation/vendor/yiisoft/yii2/console/Application.php(147): yii\\console\\Application->runAction(\'swoole\', Array)\n#1 /home/vagrant/code/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#2 /home/vagrant/code/investigation/console/yii(26): yii\\base\\Application->run()\n#3 {main}');
INSERT INTO `inv_log` VALUES (743, 1, 'application', 1562230948.1444, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (744, 1, 'application', 1562230951.0293, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (745, 1, 'application', 1562239038.2413, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (746, 1, 'application', 1562239050.4369, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (747, 1, 'application', 1562239065.5846, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (748, 1, 'application', 1562239134.0326, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (749, 1, 'application', 1562239279.4835, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (750, 1, 'application', 1562239296.5615, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (751, 1, 'application', 1562239338.0873, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (752, 1, 'application', 1562239347.9774, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (753, 1, 'application', 1562239348.759, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (754, 1, 'application', 1562239348.9918, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (755, 1, 'application', 1562239349.2261, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (756, 1, 'application', 1562239382.2455, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (757, 1, 'application', 1562239382.8905, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (758, 1, 'application', 1562239383.0047, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (759, 1, 'application', 1562239414.5774, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (760, 1, 'application', 1562239415.2153, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (761, 1, 'application', 1562239415.5449, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (762, 1, 'application', 1562239423.4223, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (763, 1, 'Error', 1562239423.5073, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (764, 1, 'application', 1562239446.3878, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (765, 1, 'application', 1562239447.0073, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (766, 1, 'application', 1562239447.0922, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (767, 1, 'application', 1562239447.2341, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (768, 1, 'application', 1562239451.2987, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (769, 1, 'application', 1562239454.7628, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (770, 1, 'application', 1562239456.6596, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (771, 1, 'application', 1562239568.8628, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (772, 1, 'application', 1562239577.1352, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (773, 1, 'application', 1562239583.5434, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (774, 1, 'application', 1562239597.8166, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (775, 1, 'application', 1562239637.7583, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (776, 1, 'application', 1562239695.359, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (777, 1, 'application', 1562239695.952, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (778, 1, 'application', 1562239704.6708, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (779, 1, 'application', 1562239705.2849, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (780, 1, 'application', 1562239705.588, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (781, 1, 'application', 1562239710.3953, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (782, 1, 'Error', 1562239710.4197, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (783, 1, 'application', 1562239847.3453, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (784, 2, 'yii\\caching\\FileCache::setValue', 1562239847.8891, '[frontend][//v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b5/b598037102706066bd50edffaa1f54d4.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b5/b598037102706066bd50edffaa1f54d4.bin): failed to open stream: Permission denied');
INSERT INTO `inv_log` VALUES (785, 1, 'application', 1562239848.0741, '[frontend][//v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (786, 1, 'application', 1562239854.1375, '[frontend][//v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (787, 1, 'application', 1562239862.9287, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (788, 1, 'application', 1562239863.5308, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (789, 1, 'application', 1562239863.6232, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (790, 1, 'application', 1562239873.0714, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (791, 1, 'application', 1562239873.682, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (792, 1, 'application', 1562239873.8132, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (793, 1, 'application', 1562239917.7687, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (794, 1, 'application', 1562239918.3768, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (795, 1, 'application', 1562239918.5703, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (796, 1, 'application', 1562239940.7011, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (797, 1, 'Error', 1562239940.7206, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (798, 1, 'application', 1562239980.3261, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (799, 1, 'application', 1562239980.9493, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (800, 1, 'application', 1562239981.073, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (801, 1, 'application', 1562239981.6512, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (802, 1, 'application', 1562239991.6655, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (803, 1, 'application', 1562240000.9923, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (804, 1, 'application', 1562240029.0422, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (805, 1, 'application', 1562240040.4983, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (806, 1, 'application', 1562240043.0273, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (807, 1, 'application', 1562240074.4673, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (808, 1, 'application', 1562240103.5024, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (809, 1, 'application', 1562240104.1247, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (810, 1, 'application', 1562240104.4114, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (811, 1, 'application', 1562240139.5858, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (812, 1, 'application', 1562240139.7855, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (813, 1, 'application', 1562240158.5158, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (814, 1, 'application', 1562240159.1118, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (815, 1, 'application', 1562240159.2286, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (816, 1, 'application', 1562240159.3118, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (817, 1, 'application', 1562240162.4988, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (818, 1, 'application', 1562240167.8513, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (819, 1, 'application', 1562240173.6789, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (820, 1, 'application', 1562240177.9939, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (821, 1, 'application', 1562240180.5107, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (822, 1, 'application', 1562240199.5163, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (823, 1, 'application', 1562240207.1819, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (824, 1, 'application', 1562240207.7779, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (825, 1, 'application', 1562240207.9803, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (826, 1, 'application', 1562240217.7174, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (827, 1, 'application', 1562240217.9477, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (828, 1, 'application', 1562240218.0929, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (829, 1, 'application', 1562240242.0565, '[frontend][//v1/question/answer]', '37');
INSERT INTO `inv_log` VALUES (830, 1, 'application', 1562240243.2715, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (831, 1, 'application', 1562240280.334, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (832, 1, 'application', 1562240285.0216, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (833, 1, 'application', 1562240285.1492, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (834, 1, 'application', 1562240286.3748, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (835, 1, 'application', 1562240327.851, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (836, 1, 'application', 1562240327.9727, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (837, 1, 'application', 1562240329.1558, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (838, 1, 'application', 1562240359.6664, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (839, 1, 'application', 1562240359.7936, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (840, 1, 'application', 1562240361.0123, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (841, 1, 'application', 1562241101.6226, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (842, 1, 'application', 1562241102.3962, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (843, 1, 'application', 1562241102.9373, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (844, 1, 'application', 1562241103.2257, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (845, 1, 'application', 1562241136.5477, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (846, 1, 'application', 1562241136.7447, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (847, 1, 'application', 1562241149.7126, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (848, 1, 'application', 1562241150.2566, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (849, 1, 'application', 1562241150.6663, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (850, 1, 'application', 1562241299.8644, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (851, 1, 'application', 1562241364.5455, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (852, 1, 'application', 1562241364.8748, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (853, 1, 'application', 1562241365.092, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (854, 1, 'application', 1562241377.4254, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (855, 1, 'application', 1562241377.8502, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (856, 1, 'application', 1562241378.0984, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (857, 1, 'application', 1562241421.1008, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (858, 1, 'application', 1562241421.6972, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (859, 1, 'application', 1562241421.8213, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (860, 1, 'application', 1562241421.9354, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (861, 1, 'application', 1562241427.457, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (862, 1, 'application', 1562241439.1839, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (863, 1, 'application', 1562241439.8736, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (864, 1, 'application', 1562241440.0936, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (865, 1, 'application', 1562241440.1893, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (866, 1, 'application', 1562241457.1617, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (867, 1, 'application', 1562241457.6487, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (868, 1, 'application', 1562241458.0549, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (869, 1, 'application', 1562241541.4649, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (870, 1, 'application', 1562241571.9044, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (871, 1, 'application', 1562241572.631, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (872, 1, 'application', 1562241572.8309, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (873, 1, 'application', 1562241573.2034, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (874, 1, 'application', 1562241581.4649, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (875, 1, 'application', 1562241595.7783, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (876, 1, 'application', 1562241602.1149, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (877, 1, 'application', 1562241607.7724, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (878, 1, 'application', 1562241608.7247, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (879, 1, 'application', 1562241655.0753, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (880, 1, 'application', 1562241655.7163, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (881, 1, 'application', 1562241655.8098, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (882, 1, 'application', 1562241655.9546, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (883, 1, 'application', 1562241667.9896, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (884, 1, 'application', 1562241668.632, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (885, 1, 'application', 1562241668.7506, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (886, 1, 'application', 1562241676.6703, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (887, 1, 'Error', 1562241676.7204, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (888, 1, 'application', 1562241683.1494, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (889, 1, 'Error', 1562241683.1702, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (890, 1, 'application', 1562241710.4921, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (891, 1, 'Error', 1562241710.5107, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (892, 1, 'application', 1562241745.1372, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (893, 1, 'application', 1562241745.8186, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (894, 1, 'application', 1562241745.9499, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (895, 1, 'application', 1562241746.1959, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (896, 1, 'application', 1562248971.4932, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (897, 1, 'application', 1562248972.5396, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (898, 1, 'application', 1562248972.747, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (899, 1, 'application', 1562248978.8555, '[frontend][/v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (900, 1, 'Error', 1562248979.004, '[frontend][/v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'v1/incarnation/...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (901, 1, 'application', 1562249011.2215, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (902, 1, 'application', 1562249011.8271, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (903, 1, 'application', 1562249015.3096, '[frontend][/v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (904, 1, 'Error', 1562249015.33, '[frontend][/v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'v1/incarnation/...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (905, 1, 'application', 1562249079.0269, '[frontend][//v1/user/login]', '37');
INSERT INTO `inv_log` VALUES (906, 1, 'application', 1562249079.7227, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (907, 1, 'application', 1562249079.8097, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (908, 1, 'application', 1562249081.7772, '[frontend][//v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (909, 1, 'Error', 1562249081.7949, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (910, 1, 'application', 1562249234.4241, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (911, 1, 'application', 1562249235.104, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (912, 1, 'application', 1562249235.257, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (913, 1, 'application', 1562249235.3529, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (914, 1, 'application', 1562249308.1549, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (915, 1, 'application', 1562249332.7457, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (916, 1, 'application', 1562249359.8538, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (917, 1, 'application', 1562249362.5185, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (918, 1, 'application', 1562249448.148, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (919, 1, 'application', 1562249448.5513, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (920, 1, 'application', 1562249628.1776, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (921, 1, 'application', 1562249628.561, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (922, 1, 'application', 1562249818.2914, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (923, 1, 'application', 1562249819.0767, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (924, 1, 'application', 1562249829.656, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (925, 1, 'application', 1562249829.9763, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (926, 1, 'application', 1562249837.437, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (927, 1, 'application', 1562249837.7706, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (928, 1, 'application', 1562249843.0139, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (929, 1, 'application', 1562249843.501, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (930, 1, 'application', 1562249852.6557, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (931, 1, 'application', 1562249854.1404, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (932, 1, 'application', 1562249860.2765, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (933, 1, 'application', 1562249860.7091, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (934, 1, 'application', 1562249967.76, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (935, 1, 'application', 1562249968.4974, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (936, 1, 'application', 1562249970.1675, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (937, 1, 'application', 1562250131.6015, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (938, 1, 'application', 1562250131.618, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (939, 1, 'application', 1562250132.4817, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (940, 1, 'application', 1562250133.1804, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (941, 1, 'application', 1562250137.0449, '[frontend][/v1/user/login]', '37');
INSERT INTO `inv_log` VALUES (942, 1, 'application', 1562250137.7936, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (943, 1, 'application', 1562250137.8052, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (944, 1, 'application', 1562250138.1164, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (945, 1, 'application', 1562250138.1662, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (946, 1, 'application', 1562250155.7934, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (947, 1, 'application', 1562250155.8062, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (948, 1, 'application', 1562250156.0863, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (949, 1, 'application', 1562250156.1001, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (950, 1, 'application', 1562250159.6423, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (951, 1, 'application', 1562250159.9908, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (952, 1, 'application', 1562250172.327, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (953, 1, 'application', 1562250172.4591, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (954, 1, 'application', 1562250172.7744, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (955, 1, 'application', 1562250173.6834, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (956, 1, 'application', 1562250189.2164, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (957, 1, 'application', 1562250189.4321, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (958, 1, 'application', 1562250189.7127, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (959, 1, 'application', 1562250190.5392, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (960, 1, 'application', 1562250197.5377, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (961, 1, 'application', 1562250197.7489, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (962, 1, 'application', 1562250197.9811, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (963, 1, 'application', 1562250198.2603, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (964, 1, 'application', 1562250202.0175, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (965, 1, 'application', 1562250202.387, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (966, 1, 'application', 1562250207.1443, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (967, 1, 'application', 1562250207.294, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (968, 1, 'application', 1562250207.6463, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (969, 1, 'application', 1562250208.2125, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (970, 1, 'application', 1562250253.2085, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (971, 1, 'application', 1562250253.5585, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (972, 1, 'application', 1562250255.2327, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (973, 1, 'application', 1562250255.7397, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (974, 1, 'application', 1562250352.0328, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (975, 1, 'application', 1562250352.1707, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (976, 1, 'application', 1562250352.3623, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (977, 1, 'application', 1562250353.0965, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (978, 1, 'application', 1562250357.8312, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (979, 1, 'application', 1562250358.1842, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (980, 1, 'application', 1562250358.3435, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (981, 1, 'application', 1562250359.4298, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (982, 1, 'application', 1562250363.2041, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (983, 1, 'application', 1562250363.2564, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (984, 1, 'application', 1562250363.3514, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (985, 1, 'application', 1562250363.411, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (986, 1, 'application', 1562250367.5115, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (987, 1, 'application', 1562250367.524, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (988, 1, 'application', 1562250367.7296, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (989, 1, 'application', 1562250367.937, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (990, 1, 'application', 1562250494.9557, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (991, 1, 'application', 1562250495.1314, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (992, 1, 'application', 1562251089.442, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (993, 1, 'application', 1562251089.4571, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (994, 1, 'application', 1562251090.7877, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (995, 1, 'application', 1562251091.2365, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (996, 1, 'application', 1562251096.5025, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (997, 1, 'application', 1562251096.8535, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (998, 1, 'application', 1562251136.3491, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (999, 1, 'application', 1562251136.5294, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1000, 1, 'application', 1562251137.1628, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1001, 1, 'application', 1562251137.3077, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1002, 1, 'application', 1562251153.2513, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1003, 1, 'application', 1562251153.2658, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1004, 1, 'application', 1562251153.7112, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1005, 1, 'application', 1562251153.8934, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1006, 1, 'application', 1562251161.6409, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1007, 1, 'application', 1562251162.2396, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1008, 1, 'application', 1562251220.9471, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1009, 1, 'application', 1562251220.9663, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1010, 1, 'application', 1562251221.2182, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1011, 1, 'application', 1562251221.7639, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1012, 1, 'application', 1562251225.0577, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1013, 1, 'application', 1562251225.159, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1014, 1, 'application', 1562251226.0996, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1015, 1, 'application', 1562251226.9305, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1016, 1, 'application', 1562251233.5325, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1017, 1, 'application', 1562251233.6283, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1018, 1, 'application', 1562251234.1703, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1019, 1, 'application', 1562251234.7695, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1020, 1, 'application', 1562251300.6181, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1021, 1, 'application', 1562251301.3708, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1022, 1, 'application', 1562251301.6588, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1023, 1, 'application', 1562251887.3588, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1024, 1, 'application', 1562251887.4889, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1025, 1, 'application', 1562251888.4902, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1026, 1, 'application', 1562251888.5421, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1027, 1, 'application', 1562251890.9889, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1028, 1, 'application', 1562251891.2955, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1029, 1, 'application', 1562252016.7746, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1030, 1, 'application', 1562252018.5258, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1031, 1, 'application', 1562252019.1032, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1032, 1, 'application', 1562252084.0385, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1033, 1, 'application', 1562252084.4348, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1034, 1, 'application', 1562252114.9727, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1035, 1, 'application', 1562252115.4769, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1036, 1, 'application', 1562252255.0929, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1037, 1, 'application', 1562252255.112, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1038, 1, 'application', 1562252256.106, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1039, 1, 'application', 1562252256.3623, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1040, 1, 'application', 1562252393.5657, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1041, 1, 'application', 1562252394.172, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1042, 1, 'application', 1562252511.7647, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1043, 1, 'application', 1562252512.1596, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1044, 1, 'application', 1562252513.0578, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1045, 1, 'application', 1562252513.7878, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1046, 1, 'application', 1562252948.4544, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1047, 1, 'application', 1562252948.6284, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1048, 1, 'application', 1562252949.3109, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1049, 1, 'application', 1562252949.4279, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1050, 1, 'application', 1562252953.792, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1051, 1, 'application', 1562252954.0391, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1052, 1, 'application', 1562252992.1487, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1053, 1, 'application', 1562252992.3192, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1054, 1, 'application', 1562252992.8875, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1055, 1, 'application', 1562252993.0945, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1056, 1, 'application', 1562253060.3979, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1057, 1, 'application', 1562253060.4083, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1058, 1, 'application', 1562253060.8168, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1059, 1, 'application', 1562253060.8929, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1060, 1, 'application', 1562253068.8359, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1061, 1, 'application', 1562253068.9238, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1062, 1, 'application', 1562253069.7306, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1063, 1, 'application', 1562253069.9676, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1064, 1, 'application', 1562253085.4567, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1065, 1, 'application', 1562253085.4921, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1066, 1, 'application', 1562253086.0064, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1067, 1, 'application', 1562253086.0551, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1068, 1, 'application', 1562253132.6159, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1069, 1, 'application', 1562253132.627, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1070, 1, 'application', 1562253133.0688, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1071, 1, 'application', 1562253133.1516, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1072, 1, 'application', 1562253275.4504, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1073, 1, 'application', 1562253280.9302, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1074, 1, 'application', 1562253281.7168, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1075, 1, 'application', 1562253281.8686, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1076, 1, 'application', 1562253312.9161, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1077, 1, 'application', 1562253312.9276, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1078, 1, 'application', 1562253313.0091, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1079, 1, 'application', 1562253313.2355, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1080, 1, 'application', 1562253313.2367, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1081, 1, 'application', 1562253313.302, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1082, 1, 'application', 1562253315.6041, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1083, 1, 'application', 1562253315.7515, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1084, 1, 'application', 1562253363.609, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1085, 1, 'application', 1562253363.6267, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1086, 1, 'application', 1562253363.7333, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1087, 1, 'application', 1562253364.0045, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1088, 1, 'application', 1562253364.0921, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1089, 1, 'application', 1562253364.1274, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1090, 1, 'application', 1562253433.922, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1091, 1, 'application', 1562253434.5931, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1092, 1, 'application', 1562253434.7964, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1093, 1, 'application', 1562253434.8949, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1094, 1, 'application', 1562253482.254, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1095, 1, 'application', 1562253482.5566, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1096, 1, 'application', 1562253482.6658, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1097, 1, 'application', 1562253738.0967, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1098, 1, 'application', 1562253738.1654, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1099, 1, 'application', 1562253738.3159, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1100, 1, 'application', 1562254013.6306, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1101, 1, 'application', 1562254013.8275, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1102, 1, 'application', 1562254065.4012, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1103, 1, 'application', 1562254066.7019, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1104, 1, 'application', 1562254066.9792, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1105, 1, 'application', 1562254067.1122, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1106, 1, 'application', 1562254082.1839, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1107, 1, 'application', 1562254082.2749, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1108, 1, 'application', 1562254083.4358, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1109, 1, 'application', 1562254083.6684, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1110, 1, 'application', 1562254083.7994, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1111, 1, 'application', 1562254144.9227, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1112, 1, 'application', 1562254145.0264, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1113, 1, 'application', 1562254145.1905, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1114, 1, 'application', 1562254148.6254, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1115, 1, 'application', 1562254148.8926, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1116, 1, 'application', 1562254149.018, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1117, 1, 'application', 1562254163.6, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1118, 1, 'application', 1562254163.6785, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1119, 1, 'application', 1562254163.8299, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1120, 1, 'application', 1562254188.2488, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1121, 1, 'application', 1562254188.3061, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1122, 1, 'application', 1562254188.4472, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1123, 1, 'application', 1562254200.5096, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1124, 1, 'application', 1562254200.5801, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1125, 1, 'application', 1562254200.7085, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1126, 1, 'application', 1562254224.1668, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1127, 1, 'application', 1562254224.4266, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1128, 1, 'application', 1562254224.5343, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1129, 1, 'application', 1562254262.8636, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1130, 1, 'application', 1562254262.9534, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1131, 1, 'application', 1562254263.1123, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1132, 1, 'application', 1562254295.736, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1133, 1, 'application', 1562254306.0259, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1134, 1, 'application', 1562254306.7903, '[frontend][/v1/user/view]', '39');
INSERT INTO `inv_log` VALUES (1135, 1, 'application', 1562254307.2622, '[frontend][/v1/incarnation/index]', '39');
INSERT INTO `inv_log` VALUES (1136, 1, 'application', 1562254319.4466, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1137, 1, 'application', 1562254320.169, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1138, 1, 'application', 1562254320.3682, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1139, 1, 'application', 1562254320.5269, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1140, 1, 'application', 1562254366.5599, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1141, 1, 'application', 1562254366.7575, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1142, 1, 'application', 1562254367.1856, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1143, 1, 'application', 1562255129.4309, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1144, 1, 'application', 1562255130.1982, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1145, 1, 'application', 1562255130.3853, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1146, 1, 'application', 1562255173.3661, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1147, 1, 'application', 1562255180.042, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1148, 1, 'application', 1562255180.7685, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1149, 1, 'application', 1562255180.8777, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1150, 1, 'application', 1562255181.0173, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1151, 1, 'application', 1562255217.5391, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1152, 1, 'application', 1562255217.6039, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1153, 1, 'application', 1562255217.6455, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1154, 1, 'application', 1562255217.7386, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1155, 1, 'application', 1562255217.8431, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1156, 1, 'application', 1562255218.065, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1157, 1, 'application', 1562255226.3971, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1158, 1, 'application', 1562255226.399, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1159, 1, 'application', 1562255226.4273, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1160, 1, 'application', 1562255226.4336, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1161, 1, 'application', 1562255226.5999, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1162, 1, 'application', 1562255226.6091, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1163, 1, 'application', 1562255239.3588, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1164, 1, 'application', 1562255239.3954, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1165, 1, 'application', 1562255239.4377, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1166, 1, 'application', 1562255239.469, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1167, 1, 'application', 1562255239.5414, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1168, 1, 'application', 1562255239.5662, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1169, 1, 'application', 1562255252.2063, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1170, 1, 'application', 1562255252.2071, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1171, 1, 'application', 1562255252.2325, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1172, 1, 'application', 1562255252.2619, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1173, 1, 'application', 1562255252.3884, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1174, 1, 'application', 1562255252.3999, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1175, 1, 'application', 1562255318.055, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1176, 1, 'application', 1562255482.3311, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1177, 1, 'application', 1562255907.3431, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1178, 1, 'application', 1562255907.366, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1179, 1, 'application', 1562255907.4062, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1180, 1, 'application', 1562255907.5076, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1181, 1, 'application', 1562255907.5308, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1182, 1, 'application', 1562255907.6091, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1183, 1, 'application', 1562255933.8514, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1184, 1, 'application', 1562255933.8566, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1185, 1, 'application', 1562255933.9177, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1186, 1, 'application', 1562255933.9255, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1187, 1, 'application', 1562255934.0347, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1188, 1, 'application', 1562255934.082, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1189, 1, 'application', 1562255939.4519, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1190, 1, 'application', 1562255939.7467, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1191, 1, 'application', 1562255939.8543, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1192, 1, 'application', 1562255993.6897, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1193, 1, 'application', 1562255993.6979, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1194, 1, 'application', 1562255993.7559, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1195, 1, 'application', 1562255993.7719, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1196, 1, 'application', 1562255993.8856, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1197, 1, 'application', 1562255993.9102, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1198, 1, 'application', 1562256047.7876, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1199, 1, 'application', 1562256047.8566, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1200, 1, 'application', 1562256047.8614, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1201, 1, 'application', 1562256047.9517, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1202, 1, 'application', 1562256048.0511, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1203, 1, 'application', 1562256048.107, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1204, 1, 'application', 1562256057.6, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1205, 1, 'application', 1562256057.9032, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1206, 1, 'application', 1562256058.0407, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1207, 1, 'application', 1562256120.9895, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1208, 1, 'application', 1562256120.9938, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1209, 1, 'application', 1562256121.0593, '[frontend][/v1/user/index]', '37');
INSERT INTO `inv_log` VALUES (1210, 1, 'application', 1562256121.0903, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1211, 1, 'application', 1562256121.1962, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1212, 1, 'application', 1562256121.2381, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1213, 1, 'application', 1562256128.4877, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1214, 1, 'application', 1562256128.7927, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1215, 1, 'application', 1562256128.8981, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1216, 1, 'application', 1562256402.8585, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1217, 1, 'application', 1562256403.554, '[frontend][/v1/user/view]', '38');
INSERT INTO `inv_log` VALUES (1218, 1, 'application', 1562256403.8646, '[frontend][/v1/incarnation/index]', '38');
INSERT INTO `inv_log` VALUES (1219, 1, 'application', 1562256414.2224, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1220, 1, 'application', 1562256415.0168, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1221, 1, 'application', 1562256415.2319, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1222, 1, 'application', 1562256415.3748, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1223, 1, 'application', 1562256542.2503, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1224, 1, 'application', 1562256542.2684, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1225, 1, 'application', 1562256542.3354, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1226, 1, 'application', 1562256542.393, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1227, 1, 'application', 1562256542.4341, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1228, 1, 'application', 1562256542.4498, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1229, 1, 'application', 1562256542.5135, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1230, 1, 'application', 1562256542.6178, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1231, 1, 'application', 1562256542.7466, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1232, 1, 'application', 1562256642.1209, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1233, 1, 'application', 1562256642.125, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1234, 1, 'application', 1562256642.1704, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1235, 1, 'application', 1562256642.2437, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1236, 1, 'application', 1562256642.3175, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1237, 1, 'application', 1562256642.3539, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1238, 1, 'application', 1562256642.4253, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1239, 1, 'application', 1562256642.6482, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1240, 1, 'application', 1562256642.7327, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1241, 1, 'application', 1562256665.671, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1242, 1, 'application', 1562256665.9232, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1243, 1, 'application', 1562256667.9439, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1244, 1, 'application', 1562256668.1147, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1245, 1, 'application', 1562256686.455, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1246, 1, 'application', 1562256712.0424, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1247, 1, 'application', 1562256731.6297, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1248, 1, 'application', 1562256775.1094, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1249, 1, 'application', 1562256775.2444, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1250, 1, 'application', 1562256775.3351, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1251, 1, 'application', 1562256829.3985, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1252, 1, 'application', 1562256829.4817, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1253, 1, 'application', 1562256829.6387, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1254, 1, 'application', 1562256985.5986, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1255, 1, 'application', 1562256985.9044, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1256, 1, 'application', 1562256986.0054, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1257, 1, 'application', 1562256986.441, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1258, 1, 'application', 1562256986.8685, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1259, 1, 'application', 1562256987.0519, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1260, 1, 'application', 1562256988.4977, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1261, 1, 'application', 1562256989.0475, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1262, 1, 'application', 1562256989.1647, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1263, 1, 'application', 1562256996.1676, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1264, 1, 'application', 1562256996.3974, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1265, 1, 'application', 1562256996.5258, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1266, 1, 'application', 1562257067.7684, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1267, 1, 'application', 1562257068.0496, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1268, 1, 'application', 1562257068.1541, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1269, 1, 'application', 1562257108.2967, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1270, 1, 'application', 1562257108.4923, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1271, 1, 'application', 1562257108.5968, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1272, 1, 'application', 1562257108.9924, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1273, 1, 'application', 1562257109.4278, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1274, 1, 'application', 1562257109.5749, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1275, 1, 'application', 1562257111.1097, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1276, 1, 'application', 1562257111.5492, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1277, 1, 'application', 1562257111.7297, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1278, 1, 'application', 1562257190.0779, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1279, 1, 'application', 1562257190.1657, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1280, 1, 'application', 1562257190.3461, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1281, 1, 'application', 1562257232.8081, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1282, 1, 'application', 1562257232.8791, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1283, 1, 'application', 1562257233.0562, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1284, 1, 'application', 1562257276.5501, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1285, 1, 'application', 1562257276.6203, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1286, 1, 'application', 1562257276.8047, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1287, 1, 'application', 1562257318.8646, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1288, 1, 'application', 1562257319.0933, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1289, 1, 'application', 1562257319.3041, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1290, 1, 'application', 1562257319.6921, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1291, 1, 'application', 1562257320.0849, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1292, 1, 'application', 1562257320.2534, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1293, 1, 'application', 1562257321.863, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1294, 1, 'application', 1562257322.9465, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1295, 1, 'application', 1562257323.3424, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1296, 1, 'application', 1562257379.6293, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1297, 1, 'application', 1562257379.7281, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1298, 1, 'application', 1562257379.8821, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1299, 1, 'application', 1562257412.8274, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1300, 1, 'application', 1562257508.6113, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1301, 1, 'application', 1562257508.7703, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1302, 1, 'application', 1562257508.8482, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1303, 1, 'application', 1562257509.6632, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1304, 1, 'application', 1562257510.0608, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1305, 1, 'application', 1562257510.1956, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1306, 1, 'application', 1562257511.6305, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1307, 1, 'application', 1562257512.2383, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1308, 1, 'application', 1562257512.4326, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1309, 1, 'application', 1562257521.9945, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1310, 1, 'application', 1562257522.1305, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1311, 1, 'application', 1562257522.2641, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1312, 1, 'application', 1562257522.6847, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1313, 1, 'application', 1562257523.2857, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1314, 1, 'application', 1562257523.3953, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1315, 1, 'application', 1562257524.9344, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1316, 1, 'application', 1562257525.253, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1317, 1, 'application', 1562257525.4629, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1318, 1, 'application', 1562257528.9888, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1319, 1, 'application', 1562257529.097, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1320, 1, 'application', 1562257529.1811, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1321, 1, 'application', 1562257529.5222, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1322, 1, 'application', 1562257529.8797, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1323, 1, 'application', 1562257529.9373, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1324, 1, 'application', 1562257531.6254, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1325, 1, 'application', 1562257532.1697, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1326, 1, 'application', 1562257532.3302, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1327, 1, 'application', 1562257630.0425, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1328, 1, 'application', 1562257630.1821, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1329, 1, 'application', 1562257630.2503, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1330, 1, 'application', 1562257630.9279, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1331, 1, 'application', 1562257631.5524, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1332, 1, 'application', 1562257631.7494, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1333, 1, 'application', 1562257633.3176, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1334, 1, 'application', 1562257633.7935, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1335, 1, 'application', 1562257634.0222, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1336, 1, 'application', 1562257707.4168, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1337, 1, 'application', 1562257707.5137, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1338, 1, 'application', 1562257707.6254, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1339, 1, 'application', 1562257707.6753, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1340, 1, 'application', 1562257707.9353, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1341, 1, 'application', 1562257708.2117, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1342, 1, 'application', 1562257718.5541, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1343, 1, 'application', 1562257718.6649, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1344, 1, 'application', 1562257718.7421, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1345, 1, 'application', 1562257728.149, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1346, 1, 'application', 1562257728.2203, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1347, 1, 'application', 1562257728.23, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1348, 1, 'application', 1562257728.3026, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1349, 1, 'application', 1562257728.3808, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1350, 1, 'application', 1562257728.4984, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1351, 1, 'application', 1562257758.643, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1352, 1, 'application', 1562257758.8662, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1353, 1, 'application', 1562257758.9413, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1354, 1, 'application', 1562257853.1816, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1355, 1, 'application', 1562257853.3918, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1356, 1, 'application', 1562257853.4691, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1357, 1, 'application', 1562258097.6818, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1358, 1, 'application', 1562258097.8691, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1359, 1, 'application', 1562258097.9568, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1360, 1, 'application', 1562258098.7127, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1361, 1, 'application', 1562258099.3673, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1362, 1, 'application', 1562258099.497, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1363, 1, 'application', 1562258101.4194, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1364, 1, 'application', 1562258102.0702, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1365, 1, 'application', 1562258102.3574, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1366, 1, 'application', 1562258191.2006, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1367, 1, 'application', 1562258191.3719, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1368, 1, 'application', 1562258191.4522, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1369, 1, 'application', 1562258271.9404, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1370, 1, 'application', 1562258272.2331, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1371, 1, 'application', 1562258272.4402, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1372, 1, 'application', 1562258328.5772, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1373, 1, 'application', 1562258328.7534, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1374, 1, 'application', 1562258328.8703, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1375, 1, 'application', 1562258355.838, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1376, 1, 'application', 1562258356.1863, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1377, 1, 'application', 1562258356.3987, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1378, 1, 'application', 1562258465.6507, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1379, 1, 'application', 1562258466.0811, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1380, 1, 'application', 1562258466.4465, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1381, 1, 'application', 1562258468.5948, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1382, 1, 'application', 1562258468.7802, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1383, 1, 'application', 1562258468.8696, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1384, 1, 'application', 1562258571.5078, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1385, 1, 'application', 1562258571.5683, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1386, 1, 'application', 1562258571.6505, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1387, 1, 'application', 1562258571.7354, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1388, 1, 'application', 1562258571.9112, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1389, 1, 'application', 1562258572.1708, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1390, 1, 'application', 1562258613.5257, '[frontend][/v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1391, 1, 'application', 1562258654.0968, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1392, 1, 'application', 1562258654.2341, '[frontend][/v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1393, 1, 'application', 1562258654.32, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1394, 1, 'application', 1562258670.3041, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1395, 1, 'application', 1562258670.999, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1396, 1, 'application', 1562258671.3681, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1397, 1, 'application', 1562258676.4885, '[frontend][/v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (1398, 1, 'Error', 1562258676.537, '[frontend][/v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'v1/incarnation/...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1399, 1, 'application', 1562258713.4819, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1400, 1, 'application', 1562258713.6337, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1401, 1, 'application', 1562258715.7241, '[frontend][/v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (1402, 1, 'Error', 1562258715.7585, '[frontend][/v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'v1/incarnation/...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1403, 1, 'application', 1562258721.142, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1404, 1, 'application', 1562258721.2965, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1405, 1, 'application', 1562259151.2361, '[frontend][/v1/user/login]', '35');
INSERT INTO `inv_log` VALUES (1406, 1, 'application', 1562259151.9922, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1407, 1, 'application', 1562259152.2184, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1408, 1, 'application', 1562259161.3908, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1409, 1, 'application', 1562259162.1871, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1410, 1, 'application', 1562259162.3057, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1411, 1, 'application', 1562259177.7896, '[frontend][/v1/question/answer]', '37');
INSERT INTO `inv_log` VALUES (1412, 1, 'application', 1562259179.1118, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1413, 1, 'application', 1562259212.1278, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1414, 1, 'application', 1562259212.1882, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1415, 1, 'application', 1562259212.2848, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1416, 1, 'application', 1562259221.7676, '[frontend][/v1/question/answer]', '37');
INSERT INTO `inv_log` VALUES (1417, 1, 'application', 1562259222.9921, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1418, 1, 'application', 1562259334.2405, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1419, 1, 'application', 1562259334.3068, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1420, 1, 'application', 1562259334.4298, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1421, 1, 'application', 1562259334.5536, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1422, 1, 'application', 1562259335.302, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1423, 1, 'application', 1562259335.6971, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1424, 1, 'application', 1562259348.2872, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1425, 1, 'application', 1562259348.6433, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1426, 1, 'application', 1562259349.6777, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1427, 1, 'application', 1562259376.3491, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1428, 1, 'application', 1562259376.5676, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1429, 1, 'application', 1562259378.0767, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1430, 1, 'application', 1562259450.7015, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1431, 1, 'application', 1562259450.8103, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1432, 1, 'application', 1562259450.8828, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1433, 1, 'application', 1562259451.4563, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1434, 1, 'application', 1562259451.7193, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1435, 1, 'application', 1562259452.086, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1436, 1, 'application', 1562259516.4563, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1437, 1, 'application', 1562259516.5797, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1438, 1, 'application', 1562259516.7553, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1439, 1, 'application', 1562259516.9849, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1440, 1, 'application', 1562259517.6193, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1441, 1, 'application', 1562259517.6678, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1442, 1, 'application', 1562259707.0472, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1443, 1, 'application', 1562259707.0523, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1444, 1, 'application', 1562259707.2363, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1445, 1, 'application', 1562259707.7432, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1446, 1, 'application', 1562259708.1126, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1447, 1, 'application', 1562259708.2962, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1448, 1, 'application', 1562259767.4671, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1449, 1, 'application', 1562259767.4671, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1450, 1, 'application', 1562259768.3725, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1451, 1, 'application', 1562259768.3744, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1452, 1, 'application', 1562259768.5222, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1453, 1, 'application', 1562259768.6503, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1454, 1, 'application', 1562259777.3492, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1455, 1, 'application', 1562259777.353, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1456, 1, 'application', 1562259777.5749, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1457, 1, 'application', 1562259777.7671, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1458, 1, 'application', 1562259778.3142, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1459, 1, 'application', 1562259778.5465, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1460, 1, 'application', 1562259913.7215, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1461, 1, 'application', 1562259913.7207, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1462, 1, 'application', 1562259913.8941, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1463, 1, 'application', 1562259913.946, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1464, 1, 'application', 1562259914.8251, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1465, 1, 'application', 1562259915.6257, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1466, 1, 'application', 1562259964.4121, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1467, 1, 'application', 1562259964.5184, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1468, 1, 'application', 1562259964.5868, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1469, 1, 'application', 1562259964.684, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1470, 1, 'application', 1562259965.4573, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1471, 1, 'application', 1562259965.5952, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1472, 1, 'application', 1562259982.873, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1473, 1, 'application', 1562259982.873, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1474, 1, 'application', 1562259983.0663, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1475, 1, 'application', 1562259983.0946, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1476, 1, 'application', 1562259983.8824, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1477, 1, 'application', 1562259983.9683, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1478, 1, 'application', 1562260021.5082, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1479, 1, 'application', 1562260021.5205, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1480, 1, 'application', 1562260021.7021, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1481, 1, 'application', 1562260021.7279, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1482, 1, 'application', 1562260022.6964, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1483, 1, 'application', 1562260023.5568, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1484, 1, 'application', 1562260121.9117, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1485, 1, 'application', 1562260121.9185, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1486, 1, 'application', 1562260122.0823, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1487, 1, 'application', 1562260122.1024, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1488, 1, 'application', 1562260123.0112, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1489, 1, 'application', 1562260123.7401, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1490, 1, 'application', 1562260143.4075, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1491, 1, 'application', 1562260143.5114, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1492, 1, 'application', 1562260143.5812, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1493, 1, 'application', 1562260143.7499, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1494, 1, 'application', 1562260144.4761, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1495, 1, 'application', 1562260144.6441, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1496, 1, 'application', 1562260216.7312, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1497, 1, 'application', 1562260216.9045, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1498, 1, 'application', 1562260217.8723, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1499, 1, 'application', 1562260248.3666, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1500, 1, 'application', 1562260248.4785, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1501, 1, 'application', 1562260248.646, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1502, 1, 'application', 1562260248.7036, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1503, 1, 'application', 1562260249.5683, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1504, 1, 'application', 1562260249.7207, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1505, 1, 'application', 1562260265.7607, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1506, 1, 'application', 1562260266.1398, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1507, 1, 'application', 1562260267.0855, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1508, 1, 'application', 1562260289.0592, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1509, 1, 'application', 1562260289.1003, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1510, 1, 'application', 1562260289.2457, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1511, 1, 'application', 1562260289.6455, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1512, 1, 'application', 1562260290.1292, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1513, 1, 'application', 1562260290.2049, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1514, 1, 'application', 1562260299.8137, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1515, 1, 'application', 1562260299.8174, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1516, 1, 'application', 1562260300.0332, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1517, 1, 'application', 1562260300.1496, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1518, 1, 'application', 1562260300.8754, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1519, 1, 'application', 1562260300.9684, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1520, 1, 'application', 1562260338.9258, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1521, 1, 'application', 1562260339.0747, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1522, 1, 'application', 1562260339.1242, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1523, 1, 'application', 1562260339.4858, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1524, 1, 'application', 1562260340.0662, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1525, 1, 'application', 1562260340.4301, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1526, 1, 'application', 1562260524.4041, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1527, 1, 'application', 1562260524.7783, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1528, 1, 'application', 1562260526.0634, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1529, 1, 'application', 1562260698.902, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1530, 1, 'application', 1562260699.038, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1531, 1, 'application', 1562260699.0863, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1532, 1, 'application', 1562260699.3632, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1533, 1, 'application', 1562260699.9742, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1534, 1, 'application', 1562260700.7068, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1535, 1, 'application', 1562260715.8981, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1536, 1, 'application', 1562260716.0661, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1537, 1, 'application', 1562260716.0811, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1538, 1, 'application', 1562260716.2833, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1539, 1, 'application', 1562260716.9554, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1540, 1, 'application', 1562260717.762, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1541, 1, 'application', 1562260722.9412, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1542, 1, 'application', 1562260723.4937, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1543, 1, 'application', 1562260724.6693, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1544, 1, 'application', 1562260732.3368, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1545, 1, 'application', 1562260732.5375, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1546, 1, 'application', 1562260733.529, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1547, 1, 'application', 1562260793.4038, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1548, 1, 'application', 1562260793.5566, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1549, 1, 'application', 1562260794.4854, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1550, 1, 'application', 1562260823.8552, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1551, 1, 'application', 1562260824.0052, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1552, 1, 'application', 1562260824.9377, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1553, 1, 'application', 1562260826.1713, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1554, 1, 'application', 1562260826.3691, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1555, 1, 'application', 1562260827.7031, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1556, 1, 'application', 1562260917.7478, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1557, 1, 'application', 1562260917.9182, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1558, 1, 'application', 1562260918.8545, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1559, 1, 'application', 1562260918.9167, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1560, 1, 'application', 1562260919.2628, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1561, 1, 'application', 1562260920.073, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1562, 1, 'application', 1562261054.7962, '[frontend][/v1/question/answer]', '37');
INSERT INTO `inv_log` VALUES (1563, 1, 'application', 1562261055.1783, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1564, 1, 'application', 1562261192.7312, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1565, 1, 'application', 1562261192.8263, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1566, 1, 'application', 1562261192.9086, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1567, 1, 'application', 1562261193.0001, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1568, 1, 'application', 1562261193.8957, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1569, 1, 'application', 1562261194.6762, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1570, 1, 'application', 1562261195.3976, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1571, 1, 'application', 1562261195.551, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1572, 1, 'application', 1562261196.4968, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1573, 1, 'application', 1562261252.2819, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1574, 1, 'application', 1562261252.3188, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1575, 1, 'application', 1562261252.4718, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1576, 1, 'application', 1562261252.5038, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1577, 1, 'application', 1562261253.4918, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1578, 1, 'application', 1562261253.7785, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1579, 1, 'application', 1562261345.59, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1580, 1, 'application', 1562261345.7219, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1581, 1, 'application', 1562261346.2128, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1582, 1, 'application', 1562261376.6626, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1583, 1, 'application', 1562261420.904, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1584, 1, 'application', 1562261421.522, '[frontend][//v1/user/view]', '38');
INSERT INTO `inv_log` VALUES (1585, 1, 'application', 1562261421.8666, '[frontend][//v1/incarnation/index]', '38');
INSERT INTO `inv_log` VALUES (1586, 1, 'application', 1562261439.4333, '[frontend][//v1/incarnation/grades]', '38');
INSERT INTO `inv_log` VALUES (1587, 2, 'yii\\caching\\FileCache::setValue', 1562261439.4684, '[frontend][//v1/incarnation/grades]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/df/df8fbec219e75a2a5666628b5fec6384.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/df/df8fbec219e75a2a5666628b5fec6384.bin): failed to open stream: Permission denied');
INSERT INTO `inv_log` VALUES (1588, 1, 'Error', 1562261439.4685, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1589, 1, 'application', 1562261450.8368, '[frontend][//v1/user/view]', '38');
INSERT INTO `inv_log` VALUES (1590, 1, 'application', 1562261450.9503, '[frontend][//v1/question/index]', '38');
INSERT INTO `inv_log` VALUES (1591, 1, 'application', 1562261451.002, '[frontend][//v1/incarnation/index]', '38');
INSERT INTO `inv_log` VALUES (1592, 1, 'application', 1562261463.7069, '[frontend][//v1/question/answer]', '38');
INSERT INTO `inv_log` VALUES (1593, 1, 'application', 1562261464.9494, '[frontend][//v1/question/index]', '38');
INSERT INTO `inv_log` VALUES (1594, 1, 'application', 1562261487.537, '[frontend][//v1/question/answer]', '38');
INSERT INTO `inv_log` VALUES (1595, 1, 'application', 1562261487.7092, '[frontend][//v1/question/index]', '38');
INSERT INTO `inv_log` VALUES (1596, 1, 'application', 1562261525.7557, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1597, 1, 'application', 1562261526.471, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1598, 1, 'application', 1562261526.7674, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1599, 1, 'application', 1562261526.7804, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1600, 1, 'application', 1562261568.3545, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1601, 1, 'application', 1562261580.4503, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1602, 1, 'application', 1562261595.1768, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1603, 1, 'application', 1562261601.0535, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1604, 1, 'application', 1562293868.8334, '[frontend][/v1/user/login]', '37');
INSERT INTO `inv_log` VALUES (1605, 1, 'application', 1562293869.8065, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1606, 1, 'application', 1562293869.9748, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1607, 1, 'application', 1562293877.2309, '[frontend][/v1/incarnation/grades]', '37');
INSERT INTO `inv_log` VALUES (1608, 1, 'Error', 1562293877.3309, '[frontend][/v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'v1/incarnation/...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1609, 1, 'application', 1562293957.9822, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1610, 1, 'application', 1562293958.6616, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1611, 1, 'application', 1562294052.7127, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1612, 1, 'application', 1562294053.1126, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1613, 1, 'application', 1562294128.7235, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1614, 1, 'application', 1562294129.0423, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1615, 1, 'application', 1562294129.1781, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1616, 1, 'application', 1562294157.1022, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1617, 1, 'application', 1562294170.7986, '[frontend][/v1/user/login]', '37');
INSERT INTO `inv_log` VALUES (1618, 1, 'application', 1562294325.478, '[frontend][/v1/user/login]', '37');
INSERT INTO `inv_log` VALUES (1619, 1, 'application', 1562294326.2206, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1620, 1, 'application', 1562294326.4633, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1621, 1, 'application', 1562294326.5354, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1622, 1, 'application', 1562294561.8568, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1623, 1, 'application', 1562294562.0302, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1624, 1, 'application', 1562294562.357, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1625, 1, 'application', 1562294571.4258, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1626, 1, 'application', 1562294571.8777, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1627, 1, 'application', 1562294572.3622, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1628, 1, 'application', 1562294580.0875, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1629, 1, 'application', 1562294580.7713, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1630, 1, 'application', 1562294580.947, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1631, 1, 'application', 1562294581.0013, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1632, 1, 'application', 1562294589.7143, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1633, 1, 'application', 1562294590.4617, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1634, 1, 'application', 1562294590.6296, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1635, 1, 'application', 1562294590.6771, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1636, 1, 'application', 1562294609.9701, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1637, 1, 'application', 1562294610.4807, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1638, 1, 'application', 1562294610.9101, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1639, 1, 'application', 1562294618.1931, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1640, 1, 'application', 1562294618.8753, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1641, 1, 'application', 1562294619.2796, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1642, 1, 'application', 1562294619.3064, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1643, 1, 'application', 1562294806.8105, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1644, 1, 'application', 1562294807.0553, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1645, 1, 'application', 1562294807.6903, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1646, 1, 'application', 1562294813.1886, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1647, 1, 'application', 1562294813.4496, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1648, 1, 'application', 1562294813.486, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1649, 1, 'application', 1562294823.1221, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1650, 1, 'application', 1562294823.2137, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1651, 1, 'application', 1562294823.4691, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1652, 1, 'application', 1562294833.0374, '[frontend][/v1/question/answer]', '37');
INSERT INTO `inv_log` VALUES (1653, 1, 'application', 1562294833.3438, '[frontend][/v1/user/state]', '37');
INSERT INTO `inv_log` VALUES (1654, 1, 'application', 1562294834.4759, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1655, 1, 'application', 1562294850.7584, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1656, 1, 'application', 1562294851.4422, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1657, 1, 'application', 1562294851.9151, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1658, 1, 'application', 1562294853.0449, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1659, 1, 'application', 1562295896.0925, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1660, 2, 'yii\\caching\\FileCache::setValue', 1562295896.7513, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/03/03e3ed92a60f141bf001109dce18d5f2.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/03/03e3ed92a60f141bf001109dce18d5f2.bin): failed to open stream: Permission denied');
INSERT INTO `inv_log` VALUES (1661, 1, 'application', 1562295897.2475, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (1662, 1, 'application', 1562295926.55, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1663, 1, 'application', 1562295927.3988, '[frontend][/v1/user/view]', '38');
INSERT INTO `inv_log` VALUES (1664, 1, 'application', 1562295928.2918, '[frontend][/v1/incarnation/index]', '38');
INSERT INTO `inv_log` VALUES (1665, 1, 'application', 1562295971.7369, '[frontend][/v1/user/view]', '38');
INSERT INTO `inv_log` VALUES (1666, 1, 'application', 1562295972.0615, '[frontend][/v1/incarnation/index]', '38');
INSERT INTO `inv_log` VALUES (1667, 1, 'application', 1562295989.4182, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1668, 1, 'application', 1562295990.152, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1669, 1, 'application', 1562295990.6262, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1670, 1, 'application', 1562295992.2577, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1671, 1, 'application', 1562296213.9903, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1672, 1, 'application', 1562296220.076, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1673, 1, 'application', 1562296228.7196, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1674, 1, 'application', 1562296229.4671, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1675, 1, 'application', 1562296229.9579, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1676, 1, 'application', 1562296230.8144, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1677, 1, 'application', 1562296236.0768, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1678, 1, 'application', 1562296236.2479, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1679, 1, 'application', 1562296243.9043, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1680, 1, 'application', 1562296244.6214, '[frontend][/v1/user/view]', '40');
INSERT INTO `inv_log` VALUES (1681, 1, 'application', 1562296246.5662, '[frontend][/v1/incarnation/index]', '40');
INSERT INTO `inv_log` VALUES (1682, 1, 'application', 1562296291.6299, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1683, 1, 'application', 1562296292.301, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1684, 1, 'application', 1562296292.4783, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1685, 1, 'application', 1562296292.9676, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1686, 1, 'application', 1562296537.9776, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1687, 1, 'application', 1562296547.9208, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1688, 1, 'application', 1562296548.6968, '[frontend][/v1/user/view]', '40');
INSERT INTO `inv_log` VALUES (1689, 1, 'application', 1562296550.2979, '[frontend][/v1/incarnation/index]', '40');
INSERT INTO `inv_log` VALUES (1690, 1, 'application', 1562296552.3787, '[frontend][/v1/incarnation/grades]', '40');
INSERT INTO `inv_log` VALUES (1691, 1, 'Error', 1562296552.4299, '[frontend][/v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'v1/incarnation/...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1692, 1, 'application', 1562302534.4547, '[frontend][/v1/user/view]', '40');
INSERT INTO `inv_log` VALUES (1693, 1, 'application', 1562302535.0233, '[frontend][/v1/incarnation/index]', '40');
INSERT INTO `inv_log` VALUES (1694, 1, 'application', 1562302545.8903, '[frontend][/v1/user/view]', '40');
INSERT INTO `inv_log` VALUES (1695, 1, 'application', 1562302546.3467, '[frontend][/v1/incarnation/index]', '40');
INSERT INTO `inv_log` VALUES (1696, 1, 'application', 1562302622.4133, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1697, 1, 'application', 1562302623.162, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1698, 1, 'application', 1562302623.455, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1699, 1, 'application', 1562302623.6477, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1700, 1, 'application', 1562302649.4153, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1701, 1, 'application', 1562302649.8185, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1702, 1, 'application', 1562302650.1502, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1703, 1, 'application', 1562302676.4509, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1704, 1, 'application', 1562302677.8333, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1705, 1, 'application', 1562302834.7546, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1706, 1, 'application', 1562302835.5076, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1707, 1, 'application', 1562302835.7012, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1708, 1, 'application', 1562302835.8044, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1709, 1, 'application', 1562302912.3649, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1710, 1, 'application', 1562302912.5455, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1711, 1, 'application', 1562302912.9907, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1712, 1, 'application', 1562302948.7923, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1713, 1, 'application', 1562302949.0486, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1714, 1, 'application', 1562302949.7112, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1715, 1, 'application', 1562302984.2091, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1716, 1, 'application', 1562302984.5288, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1717, 1, 'application', 1562302985.6254, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1718, 1, 'application', 1562303003.4087, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1719, 1, 'application', 1562303003.6008, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1720, 1, 'application', 1562303003.9779, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1721, 1, 'application', 1562303010.5652, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1722, 1, 'application', 1562303010.7086, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1723, 1, 'application', 1562303011.0322, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1724, 1, 'application', 1562303016.5764, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1725, 1, 'application', 1562303016.754, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1726, 1, 'application', 1562303017.2134, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1727, 1, 'application', 1562303018.5632, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1728, 1, 'application', 1562303018.7061, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1729, 1, 'application', 1562303019.0587, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1730, 1, 'application', 1562303024.8698, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1731, 1, 'application', 1562303024.9458, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1732, 1, 'application', 1562303026.1075, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1733, 1, 'application', 1562303027.2821, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1734, 1, 'application', 1562303027.4103, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1735, 1, 'application', 1562303027.7535, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1736, 1, 'application', 1562303033.2512, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1737, 1, 'application', 1562303033.3747, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1738, 1, 'application', 1562303033.7853, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1739, 1, 'application', 1562303062.3133, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1740, 1, 'application', 1562303062.6329, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1741, 1, 'application', 1562303063.2579, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1742, 1, 'application', 1562303085.293, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1743, 1, 'application', 1562303085.5564, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1744, 1, 'application', 1562303086.4479, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1745, 1, 'application', 1562303115.811, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1746, 1, 'application', 1562303116.0944, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1747, 1, 'application', 1562303116.5789, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1748, 1, 'application', 1562303164.381, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1749, 1, 'application', 1562303164.6822, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1750, 1, 'application', 1562303165.0136, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1751, 1, 'application', 1562303165.04, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1752, 1, 'application', 1562303171.8448, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1753, 1, 'application', 1562303172.3194, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1754, 1, 'application', 1562303172.6292, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1755, 1, 'application', 1562303195.8132, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1756, 1, 'application', 1562303195.9685, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1757, 1, 'application', 1562303196.4264, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1758, 1, 'application', 1562303215.0848, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1759, 1, 'application', 1562303215.2028, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1760, 1, 'application', 1562303215.5575, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1761, 1, 'application', 1562303231.62, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1762, 1, 'application', 1562303231.7892, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1763, 1, 'application', 1562303232.1086, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1764, 1, 'application', 1562303237.043, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1765, 1, 'application', 1562303237.7851, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1766, 1, 'application', 1562303237.9151, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1767, 1, 'application', 1562303238.5829, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1768, 1, 'application', 1562303254.3474, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1769, 1, 'application', 1562303254.4873, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1770, 1, 'application', 1562303254.9175, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1771, 1, 'application', 1562303258.3559, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1772, 1, 'application', 1562303259.9861, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1773, 1, 'application', 1562303262.2226, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1774, 1, 'application', 1562303262.3095, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1775, 1, 'application', 1562303262.6535, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1776, 1, 'application', 1562303262.7447, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1777, 1, 'application', 1562303275.091, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1778, 1, 'application', 1562303275.221, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1779, 1, 'application', 1562303275.6337, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1780, 1, 'application', 1562303323.1237, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1781, 1, 'application', 1562303323.2326, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1782, 1, 'application', 1562303323.6276, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1783, 1, 'application', 1562303352.6143, '[frontend][//v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1784, 1, 'application', 1562303356.1746, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1785, 1, 'application', 1562303356.3548, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1786, 1, 'application', 1562303356.7597, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1787, 1, 'application', 1562303359.5031, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1788, 1, 'application', 1562303365.2129, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1789, 1, 'application', 1562303365.838, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1790, 1, 'application', 1562303365.915, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1791, 1, 'application', 1562303366.005, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1792, 1, 'application', 1562303367.9118, '[frontend][//v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1793, 1, 'application', 1562303368.0064, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1794, 1, 'application', 1562303373.3443, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1795, 1, 'application', 1562303373.7033, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1796, 1, 'application', 1562303374.0116, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1797, 1, 'application', 1562303398.247, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1798, 1, 'application', 1562303398.8551, '[frontend][//v1/user/view]', '42');
INSERT INTO `inv_log` VALUES (1799, 1, 'application', 1562303398.9383, '[frontend][//v1/incarnation/index]', '42');
INSERT INTO `inv_log` VALUES (1800, 1, 'application', 1562303433.0187, '[frontend][//v1/incarnation/grades]', '42');
INSERT INTO `inv_log` VALUES (1801, 1, 'Error', 1562303433.1549, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1802, 1, 'application', 1562303469.3855, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1803, 1, 'application', 1562303474.7832, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1804, 1, 'application', 1562303475.4091, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1805, 1, 'application', 1562303475.4866, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1806, 1, 'application', 1562303475.5792, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1807, 1, 'application', 1562303477.7664, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1808, 2, 'yii\\caching\\FileCache::setValue', 1562303478.3012, '[frontend][/v1/user/login]', 'Unable to write cache file \'/usr/local/www/investigation/api/runtime/cache/b5/b5fea49cfa0ec65295abf80d227e4108.bin\': file_put_contents(/usr/local/www/investigation/api/runtime/cache/b5/b5fea49cfa0ec65295abf80d227e4108.bin): failed to open stream: Permission denied');
INSERT INTO `inv_log` VALUES (1809, 1, 'application', 1562303478.5117, '[frontend][/v1/user/view]', 'false');
INSERT INTO `inv_log` VALUES (1810, 1, 'application', 1562303478.7442, '[frontend][/v1/user/index]', 'false');
INSERT INTO `inv_log` VALUES (1811, 1, 'application', 1562303491.9448, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1812, 1, 'application', 1562303492.6259, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1813, 1, 'application', 1562303493.0675, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1814, 1, 'application', 1562303493.1012, '[frontend][//v1/user/delete]', '35');
INSERT INTO `inv_log` VALUES (1815, 1, 'application', 1562303493.215, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1816, 1, 'application', 1562303524.2294, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1817, 1, 'application', 1562303524.9033, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1818, 1, 'application', 1562303525.3073, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1819, 1, 'application', 1562303537.0195, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1820, 1, 'application', 1562303537.9564, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1821, 1, 'application', 1562303538.6525, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1822, 1, 'application', 1562303540.391, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1823, 1, 'application', 1562303541.0026, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1824, 1, 'application', 1562303541.0874, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1825, 1, 'application', 1562303541.2168, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1826, 1, 'application', 1562303566.603, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1827, 1, 'application', 1562303566.8736, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1828, 1, 'application', 1562303569.3527, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1829, 1, 'application', 1562303569.5255, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1830, 1, 'application', 1562303580.4897, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1831, 1, 'application', 1562303581.1995, '[frontend][/v1/user/view]', '43');
INSERT INTO `inv_log` VALUES (1832, 1, 'application', 1562303582.0805, '[frontend][/v1/incarnation/index]', '43');
INSERT INTO `inv_log` VALUES (1833, 1, 'application', 1562303587.9306, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1834, 1, 'application', 1562303592.2643, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1835, 1, 'application', 1562303592.9438, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1836, 1, 'application', 1562303593.2078, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1837, 1, 'application', 1562303593.8582, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1838, 1, 'application', 1562303621.4047, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1839, 1, 'application', 1562303653.4934, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1840, 1, 'application', 1562303660.9319, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1841, 1, 'application', 1562303670.1721, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1842, 1, 'application', 1562303675.9557, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (1843, 1, 'application', 1562303684.2106, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1844, 1, 'application', 1562303707.6447, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1845, 1, 'application', 1562303710.9152, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1846, 1, 'application', 1562303716.8217, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1847, 1, 'application', 1562303723.6019, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1848, 1, 'application', 1562303724.3673, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1849, 1, 'application', 1562303724.6294, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1850, 1, 'application', 1562303725.0657, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1851, 1, 'application', 1562303743.8077, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1852, 1, 'application', 1562303744.2186, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1853, 1, 'application', 1562303744.492, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1854, 1, 'application', 1562303776.6942, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1855, 1, 'application', 1562303776.9285, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1856, 1, 'application', 1562303777.3434, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1857, 1, 'application', 1562303777.6435, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1858, 1, 'application', 1562303778.8204, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1859, 1, 'application', 1562303780.485, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1860, 1, 'application', 1562303780.7515, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1861, 1, 'application', 1562303781.069, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1862, 1, 'application', 1562303799.0427, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1863, 1, 'application', 1562303799.4499, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1864, 1, 'application', 1562303799.7782, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1865, 1, 'application', 1562303837.1054, '[frontend][/v1/user/delete]', '35');
INSERT INTO `inv_log` VALUES (1866, 1, 'application', 1562303837.5629, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1867, 1, 'application', 1562303891.1967, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1868, 1, 'application', 1562303959.5466, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1869, 1, 'application', 1562303963.0803, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1870, 1, 'application', 1562304007.0687, '[frontend][/v1/user/register]', 'false');
INSERT INTO `inv_log` VALUES (1871, 1, 'application', 1562304013.0967, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1872, 1, 'application', 1562304013.8621, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1873, 1, 'application', 1562304014.0846, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1874, 1, 'application', 1562304014.5373, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1875, 1, 'application', 1562304017.8851, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1876, 1, 'application', 1562304035.2844, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1877, 1, 'application', 1562304095.8647, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1878, 1, 'application', 1562304096.0534, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1879, 1, 'application', 1562304107.8579, '[frontend][/v1/user/audit]', '35');
INSERT INTO `inv_log` VALUES (1880, 1, 'application', 1562304108.042, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1881, 1, 'application', 1562306660.7156, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1882, 1, 'application', 1562306661.6005, '[frontend][//v1/user/view]', '46');
INSERT INTO `inv_log` VALUES (1883, 1, 'application', 1562306661.7318, '[frontend][//v1/incarnation/index]', '46');
INSERT INTO `inv_log` VALUES (1884, 1, 'application', 1562306663.6782, '[frontend][//v1/incarnation/grades]', '46');
INSERT INTO `inv_log` VALUES (1885, 1, 'Error', 1562306663.7208, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1886, 1, 'application', 1562306677.5183, '[frontend][//v1/incarnation/grades]', '46');
INSERT INTO `inv_log` VALUES (1887, 1, 'Error', 1562306677.5697, '[frontend][//v1/incarnation/grades]', 'Error: Class \'common\\components\\swoole\\Client\' not found in /usr/local/www/investigation/api/modules/v1/actions/incarnation/GradesAction.php:59\nStack trace:\n#0 [internal function]: api\\modules\\v1\\actions\\incarnation\\GradesAction->run()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'grades\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/incarnation...\', Array)\n#5 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#6 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#7 {main}');
INSERT INTO `inv_log` VALUES (1888, 1, 'application', 1562309260.0932, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1889, 1, 'application', 1562309260.8619, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1890, 1, 'application', 1562309261.0918, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1891, 1, 'application', 1562309261.2857, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1892, 1, 'application', 1562309273.4197, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1893, 1, 'application', 1562309274.1031, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1894, 1, 'application', 1562309274.5467, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1895, 1, 'application', 1562309275.7045, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1896, 1, 'application', 1562309280.2361, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1897, 1, 'application', 1562309280.6171, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1898, 1, 'application', 1562309281.964, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1899, 1, 'application', 1562309331.0233, '[frontend][/v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (1900, 1, 'application', 1562309331.4824, '[frontend][/v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (1901, 1, 'application', 1562309332.1415, '[frontend][/v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (1902, 1, 'application', 1562309336.6632, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1903, 1, 'application', 1562309337.3372, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1904, 1, 'application', 1562309337.5932, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1905, 1, 'application', 1562309337.716, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1906, 1, 'application', 1562309341.6847, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1907, 1, 'application', 1562309341.9792, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1908, 1, 'application', 1562309382.6811, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1909, 1, 'application', 1562309383.1333, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1910, 1, 'application', 1562309398.8623, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1911, 1, 'application', 1562309399.5166, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1912, 1, 'application', 1562309433.7525, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1913, 1, 'application', 1562309434.2564, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1914, 1, 'application', 1562309443.5688, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1915, 1, 'application', 1562309444.1175, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1916, 1, 'application', 1562309558.0937, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1917, 1, 'application', 1562309558.3621, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1918, 1, 'application', 1562309564.8722, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1919, 1, 'application', 1562309565.2392, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1920, 1, 'application', 1562309819.8995, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1921, 1, 'application', 1562309820.8816, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1922, 1, 'application', 1562309836.6684, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1923, 1, 'application', 1562309840.4552, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1924, 1, 'application', 1562309841.1775, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1925, 1, 'application', 1562309850.8435, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1926, 1, 'application', 1562309851.1279, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1927, 1, 'application', 1562309959.2975, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1928, 1, 'application', 1562309959.6205, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1929, 1, 'application', 1562310315.9666, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1930, 1, 'application', 1562310316.7735, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1931, 1, 'application', 1562310331.0191, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1932, 1, 'application', 1562310334.5997, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1933, 1, 'application', 1562310335.5807, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1934, 1, 'application', 1562310374.1971, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1935, 1, 'application', 1562310374.4908, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1936, 1, 'application', 1562310395.078, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1937, 1, 'application', 1562310395.3381, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1938, 1, 'application', 1562310401.9928, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1939, 1, 'application', 1562310402.3209, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1940, 1, 'application', 1562310654.5584, '[frontend][/v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (1941, 1, 'application', 1562310655.3122, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1942, 1, 'application', 1562310655.679, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1943, 1, 'application', 1562310655.8604, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1944, 1, 'application', 1562310872.2915, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1945, 1, 'application', 1562310872.5285, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1946, 1, 'application', 1562310872.8498, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1947, 1, 'application', 1562310880.7573, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1948, 1, 'application', 1562310880.9671, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1949, 1, 'application', 1562310894.9454, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1950, 1, 'application', 1562310895.7688, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1951, 1, 'application', 1562310896.0888, '[frontend][/v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (1952, 1, 'application', 1562310920.1756, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1953, 1, 'application', 1562310920.4071, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1954, 1, 'application', 1562310949.4764, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1955, 1, 'application', 1562310949.6954, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1956, 1, 'application', 1562311374.5408, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1957, 1, 'application', 1562311375.134, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1958, 1, 'application', 1562311785.4251, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1959, 1, 'application', 1562311786.5845, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1960, 1, 'application', 1562311842.64, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1961, 1, 'application', 1562311843.652, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1962, 1, 'application', 1562311875.184, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1963, 1, 'application', 1562311875.391, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1964, 1, 'application', 1562311893.539, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1965, 1, 'application', 1562311894.3332, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1966, 1, 'application', 1562311917.9438, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1967, 1, 'application', 1562311918.2596, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1968, 1, 'application', 1562312037.0277, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1969, 1, 'application', 1562312037.4904, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1970, 1, 'application', 1562312121.2206, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1971, 1, 'application', 1562312121.7312, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1972, 1, 'application', 1562312126.8121, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1973, 1, 'application', 1562312127.414, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1974, 1, 'application', 1562312138.2681, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1975, 1, 'application', 1562312141.8004, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1976, 1, 'application', 1562312142.5906, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1977, 1, 'application', 1562312202.748, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1978, 1, 'application', 1562312203.1279, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1979, 1, 'application', 1562312266.2973, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1980, 1, 'application', 1562312266.9099, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1981, 1, 'application', 1562312299.2161, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1982, 1, 'application', 1562312299.4856, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1983, 1, 'application', 1562312321.6835, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1984, 1, 'application', 1562312321.9585, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1985, 1, 'application', 1562312438.3671, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1986, 1, 'application', 1562312438.6192, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1987, 1, 'application', 1562312549.9892, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1988, 1, 'application', 1562312550.4715, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1989, 1, 'application', 1562312587.0453, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1990, 1, 'application', 1562312587.2659, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1991, 1, 'application', 1562312593.7637, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1992, 1, 'application', 1562312594.3066, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1993, 1, 'application', 1562312603.2079, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1994, 1, 'application', 1562312603.6034, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1995, 1, 'application', 1562312608.6946, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1996, 1, 'application', 1562312609.3446, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1997, 1, 'application', 1562312618.3493, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (1998, 1, 'application', 1562312618.6439, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (1999, 1, 'application', 1562312623.2817, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2000, 1, 'application', 1562312623.8576, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2001, 1, 'application', 1562312852.2464, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2002, 1, 'application', 1562312852.5502, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2003, 1, 'application', 1562313125.8746, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2004, 1, 'application', 1562313126.0717, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2005, 1, 'application', 1562313132.4982, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2006, 1, 'application', 1562313133.08, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2007, 1, 'application', 1562314812.6076, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2008, 1, 'application', 1562314813.4282, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2009, 1, 'application', 1562314819.261, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2010, 1, 'application', 1562314820.0347, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2011, 1, 'application', 1562314830.2215, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2012, 1, 'application', 1562314833.2248, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2013, 1, 'application', 1562314833.937, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2014, 1, 'application', 1562318245.5718, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2015, 1, 'application', 1562318245.9237, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2016, 1, 'application', 1562318272.6844, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2017, 1, 'application', 1562318273.4198, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2018, 1, 'application', 1562318306.3704, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2019, 1, 'application', 1562318307.0933, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2020, 1, 'application', 1562318340.8642, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2021, 1, 'application', 1562318341.0612, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2022, 1, 'application', 1562318347.0574, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2023, 1, 'application', 1562318347.6568, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2024, 1, 'application', 1562318359.6999, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2025, 1, 'application', 1562318360.2642, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2026, 1, 'application', 1562318412.1934, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2027, 1, 'application', 1562318412.5987, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2028, 1, 'application', 1562318540.9234, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2029, 1, 'application', 1562318541.1898, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2030, 1, 'application', 1562318548.4699, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2031, 1, 'application', 1562318549.2921, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2032, 1, 'application', 1562319016.8536, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2033, 1, 'application', 1562319020.9579, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2034, 1, 'application', 1562319021.7492, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2035, 1, 'application', 1562319337.4888, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2036, 1, 'application', 1562319342.1833, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2037, 1, 'application', 1562319342.8307, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2038, 1, 'application', 1562319386.3218, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2039, 1, 'application', 1562319394.509, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2040, 1, 'application', 1562319395.045, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2041, 1, 'application', 1562319395.7112, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2042, 1, 'application', 1562319396.595, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2043, 1, 'application', 1562319504.8333, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2044, 1, 'application', 1562319508.4848, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2045, 1, 'application', 1562319509.2076, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2046, 1, 'application', 1562319734.7543, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2047, 1, 'application', 1562319738.8316, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2048, 1, 'application', 1562319739.734, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2049, 1, 'application', 1562319770.6898, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2050, 1, 'application', 1562319773.8123, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2051, 1, 'application', 1562319774.8456, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2052, 1, 'application', 1562322786.7446, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2053, 1, 'application', 1562322791.4174, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2054, 1, 'application', 1562322792.1702, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2055, 1, 'application', 1562323049.5598, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2056, 1, 'application', 1562323053.5436, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2057, 1, 'application', 1562323054.7911, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2058, 1, 'application', 1562323169.2127, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2059, 1, 'application', 1562323169.75, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2060, 1, 'application', 1562323174.3988, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2061, 1, 'application', 1562323175.4325, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2062, 1, 'application', 1562323196.1044, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2063, 1, 'application', 1562323196.6312, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2064, 1, 'application', 1562323202.2915, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2065, 1, 'application', 1562323203.5722, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2066, 1, 'application', 1562323234.0656, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2067, 1, 'application', 1562323234.4363, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2068, 1, 'application', 1562323236.7396, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (2069, 1, 'application', 1562323237.6077, '[frontend][//v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2070, 1, 'application', 1562323237.8579, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2071, 1, 'application', 1562323238.1396, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (2072, 1, 'application', 1562323248.2484, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2073, 1, 'application', 1562323252.0535, '[frontend][//v1/advertisement/index]', '35');
INSERT INTO `inv_log` VALUES (2074, 1, 'application', 1562323266.7827, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2075, 1, 'application', 1562323267.2408, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2076, 1, 'application', 1562323272.9414, '[frontend][//v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2077, 1, 'application', 1562323274.1288, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2078, 1, 'application', 1562323274.9332, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2079, 1, 'application', 1562323281.4454, '[frontend][//v1/user/index]', '35');
INSERT INTO `inv_log` VALUES (2080, 1, 'application', 1562323305.1479, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (2081, 1, 'application', 1562323305.7976, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (2082, 1, 'application', 1562323306.2366, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (2083, 1, 'application', 1562323307.3952, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (2084, 1, 'application', 1562323307.5124, '[frontend][//v1/question/index]', 'yii\\base\\InvalidConfigException: The table does not exist: {{%question}} in /usr/local/www/investigation/vendor/yiisoft/yii2/db/ActiveRecord.php:387\nStack trace:\n#0 /usr/local/www/investigation/vendor/yiisoft/yii2/db/ActiveRecord.php(418): yii\\db\\ActiveRecord::getTableSchema()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/data/ActiveDataProvider.php(183): yii\\db\\ActiveRecord->attributes()\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Component.php(180): yii\\data\\ActiveDataProvider->setSort(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/BaseYii.php(546): yii\\base\\Component->__set(\'sort\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure(Object(yii\\data\\ActiveDataProvider), Array)\n#5 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#6 /usr/local/www/investigation/vendor/yiisoft/yii2/di/Container.php(383): ReflectionClass->newInstanceArgs(Array)\n#7 /usr/local/www/investigation/vendor/yiisoft/yii2/di/Container.php(156): yii\\di\\Container->build(\'yii\\\\data\\\\Active...\', Array, Array)\n#8 /usr/local/www/investigation/vendor/yiisoft/yii2/BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\data\\\\Active...\', Array, Array)\n#9 /usr/local/www/investigation/api/modules/v1/models/Question.php(40): yii\\BaseYii::createObject(Array)\n#10 [internal function]: api\\modules\\v1\\models\\Question::getList(Array)\n#11 /usr/local/www/investigation/api/modules/v1/actions/question/IndexAction.php(25): call_user_func_array(Array, Array)\n#12 [internal function]: api\\modules\\v1\\actions\\question\\IndexAction->run()\n#13 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#14 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#15 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#16 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/question/in...\', Array)\n#17 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#18 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#19 {main}');
INSERT INTO `inv_log` VALUES (2085, 1, 'application', 1562323381.1872, '[frontend][//v1/user/login]', 'false');
INSERT INTO `inv_log` VALUES (2086, 1, 'application', 1562323381.9762, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (2087, 1, 'application', 1562323382.149, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (2088, 1, 'application', 1562323383.1936, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (2089, 1, 'application', 1562323383.2046, '[frontend][//v1/question/index]', 'yii\\base\\InvalidConfigException: The table does not exist: {{%question}} in /usr/local/www/investigation/vendor/yiisoft/yii2/db/ActiveRecord.php:387\nStack trace:\n#0 /usr/local/www/investigation/vendor/yiisoft/yii2/db/ActiveRecord.php(418): yii\\db\\ActiveRecord::getTableSchema()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/data/ActiveDataProvider.php(183): yii\\db\\ActiveRecord->attributes()\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Component.php(180): yii\\data\\ActiveDataProvider->setSort(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/BaseYii.php(546): yii\\base\\Component->__set(\'sort\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure(Object(yii\\data\\ActiveDataProvider), Array)\n#5 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#6 /usr/local/www/investigation/vendor/yiisoft/yii2/di/Container.php(383): ReflectionClass->newInstanceArgs(Array)\n#7 /usr/local/www/investigation/vendor/yiisoft/yii2/di/Container.php(156): yii\\di\\Container->build(\'yii\\\\data\\\\Active...\', Array, Array)\n#8 /usr/local/www/investigation/vendor/yiisoft/yii2/BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\data\\\\Active...\', Array, Array)\n#9 /usr/local/www/investigation/api/modules/v1/models/Question.php(40): yii\\BaseYii::createObject(Array)\n#10 [internal function]: api\\modules\\v1\\models\\Question::getList(Array)\n#11 /usr/local/www/investigation/api/modules/v1/actions/question/IndexAction.php(25): call_user_func_array(Array, Array)\n#12 [internal function]: api\\modules\\v1\\actions\\question\\IndexAction->run()\n#13 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#14 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#15 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#16 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/question/in...\', Array)\n#17 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#18 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#19 {main}');
INSERT INTO `inv_log` VALUES (2090, 1, 'application', 1562323397.9207, '[frontend][//v1/user/view]', '37');
INSERT INTO `inv_log` VALUES (2091, 1, 'application', 1562323398.0663, '[frontend][//v1/incarnation/index]', '37');
INSERT INTO `inv_log` VALUES (2092, 1, 'application', 1562323399.1283, '[frontend][//v1/question/index]', '37');
INSERT INTO `inv_log` VALUES (2093, 1, 'application', 1562323399.1386, '[frontend][//v1/question/index]', 'yii\\base\\InvalidConfigException: The table does not exist: {{%question}} in /usr/local/www/investigation/vendor/yiisoft/yii2/db/ActiveRecord.php:387\nStack trace:\n#0 /usr/local/www/investigation/vendor/yiisoft/yii2/db/ActiveRecord.php(418): yii\\db\\ActiveRecord::getTableSchema()\n#1 /usr/local/www/investigation/vendor/yiisoft/yii2/data/ActiveDataProvider.php(183): yii\\db\\ActiveRecord->attributes()\n#2 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Component.php(180): yii\\data\\ActiveDataProvider->setSort(Array)\n#3 /usr/local/www/investigation/vendor/yiisoft/yii2/BaseYii.php(546): yii\\base\\Component->__set(\'sort\', Array)\n#4 /usr/local/www/investigation/vendor/yiisoft/yii2/base/BaseObject.php(107): yii\\BaseYii::configure(Object(yii\\data\\ActiveDataProvider), Array)\n#5 [internal function]: yii\\base\\BaseObject->__construct(Array)\n#6 /usr/local/www/investigation/vendor/yiisoft/yii2/di/Container.php(383): ReflectionClass->newInstanceArgs(Array)\n#7 /usr/local/www/investigation/vendor/yiisoft/yii2/di/Container.php(156): yii\\di\\Container->build(\'yii\\\\data\\\\Active...\', Array, Array)\n#8 /usr/local/www/investigation/vendor/yiisoft/yii2/BaseYii.php(349): yii\\di\\Container->get(\'yii\\\\data\\\\Active...\', Array, Array)\n#9 /usr/local/www/investigation/api/modules/v1/models/Question.php(40): yii\\BaseYii::createObject(Array)\n#10 [internal function]: api\\modules\\v1\\models\\Question::getList(Array)\n#11 /usr/local/www/investigation/api/modules/v1/actions/question/IndexAction.php(25): call_user_func_array(Array, Array)\n#12 [internal function]: api\\modules\\v1\\actions\\question\\IndexAction->run()\n#13 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Action.php(94): call_user_func_array(Array, Array)\n#14 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Controller.php(157): yii\\base\\Action->runWithParams(Array)\n#15 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Module.php(528): yii\\base\\Controller->runAction(\'index\', Array)\n#16 /usr/local/www/investigation/vendor/yiisoft/yii2/web/Application.php(103): yii\\base\\Module->runAction(\'/v1/question/in...\', Array)\n#17 /usr/local/www/investigation/vendor/yiisoft/yii2/base/Application.php(386): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#18 /usr/local/www/investigation/api/web/index.php(22): yii\\base\\Application->run()\n#19 {main}');
INSERT INTO `inv_log` VALUES (2094, 1, 'application', 1562323408.8509, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2095, 1, 'application', 1562323409.085, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2096, 1, 'application', 1562323436.1342, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2097, 1, 'application', 1562323436.6957, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2098, 1, 'application', 1562323443.3615, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2099, 1, 'application', 1562323444.0988, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2100, 1, 'application', 1562323477.5797, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2101, 1, 'application', 1562323478.5447, '[frontend][/v1/incarnation/index]', '35');
INSERT INTO `inv_log` VALUES (2102, 1, 'application', 1562323486.5932, '[frontend][/v1/user/view]', '35');
INSERT INTO `inv_log` VALUES (2103, 1, 'application', 1562323487.6762, '[frontend][/v1/incarnation/index]', '35');

-- ----------------------------
-- Table structure for inv_realistic_ego
-- ----------------------------
DROP TABLE IF EXISTS `inv_realistic_ego`;
CREATE TABLE `inv_realistic_ego`  (
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
INSERT INTO `inv_type` VALUES (4, 'xuchao', 'asdadasd');

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
  `step` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户问卷步骤',
  `round` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户属于第几轮调查',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inv_user
-- ----------------------------
INSERT INTO `inv_user` VALUES (35, 'xuzhou', '$2y$13$fWYl0DmYLK82egnLrrNHYuPR7RNXmn0kngkKEB36EKB3tWo0i.4CS', 'tWoYBNq7NHgPyDbY944yrOQDQTCGCMmf', '13795699481', '123456@qq.com', 'male', 'aa', 18, 'admin', '1562224441', '1562224441', '1562323487', '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (36, 'xuzhouPlus', '$2y$13$PC41KJoy.zzv/E.MYwaxFOKFAHF1.F9fY3g6Fe3RjIUSj3KgqT0g2', 'Xv7eSdBV0QJzysEllSa_HocCd0yLFN0Y', '13795699482', '1234567@qq.com', 'male', 'bb', 19, 'user', '1562224559', '1562256667', NULL, '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (37, 'xuchao', '$2y$13$wX1WNCNg0v1tuNZ5nHrVCetA2aXp8cAlrUUnndi/Lx0q4C8X3paBa', 'iQroDvZ-usr3-X1m_kNM9JmZej-cMfTl', '13795699483', '12345678@qq.com', 'male', 'ccc', 18, 'user', '1562224600', '1562294833', '1562325927', '3', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (38, 'xuchaoPlus', '$2y$13$pQmEZGyvluV15VT1VuoeIepv7GGSNnOZgtQS9f6eGnOZ86.iDYXO.', 'KkCaXVzUVV26OrpE_Ux6XHUQ3sTSyhNL', '13795699484', '123456789@qq.com', 'male', 'ddd', 18, 'user', '1562224648', '1562305869', '1562306223', '2', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (39, '卡戴珊', '$2y$13$bjMpTyYSnpeMeXDl4tVt3.p1FIIDbnX/./97GlJ9IBGAlKNixqdw6', 'MN5hllhJJko2ji3pzL-srCMuYYl8ZZlI', '13795699485', '1234567891@qq.com', 'female', 'eee', 18, 'user', '1562226496', '1562226496', '1562254307', '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (40, '科比', '$2y$13$UyfgJdJMG.2B9/IbQIjnCO8UZReiOZnyAxDdmCLkeO69VsEoHJ0Iq', '3iJEFA8gbUnV_jzQFpJdkfu60TOSguqz', '13795699234', '102386@qq.com', 'male', '洛杉矶湖人', 21, 'user', '1562296214', '1562296236', '1562302546', '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (41, '麦迪', '$2y$13$tDeCltd12U05/vmtHLxVwO5D57Hyh0lMcHfvl7hvOCsAlrUoxNe8i', 'krDvk0xvoJ0Zxae1AAPsw6Pn9lDb5DqV', '13795699433', '10238409@qq.com', 'male', '休斯顿', 21, 'user', '1562296538', '1562303569', NULL, '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (43, '张学友', '$2y$13$XCV2grEoVW4fsnjxDWseEOfhr/VwHi0DNIuusgSHgfJ0Q8ZuCdlxK', 'RxeSeTQ_wxo84LMeFyMqAZaRyWHfA4aN', '13795699888', '1023841111@qq.com', 'male', '冷月夜', 18, 'user', '1562303469', '1562306258', '1562303582', '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (45, '卡哇伊', '$2y$13$7m1lDE.lRyAi11SrtrHPP.CDqBsb9mcuVIoKQGbbGzf11qosx2A3O', '-sx4wG-AAmV-ylhyTjiwR7KoF4-1OUdB', '13766699480', '1023846567@qq.com', 'male', '多伦多猛龙', 26, 'user', '1562303891', '1562306255', NULL, '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (46, '奥尼尔', '$2y$13$BfrI/tNkZPPxQtFzimdoFOl9c5vvmpdKRnpYPhCQaUfdesbsNScgG', 'vBwqnZZ5fF8v4JFDYsv1ATwPuXzZ7_71', '13795688880', '984801268@qq.com', 'male', '洛杉矶湖人', 21, 'user', '1562303963', '1562306252', '1562306677', '1', '1', NULL, NULL);
INSERT INTO `inv_user` VALUES (47, '司机', '$2y$13$lUVicb6HH003RxvcfOL81.6HEWSBLAS0e5NUdY1fz2tqo.78tUFrW', 'EbaNVnHObBbvqWjdP6rWzu-SHC5J1sVl', '13795699333', '984801269@qq.com', 'male', '达拉斯独行侠', 21, 'user', '1562304007', '1562306358', '1562306380', '3', '1', NULL, NULL);

-- ----------------------------
-- Table structure for inv_user_incarnation_grades
-- ----------------------------
DROP TABLE IF EXISTS `inv_user_incarnation_grades`;
CREATE TABLE `inv_user_incarnation_grades`  (
  `user_id` int(11) NOT NULL,
  `incarantion_id` int(11) NOT NULL,
  `grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`user_id`, `incarantion_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for inv_virtual_ego
-- ----------------------------
DROP TABLE IF EXISTS `inv_virtual_ego`;
CREATE TABLE `inv_virtual_ego`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟自我认知id',
  `incarnation_id` int(11) NULL DEFAULT NULL COMMENT '化身id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `question_id` int(11) NULL DEFAULT NULL COMMENT '问题id',
  `option_id` int(11) NULL DEFAULT NULL COMMENT '选项id',
  `grades` int(11) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

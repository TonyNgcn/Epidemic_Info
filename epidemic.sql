/*
 Navicat MySQL Data Transfer

 Source Server         : New_db_2020
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : epidemic

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 11/03/2020 16:50:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for epidemics
-- ----------------------------
DROP TABLE IF EXISTS `epidemics`;
CREATE TABLE `epidemics`  (
  `serial_id` int(0) NOT NULL AUTO_INCREMENT,
  `province_id` int(0) NULL DEFAULT NULL,
  `data_year` smallint(0) NULL DEFAULT NULL,
  `data_month` smallint(0) NULL DEFAULT NULL,
  `data_day` smallint(0) NULL DEFAULT NULL,
  `affirmed` int(0) NULL DEFAULT NULL,
  `suspected` int(0) NULL DEFAULT NULL,
  `isolated` int(0) NULL DEFAULT NULL,
  `dead` int(0) NULL DEFAULT NULL,
  `cured` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `input_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`serial_id`) USING BTREE,
  INDEX `FK_epid_prov`(`province_id`) USING BTREE,
  INDEX `FK_epid_user`(`user_id`) USING BTREE,
  CONSTRAINT `FK_epid_prov` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_epid_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epidemics
-- ----------------------------
INSERT INTO `epidemics` VALUES (121, 11, 2020, 3, 11, 435, 0, 0, 8, 326, 2, '2020-03-11 15:14:00');
INSERT INTO `epidemics` VALUES (122, 12, 2020, 3, 11, 136, 0, 0, 3, 131, 2, '2020-03-11 15:14:00');
INSERT INTO `epidemics` VALUES (123, 13, 2020, 3, 11, 318, 0, 0, 6, 307, 2, '2020-03-11 15:14:00');
INSERT INTO `epidemics` VALUES (124, 14, 2020, 3, 11, 133, 0, 0, 0, 131, 2, '2020-03-11 15:14:00');
INSERT INTO `epidemics` VALUES (125, 15, 2020, 3, 11, 75, 0, 0, 1, 71, 2, '2020-03-11 15:14:00');
INSERT INTO `epidemics` VALUES (126, 21, 2020, 3, 11, 125, 0, 0, 1, 111, 2, '2020-03-11 15:14:00');
INSERT INTO `epidemics` VALUES (127, 22, 2020, 3, 11, 93, 0, 0, 1, 91, 2, '2020-03-11 15:15:57');
INSERT INTO `epidemics` VALUES (128, 23, 2020, 3, 11, 482, 0, 0, 13, 435, 2, '2020-03-11 15:15:57');
INSERT INTO `epidemics` VALUES (129, 31, 2020, 3, 11, 344, 0, 0, 3, 320, 2, '2020-03-11 15:15:57');
INSERT INTO `epidemics` VALUES (130, 32, 2020, 3, 11, 631, 0, 0, 0, 627, 2, '2020-03-11 15:15:57');
INSERT INTO `epidemics` VALUES (131, 33, 2020, 3, 11, 1215, 0, 0, 1, 1193, 2, '2020-03-11 15:15:58');
INSERT INTO `epidemics` VALUES (132, 34, 2020, 3, 11, 990, 0, 0, 6, 984, 2, '2020-03-11 15:15:58');
INSERT INTO `epidemics` VALUES (133, 35, 2020, 3, 11, 296, 0, 0, 1, 295, 2, '2020-03-11 15:17:53');
INSERT INTO `epidemics` VALUES (134, 36, 2020, 3, 11, 935, 0, 0, 1, 932, 2, '2020-03-11 15:17:53');
INSERT INTO `epidemics` VALUES (135, 37, 2020, 3, 11, 759, 0, 0, 6, 721, 2, '2020-03-11 15:17:53');
INSERT INTO `epidemics` VALUES (136, 41, 2020, 3, 11, 1272, 0, 0, 22, 1249, 2, '2020-03-11 15:17:53');
INSERT INTO `epidemics` VALUES (137, 42, 2020, 3, 11, 67773, 0, 0, 3046, 49062, 2, '2020-03-11 15:17:53');
INSERT INTO `epidemics` VALUES (138, 43, 2020, 3, 11, 1018, 0, 0, 4, 995, 2, '2020-03-11 15:17:53');
INSERT INTO `epidemics` VALUES (139, 44, 2020, 3, 11, 1353, 0, 0, 8, 1282, 2, '2020-03-11 15:19:47');
INSERT INTO `epidemics` VALUES (140, 45, 2020, 3, 11, 252, 0, 0, 2, 237, 2, '2020-03-11 15:19:47');
INSERT INTO `epidemics` VALUES (141, 46, 2020, 3, 11, 168, 0, 0, 6, 159, 2, '2020-03-11 15:19:47');
INSERT INTO `epidemics` VALUES (142, 50, 2020, 3, 11, 576, 0, 0, 6, 549, 2, '2020-03-11 15:19:47');
INSERT INTO `epidemics` VALUES (143, 51, 2020, 3, 11, 539, 0, 0, 3, 485, 2, '2020-03-11 15:19:48');
INSERT INTO `epidemics` VALUES (144, 52, 2020, 3, 11, 146, 0, 0, 2, 133, 2, '2020-03-11 15:19:48');
INSERT INTO `epidemics` VALUES (145, 53, 2020, 3, 11, 174, 0, 0, 2, 170, 2, '2020-03-11 15:21:39');
INSERT INTO `epidemics` VALUES (146, 54, 2020, 3, 11, 1, 0, 0, 0, 1, 2, '2020-03-11 15:21:39');
INSERT INTO `epidemics` VALUES (147, 61, 2020, 3, 11, 245, 0, 0, 1, 231, 2, '2020-03-11 15:21:39');
INSERT INTO `epidemics` VALUES (148, 62, 2020, 3, 11, 125, 0, 0, 2, 88, 2, '2020-03-11 15:21:39');
INSERT INTO `epidemics` VALUES (149, 63, 2020, 3, 11, 18, 0, 0, 0, 18, 2, '2020-03-11 15:21:39');
INSERT INTO `epidemics` VALUES (150, 64, 2020, 3, 11, 75, 0, 0, 0, 71, 2, '2020-03-11 15:21:39');
INSERT INTO `epidemics` VALUES (151, 65, 2020, 3, 11, 76, 0, 0, 3, 73, 2, '2020-03-11 15:22:24');
INSERT INTO `epidemics` VALUES (152, 71, 2020, 3, 11, 48, 0, 0, 1, 17, 2, '2020-03-11 15:22:24');
INSERT INTO `epidemics` VALUES (153, 81, 2020, 3, 11, 120, 0, 0, 3, 65, 2, '2020-03-11 15:22:24');
INSERT INTO `epidemics` VALUES (154, 82, 2020, 3, 11, 10, 0, 0, 0, 10, 2, '2020-03-11 15:22:24');

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `province_id` int(0) NOT NULL,
  `province_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province_py` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` smallint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (11, '北京', 'beijing', NULL);
INSERT INTO `provinces` VALUES (12, '天津', 'tianjin', NULL);
INSERT INTO `provinces` VALUES (13, '河北', 'hebei', NULL);
INSERT INTO `provinces` VALUES (14, '山西', 'shanxi', NULL);
INSERT INTO `provinces` VALUES (15, '内蒙古', 'neimenggu', NULL);
INSERT INTO `provinces` VALUES (21, '辽宁', 'liaoning', NULL);
INSERT INTO `provinces` VALUES (22, '吉林', 'jilin', NULL);
INSERT INTO `provinces` VALUES (23, '黑龙江', 'heilongjiang', NULL);
INSERT INTO `provinces` VALUES (31, '上海', 'shanghai', NULL);
INSERT INTO `provinces` VALUES (32, '江苏', 'jiangsu', NULL);
INSERT INTO `provinces` VALUES (33, '浙江', 'zhejiang', NULL);
INSERT INTO `provinces` VALUES (34, '安徽', 'anhui', NULL);
INSERT INTO `provinces` VALUES (35, '福建', 'fujian', NULL);
INSERT INTO `provinces` VALUES (36, '江西', 'jiangxi', NULL);
INSERT INTO `provinces` VALUES (37, '山东', 'shandong', NULL);
INSERT INTO `provinces` VALUES (41, '河南', 'henan', NULL);
INSERT INTO `provinces` VALUES (42, '湖北', 'hubei', NULL);
INSERT INTO `provinces` VALUES (43, '湖南', 'hunan', NULL);
INSERT INTO `provinces` VALUES (44, '广东', 'guangdong', NULL);
INSERT INTO `provinces` VALUES (45, '广西', 'guangxi', NULL);
INSERT INTO `provinces` VALUES (46, '海南', 'hainan', NULL);
INSERT INTO `provinces` VALUES (50, '重庆', 'chongqing', NULL);
INSERT INTO `provinces` VALUES (51, '四川', 'sichuan', NULL);
INSERT INTO `provinces` VALUES (52, '贵州', 'guizhou', NULL);
INSERT INTO `provinces` VALUES (53, '云南', 'yunnan', NULL);
INSERT INTO `provinces` VALUES (54, '西藏', 'xizang', NULL);
INSERT INTO `provinces` VALUES (61, '陕西', 'shaanxi', NULL);
INSERT INTO `provinces` VALUES (62, '甘肃', 'gansu', NULL);
INSERT INTO `provinces` VALUES (63, '青海', 'qinghai', NULL);
INSERT INTO `provinces` VALUES (64, '宁夏', 'ningxia', NULL);
INSERT INTO `provinces` VALUES (65, '新疆', 'xinjiang', NULL);
INSERT INTO `provinces` VALUES (71, '台湾', 'taiwan', NULL);
INSERT INTO `provinces` VALUES (81, '香港', 'xianggang', NULL);
INSERT INTO `provinces` VALUES (82, '澳门', 'aomen', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` smallint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', '123', '张三', NULL);
INSERT INTO `users` VALUES (2, 'lisi', '123', '李四', NULL);

SET FOREIGN_KEY_CHECKS = 1;

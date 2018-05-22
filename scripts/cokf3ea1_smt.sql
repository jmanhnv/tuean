/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : cokf3ea1_smt

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 22/05/2018 22:24:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ta_customer
-- ----------------------------
DROP TABLE IF EXISTS `ta_customer`;
CREATE TABLE `ta_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Personal; 1 - Organization',
  `title` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Gender {Mr, Mrs, Ms, Ph...}',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_file
-- ----------------------------
DROP TABLE IF EXISTS `ta_file`;
CREATE TABLE `ta_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extension` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `ta_file_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ta_mst_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_mst_category
-- ----------------------------
DROP TABLE IF EXISTS `ta_mst_category`;
CREATE TABLE `ta_mst_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ta_mst_category
-- ----------------------------
INSERT INTO `ta_mst_category` VALUES (1, 'ban_cong', 'ban_cong');
INSERT INTO `ta_mst_category` VALUES (2, 'cau_thang', 'cau_thang');
INSERT INTO `ta_mst_category` VALUES (3, 'mai_kinh', 'mai_kinh');
INSERT INTO `ta_mst_category` VALUES (4, 'cong_cua', 'cong_cua');
INSERT INTO `ta_mst_category` VALUES (5, 'hang_rao', 'hang_rao');

-- ----------------------------
-- Table structure for ta_mst_role
-- ----------------------------
DROP TABLE IF EXISTS `ta_mst_role`;
CREATE TABLE `ta_mst_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ta_mst_role
-- ----------------------------
INSERT INTO `ta_mst_role` VALUES (1, 'ADMIN', NULL);
INSERT INTO `ta_mst_role` VALUES (2, 'USER', NULL);

-- ----------------------------
-- Table structure for ta_offer
-- ----------------------------
DROP TABLE IF EXISTS `ta_offer`;
CREATE TABLE `ta_offer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_detail_id` int(11) NOT NULL,
  `estimate_price` decimal(10, 0) NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_detail_id`(`product_detail_id`) USING BTREE,
  CONSTRAINT `ta_offer_ibfk_1` FOREIGN KEY (`product_detail_id`) REFERENCES `ta_product_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_order
-- ----------------------------
DROP TABLE IF EXISTS `ta_order`;
CREATE TABLE `ta_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `offer_id`(`offer_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `ta_order_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `ta_offer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ta_order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ta_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `ta_order_detail`;
CREATE TABLE `ta_order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_detail_id` int(11) NOT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `product_detail_id`(`product_detail_id`) USING BTREE,
  CONSTRAINT `ta_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ta_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ta_order_detail_ibfk_2` FOREIGN KEY (`product_detail_id`) REFERENCES `ta_product_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_product
-- ----------------------------
DROP TABLE IF EXISTS `ta_product`;
CREATE TABLE `ta_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_id` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `file_id`(`file_id`) USING BTREE,
  CONSTRAINT `ta_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ta_mst_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ta_product_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `ta_file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_product_detail
-- ----------------------------
DROP TABLE IF EXISTS `ta_product_detail`;
CREATE TABLE `ta_product_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `width` decimal(10, 0) NULL DEFAULT NULL,
  `heigth` decimal(10, 0) NULL DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_price` decimal(10, 0) NULL DEFAULT NULL,
  `quantiy` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `updated_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `ta_product_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ta_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ta_user
-- ----------------------------
DROP TABLE IF EXISTS `ta_user`;
CREATE TABLE `ta_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Active; 1 - Inactive',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `identity_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `ta_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `ta_mst_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ta_user
-- ----------------------------
INSERT INTO `ta_user` VALUES (1, 'Johny Nguyen', 'manh.1403@cokhituean.com', '123456', 1, 0, '0915140386', '112032740', 'Hà Nội');
INSERT INTO `ta_user` VALUES (2, 'Hùng Nguyễn', 'nguyenhung090184@cokhituean.com', '123456', 2, 0, '0966858500', 'N/A', 'N/A');
INSERT INTO `ta_user` VALUES (3, 'Tính Nguyễn', 'nguyentinh8893@cokhituean.com', '123456', 2, 0, '01656417361', 'N/A', 'N/A');

SET FOREIGN_KEY_CHECKS = 1;

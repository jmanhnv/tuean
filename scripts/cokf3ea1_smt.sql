/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : cokf3ea1_smt

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-09-08 16:55:18
*/

-- Drop if exists
DROP DATABASE IF EXISTS cokf3ea1_smt;

-- Create new cokf3ea1_smt
CREATE DATABASE cokf3ea1_smt CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Disable All Checks
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ta_customer
-- ----------------------------
DROP TABLE IF EXISTS `ta_customer`;
CREATE TABLE `ta_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Personal; 1 - Organization',
  `title` varchar(5) NOT NULL COMMENT 'Gender {Mr, Mrs, Ms, Ph...}',
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `tax_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_file
-- ----------------------------
DROP TABLE IF EXISTS `ta_file`;
CREATE TABLE `ta_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `ta_file_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ta_mst_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_mst_category
-- ----------------------------
DROP TABLE IF EXISTS `ta_mst_category`;
CREATE TABLE `ta_mst_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_mst_role
-- ----------------------------
DROP TABLE IF EXISTS `ta_mst_role`;
CREATE TABLE `ta_mst_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_offer
-- ----------------------------
DROP TABLE IF EXISTS `ta_offer`;
CREATE TABLE `ta_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_detail_id` int(11) NOT NULL,
  `estimate_price` decimal(10,0) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_detail_id` (`product_detail_id`),
  CONSTRAINT `ta_offer_ibfk_1` FOREIGN KEY (`product_detail_id`) REFERENCES `ta_product_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_order
-- ----------------------------
DROP TABLE IF EXISTS `ta_order`;
CREATE TABLE `ta_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_id` (`offer_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `ta_order_ibfk_1` FOREIGN KEY (`offer_id`) REFERENCES `ta_offer` (`id`),
  CONSTRAINT `ta_order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ta_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `ta_order_detail`;
CREATE TABLE `ta_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_detail_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_detail_id` (`product_detail_id`),
  CONSTRAINT `ta_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ta_order` (`id`),
  CONSTRAINT `ta_order_detail_ibfk_2` FOREIGN KEY (`product_detail_id`) REFERENCES `ta_product_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_product
-- ----------------------------
DROP TABLE IF EXISTS `ta_product`;
CREATE TABLE `ta_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `ta_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ta_mst_category` (`id`),
  CONSTRAINT `ta_product_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `ta_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_product_detail
-- ----------------------------
DROP TABLE IF EXISTS `ta_product_detail`;
CREATE TABLE `ta_product_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `width` decimal(10,0) DEFAULT NULL,
  `heigth` decimal(10,0) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `quantiy` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ta_product_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ta_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for ta_user
-- ----------------------------
DROP TABLE IF EXISTS `ta_user`;
CREATE TABLE `ta_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Active; 1 - Inactive',
  `mobile` varchar(20) DEFAULT NULL,
  `identity_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `ta_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `ta_mst_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

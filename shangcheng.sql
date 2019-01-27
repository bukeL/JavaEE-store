/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : shangcheng

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-01-27 09:56:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '家用电器');
INSERT INTO `categories` VALUES ('2', '生活用品');
INSERT INTO `categories` VALUES ('3', '科技产品');
INSERT INTO `categories` VALUES ('4', '模型手办');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `originalprice` varchar(10) DEFAULT NULL,
  `currentprice` varchar(10) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('3', '水杯', '这是一个水杯', '50', '20', null, '2');
INSERT INTO `goods` VALUES ('4', '手机', '这是一个手机', '3000', '2000', null, '3');
INSERT INTO `goods` VALUES ('10', '手办', '这是一个手办', '1000', '500', null, '4');
INSERT INTO `goods` VALUES ('11', '茶杯', '这是一个茶杯', '50', '40', null, '2');
INSERT INTO `goods` VALUES ('12', '电脑', '这是一台电脑', '4000', '3333', null, '3');
INSERT INTO `goods` VALUES ('13', '钱包', '这是一个钱包', '50', '20', null, '2');
INSERT INTO `goods` VALUES ('14', '键盘', '这是一个键盘', '500', '300', null, '3');
INSERT INTO `goods` VALUES ('15', '鼠标', '这是一个鼠标', '300', '200', null, '3');
INSERT INTO `goods` VALUES ('19', '书包', '这是一个书包', '200', '100', null, '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `goodsname` varchar(255) DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  `originalprice` varchar(10) DEFAULT NULL,
  `currentprice` varchar(10) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2', '水杯', '这是一个水杯', '50', '20', '1');
INSERT INTO `orders` VALUES ('3', '1', '冰箱', '这是一个冰箱', '4000', '3000', '1');
INSERT INTO `orders` VALUES ('4', '1', '冰箱', '这是一个冰箱', '4000', '3000', '1');
INSERT INTO `orders` VALUES ('5', '1', '水杯', '这是一个水杯', '50', '20', '1');
INSERT INTO `orders` VALUES ('6', '1', '手办', '这是一个手办', '1000', '500', '1');

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('2', '1', '3');
INSERT INTO `shopcar` VALUES ('4', '1', '10');
INSERT INTO `shopcar` VALUES ('5', '1', '3');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '123456', '/SC/images/avatar.jpg', '太原', '111');
INSERT INTO `users` VALUES ('2', 'yonghu1', '123456', null, '北京', null);
INSERT INTO `users` VALUES ('3', '1111', '1111', null, '上海', '1111');
INSERT INTO `users` VALUES ('4', '333', '333', null, '广州', '333');
INSERT INTO `users` VALUES ('5', '44444', '4444', null, '深圳', '4444');

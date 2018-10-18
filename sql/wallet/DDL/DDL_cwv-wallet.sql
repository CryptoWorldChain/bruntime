/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : wallet_copy

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-10-18 18:24:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cwv_wlt_address`
-- ----------------------------
DROP TABLE IF EXISTS `cwv_wlt_address`;
CREATE TABLE `cwv_wlt_address` (
  `address_id` varchar(128) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `public_key` varchar(258) DEFAULT NULL,
  `private_key` varchar(128) DEFAULT NULL,
  `nonce` int(12) DEFAULT NULL,
  `balance` bigint(64) DEFAULT NULL,
  `seed` varchar(128) DEFAULT NULL,
  `bcuid` varchar(128) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL,
  `reserved1` varchar(128) DEFAULT NULL,
  `reserved2` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cwv_wlt_address
-- ----------------------------

-- ----------------------------
-- Table structure for `cwv_wlt_contract`
-- ----------------------------
DROP TABLE IF EXISTS `cwv_wlt_contract`;
CREATE TABLE `cwv_wlt_contract` (
  `contract_id` varchar(128) NOT NULL,
  `contract_address` varchar(128) DEFAULT NULL,
  `contract_tx_hash` varchar(128) DEFAULT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `contract_name` varchar(128) DEFAULT NULL,
  `contract_status` varchar(20) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL,
  `reserved1` varchar(128) DEFAULT NULL,
  `reserved2` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cwv_wlt_contract
-- ----------------------------

-- ----------------------------
-- Table structure for `cwv_wlt_contract_record`
-- ----------------------------
DROP TABLE IF EXISTS `cwv_wlt_contract_record`;
CREATE TABLE `cwv_wlt_contract_record` (
  `recoed_id` varchar(128) NOT NULL,
  `contract_id` varchar(128) DEFAULT NULL,
  `record_type` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `tx_hash` varchar(128) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL,
  `reserved1` varchar(128) DEFAULT NULL,
  `reserved2` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`recoed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cwv_wlt_contract_record
-- ----------------------------

-- ----------------------------
-- Table structure for `cwv_wlt_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `cwv_wlt_parameter`;
CREATE TABLE `cwv_wlt_parameter` (
  `param_id` int(32) NOT NULL AUTO_INCREMENT,
  `param_code` varchar(256) DEFAULT NULL,
  `param_value` varchar(256) DEFAULT NULL,
  `param_desc` varchar(256) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL,
  `reserved1` varchar(256) DEFAULT NULL,
  `reserved2` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cwv_wlt_parameter
-- ----------------------------
INSERT INTO `cwv_wlt_parameter` VALUES ('1', 'cwv', '7UE2u1tp407o5SL4', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('2', 'queryAddressURL', '/fbs/act/pbgac.do', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('3', 'createTransactionURL', '/fbs/txt/pbmtx.do', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('4', 'createContractURL', '/fbs/txt/pbmtx.do', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('5', 'queryTransaction', '/fbs/txt/pbgtx.do', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('6', 'queryLastBlock', '/fbs/bct/pbglb.do', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('7', 'chain_node_list', 'http://jh9p.cwv.one', null, null, null, null, null);
INSERT INTO `cwv_wlt_parameter` VALUES ('8', 'time_out_second', '5', null, null, null, null, null);

-- ----------------------------
-- Table structure for `cwv_wlt_tx`
-- ----------------------------
DROP TABLE IF EXISTS `cwv_wlt_tx`;
CREATE TABLE `cwv_wlt_tx` (
  `tx_id` varchar(128) NOT NULL,
  `tx_hash` varchar(128) DEFAULT NULL,
  `input_address` varchar(128) DEFAULT NULL,
  `output_address` varchar(128) DEFAULT NULL,
  `amount` bigint(128) DEFAULT NULL,
  `tx_status` varchar(20) DEFAULT NULL,
  `tx_type` varchar(20) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL,
  `reserved1` varchar(128) DEFAULT NULL,
  `reserved2` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cwv_wlt_tx
-- ----------------------------

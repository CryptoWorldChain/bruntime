SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `cwv_wlt_contract_record`;
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

DROP TABLE IF EXISTS  `cwv_wlt_parameter`;
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

insert into `cwv_wlt_parameter`(`param_id`,`param_code`,`param_value`,`param_desc`,`created_time`,`updated_time`,`reserved1`,`reserved2`) values
('1','cwv','7UE2u1tp407o5SL4',null,null,null,null,null),
('2','queryAddressURL','/act/pbgac.do',null,null,null,null,null),
('3','createTransactionURL','/txt/pbmtx.do',null,null,null,null,null),
('4','createContractURL','/txt/pbmtx.do',null,null,null,null,null),
('5','queryTransaction','/txt/pbgtx.do',null,null,null,null,null),
('6','queryLastBlock','/bct/pbglb.do',null,null,null,null,null),
('7','chain_node_list','http://chain.cwv.one/block',null,null,null,null,null),
('8','time_out_second','5',null,null,null,null,null);
DROP TABLE IF EXISTS  `cwv_wlt_tx`;
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

DROP TABLE IF EXISTS  `cwv_wlt_contract`;
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

DROP TABLE IF EXISTS  `cwv_wlt_address`;
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

SET FOREIGN_KEY_CHECKS = 1;


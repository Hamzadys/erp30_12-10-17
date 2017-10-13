# MySQL dump of database 'my_se1' on host 'localhost'
# Backup Date and Time: 2017-08-31 16:14
# Built by SmartBiz 2.4.2
# http://smartbiz.cloud
# Company: SE1
# User: Admin

# Compatibility: 2.4.1


SET NAMES latin1;


### Structure of table `0_amortisation` ###

DROP TABLE IF EXISTS `0_amortisation`;

CREATE TABLE `0_amortisation` (
  `amortisation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `amortisation_year` int(11) DEFAULT NULL,
  `asset_value` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `posted` int(11) NOT NULL DEFAULT '0',
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`amortisation_id`),
  UNIQUE KEY `amortisation_id` (`amortisation_id`),
  KEY `0_amortisation_asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_amortisation` ###


### Structure of table `0_areas` ###

DROP TABLE IF EXISTS `0_areas`;

CREATE TABLE `0_areas` (
  `area_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`area_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_areas` ###

INSERT INTO `0_areas` VALUES
('1', 'Global', '0');

### Structure of table `0_asset_types` ###

DROP TABLE IF EXISTS `0_asset_types`;

CREATE TABLE `0_asset_types` (
  `asset_type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_name` varchar(50) NOT NULL,
  `depreciation_type` int(11) NOT NULL DEFAULT '1',
  `depreciation_rate` double NOT NULL DEFAULT '10',
  `asset_account` varchar(15) DEFAULT NULL,
  `depreciation_account` varchar(15) DEFAULT NULL,
  `accumulated_account` varchar(15) DEFAULT NULL,
  `valuation_account` varchar(15) DEFAULT NULL,
  `disposal_account` varchar(15) DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`asset_type_id`),
  UNIQUE KEY `asset_type_id` (`asset_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_asset_types` ###


### Structure of table `0_asset_valuations` ###

DROP TABLE IF EXISTS `0_asset_valuations`;

CREATE TABLE `0_asset_valuations` (
  `asset_valuation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `valuation_year` int(11) DEFAULT NULL,
  `asset_value` double NOT NULL DEFAULT '0',
  `value_change` double NOT NULL DEFAULT '0',
  `posted` int(11) NOT NULL DEFAULT '0',
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`asset_valuation_id`),
  UNIQUE KEY `asset_valuation_id` (`asset_valuation_id`),
  UNIQUE KEY `asset_id` (`asset_id`,`valuation_year`),
  KEY `0_asset_valuations_asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_asset_valuations` ###


### Structure of table `0_assets` ###

DROP TABLE IF EXISTS `0_assets`;

CREATE TABLE `0_assets` (
  `asset_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asset_type_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `asset_name` varchar(50) DEFAULT NULL,
  `asset_serial` varchar(50) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `purchase_value` double NOT NULL,
  `disposal_amount` double DEFAULT NULL,
  `disposal_date` date DEFAULT NULL,
  `disposal_posting` int(11) DEFAULT '0',
  `tag_number` varchar(50) DEFAULT NULL,
  `asset_location` varchar(50) DEFAULT NULL,
  `asset_condition` varchar(50) DEFAULT NULL,
  `asset_acquisition` varchar(50) DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `details` text,
  PRIMARY KEY (`asset_id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  KEY `0_assets_asset_type_id` (`asset_type_id`),
  KEY `0_assets_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_assets` ###


### Structure of table `0_attachments` ###

DROP TABLE IF EXISTS `0_attachments`;

CREATE TABLE `0_attachments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `unique_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `filename` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filetype` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type_no` (`type_no`,`trans_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_attachments` ###


### Structure of table `0_audit_trail` ###

DROP TABLE IF EXISTS `0_audit_trail`;

CREATE TABLE `0_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `user` smallint(6) unsigned NOT NULL DEFAULT '0',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fiscal_year` int(11) NOT NULL DEFAULT '0',
  `gl_date` date NOT NULL DEFAULT '0000-00-00',
  `gl_seq` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  KEY `Type_and_Number` (`type`,`trans_no`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###

INSERT INTO `0_audit_trail` VALUES
('1', '0', '1', '19', '2017-08-30 05:38:24', NULL, '3', '2017-07-01', NULL),
('3', '0', '1', '12', '2017-08-30 05:38:24', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('4', '0', '2', '12', '2017-08-30 05:50:59', NULL, '3', '2017-07-01', NULL),
('6', '0', '2', '19', '2017-08-30 05:50:59', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('7', '0', '3', '19', '2017-08-30 05:51:44', NULL, '3', '2017-07-01', NULL),
('8', '0', '3', '19', '2017-08-30 05:51:44', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('9', '0', '4', '19', '2017-08-30 05:58:18', NULL, '3', '2017-07-01', NULL),
('10', '0', '4', '12', '2017-08-30 05:58:18', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('11', '0', '5', '12', '2017-08-30 06:01:40', NULL, '3', '2017-06-30', NULL),
('12', '0', '5', '12', '2017-08-30 06:01:40', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('13', '0', '6', '12', '2017-08-30 06:11:17', NULL, '3', '2017-06-30', NULL),
('14', '0', '6', '12', '2017-08-30 06:11:17', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('15', '0', '7', '12', '2017-08-30 06:22:01', NULL, '3', '2017-06-30', NULL),
('16', '0', '7', '12', '2017-08-30 06:22:01', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('17', '0', '8', '12', '2017-08-30 06:32:11', NULL, '3', '2017-06-30', NULL),
('18', '0', '8', '12', '2017-08-30 06:32:11', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('19', '0', '9', '12', '2017-08-30 06:56:06', NULL, '3', '2017-06-30', NULL),
('21', '0', '9', '19', '2017-08-30 06:56:06', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('22', '0', '10', '19', '2017-08-30 07:03:08', NULL, '3', '2017-06-30', NULL),
('23', '0', '10', '19', '2017-08-30 07:03:08', 'Voided.\nDocument reentered.', '3', '2017-08-30', '0'),
('24', '0', '11', '19', '2017-08-30 07:03:08', NULL, '2', '2017-06-30', '0'),
('25', '0', '12', '19', '2017-08-31 04:38:40', NULL, '3', '2017-06-30', NULL),
('29', '0', '13', '19', '2017-08-30 10:28:47', NULL, '2', '2017-06-30', '0'),
('30', '20', '1', '19', '2017-08-30 10:39:36', NULL, '3', '2017-07-10', '0'),
('32', '0', '14', '19', '2017-08-31 03:40:44', NULL, '3', '2017-07-01', '0'),
('33', '4', '1', '19', '2017-08-31 03:41:23', NULL, '3', '2017-07-01', '0'),
('34', '41', '1', '19', '2017-08-31 03:42:12', NULL, '3', '2017-07-01', '0'),
('35', '4', '2', '19', '2017-08-31 03:42:55', NULL, '3', '2017-07-01', '0'),
('36', '41', '2', '19', '2017-08-31 03:43:44', NULL, '3', '2017-07-01', '0'),
('37', '41', '3', '19', '2017-08-31 03:44:28', NULL, '3', '2017-07-01', '0'),
('38', '0', '15', '19', '2017-08-31 04:33:12', NULL, '3', '2017-07-01', '0'),
('39', '41', '4', '19', '2017-08-31 04:34:09', NULL, '3', '2017-07-01', '0'),
('40', '41', '5', '19', '2017-08-31 04:36:17', NULL, '3', '2017-07-01', '0'),
('41', '0', '12', '19', '2017-08-31 04:38:40', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('42', '0', '16', '19', '2017-08-31 04:42:12', NULL, '3', '2017-06-30', NULL),
('44', '0', '16', '19', '2017-08-31 04:42:12', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('45', '0', '17', '19', '2017-08-31 04:44:45', NULL, '3', '2017-06-30', NULL),
('48', '0', '17', '19', '2017-08-31 04:44:45', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('49', '0', '18', '19', '2017-08-31 04:52:29', NULL, '3', '2017-06-30', NULL),
('52', '0', '18', '19', '2017-08-31 04:52:29', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('53', '0', '19', '19', '2017-08-31 04:53:06', NULL, '3', '2017-06-30', NULL),
('54', '0', '19', '19', '2017-08-31 04:53:06', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('55', '0', '20', '19', '2017-08-31 04:53:43', NULL, '3', '2017-06-30', NULL),
('56', '0', '20', '19', '2017-08-31 04:53:43', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('57', '0', '21', '19', '2017-08-31 04:53:43', NULL, '2', '2017-06-30', '0'),
('58', '0', '22', '12', '2017-08-31 05:34:58', NULL, '2', '2017-06-30', '0'),
('59', '0', '23', '12', '2017-08-31 05:36:53', NULL, '3', '2017-06-30', NULL),
('61', '0', '23', '12', '2017-08-31 05:36:53', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('62', '0', '24', '12', '2017-08-31 05:37:13', NULL, '3', '2017-06-30', NULL),
('63', '0', '24', '12', '2017-08-31 05:37:13', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('64', '0', '25', '12', '2017-08-31 05:42:51', NULL, '3', '2017-06-30', NULL),
('66', '0', '25', '12', '2017-08-31 05:42:51', 'Voided.\nDocument reentered.', '3', '2017-08-31', '0'),
('67', '0', '26', '12', '2017-08-31 05:42:51', NULL, '2', '2017-06-30', '0'),
('68', '0', '27', '12', '2017-08-31 06:14:29', NULL, '3', '2017-08-31', NULL),
('69', '0', '28', '12', '2017-08-31 06:14:36', NULL, '3', '2017-08-31', NULL),
('70', '0', '29', '12', '2017-08-31 06:14:42', NULL, '3', '2017-08-31', NULL),
('71', '0', '30', '12', '2017-08-31 06:14:49', NULL, '3', '2017-08-31', NULL),
('72', '0', '27', '12', '2017-08-31 06:14:29', 'Voided.\n', '3', '2017-08-31', '0'),
('73', '0', '28', '12', '2017-08-31 06:14:36', 'Voided.\n', '3', '2017-08-31', '0'),
('74', '0', '29', '12', '2017-08-31 06:14:42', 'Voided.\n', '3', '2017-08-31', '0'),
('75', '0', '30', '12', '2017-08-31 06:14:49', 'Voided.\n', '3', '2017-08-31', '0');

### Structure of table `0_bank_accounts` ###

DROP TABLE IF EXISTS `0_bank_accounts`;

CREATE TABLE `0_bank_accounts` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` smallint(6) NOT NULL DEFAULT '0',
  `bank_account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_address` tinytext COLLATE utf8_unicode_ci,
  `bank_curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_curr_act` tinyint(1) NOT NULL DEFAULT '0',
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `bank_charge_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_reconciled_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bank_account_name` (`bank_account_name`),
  KEY `bank_account_number` (`bank_account_number`),
  KEY `account_code` (`account_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('102511', '3', 'Cash in Hand KHI', '', 'Cash in Hand KHI', NULL, 'PKR', '0', '1', '50211', '0000-00-00 00:00:00', '0', '0'),
('102512', '3', 'Petty Cash - Fahad Khan', '', 'Petty Cash - Fahad Khan', NULL, 'PKR', '0', '2', '50211', '0000-00-00 00:00:00', '0', '0'),
('102521', '3', 'Cash in Hand (Lhr)', '', 'Cash in Hand (Lhr)', NULL, 'PKR', '0', '3', '50211', '0000-00-00 00:00:00', '0', '0'),
('102531', '3', 'Cash in Hand (Isb)', '', 'Cash in Hand (Isb)', NULL, 'PKR', '0', '4', '50211', '0000-00-00 00:00:00', '0', '0'),
('102611', '0', 'Standard Chartered Bank', '', 'Standard Chartered Bank', NULL, 'PKR', '0', '5', '50211', '0000-00-00 00:00:00', '0', '0'),
('102612', '0', 'Summit Bank - SE', '', 'Summit Bank - SE', NULL, 'PKR', '0', '6', '50211', '0000-00-00 00:00:00', '0', '0'),
('102613', '0', 'Faysal Bank Ltd - SE', '', 'Faysal Bank Ltd - SE', NULL, 'PKR', '0', '7', '50211', '0000-00-00 00:00:00', '0', '0'),
('102614', '0', 'Meezan Bank Ltd - 408', '', 'Meezan Bank Ltd - 408', NULL, 'PKR', '0', '8', '50211', '0000-00-00 00:00:00', '0', '0'),
('102615', '0', 'Sindh Bank Ltd - 0302-398749-1000', '', 'Sindh Bank Ltd - 0302-398749-1000', NULL, 'PKR', '0', '9', '50211', '0000-00-00 00:00:00', '0', '0'),
('102513', '3', 'Munim Saeed', '', 'Munim Saeed', NULL, 'PKR', '0', '10', '50211', '0000-00-00 00:00:00', '0', '0');

### Structure of table `0_bank_trans` ###

DROP TABLE IF EXISTS `0_bank_trans`;

CREATE TABLE `0_bank_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `bank_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) NOT NULL DEFAULT '0',
  `person_id` tinyblob,
  `reconciled` date DEFAULT NULL,
  `cheque` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_trans` ###

INSERT INTO `0_bank_trans` VALUES
('17', '0', '7', '1', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('18', '0', '7', '2', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('19', '0', '7', '3', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('20', '0', '7', '4', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('21', '0', '7', '5', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('22', '0', '7', '7', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('23', '0', '7', '8', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('24', '0', '7', '9', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('25', '0', '8', '1', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('26', '0', '8', '2', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('27', '0', '8', '3', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('28', '0', '8', '4', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('29', '0', '8', '5', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('30', '0', '8', '7', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('31', '0', '8', '8', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('32', '0', '8', '9', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('33', '0', '9', '1', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('34', '0', '9', '2', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('35', '0', '9', '3', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('36', '0', '9', '4', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('37', '0', '9', '5', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('38', '0', '9', '7', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('39', '0', '9', '8', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('40', '0', '9', '9', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('49', '0', '10', '1', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('50', '0', '10', '2', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('51', '0', '10', '3', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('52', '0', '10', '4', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('53', '0', '10', '5', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('54', '0', '10', '7', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('55', '0', '10', '8', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('56', '0', '10', '9', '002/2017', '2017-06-30', '0', '0', '0', '0', NULL, NULL, '0'),
('57', '0', '11', '1', '002/2017', '2017-06-30', '-15611', '0', '0', '0', NULL, NULL, '0'),
('58', '0', '11', '2', '002/2017', '2017-06-30', '-389', '0', '0', '0', NULL, NULL, '0'),
('59', '0', '11', '3', '002/2017', '2017-06-30', '-30391', '0', '0', '0', NULL, NULL, '0'),
('60', '0', '11', '4', '002/2017', '2017-06-30', '20000', '0', '0', '0', NULL, NULL, '0'),
('61', '0', '11', '5', '002/2017', '2017-06-30', '221', '0', '0', '0', NULL, NULL, '0'),
('62', '0', '11', '7', '002/2017', '2017-06-30', '3000', '0', '0', '0', NULL, NULL, '0'),
('63', '0', '11', '8', '002/2017', '2017-06-30', '404', '0', '0', '0', NULL, NULL, '0'),
('64', '0', '11', '9', '002/2017', '2017-06-30', '5000', '0', '0', '0', NULL, NULL, '0'),
('65', '0', '14', '10', '005/2017', '2017-07-01', '1000000', '0', '0', '0', NULL, NULL, '0'),
('66', '4', '1', '10', 'FT001/2017', '2017-07-01', '-48000', '0', '0', '0', 'From Munim Saeed To Cash in Hand KHI', NULL, '0'),
('67', '4', '1', '1', 'FT001/2017', '2017-07-01', '48000', '0', '0', '0', 'From Munim Saeed To Cash in Hand KHI', NULL, '0'),
('68', '41', '1', '1', 'CPV001/2017', '2017-07-01', '-20000', '0', '0', '0', NULL, NULL, '0'),
('69', '4', '2', '1', 'FT002/2017', '2017-07-01', '-4000', '0', '0', '0', 'From Cash in Hand KHI To Petty Cash - Fahad Khan', NULL, '0'),
('70', '4', '2', '2', 'FT002/2017', '2017-07-01', '4000', '0', '0', '0', 'From Cash in Hand KHI To Petty Cash - Fahad Khan', NULL, '0'),
('71', '41', '2', '1', 'CPV002/2017', '2017-07-01', '-500', '0', '0', '0', NULL, NULL, '0'),
('72', '41', '3', '1', 'CPV003/2017', '2017-07-01', '-65', '0', '0', '0', NULL, NULL, '0'),
('73', '0', '15', '1', '006/2017', '2017-07-01', '16176', '0', '0', '0', NULL, NULL, '0'),
('74', '41', '4', '1', 'CPV004/2017', '2017-07-01', '-23000', '0', '0', '0', NULL, NULL, '0'),
('75', '41', '5', '1', 'CPV005/2017', '2017-07-01', '-1000', '0', '0', '0', NULL, NULL, '0');

### Structure of table `0_bom` ###

DROP TABLE IF EXISTS `0_bom`;

CREATE TABLE `0_bom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre_added` int(11) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`parent`,`component`,`workcentre_added`,`loc_code`),
  KEY `component` (`component`),
  KEY `id` (`id`),
  KEY `loc_code` (`loc_code`),
  KEY `parent` (`parent`,`loc_code`),
  KEY `workcentre_added` (`workcentre_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bom` ###


### Structure of table `0_budget_trans` ###

DROP TABLE IF EXISTS `0_budget_trans`;

CREATE TABLE `0_budget_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Account` (`account`,`tran_date`,`dimension_id`,`dimension2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_budget_trans` ###


### Structure of table `0_chart_class` ###

DROP TABLE IF EXISTS `0_chart_class`;

CREATE TABLE `0_chart_class` (
  `cid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `class_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ctype` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_chart_class` ###

INSERT INTO `0_chart_class` VALUES
('10', 'Assets', '1', '0'),
('20', 'Liabilities', '2', '0'),
('30', 'Capital', '3', '0'),
('40', 'Revenue', '4', '0'),
('50', 'Expenses', '6', '0');

### Structure of table `0_chart_master` ###

DROP TABLE IF EXISTS `0_chart_master`;

CREATE TABLE `0_chart_master` (
  `account_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_code2` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `account_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_code`),
  KEY `account_name` (`account_name`),
  KEY `accounts_by_type` (`account_type`,`account_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_chart_master` ###

INSERT INTO `0_chart_master` VALUES
('10111', '', 'Workshop - Karachi', '1011', '0'),
('101211', '', 'Office Furniture', '10121', '0'),
('101212', '', 'Workshop Furniture (Khi)', '10121', '0'),
('101221', '', 'Office Furniture (Lhr)', '10122', '0'),
('101222', '', 'Workshop Funiture (Lhr)', '10122', '0'),
('101231', '', 'Office Furniture (Isb)', '10123', '0'),
('101232', '', 'Workshop Furniture (Isb)', '10123', '0'),
('101311', '', 'UPS &amp; Battries - (Khi)', '10131', '0'),
('101312', '', 'Generators (Khi)', '10131', '0'),
('101321', '', 'AC 1.5 Ton (GREE) AC (Lhr)', '10132', '0'),
('101322', '', 'UPS &amp; Battries - (Lhr)', '10132', '0'),
('101323', '', 'Royal Pedestala Fans (Lhr) 30.06.2015', '10132', '0'),
('101324', '', 'Dawlance AC (Lhr)', '10132', '0'),
('101325', '', 'Air Compressor (Lhr) 11-6-2015', '10132', '0'),
('101326', '', 'Hand Cutting Machine (Lhr) 13-06-2015', '10132', '0'),
('101327', '', 'Hand Cutter (Lhr) 30-05-2015', '10132', '0'),
('101328', '', 'Spray Gun (Lhr) 11-06-205', '10132', '0'),
('101329', '', 'Pak Fan (Pedastal) (Lhr) 20-06-2015', '10132', '0'),
('101330', '', 'Exasut Fan (Lhr) 26-05-2017', '10132', '0'),
('101331', '', 'Wood Planner Machine', '10132', '0'),
('101332', '', 'Wood Router Machine', '10132', '0'),
('101341', '', 'UPS &amp; Batteries (Mux)', '10134', '0'),
('101411', '', 'Computers &amp; LCD Khi)', '10141', '0'),
('101412', '', 'Laptops (Khi)', '10141', '0'),
('101413', '', 'Printers &amp; Scanners (Khi)', '10141', '0'),
('101421', '', 'Computers &amp; LCD (Lhr)', '10142', '0'),
('101422', '', 'Laptop (Lhr)', '10142', '0'),
('101423', '', 'Printers &amp; Scanners (Lhr)', '10142', '0'),
('101431', '', 'Computers &amp; LCD (Isb)', '10143', '0'),
('101432', '', 'Laptop (Isb)', '10143', '0'),
('101433', '', 'Printers &amp; Scanners (Isb)', '10143', '0'),
('101511', '', 'KFR-6487 / Target 70', '10151', '0'),
('101512', '', 'KEF 6679 / Metro 70', '10151', '0'),
('101513', '', 'KGP 8201 (Union Star) - Rizwan Shoukat', '10151', '0'),
('101514', '', 'KEP 4375 - (Dhoom 70) Javed Gill', '10151', '0'),
('101515', '', 'KKB 9570 / Road Prince (Ameen AKhtar)', '10151', '0'),
('101516', '', 'KDY 5669 / Unique 70', '10151', '0'),
('101531', '', 'LEO - 13B - 2798', '10153', '0'),
('101532', '', 'LEO - 13B - 2807', '10153', '0'),
('101611', '', 'Roland - RF 640 A (Printing Only)', '10161', '0'),
('101612', '', 'Roland - VS-640 - Print &amp; Cut with Plottar Cutting (Khi)', '10161', '0'),
('101613', '', 'Roland - DX-5 NEO (Khi)', '10161', '0'),
('101614', '', 'Challenger - FY3278N (Khi)', '10161', '0'),
('101615', '', 'Challenger - FY-3278G   American Flex (Khi)', '10161', '0'),
('101616', '', 'Laser Cutting &amp; Engraving - RECI90W (Khi)', '10161', '0'),
('101621', '', 'Roland - Lhr ((Lhr)', '10162', '0'),
('101622', '', 'K Jet Konica Printer (Lhr)', '10162', '0'),
('101623', '', 'Laminator - Lhr', '10162', '0'),
('101631', '', 'K Jet - HM K-Jet 3200 (Isb)', '10163', '0'),
('101632', '', 'Roland - RF-640 (Isb)', '10163', '0'),
('101641', '', 'K Jet - 3208D (Mux)', '10164', '0'),
('102211', '', 'Salahuddin', '10221', '0'),
('102212', '', 'Ejaz (Isb)', '10221', '0'),
('102213', '', 'Sheikh Kamran Maqbool', '10221', '0'),
('102214', '', 'Fahad Tariq Bhutta', '10221', '0'),
('102215', '', 'Waqar Bhutta', '10221', '0'),
('102216', '', 'Zakiuddin Ahmed', '10221', '0'),
('102241', '', 'Tax deducted at source @ 4.5%', '10224', '0'),
('102242', '', 'Tax deducted at source @ 10%', '10224', '0'),
('102243', '', 'Withholding Tax deduction U/S. 234', '10224', '0'),
('102244', '', 'Withholding Tax deduction U/S. 235', '10224', '0'),
('102245', '', 'Withholding Tax deduction U/S. 236', '10224', '0'),
('102246', '', 'Withholding Tax deduction on Cash withdrawals U/S. 231(A)', '10224', '0'),
('102311', '', 'Procter &amp; Gamble Pakistan', '10231', '0'),
('102312', '', 'Reckitt Benckiser', '10231', '0'),
('102313', '', 'Gul Ahmed', '10231', '0'),
('102314', '', 'Continental Biscuits Ltd', '10231', '0'),
('102315', '', 'Pepsi Cola Int&#039;l (Pvt.) Ltd', '10231', '0'),
('102316', '', 'Print Point PK (Pvt.) Ltd', '10231', '0'),
('102411', '', 'Qayyumabad Office - Security Deposit', '10241', '0'),
('102412', '', 'Korangi Office  - Security Deposit', '10241', '0'),
('102413', '', 'Workshop Manzoor Colony- Security Deposit', '10241', '0'),
('102414', '', 'Ufone - Security Deposit', '10241', '0'),
('102415', '', 'Mobilink - Security Deposit', '10241', '0'),
('102416', '', 'Johant (Pvt.) Ltd - Security Deposit', '10241', '0'),
('102421', '', 'Office - Lhr - Security Deposit', '10242', '0'),
('102422', '', 'Workshop - Lhr - Security Deposit', '10242', '0'),
('102431', '', 'Office Isb - Security Deposit', '10243', '0'),
('102432', '', 'AM Printing Office - Security Deposit', '10243', '0'),
('102511', '', 'Cash In Hand (Khi)', '10251', '0'),
('102512', '', 'Petty Cash - Fahad Khan', '10251', '0'),
('102513', '', 'Munim Saeed', '10251', '0'),
('102521', '', 'Cash in Hand (Lhr)', '10252', '0'),
('102531', '', 'Cash In Hand (Isb)', '10253', '0'),
('102611', '', 'Standard Chartered Bank - 10342573801', '10261', '0'),
('102612', '', 'Summit Bank - SE', '10261', '0'),
('102613', '', 'Faysal Bank Ltd - Sumair Enterprises 3060301000111601', '10261', '0'),
('102614', '', 'Meezan Bank Ltd - 408', '10261', '0'),
('102615', '', 'Sindh Bank Ltd _ 0302-398740-1000', '10261', '0'),
('10271', '', 'Modern Marketing Promotions', '1027', '0'),
('10272', '', 'Gwadar Printing Solutions', '1027', '0'),
('10273', '', 'Molecules (Pvt.) Ltd', '1027', '0'),
('10274', '', 'Sumair Enterprises (Pvt.) Ltd', '1027', '0'),
('10275', '', 'AM Khi', '1027', '0'),
('10276', '', 'AM Lahore', '1027', '0'),
('10277', '', 'AM Isb', '1027', '0'),
('10278', '', 'Sindh Bank (MS)', '1027', '0'),
('10279', '', 'Faysal Bank (MS)', '1027', '0'),
('10280', '', 'Meezan Bank (MS)', '1027', '0'),
('10281', '', 'Summit Bank (MS)', '1027', '0'),
('102811', '', 'Ameen Akhtar - Imprest Account', '10281', '0'),
('102812', '', 'Malik Manzoor - Imprest Account', '10281', '0'),
('102813', '', 'Javed Iqbal - Imprest Account', '10281', '0'),
('102814', '', 'Raja Khalil - Imprest Account', '10281', '0'),
('102815', '', 'Sarfraz James - Imprest Account', '10281', '0'),
('102816', '', 'Salman Shoukat - Imprest Account', '10281', '0'),
('102817', '', 'Amaan Ullha Khan - Imprest Account', '10281', '0'),
('102818', '', 'Osama Ali Khan - Imprest Account', '10281', '0'),
('102819', '', 'Riaz Hussain - Imprest Account', '10281', '0'),
('10282', '', 'Bank Alfalah (MS)', '1027', '0'),
('102820', '', 'Shayan Ali Sarwar - Impresst Account', '10281', '0'),
('10291', '', 'Ashfaq Mirza', '1029', '0'),
('10292', '', 'Shoaib Akram', '1029', '0'),
('10293', '', 'Tariq Javed', '1029', '0'),
('10294', '', 'Mansoor Bhutta', '1029', '0'),
('20111', '', 'Yasir (Mr.)', '2011', '0'),
('20112', '', 'Azhar Qasim', '2011', '0'),
('20113', '', 'Aleem Siddiqui', '2011', '0'),
('20114', '', 'Siraj Awan', '2011', '0'),
('20115', '', 'Aftab &amp; Sufyan (Lays)', '2011', '0'),
('20116', '', 'Salman Haider (Shah Gee)', '2011', '0'),
('20117', '', 'Tariq Ameer', '2011', '0'),
('202111', '', 'Shahbaz Gill - Accrued Salary Khi', '20211', '0'),
('2021110', '', 'Hassan - Accrued Salary Khi', '20211', '0'),
('2021111', '', 'Riaz Hussain - Accrued Salary Khi', '20211', '0'),
('2021112', '', 'Abdul Moiz - Accrued Salary Khi', '20211', '0'),
('2021113', '', 'Malik Manzoor - Accrued Salary Khi', '20211', '0'),
('2021114', '', 'Sarfra James Jalal - Accrued Salary Khi', '20211', '0'),
('2021115', '', 'Shoaib Akram - Accrued Salary Khi', '20211', '0'),
('2021116', '', 'Aashir James - Accrued Salary Khi', '20211', '0'),
('2021117', '', 'Javed Iqbal - Accrued Salary Khi', '20211', '0'),
('2021118', '', 'Ashfaq Awan - Accrued Salary Khi', '20211', '0'),
('2021119', '', 'Khurram Shoukat - Accrued Salary Khi', '20211', '0'),
('202112', '', 'Hazoor Bux - Accrued Salary Khi', '20211', '0'),
('2021120', '', 'Rizwan Shoukat - Accrued Salary Khi', '20211', '0'),
('2021121', '', 'Daniyal Sohail - Accrued Salary Khi', '20211', '0'),
('2021122', '', 'Baqir Hassan - Accrued Salary Khi', '20211', '0'),
('202113', '', 'Danish - Accrued Salary Khi', '20211', '0'),
('202114', '', 'M. Manzoor Accrued Salary Khi', '20211', '0'),
('202115', '', 'Habib Khan Accrued Salary Khi', '20211', '0'),
('202116', '', 'Salman Shoukat - Accrued Salary Khi', '20211', '0'),
('202117', '', 'Ameen Akhtar - Accrued Salary Khi', '20211', '0'),
('202118', '', 'Muhammad Faheem - Accrued Salary Khi', '20211', '0'),
('202119', '', 'Shayan Ali Sarwar - Accrued Salary Khi', '20211', '0'),
('202120', '', 'Muhammad Zubair - Accrued Salary Isb', '20211', '0'),
('202121', '', 'Zulkaif Saeed Bhutta - Accrued Salary Lhr', '20212', '0'),
('202122', '', 'Mughees Ahmed - Accrued Salary Lhr', '20212', '0'),
('202123', '', 'Junaid Iqbal - Accured Salary - Lhr', '20212', '0'),
('202124', '', 'Saeed - Accrued Salary - Lhr', '20212', '0'),
('202131', '', 'Syed Atiq ur Rehman - Accrued Salary _Isb', '20213', '0'),
('202132', '', 'Tariq Jamil - Accrued Salary Isb', '20213', '0'),
('202133', '', 'Ghulam Abbas - Accrued Salary Isb', '20213', '0'),
('202211', '', 'Qayyumabad Office - Rent payable - Khi', '20221', '0'),
('202212', '', 'Korangi Office - Rent payable - Khi', '20221', '0'),
('202213', '', 'Workshop - Rent payable - Khi', '20221', '0'),
('202221', '', 'Office Rent payable - Lhr Office', '20222', '0'),
('202222', '', 'Workshop Rent payable - Lhr', '20222', '0'),
('202231', '', 'Office Rent Payable - Isb', '20223', '0'),
('202311', '', 'K Electric', '20231', '0'),
('202312', '', 'Sui- Southern Gass', '20231', '0'),
('202313', '', 'KW&amp;SB Khi', '20231', '0'),
('202314', '', 'PTCL _Khi', '20231', '0'),
('202315', '', 'Mobilink - Khi', '20231', '0'),
('202316', '', 'Ufone - payable', '20231', '0'),
('202321', '', 'Electric payable', '20232', '0'),
('202322', '', 'Sui- Southern Gass Lhr', '20232', '0'),
('202323', '', 'PTCL - Lhr', '20232', '0'),
('202331', '', 'Electric payable - Isb', '20233', '0'),
('202332', '', 'Sui- Southern Gass - Isb', '20233', '0'),
('20241', '', 'FBR (17%)', '2024', '0'),
('20242', '', 'SRB (13%)', '2024', '0'),
('20243', '', 'Income Tax', '2024', '0'),
('20244', '', 'Professional Tax', '2024', '0'),
('202511', '', 'A to Z Computer', '20251', '0'),
('2025110', '', 'Jeco', '20251', '0'),
('2025111', '', 'Johant (Pvt.) Ltd', '20251', '0'),
('2025112', '', 'Khalil (Carpentor)', '20251', '0'),
('2025113', '', 'Khan Printer', '20251', '0'),
('2025114', '', 'Mubeen Wall Mount', '20251', '0'),
('2025115', '', 'Khalil - 2 (Carpentor)', '20251', '0'),
('2025116', '', 'Nawab Autos', '20251', '0'),
('2025117', '', 'Nisar', '20251', '0'),
('2025118', '', 'R K Traders', '20251', '0'),
('2025119', '', 'Sabri Plastic Stores', '20251', '0'),
('202512', '', 'Abid Acrylic Works', '20251', '0'),
('2025120', '', 'Sagheer Water Supplier', '20251', '0'),
('2025121', '', 'Star Plastic Works', '20251', '0'),
('2025122', '', 'Sunny Advertising', '20251', '0'),
('2025123', '', 'Total Express', '20251', '0'),
('2025124', '', 'Basheer &amp; Sons', '20251', '0'),
('2025125', '', 'Farhan Khan -2 (Carpentor)', '20251', '0'),
('2025126', '', 'Super Carpet Centre', '20251', '0'),
('202513', '', 'Air Condition Services', '20251', '0'),
('202514', '', 'A Q Printer', '20251', '0'),
('202515', '', 'Arabian Engg. Servies', '20251', '0'),
('202516', '', 'Farhan Khan', '20251', '0'),
('202517', '', 'Decent Baloons', '20251', '0'),
('202518', '', 'Graphic Packages', '20251', '0'),
('202519', '', 'Hub &amp; Co', '20251', '0'),
('202521', '', 'Air Condition Services', '20252', '0'),
('2025210', '', 'Zaffar Hussain', '20252', '0'),
('2025211', '', 'Zaffar Hussain - 2 (Duco Paint)', '20252', '0'),
('2025212', '', 'Salman Abbas (3D Designer)', '20252', '0'),
('2025213', '', 'Smooth Travells', '20252', '0'),
('202522', '', 'Boxygen', '20252', '0'),
('202523', '', 'DYS', '20252', '0'),
('202524', '', 'Hermain Travells', '20252', '0'),
('202525', '', 'Liaquat (Shehzor Rental)', '20252', '0'),
('202526', '', 'Muhammad Amin (Tax Consultant)', '20252', '0'),
('202527', '', 'Naveed (Suzuki)', '20252', '0'),
('202528', '', 'Satcom', '20252', '0'),
('202529', '', 'Zaki Khan', '20252', '0'),
('202531', '', 'Abid Wood Works', '20253', '0'),
('202532', '', 'Mirza Raza (Lhr)', '20253', '0'),
('202533', '', 'Altaf', '20253', '0'),
('202534', '', 'Sabri Plastic Stores (Lhr)', '20253', '0'),
('202535', '', 'Graphic Media (Lhr)', '20253', '0'),
('202536', '', 'Zahid Advertiser (Lhr)', '20253', '0'),
('202541', '', 'Ghaffar Transportor (Lhr)', '20254', '0'),
('202542', '', 'Aurangzeb (Transporter) Lhr', '20254', '0'),
('202543', '', 'Akif (Paster) Lhr', '20254', '0'),
('202544', '', 'Naveed (Paster) Lhr', '20254', '0'),
('202551', '', 'Mirza Shehzad Rasul', '20255', '0'),
('202552', '', 'Sabri Plastic Stores (Isb)', '20255', '0'),
('20261', '', 'Ameen Akhtar - Commission payable', '2026', '0'),
('20262', '', 'Eman Trading', '2026', '0'),
('20271', '', 'Amaan Ullha Khan - Monthly Food Allowance', '2027', '0'),
('20272', '', 'Muhammad Ameen (GST)', '2027', '0'),
('20273', '', 'Shahbaz (Credit A/c.)', '2027', '0'),
('3011', '', 'Capital Sharing (Munim Saeed)', '301', '0'),
('30111', '', 'Reserves and Surplus', '3011', '0'),
('3012', '', 'Capital Sharing (Azhar Qasim)', '301', '0'),
('3013', '', 'Drawing', '301', '0'),
('4011', '', 'Supplies Income', '401', '0'),
('4012', '', 'Service Income', '401', '0'),
('4013', '', 'Other Income', '401', '0'),
('5011', '', 'Foreign Exchange Variance', '501', '0'),
('5012', '', 'Discount Given', '501', '0'),
('5013', '', 'Purchase Price Variance', '501', '0'),
('5014', '', 'Work In Process (WIP)', '501', '0'),
('5015', '', 'Discount Received', '501', '0'),
('5016', '', 'Cost of Good Sold', '501', '0'),
('5017', '', 'Profit &amp; Loss', '501', '0'),
('50211', '', 'Interest &amp; Bank Charges', '5021', '0'),
('502110', '', 'Shezor Maintenance A/c.  (Admin)', '5021', '0'),
('502111', '', 'Fuel &amp; Fare  (Admin)', '5021', '0'),
('502112', '', 'Commission Exp. A/c.  (Admin)', '5021', '0'),
('502113', '', 'Medical &amp; Employment Benefit', '5021', '0'),
('502114', '', 'Computer &amp; Acessories  (Admin)', '5021', '0'),
('502115', '', 'Internet Charges  (Admin)', '5021', '0'),
('502116', '', 'Printing &amp; Stationary Expenses  (Admin)', '5021', '0'),
('502117', '', 'Charity &amp; Donation  (Admin)', '5021', '0'),
('502118', '', 'Misc. Expenses -  (Admin)', '5021', '0'),
('50212', '', 'Dues &amp; Membership', '5021', '0'),
('50213', '', 'Office Supplies', '5021', '0'),
('50214', '', 'Boarding &amp; Lodging  / Business Trip (Admin)', '5021', '0'),
('50215', '', 'ERP Software (DYS)', '5021', '0'),
('50216', '', 'Office Repair &amp; Maintenance A/c. (Admin)', '5021', '0'),
('50217', '', 'New Offce Shiftting Exp  (Admin)', '5021', '0'),
('50218', '', 'Equipment Maintenance A/c.  (Admin)', '5021', '0'),
('50219', '', 'Refreshment &amp; Entertainment  (Admin)', '5021', '0'),
('50221', '', 'KFR-6487 / Target 70', '5022', '0'),
('50222', '', 'KEF 6679 / Metro 70 (Malik Manzoor) Admin', '5022', '0'),
('50223', '', 'Naeem Bike (Admin)', '5022', '0'),
('50224', '', 'KGP 8201 (Union Star) - Rizwan Shoukat (Admin)', '5022', '0'),
('50225', '', 'KEP 4375 - (Dhoom 70) Javed Gill (Admin)', '5022', '0'),
('50226', '', 'KGE 6063 - (Unique 70) /Raja Khalil (Admin)', '5022', '0'),
('50227', '', 'KKB 9570 / Road Prince (Ameen AKhtar) / Admin', '5022', '0'),
('50228', '', 'KDY 5669 / Unique 70 (Admin)', '5022', '0'),
('50229', '', 'Salman Shoukat Bike (Admin)', '5022', '0'),
('50231', '', 'LB997434 (Workshop Electric Expense)', '5023', '0'),
('50232', '', 'LB183317 - Office Electric Expense (Admin)', '5023', '0'),
('50233', '', 'LB183316 - Office Electric Expense (Admin)', '5023', '0'),
('50234', '', 'LB183315 - Office Electric Expense (Admin)', '5023', '0'),
('50235', '', 'LA678965 - Office Electric Expense (Admin)', '5023', '0'),
('50236', '', 'LA871339 - Workshop Electric Expense - 2 (Admin)', '5023', '0'),
('50241', '', '0300-8268465 - Munim Saeed', '5024', '0'),
('502410', '', '0333-0323011  - Zaki Khan', '5024', '0'),
('502411', '', '0333-0323026 - Sarfraz James', '5024', '0'),
('502412', '', '0300-0200573 - Syed Atiq Ur Rehman', '5024', '0'),
('502413', '', '0302-8222807 - Salman Shoukat', '5024', '0'),
('502414', '', '0300-0997851 - Salahuddin Sb (Isb)', '5024', '0'),
('502415', '', '0300-0200548 - Ameen Akhtar', '5024', '0'),
('502416', '', '0300-0200564 - Munim Saeed', '5024', '0'),
('502417', '', '0300-0996949 - Sufyan Anwar', '5024', '0'),
('502418', '', '0300-0200592 - Fahad Khan', '5024', '0'),
('50242', '', '0333-0323003 - Rizwan Shoukat', '5024', '0'),
('50243', '', '0333-0323004 - Khurram Shoukat', '5024', '0'),
('50244', '', '0333-0323006 - Raja Khalil', '5024', '0'),
('50245', '', '0333-0323009 - Malik Manzoor', '5024', '0'),
('50246', '', '0333-0323010 - Ahmer Khan', '5024', '0'),
('50247', '', '0333-0323034 - Javed Iqbal Gill', '5024', '0'),
('50248', '', '0333-0323048 - Nabeel Aslam', '5024', '0'),
('50249', '', '0333-0323035 - Salman Shoukat', '5024', '0'),
('502511', '', 'Sarfraz James. (Salary Exp.) Manufacturing', '50251', '0'),
('502512', '', 'Shoaib Akram. (Salary Exp.) Manufacturing', '50251', '0'),
('502513', '', 'Abdul Moiz. (Salary Exp.) Manufacturing', '50251', '0'),
('502514', '', 'Daniyal Sohail. (Salary Exp.) Manufacturing', '50251', '0'),
('502515', '', 'Rizwan Shoukat. (Salary Exp.) Manufacturing', '50251', '0'),
('502516', '', 'Khurram Shoukat. (Salary Exp.) Manufacturing', '50251', '0'),
('502517', '', 'Ashfaq Awan. (Salary Exp.) Manufacturing', '50251', '0'),
('502518', '', 'Javed Iqbal Gill. (Salary Exp.) Manufacturing', '50251', '0'),
('502519', '', 'Aashir James. (Salary Exp.) Manufacturing', '50251', '0'),
('502521', '', 'Mughees Ahmed. (Salary Exp.) Manufacturing', '50252', '0'),
('502522', '', 'Junaid Iqbal. (Salary Exp.) Manufacturing', '50252', '0'),
('502523', '', 'Saeed. (Salary Exp.) Manufacturing', '50252', '0'),
('502524', '', 'Saeed. (Salary Exp.) Manufacturing', '50252', '0'),
('502525', '', 'Tariq Ismail. (Salary Exp.) Manufacturing', '50252', '0'),
('502526', '', 'Ghulam Abbas. (Salary Exp.) Manufacturing', '50252', '0'),
('502541', '', 'Salman Shoukat (Salary Exp.) Selling', '50254', '0'),
('502542', '', 'Ameen Akhtar. (Salary Exp.) Selling', '50254', '0'),
('502543', '', 'Shayan Ali Sarwar. (Salary Exp.) Selling', '50254', '0'),
('502571', '', 'Shahbaz Gill (Salary Exp.) Admin', '50257', '0'),
('502572', '', 'Malik Manzoor. (Salary Exp.) Admin', '50257', '0'),
('502573', '', 'Hazoor Bux (Salary Exp.) Admin', '50257', '0'),
('502574', '', 'Danish (Salary Exp.) Admin', '50257', '0'),
('502575', '', 'Malik Manzoor. (Salary Exp.) Admin', '50257', '0'),
('502576', '', 'Habib Khan. (Salary Exp.) Admin', '50257', '0'),
('502577', '', 'Muhammad Faheem. (Salary Exp.) Admin', '50257', '0'),
('502578', '', 'Riaz Hussain. (Salary Exp.) Admin', '50257', '0'),
('502579', '', 'Baqir Hassan. (Salary Exp.) Admin', '50257', '0'),
('502581', '', 'Zulkaif Saeed Bhutta. (Salary Exp.) Admin', '50258', '0'),
('502591', '', 'Syed Atiq ur Rehman. (Salary Exp.) Admin', '50259', '0'),
('50311', '', 'Fuel &amp; Fare - (Survery Expenses)', '5031', '0'),
('50312', '', 'Food Allowance - (Survery Expenses)', '5031', '0'),
('50313', '', 'Labour A/c. (Survery Expenses)', '5031', '0'),
('50314', '', 'Mobile Expense (Survey Expenses)', '5031', '0'),
('50315', '', 'Misc. Expenses -  (Survey)', '5031', '0'),
('50321', '', 'Fuel &amp; Fare - Production', '5032', '0'),
('503210', '', 'Misc. Expenses - Production', '5032', '0'),
('503211', '', 'Warehousing Expenses (Production)', '5032', '0'),
('50322', '', 'Food Allowance - (Production Expenses)', '5032', '0'),
('50323', '', 'Freight &amp; Cargo - (Production Expenses)', '5032', '0'),
('50324', '', 'Boarding &amp; Lodging - (Production Expenses)', '5032', '0'),
('50325', '', 'Duco Paint - (Production Expenses)', '5032', '0'),
('50326', '', 'Consumable Material  - (Production Expenses)', '5032', '0'),
('50327', '', 'Purchase A/c. - (Production Expenses)', '5032', '0'),
('50328', '', 'Printing Cost - (Production Expenses)', '5032', '0'),
('50329', '', 'Packing Material Expenses (Production)', '5032', '0'),
('50331', '', 'Boarding &amp; Lodging - (Execution Expenses)', '5033', '0'),
('50332', '', 'Fuel &amp; Fare  - (Execution Expenses)', '5033', '0'),
('50333', '', 'Freight &amp; Cargo  - (Execution Expenses)', '5033', '0'),
('50334', '', 'Food Allowance  - (Execution Expenses)', '5033', '0'),
('50335', '', 'Consumable Material  - (Execution Expenses)', '5033', '0'),
('50336', '', 'Labour A/c.  - (Execution Expenses)', '5033', '0'),
('50337', '', 'Misc. Expenses -  (Execution)', '5033', '0'),
('50341', '', 'Boarding &amp; Lodging - (Dismentling Expenses)', '5034', '0'),
('50342', '', 'Fuel &amp; Fare  - (Dismentling Expenses)', '5034', '0'),
('50343', '', 'Freight &amp; Cargo - (Dismentling Expenses)', '5034', '0'),
('50344', '', 'Food Allowance - (Dismentling Expenses)', '5034', '0'),
('50345', '', 'Labour A/c.  - (Dismentling Expenses)', '5034', '0'),
('50346', '', 'Warehousing Expenses (Dismentaling Expenses)', '5034', '0'),
('50351', '', 'Boarding &amp; Lodging - (Tracking/Monitoring/Reporting Exp.', '5035', '0'),
('50352', '', 'Fuel &amp; Fare  - (Tracking/Monitoring/Reporting Exp.)', '5035', '0'),
('50353', '', 'Food Allowance  - (Tracking/Monitoring/Reporting Exp.)', '5035', '0'),
('50354', '', 'Human Resources &amp; Reward (Tracking/Monitoring/Reporting ', '5035', '0');

### Structure of table `0_chart_types` ###

DROP TABLE IF EXISTS `0_chart_types`;

CREATE TABLE `0_chart_types` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_chart_types` ###

INSERT INTO `0_chart_types` VALUES
('101', 'Fixed Assests', '10', '', '0'),
('1011', 'Land and Building', '10', '101', '0'),
('1012', 'Furniture and Fixture', '10', '101', '0'),
('10121', 'Furniture and Fixture - KHI', '10', '1012', '0'),
('10122', 'Furniture and Fixture - LHE', '10', '1012', '0'),
('10123', 'Furniture and Fixture - ISB', '10', '1012', '0'),
('1013', 'Office Equipments', '10', '101', '0'),
('10131', 'Office Equipments - (Khi)', '10', '1013', '0'),
('10132', 'Office Equipments - (Lhr)', '10', '1013', '0'),
('10133', 'Office Equipments - (Isb)', '10', '1013', '0'),
('10134', 'Office Equipments - (Mux)', '10', '1013', '0'),
('1014', 'Computer &amp; Peripherals', '10', '101', '0'),
('10141', 'Computer &amp; Peripherals (Khi.)', '10', '1014', '0'),
('10142', 'Computer &amp; Peripherals (Lhr)', '10', '1014', '0'),
('10143', 'Computer &amp; Peripherals (Isb)', '10', '1014', '0'),
('10144', 'Computer &amp; Peripherals (Mux)', '10', '1014', '0'),
('1015', 'Cars &amp; Bikes', '10', '101', '0'),
('10151', 'Cars &amp; Bikes (Khi)', '10', '1015', '0'),
('10152', 'Cars &amp; Bikes (Lhr)', '10', '1015', '0'),
('10153', 'Cars &amp; Bikes (Isb)', '10', '1015', '0'),
('10154', 'Cars &amp; Bikes (Mux)', '10', '1015', '0'),
('1016', 'Plant &amp; Machinery', '10', '101', '0'),
('10161', 'Plant &amp; Machinery (Khi)', '10', '1016', '0'),
('10162', 'Plant &amp; Machinery (Lhr)', '10', '1016', '0'),
('10163', 'Plant &amp; Machinery (Isb)', '10', '1016', '0'),
('10164', 'Plant &amp; Machinery (Mux)', '10', '1016', '0'),
('1017', 'Tool &amp; Die', '10', '101', '0'),
('10171', 'Tools and Dies - (Khi)', '10', '1017', '0'),
('10172', 'Tools and Dies - (Lhr)', '10', '1017', '0'),
('10173', 'Tools and Dies - (Isb)', '10', '1017', '0'),
('102', 'Current Assets', '10', '', '0'),
('1021', 'Inventory', '10', '102', '0'),
('10211', 'Inventory (Khi)', '10', '1021', '0'),
('10212', 'Inventory (Lhr)', '10', '1021', '0'),
('10213', 'Inventory (Isb)', '10', '1021', '0'),
('1022', 'Advances', '10', '102', '0'),
('10221', 'Advances (Khi)', '10', '1022', '0'),
('10222', 'Advances (Lhr)', '10', '1022', '0'),
('10223', 'Advances - ISB', '10', '1022', '0'),
('10224', 'Withholding Taxes', '10', '1022', '0'),
('1023', 'Account Receivable', '10', '102', '0'),
('10231', 'Account Receivable Control A/c.', '10', '1023', '0'),
('1024', 'Security Deposits', '10', '102', '0'),
('10241', 'Security Deposits (Khi)', '10', '1024', '0'),
('10242', 'Security Deposits (Lhr)', '10', '1024', '0'),
('10243', 'Security Deposits (Isb)', '10', '1024', '0'),
('1025', 'Cash in Hand', '10', '102', '0'),
('10251', 'Cash In Hand (Khi)', '10', '1025', '0'),
('10252', 'Cash In Hand (Lhr)', '10', '1025', '0'),
('10253', 'Cash In Hand (Isb)', '10', '1025', '0'),
('1026', 'Banks', '10', '102', '0'),
('10261', 'Banks (Khi)', '10', '1026', '0'),
('10262', 'Banks (Lhr)', '10', '1026', '0'),
('10263', 'Banks (Isb)', '10', '1026', '0'),
('1027', 'Current Accounts - Other Companies', '10', '102', '0'),
('1028', 'Impress Account (Employees)', '10', '102', '0'),
('10281', 'Impress Account (Employees) Khi', '10', '1028', '0'),
('10282', 'Impress Account (Employees) Lhr', '10', '1028', '0'),
('10283', 'Impress Account (Employees) Isb', '10', '1028', '0'),
('1029', 'Loans &amp; Other Receivables', '10', '102', '0'),
('201', 'Long Term Liabilities', '20', '', '0'),
('2011', 'Inventors', '20', '201', '0'),
('2012', 'Loan from Other Institutions', '20', '201', '0'),
('202', 'Short Term Liabilities', '20', '', '0'),
('2021', 'Salary Payables', '20', '202', '0'),
('20211', 'Salary payable - (Khi)', '20', '2021', '0'),
('20212', 'Salary payable - (Lhr)', '20', '2021', '0'),
('20213', 'Salary payable - (Isb)', '20', '2021', '0'),
('2022', 'Rent payable', '20', '202', '0'),
('20221', 'Rent payable (Khi)', '20', '2022', '0'),
('20222', 'Rent payable (Lhr)', '20', '2022', '0'),
('20223', 'Rent payables (Isb)', '20', '2022', '0'),
('2023', 'Utility Bills payable', '20', '202', '0'),
('20231', 'Utility Bills payable - (Khi)', '20', '2023', '0'),
('20232', 'Utility Bills payable - (Lhr)', '20', '2023', '0'),
('20233', 'Utility Bills payable - (Isb)', '20', '2023', '0'),
('2024', 'Tax Payable', '20', '202', '0'),
('2025', 'Creditors', '20', '202', '0'),
('20251', 'Suppliers (Khi)', '20', '2025', '0'),
('20252', 'Services (Khi)', '20', '2025', '0'),
('20253', 'Suppliers (Lhe)', '20', '2025', '0'),
('20254', 'Services (Lhr)', '20', '2025', '0'),
('20255', 'Supplier (Isb)', '20', '2025', '0'),
('20256', 'Services (Isb)', '20', '2025', '0'),
('2026', 'Commission Payable', '20', '202', '0'),
('2027', 'Others Payable', '20', '202', '0'),
('301', 'Capital', '30', '', '0'),
('3011', 'Capital Sharing (Munim)', '30', '301', '0'),
('3012', 'Capital Sharing (Azhar Qasim)', '30', '301', '0'),
('401', 'Income', '40', '', '0'),
('4011', 'Supplies Income', '10', '401', '0'),
('501', 'Others Control Account (Exp.)', '50', '', '0'),
('502', 'Admin Expenses', '50', '', '0'),
('5021', 'Misc. Admins Expenses', '50', '502', '0'),
('5022', 'Bike Maintenance', '50', '502', '0'),
('5023', 'Electricity Expenses', '50', '502', '0'),
('5024', 'Mobile Expenses', '50', '502', '0'),
('5025', 'Salary Expenses', '50', '502', '0'),
('50251', 'Salary &amp; Allowances - Manufacturing (Khi)', '50', '5025', '0'),
('50252', 'Salary &amp; Allowances - Manufacturing (Lhr)', '50', '5025', '0'),
('50253', 'Salary &amp; Allowances - Manufacturing (Isb)', '50', '5025', '0'),
('50254', 'Salary &amp; Allowances - Selling (Khi)', '50', '5025', '0'),
('50255', 'Salary &amp; Allowances - Selling (Lhr)', '50', '5025', '0'),
('50256', 'Salary &amp; Allowances - Selling (Isb)', '50', '5025', '0'),
('50257', 'Salary &amp; Allowances - Admin (Khi)', '50', '5025', '0'),
('50258', 'Salary &amp; Allowances - Admin (Lhr)', '50', '5025', '0'),
('50259', 'Salary &amp; Allowances - Admin (Isb)', '50', '5025', '0'),
('503', 'Manufacturing Expenses', '50', '', '0'),
('5031', 'Survey Expenses', '50', '503', '0'),
('5032', 'Production Expenses', '50', '503', '0'),
('5033', 'Execution Expenses', '50', '503', '0'),
('5034', 'Dismentaling Expenses', '50', '503', '0'),
('5035', 'Tracking, Monitoring &amp; Reporting Expenses', '50', '503', '0');

### Structure of table `0_comments` ###

DROP TABLE IF EXISTS `0_comments`;

CREATE TABLE `0_comments` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci,
  KEY `type_and_id` (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_comments` ###

INSERT INTO `0_comments` VALUES
('0', '1', '2017-07-01', 'An opening balance as on 01.07.2017'),
('0', '2', '2017-08-30', 'An opening balance as on 01.07.2017'),
('0', '3', '2017-08-30', 'An opening balance as on 01.07.2017'),
('0', '4', '2017-08-30', 'An opening balance as on 01.07.2017'),
('0', '5', '2017-08-30', 'An opening balance as on 01.07.2017'),
('0', '6', '2017-08-30', 'An opening balance as on 01.07.2017'),
('0', '7', '2017-08-30', 'An opening balance as on 30.06.2017'),
('0', '8', '2017-08-30', 'An opening balance as on 30.06.2017'),
('0', '9', '2017-08-30', 'An opening balance as on 30.06.2017'),
('0', '10', '2017-08-30', 'An opening balance as on 30.06.2017'),
('0', '11', '2017-08-30', 'An opening balance as on 30.06.2017'),
('0', '12', '2017-06-30', 'Balance as on 30.06.2017'),
('0', '13', '2017-06-30', 'test'),
('0', '14', '2017-07-01', 'Test'),
('4', '1', '2017-07-01', 'Cash received from Munim Saeed Sb'),
('41', '1', '2017-07-01', 'Abid Ali ( LHR ) /Payment made to Abid Ali (Lhr) '),
('4', '2', '2017-07-01', 'From CASH IN HAND To Petty Cash Account'),
('41', '2', '2017-07-01', 'Payment made for muslim shower and WC tank maintenance '),
('41', '3', '2017-07-01', 'Payment made for tea &amp; biscuit 30.06.2017'),
('0', '15', '2017-07-01', 'Adjustment for difference in cash'),
('41', '4', '2017-07-01', 'Zaffar Hussain - 2/Cash paid to Zaffar Hussain Sb'),
('41', '5', '2017-07-01', 'Payment made to Malik Manzoor Sb'),
('0', '16', '2017-08-31', 'Balance as on 30.06.2017'),
('0', '17', '2017-08-31', 'Balance as on 30.06.2017'),
('0', '18', '2017-08-31', 'Balance as on 30.06.2017'),
('0', '19', '2017-08-31', 'Balance as on 30.06.2017'),
('0', '20', '2017-08-31', 'Balance as on 30.06.2017'),
('0', '21', '2017-08-31', 'Balance as on 30.06.2017');

### Structure of table `0_credit_status` ###

DROP TABLE IF EXISTS `0_credit_status`;

CREATE TABLE `0_credit_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason_description` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dissallow_invoices` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reason_description` (`reason_description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_credit_status` ###

INSERT INTO `0_credit_status` VALUES
('1', 'Good History', '0', '0'),
('3', 'No more work until payment received', '1', '0'),
('4', 'In liquidation', '1', '0');

### Structure of table `0_crm_categories` ###

DROP TABLE IF EXISTS `0_crm_categories`;

CREATE TABLE `0_crm_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pure technical key',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'contact type e.g. customer',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'detailed usage e.g. department',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'for category selector',
  `description` tinytext COLLATE utf8_unicode_ci NOT NULL COMMENT 'usage description',
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'nonzero for core system usage',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`action`),
  UNIQUE KEY `type_2` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_categories` ###

INSERT INTO `0_crm_categories` VALUES
('1', 'cust_branch', 'general', 'General', 'General contact data for customer branch (overrides company setting)', '1', '0'),
('2', 'cust_branch', 'invoice', 'Invoices', 'Invoice posting (overrides company setting)', '1', '0'),
('3', 'cust_branch', 'order', 'Orders', 'Order confirmation (overrides company setting)', '1', '0'),
('4', 'cust_branch', 'delivery', 'Deliveries', 'Delivery coordination (overrides company setting)', '1', '0'),
('5', 'customer', 'general', 'General', 'General contact data for customer', '1', '0'),
('6', 'customer', 'order', 'Orders', 'Order confirmation', '1', '0'),
('7', 'customer', 'delivery', 'Deliveries', 'Delivery coordination', '1', '0'),
('8', 'customer', 'invoice', 'Invoices', 'Invoice posting', '1', '0'),
('9', 'supplier', 'general', 'General', 'General contact data for supplier', '1', '0'),
('10', 'supplier', 'order', 'Orders', 'Order confirmation', '1', '0'),
('11', 'supplier', 'delivery', 'Deliveries', 'Delivery coordination', '1', '0'),
('12', 'supplier', 'invoice', 'Invoices', 'Invoice posting', '1', '0');

### Structure of table `0_crm_contacts` ###

DROP TABLE IF EXISTS `0_crm_contacts`;

CREATE TABLE `0_crm_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0' COMMENT 'foreign key to crm_contacts',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'foreign key to crm_categories',
  `action` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'foreign key to crm_categories',
  `entity_id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'entity id in related class table',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('1', '1', 'supplier', 'general', '1'),
('2', '2', 'supplier', 'general', '2'),
('3', '3', 'supplier', 'general', '3'),
('4', '4', 'supplier', 'general', '4'),
('5', '5', 'supplier', 'general', '5'),
('6', '6', 'supplier', 'general', '6'),
('7', '7', 'supplier', 'general', '7'),
('8', '8', 'supplier', 'general', '8'),
('9', '9', 'supplier', 'general', '9'),
('10', '10', 'supplier', 'general', '10'),
('11', '11', 'supplier', 'general', '11'),
('12', '12', 'supplier', 'general', '12'),
('13', '13', 'supplier', 'general', '13'),
('14', '14', 'supplier', 'general', '14'),
('15', '15', 'supplier', 'general', '15'),
('16', '16', 'supplier', 'general', '16'),
('17', '17', 'supplier', 'general', '17'),
('18', '18', 'supplier', 'general', '18'),
('19', '19', 'supplier', 'general', '19'),
('20', '20', 'supplier', 'general', '20'),
('21', '21', 'supplier', 'general', '21'),
('22', '22', 'supplier', 'general', '22'),
('23', '23', 'supplier', 'general', '23'),
('24', '24', 'supplier', 'general', '24'),
('25', '25', 'supplier', 'general', '25'),
('26', '26', 'supplier', 'general', '26'),
('27', '27', 'supplier', 'general', '27'),
('28', '28', 'supplier', 'general', '28'),
('29', '29', 'supplier', 'general', '29'),
('30', '30', 'supplier', 'general', '30'),
('31', '31', 'supplier', 'general', '31'),
('32', '32', 'supplier', 'general', '32'),
('33', '33', 'supplier', 'general', '33'),
('34', '34', 'supplier', 'general', '34'),
('35', '35', 'supplier', 'general', '35'),
('36', '36', 'supplier', 'general', '36'),
('37', '37', 'supplier', 'general', '37'),
('38', '38', 'supplier', 'general', '38'),
('39', '39', 'supplier', 'general', '39'),
('40', '40', 'supplier', 'general', '40'),
('41', '41', 'supplier', 'general', '41'),
('42', '42', 'supplier', 'general', '42'),
('43', '43', 'supplier', 'general', '43'),
('44', '44', 'supplier', 'general', '44'),
('45', '45', 'supplier', 'general', '45'),
('46', '46', 'supplier', 'general', '46'),
('47', '47', 'supplier', 'general', '47'),
('48', '48', 'supplier', 'general', '48'),
('49', '49', 'supplier', 'general', '49'),
('50', '50', 'supplier', 'general', '50'),
('51', '51', 'supplier', 'general', '51'),
('52', '52', 'supplier', 'general', '52'),
('53', '53', 'supplier', 'general', '53'),
('54', '54', 'supplier', 'general', '54'),
('55', '55', 'supplier', 'general', '55'),
('56', '56', 'cust_branch', 'general', '1'),
('57', '56', 'customer', 'general', '1'),
('59', '58', 'cust_branch', 'general', '3'),
('60', '58', 'customer', 'general', '2'),
('61', '59', 'cust_branch', 'general', '4'),
('62', '59', 'customer', 'general', '3'),
('63', '60', 'cust_branch', 'general', '5'),
('64', '60', 'customer', 'general', '4'),
('65', '61', 'cust_branch', 'general', '6'),
('66', '61', 'customer', 'general', '5'),
('67', '62', 'cust_branch', 'general', '7'),
('68', '62', 'customer', 'general', '6');

### Structure of table `0_crm_persons` ###

DROP TABLE IF EXISTS `0_crm_persons`;

CREATE TABLE `0_crm_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `name2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('2', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('3', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('4', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('5', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('6', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('7', 'A to Z Computer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('8', 'Abid Acrylic Works', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('9', 'Abid Wood Works', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('10', 'Air Condition Services', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('11', 'Akif (Paster)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('12', 'Altaf', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('13', 'AQ Printer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('14', 'Arabian Engg. &amp; Services', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('15', 'Arabian Engg. &amp; Services', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('16', 'Aurangzeb (Transporter)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('17', 'Boxygen', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('18', 'Decent Baloons', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('19', 'DYS', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('20', 'Farhan Khan (Carpentor)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('21', 'Graphic Media', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('22', 'Hermain Travells', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('23', 'Hub &amp; Co', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('24', 'Jeco', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('25', 'Johan (Pvt.) Ltd', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('26', 'Khalil (Carpentor)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('27', 'Khan Printer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('28', 'Liaquat (Shezor)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('29', 'Mirza Raza', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('30', 'Mirza Shahzad Rasul', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('31', 'Mubeen Wall Mount', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('32', 'Muhammad Amin (GST)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('33', 'Naveed (paster)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('34', 'Nawab Autos', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('35', 'Naveed (Suzuki)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('36', 'Nisar', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('37', 'RK Traders', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('38', 'Sabri  Plastic Store (Isb)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('39', 'Sabri  Plastic Store (Khi)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('40', 'Sabri  Plastic Store (Lhr)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('41', 'Sagheer &amp; Sadheer Water Su', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('42', 'Salman Abbas (3D Designer)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('43', 'Star Plastic Works', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('44', 'Sunny Advertising', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('45', 'Total Express', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('46', 'Zaffar Hussain', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('47', 'Zaffar Hussain - 2', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('48', 'Farhan Khan - 2 (Carpentor)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('49', 'Khalil - 2 (Carpentor)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('50', 'Zaki Khan', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('51', 'Zahid Advertiser', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('52', 'Zahid Advertiser', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('53', 'Basheer &amp; Sons', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('54', 'Super Carpet Centre', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('55', 'Travells Smooth', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('56', 'P&amp;G', 'Procter &amp; Gamble Pakistan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('57', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('58', 'RB', 'Reckitt Benckiser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('59', 'CBL', 'Continental Biscuits Limited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('60', 'Pepsi', 'Pepsi Cola Int&#039;l (Pvt.) Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('61', 'Print Point', 'Print Point PK (Pvt.) Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('62', 'Gul Ahmed', 'Gul Ahmed', NULL, 'Karachi', NULL, NULL, NULL, NULL, NULL, '', '0');

### Structure of table `0_currencies` ###

DROP TABLE IF EXISTS `0_currencies`;

CREATE TABLE `0_currencies` (
  `currency` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hundreds_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`curr_abrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_currencies` ###

INSERT INTO `0_currencies` VALUES
('Pakistani Rupee', 'PKR', 'Rs.', 'Pakistan', 'Paisa', '0', '0'),
('US Dollars', 'USD', '$', 'United States', 'Cents', '0', '0');

### Structure of table `0_cust_allocations` ###

DROP TABLE IF EXISTS `0_cust_allocations`;

CREATE TABLE `0_cust_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `amt` double unsigned DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trans_type_from` (`person_id`,`trans_type_from`,`trans_no_from`,`trans_type_to`,`trans_no_to`),
  KEY `From` (`trans_type_from`,`trans_no_from`),
  KEY `To` (`trans_type_to`,`trans_no_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_allocations` ###


### Structure of table `0_cust_branch` ###

DROP TABLE IF EXISTS `0_cust_branch`;

CREATE TABLE `0_cust_branch` (
  `branch_code` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `br_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `branch_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `br_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `area` int(11) DEFAULT NULL,
  `salesman` int(11) NOT NULL DEFAULT '0',
  `default_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_group_id` int(11) DEFAULT NULL,
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receivables_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_ship_via` int(11) NOT NULL DEFAULT '1',
  `br_post_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `group_no` int(11) NOT NULL DEFAULT '0',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `bank_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`branch_code`,`debtor_no`),
  KEY `branch_ref` (`branch_ref`),
  KEY `group_no` (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('1', '1', 'Procter &amp; Gamble Pakistan', 'P&amp;G', '', '1', '1', 'DEF', '1', '', '5012', '102311', '5012', '1', '', '0', '', NULL, '0'),
('3', '2', 'Reckitt Benckiser', 'RB', '', '1', '1', 'DEF', '1', '', '5012', '102312', '5012', '1', '', '0', '', NULL, '0'),
('4', '3', 'Continental Biscuits Limited', 'CBL', '', '1', '1', 'DEF', '1', '', '5012', '102314', '5012', '1', '', '0', '', NULL, '0'),
('5', '4', 'Pepsi Cola Int&#039;l (Pvt.) Ltd', 'Pepsi', '', '1', '1', 'DEF', '1', '', '5012', '102315', '5012', '1', '', '0', '', NULL, '0'),
('6', '5', 'Print Point PK (Pvt.) Ltd', 'Print Point', '', '1', '1', 'DEF', '1', '', '5012', '102316', '5012', '1', '', '0', '', NULL, '0'),
('7', '6', 'Gul Ahmed', 'Gul Ahmed', 'Karachi', '1', '1', 'DEF', '1', '', '5012', '102313', '5012', '1', 'Karachi', '0', '', NULL, '0');

### Structure of table `0_dashboard_reminders` ###

DROP TABLE IF EXISTS `0_dashboard_reminders`;

CREATE TABLE `0_dashboard_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `next_date` date NOT NULL,
  `description` text,
  `frequency` varchar(20) NOT NULL,
  `param` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

### Data of table `0_dashboard_reminders` ###


### Structure of table `0_dashboard_widgets` ###

DROP TABLE IF EXISTS `0_dashboard_widgets`;

CREATE TABLE `0_dashboard_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app` varchar(50) NOT NULL,
  `column_id` int(11) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `collapsed` tinyint(1) NOT NULL,
  `widget` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `param` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ;

### Data of table `0_dashboard_widgets` ###

INSERT INTO `0_dashboard_widgets` VALUES
('1', '1', 'AP', '1', '1', '0', 'weeklysales', 'Top 10 Sales Weeks', '{&quot;top&quot;:&quot;10&quot;,&quot;orderby&quot;:&quot;Gross Sales&quot;,&quot;orderby_seq&quot;:&quot;desc&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;dm.payment_terms = -1&quot;}'),
('2', '1', 'AP', '1', '0', '0', 'weeklysales', 'Weekly Sales', '{&quot;top&quot;:&quot;&quot;,&quot;orderby&quot;:&quot;Week End&quot;,&quot;orderby_seq&quot;:&quot;asc&quot;,&quot;graph_type&quot;:&quot;LineChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('3', '1', 'AP', '2', '1', '0', 'weeklysales', 'Lowest weeks sales', '{&quot;top&quot;:&quot;10&quot;,&quot;orderby&quot;:&quot;Gross Sales&quot;,&quot;orderby_seq&quot;:&quot;asc&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('6', '1', 'AP', '2', '0', '0', 'dailysales', 'Daily Sales', '{&quot;top&quot;:&quot;10&quot;,&quot;data_filter&quot;:&quot;dm.payment_terms = -1&quot;,&quot;graph_type&quot;:&quot;LineChart&quot;}'),
('7', '1', 'orders', '1', '0', '0', 'customers', 'Top 10 Customers', '{&quot;top&quot;:&quot;10&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;Table&quot;}'),
('9', '1', 'orders', '1', '1', '0', 'salesinvoices', 'Overdue invoices', '{&quot;data_filter&quot;:&quot;&quot;}'),
('10', '1', 'AP', '1', '0', '0', 'suppliers', 'Top 10 Suppliers', '{&quot;top&quot;:&quot;&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;Table&quot;}'),
('11', '1', 'AP', '2', '0', '0', 'suppliers', 'Top 10 Suppliers', '{&quot;top&quot;:&quot;&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;ColumnChart&quot;}'),
('12', '1', 'GL', '2', '1', '0', 'glreturn', 'Return', '{&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('13', '1', 'GL', '2', '0', '0', 'glreturn', 'Return', '{&quot;graph_type&quot;:&quot;PieChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('14', '1', 'stock', '1', '0', '0', 'items', 'Top 10 Items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;stock&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('15', '1', 'stock', '2', '0', '0', 'items', 'Top 10 Items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;stock&quot;,&quot;graph_type&quot;:&quot;PieChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('16', '1', 'manuf', '1', '0', '0', 'items', 'Top 10 items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;manuf&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('17', '1', 'manuf', '2', '0', '0', 'items', 'Top 10 Items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;manuf&quot;,&quot;graph_type&quot;:&quot;PieChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('18', '1', 'orders', '2', '0', '0', 'customers', 'Top 10 Customers', '{&quot;top&quot;:&quot;&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;ColumnChart&quot;}'),
('19', '1', 'GL', '2', '2', '0', 'bankbalances', 'Bank Balances', '{&quot;data_filter&quot;:&quot;&quot;}'),
('20', '1', 'GL', '1', '1', '0', 'dailybankbalances', 'Daily Current Account Balance', '{&quot;days_past&quot;:&quot;&quot;,&quot;days_future&quot;:&quot;&quot;,&quot;bank_act&quot;:&quot;0&quot;,&quot;graph_type&quot;:&quot;ColumnChart&quot;}'),
('21', '1', 'GL', '1', '0', '0', 'banktransactions', 'Current Account Transactions', '{&quot;days_past&quot;:&quot;15&quot;,&quot;days_future&quot;:&quot;15&quot;,&quot;bank_act&quot;:&quot;0&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('22', '2', 'AP', '1', '1', '0', 'weeklysales', 'Top 10 Sales Weeks', '{&quot;top&quot;:&quot;10&quot;,&quot;orderby&quot;:&quot;Gross Sales&quot;,&quot;orderby_seq&quot;:&quot;desc&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;dm.payment_terms = -1&quot;}'),
('23', '2', 'AP', '1', '0', '0', 'weeklysales', 'Weekly Sales', '{&quot;top&quot;:&quot;&quot;,&quot;orderby&quot;:&quot;Week End&quot;,&quot;orderby_seq&quot;:&quot;asc&quot;,&quot;graph_type&quot;:&quot;LineChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('24', '2', 'AP', '2', '1', '0', 'weeklysales', 'Lowest weeks sales', '{&quot;top&quot;:&quot;10&quot;,&quot;orderby&quot;:&quot;Gross Sales&quot;,&quot;orderby_seq&quot;:&quot;asc&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('25', '2', 'AP', '2', '0', '0', 'dailysales', 'Daily Sales', '{&quot;top&quot;:&quot;10&quot;,&quot;data_filter&quot;:&quot;dm.payment_terms = -1&quot;,&quot;graph_type&quot;:&quot;LineChart&quot;}'),
('26', '2', 'orders', '1', '0', '0', 'customers', 'Top 10 Customers', '{&quot;top&quot;:&quot;10&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;Table&quot;}'),
('27', '2', 'orders', '1', '1', '0', 'salesinvoices', 'Overdue invoices', '{&quot;data_filter&quot;:&quot;&quot;}'),
('28', '2', 'AP', '1', '0', '0', 'suppliers', 'Top 10 Suppliers', '{&quot;top&quot;:&quot;&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;Table&quot;}'),
('29', '2', 'AP', '2', '0', '0', 'suppliers', 'Top 10 Suppliers', '{&quot;top&quot;:&quot;&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;ColumnChart&quot;}'),
('30', '2', 'GL', '2', '1', '0', 'glreturn', 'Return', '{&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('31', '2', 'GL', '2', '0', '0', 'glreturn', 'Return', '{&quot;graph_type&quot;:&quot;PieChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('32', '2', 'stock', '1', '0', '0', 'items', 'Top 10 Items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;stock&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('33', '2', 'stock', '2', '0', '0', 'items', 'Top 10 Items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;stock&quot;,&quot;graph_type&quot;:&quot;PieChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('34', '2', 'manuf', '1', '0', '0', 'items', 'Top 10 items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;manuf&quot;,&quot;graph_type&quot;:&quot;Table&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('35', '2', 'manuf', '2', '0', '0', 'items', 'Top 10 Items', '{&quot;top&quot;:&quot;&quot;,&quot;item_type&quot;:&quot;manuf&quot;,&quot;graph_type&quot;:&quot;PieChart&quot;,&quot;data_filter&quot;:&quot;&quot;}'),
('36', '2', 'orders', '2', '0', '0', 'customers', 'Top 10 Customers', '{&quot;top&quot;:&quot;&quot;,&quot;data_filter&quot;:&quot;&quot;,&quot;graph_type&quot;:&quot;ColumnChart&quot;}'),
('37', '2', 'GL', '2', '2', '0', 'bankbalances', 'Bank Balances', '{&quot;data_filter&quot;:&quot;&quot;}'),
('38', '2', 'GL', '1', '1', '0', 'dailybankbalances', 'Daily Current Account Balance', '{&quot;days_past&quot;:&quot;&quot;,&quot;days_future&quot;:&quot;&quot;,&quot;bank_act&quot;:&quot;0&quot;,&quot;graph_type&quot;:&quot;ColumnChart&quot;}'),
('39', '2', 'GL', '1', '0', '0', 'banktransactions', 'Current Account Transactions', '{&quot;days_past&quot;:&quot;15&quot;,&quot;days_future&quot;:&quot;15&quot;,&quot;bank_act&quot;:&quot;0&quot;,&quot;data_filter&quot;:&quot;&quot;}');

### Structure of table `0_debtor_trans` ###

DROP TABLE IF EXISTS `0_debtor_trans`;

CREATE TABLE `0_debtor_trans` (
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `debtor_no` int(11) unsigned DEFAULT NULL,
  `branch_code` int(11) NOT NULL DEFAULT '-1',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tpe` int(11) NOT NULL DEFAULT '0',
  `order_` int(11) NOT NULL DEFAULT '0',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `gst_wh` double NOT NULL,
  `ov_freight` double NOT NULL DEFAULT '0',
  `ov_freight_tax` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  `ship_via` int(11) DEFAULT NULL,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `tax_included` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `supply_disc` int(11) NOT NULL,
  `service_disc` int(11) NOT NULL,
  `fbr_disc` int(11) NOT NULL,
  `srb_disc` int(11) NOT NULL,
  `write_back` int(11) NOT NULL,
  `supply_tax_id` int(11) NOT NULL,
  `service_tax_id` int(11) NOT NULL,
  `fbr_tax_id` int(11) NOT NULL,
  `srb_tax_id` int(11) NOT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `debtor_no` (`debtor_no`,`branch_code`),
  KEY `tran_date` (`tran_date`),
  KEY `order_` (`order_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans` ###

INSERT INTO `0_debtor_trans` VALUES
('12', '0', '1', '1', '1', '2017-06-30', '0000-00-00', '003/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('16', '0', '1', '1', '1', '2017-06-30', '0000-00-00', '003/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('17', '0', '1', '1', '1', '2017-06-30', '0000-00-00', '003/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('18', '0', '1', '1', '1', '2017-06-30', '0000-00-00', '007/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('19', '0', '1', '1', '1', '2017-06-30', '0000-00-00', '007/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('20', '0', '1', '1', '1', '2017-06-30', '0000-00-00', '003/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21', '0', '0', '1', '1', '2017-06-30', '0000-00-00', '003/2017', '0', '0', '353925', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('28', '0', '1', '1', '1', '2017-08-31', '0000-00-00', '0011', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

### Structure of table `0_debtor_trans_details` ###

DROP TABLE IF EXISTS `0_debtor_trans_details`;

CREATE TABLE `0_debtor_trans_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debtor_trans_no` int(11) DEFAULT NULL,
  `debtor_trans_type` int(11) DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  `standard_cost` double NOT NULL DEFAULT '0',
  `qty_done` double NOT NULL DEFAULT '0',
  `src_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  KEY `src_id` (`src_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans_details` ###


### Structure of table `0_debtors_master` ###

DROP TABLE IF EXISTS `0_debtors_master`;

CREATE TABLE `0_debtors_master` (
  `debtor_no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `debtor_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci,
  `tax_id` varchar(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ntn_no` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type` int(11) NOT NULL DEFAULT '1',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `credit_status` int(11) NOT NULL DEFAULT '0',
  `payment_terms` int(11) DEFAULT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `pymt_discount` double NOT NULL DEFAULT '0',
  `credit_limit` float NOT NULL DEFAULT '1000',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('1', 'Procter &amp; Gamble Pakistan', 'P&amp;G', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('2', 'Reckitt Benckiser', 'RB', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('3', 'Continental Biscuits Limited', 'CBL', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('4', 'Pepsi Cola Int&#039;l (Pvt.) Ltd', 'Pepsi', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('5', 'Print Point PK (Pvt.) Ltd', 'Print Point', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('6', 'Gul Ahmed', 'Gul Ahmed', 'Karachi', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0');

### Structure of table `0_dimensions` ###

DROP TABLE IF EXISTS `0_dimensions`;

CREATE TABLE `0_dimensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_` tinyint(1) NOT NULL DEFAULT '1',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `date_` (`date_`),
  KEY `due_date` (`due_date`),
  KEY `type_` (`type_`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_dimensions` ###

INSERT INTO `0_dimensions` VALUES
('1', 'KHI', 'Karachi', '1', '0', '2017-08-30', '2017-09-19'),
('2', 'LHE', 'Lahore', '1', '0', '2017-08-30', '2017-09-19'),
('3', 'ISB', 'Islamabad', '1', '0', '2017-08-30', '2017-09-19');

### Structure of table `0_exchange_rates` ###

DROP TABLE IF EXISTS `0_exchange_rates`;

CREATE TABLE `0_exchange_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curr_code` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate_buy` double NOT NULL DEFAULT '0',
  `rate_sell` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `curr_code` (`curr_code`,`date_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_exchange_rates` ###

INSERT INTO `0_exchange_rates` VALUES
('2', 'USD', '105', '105', '2017-02-17');

### Structure of table `0_fiscal_year` ###

DROP TABLE IF EXISTS `0_fiscal_year`;

CREATE TABLE `0_fiscal_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin` date DEFAULT '0000-00-00',
  `end` date DEFAULT '0000-00-00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `begin` (`begin`),
  UNIQUE KEY `end` (`end`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_fiscal_year` ###

INSERT INTO `0_fiscal_year` VALUES
('1', '2015-07-01', '2016-06-30', '0'),
('2', '2016-07-01', '2017-06-30', '0'),
('3', '2017-07-01', '2018-06-30', '0');

### Structure of table `0_gl_trans` ###

DROP TABLE IF EXISTS `0_gl_trans`;

CREATE TABLE `0_gl_trans` (
  `counter` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `type_no` int(11) NOT NULL DEFAULT '0',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  `person_type_id` int(11) DEFAULT NULL,
  `person_id` tinyblob,
  `cheque` int(11) NOT NULL,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1095 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###

INSERT INTO `0_gl_trans` VALUES
('1', '0', '1', '2017-07-01', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('2', '0', '1', '2017-07-01', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('3', '0', '1', '2017-07-01', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('4', '0', '1', '2017-07-01', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('5', '0', '1', '2017-07-01', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('6', '0', '1', '2017-07-01', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('7', '0', '1', '2017-07-01', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('8', '0', '1', '2017-07-01', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('9', '0', '1', '2017-07-01', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('10', '0', '1', '2017-07-01', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('11', '0', '1', '2017-07-01', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('12', '0', '1', '2017-07-01', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('13', '0', '1', '2017-07-01', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('14', '0', '1', '2017-07-01', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('15', '0', '1', '2017-07-01', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('16', '0', '1', '2017-07-01', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('17', '0', '1', '2017-07-01', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('18', '0', '1', '2017-07-01', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('99', '0', '2', '2017-07-01', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('100', '0', '2', '2017-07-01', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('101', '0', '2', '2017-07-01', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('102', '0', '2', '2017-07-01', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('103', '0', '2', '2017-07-01', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('104', '0', '2', '2017-07-01', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('105', '0', '2', '2017-07-01', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('106', '0', '2', '2017-07-01', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('107', '0', '2', '2017-07-01', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('108', '0', '2', '2017-07-01', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('109', '0', '2', '2017-07-01', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('110', '0', '2', '2017-07-01', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('111', '0', '2', '2017-07-01', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('112', '0', '2', '2017-07-01', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('113', '0', '2', '2017-07-01', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('114', '0', '2', '2017-07-01', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('115', '0', '2', '2017-07-01', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('116', '0', '2', '2017-07-01', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('117', '0', '2', '2017-07-01', '10111', '', '0', '0', '0', NULL, NULL, '0'),
('197', '0', '3', '2017-07-01', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('198', '0', '3', '2017-07-01', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('199', '0', '3', '2017-07-01', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('200', '0', '3', '2017-07-01', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('201', '0', '3', '2017-07-01', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('202', '0', '3', '2017-07-01', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('203', '0', '3', '2017-07-01', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('204', '0', '3', '2017-07-01', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('205', '0', '3', '2017-07-01', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('206', '0', '3', '2017-07-01', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('207', '0', '3', '2017-07-01', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('208', '0', '3', '2017-07-01', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('209', '0', '3', '2017-07-01', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('210', '0', '3', '2017-07-01', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('211', '0', '3', '2017-07-01', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('212', '0', '3', '2017-07-01', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('213', '0', '3', '2017-07-01', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('214', '0', '3', '2017-07-01', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('215', '0', '3', '2017-07-01', '10111', '', '0', '0', '0', NULL, NULL, '0'),
('216', '0', '4', '2017-07-01', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('217', '0', '4', '2017-07-01', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('218', '0', '4', '2017-07-01', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('219', '0', '4', '2017-07-01', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('220', '0', '4', '2017-07-01', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('221', '0', '4', '2017-07-01', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('222', '0', '4', '2017-07-01', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('223', '0', '4', '2017-07-01', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('224', '0', '4', '2017-07-01', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('225', '0', '4', '2017-07-01', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('226', '0', '4', '2017-07-01', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('227', '0', '4', '2017-07-01', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('228', '0', '4', '2017-07-01', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('229', '0', '4', '2017-07-01', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('230', '0', '4', '2017-07-01', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('231', '0', '4', '2017-07-01', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('232', '0', '4', '2017-07-01', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('233', '0', '4', '2017-07-01', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('234', '0', '4', '2017-07-01', '10111', '', '0', '0', '0', NULL, NULL, '0'),
('235', '0', '4', '2017-07-01', '101211', '', '0', '0', '0', NULL, NULL, '0'),
('236', '0', '5', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('237', '0', '5', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('238', '0', '5', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('239', '0', '5', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('240', '0', '5', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('241', '0', '5', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('242', '0', '5', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('243', '0', '5', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('244', '0', '5', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('245', '0', '5', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('246', '0', '5', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('247', '0', '5', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('248', '0', '5', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('249', '0', '5', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('250', '0', '5', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('251', '0', '5', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('252', '0', '5', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('253', '0', '5', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('254', '0', '5', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('255', '0', '5', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('256', '0', '5', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('257', '0', '5', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('258', '0', '5', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('259', '0', '5', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('260', '0', '5', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('261', '0', '5', '2017-06-30', '10111', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('262', '0', '6', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('263', '0', '6', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('264', '0', '6', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('265', '0', '6', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('266', '0', '6', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('267', '0', '6', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('268', '0', '6', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('269', '0', '6', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('270', '0', '6', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('271', '0', '6', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('272', '0', '6', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('273', '0', '6', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('274', '0', '6', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('275', '0', '6', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('276', '0', '6', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('277', '0', '6', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('278', '0', '6', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('279', '0', '6', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('280', '0', '6', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('281', '0', '6', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('282', '0', '6', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('283', '0', '6', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('284', '0', '6', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('285', '0', '6', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('286', '0', '6', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('287', '0', '6', '2017-06-30', '101432', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('288', '0', '6', '2017-06-30', '101511', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('289', '0', '6', '2017-06-30', '101515', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('290', '0', '6', '2017-06-30', '101516', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('291', '0', '6', '2017-06-30', '101531', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('292', '0', '6', '2017-06-30', '101532', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('293', '0', '6', '2017-06-30', '101611', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('294', '0', '6', '2017-06-30', '101612', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('295', '0', '6', '2017-06-30', '101613', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('296', '0', '6', '2017-06-30', '101614', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('297', '0', '6', '2017-06-30', '101615', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('298', '0', '6', '2017-06-30', '10111', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('299', '0', '7', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('300', '0', '7', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('301', '0', '7', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('302', '0', '7', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('303', '0', '7', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('304', '0', '7', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('305', '0', '7', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('306', '0', '7', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('307', '0', '7', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('308', '0', '7', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('309', '0', '7', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('310', '0', '7', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('311', '0', '7', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('312', '0', '7', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('313', '0', '7', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('314', '0', '7', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('315', '0', '7', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('316', '0', '7', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('317', '0', '7', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('318', '0', '7', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('319', '0', '7', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('320', '0', '7', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('321', '0', '7', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('322', '0', '7', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('323', '0', '7', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('324', '0', '7', '2017-06-30', '101432', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('325', '0', '7', '2017-06-30', '101511', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('326', '0', '7', '2017-06-30', '101515', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('327', '0', '7', '2017-06-30', '101516', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('328', '0', '7', '2017-06-30', '101531', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('329', '0', '7', '2017-06-30', '101532', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('330', '0', '7', '2017-06-30', '101611', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('331', '0', '7', '2017-06-30', '101612', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('332', '0', '7', '2017-06-30', '101613', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('333', '0', '7', '2017-06-30', '101614', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('334', '0', '7', '2017-06-30', '101615', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('335', '0', '7', '2017-06-30', '101616', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('336', '0', '7', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('337', '0', '7', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('338', '0', '7', '2017-06-30', '101623', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('339', '0', '7', '2017-06-30', '101631', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('340', '0', '7', '2017-06-30', '101632', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('341', '0', '7', '2017-06-30', '101641', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('342', '0', '7', '2017-06-30', '102211', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('343', '0', '7', '2017-06-30', '102212', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('344', '0', '7', '2017-06-30', '102213', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('345', '0', '7', '2017-06-30', '102214', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('346', '0', '7', '2017-06-30', '102215', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('347', '0', '7', '2017-06-30', '102216', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('348', '0', '7', '2017-06-30', '102415', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('349', '0', '7', '2017-06-30', '102421', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('350', '0', '7', '2017-06-30', '102431', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('351', '0', '7', '2017-06-30', '102432', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('352', '0', '7', '2017-06-30', '102511', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('353', '0', '7', '2017-06-30', '102512', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('354', '0', '7', '2017-06-30', '102521', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('355', '0', '7', '2017-06-30', '102531', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('356', '0', '7', '2017-06-30', '102611', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('357', '0', '7', '2017-06-30', '102613', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('358', '0', '7', '2017-06-30', '102614', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('359', '0', '7', '2017-06-30', '102615', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('360', '0', '7', '2017-06-30', '10272', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('361', '0', '7', '2017-06-30', '10111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('362', '0', '8', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('363', '0', '8', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('364', '0', '8', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('365', '0', '8', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('366', '0', '8', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('367', '0', '8', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('368', '0', '8', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('369', '0', '8', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('370', '0', '8', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('371', '0', '8', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('372', '0', '8', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('373', '0', '8', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('374', '0', '8', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('375', '0', '8', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('376', '0', '8', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('377', '0', '8', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('378', '0', '8', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('379', '0', '8', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('380', '0', '8', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('381', '0', '8', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('382', '0', '8', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('383', '0', '8', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('384', '0', '8', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('385', '0', '8', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('386', '0', '8', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('387', '0', '8', '2017-06-30', '101432', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('388', '0', '8', '2017-06-30', '101511', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('389', '0', '8', '2017-06-30', '101515', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('390', '0', '8', '2017-06-30', '101516', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('391', '0', '8', '2017-06-30', '101531', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('392', '0', '8', '2017-06-30', '101532', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('393', '0', '8', '2017-06-30', '101611', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('394', '0', '8', '2017-06-30', '101612', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('395', '0', '8', '2017-06-30', '101613', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('396', '0', '8', '2017-06-30', '101614', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('397', '0', '8', '2017-06-30', '101615', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('398', '0', '8', '2017-06-30', '101616', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('399', '0', '8', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('400', '0', '8', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('401', '0', '8', '2017-06-30', '101623', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('402', '0', '8', '2017-06-30', '101631', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('403', '0', '8', '2017-06-30', '101632', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('404', '0', '8', '2017-06-30', '101641', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('405', '0', '8', '2017-06-30', '102211', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('406', '0', '8', '2017-06-30', '102212', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('407', '0', '8', '2017-06-30', '102213', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('408', '0', '8', '2017-06-30', '102214', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('409', '0', '8', '2017-06-30', '102215', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('410', '0', '8', '2017-06-30', '102216', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('411', '0', '8', '2017-06-30', '102415', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('412', '0', '8', '2017-06-30', '102421', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('413', '0', '8', '2017-06-30', '102431', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('414', '0', '8', '2017-06-30', '102432', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('415', '0', '8', '2017-06-30', '102511', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('416', '0', '8', '2017-06-30', '102512', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('417', '0', '8', '2017-06-30', '102521', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('418', '0', '8', '2017-06-30', '102531', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('419', '0', '8', '2017-06-30', '102611', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('420', '0', '8', '2017-06-30', '102613', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('421', '0', '8', '2017-06-30', '102614', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('422', '0', '8', '2017-06-30', '102615', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('423', '0', '8', '2017-06-30', '10272', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('424', '0', '8', '2017-06-30', '10273', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('425', '0', '8', '2017-06-30', '10278', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('426', '0', '8', '2017-06-30', '10279', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('427', '0', '8', '2017-06-30', '10280', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('428', '0', '8', '2017-06-30', '10282', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('429', '0', '8', '2017-06-30', '102813', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('430', '0', '8', '2017-06-30', '102814', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('431', '0', '8', '2017-06-30', '102815', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('432', '0', '8', '2017-06-30', '102816', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('433', '0', '8', '2017-06-30', '10291', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('434', '0', '8', '2017-06-30', '10292', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('435', '0', '8', '2017-06-30', '10293', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('436', '0', '8', '2017-06-30', '10294', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('437', '0', '8', '2017-06-30', '20111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('438', '0', '8', '2017-06-30', '20113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('439', '0', '8', '2017-06-30', '20115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('440', '0', '8', '2017-06-30', '20117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('441', '0', '8', '2017-06-30', '202111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('442', '0', '8', '2017-06-30', '2021111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('443', '0', '8', '2017-06-30', '2021112', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('444', '0', '8', '2017-06-30', '2021113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('445', '0', '8', '2017-06-30', '2021114', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('446', '0', '8', '2017-06-30', '2021115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('447', '0', '8', '2017-06-30', '2021116', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('448', '0', '8', '2017-06-30', '2021117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('449', '0', '8', '2017-06-30', '2021118', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('450', '0', '8', '2017-06-30', '2021119', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('451', '0', '8', '2017-06-30', '202112', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('452', '0', '8', '2017-06-30', '10111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('453', '0', '9', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('454', '0', '9', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('455', '0', '9', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('456', '0', '9', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('457', '0', '9', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('458', '0', '9', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('459', '0', '9', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('460', '0', '9', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('461', '0', '9', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('462', '0', '9', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('463', '0', '9', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('464', '0', '9', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('465', '0', '9', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('466', '0', '9', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('467', '0', '9', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('468', '0', '9', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('469', '0', '9', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('470', '0', '9', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('471', '0', '9', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('472', '0', '9', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('473', '0', '9', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('474', '0', '9', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('475', '0', '9', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('476', '0', '9', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('477', '0', '9', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('478', '0', '9', '2017-06-30', '101432', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('479', '0', '9', '2017-06-30', '101511', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('480', '0', '9', '2017-06-30', '101515', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('481', '0', '9', '2017-06-30', '101516', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('482', '0', '9', '2017-06-30', '101531', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('483', '0', '9', '2017-06-30', '101532', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('484', '0', '9', '2017-06-30', '101611', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('485', '0', '9', '2017-06-30', '101612', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('486', '0', '9', '2017-06-30', '101613', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('487', '0', '9', '2017-06-30', '101614', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('488', '0', '9', '2017-06-30', '101615', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('489', '0', '9', '2017-06-30', '101616', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('490', '0', '9', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('491', '0', '9', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('492', '0', '9', '2017-06-30', '101623', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('493', '0', '9', '2017-06-30', '101631', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('494', '0', '9', '2017-06-30', '101632', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('495', '0', '9', '2017-06-30', '101641', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('496', '0', '9', '2017-06-30', '102211', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('497', '0', '9', '2017-06-30', '102212', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('498', '0', '9', '2017-06-30', '102213', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('499', '0', '9', '2017-06-30', '102214', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('500', '0', '9', '2017-06-30', '102215', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('501', '0', '9', '2017-06-30', '102216', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('502', '0', '9', '2017-06-30', '102415', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('503', '0', '9', '2017-06-30', '102421', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('504', '0', '9', '2017-06-30', '102431', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('505', '0', '9', '2017-06-30', '102432', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('506', '0', '9', '2017-06-30', '102511', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('507', '0', '9', '2017-06-30', '102512', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('508', '0', '9', '2017-06-30', '102521', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('509', '0', '9', '2017-06-30', '102531', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('510', '0', '9', '2017-06-30', '102611', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('511', '0', '9', '2017-06-30', '102613', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('512', '0', '9', '2017-06-30', '102614', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('513', '0', '9', '2017-06-30', '102615', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('514', '0', '9', '2017-06-30', '10272', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('515', '0', '9', '2017-06-30', '10273', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('516', '0', '9', '2017-06-30', '10278', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('517', '0', '9', '2017-06-30', '10279', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('518', '0', '9', '2017-06-30', '10280', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('519', '0', '9', '2017-06-30', '10282', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('520', '0', '9', '2017-06-30', '102813', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('521', '0', '9', '2017-06-30', '102814', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('522', '0', '9', '2017-06-30', '102815', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('523', '0', '9', '2017-06-30', '102816', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('524', '0', '9', '2017-06-30', '10291', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('525', '0', '9', '2017-06-30', '10292', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('526', '0', '9', '2017-06-30', '10293', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('527', '0', '9', '2017-06-30', '10294', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('528', '0', '9', '2017-06-30', '20111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('529', '0', '9', '2017-06-30', '20113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('530', '0', '9', '2017-06-30', '20115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('531', '0', '9', '2017-06-30', '20117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('532', '0', '9', '2017-06-30', '202111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('533', '0', '9', '2017-06-30', '2021111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('534', '0', '9', '2017-06-30', '2021112', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('535', '0', '9', '2017-06-30', '2021113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('536', '0', '9', '2017-06-30', '2021114', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('537', '0', '9', '2017-06-30', '2021115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('538', '0', '9', '2017-06-30', '2021116', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('539', '0', '9', '2017-06-30', '2021117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('540', '0', '9', '2017-06-30', '2021118', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('541', '0', '9', '2017-06-30', '2021119', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('542', '0', '9', '2017-06-30', '202112', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('543', '0', '9', '2017-06-30', '2021120', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('544', '0', '9', '2017-06-30', '2021121', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('545', '0', '9', '2017-06-30', '2021122', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('546', '0', '9', '2017-06-30', '202113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('547', '0', '9', '2017-06-30', '202114', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('548', '0', '9', '2017-06-30', '202115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('549', '0', '9', '2017-06-30', '202116', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('550', '0', '9', '2017-06-30', '202117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('551', '0', '9', '2017-06-30', '202118', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('552', '0', '9', '2017-06-30', '202119', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('553', '0', '9', '2017-06-30', '202120', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('554', '0', '9', '2017-06-30', '202121', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('555', '0', '9', '2017-06-30', '202122', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('556', '0', '9', '2017-06-30', '202123', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('557', '0', '9', '2017-06-30', '202124', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('558', '0', '9', '2017-06-30', '202131', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('559', '0', '9', '2017-06-30', '202132', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('560', '0', '9', '2017-06-30', '202133', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('561', '0', '9', '2017-06-30', '3011', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('688', '0', '10', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('689', '0', '10', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('690', '0', '10', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('691', '0', '10', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('692', '0', '10', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('693', '0', '10', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '0', '1', '0', NULL, NULL, '0'),
('694', '0', '10', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('695', '0', '10', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('696', '0', '10', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('697', '0', '10', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('698', '0', '10', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('699', '0', '10', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('700', '0', '10', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('701', '0', '10', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('702', '0', '10', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('703', '0', '10', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('704', '0', '10', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('705', '0', '10', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '0', '2', '0', NULL, NULL, '0'),
('706', '0', '10', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('707', '0', '10', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('708', '0', '10', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('709', '0', '10', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '0', '1', '0', NULL, NULL, '0'),
('710', '0', '10', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('711', '0', '10', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('712', '0', '10', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('713', '0', '10', '2017-06-30', '101432', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('714', '0', '10', '2017-06-30', '101511', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('715', '0', '10', '2017-06-30', '101515', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('716', '0', '10', '2017-06-30', '101516', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('717', '0', '10', '2017-06-30', '101531', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('718', '0', '10', '2017-06-30', '101532', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('719', '0', '10', '2017-06-30', '101611', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('720', '0', '10', '2017-06-30', '101612', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('721', '0', '10', '2017-06-30', '101613', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('722', '0', '10', '2017-06-30', '101614', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('723', '0', '10', '2017-06-30', '101615', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('724', '0', '10', '2017-06-30', '101616', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('725', '0', '10', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('726', '0', '10', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('727', '0', '10', '2017-06-30', '101623', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('728', '0', '10', '2017-06-30', '101631', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('729', '0', '10', '2017-06-30', '101632', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0'),
('730', '0', '10', '2017-06-30', '101641', 'An opening balance as on 01.07.2017	', '0', '0', '0', NULL, NULL, '0');
INSERT INTO `0_gl_trans` VALUES
('731', '0', '10', '2017-06-30', '102211', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('732', '0', '10', '2017-06-30', '102212', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('733', '0', '10', '2017-06-30', '102213', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('734', '0', '10', '2017-06-30', '102214', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('735', '0', '10', '2017-06-30', '102215', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('736', '0', '10', '2017-06-30', '102216', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('737', '0', '10', '2017-06-30', '102415', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('738', '0', '10', '2017-06-30', '102421', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('739', '0', '10', '2017-06-30', '102431', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('740', '0', '10', '2017-06-30', '102432', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('741', '0', '10', '2017-06-30', '102511', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('742', '0', '10', '2017-06-30', '102512', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('743', '0', '10', '2017-06-30', '102521', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('744', '0', '10', '2017-06-30', '102531', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('745', '0', '10', '2017-06-30', '102611', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('746', '0', '10', '2017-06-30', '102613', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('747', '0', '10', '2017-06-30', '102614', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('748', '0', '10', '2017-06-30', '102615', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('749', '0', '10', '2017-06-30', '10272', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('750', '0', '10', '2017-06-30', '10273', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('751', '0', '10', '2017-06-30', '10278', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('752', '0', '10', '2017-06-30', '10279', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('753', '0', '10', '2017-06-30', '10280', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('754', '0', '10', '2017-06-30', '10282', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('755', '0', '10', '2017-06-30', '102813', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('756', '0', '10', '2017-06-30', '102814', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('757', '0', '10', '2017-06-30', '102815', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('758', '0', '10', '2017-06-30', '102816', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('759', '0', '10', '2017-06-30', '10291', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('760', '0', '10', '2017-06-30', '10292', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('761', '0', '10', '2017-06-30', '10293', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('762', '0', '10', '2017-06-30', '10294', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('763', '0', '10', '2017-06-30', '20111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('764', '0', '10', '2017-06-30', '20113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('765', '0', '10', '2017-06-30', '20115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('766', '0', '10', '2017-06-30', '20117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('767', '0', '10', '2017-06-30', '202111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('768', '0', '10', '2017-06-30', '2021111', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('769', '0', '10', '2017-06-30', '2021112', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('770', '0', '10', '2017-06-30', '2021113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('771', '0', '10', '2017-06-30', '2021114', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('772', '0', '10', '2017-06-30', '2021115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('773', '0', '10', '2017-06-30', '2021116', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('774', '0', '10', '2017-06-30', '2021117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('775', '0', '10', '2017-06-30', '2021118', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('776', '0', '10', '2017-06-30', '2021119', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('777', '0', '10', '2017-06-30', '202112', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('778', '0', '10', '2017-06-30', '2021120', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('779', '0', '10', '2017-06-30', '2021121', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('780', '0', '10', '2017-06-30', '2021122', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('781', '0', '10', '2017-06-30', '202113', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('782', '0', '10', '2017-06-30', '202114', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('783', '0', '10', '2017-06-30', '202115', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('784', '0', '10', '2017-06-30', '202116', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('785', '0', '10', '2017-06-30', '202117', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('786', '0', '10', '2017-06-30', '202118', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('787', '0', '10', '2017-06-30', '202119', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('788', '0', '10', '2017-06-30', '202120', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('789', '0', '10', '2017-06-30', '202121', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('790', '0', '10', '2017-06-30', '202122', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('791', '0', '10', '2017-06-30', '202123', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('792', '0', '10', '2017-06-30', '202124', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('793', '0', '10', '2017-06-30', '202131', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('794', '0', '10', '2017-06-30', '202132', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('795', '0', '10', '2017-06-30', '202133', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('796', '0', '10', '2017-06-30', '3011', 'An opening balance as on 30.06.2017	', '0', '0', '0', NULL, NULL, '0'),
('797', '0', '11', '2017-06-30', '10111', 'An opening balance as on 01.07.2017', '600000', '1', '0', NULL, NULL, '0'),
('798', '0', '11', '2017-06-30', '101211', 'An opening balance as on 01.07.2017', '640658', '1', '0', NULL, NULL, '0'),
('799', '0', '11', '2017-06-30', '101212', 'An opening balance as on 01.07.2017', '364750', '1', '0', NULL, NULL, '0'),
('800', '0', '11', '2017-06-30', '101221', 'An opening balance as on 01.07.2017', '296000', '2', '0', NULL, NULL, '0'),
('801', '0', '11', '2017-06-30', '101311', 'An opening balance as on 01.07.2017', '1001658', '1', '0', NULL, NULL, '0'),
('802', '0', '11', '2017-06-30', '101312', 'An opening balance as on 01.07.2017', '565000', '1', '0', NULL, NULL, '0'),
('803', '0', '11', '2017-06-30', '101321', 'An opening balance as on 01.07.2017', '117000', '2', '0', NULL, NULL, '0'),
('804', '0', '11', '2017-06-30', '101322', 'An opening balance as on 01.07.2017', '250000', '2', '0', NULL, NULL, '0'),
('805', '0', '11', '2017-06-30', '101323', 'An opening balance as on 01.07.2017', '4600', '2', '0', NULL, NULL, '0'),
('806', '0', '11', '2017-06-30', '101324', 'An opening balance as on 01.07.2017', '80200', '2', '0', NULL, NULL, '0'),
('807', '0', '11', '2017-06-30', '101325', 'An opening balance as on 01.07.2017', '29000', '2', '0', NULL, NULL, '0'),
('808', '0', '11', '2017-06-30', '101326', 'An opening balance as on 01.07.2017', '5105', '2', '0', NULL, NULL, '0'),
('809', '0', '11', '2017-06-30', '101327', 'An opening balance as on 01.07.2017', '4650', '2', '0', NULL, NULL, '0'),
('810', '0', '11', '2017-06-30', '101328', 'An opening balance as on 01.07.2017', '3400', '2', '0', NULL, NULL, '0'),
('811', '0', '11', '2017-06-30', '101329', 'An opening balance as on 01.07.2017', '4600', '2', '0', NULL, NULL, '0'),
('812', '0', '11', '2017-06-30', '101330', 'An opening balance as on 01.07.2017', '4200', '2', '0', NULL, NULL, '0'),
('813', '0', '11', '2017-06-30', '101331', 'An opening balance as on 01.07.2017', '6000', '2', '0', NULL, NULL, '0'),
('814', '0', '11', '2017-06-30', '101332', 'An opening balance as on 01.07.2017', '5500', '2', '0', NULL, NULL, '0'),
('815', '0', '11', '2017-06-30', '101341', 'An opening balance as on 01.07.2017	', '55000', '0', '0', NULL, NULL, '0'),
('816', '0', '11', '2017-06-30', '101411', 'An opening balance as on 01.07.2017	', '1189500', '1', '0', NULL, NULL, '0'),
('817', '0', '11', '2017-06-30', '101412', 'An opening balance as on 01.07.2017	', '259300', '0', '0', NULL, NULL, '0'),
('818', '0', '11', '2017-06-30', '101413', 'An opening balance as on 01.07.2017	', '51700', '1', '0', NULL, NULL, '0'),
('819', '0', '11', '2017-06-30', '101421', 'An opening balance as on 01.07.2017	', '44980', '0', '0', NULL, NULL, '0'),
('820', '0', '11', '2017-06-30', '101422', 'An opening balance as on 01.07.2017	', '81000', '0', '0', NULL, NULL, '0'),
('821', '0', '11', '2017-06-30', '101423', 'An opening balance as on 01.07.2017	', '3500', '0', '0', NULL, NULL, '0'),
('822', '0', '11', '2017-06-30', '101432', 'An opening balance as on 01.07.2017	', '32000', '0', '0', NULL, NULL, '0'),
('823', '0', '11', '2017-06-30', '101511', 'An opening balance as on 01.07.2017	', '49000', '0', '0', NULL, NULL, '0'),
('824', '0', '11', '2017-06-30', '101515', 'An opening balance as on 01.07.2017	', '45000', '0', '0', NULL, NULL, '0'),
('825', '0', '11', '2017-06-30', '101516', 'An opening balance as on 01.07.2017	', '26000', '0', '0', NULL, NULL, '0'),
('826', '0', '11', '2017-06-30', '101531', 'An opening balance as on 01.07.2017	', '48000', '0', '0', NULL, NULL, '0'),
('827', '0', '11', '2017-06-30', '101532', 'An opening balance as on 01.07.2017	', '48000', '0', '0', NULL, NULL, '0'),
('828', '0', '11', '2017-06-30', '101611', 'An opening balance as on 01.07.2017	', '1800000', '0', '0', NULL, NULL, '0'),
('829', '0', '11', '2017-06-30', '101612', 'An opening balance as on 01.07.2017	', '2400000', '0', '0', NULL, NULL, '0'),
('830', '0', '11', '2017-06-30', '101613', 'An opening balance as on 01.07.2017	', '900000', '0', '0', NULL, NULL, '0'),
('831', '0', '11', '2017-06-30', '101614', 'An opening balance as on 01.07.2017	', '1812268', '0', '0', NULL, NULL, '0'),
('832', '0', '11', '2017-06-30', '101615', 'An opening balance as on 01.07.2017	', '650000', '0', '0', NULL, NULL, '0'),
('833', '0', '11', '2017-06-30', '101616', 'An opening balance as on 01.07.2017	', '810000', '0', '0', NULL, NULL, '0'),
('834', '0', '11', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '1649816', '0', '0', NULL, NULL, '0'),
('835', '0', '11', '2017-06-30', '101621', 'An opening balance as on 01.07.2017	', '1200000', '0', '0', NULL, NULL, '0'),
('836', '0', '11', '2017-06-30', '101623', 'An opening balance as on 01.07.2017	', '160000', '0', '0', NULL, NULL, '0'),
('837', '0', '11', '2017-06-30', '101631', 'An opening balance as on 01.07.2017	', '1400000', '0', '0', NULL, NULL, '0'),
('838', '0', '11', '2017-06-30', '101632', 'An opening balance as on 01.07.2017	', '1900000', '0', '0', NULL, NULL, '0'),
('839', '0', '11', '2017-06-30', '101641', 'An opening balance as on 01.07.2017	', '1400000', '0', '0', NULL, NULL, '0'),
('840', '0', '11', '2017-06-30', '102211', 'An opening balance as on 30.06.2017	', '10000', '0', '0', NULL, NULL, '0'),
('841', '0', '11', '2017-06-30', '102212', 'An opening balance as on 30.06.2017	', '10300', '0', '0', NULL, NULL, '0'),
('842', '0', '11', '2017-06-30', '102213', 'An opening balance as on 30.06.2017	', '300750', '0', '0', NULL, NULL, '0'),
('843', '0', '11', '2017-06-30', '102214', 'An opening balance as on 30.06.2017	', '504080', '0', '0', NULL, NULL, '0'),
('844', '0', '11', '2017-06-30', '102215', 'An opening balance as on 30.06.2017	', '25000', '0', '0', NULL, NULL, '0'),
('845', '0', '11', '2017-06-30', '102216', 'An opening balance as on 30.06.2017	', '20000', '0', '0', NULL, NULL, '0'),
('846', '0', '11', '2017-06-30', '102415', 'An opening balance as on 30.06.2017	', '20000', '0', '0', NULL, NULL, '0'),
('847', '0', '11', '2017-06-30', '102421', 'An opening balance as on 30.06.2017	', '200000', '0', '0', NULL, NULL, '0'),
('848', '0', '11', '2017-06-30', '102431', 'An opening balance as on 30.06.2017	', '130000', '0', '0', NULL, NULL, '0'),
('849', '0', '11', '2017-06-30', '102432', 'An opening balance as on 30.06.2017	', '100000', '0', '0', NULL, NULL, '0'),
('850', '0', '11', '2017-06-30', '102511', 'An opening balance as on 30.06.2017	', '-15611', '0', '0', NULL, NULL, '0'),
('851', '0', '11', '2017-06-30', '102512', 'An opening balance as on 30.06.2017	', '-389', '0', '0', NULL, NULL, '0'),
('852', '0', '11', '2017-06-30', '102521', 'An opening balance as on 30.06.2017	', '-30391', '0', '0', NULL, NULL, '0'),
('853', '0', '11', '2017-06-30', '102531', 'An opening balance as on 30.06.2017	', '20000', '0', '0', NULL, NULL, '0'),
('854', '0', '11', '2017-06-30', '102611', 'An opening balance as on 30.06.2017	', '221', '0', '0', NULL, NULL, '0'),
('855', '0', '11', '2017-06-30', '102613', 'An opening balance as on 30.06.2017	', '3000', '0', '0', NULL, NULL, '0'),
('856', '0', '11', '2017-06-30', '102614', 'An opening balance as on 30.06.2017	', '404', '0', '0', NULL, NULL, '0'),
('857', '0', '11', '2017-06-30', '102615', 'An opening balance as on 30.06.2017	', '5000', '0', '0', NULL, NULL, '0'),
('858', '0', '11', '2017-06-30', '10272', 'An opening balance as on 30.06.2017	', '545108', '0', '0', NULL, NULL, '0'),
('859', '0', '11', '2017-06-30', '10273', 'An opening balance as on 30.06.2017	', '-441089', '0', '0', NULL, NULL, '0'),
('860', '0', '11', '2017-06-30', '10278', 'An opening balance as on 30.06.2017	', '800', '0', '0', NULL, NULL, '0'),
('861', '0', '11', '2017-06-30', '10279', 'An opening balance as on 30.06.2017	', '34', '0', '0', NULL, NULL, '0'),
('862', '0', '11', '2017-06-30', '10280', 'An opening balance as on 30.06.2017	', '342', '0', '0', NULL, NULL, '0'),
('863', '0', '11', '2017-06-30', '10282', 'An opening balance as on 30.06.2017	', '883', '0', '0', NULL, NULL, '0'),
('864', '0', '11', '2017-06-30', '102813', 'An opening balance as on 30.06.2017	', '-4095', '0', '0', NULL, NULL, '0'),
('865', '0', '11', '2017-06-30', '102814', 'An opening balance as on 30.06.2017	', '-3300', '0', '0', NULL, NULL, '0'),
('866', '0', '11', '2017-06-30', '102815', 'An opening balance as on 30.06.2017	', '-1312', '0', '0', NULL, NULL, '0'),
('867', '0', '11', '2017-06-30', '102816', 'An opening balance as on 30.06.2017	', '-7321', '0', '0', NULL, NULL, '0'),
('868', '0', '11', '2017-06-30', '10291', 'An opening balance as on 30.06.2017	', '350000', '0', '0', NULL, NULL, '0'),
('869', '0', '11', '2017-06-30', '10292', 'An opening balance as on 30.06.2017	', '42500', '0', '0', NULL, NULL, '0'),
('870', '0', '11', '2017-06-30', '10293', 'An opening balance as on 30.06.2017	', '592850', '0', '0', NULL, NULL, '0'),
('871', '0', '11', '2017-06-30', '10294', 'An opening balance as on 30.06.2017	', '101000', '0', '0', NULL, NULL, '0'),
('872', '0', '11', '2017-06-30', '20111', 'An opening balance as on 30.06.2017	', '-1000000', '0', '0', NULL, NULL, '0'),
('873', '0', '11', '2017-06-30', '20113', 'An opening balance as on 30.06.2017	', '-1000000', '0', '0', NULL, NULL, '0'),
('874', '0', '11', '2017-06-30', '20115', 'An opening balance as on 30.06.2017	', '-615000', '0', '0', NULL, NULL, '0'),
('875', '0', '11', '2017-06-30', '20117', 'An opening balance as on 30.06.2017	', '-2257000', '0', '0', NULL, NULL, '0'),
('876', '0', '11', '2017-06-30', '202111', 'An opening balance as on 30.06.2017	', '-113000', '0', '0', NULL, NULL, '0'),
('877', '0', '11', '2017-06-30', '2021111', 'An opening balance as on 30.06.2017	', '-19000', '0', '0', NULL, NULL, '0'),
('878', '0', '11', '2017-06-30', '2021112', 'An opening balance as on 30.06.2017	', '-16000', '0', '0', NULL, NULL, '0'),
('879', '0', '11', '2017-06-30', '2021113', 'An opening balance as on 30.06.2017	', '-18000', '0', '0', NULL, NULL, '0'),
('880', '0', '11', '2017-06-30', '2021114', 'An opening balance as on 30.06.2017	', '-42000', '0', '0', NULL, NULL, '0'),
('881', '0', '11', '2017-06-30', '2021115', 'An opening balance as on 30.06.2017	', '-31600', '0', '0', NULL, NULL, '0'),
('882', '0', '11', '2017-06-30', '2021116', 'An opening balance as on 30.06.2017	', '-46250', '0', '0', NULL, NULL, '0'),
('883', '0', '11', '2017-06-30', '2021117', 'An opening balance as on 30.06.2017	', '-64700', '0', '0', NULL, NULL, '0'),
('884', '0', '11', '2017-06-30', '2021118', 'An opening balance as on 30.06.2017	', '-57750', '0', '0', NULL, NULL, '0'),
('885', '0', '11', '2017-06-30', '2021119', 'An opening balance as on 30.06.2017	', '-44750', '0', '0', NULL, NULL, '0'),
('886', '0', '11', '2017-06-30', '202112', 'An opening balance as on 30.06.2017	', '-10000', '0', '0', NULL, NULL, '0'),
('887', '0', '11', '2017-06-30', '2021120', 'An opening balance as on 30.06.2017	', '-34800', '0', '0', NULL, NULL, '0'),
('888', '0', '11', '2017-06-30', '2021121', 'An opening balance as on 30.06.2017	', '-10800', '0', '0', NULL, NULL, '0'),
('889', '0', '11', '2017-06-30', '2021122', 'An opening balance as on 30.06.2017	', '-4667', '0', '0', NULL, NULL, '0'),
('890', '0', '11', '2017-06-30', '202113', 'An opening balance as on 30.06.2017	', '-15000', '0', '0', NULL, NULL, '0'),
('891', '0', '11', '2017-06-30', '202114', 'An opening balance as on 30.06.2017	', '-14000', '0', '0', NULL, NULL, '0'),
('892', '0', '11', '2017-06-30', '202115', 'An opening balance as on 30.06.2017	', '-36000', '0', '0', NULL, NULL, '0'),
('893', '0', '11', '2017-06-30', '202116', 'An opening balance as on 30.06.2017	', '-100000', '0', '0', NULL, NULL, '0'),
('894', '0', '11', '2017-06-30', '202117', 'An opening balance as on 30.06.2017	', '-32000', '0', '0', NULL, NULL, '0'),
('895', '0', '11', '2017-06-30', '202118', 'An opening balance as on 30.06.2017	', '-30000', '0', '0', NULL, NULL, '0'),
('896', '0', '11', '2017-06-30', '202119', 'An opening balance as on 30.06.2017	', '-70000', '0', '0', NULL, NULL, '0'),
('897', '0', '11', '2017-06-30', '202120', 'An opening balance as on 30.06.2017	', '-54000', '0', '0', NULL, NULL, '0'),
('898', '0', '11', '2017-06-30', '202121', 'An opening balance as on 30.06.2017	', '-840500', '0', '0', NULL, NULL, '0'),
('899', '0', '11', '2017-06-30', '202122', 'An opening balance as on 30.06.2017	', '-28646', '0', '0', NULL, NULL, '0'),
('900', '0', '11', '2017-06-30', '202123', 'An opening balance as on 30.06.2017	', '-71823', '0', '0', NULL, NULL, '0'),
('901', '0', '11', '2017-06-30', '202124', 'An opening balance as on 30.06.2017	', '-22000', '0', '0', NULL, NULL, '0'),
('902', '0', '11', '2017-06-30', '202131', 'An opening balance as on 30.06.2017	', '-175000', '0', '0', NULL, NULL, '0'),
('903', '0', '11', '2017-06-30', '202132', 'An opening balance as on 30.06.2017	', '-85000', '0', '0', NULL, NULL, '0'),
('904', '0', '11', '2017-06-30', '202133', 'An opening balance as on 30.06.2017	', '-44400', '0', '0', NULL, NULL, '0'),
('905', '0', '11', '2017-06-30', '202211', 'An opening balance as on 30.06.2017 ', '-959246', '0', '0', NULL, NULL, '0'),
('906', '0', '11', '2017-06-30', '202221', 'An opening balance as on 30.06.2017 ', '-5000', '0', '0', NULL, NULL, '0'),
('907', '0', '11', '2017-06-30', '202231', 'An opening balance as on 30.06.2017 ', '-15000', '0', '0', NULL, NULL, '0'),
('908', '0', '11', '2017-06-30', '202311', 'An opening balance as on 30.06.2017 ', '-61118', '0', '0', NULL, NULL, '0'),
('909', '0', '11', '2017-06-30', '202314', 'An opening balance as on 30.06.2017 ', '-23218', '0', '0', NULL, NULL, '0'),
('910', '0', '11', '2017-06-30', '202315', 'An opening balance as on 30.06.2017 ', '-45756', '0', '0', NULL, NULL, '0'),
('911', '0', '11', '2017-06-30', '202316', 'An opening balance as on 30.06.2017 ', '-6045', '0', '0', NULL, NULL, '0'),
('912', '0', '11', '2017-06-30', '20241', 'An opening balance as on 30.06.2017 ', '-34767', '0', '0', NULL, NULL, '0'),
('913', '0', '11', '2017-06-30', '20261', 'An opening balance as on 30.06.2017 ', '-279742', '0', '0', NULL, NULL, '0'),
('914', '0', '11', '2017-06-30', '20262', 'An opening balance as on 30.06.2017 ', '-15000', '0', '0', NULL, NULL, '0'),
('915', '0', '11', '2017-06-30', '20271', 'An opening balance as on 30.06.2017 ', '-20900', '0', '0', NULL, NULL, '0'),
('916', '0', '11', '2017-06-30', '20272', 'An opening balance as on 30.06.2017 ', '-1137910', '0', '0', '3', '32', '0'),
('917', '0', '11', '2017-06-30', '3011', 'An opening balance as on 30.06.2017 ', '-14868761', '0', '0', NULL, NULL, '0'),
('930', '0', '12', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('931', '0', '12', '2017-06-30', '3011', 'Balance as on 30.06.2017', '0', '0', '0', NULL, NULL, '0'),
('947', '0', '13', '2017-06-30', '202511', 'test', '-10000', '0', '0', '3', '6', '0'),
('948', '0', '13', '2017-06-30', '3011', 'test', '10000', '0', '0', NULL, NULL, '0'),
('949', '20', '1', '2017-07-10', '202511', '', '-1200', '0', '0', '3', '6', '0'),
('950', '20', '1', '2017-07-10', '4011', 'key board &amp; mouse', '1200', '1', '0', NULL, NULL, '0'),
('955', '0', '14', '2017-07-01', '102513', 'Test', '1000000', '0', '0', NULL, NULL, '0'),
('956', '0', '14', '2017-07-01', '3011', 'Test', '-1000000', '0', '0', NULL, NULL, '0'),
('957', '4', '1', '2017-07-01', '102513', 'From Munim Saeed To Cash in Hand KHI', '-48000', '0', '0', NULL, NULL, '0'),
('958', '4', '1', '2017-07-01', '102511', 'From Munim Saeed To Cash in Hand KHI', '48000', '0', '0', NULL, NULL, '0'),
('959', '41', '1', '2017-07-01', '202531', 'Abid Ali ( LHR ) /Payment made to Abid Ali (Lhr) ', '20000', '0', '0', '0', NULL, '0'),
('960', '41', '1', '2017-07-01', '102511', 'Abid Ali ( LHR ) /Payment made to Abid Ali (Lhr) ', '-20000', '0', '0', NULL, NULL, '0'),
('961', '4', '2', '2017-07-01', '102511', 'From Cash in Hand KHI To Petty Cash - Fahad Khan', '-4000', '0', '0', NULL, NULL, '0'),
('962', '4', '2', '2017-07-01', '102512', 'From Cash in Hand KHI To Petty Cash - Fahad Khan', '4000', '0', '0', NULL, NULL, '0'),
('963', '41', '2', '2017-07-01', '502118', 'Payment made for muslim shower and WC tank maintenance ', '500', '0', '0', NULL, NULL, '0'),
('964', '41', '2', '2017-07-01', '102511', 'Payment made for muslim shower and WC tank maintenance ', '-500', '0', '0', NULL, NULL, '0'),
('965', '41', '3', '2017-07-01', '50219', 'Payment made for tea &amp; biscuit 30.06.2017', '65', '0', '0', NULL, NULL, '0'),
('966', '41', '3', '2017-07-01', '102511', 'Payment made for tea &amp; biscuit 30.06.2017', '-65', '0', '0', NULL, NULL, '0'),
('967', '0', '15', '2017-07-01', '102511', 'Adjustment for difference in cash', '16176', '0', '0', NULL, NULL, '0'),
('968', '0', '15', '2017-07-01', '20273', 'Adjustment for difference in cash', '-16176', '0', '0', NULL, NULL, '0'),
('969', '41', '4', '2017-07-01', '2025211', 'Zaffar Hussain - 2/Cash paid to Zaffar Hussain Sb', '23000', '0', '0', '0', NULL, '0'),
('970', '41', '4', '2017-07-01', '102511', 'Zaffar Hussain - 2/Cash paid to Zaffar Hussain Sb', '-23000', '0', '0', NULL, NULL, '0'),
('971', '41', '5', '2017-07-01', '102812', 'Payment made to Malik Manzoor Sb', '1000', '0', '0', NULL, NULL, '0'),
('972', '41', '5', '2017-07-01', '102511', 'Payment made to Malik Manzoor Sb', '-1000', '0', '0', NULL, NULL, '0'),
('973', '0', '16', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('974', '0', '16', '2017-06-30', '3011', 'Balance as on 30.06.2017', '0', '0', '0', NULL, NULL, '0'),
('978', '0', '17', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('979', '0', '17', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('980', '0', '17', '2017-06-30', '3011', 'Balance as on 30.06.2017', '0', '0', '0', NULL, NULL, '0'),
('987', '0', '18', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('988', '0', '18', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('989', '0', '18', '2017-06-30', '3011', 'Balance as on 30.06.2017', '0', '0', '0', NULL, NULL, '0'),
('998', '0', '19', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('999', '0', '19', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('1000', '0', '19', '2017-06-30', '3011', 'Balance as on 30.06.2017', '0', '0', '0', NULL, NULL, '0'),
('1001', '0', '20', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('1002', '0', '20', '2017-06-30', '102311', 'Balance as on 30.06.2017', '0', '0', '0', '2', '1', '0'),
('1003', '0', '20', '2017-06-30', '3011', 'Balance as on 30.06.2017', '0', '0', '0', NULL, NULL, '0'),
('1004', '0', '21', '2017-06-30', '102311', 'Balance as on 30.06.2017', '353925', '0', '0', '2', '1', '0'),
('1005', '0', '21', '2017-06-30', '3011', 'Balance as on 30.06.2017', '-353925', '0', '0', NULL, NULL, '0'),
('1038', '0', '22', '2017-06-30', '10111', '', '1', '0', '0', NULL, NULL, '0'),
('1039', '0', '22', '2017-06-30', '101212', '', '-1', '0', '0', NULL, NULL, '0'),
('1040', '0', '23', '2017-06-30', '2025111', '', '0', '0', '0', '3', '25', '0'),
('1041', '0', '23', '2017-06-30', '101221', '', '0', '0', '0', NULL, NULL, '0'),
('1045', '0', '24', '2017-06-30', '2025111', '', '0', '0', '0', '3', '25', '0'),
('1046', '0', '24', '2017-06-30', '101221', '', '0', '0', '0', NULL, NULL, '0'),
('1047', '0', '25', '2017-06-30', '2025111', '', '0', '0', '0', '3', '25', '0'),
('1048', '0', '25', '2017-06-30', '101221', '', '0', '0', '0', NULL, NULL, '0'),
('1052', '0', '26', '2017-06-30', '2025111', '', '44153', '0', '0', '3', '25', '0'),
('1053', '0', '26', '2017-06-30', '101221', '', '-44153', '0', '0', NULL, NULL, '0'),
('1078', '0', '27', '2017-08-31', '10111', '', '0', '0', '0', NULL, NULL, '0'),
('1079', '0', '27', '2017-08-31', '101212', '', '0', '0', '0', NULL, NULL, '0'),
('1080', '0', '28', '2017-08-31', '102311', '', '0', '0', '0', '2', '1', '0'),
('1081', '0', '28', '2017-08-31', '10111', '', '0', '0', '0', NULL, NULL, '0'),
('1082', '0', '29', '2017-08-31', '2025111', '', '0', '0', '0', '3', '25', '0'),
('1083', '0', '29', '2017-08-31', '10111', '', '0', '0', '0', NULL, NULL, '0'),
('1087', '0', '30', '2017-08-31', '2025111', '', '0', '0', '0', '3', '25', '0'),
('1088', '0', '30', '2017-08-31', '10111', '', '0', '0', '0', NULL, NULL, '0');

### Structure of table `0_grn_batch` ###

DROP TABLE IF EXISTS `0_grn_batch`;

CREATE TABLE `0_grn_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `purch_order_no` int(11) DEFAULT NULL,
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` double DEFAULT '1',
  `requisition_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_date` (`delivery_date`),
  KEY `purch_order_no` (`purch_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_batch` ###


### Structure of table `0_grn_items` ###

DROP TABLE IF EXISTS `0_grn_items`;

CREATE TABLE `0_grn_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_batch_id` int(11) DEFAULT NULL,
  `po_detail_item` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_recd` double NOT NULL DEFAULT '0',
  `quantity_inv` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `grn_batch_id` (`grn_batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_items` ###


### Structure of table `0_groups` ###

DROP TABLE IF EXISTS `0_groups`;

CREATE TABLE `0_groups` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_groups` ###

INSERT INTO `0_groups` VALUES
('1', 'Small', '0'),
('2', 'Medium', '0'),
('3', 'Large', '0');

### Structure of table `0_item_codes` ###

DROP TABLE IF EXISTS `0_item_codes`;

CREATE TABLE `0_item_codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` smallint(6) unsigned NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `is_foreign` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stock_id` (`stock_id`,`item_code`),
  KEY `item_code` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###


### Structure of table `0_item_tax_type_exemptions` ###

DROP TABLE IF EXISTS `0_item_tax_type_exemptions`;

CREATE TABLE `0_item_tax_type_exemptions` (
  `item_tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_tax_type_id`,`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_tax_type_exemptions` ###


### Structure of table `0_item_tax_types` ###

DROP TABLE IF EXISTS `0_item_tax_types`;

CREATE TABLE `0_item_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `exempt` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_tax_types` ###

INSERT INTO `0_item_tax_types` VALUES
('1', 'Tax Exempt', '0', '0'),
('2', 'Taxable', '0', '0');

### Structure of table `0_item_units` ###

DROP TABLE IF EXISTS `0_item_units`;

CREATE TABLE `0_item_units` (
  `abbr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `decimals` tinyint(2) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`abbr`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_units` ###

INSERT INTO `0_item_units` VALUES
('LTRs', 'Liters', '-1', '0');

### Structure of table `0_journal` ###

DROP TABLE IF EXISTS `0_journal`;

CREATE TABLE `0_journal` (
  `type` smallint(6) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `tran_date` date DEFAULT '0000-00-00',
  `reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `source_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `event_date` date DEFAULT '0000-00-00',
  `doc_date` date NOT NULL DEFAULT '0000-00-00',
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `amount` double NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`type`,`trans_no`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_journal` ###

INSERT INTO `0_journal` VALUES
('0', '1', '2017-07-01', 'JV001/2017', '', '2017-07-01', '2017-07-01', 'PKR', '0', '1'),
('0', '2', '2017-07-01', 'JV001/2017', '', '2017-07-01', '2017-07-01', 'PKR', '0', '1'),
('0', '3', '2017-07-01', '001/2017', '', '2017-07-01', '2017-07-01', 'PKR', '0', '1'),
('0', '4', '2017-07-01', '001/2017', '', '2017-07-01', '2017-07-01', 'PKR', '0', '1'),
('0', '5', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '6', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '7', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '8', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '9', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '10', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '11', '2017-06-30', '002/2017', '', '2017-06-30', '2017-06-30', 'PKR', '24979657', '1'),
('0', '12', '2017-06-30', '003/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '13', '2017-06-30', '004/2017', '', '2017-06-30', '2017-06-30', 'PKR', '10000', '1'),
('0', '14', '2017-07-01', '005/2017', '', '2017-07-01', '2017-07-01', 'PKR', '1000000', '1'),
('0', '15', '2017-07-01', '006/2017', '', '2017-07-01', '2017-07-01', 'PKR', '16176', '1'),
('0', '16', '2017-06-30', '003/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '17', '2017-06-30', '003/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '20', '2017-06-30', '003/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '21', '2017-06-30', '003/2017', '', '2017-06-30', '2017-06-30', 'PKR', '353925', '1'),
('0', '22', '2017-06-30', '007/2017', '', '2017-06-30', '2017-06-30', 'PKR', '1', '1'),
('0', '23', '2017-06-30', '008/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '24', '2017-06-30', '008/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '25', '2017-06-30', '008/2017', '', '2017-06-30', '2017-06-30', 'PKR', '0', '1'),
('0', '26', '2017-06-30', '008/2017', '', '2017-06-30', '2017-06-30', 'PKR', '44153', '1'),
('0', '27', '2017-08-31', '0010', '', '2017-08-31', '2017-08-31', 'PKR', '0', '1'),
('0', '28', '2017-08-31', '0011', '', '2017-08-31', '2017-08-31', 'PKR', '0', '1'),
('0', '29', '2017-08-31', '0012', '', '2017-08-31', '2017-08-31', 'PKR', '0', '1'),
('0', '30', '2017-08-31', '0013', '', '2017-08-31', '2017-08-31', 'PKR', '0', '1');

### Structure of table `0_loc_stock` ###

DROP TABLE IF EXISTS `0_loc_stock`;

CREATE TABLE `0_loc_stock` (
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reorder_level` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_code`,`stock_id`),
  KEY `stock_id` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_loc_stock` ###


### Structure of table `0_locations` ###

DROP TABLE IF EXISTS `0_locations`;

CREATE TABLE `0_locations` (
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `location_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fixed_asset` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_locations` ###

INSERT INTO `0_locations` VALUES
('DEF', 'Default', 'N/A', '', '', '', '', '', '0', '0');

### Structure of table `0_movement_types` ###

DROP TABLE IF EXISTS `0_movement_types`;

CREATE TABLE `0_movement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_movement_types` ###

INSERT INTO `0_movement_types` VALUES
('1', 'Adjustment', '0'),
('2', 'Opening Balance', '0');

### Structure of table `0_payment_terms` ###

DROP TABLE IF EXISTS `0_payment_terms`;

CREATE TABLE `0_payment_terms` (
  `terms_indicator` int(11) NOT NULL AUTO_INCREMENT,
  `terms` char(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `days_before_due` smallint(6) NOT NULL DEFAULT '0',
  `day_in_following_month` smallint(6) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`terms_indicator`),
  UNIQUE KEY `terms` (`terms`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_payment_terms` ###

INSERT INTO `0_payment_terms` VALUES
('3', 'Payment due within 10 days', '10', '0', '0'),
('4', 'Cash Only', '0', '0', '0'),
('5', '90 Days', '90', '0', '0');

### Structure of table `0_prices` ###

DROP TABLE IF EXISTS `0_prices`;

CREATE TABLE `0_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sales_type_id` int(11) NOT NULL DEFAULT '0',
  `curr_abrev` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('4', '1002', '2', 'PKR', '200'),
('5', '001', '1', 'PKR', '77.72');

### Structure of table `0_print_profiles` ###

DROP TABLE IF EXISTS `0_print_profiles`;

CREATE TABLE `0_print_profiles` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`,`report`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_print_profiles` ###

INSERT INTO `0_print_profiles` VALUES
('1', 'Out of office', NULL, '0'),
('2', 'Sales Department', NULL, '0'),
('3', 'Central', NULL, '2'),
('4', 'Sales Department', '104', '2'),
('5', 'Sales Department', '105', '2'),
('6', 'Sales Department', '107', '2'),
('7', 'Sales Department', '109', '2'),
('8', 'Sales Department', '110', '2'),
('9', 'Sales Department', '201', '2');

### Structure of table `0_printers` ###

DROP TABLE IF EXISTS `0_printers`;

CREATE TABLE `0_printers` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `queue` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `host` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `port` smallint(11) unsigned NOT NULL,
  `timeout` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_printers` ###

INSERT INTO `0_printers` VALUES
('1', 'QL500', 'Label printer', 'QL500', 'server', '127', '20'),
('2', 'Samsung', 'Main network printer', 'scx4521F', 'server', '515', '5'),
('3', 'Local', 'Local print server at user IP', 'lp', '', '515', '10');

### Structure of table `0_purch_data` ###

DROP TABLE IF EXISTS `0_purch_data`;

CREATE TABLE `0_purch_data` (
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` double NOT NULL DEFAULT '0',
  `suppliers_uom` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `conversion_factor` double NOT NULL DEFAULT '1',
  `supplier_description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`supplier_id`,`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_data` ###


### Structure of table `0_purch_order_details` ###

DROP TABLE IF EXISTS `0_purch_order_details`;

CREATE TABLE `0_purch_order_details` (
  `po_detail_item` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `item_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `qty_invoiced` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `act_price` double NOT NULL DEFAULT '0',
  `std_cost_unit` double NOT NULL DEFAULT '0',
  `quantity_ordered` double NOT NULL DEFAULT '0',
  `quantity_received` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`po_detail_item`),
  KEY `order` (`order_no`,`po_detail_item`),
  KEY `itemcode` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_order_details` ###


### Structure of table `0_purch_orders` ###

DROP TABLE IF EXISTS `0_purch_orders`;

CREATE TABLE `0_purch_orders` (
  `order_no` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `requisition_no` tinytext COLLATE utf8_unicode_ci,
  `into_stock_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `pr` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `payments` int(11) NOT NULL,
  `delivery_term` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sales_tax` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`order_no`),
  KEY `ord_date` (`ord_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_orders` ###


### Structure of table `0_quick_entries` ###

DROP TABLE IF EXISTS `0_quick_entries`;

CREATE TABLE `0_quick_entries` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `usage` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_amount` double NOT NULL DEFAULT '0',
  `base_desc` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bal_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_quick_entries` ###

INSERT INTO `0_quick_entries` VALUES
('1', '1', 'Maintenance', NULL, '0', 'Amount', '0'),
('2', '4', 'Phone', NULL, '0', 'Amount', '0'),
('3', '2', 'Cash Sales', 'Retail sales without invoice', '0', 'Amount', '0');

### Structure of table `0_quick_entry_lines` ###

DROP TABLE IF EXISTS `0_quick_entry_lines`;

CREATE TABLE `0_quick_entry_lines` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `qid` smallint(6) unsigned NOT NULL,
  `amount` double DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `dest_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` smallint(6) unsigned DEFAULT NULL,
  `dimension2_id` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_quick_entry_lines` ###

INSERT INTO `0_quick_entry_lines` VALUES
('1', '1', '0', '', 't-', '1', '0', '0'),
('2', '2', '0', '', 't-', '1', '0', '0'),
('3', '3', '0', '', 't-', '1', '0', '0'),
('4', '3', '0', '', '=', '4010', '0', '0'),
('5', '1', '0', '', '=', '5765', '0', '0'),
('6', '2', '0', '', '=', '5780', '0', '0');

### Structure of table `0_recurrent_invoices` ###

DROP TABLE IF EXISTS `0_recurrent_invoices`;

CREATE TABLE `0_recurrent_invoices` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `order_no` int(11) unsigned NOT NULL,
  `debtor_no` int(11) unsigned DEFAULT NULL,
  `group_no` smallint(6) unsigned DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `monthly` int(11) NOT NULL DEFAULT '0',
  `begin` date NOT NULL DEFAULT '0000-00-00',
  `end` date NOT NULL DEFAULT '0000-00-00',
  `last_sent` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_recurrent_invoices` ###

INSERT INTO `0_recurrent_invoices` VALUES
('1', 'Weekly Maintenance', '6', '1', '1', '7', '0', '2015-04-01', '2020-05-07', '2015-04-08');

### Structure of table `0_reflines` ###

DROP TABLE IF EXISTS `0_reflines`;

CREATE TABLE `0_reflines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_type` int(11) NOT NULL,
  `prefix` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pattern` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`trans_type`,`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_reflines` ###

INSERT INTO `0_reflines` VALUES
('1', '0', '', '0013', '', '1', '0'),
('2', '1', 'BPV', '{001}/{YYYY}', '', '1', '0'),
('3', '2', 'BRV', '{001}/{YYYY}', '', '1', '0'),
('4', '4', 'FT', '{001}/{YYYY}', '', '1', '0'),
('5', '10', 'SI', '{001}/{YYYY}', '107', '1', '0'),
('6', '11', 'CCN', '{001}/{YYYY}', '113', '1', '0'),
('7', '12', 'CP', '{001}/{YYYY}', '', '1', '0'),
('8', '13', 'DN', '{001}/{YYYY}', '110', '1', '0'),
('9', '16', 'LT', '{001}/{YYYY}', '', '1', '0'),
('10', '17', 'IA', '{001}/{YYYY}', '', '1', '0'),
('11', '18', 'PO', '{001}/{YYYY}', '209', '1', '0'),
('12', '20', 'PI', '{001}/{YYYY}', '', '1', '0'),
('13', '21', 'SCN', '{001}/{YYYY}', '', '1', '0'),
('14', '22', 'SP', '{001}/{YYYY}', '210', '1', '0'),
('15', '25', 'GRN', '{001}/{YYYY}', '', '1', '0'),
('16', '26', 'WO', '{001}/{YYYY}', '409', '1', '0'),
('17', '28', 'WOI', '{001}/{YYYY}', '', '1', '0'),
('18', '29', 'WOP', '{001}/{YYYY}', '', '1', '0'),
('19', '30', 'SO', '{001}/{YYYY}', '109', '1', '0'),
('20', '32', 'SQ', '{001}/{YYYY}', '110', '1', '0'),
('21', '35', 'CU', '{001}/{YYYY}', '', '1', '0'),
('22', '40', 'CC', '{001}/{YYYY}', '', '1', '0'),
('23', '41', 'CPV', '{001}/{YYYY}', '', '1', '0'),
('24', '42', 'CRV', '{001}/{YYYY}', '', '1', '0');

### Structure of table `0_refs` ###

DROP TABLE IF EXISTS `0_refs`;

CREATE TABLE `0_refs` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`type`),
  KEY `Type_and_Reference` (`type`,`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_refs` ###

INSERT INTO `0_refs` VALUES
('3', '0', '001/2017'),
('4', '0', '001/2017'),
('27', '0', '0010'),
('28', '0', '0011'),
('29', '0', '0012'),
('30', '0', '0013'),
('5', '0', '002/2017'),
('6', '0', '002/2017'),
('7', '0', '002/2017'),
('8', '0', '002/2017'),
('9', '0', '002/2017'),
('10', '0', '002/2017'),
('11', '0', '002/2017'),
('12', '0', '003/2017'),
('16', '0', '003/2017'),
('17', '0', '003/2017'),
('20', '0', '003/2017'),
('21', '0', '003/2017'),
('13', '0', '004/2017'),
('14', '0', '005/2017'),
('15', '0', '006/2017'),
('22', '0', '007/2017'),
('23', '0', '008/2017'),
('24', '0', '008/2017'),
('25', '0', '008/2017'),
('26', '0', '008/2017'),
('1', '0', 'JV001/2017'),
('1', '4', 'FT001/2017'),
('2', '4', 'FT002/2017'),
('1', '20', 'PI001/2017'),
('1', '40', 'CC001/2017'),
('2', '40', 'CC002/2017'),
('3', '40', 'CC003/2017'),
('1', '41', 'CPV001/2017'),
('2', '41', 'CPV002/2017'),
('3', '41', 'CPV003/2017'),
('4', '41', 'CPV004/2017'),
('5', '41', 'CPV005/2017');

### Structure of table `0_report_profiles` ###

DROP TABLE IF EXISTS `0_report_profiles`;

CREATE TABLE `0_report_profiles` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `printer` tinyint(3) unsigned DEFAULT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile` (`profile`,`report`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_report_profiles` ###

INSERT INTO `0_report_profiles` VALUES
('41', 'testing', NULL, NULL, '0'),
('42', 'testing', '101', '1', '0'),
('43', 'testing', '102', '1', '0'),
('44', 'testing', '103', '1', '0'),
('45', 'testing', '104', '1', '0'),
('46', 'testing', '105', '1', '0'),
('47', 'testing', '106', '1', '0'),
('48', 'testing', '107', '1', '0'),
('49', 'testing', '108', '1', '0'),
('50', 'testing', '109', '1', '0'),
('87', 'RPL', NULL, '1', '0'),
('88', 'RPL', '101', '1', '0'),
('89', 'RPL', '102', '1', '0'),
('90', 'RPL', '103', '1', '0'),
('91', 'RPL', '104', '1', '0'),
('92', 'RPL', '105', '1', '0'),
('93', 'RPL', '106', '1', '0'),
('94', 'RPL', '107', '1', '0'),
('95', 'RPL', '108', '1', '0'),
('96', 'RPL', '109', '1', '0'),
('97', 'RPL', '110', '1', '0'),
('98', 'RPL', '111', '1', '0'),
('99', 'RPL', '112', '1', '0'),
('100', 'RPL', '113', '1', '0'),
('101', 'RPL', '114', '1', '0'),
('102', 'RPL', '201', '1', '0'),
('103', 'RPL', '202', '1', '0'),
('104', 'RPL', '203', '1', '0'),
('105', 'RPL', '204', '1', '0'),
('106', 'RPL', '205', '1', '0'),
('107', 'RPL', '209', '1', '0'),
('108', 'RPL', '210', '1', '0'),
('109', 'RPL', '301', '1', '0'),
('110', 'RPL', '302', '1', '0'),
('111', 'RPL', '303', '1', '0'),
('112', 'RPL', '304', '1', '0'),
('113', 'RPL', '305', '1', '0'),
('114', 'RPL', '306', '1', '0'),
('115', 'RPL', '307', '1', '0'),
('116', 'RPL', '308', '1', '0'),
('117', 'RPL', '309', '1', '0'),
('118', 'RPL', '401', '1', '0'),
('119', 'RPL', '402', '1', '0'),
('120', 'RPL', '409', '1', '0'),
('121', 'RPL', '451', '1', '0'),
('122', 'RPL', '501', '1', '0'),
('123', 'RPL', '601', '1', '0'),
('124', 'RPL', '602', '1', '0'),
('125', 'RPL', '701', '1', '0'),
('126', 'RPL', '702', '1', '0'),
('127', 'RPL', '704', '1', '0'),
('128', 'RPL', '705', '1', '0'),
('129', 'RPL', '706', '1', '0'),
('130', 'RPL', '707', '1', '0'),
('131', 'RPL', '708', '1', '0'),
('132', 'RPL', '709', '1', '0'),
('133', 'RPL', '710', '1', '0'),
('134', 'RPL', '1009', '1', '0'),
('135', 'RPL', '1011', '1', '0'),
('136', 'RPL', '1012', '1', '0'),
('137', 'RPL', '1013', '1', '0'),
('138', 'RPL', '1014', '1', '0'),
('139', 'RPL', '1015', '1', '0'),
('140', 'RPL', '1016', '1', '0'),
('141', 'RPL', '1017', '1', '0'),
('142', 'RPL', '1018', '1', '0'),
('143', 'RPL', '1071', '1', '0'),
('144', 'RPL', '1072', '1', '0'),
('145', 'RPL', '1073', '1', '0'),
('146', 'RPL', '1091', '1', '0'),
('147', 'RPL', '1100', '1', '0'),
('148', 'RPL', '2099', '1', '0'),
('149', 'RPL', '3041', '1', '0'),
('150', 'RPL', '3042', '1', '0'),
('151', 'RPL', '22011', '1', '0');

### Structure of table `0_requisition_details` ###

DROP TABLE IF EXISTS `0_requisition_details`;

CREATE TABLE `0_requisition_details` (
  `requisition_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` int(11) DEFAULT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `lpo_id` int(11) DEFAULT '0',
  `order_quantity` int(11) NOT NULL DEFAULT '0',
  `estimate_price` double NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `purpose` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`requisition_detail_id`),
  UNIQUE KEY `requisition_detail_id` (`requisition_detail_id`),
  KEY `0_requisition_details_requisition_id` (`requisition_id`),
  KEY `0_requisition_details_item_code` (`item_code`),
  KEY `0_requisition_details_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_requisition_details` ###


### Structure of table `0_requisitions` ###

DROP TABLE IF EXISTS `0_requisitions`;

CREATE TABLE `0_requisitions` (
  `requisition_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `point_of_use` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `narrative` varchar(240) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`requisition_id`),
  UNIQUE KEY `requisition_id` (`requisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_requisitions` ###


### Structure of table `0_sales_order_details` ###

DROP TABLE IF EXISTS `0_sales_order_details`;

CREATE TABLE `0_sales_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` int(11) NOT NULL DEFAULT '0',
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `stk_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `qty_sent` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `invoiced` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sorder` (`trans_type`,`order_no`),
  KEY `stkcode` (`stk_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_order_details` ###


### Structure of table `0_sales_orders` ###

DROP TABLE IF EXISTS `0_sales_orders`;

CREATE TABLE `0_sales_orders` (
  `order_no` int(11) NOT NULL,
  `trans_type` smallint(6) NOT NULL DEFAULT '30',
  `version` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `debtor_no` int(11) NOT NULL DEFAULT '0',
  `branch_code` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customer_ref` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `comments` tinytext COLLATE utf8_unicode_ci,
  `ord_date` date NOT NULL DEFAULT '0000-00-00',
  `order_type` int(11) NOT NULL DEFAULT '0',
  `ship_via` int(11) NOT NULL DEFAULT '0',
  `delivery_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliver_to` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `freight_cost` double NOT NULL DEFAULT '0',
  `from_stk_loc` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delivery_date` date NOT NULL DEFAULT '0000-00-00',
  `payment_terms` int(11) DEFAULT NULL,
  `total` double NOT NULL DEFAULT '0',
  `prep_amount` double NOT NULL DEFAULT '0',
  `alloc` double NOT NULL DEFAULT '0',
  `sample` tinyint(4) NOT NULL,
  `supply` tinyint(4) NOT NULL,
  `dc` tinyint(4) NOT NULL,
  `invoice` tinyint(4) NOT NULL,
  `application` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`trans_type`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_orders` ###


### Structure of table `0_sales_pos` ###

DROP TABLE IF EXISTS `0_sales_pos`;

CREATE TABLE `0_sales_pos` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `pos_account` smallint(6) unsigned NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pos_name` (`pos_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_pos` ###

INSERT INTO `0_sales_pos` VALUES
('1', 'Default', '1', '1', 'DEF', '2', '0');

### Structure of table `0_sales_types` ###

DROP TABLE IF EXISTS `0_sales_types`;

CREATE TABLE `0_sales_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_type` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_type` (`sales_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_types` ###

INSERT INTO `0_sales_types` VALUES
('1', 'Retail', '1', '1', '0'),
('2', 'Wholesale', '0', '0.7', '0');

### Structure of table `0_salesman` ###

DROP TABLE IF EXISTS `0_salesman`;

CREATE TABLE `0_salesman` (
  `salesman_code` int(11) NOT NULL AUTO_INCREMENT,
  `salesman_name` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_phone` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_fax` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `provision` double NOT NULL DEFAULT '0',
  `break_pt` double NOT NULL DEFAULT '0',
  `provision2` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salesman_code`),
  UNIQUE KEY `salesman_name` (`salesman_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_salesman` ###

INSERT INTO `0_salesman` VALUES
('1', 'Sales Person', '', '', '', '5', '1000', '4', '0');

### Structure of table `0_security_roles` ###

DROP TABLE IF EXISTS `0_security_roles`;

CREATE TABLE `0_security_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sections` text COLLATE utf8_unicode_ci,
  `areas` text COLLATE utf8_unicode_ci,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_security_roles` ###

INSERT INTO `0_security_roles` VALUES
('1', 'Inquiries', 'Inquiries', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132;775', '0'),
('2', 'System Administrator', 'System Administrator', '512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;9216;9472;9728;10496;10752;11008;13056;13312;15616;15872;16128;484352;943104;1008640', '513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;775;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;9217;9218;9220;9473;9474;9475;9476;9729;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15630;15629;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;15884;16129;16130;16131;16132;484452;943204;943205;1008740', '0'),
('3', 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873;775', '0'),
('4', 'Stock Manager', 'Stock Manager', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132;775', '0'),
('5', 'Production Manager', 'Production Manager', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('6', 'Purchase Officer', 'Purchase Officer', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('7', 'AR Officer', 'AR Officer', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', '0'),
('8', 'AP Officer', 'AP Officer', '5632', '5633;5635;5636;3073;3074;3082;3076;3077;3078;3079;3080;3081;3335;13057', '0'),
('9', 'Accountant', 'New Accountant', '5632', '5635;5636;521;523;524;771;772;773;774;775;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132', '0'),
('10', 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132;775', '0'),
('11', 'cash account', 'cash account', '768;15616;15872', '774;15873;15877;15878;15879', '0');

### Structure of table `0_shippers` ###

DROP TABLE IF EXISTS `0_shippers`;

CREATE TABLE `0_shippers` (
  `shipper_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipper_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipper_id`),
  UNIQUE KEY `name` (`shipper_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_shippers` ###

INSERT INTO `0_shippers` VALUES
('1', 'Default', '', '', '', '', '0');

### Structure of table `0_sql_trail` ###

DROP TABLE IF EXISTS `0_sql_trail`;

CREATE TABLE `0_sql_trail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sql` text COLLATE utf8_unicode_ci NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sql_trail` ###


### Structure of table `0_stock_category` ###

DROP TABLE IF EXISTS `0_stock_category`;

CREATE TABLE `0_stock_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_tax_type` int(11) NOT NULL DEFAULT '1',
  `dflt_units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `dflt_mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `dflt_sales_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_cogs_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_inventory_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_adjustment_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_wip_act` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dflt_dim1` int(11) DEFAULT NULL,
  `dflt_dim2` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `dflt_no_purchase` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('2', 'Material', '1', 'each', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0');

### Structure of table `0_stock_fa_class` ###

DROP TABLE IF EXISTS `0_stock_fa_class`;

CREATE TABLE `0_stock_fa_class` (
  `fa_class_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fa_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_fa_class` ###

INSERT INTO `0_stock_fa_class` VALUES
('1', '', 'A', '', '10', '0'),
('11', '1', 'A-A', '', '10', '0'),
('2', '', 'B', '', '20', '0'),
('22', '2', 'B-B', '', '20', '0');

### Structure of table `0_stock_master` ###

DROP TABLE IF EXISTS `0_stock_master`;

CREATE TABLE `0_stock_master` (
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `long_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `carton` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `units` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'each',
  `mb_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'B',
  `sales_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cogs_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inventory_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adjustment_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wip_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimension_id` int(11) DEFAULT NULL,
  `dimension2_id` int(11) DEFAULT NULL,
  `purchase_cost` double NOT NULL DEFAULT '0',
  `material_cost` double NOT NULL DEFAULT '0',
  `labour_cost` double NOT NULL DEFAULT '0',
  `overhead_cost` double NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `no_sale` tinyint(1) NOT NULL DEFAULT '0',
  `no_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `depreciation_method` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `depreciation_rate` double NOT NULL DEFAULT '0',
  `depreciation_factor` double NOT NULL DEFAULT '1',
  `depreciation_start` date NOT NULL DEFAULT '0000-00-00',
  `depreciation_date` date NOT NULL DEFAULT '0000-00-00',
  `fa_class_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salesman` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_master` ###


### Structure of table `0_stock_moves` ###

DROP TABLE IF EXISTS `0_stock_moves`;

CREATE TABLE `0_stock_moves` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `person_id` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `standard_cost` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `type` (`type`,`trans_no`),
  KEY `Move` (`stock_id`,`loc_code`,`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_moves` ###


### Structure of table `0_supp_allocations` ###

DROP TABLE IF EXISTS `0_supp_allocations`;

CREATE TABLE `0_supp_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `amt` double unsigned DEFAULT NULL,
  `date_alloc` date NOT NULL DEFAULT '0000-00-00',
  `trans_no_from` int(11) DEFAULT NULL,
  `trans_type_from` int(11) DEFAULT NULL,
  `trans_no_to` int(11) DEFAULT NULL,
  `trans_type_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trans_type_from` (`person_id`,`trans_type_from`,`trans_no_from`,`trans_type_to`,`trans_no_to`),
  KEY `From` (`trans_type_from`,`trans_no_from`),
  KEY `To` (`trans_type_to`,`trans_no_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_allocations` ###


### Structure of table `0_supp_invoice_items` ###

DROP TABLE IF EXISTS `0_supp_invoice_items`;

CREATE TABLE `0_supp_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_trans_no` int(11) DEFAULT NULL,
  `supp_trans_type` int(11) DEFAULT NULL,
  `gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grn_item_id` int(11) DEFAULT NULL,
  `po_detail_item_id` int(11) DEFAULT NULL,
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` tinytext COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `unit_tax` double NOT NULL DEFAULT '0',
  `memo_` tinytext COLLATE utf8_unicode_ci,
  `dimension_id` int(11) NOT NULL DEFAULT '0',
  `dimension2_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_invoice_items` ###

INSERT INTO `0_supp_invoice_items` VALUES
('1', '1', '20', '4011', '-1', '0', '', NULL, '0', '1200', '0', 'key board &amp; mouse', '0', '1');

### Structure of table `0_supp_trans` ###

DROP TABLE IF EXISTS `0_supp_trans`;

CREATE TABLE `0_supp_trans` (
  `trans_no` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `supplier_id` int(11) unsigned DEFAULT NULL,
  `reference` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_reference` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `due_date` date NOT NULL DEFAULT '0000-00-00',
  `ov_amount` double NOT NULL DEFAULT '0',
  `ov_discount` double NOT NULL DEFAULT '0',
  `ov_gst` double NOT NULL DEFAULT '0',
  `gst_wh` double NOT NULL,
  `rate` double NOT NULL DEFAULT '1',
  `alloc` double NOT NULL DEFAULT '0',
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `supply_disc` int(11) NOT NULL,
  `service_disc` int(11) NOT NULL,
  `fbr_disc` int(11) NOT NULL,
  `srb_disc` int(11) NOT NULL,
  `write_back` int(11) NOT NULL,
  `supply_tax_id` int(11) NOT NULL,
  `service_tax_id` int(11) NOT NULL,
  `fbr_tax_id` int(11) NOT NULL,
  `srb_tax_id` int(11) NOT NULL,
  `cheque` int(11) NOT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_trans` ###

INSERT INTO `0_supp_trans` VALUES
('11', '0', '32', '002/2017', '', '2017-06-30', '0000-00-00', '1137910', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('13', '0', '6', '004/2017', '', '2017-06-30', '0000-00-00', '10000', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('23', '0', '25', '008/2017', '', '2017-06-30', '0000-00-00', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('24', '0', '25', '008/2017', '', '2017-06-30', '0000-00-00', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('25', '0', '25', '008/2017', '', '2017-06-30', '0000-00-00', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('26', '0', '25', '008/2017', '', '2017-06-30', '0000-00-00', '-44153', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('29', '0', '25', '0012', '', '2017-08-31', '0000-00-00', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('30', '0', '25', '0013', '', '2017-08-31', '0000-00-00', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '20', '6', 'PI001/2017', 'PI001/2017', '2017-07-10', '2017-10-08', '1200', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

### Structure of table `0_suppliers` ###

DROP TABLE IF EXISTS `0_suppliers`;

CREATE TABLE `0_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_ref` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `supp_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `gst_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `supp_account_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_account` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `curr_code` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_terms` int(11) DEFAULT NULL,
  `tax_included` tinyint(1) NOT NULL DEFAULT '0',
  `dimension_id` int(11) DEFAULT '0',
  `dimension2_id` int(11) DEFAULT '0',
  `tax_group_id` int(11) DEFAULT NULL,
  `credit_limit` double NOT NULL DEFAULT '0',
  `purchase_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payable_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_discount_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notes` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `ntn_no` int(11) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_id`),
  KEY `supp_ref` (`supp_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('6', 'A to Z Computer', 'A to Z Computer', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202511', '5016', '', '0', '0'),
('8', 'Abid Acrylic Works', 'Abid Acrylic Works', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202512', '5016', '', '0', '0'),
('9', 'Abid Wood Works', 'Abid Wood Works', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202531', '5016', '', '0', '0'),
('10', 'Air Condition Services', 'Air Condition Services', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202521', '5016', '', '0', '0'),
('11', 'Akif (Paster)', 'Akif (Paster)', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202543', '5016', '', '0', '0'),
('12', 'Altaf (Lhr)', 'Altaf (Lhr)', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202533', '5016', '', '0', '0'),
('13', 'AQ Printer', 'AQ Printer', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202514', '5016', '', '0', '0'),
('15', 'Arabian Engg. &amp; Services', 'Arabian Engg. &amp; Services', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202515', '5016', '', '0', '0'),
('16', 'Aurangzeb (Transporter) Lhr', 'Aurangzeb (Transporter) Lhr', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202542', '5016', '', '0', '0'),
('17', 'Boxygen', 'Boxygen', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202522', '5016', '', '0', '0'),
('18', 'Decent Baloons', 'Decent Baloons', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202517', '5016', '', '0', '0'),
('19', 'DYS Solutions (Pvt.) Ltd', 'DYS Solutions (Pvt.) Ltd', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202523', '5016', '', '0', '0'),
('20', 'Farhan Khan (Carpentor)', 'Farhan Khan (Carpentor)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202516', '5016', '', '0', '0'),
('21', 'Graphic Media (Lhr)', 'Graphic Media (Lhr)', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202535', '5016', '', '0', '0'),
('22', 'Hermain Travells', 'Hermain Travells', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202524', '5016', '', '0', '0'),
('23', 'Hub &amp; Co', 'Hub &amp; Co', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202519', '5016', '', '0', '0'),
('24', 'Jeco', 'Jeco', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025110', '5016', '', '0', '0'),
('25', 'Johan (Pvt.) Ltd', 'Johan (Pvt.) Ltd', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025111', '5016', '', '0', '0'),
('26', 'Khalil (Carpentor)', 'Khalil (Carpentor)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025112', '5016', '', '0', '0'),
('27', 'Khan Printer', 'Khan Printer', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025113', '5016', '', '0', '0'),
('28', 'Liaquat (Shezor)', 'Liaquat (Shezor)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202525', '5016', '', '0', '0'),
('29', 'Mirza Raz', 'Mirza Raza', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202532', '5016', '', '0', '0'),
('30', 'Mirza Shahzad Rasul', 'Mirza Shahzad Rasul', '', '', '', '', '', '', '', 'PKR', '5', '0', '3', '0', '2', '0', '', '202551', '5016', '', '0', '0'),
('31', 'Mubeen Wall Mount', 'Mubeen Wall Mount', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025114', '5016', '', '0', '0'),
('32', 'Muhammad Amin (GST)', 'Muhammad Amin (GST)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '20272', '5016', '', '0', '0'),
('33', 'Naveed (paster)', 'Naveed (paster)', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202544', '5016', '', '0', '0'),
('34', 'Nawab Autos', 'Nawab Autos', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025116', '5016', '', '0', '0'),
('35', 'Naveed (Suzuki)', 'Naveed (Suzuki)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202527', '5016', '', '0', '0'),
('36', 'Nisar', 'Nisar', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025117', '5016', '', '0', '0'),
('37', 'RK Traders', 'RK Traders', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025118', '5016', '', '0', '0'),
('38', 'Sabri  Plastic Store (Islamabad)', 'Sabri  Plastic Store (Isb)', '', '', '', '', '', '', '', 'PKR', '5', '0', '3', '0', '2', '0', '', '202552', '5016', '', '0', '0'),
('39', 'Sabri  Plastic Store (Khi)', 'Sabri  Plastic Store (Khi)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025119', '5016', '', '0', '0'),
('40', 'Sabri  Plastic Store (Lhr)', 'Sabri  Plastic Store (Lhr)', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202534', '5016', '', '0', '0'),
('41', 'Sagheer &amp; Sadheer Water Supplier', 'Sagheer &amp; Sadheer Water Su', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025120', '5016', '', '0', '0'),
('42', 'Salman Abbas (3D Designer)', 'Salman Abbas (3D Designer)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025212', '5016', '', '0', '0'),
('43', 'Star Plastic Works', 'Star Plastic Works', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025121', '5016', '', '0', '0'),
('44', 'Sunny Advertising', 'Sunny Advertising', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025122', '5016', '', '0', '0'),
('45', 'Total Express', 'Total Express', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025123', '5016', '', '0', '0'),
('46', 'Zaffar Hussain', 'Zaffar Hussain', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025210', '5016', '', '0', '0'),
('47', 'Zaffar Hussain - 2 (Duco Paint)', 'Zaffar Hussain- 2 (Duco Paint)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025211', '5016', '', '0', '0'),
('48', 'Farhan Khan - 2 (Carpentor)', 'Farhan Khan - 2 (Carpentor)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025125', '5016', '', '0', '0'),
('49', 'Khalil - 2 (Carpentor)', 'Khalil - 2 (Carpentor)', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025115', '5016', '', '0', '0'),
('50', 'Zaki Khan', 'Zaki Khan', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '202529', '5016', '', '0', '0'),
('52', 'Zahid Advertiser', 'Zahid Advertiser', '', '', '', '', '', '', '', 'PKR', '5', '0', '2', '0', '2', '0', '', '202536', '5016', '', '0', '0'),
('53', 'Basheer &amp; Sons', 'Basheer &amp; Sons', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025124', '5016', '', '0', '0'),
('54', 'Super Carpet Centre', 'Super Carpet Centre', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025126', '5016', '', '0', '0'),
('55', 'Travells Smooth', 'Travells Smooth', '', '', '', '', '', '', '', 'PKR', '5', '0', '1', '0', '2', '0', '', '2025213', '5016', '', '0', '0');

### Structure of table `0_sys_prefs` ###

DROP TABLE IF EXISTS `0_sys_prefs`;

CREATE TABLE `0_sys_prefs` (
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` smallint(6) DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sys_prefs` ###

INSERT INTO `0_sys_prefs` VALUES
('accounts_alpha', 'glsetup.general', 'tinyint', '1', '0'),
('accumulate_shipping', 'glsetup.customer', 'tinyint', '1', '0'),
('add_pct', 'setup.company', 'int', '5', '-1'),
('allow_negative_prices', 'glsetup.inventory', 'tinyint', '1', '1'),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', '1', '0'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', ''),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '50211'),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', ''),
('coy_logo', 'setup.company', 'varchar', '100', ''),
('coy_name', 'setup.company', 'varchar', '60', 'Sumair Enterprises'),
('coy_no', 'setup.company', 'varchar', '25', ''),
('creditors_act', 'glsetup.purchase', 'varchar', '15', '10111'),
('curr_default', 'setup.company', 'char', '3', 'PKR'),
('debtors_act', 'glsetup.sales', 'varchar', '15', '10111'),
('default_adj_act', 'glsetup.items', 'varchar', '15', '5014'),
('default_cogs_act', 'glsetup.items', 'varchar', '15', '5011'),
('default_credit_limit', 'glsetup.customer', 'int', '11', '0'),
('default_delivery_required', 'glsetup.sales', 'smallint', '6', '1'),
('default_dim_required', 'glsetup.dims', 'int', '11', '20'),
('default_inv_sales_act', 'glsetup.items', 'varchar', '15', '4011'),
('default_inventory_act', 'glsetup.items', 'varchar', '15', '10111'),
('default_loss_on_asset_disposal_act', 'glsetup.items', 'varchar', '15', '5014'),
('default_prompt_payment_act', 'glsetup.sales', 'varchar', '15', '5012'),
('default_quote_valid_days', 'glsetup.sales', 'smallint', '6', '30'),
('default_receival_required', 'glsetup.purchase', 'smallint', '6', '10'),
('default_sales_act', 'glsetup.sales', 'varchar', '15', ''),
('default_sales_discount_act', 'glsetup.sales', 'varchar', '15', '5012'),
('default_wip_act', 'glsetup.items', 'varchar', '15', '10111'),
('default_workorder_required', 'glsetup.manuf', 'int', '11', '20'),
('deferred_income_act', 'glsetup.sales', 'varchar', '15', ''),
('depreciation_period', 'glsetup.company', 'tinyint', '1', '1'),
('domicile', 'setup.company', 'varchar', '55', ''),
('email', 'setup.company', 'varchar', '100', ''),
('exchange_diff_act', 'glsetup.general', 'varchar', '15', '5011'),
('f_year', 'setup.company', 'int', '11', '2'),
('fax', 'setup.company', 'varchar', '30', ''),
('freight_act', 'glsetup.customer', 'varchar', '15', '10111'),
('gl_closing_date', 'setup.closing_date', 'date', '8', '2017-07-01'),
('grn_clearing_act', 'glsetup.purchase', 'varchar', '15', ''),
('gst_no', 'setup.company', 'varchar', '25', ''),
('legal_text', 'glsetup.customer', 'tinytext', '0', ''),
('loc_notification', 'glsetup.inventory', 'tinyint', '1', ''),
('login_tout', 'setup.company', 'smallint', '6', '9999999999'),
('logo_h', 'setup.company', 'varchar', '30', '100'),
('logo_w', 'setup.company', 'varchar', '30', '100'),
('no_customer_list', 'setup.company', 'tinyint', '1', '0'),
('no_item_list', 'setup.company', 'tinyint', '1', '0'),
('no_supplier_list', 'setup.company', 'tinyint', '1', '0'),
('no_zero_lines_amount', 'glsetup.sales', 'tinyint', '1', '1'),
('past_due_days', 'glsetup.general', 'int', '11', '30'),
('phone', 'setup.company', 'varchar', '30', ''),
('po_over_charge', 'glsetup.purchase', 'int', '11', '10'),
('po_over_receive', 'glsetup.purchase', 'int', '11', '10'),
('postal_address', 'setup.company', 'tinytext', '0', ''),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '5017'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '5016'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '30111'),
('round_to', 'setup.company', 'int', '5', '1'),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', '1', ''),
('suppress_tax_rates', 'setup.company', 'tinyint', '1', ''),
('tax_algorithm', 'glsetup.customer', 'tinyint', '1', '1'),
('tax_last', 'setup.company', 'int', '11', '1'),
('tax_prd', 'setup.company', 'int', '11', '1'),
('time_zone', 'setup.company', 'tinyint', '1', '0'),
('use_dimension', 'setup.company', 'tinyint', '1', '2'),
('use_fixed_assets', 'setup.company', 'tinyint', '1', ''),
('use_manufacturing', 'setup.company', 'tinyint', '1', ''),
('version_id', 'system', 'varchar', '11', '2.4.1');

### Structure of table `0_sys_prefs_new` ###

DROP TABLE IF EXISTS `0_sys_prefs_new`;

CREATE TABLE `0_sys_prefs_new` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_sys_prefs_new` ###

INSERT INTO `0_sys_prefs_new` VALUES
('sales_quotation', '1'),
('sale_order_entry', '1'),
('delivery_against', '1'),
('customer_credit_note', '1'),
('invoice_against', '1'),
('direct_invoice', '1'),
('customer_payment', '1'),
('allocate', '1'),
('sales_quotation_inquiry', '1'),
('sale_order_inquiry', '1'),
('customer_inquiry', '1'),
('customer_allocate_inquiry', '1'),
('sales_reports', '1'),
('manage_customer', '1'),
('customer_branches', '1'),
('sales_group', '1'),
('sales_type', '1'),
('sales_persons', '1'),
('sales_areas', '1'),
('wht_types', '1'),
('purchase_order', '1'),
('opom', '1'),
('direct_supplier_invoice', '1'),
('payments_suppliers', '1'),
('supplier_invoice', '1'),
('supplier_credit', '1'),
('allocates', '1'),
('purchase_order_inquiry', '1'),
('supplier_transaction_inquiry', '1'),
('allocate_inquiry', '1'),
('suppliers', '1'),
('supplier_reports', '1'),
('inventry_location', '1'),
('inventory_adjustments', '1'),
('inventory_item_movemnets', '1'),
('inventory_item_status', '1'),
('inventory_reports', '1'),
('items', '1'),
('foreign_item_codes', '1'),
('sales_kits', '1'),
('item_categories', '1'),
('inventory_locations', '1'),
('unit_measure', '1'),
('recorder_levels', '1'),
('import_csv', '1'),
('sales_pricing', '1'),
('purchase_pricing', '1'),
('standard_cost', '1'),
('bank_payments_voucher', '1'),
('bank_deposit_voucher', '1'),
('cash_payments_voucher', '1'),
('cash_receipt_voucher', '1'),
('bank_account_transfer', '1'),
('reconcile_account', '1'),
('gl', '1'),
('bank_account_inquiry', '1'),
('tax_inquiry', '1'),
('trial_balance', '1'),
('banking_reports', '1'),
('general_ledger', '1'),
('bank_account', '1'),
('quick_entries', '1'),
('account_tag', '1'),
('gl_account', '1'),
('gl_account_group', '1'),
('closing1', ''),
('journal_inquiry', '1'),
('company_setup', '1'),
('user_account_setup', '1'),
('access_setup', '1'),
('user_location', '1'),
('display_setup', '1'),
('transaction_ref', '1'),
('taxes', '1'),
('tax_group', '1'),
('item_tax_type', '1'),
('system_gl', '1'),
('fiscal_years', '1'),
('print_profile', '1'),
('payment_terms', '1'),
('shipping_company', '1'),
('point_sale', '1'),
('void_transaction', '1'),
('print_transaction', '1'),
('backup', '1'),
('drill_balance', '1'),
('pf_drill', '1'),
('delivery_against_text', 'Delivery Against Sales Orders'),
('invoice_against_text', 'Invoice Against Sales Delivery'),
('direct_invoice_text', 'Direct Invoice'),
('customer_payment_text', 'Customer Payments'),
('customer_credit_note_text', 'Customer Credit Note'),
('allocate_text', 'Allocate Customer Payments Or Credit Notes'),
('sales_quotation_inquiry_text', 'Sale Quotation Inquiry'),
('sale_order_inquiry_text', 'Sale Order Inquiry'),
('customer_inquiry_text', 'Customer Transaction Inquiry'),
('customer_allocate_inquiry_text', 'Customer Allocate Inquiry'),
('sales_reports_text', 'Customer And Sales Reports'),
('manage_customer_text', 'Add And Manage Customer'),
('customer_branches_text', 'Customer Branches'),
('sales_group_text', 'Sales Groups'),
('sales_type_text', 'Sales Type'),
('sales_persons_text', 'Sales Persons'),
('sales_areas_text', 'Sales Areas'),
('wht_types_text', 'WHT Types'),
('purchase_order_text', 'Purchase Order Entry'),
('opom_text', 'Outstanding Purchase Orders Maintenance'),
('direct_supplier_invoice_text', 'Direct Supplier Invoice'),
('payments_suppliers_text', 'Payments To Suppliers'),
('supplier_invoice_text', 'Supplier Invoices'),
('supplier_credit_text', 'Supplier Credit Notes'),
('allocates_text', 'Allocate Supplier Payments Or Credit Notes'),
('purchase_order_inquiry_text', 'Purchase Order Inquiry'),
('supplier_transaction_inquiry_text', 'Supplier Transaction Inquiry'),
('allocate_inquiry_text', 'Supplier Allocation Inquiry'),
('supplier_reports_text', 'Supplier And Purchasing Reports'),
('suppliers_text', 'Suppliers'),
('inventry_location_text', 'Inventory Location Transfer'),
('inventory_adjustments_text', 'Inventory Adjustments'),
('inventory_item_movemnets_text', 'Inventory Item Movements'),
('inventory_item_status_text', 'Inventory Item Status'),
('inventory_reports_text', 'Inventory Reports'),
('items_text', 'Items'),
('foreign_item_codes_text', 'Foreign Item Codes'),
('sales_kits_text', 'Sales Kits'),
('item_categories_text', 'Item Categories'),
('inventory_locations_text', 'Inventory Locations'),
('unit_measure_text', 'Units Of Measure'),
('recorder_levels_text', 'Recorder levels'),
('import_csv_text', 'Import CSV Items'),
('sales_pricing_text', 'Sales Pricing'),
('purchase_pricing_text', 'Purchasing Pricing'),
('standard_cost_text', 'Standard Costs'),
('bank_payments_voucher_text', 'Bank Payments Voucher'),
('bank_deposit_voucher_text', 'Bank Deposits Voucher'),
('cash_payments_voucher_text', 'Cash Payment Voucher'),
('cash_receipt_voucher_text', 'Cash Receipt Voucher'),
('bank_account_transfer_text', 'Bank Account Transfer'),
('journal_entry_text', 'Journal Entry'),
('reconcile_account_text', 'Reconcile Bank Account'),
('journal_inquiry_text', 'Journal Inquiry'),
('gl_text', 'GL Inquiry'),
('bank_account_inquiry_text', 'Bank Account Inquiry'),
('tax_inquiry_text', 'Tax Inquiry'),
('trial_balance_text', 'Trial Balance'),
('pf_drill_text', 'Profit and Loss Drilldown'),
('drill_balance_text', 'Balance Sheet Drilldown'),
('banking_reports_text', 'Banking Reports'),
('general_ledger_text', 'General Ledger Reports'),
('bank_account_text', 'Bank Account'),
('quick_entries_text', 'Quick Entries'),
('account_tag_text', 'Account Tags'),
('gl_account_text', 'GL Accounts'),
('gl_account_group_text', 'GL Account Groups'),
('closing_text1', ''),
('company_setup_text', 'Company Setup'),
('access_setup_text', 'Access Setup'),
('user_location_text', 'User Locations Access'),
('display_setup_text', 'Display Setup'),
('transaction_ref_text', 'Transaction References'),
('taxes_text', 'Taxes'),
('tax_group_text', 'Tax Group'),
('item_tax_type_text', 'Item Tax Type'),
('system_gl_text', 'System and General GL Setup'),
('fiscal_years_text', 'Fiscal Years'),
('print_profile_text', 'Print Profiles'),
('payment_terms_text', 'Payment Terms'),
('shipping_company_text', 'Shipping Company'),
('point_sale_text', 'Points Of Sale'),
('void_transaction_text', 'Void a Transaction'),
('print_transaction_text', 'View Or Print Transactions'),
('backup_text', 'Backup And Restore'),
('sales_quotation_text', 'Sale Quotation Entry'),
('sales_quotation', '1'),
('revaluation', '1'),
('closing', '1'),
('exchange_rates', '1'),
('currencies', '1'),
('revenue_cost', '1'),
('reconcile_account', '1'),
('gl_account_classes', '1'),
('revaluation_text', 'Revaluation'),
('closing_text', 'Closing GL Transactions'),
('exchange_rates_text', 'Exchange Rates'),
('currencies_text', 'Currencies'),
('revenue_cost_text', 'Revenue Cost'),
('reconcile_account_text', 'Reconcile Bank Account'),
('gl_account_classes_text', 'Gl Account CLasses'),
('sale_order_entry_text', 'Sale Order Entry'),
('journal_entry', '1'),
('user_account_setup_text', 'User Account Setup');

### Structure of table `0_sys_types` ###

DROP TABLE IF EXISTS `0_sys_types`;

CREATE TABLE `0_sys_types` (
  `type_id` smallint(6) NOT NULL DEFAULT '0',
  `type_no` int(11) NOT NULL DEFAULT '1',
  `next_reference` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sys_types` ###

INSERT INTO `0_sys_types` VALUES
('0', '17', 'JV0001'),
('1', '7', 'BPV0001'),
('2', '4', 'BRV0001'),
('4', '3', 'FTV0001'),
('10', '16', 'SI0001'),
('11', '2', 'CCN001'),
('12', '6', 'CRV0001'),
('13', '1', 'DN001'),
('16', '2', 'LT001'),
('17', '2', 'IA01'),
('18', '1', 'PO0001'),
('20', '6', 'SI1511'),
('21', '1', 'SCN001'),
('22', '3', 'SP001'),
('25', '1', 'GRN001'),
('26', '1', 'WO001'),
('28', '1', 'WO001'),
('29', '1', 'WOP001'),
('30', '0', 'SO001'),
('32', '0', 'SQ001'),
('35', '1', 'CU001'),
('40', '1', 'D01'),
('41', '1', 'CPV001'),
('42', '1', 'CRV001');

### Structure of table `0_tag_associations` ###

DROP TABLE IF EXISTS `0_tag_associations`;

CREATE TABLE `0_tag_associations` (
  `record_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `record_id` (`record_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_tag_associations` ###


### Structure of table `0_tags` ###

DROP TABLE IF EXISTS `0_tags`;

CREATE TABLE `0_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_tags` ###


### Structure of table `0_tax_group_items` ###

DROP TABLE IF EXISTS `0_tax_group_items`;

CREATE TABLE `0_tax_group_items` (
  `tax_group_id` int(11) NOT NULL DEFAULT '0',
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `tax_shipping` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_group_id`,`tax_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_tax_group_items` ###

INSERT INTO `0_tax_group_items` VALUES
('1', '1', '1');

### Structure of table `0_tax_groups` ###

DROP TABLE IF EXISTS `0_tax_groups`;

CREATE TABLE `0_tax_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_tax_groups` ###

INSERT INTO `0_tax_groups` VALUES
('1', 'Tax', '0'),
('2', 'Tax Exempt', '0');

### Structure of table `0_tax_types` ###

DROP TABLE IF EXISTS `0_tax_types`;

CREATE TABLE `0_tax_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL DEFAULT '0',
  `sales_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `purchasing_gl_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_tax_types` ###

INSERT INTO `0_tax_types` VALUES
('1', '0', '2013', '2014', 'Tax', '0');

### Structure of table `0_trans_tax_details` ###

DROP TABLE IF EXISTS `0_trans_tax_details`;

CREATE TABLE `0_trans_tax_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_type` smallint(6) DEFAULT NULL,
  `trans_no` int(11) DEFAULT NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int(11) NOT NULL DEFAULT '0',
  `rate` double NOT NULL DEFAULT '0',
  `ex_rate` double NOT NULL DEFAULT '1',
  `included_in_price` tinyint(1) NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `memo` tinytext COLLATE utf8_unicode_ci,
  `reg_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Type_and_Number` (`trans_type`,`trans_no`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_trans_tax_details` ###


### Structure of table `0_user_locations` ###

DROP TABLE IF EXISTS `0_user_locations`;

CREATE TABLE `0_user_locations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `loc_code` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_user_locations` ###

INSERT INTO `0_user_locations` VALUES
('1', 'DEF', '12', '0'),
('2', 'DEF', '18', '0'),
('3', 'DEF', '19', '0');

### Structure of table `0_useronline` ###

DROP TABLE IF EXISTS `0_useronline`;

CREATE TABLE `0_useronline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###


### Structure of table `0_users` ###

DROP TABLE IF EXISTS `0_users`;

CREATE TABLE `0_users` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_sep` tinyint(1) NOT NULL DEFAULT '0',
  `tho_sep` tinyint(1) NOT NULL DEFAULT '0',
  `dec_sep` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `page_size` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A4',
  `prices_dec` smallint(6) NOT NULL DEFAULT '2',
  `qty_dec` smallint(6) NOT NULL DEFAULT '2',
  `rates_dec` smallint(6) NOT NULL DEFAULT '4',
  `percent_dec` smallint(6) NOT NULL DEFAULT '1',
  `show_gl` tinyint(1) NOT NULL DEFAULT '1',
  `show_codes` tinyint(1) NOT NULL DEFAULT '0',
  `show_hints` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_date` datetime DEFAULT NULL,
  `query_size` tinyint(1) unsigned NOT NULL DEFAULT '10',
  `graphic_links` tinyint(1) DEFAULT '1',
  `pos` smallint(6) DEFAULT '1',
  `print_profile` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rep_popup` tinyint(1) DEFAULT '1',
  `sticky_doc_date` tinyint(1) DEFAULT '0',
  `startup_tab` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transaction_days` smallint(6) NOT NULL DEFAULT '30',
  `save_report_selections` smallint(6) NOT NULL DEFAULT '0',
  `use_date_picker` tinyint(1) NOT NULL DEFAULT '1',
  `def_print_destination` tinyint(1) NOT NULL DEFAULT '0',
  `def_print_orientation` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('12', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Admin', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-08-31 15:24:06', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('19', 'shahbaz', '81dc9bdb52d04dc20036dbd8313ed055', 'Shahbaz', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-08-31 16:05:19', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

### Structure of table `0_voided` ###

DROP TABLE IF EXISTS `0_voided`;

CREATE TABLE `0_voided` (
  `type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `memo_` tinytext COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_voided` ###

INSERT INTO `0_voided` VALUES
('0', '1', '2017-08-30', 'Document reentered.'),
('0', '2', '2017-08-30', 'Document reentered.'),
('0', '3', '2017-08-30', 'Document reentered.'),
('0', '4', '2017-08-30', 'Document reentered.'),
('0', '5', '2017-08-30', 'Document reentered.'),
('0', '6', '2017-08-30', 'Document reentered.'),
('0', '7', '2017-08-30', 'Document reentered.'),
('0', '8', '2017-08-30', 'Document reentered.'),
('0', '9', '2017-08-30', 'Document reentered.'),
('0', '10', '2017-08-30', 'Document reentered.'),
('0', '12', '2017-08-31', 'Document reentered.'),
('0', '16', '2017-08-31', 'Document reentered.'),
('0', '17', '2017-08-31', 'Document reentered.'),
('0', '18', '2017-08-31', 'Document reentered.'),
('0', '19', '2017-08-31', 'Document reentered.'),
('0', '20', '2017-08-31', 'Document reentered.'),
('0', '23', '2017-08-31', 'Document reentered.'),
('0', '24', '2017-08-31', 'Document reentered.'),
('0', '25', '2017-08-31', 'Document reentered.'),
('0', '27', '2017-08-31', ''),
('0', '28', '2017-08-31', ''),
('0', '29', '2017-08-31', ''),
('0', '30', '2017-08-31', '');

### Structure of table `0_widgets` ###

DROP TABLE IF EXISTS `0_widgets`;

CREATE TABLE `0_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` smallint(6) NOT NULL,
  `column_id` int(11) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `collapsed` tinyint(4) NOT NULL,
  `url` varchar(100) COLLATE utf8_bin NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `source` varchar(50) COLLATE utf8_bin NOT NULL,
  `width` varchar(50) COLLATE utf8_bin NOT NULL,
  `height` varchar(50) COLLATE utf8_bin NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(150) COLLATE utf8_bin NOT NULL,
  `dt_created` datetime NOT NULL,
  `updated_by` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `dt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

### Data of table `0_widgets` ###

INSERT INTO `0_widgets` VALUES
('8', '3', '1', '0', '0', 'gl-in-fiscal-year.php', 'Profit and Loss', 'glfiscalyear', '100%', '370px', '1', '3', '2012-10-12 11:07:37', NULL, NULL),
('9', '3', '2', '0', '0', 'top-10-customer-in-fiscal-year.php', 'Top 10 customers in fiscal year', 'top10customerinfiscalyear', '100%', '630px', '1', '3', '2012-10-12 11:07:44', NULL, NULL),
('10', '2', '1', '0', '0', 'gl-in-fiscal-year.php', 'Profit and Loss', 'glfiscalyear', '100%', '370px', '1', '2', '2012-10-12 11:10:47', NULL, NULL),
('11', '2', '1', '1', '0', 'top-10-customer-in-fiscal-year.php', 'Top 10 customers in fiscal year', 'top10customerinfiscalyear', '100%', '630px', '1', '2', '2012-10-12 11:10:54', NULL, NULL),
('12', '2', '1', '2', '0', 'top-10-overdue-purchase-invoices.php', 'Top 10 Overdue Purchase Invoices', 'top10overduepurchaseinvoice', '100%', '300px', '1', '2', '2012-10-12 11:11:00', NULL, NULL),
('13', '2', '1', '3', '0', 'top-10-overdue-sales-invoices.php', 'Top 10 Overdue Sales Invoices', 'top10overduesalesinvoice', '100%', '300px', '1', '2', '2012-10-12 11:11:12', NULL, NULL),
('14', '2', '2', '1', '0', 'top-10-recent-sales-invoices.php', 'Top 10 Recent Sales Invoices', 'top10recentsalesinvoice', '100%', '300px', '1', '2', '2012-10-12 11:11:17', NULL, NULL),
('15', '2', '2', '3', '0', 'top-10-recent-sales-order.php', 'Top 10 Recent Sales Order', 'top10recentsalesorder', '100%', '300px', '1', '2', '2012-10-12 11:11:31', NULL, NULL),
('17', '2', '2', '0', '0', 'top-10-stock-in-fiscal-year.php', 'Top 10 Sold Items in fiscal year', 'top10iteminfiscalyear', '100%', '630px', '1', '2', '2012-10-12 11:11:37', NULL, NULL),
('18', '2', '2', '2', '0', 'top-10-supplier-in-fiscal-year.php', 'Top 10 suppliers in fiscal year', 'top10supplierinfiscalyear', '100%', '630px', '1', '2', '2012-10-12 11:11:45', NULL, NULL),
('19', '3', '1', '1', '0', 'top-10-overdue-purchase-invoices.php', 'Top 10 Overdue Purchase Invoices', 'top10overduepurchaseinvoice', '100%', '300px', '1', '3', '2012-10-12 11:15:30', NULL, NULL),
('21', '3', '2', '1', '0', 'top-10-overdue-sales-invoices.php', 'Top 10 Overdue Sales Invoices', 'top10overduesalesinvoice', '100%', '300px', '1', '3', '2012-10-12 11:15:48', NULL, NULL),
('22', '3', '1', '2', '0', 'top-10-recent-sales-invoices.php', 'Top 10 Recent Sales Invoices', 'top10recentsalesinvoice', '100%', '300px', '1', '3', '2012-10-12 11:15:56', NULL, NULL),
('23', '3', '1', '3', '0', 'top-10-recent-sales-order.php', 'Top 10 Recent Sales Order', 'top10recentsalesorder', '100%', '300px', '1', '3', '2012-10-12 11:16:03', NULL, NULL),
('24', '3', '2', '3', '0', 'top-10-stock-in-fiscal-year.php', 'Top 10 Sold Items in fiscal year', 'top10iteminfiscalyear', '100%', '630px', '1', '3', '2012-10-12 11:16:08', NULL, NULL),
('25', '3', '2', '2', '0', 'top-10-supplier-in-fiscal-year.php', 'Top 10 suppliers in fiscal year', 'top10supplierinfiscalyear', '100%', '630px', '1', '3', '2012-10-12 11:16:17', NULL, NULL);

### Structure of table `0_widgets_template` ###

DROP TABLE IF EXISTS `0_widgets_template`;

CREATE TABLE `0_widgets_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_id` int(11) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `collapsed` tinyint(4) NOT NULL,
  `url` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `source` varchar(50) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(150) NOT NULL,
  `dt_created` datetime NOT NULL,
  `updated_by` varchar(150) DEFAULT NULL,
  `dt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ;

### Data of table `0_widgets_template` ###

INSERT INTO `0_widgets_template` VALUES
('1', '2', '0', '0', 'top-10-customer-in-fiscal-year.php', 'Top 10 customers in fiscal year', 'top10customerinfiscalyear', '100%', '630px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('2', '2', '0', '0', 'top-10-supplier-in-fiscal-year.php', 'Top 10 suppliers in fiscal year', 'top10supplierinfiscalyear', '100%', '630px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('3', '2', '0', '0', 'top-10-stock-in-fiscal-year.php', 'Top 10 Sold Items in fiscal year', 'top10iteminfiscalyear', '100%', '630px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('4', '2', '0', '0', 'top-10-dimension-in-fiscal-year.php', 'Top 10 Dimensions in fiscal year', 'top10dimensionfiscalyear', '100%', '370px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('5', '2', '0', '0', 'top-10-overdue-sales-invoices.php', 'Top 10 Overdue Sales Invoices', 'top10overduesalesinvoice', '100%', '300px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('6', '2', '0', '0', 'top-10-overdue-purchase-invoices.php', 'Top 10 Overdue Purchase Invoices', 'top10overduepurchaseinvoice', '100%', '300px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('7', '2', '0', '0', 'gl-in-fiscal-year.php', 'Profit and Loss', 'glfiscalyear', '100%', '370px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('8', '2', '0', '0', 'top-10-recent-sales-order.php', 'Top 10 Recent Sales Order', 'top10recentsalesorder', '100%', '300px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46'),
('9', '2', '0', '0', 'top-10-recent-sales-invoices.php', 'Top 10 Recent Sales Invoices', 'top10recentsalesinvoice', '100%', '300px', '1', 'system', '2012-10-12 11:06:46', 'system', '2012-10-12 11:06:46');

### Structure of table `0_wo_costing` ###

DROP TABLE IF EXISTS `0_wo_costing`;

CREATE TABLE `0_wo_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `cost_type` tinyint(1) NOT NULL DEFAULT '0',
  `trans_type` int(11) NOT NULL DEFAULT '0',
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `factor` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wo_costing` ###


### Structure of table `0_wo_issue_items` ###

DROP TABLE IF EXISTS `0_wo_issue_items`;

CREATE TABLE `0_wo_issue_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `qty_issued` double DEFAULT NULL,
  `unit_cost` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wo_issue_items` ###


### Structure of table `0_wo_issues` ###

DROP TABLE IF EXISTS `0_wo_issues`;

CREATE TABLE `0_wo_issues` (
  `issue_no` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `loc_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workcentre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_no`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wo_issues` ###


### Structure of table `0_wo_manufacture` ###

DROP TABLE IF EXISTS `0_wo_manufacture`;

CREATE TABLE `0_wo_manufacture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wo_manufacture` ###


### Structure of table `0_wo_requirements` ###

DROP TABLE IF EXISTS `0_wo_requirements`;

CREATE TABLE `0_wo_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `workcentre` int(11) NOT NULL DEFAULT '0',
  `units_req` double NOT NULL DEFAULT '1',
  `unit_cost` double NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_issued` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wo_requirements` ###


### Structure of table `0_workcentres` ###

DROP TABLE IF EXISTS `0_workcentres`;

CREATE TABLE `0_workcentres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_workcentres` ###

INSERT INTO `0_workcentres` VALUES
('1', 'Work Centre', '', '0');

### Structure of table `0_workorders` ###

DROP TABLE IF EXISTS `0_workorders`;

CREATE TABLE `0_workorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_ref` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loc_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `units_reqd` double NOT NULL DEFAULT '1',
  `stock_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_` date NOT NULL DEFAULT '0000-00-00',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `required_by` date NOT NULL DEFAULT '0000-00-00',
  `released_date` date NOT NULL DEFAULT '0000-00-00',
  `units_issued` double NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `released` tinyint(1) NOT NULL DEFAULT '0',
  `additional_costs` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wo_ref` (`wo_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_workorders` ###


### Structure of table `0_wth_tax_types` ###

DROP TABLE IF EXISTS `0_wth_tax_types`;

CREATE TABLE `0_wth_tax_types` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_percent` double NOT NULL DEFAULT '0',
  `code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `co_account` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `level_id` int(11) NOT NULL DEFAULT '0',
  `wth_tax_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`,`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wth_tax_types` ###

INSERT INTO `0_wth_tax_types` VALUES
('1', 'WHT Service', '0', 'wht_service', '1208', '0', '0'),
('2', 'WHT Supply of goods', '0', 'wht_supply', '1210', '0', '0'),
('3', 'WHT SRB Sales Tax', '0', 'wht_srb', '1209', '0', '0'),
('4', 'WHT Sales Tax FBR', '0', 'wht_fbr', '1207', '0', '0'),
('6', 'Filer Company', '4', '', '1210', '2', '3'),
('7', 'Nonfiler Company', '6', '', '1210', '2', '1'),
('8', 'Filer Other', '4.5', '', '1210', '2', '1'),
('9', 'Nonfile Other', '6.5', '', '1210', '2', '1'),
('10', 'Filer Company', '8', '', '1208', '1', '2'),
('11', 'Nonfiler Company', '12', '', '1208', '1', '2'),
('12', 'Filer Other', '10', '', '1208', '1', '2'),
('13', 'Nonfiler Other', '15', '', '1208', '1', '2'),
('14', 'SRB 1', '14', '', '1209', '3', '4'),
('15', 'SRB 2', '20', '', '1209', '3', '4'),
('16', 'FBR 1', '1', '', '1206', '4', '3'),
('17', 'FBR 2', '20', '', '1206', '4', '3');
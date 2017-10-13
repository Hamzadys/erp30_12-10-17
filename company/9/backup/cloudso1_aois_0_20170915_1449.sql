# MySQL dump of database 'cloudso1_aois' on host 'localhost'
# Backup Date and Time: 2017-09-15 14:49
# Built by Hisaab.pk 2.4.2
# http://www.hisaab.pk
# Company: AOIS
# User: Administrator

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_areas` ###

INSERT INTO `0_areas` VALUES
('1', 'A - Global', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###

INSERT INTO `0_audit_trail` VALUES
('1', '30', '1', '9', '2017-09-07 07:06:10', NULL, '3', '2017-08-23', NULL),
('2', '18', '1', '9', '2017-08-24 02:24:36', NULL, '3', '2017-08-24', NULL),
('3', '18', '1', '9', '2017-08-24 02:24:36', 'Updated.', '3', '2017-08-24', '0'),
('5', '18', '3', '9', '2017-08-24 02:29:58', NULL, '2', '2016-07-01', '0'),
('6', '17', '1', '9', '2017-08-24 02:36:52', NULL, '3', '2017-08-24', '0'),
('7', '18', '4', '1', '2017-08-24 02:39:55', NULL, '3', '2017-08-24', '0'),
('8', '25', '1', '1', '2017-08-24 02:40:57', NULL, '3', '2017-08-24', '0'),
('9', '20', '1', '1', '2017-08-24 02:41:22', NULL, '3', '2017-08-24', '0'),
('10', '30', '2', '9', '2017-08-24 02:43:04', NULL, '3', '2017-08-24', '0'),
('11', '13', '1', '9', '2017-08-24 02:43:05', NULL, '3', '2017-08-24', '0'),
('12', '10', '1', '9', '2017-08-24 02:43:05', NULL, '3', '2017-08-24', '0'),
('13', '30', '3', '9', '2017-08-24 02:45:34', NULL, '3', '2017-08-24', '0'),
('14', '13', '2', '9', '2017-08-24 02:45:34', NULL, '3', '2017-08-24', '0'),
('15', '10', '2', '9', '2017-08-24 02:45:34', NULL, '3', '2017-08-24', '0'),
('16', '12', '1', '9', '2017-08-24 02:46:46', NULL, '3', '2017-08-24', '0'),
('17', '11', '1', '9', '2017-08-24 02:47:42', NULL, '3', '2017-08-24', '0'),
('18', '25', '2', '9', '2017-08-24 02:52:16', NULL, '3', '2017-08-24', '0'),
('19', '1', '1', '9', '2017-08-24 02:58:15', NULL, '3', '2017-08-24', '0'),
('20', '18', '5', '9', '2017-08-24 05:26:51', NULL, '1', '2016-06-30', '0'),
('21', '25', '3', '9', '2017-08-24 05:29:29', NULL, '1', '2016-05-24', '0'),
('22', '30', '4', '9', '2017-08-24 09:57:18', NULL, '1', '2016-06-30', '0'),
('23', '13', '3', '9', '2017-08-24 09:57:18', NULL, '1', '2016-06-30', '0'),
('24', '10', '3', '9', '2017-08-24 09:57:18', NULL, '1', '2016-06-30', '0'),
('25', '30', '5', '9', '2017-08-29 03:02:32', NULL, '1', '2016-06-30', '0'),
('26', '13', '4', '9', '2017-08-29 03:02:32', NULL, '1', '2016-06-30', '0'),
('27', '10', '4', '9', '2017-08-29 03:02:32', NULL, '1', '2016-06-30', '0'),
('28', '17', '2', '9', '2017-08-29 05:27:47', NULL, '1', '2016-06-30', '0'),
('29', '42', '1', '9', '2017-08-29 05:29:13', NULL, '1', '2016-06-30', NULL),
('30', '42', '1', '9', '2017-08-29 05:29:13', NULL, '1', '2016-06-30', '0'),
('31', '30', '6', '12', '2017-09-07 07:07:10', NULL, '3', '2016-07-01', NULL),
('32', '30', '7', '12', '2017-09-06 07:13:17', NULL, '3', '2017-09-06', NULL),
('33', '30', '8', '9', '2017-09-06 06:28:37', NULL, '1', '2016-06-30', '0'),
('34', '13', '5', '9', '2017-09-06 06:28:37', NULL, '1', '2016-06-30', '0'),
('35', '10', '5', '9', '2017-09-06 06:28:37', NULL, '1', '2016-06-30', '0'),
('36', '30', '7', '12', '2017-09-06 07:13:17', 'Deleted.', '3', '2017-09-06', '0'),
('37', '30', '9', '12', '2017-09-06 07:20:08', NULL, '2', '2016-09-06', '0'),
('38', '30', '10', '12', '2017-09-06 07:30:11', NULL, '3', '2017-09-06', '0'),
('39', '18', '6', '12', '2017-09-06 07:52:56', NULL, '2', '2017-06-06', '0'),
('40', '12', '2', '12', '2017-09-06 09:23:42', NULL, '1', '2016-06-30', '0'),
('41', '30', '1', '12', '2017-09-07 07:06:10', 'Deleted.', '3', '2017-09-07', '0'),
('42', '0', '1', '12', '2017-09-07 07:06:54', 'Deleted.', '3', '2017-09-07', NULL),
('43', '0', '1', '12', '2017-09-07 07:06:54', 'Deleted.', '3', '2017-09-07', '0'),
('44', '30', '6', '12', '2017-09-07 07:07:10', 'Deleted.', '3', '2017-09-07', '0'),
('45', '30', '11', '12', '2017-09-08 02:20:45', NULL, '3', '2017-09-08', '0'),
('46', '13', '6', '12', '2017-09-08 02:20:45', NULL, '3', '2017-09-08', '0'),
('47', '10', '6', '12', '2017-09-08 02:20:45', NULL, '3', '2017-09-08', '0'),
('48', '12', '3', '12', '2017-09-08 02:23:38', NULL, '3', '2017-09-08', '0'),
('49', '30', '12', '12', '2017-09-08 02:24:50', NULL, '3', '2017-09-08', '0'),
('50', '13', '7', '12', '2017-09-08 02:31:17', NULL, '3', '2017-09-08', '0'),
('51', '12', '4', '12', '2017-09-08 02:32:27', NULL, '3', '2017-09-08', '0'),
('52', '41', '1', '12', '2017-09-08 02:34:07', NULL, '3', '2017-09-08', '0'),
('53', '0', '24', '12', '2017-09-08 02:35:51', NULL, '3', '2017-09-08', '0'),
('54', '1', '2', '12', '2017-09-08 02:39:02', NULL, '3', '2017-09-08', NULL),
('55', '1', '2', '12', '2017-09-08 02:39:02', NULL, '3', '2017-09-08', '0'),
('56', '30', '13', '12', '2017-09-08 03:13:41', NULL, '3', '2017-09-08', '0'),
('57', '13', '8', '12', '2017-09-08 03:13:41', NULL, '3', '2017-09-08', '0'),
('58', '10', '7', '12', '2017-09-08 03:13:41', NULL, '3', '2017-09-08', '0'),
('59', '41', '2', '12', '2017-09-08 03:21:46', NULL, '3', '2017-09-08', '0'),
('60', '30', '14', '9', '2017-09-08 06:03:39', NULL, '3', '2017-09-08', '0'),
('61', '13', '9', '9', '2017-09-08 06:03:39', NULL, '3', '2017-09-08', '0'),
('62', '10', '8', '9', '2017-09-08 06:03:39', NULL, '3', '2017-09-08', '0'),
('63', '30', '15', '9', '2017-09-08 06:05:08', NULL, '3', '2017-09-08', '0'),
('64', '13', '10', '9', '2017-09-08 06:05:08', NULL, '3', '2017-09-08', '0'),
('65', '10', '9', '9', '2017-09-08 06:05:08', NULL, '3', '2017-09-08', '0'),
('66', '30', '16', '9', '2017-09-08 06:07:49', NULL, '3', '2017-09-08', '0'),
('67', '13', '11', '9', '2017-09-08 06:07:49', NULL, '3', '2017-09-08', '0'),
('68', '10', '10', '9', '2017-09-08 06:07:49', NULL, '3', '2017-09-08', '0'),
('69', '30', '17', '12', '2017-09-08 07:02:13', NULL, '3', '2017-09-08', '0'),
('70', '13', '12', '12', '2017-09-08 07:02:13', NULL, '3', '2017-09-08', '0'),
('71', '10', '11', '12', '2017-09-08 07:02:14', NULL, '3', '2017-09-08', '0'),
('72', '12', '5', '12', '2017-09-08 07:22:42', NULL, '3', '2017-09-08', '0'),
('73', '12', '6', '12', '2017-09-08 07:28:56', NULL, '3', '2017-09-08', '0'),
('74', '30', '18', '12', '2017-09-08 08:44:12', NULL, '3', '2017-09-08', '0'),
('75', '18', '7', '12', '2017-09-08 08:58:10', NULL, '3', '2017-09-08', '0'),
('76', '0', '25', '12', '2017-09-08 09:12:01', NULL, '3', '2017-09-08', '0'),
('77', '30', '19', '9', '2017-09-11 02:26:29', NULL, '3', '2017-09-11', '0'),
('78', '13', '13', '9', '2017-09-11 02:26:29', NULL, '3', '2017-09-11', '0'),
('79', '10', '12', '9', '2017-09-11 02:26:29', NULL, '3', '2017-09-11', '0'),
('80', '30', '20', '9', '2017-09-11 02:44:41', NULL, '3', '2017-09-11', '0'),
('81', '13', '14', '9', '2017-09-11 02:44:41', NULL, '3', '2017-09-11', '0'),
('82', '10', '13', '9', '2017-09-11 02:44:41', NULL, '3', '2017-09-11', '0'),
('83', '30', '21', '12', '2017-09-12 02:13:23', NULL, '3', '2017-09-12', '0'),
('84', '13', '15', '12', '2017-09-12 02:13:23', NULL, '3', '2017-09-12', '0'),
('85', '10', '14', '12', '2017-09-12 02:13:23', NULL, '3', '2017-09-12', '0'),
('86', '30', '22', '12', '2017-09-12 02:27:05', NULL, '3', '2017-09-12', '0'),
('87', '13', '16', '12', '2017-09-12 02:27:05', NULL, '3', '2017-09-12', '0'),
('88', '10', '15', '12', '2017-09-12 02:27:05', NULL, '3', '2017-09-12', '0'),
('90', '20', '8', '12', '2017-09-12 02:44:38', 'Updated.', '3', '2017-09-12', '0'),
('92', '20', '9', '12', '2017-09-12 02:45:21', 'Updated.', '3', '2017-09-12', '0'),
('93', '30', '23', '12', '2017-09-12 02:46:29', NULL, '3', '2017-09-12', '0'),
('94', '13', '17', '12', '2017-09-12 02:46:29', NULL, '3', '2017-09-12', '0'),
('95', '10', '16', '12', '2017-09-12 02:46:29', NULL, '3', '2017-09-12', '0'),
('96', '4', '1', '12', '2017-09-12 02:59:52', NULL, '3', '2017-09-12', '0'),
('97', '30', '24', '12', '2017-09-12 03:06:28', NULL, '3', '2017-09-12', '0'),
('98', '13', '18', '12', '2017-09-12 03:06:28', NULL, '3', '2017-09-12', '0'),
('99', '10', '17', '12', '2017-09-12 03:06:28', NULL, '3', '2017-09-12', '0'),
('101', '20', '10', '1', '2017-09-12 03:20:25', 'Updated.', '3', '2017-09-12', '0'),
('103', '30', '25', '12', '2017-09-14 03:59:40', NULL, '3', '2017-09-14', '0'),
('104', '13', '19', '12', '2017-09-14 03:59:40', NULL, '3', '2017-09-14', '0'),
('105', '10', '18', '12', '2017-09-14 03:59:40', NULL, '3', '2017-09-14', '0'),
('106', '30', '26', '12', '2017-09-15 02:31:09', NULL, '3', '2017-09-15', '0'),
('107', '13', '20', '12', '2017-09-15 02:31:09', NULL, '3', '2017-09-15', '0'),
('108', '10', '19', '12', '2017-09-15 02:31:09', NULL, '3', '2017-09-15', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('10121', '0', 'JS Bank', '', 'JS Bank', NULL, 'PKR', '0', '1', '5036', '0000-00-00 00:00:00', '0', '0'),
('10122', '0', 'SCB', '', 'SCB', NULL, 'PKR', '0', '2', '5036', '0000-00-00 00:00:00', '0', '0'),
('10111', '3', 'Cash in Hand', '', 'Cash in Hand', NULL, 'PKR', '0', '3', '5036', '0000-00-00 00:00:00', '0', '0'),
('10112', '3', 'Petty Cash', '', 'Petty Cash', NULL, 'PKR', '0', '4', '5036', '0000-00-00 00:00:00', '0', '0'),
('10123', '0', 'Bank 3', '', 'Bank 3', NULL, 'PKR', '0', '5', '5036', '0000-00-00 00:00:00', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_trans` ###

INSERT INTO `0_bank_trans` VALUES
('1', '12', '1', '2', 'CPV001/2017', '2017-08-24', '77925', '0', '0', '2', '4', NULL, '0'),
('2', '1', '1', '5', 'BPV001/2017', '2017-08-24', '-25000', '0', '0', '0', NULL, NULL, '0'),
('3', '42', '1', '3', 'CRV001/2016', '2016-06-30', '10000', '0', '0', '2', '19', NULL, '0'),
('4', '12', '2', '5', 'CPV002/2017', '2016-06-30', '37300', '0', '0', '2', '19', NULL, '0'),
('5', '12', '3', '5', 'CPV003/2017', '2017-09-08', '3730', '0', '0', '2', '19', NULL, '0'),
('6', '12', '4', '1', 'CPV004/2017', '2017-09-08', '58188', '0', '0', '2', '19', NULL, '0'),
('7', '41', '1', '3', 'CPV001/2017', '2017-09-08', '-200', '0', '0', '0', NULL, NULL, '0'),
('8', '0', '24', '4', 'JV001/2017', '2017-09-08', '1000', '0', '0', '0', NULL, NULL, '0'),
('9', '1', '2', '1', 'BPV002/2017', '2017-09-08', '-5000', '0', '0', '2', '4', NULL, '220902'),
('10', '41', '2', '3', 'CPV002/2017', '2017-09-08', '-500', '0', '0', '0', NULL, NULL, '0'),
('11', '12', '5', '3', 'CPV005/2017', '2017-09-08', '70000', '0', '0', '2', '11', NULL, '0'),
('12', '12', '6', '1', 'CPV006/2017', '2017-09-08', '5000', '0', '0', '2', '11', NULL, '0'),
('13', '0', '25', '3', 'JV002/2017', '2017-09-08', '-25000', '0', '0', '0', NULL, NULL, '0'),
('14', '4', '1', '1', 'FTV001/2017', '2017-09-12', '-10000', '0', '0', '0', 'From JS Bank To Petty Cash', NULL, '0'),
('15', '4', '1', '4', 'FTV001/2017', '2017-09-12', '10000', '0', '0', '0', 'From JS Bank To Petty Cash', NULL, '0');

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
('40', 'Income', '4', '0'),
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
('1011', '', 'Cash', '1011', '0'),
('10111', '', 'Cash in Hand', '1011', '0'),
('10112', '', 'Petty Cash', '1011', '0'),
('10121', '', 'JS Bank', '1012', '0'),
('10122', '', 'SCB', '1012', '0'),
('10123', '', 'Cash', '101', '0'),
('1013', '', 'Accounts Receivables', '101', '0'),
('1014', '', 'Allowance for doubtful accounts', '101', '0'),
('1015', '', 'Witholding Tax Deducted at Source', '101', '0'),
('1016', '', 'Witholding Tax Deducted at Source - Service', '101', '0'),
('1017', '', 'Witholding Tax Deducted at Source - SRB/PRA', '101', '0'),
('1018', '', 'Witholding Tax Deducted at Source - Supplies', '101', '0'),
('1021', '', 'Inventory', '102', '0'),
('1022', '', 'Stocks of Raw Materials', '102', '0'),
('1023', '', 'Stocks of Work In Progress', '102', '0'),
('1024', '', 'Stocks of Finished Goods', '102', '0'),
('1025', '', 'Goods Received Clearing account', '102', '0'),
('1031', '', 'Office Furniture and Equipment', '103', '0'),
('1032', '', 'Accum. Amort. - Furn. and Equip.', '103', '0'),
('1033', '', 'Vehicle', '103', '0'),
('1034', '', 'Accum. Amort. - Vehicle', '103', '0'),
('2011', '', 'Accounts Payable', '201', '0'),
('2012', '', 'Witholding Tax', '201', '0'),
('2013', '', 'GST Input', '201', '0'),
('2014', '', 'GST Output', '201', '0'),
('2021', '', 'Bank Loans', '202', '0'),
('2022', '', 'Loans from Shareholders', '202', '0'),
('3011', '', 'Common Shares', '301', '0'),
('3012', '', 'Opening Balance Equity', '301', '0'),
('3021', '', 'Reserves and Surplus', '302', '0'),
('4011', '', 'Sales Revenue', '401', '0'),
('4021', '', 'Shipping and Handling', '402', '0'),
('4022', '', 'Interest', '402', '0'),
('4023', '', 'Foreign Exchange Gain', '402', '0'),
('4024', '', 'Incentives', '101', '0'),
('4025', '', 'Discounts Given', '402', '0'),
('4026', '', 'Incentive', '402', '0'),
('5011', '', 'Cost of Goods Sold - Retail', '501', '0'),
('5012', '', 'Material Usage Variance', '501', '0'),
('5013', '', 'Consumable Materials', '501', '0'),
('5014', '', 'Purchase Price Variance', '501', '0'),
('5015', '', 'Purchases of Materials', '501', '0'),
('5016', '', 'Discounts Received', '501', '0'),
('5017', '', 'Freight', '501', '0'),
('5018', '', 'Salary - Employee 1', '502', '0'),
('5019', '', 'Salary - Employee 2', '502', '0'),
('5020', '', 'Tauseef - Salary', '502', '0'),
('5030', '', 'Profit and Loss', '503', '0'),
('5032', '', 'Advertising and Promotions', '503', '0'),
('5033', '', 'Bad Debts', '503', '0'),
('5034', '', 'Amortization Expense', '503', '0'),
('5035', '', 'Traveling', '503', '0'),
('5036', '', 'Interest and Bank Charges', '503', '0'),
('5037', '', 'Office Supplies', '503', '0'),
('5038', '', 'Rent', '503', '0'),
('5039', '', 'Repair and Maintenance', '503', '0'),
('5040', '', 'Telephone', '503', '0'),
('5041', '', 'Entertainment', '503', '0'),
('5042', '', 'Utility Bills', '503', '0'),
('5043', '', 'Registrations', '503', '0'),
('5044', '', 'Licenses', '503', '0'),
('5045', '', 'Foreign Exchange Loss', '503', '0');

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
('101', 'Current Assets', '10', '', '0'),
('1011', 'Cash', '10', '101', '0'),
('1012', 'Bank', '10', '101', '0'),
('102', 'Inventory Assets', '10', '', '0'),
('103', 'Fixed Assets', '10', '', '0'),
('201', 'Current Liabilities', '20', '', '0'),
('202', 'Long Term Liabilities', '20', '', '0'),
('301', 'Share Capital', '30', '', '0'),
('302', 'Retained Earnings', '30', '', '0'),
('401', 'Sales Revenue', '40', '', '0'),
('402', 'Other Revenue', '40', '', '0'),
('501', 'Cost of Goods Sold', '50', '', '0'),
('502', 'Payroll Expenses', '50', '', '0'),
('503', 'General &amp; Administrative Expenses', '50', '', '0');

### Structure of table `0_combo_1` ###

DROP TABLE IF EXISTS `0_combo_1`;

CREATE TABLE `0_combo_1` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_1` ###


### Structure of table `0_combo_2` ###

DROP TABLE IF EXISTS `0_combo_2`;

CREATE TABLE `0_combo_2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_2` ###


### Structure of table `0_combo_3` ###

DROP TABLE IF EXISTS `0_combo_3`;

CREATE TABLE `0_combo_3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_3` ###


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
('12', '5', '2017-09-08', 'Partial Payment'),
('4', '1', '2017-09-12', 'cash withdrawl');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('1', '1', 'cust_branch', 'general', '2'),
('2', '1', 'customer', 'general', '3'),
('3', '2', 'cust_branch', 'general', '3'),
('4', '2', 'customer', 'general', '4'),
('5', '3', 'cust_branch', 'general', '4'),
('6', '3', 'customer', 'general', '5'),
('7', '4', 'cust_branch', 'general', '5'),
('8', '4', 'customer', 'general', '6'),
('9', '5', 'cust_branch', 'general', '6'),
('10', '5', 'customer', 'general', '7'),
('11', '6', 'cust_branch', 'general', '7'),
('12', '6', 'customer', 'general', '8'),
('13', '7', 'cust_branch', 'general', '8'),
('14', '7', 'customer', 'general', '9'),
('15', '8', 'cust_branch', 'general', '9'),
('16', '8', 'customer', 'general', '10'),
('17', '9', 'cust_branch', 'general', '10'),
('18', '9', 'customer', 'general', '11'),
('19', '10', 'cust_branch', 'general', '11'),
('20', '10', 'customer', 'general', '12'),
('21', '11', 'cust_branch', 'general', '12'),
('22', '11', 'customer', 'general', '13'),
('23', '12', 'cust_branch', 'general', '13'),
('24', '12', 'customer', 'general', '14'),
('25', '13', 'cust_branch', 'general', '14'),
('26', '13', 'customer', 'general', '15'),
('27', '14', 'cust_branch', 'general', '15'),
('28', '14', 'customer', 'general', '16'),
('29', '15', 'cust_branch', 'general', '16'),
('30', '15', 'customer', 'general', '17'),
('31', '16', 'cust_branch', 'general', '17'),
('32', '16', 'customer', 'general', '18'),
('33', '17', 'cust_branch', 'general', '18'),
('34', '17', 'customer', 'general', '19'),
('35', '18', 'supplier', 'general', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', 'DW1 BAN', 'D.Watson Blue Area New', NULL, 'Blue Area =', NULL, NULL, NULL, NULL, NULL, '', '0'),
('2', 'DW1 BAO', 'D.Watson Blue Area Old', NULL, 'Blue Area', NULL, NULL, NULL, NULL, NULL, '', '0'),
('3', 'DW2 Scheme-3', 'D.Watson Scheme-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('4', 'DW2 Bahria', 'D.Watson Bahria Town', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('5', 'DW1 CHK', 'D.Watson Chakwal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('6', 'DW1 G-11', 'D.Watson G-11', NULL, 'G-11 Markaz, Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('7', 'DW1 F-11', 'D.Watson F-11', NULL, 'F-11 Markaz, Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('8', 'DW1 BK', 'D.Watson Barakhu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('9', 'DW2 F-6', 'D.Watson F-6 Super Market', NULL, 'Super Market, F-6 Markaz, Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('10', 'DW2 PWD', 'D.Watson PWD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('11', 'DW2 CC', 'D.Watson Chandni Chowk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('12', 'DW2 MR', 'D.Watson Mall Road', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('13', 'DW2 SDP', 'D.Watson Saidpur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('14', 'DW2 DHA', 'D.Watson DHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('15', 'DW2 G-9', 'D.Watson G-9', NULL, 'Karachi Company, G-9 Markaz, Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('16', 'DW1 PSH', 'D.Watson Peshawar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('17', 'Dr. Seemi', 'Dr. Seemi (Tahir Golden)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('18', 'Test Supplier', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_allocations` ###

INSERT INTO `0_cust_allocations` VALUES
('1', '4', '77925', '0000-00-00', '1', '12', '1', '10'),
('2', '19', '37300', '0000-00-00', '2', '12', '4', '10'),
('3', '19', '3730', '0000-00-00', '3', '12', '6', '10'),
('4', '19', '58188', '0000-00-00', '4', '12', '5', '10'),
('5', '11', '70000', '0000-00-00', '5', '12', '11', '10'),
('6', '11', '5000', '0000-00-00', '6', '12', '11', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('1', '1', 'Test Customer', 'Test Customer', 'Lahore', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0'),
('2', '3', 'D.Watson Blue Area New', 'DW1 BAN', 'Blue Area =', '1', '1', 'DEF', '2', '', '4025', '1013', '4025', '1', 'Blue Area =', '0', '', NULL, '0'),
('3', '4', 'D.Watson Blue Area Old', 'DW1 BAO', 'Blue Area', '1', '1', 'DEF', '2', '', '4025', '1013', '4025', '1', 'Blue Area', '0', '', NULL, '0'),
('4', '5', 'D.Watson Scheme-3', 'DW2 Scheme-3', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('5', '6', 'D.Watson Bahria Town', 'DW2 Bahria', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('6', '7', 'D.Watson Chakwal', 'DW1 CHK', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('7', '8', 'D.Watson G-11', 'DW1 G-11', 'G-11 Markaz, Islamabad', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'G-11 Markaz, Islamabad', '0', '', NULL, '0'),
('8', '9', 'D.Watson F-11', 'DW1 F-11', 'F-11 Markaz, Islamabad', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'F-11 Markaz, Islamabad', '0', '', NULL, '0'),
('9', '10', 'D.Watson Barakhu', 'DW1 BK', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('10', '11', 'D.Watson F-6 Super Market', 'DW2 F-6', 'Super Market, F-6 Markaz, Islamabad', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Super Market, F-6 Markaz, Islamabad', '0', '', NULL, '0'),
('11', '12', 'D.Watson PWD', 'DW2 PWD', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('12', '13', 'D.Watson Chandni Chowk', 'DW2 CC', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('13', '14', 'D.Watson Mall Road', 'DW2 MR', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('14', '15', 'D.Watson Saidpur', 'DW2 SDP', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('15', '16', 'D.Watson DHA', 'DW2 DHA', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('16', '17', 'D.Watson G-9', 'DW2 G-9', 'Karachi Company, G-9 Markaz, Islamabad', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Karachi Company, G-9 Markaz, Islamabad', '0', '', NULL, '0'),
('17', '18', 'D.Watson Peshawar', 'DW1 PSH', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0'),
('18', '19', 'Dr. Seemi (Tahir Golden)', 'Dr. Seemi', '', '1', '1', 'DEF', '2', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0');

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
  `discount1` double NOT NULL,
  `discount2` double NOT NULL,
  `disc1` double NOT NULL,
  `disc2` double NOT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `debtor_no` (`debtor_no`,`branch_code`),
  KEY `tran_date` (`tran_date`),
  KEY `order_` (`order_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans` ###

INSERT INTO `0_debtor_trans` VALUES
('2', '1', '0', '4', '3', '2017-09-08', '0000-00-00', 'BPV002/2017', '0', '0', '5000', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '10', '0', '4', '3', '2017-08-24', '2017-09-08', 'SI001/2017', '1', '2', '77925', '0', '0', '0', '0', '0', '77925', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('2', '10', '0', '4', '3', '2017-08-24', '2017-09-08', 'SI002/2017', '1', '3', '10390', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('3', '10', '0', '4', '3', '2016-06-30', '2016-07-15', 'SI001/2016', '1', '4', '29247.88', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('4', '10', '0', '19', '18', '2016-06-30', '2016-07-15', 'SI002/2016', '1', '5', '37300', '0', '0', '0', '0', '0', '37300', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('5', '10', '0', '19', '18', '2016-06-30', '2016-07-15', 'SI003/2016', '1', '8', '58188', '0', '0', '0', '0', '0', '58188', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('6', '10', '0', '19', '18', '2017-09-08', '2017-09-23', 'SI003/2017', '1', '11', '3730', '0', '0', '0', '0', '0', '3730', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('7', '10', '0', '19', '18', '2017-09-08', '2017-09-23', 'SI004/2017', '1', '13', '746', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '46', '0', '0'),
('8', '10', '0', '19', '18', '2017-09-08', '2017-09-23', 'SI005/2017', '1', '14', '106321.68', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('9', '10', '0', '19', '18', '2017-09-08', '2017-09-23', 'SI006/2017', '1', '15', '135457', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('10', '10', '0', '19', '18', '2017-09-08', '2017-09-23', 'SI007/2017', '1', '16', '74600', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('11', '10', '0', '11', '10', '2017-09-08', '2017-09-23', 'SI008/2017', '1', '17', '63135.72', '11995.79', '0', '0', '0', '0', '75000', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('12', '10', '0', '19', '18', '2017-09-11', '2017-09-26', 'SI009/2017', '1', '19', '47785.6', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('13', '10', '0', '19', '18', '2017-09-11', '2017-09-26', 'SI010/2017', '1', '20', '55950', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('14', '10', '0', '19', '18', '2017-09-12', '2017-09-27', 'SI011/2017', '1', '21', '5968', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('15', '10', '0', '19', '18', '2017-09-12', '2017-09-27', 'SI012/2017', '1', '22', '5968', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('16', '10', '0', '19', '18', '2017-09-12', '2017-09-27', 'SI013/2017', '1', '23', '400', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('17', '10', '0', '19', '18', '2017-09-12', '2017-09-27', 'SI014/2017', '1', '24', '149200', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '37300', '8000', '0', '0'),
('18', '10', '0', '19', '18', '2017-09-14', '2017-09-29', 'SI015/2017', '1', '25', '65648', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('19', '10', '0', '19', '18', '2017-09-15', '2017-09-30', 'SI016/2017', '1', '26', '5968', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '11', '0', '4', '3', '2017-08-24', '0000-00-00', 'CCN001/2017', '1', '0', '2797.5', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '12', '0', '4', '3', '2017-08-24', '0000-00-00', 'CPV001/2017', '0', '0', '77925', '0', '0', '0', '0', '0', '77925', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('2', '12', '0', '19', '18', '2016-06-30', '0000-00-00', 'CPV002/2017', '0', '0', '37300', '0', '0', '0', '0', '0', '37300', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('3', '12', '0', '19', '18', '2017-09-08', '0000-00-00', 'CPV003/2017', '0', '0', '3730', '0', '0', '0', '0', '0', '3730', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('4', '12', '0', '19', '18', '2017-09-08', '0000-00-00', 'CPV004/2017', '0', '0', '58188', '0', '0', '0', '0', '0', '58188', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('5', '12', '0', '11', '10', '2017-09-08', '0000-00-00', 'CPV005/2017', '0', '0', '70000', '0', '0', '0', '0', '0', '70000', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('6', '12', '0', '11', '10', '2017-09-08', '0000-00-00', 'CPV006/2017', '0', '0', '5000', '0', '0', '0', '0', '0', '5000', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '13', '1', '4', '3', '2017-08-24', '2017-09-08', 'auto', '1', '2', '77925', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('2', '13', '1', '4', '3', '2017-08-24', '2017-09-08', 'auto', '1', '3', '10390', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('3', '13', '1', '4', '3', '2016-06-30', '2016-07-15', 'auto', '1', '4', '29247.88', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('4', '13', '1', '19', '18', '2016-06-30', '2016-07-15', 'auto', '1', '5', '37300', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('5', '13', '1', '19', '18', '2016-06-30', '2016-07-15', 'auto', '1', '8', '58188', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('6', '13', '1', '19', '18', '2017-09-08', '2017-09-23', 'auto', '1', '11', '3730', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('7', '13', '0', '19', '18', '2017-09-08', '2017-09-09', 'DN001/2017', '1', '12', '746', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('8', '13', '1', '19', '18', '2017-09-08', '2017-09-23', 'auto', '1', '13', '746', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '46', '0', '0'),
('9', '13', '1', '19', '18', '2017-09-08', '2017-09-23', 'auto', '1', '14', '106321.68', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('10', '13', '1', '19', '18', '2017-09-08', '2017-09-23', 'auto', '1', '15', '135457', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('11', '13', '1', '19', '18', '2017-09-08', '2017-09-23', 'auto', '1', '16', '74600', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('12', '13', '1', '11', '10', '2017-09-08', '2017-09-23', 'auto', '1', '17', '63135.72', '11995.79', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('13', '13', '1', '19', '18', '2017-09-11', '2017-09-26', 'auto', '1', '19', '47785.6', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('14', '13', '1', '19', '18', '2017-09-11', '2017-09-26', 'auto', '1', '20', '55950', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('15', '13', '1', '19', '18', '2017-09-12', '2017-09-27', 'auto', '1', '21', '5968', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('16', '13', '1', '19', '18', '2017-09-12', '2017-09-27', 'auto', '1', '22', '5968', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('17', '13', '1', '19', '18', '2017-09-12', '2017-09-27', 'auto', '1', '23', '400', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('18', '13', '1', '19', '18', '2017-09-12', '2017-09-27', 'auto', '1', '24', '149200', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '37300', '8000', '0', '0'),
('19', '13', '1', '19', '18', '2017-09-14', '2017-09-29', 'auto', '1', '25', '65648', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('20', '13', '1', '19', '18', '2017-09-15', '2017-09-30', 'auto', '1', '26', '5968', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '42', '0', '19', '18', '2016-06-30', '0000-00-00', 'CRV001/2016', '0', '0', '10000', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans_details` ###

INSERT INTO `0_debtor_trans_details` VALUES
('1', '1', '13', '1001', 'Vitamin D3', '746', '0', '100', '0', '300', '100', '3'),
('2', '1', '13', '1002', 'Vitamin C', '746', '0', '50', '0', '300', '50', '4'),
('3', '1', '13', 'DC', 'DISCOUNT', '-27975', '0', '1', '0', '0', '1', '5'),
('4', '1', '13', 'IVE', 'INCENTIVE', '-6000', '0', '1', '0', '0', '1', '6'),
('5', '1', '10', '1001', 'Vitamin D3', '746', '0', '100', '0', '300', '0', '1'),
('6', '1', '10', '1002', 'Vitamin C', '746', '0', '50', '0', '300', '0', '2'),
('7', '1', '10', 'DC', 'DISCOUNT', '-27975', '0', '1', '0', '0', '0', '3'),
('8', '1', '10', 'IVE', 'INCENTIVE', '-6000', '0', '1', '0', '0', '0', '4'),
('9', '2', '13', '1001', 'Vitamin D3', '746', '0', '10', '0.25', '300', '10', '7'),
('10', '2', '13', '1002', 'Vitamin C', '746', '0', '10', '0.25', '300', '10', '8'),
('11', '2', '13', 'IVE', 'INCENTIVE', '-800', '0', '1', '0', '0', '1', '9'),
('12', '2', '10', '1001', 'Vitamin D3', '746', '0', '10', '0.25', '300', '0', '9'),
('13', '2', '10', '1002', 'Vitamin C', '746', '0', '10', '0.25', '300', '0', '10'),
('14', '2', '10', 'IVE', 'INCENTIVE', '-800', '0', '1', '0', '0', '0', '11'),
('15', '1', '11', '1001', 'Vitamin D3', '746', '0', '5', '0.25', '0', '0', '0'),
('16', '3', '13', '1001', 'Vitamin D3', '746', '0', '12', '0', '257.137418033', '12', '10'),
('17', '3', '13', '1002', 'Vitamin C', '746', '0', '15', '0', '254.72617423', '15', '11'),
('18', '3', '13', '1013', 'Omega 3 Fish Oil', '266.83', '0', '36', '0', '222.36', '36', '12'),
('19', '3', '13', 'DC', 'DISCOUNT', '-1000', '0', '1', '0', '0', '1', '13'),
('20', '3', '13', 'IVE', 'INCENTIVE', '500', '0', '1', '0', '0', '1', '14'),
('21', '3', '10', '1001', 'Vitamin D3', '746', '0', '12', '0', '257.137418033', '0', '16'),
('22', '3', '10', '1002', 'Vitamin C', '746', '0', '15', '0', '254.72617423', '0', '17'),
('23', '3', '10', '1013', 'Omega 3 Fish Oil', '266.83', '0', '36', '0', '222.36', '0', '18'),
('24', '3', '10', 'DC', 'DISCOUNT', '-1000', '0', '1', '0', '0', '0', '19'),
('25', '3', '10', 'IVE', 'INCENTIVE', '500', '0', '1', '0', '0', '0', '20'),
('26', '4', '13', '1001', 'Vitamin D3', '746', '0', '50', '0', '257.137418033', '50', '15'),
('27', '4', '10', '1001', 'Vitamin D3', '746', '0', '50', '0', '257.137418033', '0', '26'),
('28', '5', '13', '1001', 'Vitamin D3', '746', '0', '78', '0', '257.137418033', '78', '18'),
('29', '5', '10', '1001', 'Vitamin D3', '746', '0', '78', '0', '257.137418033', '0', '28'),
('30', '6', '13', '1001', 'Vitamin D3', '746', '0', '5', '0', '257.137418033', '5', '27'),
('31', '6', '13', 'DC', 'DISCOUNT', '0', '0', '5', '0', '0', '5', '28'),
('32', '6', '10', '1001', 'Vitamin D3', '746', '0', '5', '0', '257.137418033', '0', '30'),
('33', '6', '10', 'DC', 'DISCOUNT', '0', '0', '5', '0', '0', '0', '31'),
('34', '7', '13', '1001', 'Vitamin D3', '746', '0', '1', '0', '257.137418033', '0', '29'),
('35', '8', '13', '1001', 'Vitamin D3', '746', '0', '1', '0', '257.137418033', '1', '30'),
('36', '7', '10', '1001', 'Vitamin D3', '746', '0', '1', '0', '257.137418033', '0', '35'),
('37', '9', '13', '1001', 'Vitamin D3', '746', '0', '100', '0', '257.137418033', '100', '31'),
('38', '9', '13', '1003', 'Folic Acid', '255.82', '0', '124', '0', '213.18', '124', '32'),
('39', '8', '10', '1001', 'Vitamin D3', '746', '0', '100', '0', '257.137418033', '0', '37'),
('40', '8', '10', '1003', 'Folic Acid', '255.82', '0', '124', '0', '213.18', '0', '38'),
('41', '10', '13', '1002', 'Vitamin C', '746', '0', '177', '0', '254.72617423', '177', '33'),
('42', '10', '13', '1005', 'Natural Vitamin E', '341.5', '0', '10', '0', '284.58', '10', '34'),
('43', '9', '10', '1002', 'Vitamin C', '746', '0', '177', '0', '254.72617423', '0', '41'),
('44', '9', '10', '1005', 'Natural Vitamin E', '341.5', '0', '10', '0', '284.58', '0', '42'),
('45', '11', '13', '1001', 'Vitamin D3', '746', '0', '100', '0', '257.137418033', '100', '35'),
('46', '11', '13', 'DC', 'DISCOUNT', '0', '0', '1', '0', '0', '1', '36'),
('47', '10', '10', '1001', 'Vitamin D3', '746', '0', '100', '0', '257.137418033', '0', '45'),
('48', '10', '10', 'DC', 'DISCOUNT', '0', '0', '1', '0', '0', '0', '46'),
('49', '12', '13', '1007', 'Calcium + Magnesium + Zinc +D', '231.34', '43.95', '12', '0', '192.78', '12', '37'),
('50', '12', '13', '1008', 'Calcium 600 + Vitamin D', '230.11', '43.72', '12', '0', '191.76', '12', '38'),
('51', '12', '13', '1012', 'Cod Liver Oil', '376.99', '71.63', '12', '0', '314.16', '12', '39'),
('52', '12', '13', '1009', 'CoQ - 10', '473.69', '90', '12', '0', '394.74', '12', '40'),
('53', '12', '13', '1014', 'Evening Prime Rose Oil', '369.65', '70.23', '12', '0', '308.04', '12', '41'),
('54', '12', '13', '1010', 'Glucosamine &amp; Chondroitin', '362.3', '68.84', '12', '0', '301.92', '12', '42'),
('55', '12', '13', '1013', 'Omega 3 Fish Oil', '266.83', '50.7', '24', '0', '222.36', '24', '43'),
('56', '12', '13', '1002', 'Vitamin C', '746', '141.74', '12', '0', '254.72617423', '12', '44'),
('57', '12', '13', '1001', 'Vitamin D3', '746', '141.74', '12', '0', '257.137418033', '12', '45'),
('58', '12', '13', '1005', 'Natural Vitamin E', '341.5', '64.89', '6', '0', '284.58', '6', '46'),
('59', '12', '13', '1017', 'Multivitamin for Men', '335.38', '63.72', '24', '0', '279.48', '24', '47'),
('60', '12', '13', '1018', 'Multivitamin for Women', '350.06', '66.51', '12', '0', '291.72', '12', '48'),
('61', '11', '10', '1007', 'Calcium + Magnesium + Zinc +D', '231.34', '43.955', '12', '0', '192.78', '0', '49'),
('62', '11', '10', '1008', 'Calcium 600 + Vitamin D', '230.11', '43.720833333333', '12', '0', '191.76', '0', '50'),
('63', '11', '10', '1012', 'Cod Liver Oil', '376.99', '71.628333333333', '12', '0', '314.16', '0', '51'),
('64', '11', '10', '1009', 'CoQ - 10', '473.69', '90.000833333333', '12', '0', '394.74', '0', '52'),
('65', '11', '10', '1014', 'Evening Prime Rose Oil', '369.65', '70.233333333333', '12', '0', '308.04', '0', '53'),
('66', '11', '10', '1010', 'Glucosamine &amp; Chondroitin', '362.3', '68.836666666667', '12', '0', '301.92', '0', '54'),
('67', '11', '10', '1013', 'Omega 3 Fish Oil', '266.83', '50.6975', '24', '0', '222.36', '0', '55'),
('68', '11', '10', '1002', 'Vitamin C', '746', '141.74', '12', '0', '254.72617423', '0', '56'),
('69', '11', '10', '1001', 'Vitamin D3', '746', '141.74', '12', '0', '257.137418033', '0', '57'),
('70', '11', '10', '1005', 'Natural Vitamin E', '341.5', '64.885', '6', '0', '284.58', '0', '58'),
('71', '11', '10', '1017', 'Multivitamin for Men', '335.38', '63.722083333333', '24', '0', '279.48', '0', '59'),
('72', '11', '10', '1018', 'Multivitamin for Women', '350.06', '66.511666666667', '12', '0', '291.72', '0', '60'),
('73', '13', '13', '1005', 'Natural Vitamin E', '341.5', '0', '100', '0.2', '284.58', '100', '52'),
('74', '13', '13', '1003', 'Folic Acid', '255.82', '0', '100', '0.2', '213.18', '100', '53'),
('75', '12', '10', '1005', 'Natural Vitamin E', '341.5', '0', '100', '0.2', '284.58', '0', '73'),
('76', '12', '10', '1003', 'Folic Acid', '255.82', '0', '100', '0.2', '213.18', '0', '74'),
('77', '14', '13', '1002', 'Vitamin C', '746', '0', '100', '0.25', '254.72617423', '100', '54'),
('78', '13', '10', '1002', 'Vitamin C', '746', '0', '100', '0.25', '254.72617423', '0', '77'),
('79', '15', '13', '1002', 'Vitamin C', '746', '0', '10', '0.2', '254.72617423', '10', '55'),
('80', '14', '10', '1002', 'Vitamin C', '746', '0', '10', '0.2', '254.72617423', '0', '79'),
('81', '16', '13', '1001', 'Vitamin D3', '746', '0', '10', '0.2', '257.137418033', '10', '56'),
('82', '15', '10', '1001', 'Vitamin D3', '746', '0', '10', '0.2', '257.137418033', '0', '81'),
('83', '17', '13', '1001', 'Vitamin D3', '500', '0', '1', '0.2', '257.137418033', '1', '57'),
('84', '16', '10', '1001', 'Vitamin D3', '500', '0', '1', '0.2', '257.137418033', '0', '83'),
('85', '18', '13', '1001', 'Vitamin D3', '746', '0', '1', '0', '257.137418033', '1', '58'),
('86', '18', '13', '1001', 'Vitamin D3', '746', '0', '199', '0', '257.137418033', '199', '59'),
('87', '17', '10', '1001', 'Vitamin D3', '746', '0', '1', '0', '257.137418033', '0', '85'),
('88', '17', '10', '1001', 'Vitamin D3', '746', '0', '199', '0', '257.137418033', '0', '86'),
('89', '19', '13', '1001', 'Vitamin D3', '746', '0', '110', '0.2', '257.137418033', '110', '60'),
('90', '18', '10', '1001', 'Vitamin D3', '746', '0', '110', '0.2', '257.137418033', '0', '89'),
('91', '20', '13', '1001', 'Vitamin D3', '746', '0', '10', '0.2', '257.137418033', '10', '61'),
('92', '19', '10', '1001', 'Vitamin D3', '746', '0', '10', '0.2', '257.137418033', '0', '91');

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
  `credit_allowed` double DEFAULT NULL,
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('1', 'D.Watson F-10', 'DW1 F-10', 'F-10 Markaz Islamabad', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', NULL),
('3', 'D.Watson Blue Area New', 'DW1 BAN', 'Deen Pavillion, Blue Area , Sector F-7, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('4', 'D.Watson Blue Area Old', 'DW1 BAO', 'Shop # 04, Khyber Plaza, F-7 Blue Area, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0.25', '0', '0', '', '0', NULL),
('5', 'D.Watson Scheme-3', 'DW2 Scheme-3', 'Plot # 48, Main Commercial Market Scheme 3 , Rawalpindi', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('6', 'D.Watson Bahria Town', 'DW2 Bahria', 'Fortune Arcade, Central Avenue, Phase 6, Bahria Town, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('7', 'D.Watson Chakwal', 'DW1 CHK', 'Medicine Section, Fruit Mandi, Talagang Road, Chakwal', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('8', 'D.Watson G-11', 'DW1 G-11', 'Al Hameed Plaza, G-11 Markaz, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('9', 'D.Watson F-11', 'DW1 F-11', 'F-11 Markaz, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('10', 'D.Watson Barakhu', 'DW1 BK', 'Murree Road, Barakahu, Islamabad.', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('11', 'D.Watson F-6 Super Market', 'DW2 F-6', 'Super Market, F-6 Markaz, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('12', 'D.Watson PWD', 'DW2 PWD', NULL, '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('13', 'D.Watson Chandni Chowk', 'DW2 CC', NULL, '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('14', 'D.Watson Mall Road', 'DW2 MR', NULL, '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('15', 'D.Watson Saidpur', 'DW2 SDP', NULL, '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('16', 'D.Watson DHA', 'DW2 DHA', NULL, '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('17', 'D.Watson G-9', 'DW2 G-9', 'Karachi Company, G-9 Markaz, Islamabad', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('18', 'D.Watson Peshawar', 'DW1 PSH', 'Peshawar', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('19', 'Dr. Seemi (Tahir Golden)', 'Dr. Seemi', NULL, '', '', 'PKR', '1', '0', '0', '1', '1', '0.2', '0', '0', '', '0', NULL);

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
  `cust_name` int(11) NOT NULL,
  `sales_person` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `ref_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ref_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ref_3` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `date_` (`date_`),
  KEY `due_date` (`due_date`),
  KEY `type_` (`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_dimensions` ###


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_exchange_rates` ###

INSERT INTO `0_exchange_rates` VALUES
('2', 'USD', '105', '105', '2017-02-17'),
('6', 'USD', '102', '102', '2016-07-01'),
('8', 'USD', '105', '105', '2017-08-24'),
('9', 'USD', '101', '101', '2016-01-11'),
('10', 'USD', '102', '102', '2016-05-24');

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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###

INSERT INTO `0_gl_trans` VALUES
('1', '17', '1', '2017-08-24', '5014', '', '-300000', '0', '0', NULL, NULL, '0'),
('2', '17', '1', '2017-08-24', '1021', '', '300000', '0', '0', NULL, NULL, '0'),
('3', '17', '1', '2017-08-24', '5014', '', '-300000', '0', '0', NULL, NULL, '0'),
('4', '17', '1', '2017-08-24', '1021', '', '300000', '0', '0', NULL, NULL, '0'),
('5', '20', '1', '2017-08-24', '2011', '', '-349965', '0', '0', '3', '1', '0'),
('6', '20', '1', '2017-08-24', '4025', '', '349965', '0', '0', NULL, NULL, '0'),
('7', '13', '1', '2017-08-24', '5011', '', '30000', '0', '0', NULL, NULL, '0'),
('8', '13', '1', '2017-08-24', '1021', '', '-30000', '0', '0', NULL, NULL, '0'),
('9', '13', '1', '2017-08-24', '5011', '', '15000', '0', '0', NULL, NULL, '0'),
('10', '13', '1', '2017-08-24', '1021', '', '-15000', '0', '0', NULL, NULL, '0'),
('11', '10', '1', '2017-08-24', '4011', '', '-74600', '0', '0', NULL, NULL, '0'),
('12', '10', '1', '2017-08-24', '4011', '', '-37300', '0', '0', NULL, NULL, '0'),
('13', '10', '1', '2017-08-24', '4025', '', '27975', '0', '0', NULL, NULL, '0'),
('14', '10', '1', '2017-08-24', '4024', '', '6000', '0', '0', NULL, NULL, '0'),
('15', '10', '1', '2017-08-24', '1013', '', '77925', '0', '0', '2', '4', '0'),
('16', '13', '2', '2017-08-24', '5011', '', '3000', '0', '0', NULL, NULL, '0'),
('17', '13', '2', '2017-08-24', '1021', '', '-3000', '0', '0', NULL, NULL, '0'),
('18', '13', '2', '2017-08-24', '5011', '', '3000', '0', '0', NULL, NULL, '0'),
('19', '13', '2', '2017-08-24', '1021', '', '-3000', '0', '0', NULL, NULL, '0'),
('20', '10', '2', '2017-08-24', '4011', '', '-7460', '0', '0', NULL, NULL, '0'),
('21', '10', '2', '2017-08-24', '4025', '', '1865', '0', '0', NULL, NULL, '0'),
('22', '10', '2', '2017-08-24', '4011', '', '-7460', '0', '0', NULL, NULL, '0'),
('23', '10', '2', '2017-08-24', '4025', '', '1865', '0', '0', NULL, NULL, '0'),
('24', '10', '2', '2017-08-24', '4024', '', '800', '0', '0', NULL, NULL, '0'),
('25', '10', '2', '2017-08-24', '1013', '', '10390', '0', '0', '2', '4', '0'),
('26', '12', '1', '2017-08-24', '10122', '', '77925', '0', '0', NULL, NULL, '0'),
('27', '12', '1', '2017-08-24', '1013', '', '-77925', '0', '0', '2', '4', '0'),
('28', '11', '1', '2017-08-24', '5011', '', '-1500', '0', '0', NULL, NULL, '0'),
('29', '11', '1', '2017-08-24', '1021', '', '1500', '0', '0', NULL, NULL, '0'),
('30', '11', '1', '2017-08-24', '4011', '', '3730', '0', '0', NULL, NULL, '0'),
('31', '11', '1', '2017-08-24', '4025', '', '-932.5', '0', '0', NULL, NULL, '0'),
('32', '11', '1', '2017-08-24', '1013', '', '-2797.5', '0', '0', '2', '4', '0'),
('33', '11', '1', '2017-08-24', '', '', '0', '0', '0', NULL, NULL, '0'),
('34', '1', '1', '2017-08-24', '5020', 'salary for th emonth of aug 17', '25000', '0', '0', NULL, NULL, '0'),
('35', '1', '1', '2017-08-24', '10123', '', '-25000', '0', '0', NULL, NULL, '0'),
('36', '13', '3', '2016-06-30', '5011', '', '3085.65', '0', '0', NULL, NULL, '0'),
('37', '13', '3', '2016-06-30', '1021', '', '-3085.65', '0', '0', NULL, NULL, '0'),
('38', '13', '3', '2016-06-30', '5011', '', '3820.89', '0', '0', NULL, NULL, '0'),
('39', '13', '3', '2016-06-30', '1021', '', '-3820.89', '0', '0', NULL, NULL, '0'),
('40', '13', '3', '2016-06-30', '5011', '', '8004.96', '0', '0', NULL, NULL, '0'),
('41', '13', '3', '2016-06-30', '1021', '', '-8004.96', '0', '0', NULL, NULL, '0'),
('42', '10', '3', '2016-06-30', '4011', '', '-8952', '0', '0', NULL, NULL, '0'),
('43', '10', '3', '2016-06-30', '4011', '', '-11190', '0', '0', NULL, NULL, '0'),
('44', '10', '3', '2016-06-30', '4011', '', '-9605.88', '0', '0', NULL, NULL, '0'),
('45', '10', '3', '2016-06-30', '4025', '', '1000', '0', '0', NULL, NULL, '0'),
('46', '10', '3', '2016-06-30', '4024', '', '-500', '0', '0', NULL, NULL, '0'),
('47', '10', '3', '2016-06-30', '1013', '', '29247.88', '0', '0', '2', '4', '0'),
('48', '13', '4', '2016-06-30', '5011', '', '12856.87', '0', '0', NULL, NULL, '0'),
('49', '13', '4', '2016-06-30', '1021', '', '-12856.87', '0', '0', NULL, NULL, '0'),
('50', '10', '4', '2016-06-30', '4011', '', '-37300', '0', '0', NULL, NULL, '0'),
('51', '10', '4', '2016-06-30', '1013', '', '37300', '0', '0', '2', '19', '0'),
('52', '17', '2', '2016-06-30', '5014', '', '5142.75', '0', '0', NULL, NULL, '0'),
('53', '17', '2', '2016-06-30', '1021', '', '-5142.75', '0', '0', NULL, NULL, '0'),
('54', '42', '1', '2016-06-30', '1013', '', '-10000', '0', '0', '2', '19', '0'),
('55', '42', '1', '2016-06-30', '10111', '', '10000', '0', '0', NULL, NULL, '0'),
('56', '13', '5', '2016-06-30', '5011', '', '20056.72', '0', '0', NULL, NULL, '0'),
('57', '13', '5', '2016-06-30', '1021', '', '-20056.72', '0', '0', NULL, NULL, '0'),
('58', '10', '5', '2016-06-30', '4011', '', '-58188', '0', '0', NULL, NULL, '0'),
('59', '10', '5', '2016-06-30', '1013', '', '58188', '0', '0', '2', '19', '0'),
('60', '12', '2', '2016-06-30', '10123', '', '37300', '0', '0', NULL, NULL, '0'),
('61', '12', '2', '2016-06-30', '1013', '', '-37300', '0', '0', '2', '19', '0'),
('62', '13', '6', '2017-09-08', '5011', '', '1285.69', '0', '0', NULL, NULL, '0'),
('63', '13', '6', '2017-09-08', '1021', '', '-1285.69', '0', '0', NULL, NULL, '0'),
('64', '10', '6', '2017-09-08', '4011', '', '-3730', '0', '0', NULL, NULL, '0'),
('65', '10', '6', '2017-09-08', '1013', '', '3730', '0', '0', '2', '19', '0'),
('66', '12', '3', '2017-09-08', '10123', '', '3730', '0', '0', NULL, NULL, '0'),
('67', '12', '3', '2017-09-08', '1013', '', '-3730', '0', '0', '2', '19', '0'),
('68', '13', '7', '2017-09-08', '5011', '', '257.14', '0', '0', NULL, NULL, '0'),
('69', '13', '7', '2017-09-08', '1021', '', '-257.14', '0', '0', NULL, NULL, '0'),
('70', '12', '4', '2017-09-08', '10121', '', '58188', '0', '0', NULL, NULL, '0'),
('71', '12', '4', '2017-09-08', '1013', '', '-58188', '0', '0', '2', '19', '0'),
('72', '41', '1', '2017-09-08', '5035', '', '200', '0', '0', NULL, NULL, '0'),
('73', '41', '1', '2017-09-08', '10111', '', '-200', '0', '0', NULL, NULL, '0'),
('74', '0', '24', '2017-09-08', '10112', '', '1000', '0', '0', NULL, NULL, '0'),
('75', '0', '24', '2017-09-08', '1011', '', '-1000', '0', '0', NULL, NULL, '0'),
('76', '1', '2', '2017-09-08', '1011', '', '5000', '0', '0', NULL, NULL, '220902'),
('77', '1', '2', '2017-09-08', '10121', '', '-5000', '0', '0', NULL, NULL, '220902'),
('78', '13', '8', '2017-09-08', '5011', '', '257.14', '0', '0', NULL, NULL, '0'),
('79', '13', '8', '2017-09-08', '1021', '', '-257.14', '0', '0', NULL, NULL, '0'),
('80', '10', '7', '2017-09-08', '4011', '', '-746', '0', '0', NULL, NULL, '0'),
('81', '10', '7', '2017-09-08', '1013', '', '690', '0', '0', '2', '19', '0'),
('82', '10', '7', '2017-09-08', '4025', '', '10', '0', '0', NULL, NULL, '0'),
('83', '10', '7', '2017-09-08', '4025', '', '10', '0', '0', NULL, NULL, '0'),
('84', '10', '7', '2017-09-08', '4023', '', '36', '0', '0', NULL, NULL, '0'),
('85', '41', '2', '2017-09-08', '5040', '', '500', '0', '0', NULL, NULL, '0'),
('86', '41', '2', '2017-09-08', '10111', '', '-500', '0', '0', NULL, NULL, '0'),
('87', '13', '9', '2017-09-08', '5011', '', '25713.74', '0', '0', NULL, NULL, '0'),
('88', '13', '9', '2017-09-08', '1021', '', '-25713.74', '0', '0', NULL, NULL, '0'),
('89', '13', '9', '2017-09-08', '5011', '', '26434.32', '0', '0', NULL, NULL, '0'),
('90', '13', '9', '2017-09-08', '1021', '', '-26434.32', '0', '0', NULL, NULL, '0'),
('91', '10', '8', '2017-09-08', '4011', '', '-74600', '0', '0', NULL, NULL, '0'),
('92', '10', '8', '2017-09-08', '4011', '', '-31721.68', '0', '0', NULL, NULL, '0'),
('93', '10', '8', '2017-09-08', '1013', '', '106321.68', '0', '0', '2', '19', '0'),
('94', '13', '10', '2017-09-08', '5011', '', '45086.53', '0', '0', NULL, NULL, '0'),
('95', '13', '10', '2017-09-08', '1021', '', '-45086.53', '0', '0', NULL, NULL, '0'),
('96', '13', '10', '2017-09-08', '5011', '', '2845.8', '0', '0', NULL, NULL, '0'),
('97', '13', '10', '2017-09-08', '1021', '', '-2845.8', '0', '0', NULL, NULL, '0'),
('98', '10', '9', '2017-09-08', '4011', '', '-132042', '0', '0', NULL, NULL, '0'),
('99', '10', '9', '2017-09-08', '4011', '', '-3415', '0', '0', NULL, NULL, '0'),
('100', '10', '9', '2017-09-08', '1013', '', '135457', '0', '0', '2', '19', '0'),
('101', '13', '11', '2017-09-08', '5011', '', '25713.74', '0', '0', NULL, NULL, '0'),
('102', '13', '11', '2017-09-08', '1021', '', '-25713.74', '0', '0', NULL, NULL, '0'),
('103', '10', '10', '2017-09-08', '4011', '', '-74600', '0', '0', NULL, NULL, '0'),
('104', '10', '10', '2017-09-08', '1013', '', '74600', '0', '0', '2', '19', '0'),
('105', '13', '12', '2017-09-08', '5011', '', '2313.36', '0', '0', NULL, NULL, '0'),
('106', '13', '12', '2017-09-08', '1021', '', '-2313.36', '0', '0', NULL, NULL, '0'),
('107', '13', '12', '2017-09-08', '5011', '', '2301.12', '0', '0', NULL, NULL, '0'),
('108', '13', '12', '2017-09-08', '1021', '', '-2301.12', '0', '0', NULL, NULL, '0'),
('109', '13', '12', '2017-09-08', '5011', '', '3769.92', '0', '0', NULL, NULL, '0'),
('110', '13', '12', '2017-09-08', '1021', '', '-3769.92', '0', '0', NULL, NULL, '0'),
('111', '13', '12', '2017-09-08', '5011', '', '4736.88', '0', '0', NULL, NULL, '0'),
('112', '13', '12', '2017-09-08', '1021', '', '-4736.88', '0', '0', NULL, NULL, '0'),
('113', '13', '12', '2017-09-08', '5011', '', '3696.48', '0', '0', NULL, NULL, '0'),
('114', '13', '12', '2017-09-08', '1021', '', '-3696.48', '0', '0', NULL, NULL, '0'),
('115', '13', '12', '2017-09-08', '5011', '', '3623.04', '0', '0', NULL, NULL, '0'),
('116', '13', '12', '2017-09-08', '1021', '', '-3623.04', '0', '0', NULL, NULL, '0'),
('117', '13', '12', '2017-09-08', '5011', '', '5336.64', '0', '0', NULL, NULL, '0'),
('118', '13', '12', '2017-09-08', '1021', '', '-5336.64', '0', '0', NULL, NULL, '0'),
('119', '13', '12', '2017-09-08', '5011', '', '3056.71', '0', '0', NULL, NULL, '0'),
('120', '13', '12', '2017-09-08', '1021', '', '-3056.71', '0', '0', NULL, NULL, '0'),
('121', '13', '12', '2017-09-08', '5011', '', '3085.65', '0', '0', NULL, NULL, '0'),
('122', '13', '12', '2017-09-08', '1021', '', '-3085.65', '0', '0', NULL, NULL, '0'),
('123', '13', '12', '2017-09-08', '5011', '', '1707.48', '0', '0', NULL, NULL, '0'),
('124', '13', '12', '2017-09-08', '1021', '', '-1707.48', '0', '0', NULL, NULL, '0'),
('125', '13', '12', '2017-09-08', '5011', '', '6707.52', '0', '0', NULL, NULL, '0'),
('126', '13', '12', '2017-09-08', '1021', '', '-6707.52', '0', '0', NULL, NULL, '0'),
('127', '13', '12', '2017-09-08', '5011', '', '3500.64', '0', '0', NULL, NULL, '0'),
('128', '13', '12', '2017-09-08', '1021', '', '-3500.64', '0', '0', NULL, NULL, '0'),
('129', '10', '11', '2017-09-08', '4011', '', '-2776.08', '0', '0', NULL, NULL, '0'),
('130', '10', '11', '2017-09-08', '4011', '', '-2761.32', '0', '0', NULL, NULL, '0'),
('131', '10', '11', '2017-09-08', '4011', '', '-4523.88', '0', '0', NULL, NULL, '0'),
('132', '10', '11', '2017-09-08', '4011', '', '-5684.28', '0', '0', NULL, NULL, '0'),
('133', '10', '11', '2017-09-08', '4011', '', '-4435.8', '0', '0', NULL, NULL, '0'),
('134', '10', '11', '2017-09-08', '4011', '', '-4347.6', '0', '0', NULL, NULL, '0'),
('135', '10', '11', '2017-09-08', '4011', '', '-6403.92', '0', '0', NULL, NULL, '0'),
('136', '10', '11', '2017-09-08', '4011', '', '-8952', '0', '0', NULL, NULL, '0'),
('137', '10', '11', '2017-09-08', '4011', '', '-8952', '0', '0', NULL, NULL, '0'),
('138', '10', '11', '2017-09-08', '4011', '', '-2049', '0', '0', NULL, NULL, '0'),
('139', '10', '11', '2017-09-08', '4011', '', '-8049.12', '0', '0', NULL, NULL, '0'),
('140', '10', '11', '2017-09-08', '4011', '', '-4200.72', '0', '0', NULL, NULL, '0'),
('141', '10', '11', '2017-09-08', '1013', '', '75131.51', '0', '0', '2', '11', '0'),
('142', '10', '11', '2017-09-08', '2013', '', '-11995.79', '0', '0', NULL, NULL, '0'),
('143', '12', '5', '2017-09-08', '10111', '', '70000', '0', '0', NULL, NULL, '0'),
('144', '12', '5', '2017-09-08', '1013', '', '-70000', '0', '0', '2', '11', '0'),
('145', '12', '6', '2017-09-08', '10121', '', '5000', '0', '0', NULL, NULL, '0'),
('146', '12', '6', '2017-09-08', '1013', '', '-5000', '0', '0', '2', '11', '0'),
('147', '0', '25', '2017-09-08', '10111', '', '-25000', '0', '0', NULL, NULL, '0'),
('148', '0', '25', '2017-09-08', '1021', '', '50000', '0', '0', NULL, NULL, '0'),
('149', '0', '25', '2017-09-08', '2011', '', '-25000', '0', '0', '3', '1', '0'),
('150', '13', '13', '2017-09-11', '5011', '', '28458', '0', '0', NULL, NULL, '0'),
('151', '13', '13', '2017-09-11', '1021', '', '-28458', '0', '0', NULL, NULL, '0'),
('152', '13', '13', '2017-09-11', '5011', '', '21318', '0', '0', NULL, NULL, '0'),
('153', '13', '13', '2017-09-11', '1021', '', '-21318', '0', '0', NULL, NULL, '0'),
('154', '10', '12', '2017-09-11', '4011', '', '-34150', '0', '0', NULL, NULL, '0'),
('155', '10', '12', '2017-09-11', '4025', '', '6830', '0', '0', NULL, NULL, '0'),
('156', '10', '12', '2017-09-11', '4011', '', '-25582', '0', '0', NULL, NULL, '0'),
('157', '10', '12', '2017-09-11', '4025', '', '5116.4', '0', '0', NULL, NULL, '0'),
('158', '10', '12', '2017-09-11', '1013', '', '47785.6', '0', '0', '2', '19', '0'),
('159', '13', '14', '2017-09-11', '5011', '', '25472.62', '0', '0', NULL, NULL, '0'),
('160', '13', '14', '2017-09-11', '1021', '', '-25472.62', '0', '0', NULL, NULL, '0'),
('161', '10', '13', '2017-09-11', '4011', '', '-74600', '0', '0', NULL, NULL, '0'),
('162', '10', '13', '2017-09-11', '4025', '', '18650', '0', '0', NULL, NULL, '0'),
('163', '10', '13', '2017-09-11', '1013', '', '55950', '0', '0', '2', '19', '0'),
('164', '13', '15', '2017-09-12', '5011', '', '2547.26', '0', '0', NULL, NULL, '0'),
('165', '13', '15', '2017-09-12', '1021', '', '-2547.26', '0', '0', NULL, NULL, '0'),
('166', '10', '14', '2017-09-12', '4011', '', '-7460', '0', '0', NULL, NULL, '0'),
('167', '10', '14', '2017-09-12', '4025', '', '1492', '0', '0', NULL, NULL, '0'),
('168', '10', '14', '2017-09-12', '1013', '', '5968', '0', '0', '2', '19', '0'),
('169', '13', '16', '2017-09-12', '5011', '', '2571.37', '0', '0', NULL, NULL, '0'),
('170', '13', '16', '2017-09-12', '1021', '', '-2571.37', '0', '0', NULL, NULL, '0'),
('171', '10', '15', '2017-09-12', '4011', '', '-7460', '0', '0', NULL, NULL, '0'),
('172', '10', '15', '2017-09-12', '4025', '', '1492', '0', '0', NULL, NULL, '0'),
('173', '10', '15', '2017-09-12', '1013', '', '5968', '0', '0', '2', '19', '0'),
('174', '13', '17', '2017-09-12', '5011', '', '257.14', '0', '0', NULL, NULL, '0'),
('175', '13', '17', '2017-09-12', '1021', '', '-257.14', '0', '0', NULL, NULL, '0'),
('176', '10', '16', '2017-09-12', '4011', '', '-500', '0', '0', NULL, NULL, '0'),
('177', '10', '16', '2017-09-12', '4025', '', '100', '0', '0', NULL, NULL, '0'),
('178', '10', '16', '2017-09-12', '1013', '', '400', '0', '0', '2', '19', '0'),
('179', '4', '1', '2017-09-12', '10121', 'From JS Bank To Petty Cash', '-10000', '0', '0', NULL, NULL, '0'),
('180', '4', '1', '2017-09-12', '10112', 'From JS Bank To Petty Cash', '10000', '0', '0', NULL, NULL, '0'),
('181', '13', '18', '2017-09-12', '5011', '', '257.14', '0', '0', NULL, NULL, '0'),
('182', '13', '18', '2017-09-12', '1021', '', '-257.14', '0', '0', NULL, NULL, '0'),
('183', '13', '18', '2017-09-12', '5011', '', '51170.35', '0', '0', NULL, NULL, '0'),
('184', '13', '18', '2017-09-12', '1021', '', '-51170.35', '0', '0', NULL, NULL, '0'),
('185', '10', '17', '2017-09-12', '4011', '', '-746', '0', '0', NULL, NULL, '0'),
('186', '10', '17', '2017-09-12', '4011', '', '-148454', '0', '0', NULL, NULL, '0'),
('187', '10', '17', '2017-09-12', '1013', '', '103900', '0', '0', '2', '19', '0'),
('188', '10', '17', '2017-09-12', '4025', '', '37300', '0', '0', NULL, NULL, '0'),
('189', '10', '17', '2017-09-12', '4026', '', '37300', '0', '0', NULL, NULL, '0'),
('190', '10', '17', '2017-09-12', '4023', '', '-29300', '0', '0', NULL, NULL, '0'),
('191', '13', '19', '2017-09-14', '5011', '', '28285.12', '0', '0', NULL, NULL, '0'),
('192', '13', '19', '2017-09-14', '1021', '', '-28285.12', '0', '0', NULL, NULL, '0'),
('193', '10', '18', '2017-09-14', '4011', '', '-82060', '0', '0', NULL, NULL, '0'),
('194', '10', '18', '2017-09-14', '4025', '', '16412', '0', '0', NULL, NULL, '0'),
('195', '10', '18', '2017-09-14', '1013', '', '65648', '0', '0', '2', '19', '0'),
('196', '13', '20', '2017-09-15', '5011', '', '2571.37', '0', '0', NULL, NULL, '0'),
('197', '13', '20', '2017-09-15', '1021', '', '-2571.37', '0', '0', NULL, NULL, '0'),
('198', '10', '19', '2017-09-15', '4011', '', '-7460', '0', '0', NULL, NULL, '0'),
('199', '10', '19', '2017-09-15', '4025', '', '1492', '0', '0', NULL, NULL, '0'),
('200', '10', '19', '2017-09-15', '1013', '', '5968', '0', '0', '2', '19', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_batch` ###

INSERT INTO `0_grn_batch` VALUES
('1', '1', '4', 'GRN001/2017', '2017-08-24', 'DEF', '105', '3213213'),
('2', '1', '1', 'GRN002/2017', '2017-08-24', 'DEF', '105', '0'),
('3', '1', '5', 'GRN003/2017', '2016-05-24', 'DEF', '102', '113674');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_items` ###

INSERT INTO `0_grn_items` VALUES
('1', '1', '5', 'DC', 'Discount', '1', '1'),
('2', '2', '1', '1001', 'Vitamin D3', '1000', '0'),
('3', '2', '2', '1002', 'Vitamin C', '1000', '0'),
('4', '3', '6', '1001', 'Vitamin D3', '1038', '0'),
('5', '3', '7', '1002', 'Vitamin C', '1079', '0'),
('6', '3', '8', '1003', 'Folic Acid', '975', '0'),
('7', '3', '9', '1004', 'Vitamin B Complex + Vitamin C', '1026', '0'),
('8', '3', '10', '1005', 'Natural Vitamin E', '1001', '0'),
('9', '3', '11', '1006', 'Iron', '1100', '0'),
('10', '3', '12', '1007', 'Calcium + Magnesium + Zinc +D', '1065', '0'),
('11', '3', '13', '1008', 'Calcium 600 + Vitamin D', '1001', '0'),
('12', '3', '14', '1009', 'CoQ - 10', '1002', '0'),
('13', '3', '15', '1010', 'Glucosamine &amp; Chondroitin', '1000', '0'),
('14', '3', '16', '1011', 'Hair, Skin and Nails', '1096', '0'),
('15', '3', '17', '1012', 'Cod Liver Oil', '1016', '0'),
('16', '3', '18', '1013', 'Omega 3 Fish Oil', '1000', '0'),
('17', '3', '19', '1014', 'Evening Prime Rose Oil', '1002', '0'),
('18', '3', '20', '1015', 'Ginkgo Biloba', '1056', '0'),
('19', '3', '21', '1017', 'Multivitamin for Men', '1076', '0'),
('20', '3', '22', '1018', 'Multivitamin for Women', '1013', '0'),
('21', '3', '23', '1019', 'Vitaminerals', '1000', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES
('1', 'OB', 'OB', 'Opening Balance Equity', '3', '1', '0', '0'),
('2', '1001', '1001', 'Vitamin D3', '1', '1', '0', '0'),
('4', '1002', '1002', 'Vitamin C', '1', '1', '0', '0'),
('5', '1003', '1003', 'Folic Acid', '1', '1', '0', '0'),
('6', '1004', '1004', 'Vitamin B Complex + Vitamin C', '1', '1', '0', '0'),
('7', '1005', '1005', 'Natural Vitamin E', '1', '1', '0', '0'),
('8', '1006', '1006', 'Iron', '1', '1', '0', '0'),
('9', '1007', '1007', 'Calcium + Magnesium + Zinc +D', '1', '1', '0', '0'),
('10', '1008', '1008', 'Calcium 600 + Vitamin D', '1', '1', '0', '0'),
('11', '1009', '1009', 'CoQ - 10', '1', '1', '0', '0'),
('12', '1010', '1010', 'Glucosamine &amp; Chondroitin', '1', '1', '0', '0'),
('13', '1011', '1011', 'Hair, Skin and Nails', '1', '1', '0', '0'),
('14', '1012', '1012', 'Cod Liver Oil', '1', '1', '0', '0'),
('15', '1013', '1013', 'Omega 3 Fish Oil', '1', '1', '0', '0'),
('16', '1014', '1014', 'Evening Prime Rose Oil', '1', '1', '0', '0'),
('17', '1015', '1015', 'Ginkgo Biloba', '1', '1', '0', '0'),
('18', '1016', '1016', 'Ginseng and Ginkgo Biloba', '1', '1', '0', '0'),
('19', '1017', '1017', 'Multivitamin for Men', '1', '1', '0', '0'),
('20', '1018', '1018', 'Multivitamin for Women', '1', '1', '0', '0'),
('21', '1019', '1019', 'Vitaminerals', '1', '1', '0', '0'),
('22', 'DC', 'DC', 'DISCOUNT', '3', '1', '0', '0'),
('23', 'IVE', 'IVE', 'INCENTIVE', '3', '1', '0', '0');

### Structure of table `0_item_pref` ###

DROP TABLE IF EXISTS `0_item_pref`;

CREATE TABLE `0_item_pref` (
  `name` varchar(60) NOT NULL,
  `label_value` varchar(60) NOT NULL,
  `item_enable` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_item_pref` ###

INSERT INTO `0_item_pref` VALUES
('amount_1', '1', '1'),
('amount_2', '2', '1'),
('amount_3', '3', '1'),
('amount_4', '4', '1'),
('amount_5', '5', '1'),
('amount_6', '6', '1'),
('text_field_1', 'A1', '1'),
('text_field_2', 'A2', '1'),
('text_field_3', 'A3', '1');

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
('BG', 'Bags', '0', '0'),
('BX', 'Boxs', '-1', '0'),
('CN', 'Bottles', '-1', '0'),
('each', 'Each', '0', '0'),
('KG', 'Kilogram', '-1', '0'),
('KT', 'Kits', '0', '0'),
('LTR', 'Liter', '-1', '0'),
('PCH', 'Pouch', '-1', '0'),
('SFT', 'Squarefit', '-1', '0');

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
('0', '1', '2017-05-31', '001/2017', '', '2017-05-31', '2017-05-31', 'PKR', '10000', '1'),
('0', '2', '2017-05-31', '002/2017', '123', '2017-05-31', '2017-05-31', 'PKR', '5000', '1'),
('0', '3', '2017-05-31', '003/2017', '', '2017-05-31', '2017-05-31', 'PKR', '50000', '1'),
('0', '4', '2017-05-31', '004/2017', '112', '2017-05-31', '2017-05-31', 'PKR', '5630', '1'),
('0', '5', '2017-06-02', '005/2017', 'INV34273864', '2017-06-02', '2017-06-02', 'PKR', '100000', '1'),
('0', '6', '2017-06-06', '006/2017', '', '2017-06-06', '2017-06-06', 'PKR', '200000', '1'),
('0', '7', '2017-06-07', '007/2017', 'OB1', '2017-06-07', '2017-06-07', 'PKR', '10000', '1'),
('0', '8', '2017-06-16', '008/2017', '001', '2017-06-16', '2017-06-16', 'PKR', '100000', '1'),
('0', '9', '2017-06-16', '009/2017', '002', '2017-06-16', '2017-06-16', 'PKR', '80000', '1'),
('0', '10', '2017-06-16', '010/2017', '1003', '2017-06-16', '2017-06-16', 'PKR', '25000', '1'),
('0', '11', '2017-06-16', '011/2017', '1004', '2017-06-16', '2017-06-16', 'PKR', '30000', '1'),
('0', '12', '2017-06-16', '012/2017', '1005', '2017-06-16', '2017-06-16', 'PKR', '35000', '1'),
('0', '13', '2017-06-16', '013/2017', '1006', '2017-06-16', '2017-06-16', 'PKR', '6000', '1'),
('0', '14', '2017-06-16', '014/2017', '', '2017-06-16', '2017-06-16', 'PKR', '7000', '1'),
('0', '15', '2017-06-16', '015/2017', '1001', '2017-06-16', '2017-06-16', 'PKR', '60000', '1'),
('0', '16', '2017-06-16', '016/2017', '1002', '2017-06-16', '2017-06-16', 'PKR', '40000', '1'),
('0', '17', '2017-07-04', '017/2017', '', '2017-07-04', '2017-07-04', 'PKR', '0', '1'),
('0', '18', '2017-06-30', '018/2017', '', '2017-07-31', '2017-07-31', 'PKR', '66291', '1'),
('0', '19', '2017-06-30', '019/2017', '', '2017-07-31', '2017-07-31', 'PKR', '8822016.66', '1'),
('0', '20', '2017-06-30', '020/2017', '', '2017-07-31', '2017-07-31', 'PKR', '4125188.66', '1'),
('0', '21', '2017-06-30', '021/2017', '', '2017-07-31', '2017-07-31', 'PKR', '65504890.74', '1'),
('0', '22', '2017-06-30', '022/2017', '', '2017-07-31', '2017-07-31', 'PKR', '222047648.12', '1'),
('0', '23', '2017-06-30', '023/2017', '', '2017-07-31', '2017-07-31', 'PKR', '14413774.2', '1'),
('0', '24', '2017-09-08', 'JV001/2017', '', '2017-09-08', '2017-09-08', 'PKR', '1000', '1'),
('0', '25', '2017-09-08', 'JV002/2017', '', '2017-09-08', '2017-09-08', 'PKR', '50000', '1');

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

INSERT INTO `0_loc_stock` VALUES
('DEF', '1001', '1000'),
('DEF', '1002', '0'),
('DEF', '1003', '0'),
('DEF', '1004', '0'),
('DEF', '1005', '0'),
('DEF', '1006', '0'),
('DEF', '1007', '0'),
('DEF', '1008', '0'),
('DEF', '1009', '0'),
('DEF', '1010', '0'),
('DEF', '1011', '0'),
('DEF', '1012', '0'),
('DEF', '1013', '0'),
('DEF', '1014', '0'),
('DEF', '1015', '0'),
('DEF', '1016', '0'),
('DEF', '1017', '0'),
('DEF', '1018', '0'),
('DEF', '1019', '0'),
('DEF', 'DC', '0'),
('DEF', 'IVE', '0'),
('DEF', 'OB', '0'),
('KHI', '1001', '0'),
('KHI', '1002', '0'),
('KHI', '1003', '0'),
('KHI', '1004', '0'),
('KHI', '1005', '0'),
('KHI', '1006', '0'),
('KHI', '1007', '0'),
('KHI', '1008', '0'),
('KHI', '1009', '0'),
('KHI', '1010', '0'),
('KHI', '1011', '0'),
('KHI', '1012', '0'),
('KHI', '1013', '0'),
('KHI', '1014', '0'),
('KHI', '1015', '0'),
('KHI', '1016', '0'),
('KHI', '1017', '0'),
('KHI', '1018', '0'),
('KHI', '1019', '0'),
('KHI', 'DC', '0'),
('KHI', 'IVE', '0'),
('KHI', 'OB', '0'),
('LHE', '1001', '0'),
('LHE', '1002', '0'),
('LHE', '1003', '0'),
('LHE', '1004', '0'),
('LHE', '1005', '0'),
('LHE', '1006', '0'),
('LHE', '1007', '0'),
('LHE', '1008', '0'),
('LHE', '1009', '0'),
('LHE', '1010', '0'),
('LHE', '1011', '0'),
('LHE', '1012', '0'),
('LHE', '1013', '0'),
('LHE', '1014', '0'),
('LHE', '1015', '0'),
('LHE', '1016', '0'),
('LHE', '1017', '0'),
('LHE', '1018', '0'),
('LHE', '1019', '0'),
('LHE', 'DC', '0'),
('LHE', 'IVE', '0'),
('LHE', 'OB', '0');

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
('DEF', 'Default', 'N/A', '', '', '', '', '', '0', '0'),
('KHI', 'Karachi', '', '', '', '', '', '', '1', '0'),
('LHE', 'Lahore', '', '', '', '', '', '', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_payment_terms` ###

INSERT INTO `0_payment_terms` VALUES
('1', '15 Days', '15', '0', '0'),
('2', '30 Days', '30', '0', '0'),
('4', '60 Days', '60', '0', '0'),
('5', 'Cash', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('5', '1001', '1', 'PKR', '746'),
('6', '1002', '1', 'PKR', '746');

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

INSERT INTO `0_purch_data` VALUES
('1', '1001', '2.11', '', '1', 'Vitamin D3'),
('1', '1002', '2.04', '', '1', 'Vitamin C'),
('1', '1003', '2.09', '', '1', 'Folic Acid'),
('1', '1004', '2.17', '', '1', 'Vitamin B Complex + Vitamin C'),
('1', '1005', '2.79', '', '1', 'Natural Vitamin E'),
('1', '1006', '1.58', '', '1', 'Iron'),
('1', '1007', '1.89', '', '1', 'Calcium + Magnesium + Zinc +D'),
('1', '1008', '1.88', '', '1', 'Calcium 600 + Vitamin D'),
('1', '1009', '3.87', '', '1', 'CoQ - 10'),
('1', '1010', '2.96', '', '1', 'Glucosamine &amp; Chondroitin'),
('1', '1011', '2.11', '', '1', 'Hair, Skin and Nails'),
('1', '1012', '3.08', '', '1', 'Cod Liver Oil'),
('1', '1013', '2.18', '', '1', 'Omega 3 Fish Oil'),
('1', '1014', '3.02', '', '1', 'Evening Prime Rose Oil'),
('1', '1015', '1.93', '', '1', 'Ginkgo Biloba'),
('1', '1017', '2.74', '', '1', 'Multivitamin for Men'),
('1', '1018', '2.86', '', '1', 'Multivitamin for Women'),
('1', '1019', '2.49', '', '1', 'Vitaminerals'),
('1', 'DC', '3333', '', '1', 'Discount');

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
  `text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comb1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comb2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comb3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`po_detail_item`),
  KEY `order` (`order_no`,`po_detail_item`),
  KEY `itemcode` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_order_details` ###

INSERT INTO `0_purch_order_details` VALUES
('1', '1', '1001', 'Vitamin D3', '2017-09-03', '0', '2.5', '2.5', '280.158730159', '1000', '1000', '', '', '', '', '', ''),
('2', '1', '1002', 'Vitamin C', '2017-09-03', '0', '2.5', '2.5', '280.670103093', '1000', '1000', '', '', '', '', '', ''),
('4', '3', '1001', 'Vitamin D3', '2017-09-03', '0', '2.5', '0', '0', '1000', '0', '', '', '', '', '', ''),
('5', '4', 'DC', 'Discount', '2017-09-03', '1', '3333', '3333', '0', '1', '1', '', '', '', '', '', ''),
('6', '5', '1001', 'Vitamin D3', '2016-07-01', '0', '2.11', '2.11', '257.137418033', '1038', '1038', '', '', '', '', '', ''),
('7', '5', '1002', 'Vitamin C', '2016-07-01', '0', '2.04', '2.04', '254.72617423', '1079', '1079', '', '', '', '', '', ''),
('8', '5', '1003', 'Folic Acid', '2016-07-01', '0', '2.09', '2.09', '213.18', '975', '975', '', '', '', '', '', ''),
('9', '5', '1004', 'Vitamin B Complex + Vitamin C', '2016-07-01', '0', '2.17', '2.17', '221.34', '1026', '1026', '', '', '', '', '', ''),
('10', '5', '1005', 'Natural Vitamin E', '2016-07-01', '0', '2.79', '2.79', '284.58', '1001', '1001', '', '', '', '', '', ''),
('11', '5', '1006', 'Iron', '2016-07-01', '0', '1.58', '1.58', '161.16', '1100', '1100', '', '', '', '', '', ''),
('12', '5', '1007', 'Calcium + Magnesium + Zinc +D', '2016-07-01', '0', '1.89', '1.89', '192.78', '1065', '1065', '', '', '', '', '', ''),
('13', '5', '1008', 'Calcium 600 + Vitamin D', '2016-07-01', '0', '1.88', '1.88', '191.76', '1001', '1001', '', '', '', '', '', ''),
('14', '5', '1009', 'CoQ - 10', '2016-07-01', '0', '3.87', '3.87', '394.74', '1002', '1002', '', '', '', '', '', ''),
('15', '5', '1010', 'Glucosamine &amp; Chondroitin', '2016-07-01', '0', '2.96', '2.96', '301.92', '1000', '1000', '', '', '', '', '', ''),
('16', '5', '1011', 'Hair, Skin and Nails', '2016-07-01', '0', '2.11', '2.11', '215.22', '1096', '1096', '', '', '', '', '', ''),
('17', '5', '1012', 'Cod Liver Oil', '2016-07-01', '0', '3.08', '3.08', '314.16', '1016', '1016', '', '', '', '', '', ''),
('18', '5', '1013', 'Omega 3 Fish Oil', '2016-07-01', '0', '2.18', '2.18', '222.36', '1000', '1000', '', '', '', '', '', ''),
('19', '5', '1014', 'Evening Prime Rose Oil', '2016-07-01', '0', '3.02', '3.02', '308.04', '1002', '1002', '', '', '', '', '', ''),
('20', '5', '1015', 'Ginkgo Biloba', '2016-07-01', '0', '1.93', '1.93', '196.86', '1056', '1056', '', '', '', '', '', ''),
('21', '5', '1017', 'Multivitamin for Men', '2016-07-01', '0', '2.74', '2.74', '279.48', '1076', '1076', '', '', '', '', '', ''),
('22', '5', '1018', 'Multivitamin for Women', '2016-07-01', '0', '2.86', '2.86', '291.72', '1013', '1013', '', '', '', '', '', ''),
('23', '5', '1019', 'Vitaminerals', '2016-07-01', '0', '2.49', '2.49', '253.98', '1000', '1000', '', '', '', '', '', ''),
('24', '6', '1001', 'Vitamin D3', '2017-09-16', '0', '2.11', '0', '0', '100', '0', '', '', '', '', '', ''),
('25', '7', '1001', 'Vitamin D3', '2017-09-18', '0', '2.11', '0', '0', '1000', '0', '', '', '', '', '', ''),
('26', '7', '1003', 'Folic Acid', '2017-09-18', '0', '2.09', '0', '0', '1000', '0', '', '', '', '', '', ''),
('27', '8', '1001', 'Vitamin D3', '2017-09-12', '0', '100', '0', '0', '10', '0', '', '', '', '', '', ''),
('28', '9', '1001', 'Vitamin D3', '2017-09-12', '0', '1000', '0', '0', '1', '0', '', '', '', '', '', ''),
('29', '10', '1002', 'Vitamin C', '2017-09-12', '0', '2.04', '0', '0', '1', '0', '', '', '', '', '', '');

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
  `h_text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_text3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_comb1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_comb2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_comb3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Comments1` text COLLATE utf8_unicode_ci NOT NULL,
  `Comments2` text COLLATE utf8_unicode_ci NOT NULL,
  `Comments3` text COLLATE utf8_unicode_ci NOT NULL,
  `Comments4` text COLLATE utf8_unicode_ci NOT NULL,
  `Comments5` text COLLATE utf8_unicode_ci NOT NULL,
  `Comments6` text COLLATE utf8_unicode_ci,
  `requisition_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  KEY `ord_date` (`ord_date`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_orders` ###

INSERT INTO `0_purch_orders` VALUES
('1', '1', NULL, '2017-08-24', 'PO001/2017', NULL, 'DEF', 'N/A', '5000', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
('3', '1', NULL, '2016-07-01', 'PO001/2016', '4564', 'DEF', 'N/A', '2500', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
('4', '1', '3213', '2017-08-24', 'PO002/2017', '3213213', 'DEF', 'N/A', '3333', '0', '0', '0', '32132132', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
('5', '1', NULL, '2016-06-30', 'PO002/2016', '113674', 'DEF', 'N/A', '44940.15', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
('6', '1', NULL, '2017-06-06', 'PO003/2017', NULL, 'DEF', 'N/A', '211', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL),
('7', '1', NULL, '2017-09-08', 'PO004/2017', NULL, 'DEF', 'N/A', '4200', '0', '0', '0', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL);

### Structure of table `0_purch_pref` ###

DROP TABLE IF EXISTS `0_purch_pref`;

CREATE TABLE `0_purch_pref` (
  `name` varchar(20) NOT NULL,
  `label_value` varchar(30) NOT NULL,
  `po_enable` tinyint(1) NOT NULL,
  `grn_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_purch_pref` ###

INSERT INTO `0_purch_pref` VALUES
('cart1', 'Header 1', '1', '0'),
('cart2', 'Header 2', '1', '0'),
('cart3', 'Header 3', '1', '0'),
('cart4', 'Header 4', '1', '0'),
('cart5', 'Header 5', '1', '0'),
('cart6', 'Header 6', '1', '0'),
('footer_long_text1', '44444', '1', '0'),
('footer_long_text2', 'Header 6dsf', '1', '0'),
('header_combo1', 'Header Combo Label 1', '1', '0'),
('header_combo2', 'Header Combo Label 2', '1', '0'),
('header_combo3', 'Header Combo Label 3', '1', '0'),
('header_long_text', ' Description 1', '1', '0'),
('header_text1', 'Label text 1', '1', '0'),
('header_text2', ' Text Label 2', '1', '0'),
('header_text3', 'Label text 3', '1', '0'),
('total_headers', 'sd', '0', '0'),
('total_headers2', 'ddf', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_reflines` ###

INSERT INTO `0_reflines` VALUES
('1', '0', 'JV', '{001}/{YYYY}', '', '1', '0'),
('2', '1', 'BPV', '{001}/{YYYY}', '', '1', '0'),
('3', '2', 'BRV', '{001}/{YYYY}', '', '1', '0'),
('4', '4', 'FTV', '{001}/{YYYY}', '', '1', '0'),
('5', '10', 'SI', '{001}/{YYYY}', '1075', '1', '0'),
('6', '11', 'CCN', '{001}/{YYYY}', '113', '1', '0'),
('7', '12', 'CPV', '{001}/{YYYY}', '112', '1', '0'),
('8', '13', 'DN', '{001}/{YYYY}', '110', '1', '0'),
('9', '16', 'LT', '{001}/{YYYY}', '', '1', '0'),
('10', '17', 'IA', '{001}/{YYYY}', '', '1', '0'),
('11', '18', 'PO', '{001}/{YYYY}', '209', '1', '0'),
('12', '20', 'SPI', '{001}/{YYYY}', '', '1', '0'),
('13', '21', 'SCN', '{001}/{YYYY}', '', '1', '0'),
('14', '22', 'SPV', '{001}/{YYYY}', '', '1', '0'),
('15', '25', 'GRN', '{001}/{YYYY}', '', '1', '0'),
('16', '26', 'WO', '{001}/{YYYY}', '', '1', '0'),
('17', '28', 'WOI', '{001}/{YYYY}', '', '1', '0'),
('18', '29', 'PO', '{001}/{YYYY}', '', '1', '0'),
('19', '30', 'SO', '{001}/{YYYY}', '109', '1', '0'),
('20', '32', 'SQ', '{001}/{YYYY}', '111', '1', '0'),
('21', '35', 'CU', '{001}/{YYYY}', '', '1', '0'),
('22', '40', 'DI', '{001}/{YYYY}', '', '1', '0'),
('23', '41', 'CPV', '{001}/{YYYY}', '', '1', '0'),
('24', '42', 'CRV', '{001}/{YYYY}', '', '1', '0'),
('25', '43', '', '{001}/{YYYY}', '', '1', '0');

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
('24', '0', 'JV001/2017'),
('25', '0', 'JV002/2017'),
('1', '1', 'BPV001/2017'),
('2', '1', 'BPV002/2017'),
('1', '4', 'FTV001/2017'),
('3', '10', 'SI001/2016'),
('1', '10', 'SI001/2017'),
('4', '10', 'SI002/2016'),
('2', '10', 'SI002/2017'),
('5', '10', 'SI003/2016'),
('6', '10', 'SI003/2017'),
('7', '10', 'SI004/2017'),
('8', '10', 'SI005/2017'),
('9', '10', 'SI006/2017'),
('10', '10', 'SI007/2017'),
('11', '10', 'SI008/2017'),
('12', '10', 'SI009/2017'),
('13', '10', 'SI010/2017'),
('14', '10', 'SI011/2017'),
('15', '10', 'SI012/2017'),
('16', '10', 'SI013/2017'),
('17', '10', 'SI014/2017'),
('18', '10', 'SI015/2017'),
('19', '10', 'SI016/2017'),
('1', '11', 'CCN001/2017'),
('1', '12', 'CPV001/2017'),
('2', '12', 'CPV002/2017'),
('3', '12', 'CPV003/2017'),
('4', '12', 'CPV004/2017'),
('5', '12', 'CPV005/2017'),
('6', '12', 'CPV006/2017'),
('7', '13', 'DN001/2017'),
('2', '17', 'IA001/2016'),
('1', '17', 'IA001/2017'),
('3', '18', 'PO001/2016'),
('1', '18', 'PO001/2017'),
('5', '18', 'PO002/2016'),
('4', '18', 'PO002/2017'),
('6', '18', 'PO003/2017'),
('7', '18', 'PO004/2017'),
('1', '20', 'SPI001/2017'),
('1', '25', 'GRN001/2017'),
('2', '25', 'GRN002/2017'),
('3', '25', 'GRN003/2017'),
('1', '30', 'SO001/2017'),
('6', '30', 'SO002/2016'),
('10', '30', 'SO002/2017'),
('9', '30', 'SO003/2016'),
('7', '30', 'SO003/2017'),
('12', '30', 'SO003/2017'),
('18', '30', 'SO004/2017'),
('1', '41', 'CPV001/2017'),
('2', '41', 'CPV002/2017'),
('1', '42', 'CRV001/2016');

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
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
('417', 'RPL', '11001', '1', '0'),
('418', 'RPL', '22011', '1', '0'),
('419', 'RPL', NULL, '1', '0'),
('420', 'RPL', '102', '1', '0'),
('421', 'RPL', '103', '1', '0'),
('422', 'RPL', '104', '1', '0'),
('423', 'RPL', '105', '1', '0'),
('424', 'RPL', '106', '1', '0'),
('425', 'RPL', '107', '1', '0'),
('426', 'RPL', '108', '1', '0'),
('427', 'RPL', '109', '1', '0'),
('428', 'RPL', '110', '1', '0'),
('429', 'RPL', '111', '1', '0'),
('430', 'RPL', '112', '1', '0'),
('431', 'RPL', '113', '1', '0'),
('432', 'RPL', '114', '1', '0'),
('433', 'RPL', '201', '1', '0'),
('434', 'RPL', '202', '1', '0'),
('435', 'RPL', '203', '1', '0'),
('436', 'RPL', '204', '1', '0'),
('437', 'RPL', '205', '1', '0'),
('438', 'RPL', '209', '1', '0'),
('439', 'RPL', '210', '1', '0'),
('440', 'RPL', '301', '1', '0'),
('441', 'RPL', '302', '1', '0'),
('442', 'RPL', '303', '1', '0'),
('443', 'RPL', '304', '1', '0'),
('444', 'RPL', '305', '1', '0'),
('445', 'RPL', '306', '1', '0'),
('446', 'RPL', '307', '1', '0'),
('447', 'RPL', '308', '1', '0'),
('448', 'RPL', '309', '1', '0'),
('449', 'RPL', '401', '1', '0'),
('450', 'RPL', '402', '1', '0'),
('451', 'RPL', '409', '1', '0'),
('452', 'RPL', '451', '1', '0'),
('453', 'RPL', '501', '1', '0'),
('454', 'RPL', '601', '1', '0'),
('455', 'RPL', '602', '1', '0'),
('456', 'RPL', '701', '1', '0'),
('457', 'RPL', '702', '1', '0'),
('458', 'RPL', '704', '1', '0'),
('459', 'RPL', '705', '1', '0'),
('460', 'RPL', '706', '1', '0'),
('461', 'RPL', '707', '1', '0'),
('462', 'RPL', '708', '1', '0'),
('463', 'RPL', '709', '1', '0'),
('464', 'RPL', '710', '1', '0'),
('465', 'RPL', '999', '1', '0'),
('466', 'RPL', '1009', '1', '0'),
('467', 'RPL', '1011', '1', '0'),
('468', 'RPL', '1012', '1', '0'),
('469', 'RPL', '1013', '1', '0'),
('470', 'RPL', '1014', '1', '0'),
('471', 'RPL', '1015', '1', '0'),
('472', 'RPL', '1016', '1', '0'),
('473', 'RPL', '1017', '1', '0'),
('474', 'RPL', '1018', '1', '0'),
('475', 'RPL', '1071', '1', '0'),
('476', 'RPL', '1072', '1', '0'),
('477', 'RPL', '1073', '1', '0'),
('478', 'RPL', '1091', '1', '0'),
('479', 'RPL', '1100', '1', '0'),
('480', 'RPL', '2099', '1', '0'),
('481', 'RPL', '3041', '1', '0'),
('482', 'RPL', '3042', '1', '0');

### Structure of table `0_requisition_details` ###

DROP TABLE IF EXISTS `0_requisition_details`;

CREATE TABLE `0_requisition_details` (
  `requisition_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` int(11) DEFAULT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `lpo_id` bigint(20) DEFAULT '0',
  `order_quantity` double NOT NULL DEFAULT '0',
  `estimate_price` double NOT NULL DEFAULT '0',
  `quantity` double NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `purpose` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `make_po` int(11) NOT NULL,
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
  `application_date` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_order_details` ###

INSERT INTO `0_sales_order_details` VALUES
('3', '2', '30', '1001', 'Vitamin D3', '100', '746', '100', '0', '0'),
('4', '2', '30', '1002', 'Vitamin C', '50', '746', '50', '0', '0'),
('5', '2', '30', 'DC', 'DISCOUNT', '1', '-27975', '1', '0', '0'),
('6', '2', '30', 'IVE', 'INCENTIVE', '1', '-6000', '1', '0', '0'),
('7', '3', '30', '1001', 'Vitamin D3', '10', '746', '10', '0', '0.25'),
('8', '3', '30', '1002', 'Vitamin C', '10', '746', '10', '0', '0.25'),
('9', '3', '30', 'IVE', 'INCENTIVE', '1', '-800', '1', '0', '0'),
('10', '4', '30', '1001', 'Vitamin D3', '12', '746', '12', '0', '0'),
('11', '4', '30', '1002', 'Vitamin C', '15', '746', '15', '0', '0'),
('12', '4', '30', '1013', 'Omega 3 Fish Oil', '36', '266.83', '36', '0', '0'),
('13', '4', '30', 'DC', 'DISCOUNT', '1', '-1000', '1', '0', '0'),
('14', '4', '30', 'IVE', 'INCENTIVE', '1', '500', '1', '0', '0'),
('15', '5', '30', '1001', 'Vitamin D3', '50', '746', '50', '0', '0'),
('18', '8', '30', '1001', 'Vitamin D3', '78', '746', '78', '0', '0'),
('19', '9', '30', '1008', 'Calcium 600 + Vitamin D', '0', '230.11', '6', '0', '0'),
('20', '9', '30', '1012', 'Cod Liver Oil', '0', '376.99', '12', '0', '0'),
('21', '9', '30', '1009', 'CoQ - 10', '0', '473.69', '12', '0', '0'),
('22', '9', '30', '1003', 'Folic Acid', '0', '255.82', '18', '0', '0'),
('23', '9', '30', '1017', 'Multivitamin for Men', '0', '335.38', '12', '0', '0'),
('24', '9', '30', '1018', 'Multivitamin for Women', '0', '350.06', '12', '0', '0'),
('25', '9', '30', '1005', 'Natural Vitamin E', '0', '341.5', '6', '0', '0'),
('26', '10', '30', '1001', 'Vitamin D3', '0', '746', '1', '0', '0'),
('27', '11', '30', '1001', 'Vitamin D3', '5', '746', '5', '0', '0'),
('28', '11', '30', 'DC', 'DISCOUNT', '5', '0', '5', '0', '0'),
('29', '12', '30', '1001', 'Vitamin D3', '1', '746', '1', '0', '0'),
('30', '13', '30', '1001', 'Vitamin D3', '1', '746', '1', '0', '0'),
('31', '14', '30', '1001', 'Vitamin D3', '100', '746', '100', '0', '0'),
('32', '14', '30', '1003', 'Folic Acid', '124', '255.82', '124', '0', '0'),
('33', '15', '30', '1002', 'Vitamin C', '177', '746', '177', '0', '0'),
('34', '15', '30', '1005', 'Natural Vitamin E', '10', '341.5', '10', '0', '0'),
('35', '16', '30', '1001', 'Vitamin D3', '100', '746', '100', '0', '0'),
('36', '16', '30', 'DC', 'DISCOUNT', '1', '0', '1', '0', '0'),
('37', '17', '30', '1007', 'Calcium + Magnesium + Zinc +D', '12', '231.34', '12', '0', '0'),
('38', '17', '30', '1008', 'Calcium 600 + Vitamin D', '12', '230.11', '12', '0', '0'),
('39', '17', '30', '1012', 'Cod Liver Oil', '12', '376.99', '12', '0', '0'),
('40', '17', '30', '1009', 'CoQ - 10', '12', '473.69', '12', '0', '0'),
('41', '17', '30', '1014', 'Evening Prime Rose Oil', '12', '369.65', '12', '0', '0'),
('42', '17', '30', '1010', 'Glucosamine &amp; Chondroitin', '12', '362.3', '12', '0', '0'),
('43', '17', '30', '1013', 'Omega 3 Fish Oil', '24', '266.83', '24', '0', '0'),
('44', '17', '30', '1002', 'Vitamin C', '12', '746', '12', '0', '0'),
('45', '17', '30', '1001', 'Vitamin D3', '12', '746', '12', '0', '0'),
('46', '17', '30', '1005', 'Natural Vitamin E', '6', '341.5', '6', '0', '0'),
('47', '17', '30', '1017', 'Multivitamin for Men', '24', '335.38', '24', '0', '0'),
('48', '17', '30', '1018', 'Multivitamin for Women', '12', '350.06', '12', '0', '0'),
('49', '18', '30', '1001', 'Vitamin D3', '0', '746', '1', '0', '0'),
('50', '18', '30', '1002', 'Vitamin C', '0', '746', '1', '0', '0'),
('51', '18', '30', '1003', 'Folic Acid', '0', '255.82', '1', '0', '0'),
('52', '19', '30', '1005', 'Natural Vitamin E', '100', '341.5', '100', '0', '0.2'),
('53', '19', '30', '1003', 'Folic Acid', '100', '255.82', '100', '0', '0.2'),
('54', '20', '30', '1002', 'Vitamin C', '100', '746', '100', '0', '0.25'),
('55', '21', '30', '1002', 'Vitamin C', '10', '746', '10', '0', '0.2'),
('56', '22', '30', '1001', 'Vitamin D3', '10', '746', '10', '0', '0.2'),
('57', '23', '30', '1001', 'Vitamin D3', '1', '500', '1', '0', '0.2'),
('58', '24', '30', '1001', 'Vitamin D3', '1', '746', '1', '0', '0'),
('59', '24', '30', '1001', 'Vitamin D3', '199', '746', '199', '0', '0'),
('60', '25', '30', '1001', 'Vitamin D3', '110', '746', '110', '0', '0.2'),
('61', '26', '30', '1001', 'Vitamin D3', '10', '746', '10', '0', '0.2');

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
  `text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `discount1` double NOT NULL,
  `discount2` double NOT NULL,
  `disc1` double NOT NULL,
  `disc2` double NOT NULL,
  PRIMARY KEY (`trans_type`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_orders` ###

INSERT INTO `0_sales_orders` VALUES
('2', '30', '1', '0', '4', '3', 'auto', '', NULL, '2017-08-24', '1', '1', 'Blue Area', NULL, NULL, 'D.Watson Blue Area Old', '0', 'DEF', '2017-09-08', '1', '77925', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('3', '30', '1', '0', '4', '3', 'auto', '', NULL, '2017-08-24', '1', '1', 'Blue Area', NULL, NULL, 'D.Watson Blue Area Old', '0', 'DEF', '2017-09-08', '1', '10390', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('4', '30', '1', '0', '4', '3', 'auto', '', NULL, '2016-06-30', '1', '1', 'Blue Area', NULL, NULL, 'D.Watson Blue Area Old', '0', 'DEF', '2016-07-15', '1', '29247.88', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('5', '30', '1', '0', '19', '18', 'auto', '', NULL, '2016-06-30', '1', '1', 'asjkfdjhk', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2016-07-15', '1', '37300', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('8', '30', '1', '0', '19', '18', 'auto', '', NULL, '2016-06-30', '1', '1', 'trstrd', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2016-07-15', '1', '58188', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('9', '30', '0', '0', '6', '5', 'SO003/2016', 'N/A', 'For Delivery', '2016-09-06', '1', '1', 'D Watson Bahria Town', '03315110397', NULL, 'D.Watson Bahria Town', '0', 'DEF', '2016-09-07', '1', '31496.75', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('10', '30', '0', '0', '6', '5', 'SO002/2017', '', NULL, '2017-09-06', '1', '1', 'Bahria Town', NULL, NULL, 'D.Watson Bahria Town', '0', 'DEF', '2017-09-07', '1', '887.74', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('11', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-08', '1', '1', 'Isb', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-23', '1', '3730', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('12', '30', '1', '0', '19', '18', 'SO003/2017', '', NULL, '2017-09-08', '1', '1', 'isb', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-09', '1', '746', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('13', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-08', '1', '1', 'ISB', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-23', '1', '746', '0', '0', '0', '0', '0', '0', '', '', '', '10', '46', '0', '0'),
('14', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-08', '1', '1', 'sdafrfgfsty', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-23', '1', '106321.68', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('15', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-08', '1', '1', 'ghghfgh', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-23', '1', '135457', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('16', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-08', '1', '1', 'aerd', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-23', '1', '74600', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('17', '30', '1', '0', '11', '10', 'auto', '', NULL, '2017-09-08', '1', '1', 'Super Market, F-6 Markaz, Islamabad', NULL, NULL, 'D.Watson F-6 Super Market', '0', 'DEF', '2017-09-23', '1', '75131.51', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('18', '30', '0', '0', '11', '10', 'SO004/2017', '', NULL, '2017-09-08', '1', '1', 'Super Market, F-6 Markaz, Islamabad', NULL, NULL, 'D.Watson F-6 Super Market', '0', 'DEF', '2017-09-09', '1', '2079.91', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('19', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-11', '1', '1', 'asdf', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-26', '1', '47785.6', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('20', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-11', '1', '1', 'fgh', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-26', '1', '55950', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('21', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-12', '1', '1', 'isb', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-27', '1', '5968', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('22', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-12', '1', '1', 'isb', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-27', '1', '5968', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('23', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-12', '1', '1', 'fewfgrew', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-27', '1', '400', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('24', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-12', '1', '1', 'ghf', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-27', '1', '149200', '0', '0', '0', '0', '0', '0', '', '', '', '37300', '8000', '0', '0'),
('25', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-14', '1', '1', 'isb', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-29', '1', '65648', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0'),
('26', '30', '1', '0', '19', '18', 'auto', '', NULL, '2017-09-15', '1', '1', 'isb', NULL, NULL, 'Dr. Seemi (Tahir Golden)', '0', 'DEF', '2017-09-30', '1', '5968', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_pos` ###

INSERT INTO `0_sales_pos` VALUES
('1', 'Default', '1', '1', 'DEF', '4', '0');

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
('1', 'Distribution', '0', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_salesman` ###

INSERT INTO `0_salesman` VALUES
('1', 'Sales Person', '', '', '', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_security_roles` ###

INSERT INTO `0_security_roles` VALUES
('1', 'Inquiries', 'Inquiries', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132;775', '0'),
('2', 'System Administrator', 'System Administrator', '256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;9216;9472;9728;10496;10752;11008;13056;13312;15616;15872;16128;484352', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;775;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;9217;9218;9220;9473;9474;9475;9476;9729;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15630;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;15884;16129;16130;16131;16132;484452', '0'),
('3', 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873;775', '0'),
('4', 'Stock Manager', 'Stock Manager', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132;775', '0'),
('5', 'Production Manager', 'Production Manager', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('6', 'Purchase Officer', 'Purchase Officer', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('7', 'AR Officer', 'AR Officer', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', '0'),
('8', 'AP Officer', 'AP Officer', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;769;770;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5635;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('9', 'Accountant', 'New Accountant', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', '0'),
('10', 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132;775', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('1', 'Supplies', '1', 'each', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('2', 'Services', '1', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('3', 'Misc.', '1', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0');

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
  `amount_1` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `amount_2` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `amount_3` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `amount_4` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `amount_5` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `amount_6` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `text_field_1` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `text_field_2` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `text_field_3` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_master` ###

INSERT INTO `0_stock_master` VALUES
('1001', '1', '1', 'Vitamin D3', '', '90', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '257.137418033', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1002', '1', '1', 'Vitamin C', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '254.72617423', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1003', '1', '1', 'Folic Acid', '', '100', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '213.18', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1004', '1', '1', 'Vitamin B Complex + Vitamin C', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '221.34', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1005', '1', '1', 'Natural Vitamin E', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '284.58', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1006', '1', '1', 'Iron', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '161.16', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1007', '1', '1', 'Calcium + Magnesium + Zinc +D', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '192.78', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1008', '1', '1', 'Calcium 600 + Vitamin D', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '191.76', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1009', '1', '1', 'CoQ - 10', '', '30', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '394.74', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1010', '1', '1', 'Glucosamine &amp; Chondroitin', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '301.92', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1011', '1', '1', 'Hair, Skin and Nails', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '215.22', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1012', '1', '1', 'Cod Liver Oil', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '314.16', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1013', '1', '1', 'Omega 3 Fish Oil', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '222.36', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1014', '1', '1', 'Evening Prime Rose Oil', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '308.04', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1015', '1', '1', 'Ginkgo Biloba', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '196.86', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1016', '1', '1', 'Ginseng and Ginkgo Biloba', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1017', '1', '1', 'Multivitamin for Men', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '279.48', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1018', '1', '1', 'Multivitamin for Women', '', '60', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '291.72', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('1019', '1', '1', 'Vitaminerals', '', '100', 'CN', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '253.98', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('DC', '3', '1', 'DISCOUNT', '', '', 'each', 'D', '4025', '4025', '1021', '5014', '1023', '0', '0', '349965', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('IVE', '3', '1', 'INCENTIVE', '', '', 'each', 'D', '4024', '4024', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', ''),
('OB', '3', '1', 'Opening Balance Equity', '', '', 'each', 'D', '3012', '3012', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_moves` ###

INSERT INTO `0_stock_moves` VALUES
('1', '1', '1001', '17', 'DEF', '2017-08-24', '0', '0', 'IA001/2017', '1000', '300', '0'),
('2', '1', '1002', '17', 'DEF', '2017-08-24', '0', '0', 'IA001/2017', '1000', '300', '0'),
('3', '1', 'DC', '25', 'DEF', '2017-08-24', '1', '3333', '', '1', '0', '0'),
('4', '1', '1001', '13', 'DEF', '2017-08-24', '0', '746', 'auto', '-100', '300', '0'),
('5', '1', '1002', '13', 'DEF', '2017-08-24', '0', '746', 'auto', '-50', '300', '0'),
('6', '1', 'DC', '13', 'DEF', '2017-08-24', '0', '-27975', 'auto', '-1', '0', '0'),
('7', '1', 'IVE', '13', 'DEF', '2017-08-24', '0', '-6000', 'auto', '-1', '0', '0'),
('8', '2', '1001', '13', 'DEF', '2017-08-24', '0', '559.5', 'auto', '-10', '300', '0'),
('9', '2', '1002', '13', 'DEF', '2017-08-24', '0', '559.5', 'auto', '-10', '300', '0'),
('10', '2', 'IVE', '13', 'DEF', '2017-08-24', '0', '-800', 'auto', '-1', '0', '0'),
('11', '2', '1001', '25', 'DEF', '2017-08-24', '1', '2.5', '', '1000', '280.158730159', '0'),
('12', '2', '1002', '25', 'DEF', '2017-08-24', '1', '2.5', '', '1000', '280.670103093', '0'),
('13', '3', '1001', '25', 'DEF', '2016-05-24', '1', '2.11', '', '1038', '257.137418033', '0'),
('14', '3', '1002', '25', 'DEF', '2016-05-24', '1', '2.04', '', '1079', '254.72617423', '0'),
('15', '3', '1003', '25', 'DEF', '2016-05-24', '1', '2.09', '', '975', '213.18', '0'),
('16', '3', '1004', '25', 'DEF', '2016-05-24', '1', '2.17', '', '1026', '221.34', '0'),
('17', '3', '1005', '25', 'DEF', '2016-05-24', '1', '2.79', '', '1001', '284.58', '0'),
('18', '3', '1006', '25', 'DEF', '2016-05-24', '1', '1.58', '', '1100', '161.16', '0'),
('19', '3', '1007', '25', 'DEF', '2016-05-24', '1', '1.89', '', '1065', '192.78', '0'),
('20', '3', '1008', '25', 'DEF', '2016-05-24', '1', '1.88', '', '1001', '191.76', '0'),
('21', '3', '1009', '25', 'DEF', '2016-05-24', '1', '3.87', '', '1002', '394.74', '0'),
('22', '3', '1010', '25', 'DEF', '2016-05-24', '1', '2.96', '', '1000', '301.92', '0'),
('23', '3', '1011', '25', 'DEF', '2016-05-24', '1', '2.11', '', '1096', '215.22', '0'),
('24', '3', '1012', '25', 'DEF', '2016-05-24', '1', '3.08', '', '1016', '314.16', '0'),
('25', '3', '1013', '25', 'DEF', '2016-05-24', '1', '2.18', '', '1000', '222.36', '0'),
('26', '3', '1014', '25', 'DEF', '2016-05-24', '1', '3.02', '', '1002', '308.04', '0'),
('27', '3', '1015', '25', 'DEF', '2016-05-24', '1', '1.93', '', '1056', '196.86', '0'),
('28', '3', '1017', '25', 'DEF', '2016-05-24', '1', '2.74', '', '1076', '279.48', '0'),
('29', '3', '1018', '25', 'DEF', '2016-05-24', '1', '2.86', '', '1013', '291.72', '0'),
('30', '3', '1019', '25', 'DEF', '2016-05-24', '1', '2.49', '', '1000', '253.98', '0'),
('31', '3', '1001', '13', 'DEF', '2016-06-30', '0', '746', 'auto', '-12', '257.137418033', '0'),
('32', '3', '1002', '13', 'DEF', '2016-06-30', '0', '746', 'auto', '-15', '254.72617423', '0'),
('33', '3', '1013', '13', 'DEF', '2016-06-30', '0', '266.83', 'auto', '-36', '222.36', '0'),
('34', '3', 'DC', '13', 'DEF', '2016-06-30', '0', '-1000', 'auto', '-1', '0', '0'),
('35', '3', 'IVE', '13', 'DEF', '2016-06-30', '0', '500', 'auto', '-1', '0', '0'),
('36', '4', '1001', '13', 'DEF', '2016-06-30', '0', '746', 'auto', '-50', '257.137418033', '0'),
('37', '2', '1001', '17', 'DEF', '2016-06-30', '0', '0', 'IA001/2016', '-20', '257.137418033', '0'),
('38', '5', '1001', '13', 'DEF', '2016-06-30', '0', '746', 'auto', '-78', '257.137418033', '0'),
('39', '6', '1001', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-5', '257.137418033', '0'),
('40', '6', 'DC', '13', 'DEF', '2017-09-08', '0', '0', 'auto', '-5', '0', '0'),
('41', '7', '1001', '13', 'DEF', '2017-09-08', '0', '746', 'DN001/2017', '-1', '257.137418033', '0'),
('42', '8', '1001', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-1', '257.137418033', '0'),
('43', '9', '1001', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-100', '257.137418033', '0'),
('44', '9', '1003', '13', 'DEF', '2017-09-08', '0', '255.82', 'auto', '-124', '213.18', '0'),
('45', '10', '1002', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-177', '254.72617423', '0'),
('46', '10', '1005', '13', 'DEF', '2017-09-08', '0', '341.5', 'auto', '-10', '284.58', '0'),
('47', '11', '1001', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-100', '257.137418033', '0'),
('48', '11', 'DC', '13', 'DEF', '2017-09-08', '0', '0', 'auto', '-1', '0', '0'),
('49', '12', '1007', '13', 'DEF', '2017-09-08', '0', '231.34', 'auto', '-12', '192.78', '0'),
('50', '12', '1008', '13', 'DEF', '2017-09-08', '0', '230.11', 'auto', '-12', '191.76', '0'),
('51', '12', '1012', '13', 'DEF', '2017-09-08', '0', '376.99', 'auto', '-12', '314.16', '0'),
('52', '12', '1009', '13', 'DEF', '2017-09-08', '0', '473.69', 'auto', '-12', '394.74', '0'),
('53', '12', '1014', '13', 'DEF', '2017-09-08', '0', '369.65', 'auto', '-12', '308.04', '0'),
('54', '12', '1010', '13', 'DEF', '2017-09-08', '0', '362.3', 'auto', '-12', '301.92', '0'),
('55', '12', '1013', '13', 'DEF', '2017-09-08', '0', '266.83', 'auto', '-24', '222.36', '0'),
('56', '12', '1002', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-12', '254.72617423', '0'),
('57', '12', '1001', '13', 'DEF', '2017-09-08', '0', '746', 'auto', '-12', '257.137418033', '0'),
('58', '12', '1005', '13', 'DEF', '2017-09-08', '0', '341.5', 'auto', '-6', '284.58', '0'),
('59', '12', '1017', '13', 'DEF', '2017-09-08', '0', '335.38', 'auto', '-24', '279.48', '0'),
('60', '12', '1018', '13', 'DEF', '2017-09-08', '0', '350.06', 'auto', '-12', '291.72', '0'),
('61', '13', '1005', '13', 'DEF', '2017-09-11', '0', '273.2', 'auto', '-100', '284.58', '0'),
('62', '13', '1003', '13', 'DEF', '2017-09-11', '0', '204.656', 'auto', '-100', '213.18', '0'),
('63', '14', '1002', '13', 'DEF', '2017-09-11', '0', '559.5', 'auto', '-100', '254.72617423', '0'),
('64', '15', '1002', '13', 'DEF', '2017-09-12', '0', '596.8', 'auto', '-10', '254.72617423', '0'),
('65', '16', '1001', '13', 'DEF', '2017-09-12', '0', '596.8', 'auto', '-10', '257.137418033', '0'),
('66', '17', '1001', '13', 'DEF', '2017-09-12', '0', '400', 'auto', '-1', '257.137418033', '0'),
('67', '18', '1001', '13', 'DEF', '2017-09-12', '0', '746', 'auto', '-1', '257.137418033', '0'),
('68', '18', '1001', '13', 'DEF', '2017-09-12', '0', '746', 'auto', '-199', '257.137418033', '0'),
('69', '19', '1001', '13', 'DEF', '2017-09-14', '0', '596.8', 'auto', '-110', '257.137418033', '0'),
('70', '20', '1001', '13', 'DEF', '2017-09-15', '0', '596.8', 'auto', '-10', '257.137418033', '0');

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
  `Unit_Amt` double NOT NULL,
  `Gross_Amt` double NOT NULL,
  `As_Per_B_E` double NOT NULL,
  `Landing` double NOT NULL,
  `Landing_Amt` double NOT NULL,
  `Value_invl_Landing` double NOT NULL,
  `INS` double NOT NULL,
  `INS_Amt` double NOT NULL,
  `Value_Incl_INC` double NOT NULL,
  `F_E_D` double NOT NULL,
  `F_E_D_Amt` double NOT NULL,
  `Duty` double NOT NULL,
  `Duty_Amt` double NOT NULL,
  `Value_And_Duty` double NOT NULL,
  `Value_Excl_S_T` double NOT NULL,
  `S_T` double NOT NULL,
  `S_T_Amt` double NOT NULL,
  `Amount_Incl_S_T` double NOT NULL,
  `I_Tax` double NOT NULL,
  `I_Tax_Amt` double NOT NULL,
  `Add_S_T` double NOT NULL,
  `Add_S_T_Amt` double NOT NULL,
  `Total_Charges` double NOT NULL,
  `Other_Expense` double NOT NULL,
  `Net_Amount` double NOT NULL,
  `Job_Name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `Total_Other_Expenses` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `Gross_Amt_new` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_invoice_items` ###

INSERT INTO `0_supp_invoice_items` VALUES
('1', '1', '20', '0', '1', '5', 'DC', 'Discount', '1', '3333', '633.27', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '');

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
  `gross_rate` double NOT NULL,
  `total_` double NOT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_trans` ###

INSERT INTO `0_supp_trans` VALUES
('1', '20', '1', 'SPI001/2017', '22`12', '2017-08-24', '2017-08-24', '3333', '0', '0', '0', '105', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

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
  `ntn_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_id`),
  KEY `supp_ref` (`supp_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('1', 'Alpha Vitamins', 'Alpha USA', '', '', '', '', '', '', '', 'USD', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('2', 'Test Supplier', 'Test Supplier', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0');

### Structure of table `0_sys_pay_pref_new` ###

DROP TABLE IF EXISTS `0_sys_pay_pref_new`;

CREATE TABLE `0_sys_pay_pref_new` (
  `name` varchar(35) NOT NULL,
  `account` tinytext NOT NULL,
  `text_name` varchar(60) NOT NULL,
  `default_value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_sys_pay_pref_new` ###

INSERT INTO `0_sys_pay_pref_new` VALUES
('Landing_Amt', '1021', 'Landing Amount', '1'),
('INS_Amt', '1021', 'INS Amount', '1'),
('F_E_D_Amt', '1021', 'FED Amount', '8'),
('Duty_Amt', '1021', 'Duty Amount', '5'),
('S_T_Amt', '1021', 'Sales Tax Amount', '17'),
('I_Tax_Amt', '1021', 'Income tax Amount', '5.5'),
('Add_S_T_Amt', '1021', 'Additional Tax', ''),
('Other_Expense', '1021', 'Other Expense', ''),
('add_income_tax', '1060', ' Advance Income Tax ', '');

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
('add_pct', 'setup.company', 'int', '5', '20'),
('allow_negative_prices', 'glsetup.inventory', 'tinyint', '1', '1'),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', '1', '0'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', '1'),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '5036'),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', 'waseemsamma@gmail.com'),
('company_logo_report', 'setup.company', 'tinyint', '1', '0'),
('coy_logo', 'setup.company', 'varchar', '100', 'option01a.jpg'),
('coy_name', 'setup.company', 'varchar', '60', 'Alpha Omega Integrated Services (AOIS)'),
('coy_no', 'setup.company', 'varchar', '25', ''),
('creditors_act', 'glsetup.purchase', 'varchar', '15', '2011'),
('curr_default', 'setup.company', 'char', '3', 'PKR'),
('debtors_act', 'glsetup.sales', 'varchar', '15', '1013'),
('default_adj_act', 'glsetup.items', 'varchar', '15', '5014'),
('default_cogs_act', 'glsetup.items', 'varchar', '15', '5011'),
('default_credit_limit', 'glsetup.customer', 'int', '11', '0'),
('default_delivery_required', 'glsetup.sales', 'smallint', '6', '1'),
('default_dim_required', 'glsetup.dims', 'int', '11', '20'),
('default_inv_sales_act', 'glsetup.items', 'varchar', '15', '4011'),
('default_inventory_act', 'glsetup.items', 'varchar', '15', '1021'),
('default_loss_on_asset_disposal_act', 'glsetup.items', 'varchar', '15', '5014'),
('default_prompt_payment_act', 'glsetup.sales', 'varchar', '15', '4025'),
('default_quote_valid_days', 'glsetup.sales', 'smallint', '6', '30'),
('default_receival_required', 'glsetup.purchase', 'smallint', '6', '10'),
('default_sales_act', 'glsetup.sales', 'varchar', '15', ''),
('default_sales_discount_act', 'glsetup.sales', 'varchar', '15', '4025'),
('default_wip_act', 'glsetup.items', 'varchar', '15', '1023'),
('default_workorder_required', 'glsetup.manuf', 'int', '11', '20'),
('deferred_income_act', 'glsetup.sales', 'varchar', '15', ''),
('depreciation_period', 'glsetup.company', 'tinyint', '1', '1'),
('discount1', 'glsetup.sales', 'varchar', '15', '4025'),
('discount2', 'glsetup.sales', 'varchar', '15', '4026'),
('domicile', 'setup.company', 'varchar', '55', 'Islamabad'),
('email', 'setup.company', 'varchar', '100', 'support@goodhealthnutrition.co'),
('exchange_diff_act', 'glsetup.general', 'varchar', '15', '4023'),
('f_year', 'setup.company', 'int', '11', '3'),
('fax', 'setup.company', 'varchar', '30', '0518444751'),
('freight_act', 'glsetup.customer', 'varchar', '15', '4021'),
('gl_closing_date', 'setup.closing_date', 'date', '8', ''),
('grn_clearing_act', 'glsetup.purchase', 'varchar', '15', ''),
('gst_no', 'setup.company', 'varchar', '25', '327786112592'),
('legal_text', 'glsetup.customer', 'tinytext', '0', ''),
('loc_notification', 'glsetup.inventory', 'tinyint', '1', ''),
('login_tout', 'setup.company', 'smallint', '6', '6000'),
('no_customer_list', 'setup.company', 'tinyint', '1', '0'),
('no_item_list', 'setup.company', 'tinyint', '1', '0'),
('no_supplier_list', 'setup.company', 'tinyint', '1', '0'),
('no_zero_lines_amount', 'glsetup.sales', 'tinyint', '1', '1'),
('past_due_days', 'glsetup.general', 'int', '11', '30'),
('phone', 'setup.company', 'varchar', '30', '0518444750'),
('po_over_charge', 'glsetup.purchase', 'int', '11', '10'),
('po_over_receive', 'glsetup.purchase', 'int', '11', '10'),
('postal_address', 'setup.company', 'tinytext', '0', 'Office # 11, 3rd Floor, United Plaza, Fazal-e-Haq Road, Blue Area, Islamabad'),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '5030'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '5016'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '3021'),
('round_to', 'setup.company', 'int', '5', '1'),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', '1', ''),
('suppress_tax_rates', 'setup.company', 'tinyint', '1', ''),
('tax_algorithm', 'glsetup.customer', 'tinyint', '1', '1'),
('tax_last', 'setup.company', 'int', '11', '1'),
('tax_prd', 'setup.company', 'int', '11', '1'),
('time_zone', 'setup.company', 'tinyint', '1', '1'),
('use_dimension', 'setup.company', 'tinyint', '1', '0'),
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
('sales_quotation', ''),
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
('pf_drill_text', 'Balance Sheet drilldown'),
('drill_balance_text', 'Balance Sheet drilldown'),
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
('sales_quotation', ''),
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
('user_account_setup_text', 'User Account Setup'),
('complete_voucher_text', 'Voucher Inquiry'),
('complete_voucher', '1'),
('invoice_prepaid_order', '1'),
('invoice_prepaid_order_text', 'Invoice Prepaid Orders');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
('1', '19', '2013', '2014', 'Tax', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_trans_tax_details` ###

INSERT INTO `0_trans_tax_details` VALUES
('1', '20', '1', '2017-08-24', '0', '0', '105', '0', '3333', '0', '22`12', '1'),
('2', '13', '1', '2017-08-24', '0', '0', '1', '0', '77925', '0', 'auto', NULL),
('3', '10', '1', '2017-08-24', '0', '0', '1', '0', '77925', '0', 'SI001/2017', '0'),
('4', '13', '2', '2017-08-24', '0', '0', '1', '0', '10390', '0', 'auto', NULL),
('5', '10', '2', '2017-08-24', '0', '0', '1', '0', '10390', '0', 'SI002/2017', '0'),
('6', '11', '1', '2017-08-24', '0', '0', '1', '0', '2797.5', '0', 'CCN001/2017', '0'),
('7', '13', '3', '2016-06-30', '0', '0', '1', '0', '29247.88', '0', 'auto', NULL),
('8', '10', '3', '2016-06-30', '0', '0', '1', '0', '29247.88', '0', 'SI001/2016', '0'),
('9', '13', '4', '2016-06-30', '0', '0', '1', '0', '37300', '0', 'auto', NULL),
('10', '10', '4', '2016-06-30', '0', '0', '1', '0', '37300', '0', 'SI002/2016', '0'),
('11', '13', '5', '2016-06-30', '0', '0', '1', '0', '58188', '0', 'auto', NULL),
('12', '10', '5', '2016-06-30', '0', '0', '1', '0', '58188', '0', 'SI003/2016', '0'),
('13', '13', '6', '2017-09-08', '0', '0', '1', '0', '3730', '0', 'auto', NULL),
('14', '10', '6', '2017-09-08', '0', '0', '1', '0', '3730', '0', 'SI003/2017', '0'),
('15', '13', '7', '2017-09-08', '0', '0', '1', '0', '746', '0', 'DN001/2017', NULL),
('16', '13', '8', '2017-09-08', '0', '0', '1', '0', '746', '0', 'auto', NULL),
('17', '10', '7', '2017-09-08', '0', '0', '1', '0', '746', '0', 'SI004/2017', '0'),
('18', '13', '9', '2017-09-08', '0', '0', '1', '0', '106321.68', '0', 'auto', NULL),
('19', '10', '8', '2017-09-08', '0', '0', '1', '0', '106321.68', '0', 'SI005/2017', '0'),
('20', '13', '10', '2017-09-08', '0', '0', '1', '0', '135457', '0', 'auto', NULL),
('21', '10', '9', '2017-09-08', '0', '0', '1', '0', '135457', '0', 'SI006/2017', '0'),
('22', '13', '11', '2017-09-08', '0', '0', '1', '0', '74600', '0', 'auto', NULL),
('23', '10', '10', '2017-09-08', '0', '0', '1', '0', '74600', '0', 'SI007/2017', '0'),
('24', '13', '12', '2017-09-08', '1', '19', '1', '0', '63135.72', '11995.79', 'auto', NULL),
('25', '10', '11', '2017-09-08', '1', '19', '1', '0', '63135.72', '11995.79', 'SI008/2017', '0'),
('26', '13', '13', '2017-09-11', '0', '0', '1', '0', '47785.6', '0', 'auto', NULL),
('27', '10', '12', '2017-09-11', '0', '0', '1', '0', '47785.6', '0', 'SI009/2017', '0'),
('28', '13', '14', '2017-09-11', '0', '0', '1', '0', '55950', '0', 'auto', NULL),
('29', '10', '13', '2017-09-11', '0', '0', '1', '0', '55950', '0', 'SI010/2017', '0'),
('30', '13', '15', '2017-09-12', '0', '0', '1', '0', '5968', '0', 'auto', NULL),
('31', '10', '14', '2017-09-12', '0', '0', '1', '0', '5968', '0', 'SI011/2017', '0'),
('32', '13', '16', '2017-09-12', '0', '0', '1', '0', '5968', '0', 'auto', NULL),
('33', '10', '15', '2017-09-12', '0', '0', '1', '0', '5968', '0', 'SI012/2017', '0'),
('34', '13', '17', '2017-09-12', '0', '0', '1', '0', '400', '0', 'auto', NULL),
('35', '10', '16', '2017-09-12', '0', '0', '1', '0', '400', '0', 'SI013/2017', '0'),
('36', '13', '18', '2017-09-12', '0', '0', '1', '0', '149200', '0', 'auto', NULL),
('37', '10', '17', '2017-09-12', '0', '0', '1', '0', '149200', '0', 'SI014/2017', '0'),
('38', '13', '19', '2017-09-14', '0', '0', '1', '0', '65648', '0', 'auto', NULL),
('39', '10', '18', '2017-09-14', '0', '0', '1', '0', '65648', '0', 'SI015/2017', '0'),
('40', '13', '20', '2017-09-15', '0', '0', '1', '0', '5968', '0', 'auto', NULL),
('41', '10', '19', '2017-09-15', '0', '0', '1', '0', '5968', '0', 'SI016/2017', '0');

### Structure of table `0_user_locations` ###

DROP TABLE IF EXISTS `0_user_locations`;

CREATE TABLE `0_user_locations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `loc_code` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_user_locations` ###

INSERT INTO `0_user_locations` VALUES
('1', 'DEF', '1', '0'),
('2', 'DEF', '9', '0'),
('3', 'DEF', '11', '0'),
('4', 'DEF', '12', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###

INSERT INTO `0_useronline` VALUES
('59', '1505468964', '111.88.15.186', '/index.php'),
('60', '1505468970', '111.88.15.186', '/index.php'),
('61', '1505468974', '111.88.15.186', '/index.php'),
('62', '1505468976', '111.88.15.186', '/sales/sales_order_entry.php'),
('63', '1505468979', '111.88.15.186', '/admin/backups.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('1', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Administrator', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-09-15 14:49:23', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('9', 'alighumman', '81dc9bdb52d04dc20036dbd8313ed055', 'Ali Ghumman', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-09-14 14:38:51', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('11', 'waseemsamma', '7e4b9f14903758dd6dae26a7ff3d2624', 'Waseem Samma', '2', '03335119949', 'waseemsamma@gmail.com', 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('12', 'asadrauf', '902c2e29a3f2b3619e4df024dcd90094', 'Asad Rauf', '2', '03315110397', 'asadrauf866@yahoo.com', 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-09-15 14:34:50', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
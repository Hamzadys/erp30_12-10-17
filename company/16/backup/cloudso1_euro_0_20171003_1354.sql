# MySQL dump of database 'cloudso1_euro' on host 'localhost'
# Backup Date and Time: 2017-10-03 13:54
# Built by Hisaab.pk 2.4.2
# http://www.hisaab.pk
# Company: EURO
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_areas` ###

INSERT INTO `0_areas` VALUES
('1', 'Lahore Horica Parties', '0'),
('2', 'Peshawar 1', '0'),
('3', 'Peshawar 2', '0'),
('4', 'Outstation 1 Zahir', '0'),
('5', 'Outstation 2  Zahir', '0'),
('6', 'Oustation 3 Ejaz', '0'),
('7', 'outstation 4 Ejaz', '0'),
('8', 'Islamabad Horica', '0'),
('9', 'Islamabad Retail', '0'),
('10', 'Karachi Parties', '0'),
('11', 'Lahore Retail/Instit', '0');

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
  `opening` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  KEY `Type_and_Number` (`type`,`trans_no`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###

INSERT INTO `0_audit_trail` VALUES
('1', '30', '1', '20', '2017-09-29 03:07:40', NULL, '2', '2017-06-30', '0', NULL),
('2', '13', '1', '20', '2017-09-29 03:07:40', NULL, '2', '2017-06-30', '0', NULL),
('3', '10', '1', '20', '2017-09-29 03:07:40', NULL, '2', '2017-06-30', '0', NULL),
('4', '30', '2', '20', '2017-09-29 03:11:05', NULL, '2', '2017-06-30', '0', NULL),
('5', '13', '2', '20', '2017-09-29 03:11:05', NULL, '2', '2017-06-30', '0', NULL),
('6', '10', '2', '20', '2017-09-29 03:11:05', NULL, '2', '2017-06-30', '0', NULL),
('7', '30', '3', '20', '2017-10-01 01:27:55', NULL, '3', '2017-10-01', '0', NULL),
('8', '13', '3', '20', '2017-10-01 01:27:55', NULL, '3', '2017-10-01', '0', NULL),
('9', '10', '3', '20', '2017-10-03 01:24:40', NULL, '2', '2017-10-01', NULL, NULL),
('10', '30', '4', '20', '2017-10-01 01:28:55', NULL, '3', '2017-10-01', '0', NULL),
('11', '13', '4', '20', '2017-10-01 01:28:55', NULL, '3', '2017-10-01', '0', NULL),
('12', '10', '4', '20', '2017-10-01 01:28:55', NULL, '3', '2017-10-01', '0', NULL),
('13', '30', '5', '20', '2017-10-01 01:30:08', NULL, '3', '2017-10-01', '0', NULL),
('14', '13', '5', '20', '2017-10-01 01:30:08', NULL, '3', '2017-10-01', '0', NULL),
('15', '10', '5', '20', '2017-10-01 01:30:08', NULL, '3', '2017-10-01', '0', NULL),
('16', '30', '6', '20', '2017-10-01 01:30:59', NULL, '3', '2017-10-01', '0', NULL),
('17', '13', '6', '20', '2017-10-01 01:30:59', NULL, '3', '2017-10-01', '0', NULL),
('18', '10', '6', '20', '2017-10-01 01:30:59', NULL, '3', '2017-10-01', '0', NULL),
('19', '30', '7', '20', '2017-10-01 01:31:46', NULL, '3', '2017-10-01', '0', NULL),
('20', '13', '7', '20', '2017-10-01 01:31:46', NULL, '3', '2017-10-01', '0', NULL),
('21', '10', '7', '20', '2017-10-01 01:31:46', NULL, '3', '2017-10-01', '0', NULL),
('22', '30', '8', '20', '2017-10-01 01:32:30', NULL, '3', '2017-10-01', '0', NULL),
('23', '13', '8', '20', '2017-10-01 01:32:30', NULL, '3', '2017-10-01', '0', NULL),
('24', '10', '8', '20', '2017-10-01 01:32:30', NULL, '3', '2017-10-01', '0', NULL),
('25', '30', '9', '20', '2017-10-01 01:33:36', NULL, '2', '2017-06-30', '0', NULL),
('26', '13', '9', '20', '2017-10-01 01:33:36', NULL, '2', '2017-06-30', '0', NULL),
('27', '10', '9', '20', '2017-10-01 01:33:36', NULL, '2', '2017-06-30', '0', NULL),
('28', '30', '10', '20', '2017-10-01 01:41:03', NULL, '2', '2017-06-30', '0', NULL),
('29', '13', '10', '20', '2017-10-01 01:41:03', NULL, '2', '2017-06-30', '0', NULL),
('30', '10', '10', '20', '2017-10-01 01:41:03', NULL, '2', '2017-06-30', '0', NULL),
('31', '30', '11', '20', '2017-10-01 01:44:40', NULL, '2', '2017-06-30', '0', NULL),
('32', '13', '11', '20', '2017-10-01 01:44:40', NULL, '2', '2017-06-30', '0', NULL),
('33', '10', '11', '20', '2017-10-01 01:44:40', NULL, '2', '2017-06-30', '0', NULL),
('34', '30', '12', '20', '2017-10-02 05:53:30', NULL, '2', '2017-06-30', '0', NULL),
('35', '13', '12', '20', '2017-10-02 05:53:30', NULL, '2', '2017-06-30', '0', NULL),
('36', '10', '12', '20', '2017-10-02 05:53:30', NULL, '2', '2017-06-30', '0', NULL),
('37', '30', '13', '20', '2017-10-02 06:25:19', NULL, '3', '2017-07-01', '0', NULL),
('38', '13', '13', '20', '2017-10-02 06:25:20', NULL, '3', '2017-07-01', '0', NULL),
('39', '10', '13', '20', '2017-10-02 06:25:20', NULL, '3', '2017-07-01', '0', NULL),
('40', '30', '14', '20', '2017-10-02 06:26:37', NULL, '3', '2017-07-01', '0', NULL),
('41', '13', '14', '20', '2017-10-02 06:26:37', NULL, '3', '2017-07-01', '0', NULL),
('42', '10', '14', '20', '2017-10-02 06:26:37', NULL, '3', '2017-07-01', '0', NULL),
('43', '30', '15', '23', '2017-10-02 06:33:46', NULL, '3', '2017-10-02', '0', NULL),
('44', '30', '16', '20', '2017-10-02 07:05:12', NULL, '2', '2017-06-30', '0', NULL),
('45', '13', '15', '20', '2017-10-02 07:05:12', NULL, '2', '2017-06-30', '0', NULL),
('46', '10', '15', '20', '2017-10-02 07:05:12', NULL, '2', '2017-06-30', '0', NULL),
('47', '12', '1', '20', '2017-10-02 07:05:12', NULL, '2', '2017-06-30', '0', NULL),
('48', '30', '17', '20', '2017-10-02 07:20:09', NULL, '2', '2017-06-30', '0', NULL),
('49', '13', '16', '20', '2017-10-02 07:20:09', NULL, '2', '2017-06-30', '0', NULL),
('50', '10', '16', '20', '2017-10-02 07:20:09', NULL, '2', '2017-06-30', '0', NULL),
('51', '12', '2', '20', '2017-10-02 07:20:09', NULL, '2', '2017-06-30', '0', NULL),
('52', '18', '1', '20', '2017-10-02 07:35:23', NULL, '2', '2017-06-30', '0', NULL),
('53', '25', '1', '20', '2017-10-02 07:35:23', NULL, '2', '2017-06-30', '0', NULL),
('54', '20', '1', '20', '2017-10-02 07:35:24', NULL, '2', '2017-06-30', '0', NULL),
('55', '30', '18', '20', '2017-10-02 07:37:40', NULL, '2', '2017-06-30', '0', NULL),
('56', '13', '17', '20', '2017-10-02 07:37:40', NULL, '2', '2017-06-30', '0', NULL),
('57', '10', '17', '20', '2017-10-02 07:37:40', NULL, '2', '2017-06-30', '0', NULL),
('58', '17', '1', '20', '2017-10-02 08:12:58', NULL, '3', '2017-10-01', '0', NULL),
('59', '17', '2', '20', '2017-10-02 08:35:19', NULL, '3', '2017-10-01', '0', NULL),
('60', '17', '3', '20', '2017-10-02 08:40:15', NULL, '3', '2017-10-01', '0', NULL),
('61', '0', '1', '23', '2017-10-03 01:11:34', NULL, '3', '2017-10-03', '0', NULL),
('62', '10', '3', '12', '2017-10-03 01:25:07', 'Updated.', '2', '2017-06-30', NULL, NULL),
('63', '10', '3', '12', '2017-10-03 01:25:07', 'Updated.', '2', '2017-06-30', '0', NULL),
('64', '0', '2', '23', '2017-10-03 03:12:47', NULL, '3', '2017-10-03', '0', NULL),
('65', '0', '3', '23', '2017-10-03 03:19:44', NULL, '3', '2017-10-03', '0', NULL),
('66', '30', '19', '24', '2017-10-03 03:23:20', NULL, '3', '2017-10-02', '0', NULL),
('67', '13', '18', '24', '2017-10-03 03:23:20', NULL, '3', '2017-10-02', '0', NULL),
('68', '10', '18', '24', '2017-10-03 03:23:20', NULL, '3', '2017-10-02', '0', NULL),
('69', '0', '4', '23', '2017-10-03 03:29:21', NULL, '3', '2017-10-03', '0', NULL),
('70', '30', '20', '24', '2017-10-03 03:30:04', NULL, '3', '2017-10-02', '0', NULL),
('71', '13', '19', '24', '2017-10-03 03:30:04', NULL, '3', '2017-10-02', '0', NULL),
('72', '10', '19', '24', '2017-10-03 03:30:04', NULL, '3', '2017-10-02', '0', NULL),
('73', '12', '3', '24', '2017-10-03 03:30:04', NULL, '3', '2017-10-02', '0', NULL),
('74', '30', '21', '24', '2017-10-03 03:39:21', NULL, '3', '2017-10-02', '0', NULL),
('75', '13', '20', '24', '2017-10-03 03:39:22', NULL, '3', '2017-10-02', '0', NULL),
('76', '10', '20', '24', '2017-10-03 03:39:22', NULL, '3', '2017-10-02', '0', NULL),
('77', '12', '4', '24', '2017-10-03 03:39:22', NULL, '3', '2017-10-02', '0', NULL),
('78', '30', '22', '24', '2017-10-03 03:52:46', NULL, '3', '2017-10-02', '0', NULL),
('79', '13', '21', '24', '2017-10-03 03:52:46', NULL, '3', '2017-10-02', '0', NULL),
('80', '10', '21', '24', '2017-10-03 03:52:47', NULL, '3', '2017-10-02', '0', NULL),
('81', '12', '5', '24', '2017-10-03 03:52:47', NULL, '3', '2017-10-02', '0', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('10122', '0', 'SCB', '', 'SCB', NULL, 'PKR', '0', '2', '5036', '0000-00-00 00:00:00', '0', '0'),
('10111', '3', 'Cash in Hand', '', 'Cash in Hand', NULL, 'PKR', '0', '3', '5036', '0000-00-00 00:00:00', '0', '0'),
('10112', '3', 'Petty Cash', '', 'Petty Cash', NULL, 'PKR', '0', '4', '5036', '0000-00-00 00:00:00', '0', '0'),
('10126', '0', 'Euro Meezan Saving Account', '', 'Meezan Bank', NULL, 'PKR', '0', '6', '5036', '0000-00-00 00:00:00', '0', '0'),
('10127', '1', 'Bank Alhabib Peshawat', '', 'Bank Alhaibi', NULL, 'PKR', '0', '7', '5036', '0000-00-00 00:00:00', '0', '0'),
('10128', '1', 'Bank Albarak', '', 'Bank Albaraka', NULL, 'PKR', '0', '8', '5036', '0000-00-00 00:00:00', '0', '0'),
('10129', '1', 'Meezan Current account', '', 'Meezan Bank', NULL, 'PKR', '0', '9', '5036', '0000-00-00 00:00:00', '0', '0');

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
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_trans` ###

INSERT INTO `0_bank_trans` VALUES
('1', '12', '1', '2', 'CP001/06/2017', '2017-06-30', '0', '0', '0', '2', '122', NULL, '0', '0000-00-00', '0', '0', '0'),
('2', '12', '2', '2', 'CP002/06/2017', '2017-06-30', '0', '0', '0', '2', '122', NULL, '0', '0000-00-00', '0', '0', '0'),
('3', '12', '3', '2', 'CP001/10/2017', '2017-10-02', '9260', '0', '0', '2', '14', NULL, '0', '0000-00-00', '0', '0', '0'),
('4', '12', '4', '2', 'CP002/10/2017', '2017-10-02', '3960', '0', '0', '2', '225', NULL, '0', '0000-00-00', '0', '0', '0'),
('5', '12', '5', '2', 'CP003/10/2017', '2017-10-02', '36864', '0', '0', '2', '193', NULL, '0', '0000-00-00', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bom` ###

INSERT INTO `0_bom` VALUES
('7', 'FG1001', 'RM1002', '1', 'DEF', '0.05'),
('6', 'FG1001', 'RM1003', '1', 'DEF', '0.17'),
('17', 'FG10010', 'RM1002', '1', 'DEF', '0.18'),
('24', 'FG10011', 'RM1002', '1', 'DEF', '0.06'),
('23', 'FG10011', 'RM1003', '1', 'DEF', '0.06'),
('26', 'FG10012', 'RM1002', '1', 'DEF', '0.11'),
('25', 'FG10012', 'RM1003', '1', 'DEF', '0.13'),
('28', 'FG10013', 'RM1002', '1', 'DEF', '0.04'),
('27', 'FG10013', 'RM1003', '1', 'DEF', '0.11'),
('30', 'FG10014', 'RM1002', '1', 'DEF', '0.04'),
('29', 'FG10014', 'RM1003', '1', 'DEF', '0.11'),
('31', 'FG10015', 'RM1002', '1', 'DEF', '0.06'),
('32', 'FG10015', 'RM1003', '1', 'DEF', '0.11'),
('34', 'FG10016', 'RM1002', '1', 'DEF', '0.06'),
('33', 'FG10016', 'RM1003', '1', 'DEF', '0.11'),
('35', 'FG10017', 'RM1003', '1', 'DEF', '0.3'),
('37', 'Fg10019', 'RM1002', '1', 'DEF', '0.11'),
('36', 'Fg10019', 'RM1003', '1', 'DEF', '0.04'),
('9', 'FG1002', 'RM1002', '1', 'DEF', '0.05'),
('8', 'FG1002', 'RM1003', '1', 'DEF', '0.17'),
('39', 'FG10020', 'RM1002', '1', 'DEF', '0.13'),
('38', 'FG10021', 'RM1002', '1', 'DEF', '0.13'),
('40', 'FG10022', 'RM1002', '1', 'DEF', '0.21'),
('42', 'FG10023', 'RM1002', '1', 'DEF', '0.17'),
('41', 'FG10023', 'RM1003', '1', 'DEF', '0.18'),
('43', 'FG10024', 'RM1002', '1', 'DEF', '0.07'),
('44', 'FG10024', 'RM1003', '1', 'DEF', '0.07'),
('46', 'Fg10025', 'RM1002', '1', 'DEF', '0.05'),
('45', 'Fg10025', 'RM1003', '1', 'DEF', '0.2'),
('47', 'FG10026', 'RM1002', '1', 'DEF', '0.02'),
('48', 'FG10026', 'RM1003', '1', 'DEF', '0.09'),
('49', 'FG10027', 'RM1002', '1', 'DEF', '0.17'),
('51', 'FG10028', 'RM1002', '1', 'DEF', '0.05'),
('50', 'FG10028', 'RM1003', '1', 'DEF', '0.13'),
('53', 'FG10029', 'RM1002', '1', 'DEF', '0.12'),
('52', 'FG10029', 'RM1003', '1', 'DEF', '0.34'),
('2', 'FG1003', 'RM1001', '1', 'DEF', '0.17'),
('22', 'FG1003', 'RM1002', '1', 'DEF', '0.05'),
('55', 'FG10030', 'RM1002', '1', 'DEF', '0.06'),
('54', 'FG10030', 'RM1003', '1', 'DEF', '0.17'),
('59', 'Fg10031', 'RM1002', '1', 'DEF', '0.35'),
('60', 'Fg10032', 'RM1002', '1', 'DEF', '0.14'),
('66', 'FG10033', 'RM1002', '1', 'DEF', '0.25'),
('65', 'FG10034', 'RM1002', '1', 'DEF', '0.2'),
('58', 'Fg10035', 'RM1002', '1', 'DEF', '0.15'),
('62', 'Fg10036', 'RM1002', '1', 'DEF', '0.16'),
('63', 'FG10037', 'RM1002', '1', 'DEF', '0.42'),
('64', 'FG10038', 'RM1002', '1', 'DEF', '0.2'),
('71', 'Fg10039', 'RM1002', '1', 'DEF', '0.23'),
('11', 'FG1004', 'RM1002', '1', 'DEF', '0.05'),
('10', 'FG1004', 'RM1003', '1', 'DEF', '0.17'),
('67', 'FG10040', 'RM1002', '1', 'DEF', '0.13'),
('68', 'FG10041', 'RM1002', '1', 'DEF', '0.49'),
('69', 'FG10042', 'RM1002', '1', 'DEF', '0.2'),
('70', 'FG10043', 'RM1002', '1', 'DEF', '0.54'),
('56', 'FG10044', 'RM1002', '1', 'DEF', '0.09'),
('57', 'FG10044', 'RM1003', '1', 'DEF', '0.14'),
('61', 'FG10045', 'RM1002', '1', 'DEF', '0.22'),
('72', 'Fg10046', 'RM1003', '1', 'DEF', '0.4'),
('73', 'FG10047', 'RM1002', '1', 'DEF', '0.4'),
('74', 'Fg10049', 'RM1002', '1', 'DEF', '0.7'),
('13', 'FG1005', 'RM1002', '1', 'DEF', '0.05'),
('12', 'FG1005', 'RM1003', '1', 'DEF', '0.17'),
('76', 'FG10050', 'RM1002', '1', 'DEF', '0.05'),
('75', 'FG10050', 'RM1003', '1', 'DEF', '0.18'),
('77', 'FG10051', 'RM1002', '1', 'DEF', '0.29'),
('18', 'FG1006', 'RM1002', '1', 'DEF', '0.05'),
('19', 'FG1006', 'RM1003', '1', 'DEF', '0.17'),
('14', 'FG1007', 'RM1002', '1', 'DEF', '0.18'),
('15', 'FG1008', 'RM1002', '1', 'DEF', '0.18'),
('16', 'FG1009', 'RM1002', '1', 'DEF', '0.18');

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


### Structure of table `0_cashflow_categories` ###

DROP TABLE IF EXISTS `0_cashflow_categories`;

CREATE TABLE `0_cashflow_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `c_type` int(11) NOT NULL,
  `flowtype` int(11) NOT NULL,
  `inactive` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_categories` ###


### Structure of table `0_cashflow_gl` ###

DROP TABLE IF EXISTS `0_cashflow_gl`;

CREATE TABLE `0_cashflow_gl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashflow_category_id` int(11) NOT NULL,
  `gl_account` int(11) NOT NULL,
  `inactive` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_gl` ###


### Structure of table `0_cashflow_type` ###

DROP TABLE IF EXISTS `0_cashflow_type`;

CREATE TABLE `0_cashflow_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `inactive` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_type` ###


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
('10111', '', 'Cash Peshawar', '1011', '0'),
('10112', '', 'Islamabad Cash', '1011', '0'),
('10113', '', 'Cash lahore', '1011', '0'),
('10120', '', 'Meezan Current account', '1012', '0'),
('10122', '', 'SCB', '1012', '0'),
('10126', '', 'Meezan Saving Bank acocunt', '1012', '0'),
('10127', '', 'Bank Alhabib', '1012', '0'),
('10128', '', 'Bank Albaraka', '1012', '0'),
('10129', '', 'Meezan Current account', '1012', '0'),
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
('1025', '', 'Boxes and lables', '102', '0'),
('1031', '', 'Office Furniture and Equipment', '108', '0'),
('1032', '', 'Accum. Amort. - Furn. and Equip.', '108', '0'),
('1033', '', 'Vehicle', '108', '0'),
('1034', '', 'Accum. Amort. - Vehicle', '108', '0'),
('1041', '', 'advance to Imran Shah', '104', '0'),
('1042', '', 'Advance to Minhaj', '104', '0'),
('1081', '', 'Market deep freezers KPK', '108', '0'),
('1082', '', 'Market deep freezers Islamabad ', '108', '0'),
('1083', '', 'Market Deep Freezers Lahore', '108', '0'),
('1084', '', 'Market Deep Freezers Karachi', '108', '0'),
('2011', '', 'Accounts Payable', '201', '0'),
('2012', '', 'Witholding Tax', '201', '0'),
('2013', '', 'GST Input', '201', '0'),
('2014', '', 'GST Output', '201', '0'),
('2021', '', 'Bank Loans', '202', '0'),
('2022', '', 'Loans from Shareholders', '202', '0'),
('2023', '', 'Meezan DM account', '202', '0'),
('2024', '', 'Meezan Deep Freezers Ijarah', '202', '0'),
('2025', '', 'Meezan Isuzu Ijarah', '202', '0'),
('2026', '', 'Meezan Toyota Corola Ijarah', '202', '0'),
('2027', '', 'Albarak Ijarah for Honda Civic', '202', '0'),
('3011', '', 'Common Shares', '301', '0'),
('3012', '', 'Opening Balance Equity', '301', '0'),
('3021', '', 'Reserves and Surplus', '302', '0'),
('4011', '', 'Sales Revenue', '403', '0'),
('4021', '', 'Shipping and Handling', '402', '0'),
('4022', '', 'Interest', '402', '0'),
('4023', '', 'Foreign Exchange Gain', '402', '0'),
('4024', '', 'Incentives', '101', '0'),
('4025', '', 'Discounts Given', '402', '0'),
('4031', '', 'Sales of Classic beef items', '403', '0'),
('4032', '', 'Sales Of beef Item HMR', '403', '0'),
('4041', '', 'Sales of Classic Chicken items', '404', '0'),
('4042', '', 'Sale of HMR Chicken Items', '404', '0'),
('5011', '', 'Cost of Goods Sold - Retail', '501', '0'),
('5012', '', 'Material Usage Variance', '501', '0'),
('5013', '', 'Consumable Materials', '501', '0'),
('5014', '', 'Purchase Price Variance', '501', '0'),
('5015', '', 'Purchases of Materials', '501', '0'),
('5016', '', 'Discounts Received', '501', '0'),
('5017', '', 'Freight', '501', '0'),
('5018', '', 'Cost of Goods Sold - Beef Items', '501', '0'),
('5019', '', 'Cost of Goods Sold - Chicken Items', '501', '0'),
('5020', '', 'Electricity Bills', '501', '0'),
('5021', '', 'SUI gas Bills', '501', '0'),
('5022', '', 'Labour salaries , overtime and bonus', '501', '0'),
('5023', '', 'Generator Diesel', '501', '0'),
('5024', '', 'Imported spices consumption', '501', '0'),
('5025', '', 'Local spices and local purchase consumption', '501', '0'),
('5026', '', 'Chicken skin Consumption', '501', '0'),
('5027', '', 'Beef fat Consumption', '501', '0'),
('5028', '', 'Carton conusmed', '501', '0'),
('5029', '', 'EOBI and ESSI', '501', '0'),
('5030', '', 'Profit and Loss', '503', '0'),
('50301', '', 'Packing Material Boxes', '501', '0'),
('50302', '', 'Local purchase ', '501', '0'),
('5031', '', 'Accounting and Legal', '503', '0'),
('5033', '', 'Bad Debts', '503', '0'),
('5034', '', 'Amortization Expense', '503', '0'),
('5035', '', 'Insurance', '503', '0'),
('5036', '', 'Interest and Bank Charges', '503', '0'),
('5037', '', 'Office Supplies', '503', '0'),
('5038', '', 'Rent', '503', '0'),
('5039', '', 'Repair and Maintenance', '503', '0'),
('5040', '', 'Telephone', '503', '0'),
('5041', '', 'Travel and Entertainment', '503', '0'),
('5042', '', 'Utilities', '503', '0'),
('5043', '', 'Registrations', '503', '0'),
('5044', '', 'Licenses', '503', '0'),
('5045', '', 'Foreign Exchange Loss', '503', '0'),
('5046', '', 'Management  Salary', '503', '0'),
('5047', '', 'Vehicle Maintenence', '503', '0'),
('5048', '', 'Directors Home and fuel bills', '503', '0'),
('5049', '', 'Charity and Donations', '503', '0'),
('5050', '', 'Misc Expenses', '503', '0'),
('50511', '', 'Ejaz Selling Expenses', '5051', '0'),
('50512', '', 'O2 Irfan Selling Expenses', '5051', '0'),
('50513', '', 'Selling and Distribution expenses Horica Islamabad', '5051', '0'),
('50514', '', 'Selling and Distribution Islamabad Retail', '5051', '0'),
('50515', '', 'Freight Charges Islamabad', '5051', '0'),
('50521', '', 'Zahir Bacha Selling Exp', '5052', '0'),
('50522', '', 'KPK Marketing expesnes', '5052', '0'),
('50523', '', 'KPK P1 expenses', '5052', '0'),
('50524', '', 'KPK P 2 expesnes', '5052', '0'),
('50525', '', 'KPK O 1 expenses', '5052', '0'),
('50526', '', 'KPK O 2 ', '5052', '0'),
('50527', '', 'KPK O 3 expenses', '5052', '0'),
('5053', '', 'selling and distribution expenses lahore', '505', '0'),
('5054', '', 'selling and distribution expenses karachi', '505', '0'),
('5061', '', 'Mark Up meezan Bank DM Musharika', '506', '0'),
('5062', '', 'Mark up Ijarah Toyota Corolla', '506', '0'),
('5063', '', 'Mark up isuze truck', '506', '0'),
('5064', '', 'Mark up Deep freezer account', '506', '0'),
('5065', '', 'Bank charges ', '506', '0'),
('5066', '', 'Mark up Bank Albaraka', '506', '0'),
('5081', '', 'Spoilage KPK', '508', '0'),
('5082', '', 'Spoilage Islamabad', '508', '0'),
('5083', '', 'spoilage Lahore', '508', '0'),
('5084', '', 'Spoilage Karachi', '508', '0');

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
('104', 'Advance to staff', '10', '', '0'),
('105', 'Advance deposit and securaties', '10', '', '0'),
('106', 'Advance deposit for vehicle leasing ', '10', '', '0'),
('107', 'Advance Wapda, sui gas and mobilink etc', '10', '', '0'),
('108', 'Market assets Deep Freezers', '10', '', '0'),
('201', 'Current Liabilities', '20', '', '0'),
('202', 'Long Term Liabilities', '20', '', '0'),
('301', 'Share Capital', '30', '', '0'),
('302', 'Retained Earnings', '30', '', '0'),
('402', 'Other Revenue', '40', '', '0'),
('403', 'Sales Revenue Beef  Items', '40', '', '0'),
('404', 'Sale of Chicken Items', '40', '', '0'),
('501', 'Cost of Goods Sold', '50', '', '0'),
('502', 'Payroll Expenses', '50', '', '0'),
('503', 'General &amp; Administrative Expenses', '50', '', '0'),
('504', 'Financial Expenses', '50', '', '0'),
('505', 'Selling and Distribution expenses', '50', '', '0'),
('5051', 'Selling and Distribution Expense - ISB', '50', '505', '0'),
('5052', 'Selling and Distribution Expense - PSH', '50', '505', '0'),
('506', 'Bank and Financial expenses', '50', '', '0'),
('508', 'Spoliage and stock return', '50', '', '0');

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


### Structure of table `0_combo_item_1` ###

DROP TABLE IF EXISTS `0_combo_item_1`;

CREATE TABLE `0_combo_item_1` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_item_1` ###

INSERT INTO `0_combo_item_1` VALUES
('1', 'item combo 1', '0');

### Structure of table `0_combo_item_2` ###

DROP TABLE IF EXISTS `0_combo_item_2`;

CREATE TABLE `0_combo_item_2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_item_2` ###

INSERT INTO `0_combo_item_2` VALUES
('1', 'item combo 2', '0');

### Structure of table `0_combo_item_3` ###

DROP TABLE IF EXISTS `0_combo_item_3`;

CREATE TABLE `0_combo_item_3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_item_3` ###

INSERT INTO `0_combo_item_3` VALUES
('1', 'item combo 1', '0');

### Structure of table `0_combo_so_1` ###

DROP TABLE IF EXISTS `0_combo_so_1`;

CREATE TABLE `0_combo_so_1` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_1` ###


### Structure of table `0_combo_so_2` ###

DROP TABLE IF EXISTS `0_combo_so_2`;

CREATE TABLE `0_combo_so_2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_2` ###


### Structure of table `0_combo_so_3` ###

DROP TABLE IF EXISTS `0_combo_so_3`;

CREATE TABLE `0_combo_so_3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_3` ###


### Structure of table `0_combo_so_4` ###

DROP TABLE IF EXISTS `0_combo_so_4`;

CREATE TABLE `0_combo_so_4` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_4` ###


### Structure of table `0_combo_so_5` ###

DROP TABLE IF EXISTS `0_combo_so_5`;

CREATE TABLE `0_combo_so_5` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_5` ###


### Structure of table `0_combo_so_6` ###

DROP TABLE IF EXISTS `0_combo_so_6`;

CREATE TABLE `0_combo_so_6` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_6` ###


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
('12', '1', '2017-06-30', 'Cash invoice 15'),
('12', '2', '2017-06-30', 'Cash invoice 16'),
('0', '1', '2017-10-03', 'Adjusment of Opening balance '),
('12', '3', '2017-10-02', 'Cash invoice 19'),
('12', '4', '2017-10-02', 'Cash invoice 20'),
('12', '5', '2017-10-02', 'Cash invoice 21');

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
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('3', '2', 'cust_branch', 'general', '2'),
('4', '2', 'customer', 'general', '2'),
('5', '3', 'supplier', 'general', '1'),
('7', '4', 'customer', 'general', '3'),
('8', '5', 'cust_branch', 'general', '4'),
('9', '5', 'customer', 'general', '4'),
('11', '6', 'customer', 'general', '5'),
('12', '7', 'cust_branch', 'general', '6'),
('13', '7', 'customer', 'general', '6'),
('14', '8', 'supplier', 'general', '2'),
('18', '10', 'customer', 'general', '8'),
('19', '11', 'cust_branch', 'general', '9'),
('24', '13', 'cust_branch', 'general', '11'),
('25', '13', 'customer', 'general', '11'),
('26', '14', 'cust_branch', 'general', '12'),
('27', '14', 'customer', 'general', '12'),
('28', '15', 'cust_branch', 'general', '13'),
('29', '15', 'customer', 'general', '13'),
('30', '16', 'cust_branch', 'general', '14'),
('31', '16', 'customer', 'general', '14'),
('32', '17', 'cust_branch', 'general', '15'),
('33', '17', 'customer', 'general', '15'),
('35', '18', 'customer', 'general', '16'),
('36', '19', 'cust_branch', 'general', '17'),
('37', '19', 'customer', 'general', '17'),
('38', '20', 'cust_branch', 'general', '18'),
('39', '20', 'customer', 'general', '18'),
('40', '21', 'cust_branch', 'general', '19'),
('41', '21', 'customer', 'general', '19'),
('42', '22', 'cust_branch', 'general', '20'),
('43', '22', 'customer', 'general', '20'),
('44', '23', 'cust_branch', 'general', '21'),
('45', '23', 'customer', 'general', '21'),
('46', '24', 'cust_branch', 'general', '22'),
('47', '24', 'customer', 'general', '22'),
('48', '25', 'cust_branch', 'general', '23'),
('49', '25', 'customer', 'general', '23'),
('50', '26', 'cust_branch', 'general', '24'),
('51', '26', 'customer', 'general', '24'),
('52', '27', 'cust_branch', 'general', '25'),
('53', '27', 'customer', 'general', '25'),
('54', '28', 'cust_branch', 'general', '26'),
('55', '28', 'customer', 'general', '26'),
('56', '29', 'cust_branch', 'general', '27'),
('57', '29', 'customer', 'general', '27'),
('58', '30', 'cust_branch', 'general', '28'),
('59', '30', 'customer', 'general', '28'),
('60', '31', 'cust_branch', 'general', '29'),
('61', '31', 'customer', 'general', '29'),
('62', '32', 'cust_branch', 'general', '30'),
('63', '32', 'customer', 'general', '30'),
('64', '33', 'cust_branch', 'general', '31'),
('65', '33', 'customer', 'general', '31'),
('66', '34', 'cust_branch', 'general', '32'),
('67', '34', 'customer', 'general', '32'),
('68', '35', 'cust_branch', 'general', '33'),
('69', '35', 'customer', 'general', '33'),
('70', '36', 'cust_branch', 'general', '34'),
('71', '36', 'customer', 'general', '34'),
('72', '18', 'cust_branch', 'general', '16'),
('73', '37', 'cust_branch', 'general', '35'),
('74', '37', 'customer', 'general', '35'),
('75', '38', 'cust_branch', 'general', '36'),
('76', '38', 'customer', 'general', '36'),
('77', '39', 'cust_branch', 'general', '37'),
('78', '39', 'customer', 'general', '37'),
('79', '40', 'cust_branch', 'general', '38'),
('80', '40', 'customer', 'general', '38'),
('81', '41', 'cust_branch', 'general', '39'),
('82', '41', 'customer', 'general', '39'),
('83', '42', 'cust_branch', 'general', '40'),
('84', '42', 'customer', 'general', '40'),
('85', '43', 'supplier', 'general', '3'),
('86', '44', 'supplier', 'general', '4'),
('87', '45', 'supplier', 'general', '5'),
('88', '46', 'supplier', 'general', '6'),
('89', '47', 'cust_branch', 'general', '41'),
('90', '47', 'customer', 'general', '41'),
('91', '48', 'cust_branch', 'general', '42'),
('92', '48', 'customer', 'general', '42'),
('93', '49', 'cust_branch', 'general', '43'),
('94', '49', 'customer', 'general', '43'),
('95', '50', 'cust_branch', 'general', '44'),
('96', '50', 'customer', 'general', '44'),
('97', '51', 'cust_branch', 'general', '45'),
('98', '51', 'customer', 'general', '45'),
('99', '52', 'cust_branch', 'general', '46'),
('100', '52', 'customer', 'general', '46'),
('101', '53', 'cust_branch', 'general', '47'),
('102', '53', 'customer', 'general', '47'),
('103', '54', 'cust_branch', 'general', '48'),
('104', '54', 'customer', 'general', '48'),
('105', '55', 'cust_branch', 'general', '49'),
('106', '55', 'customer', 'general', '49'),
('107', '56', 'cust_branch', 'general', '50'),
('108', '56', 'customer', 'general', '50'),
('109', '57', 'cust_branch', 'general', '51'),
('110', '57', 'customer', 'general', '51'),
('111', '58', 'cust_branch', 'general', '52'),
('112', '58', 'customer', 'general', '52'),
('113', '59', 'cust_branch', 'general', '53'),
('114', '59', 'customer', 'general', '53'),
('115', '60', 'cust_branch', 'general', '54'),
('116', '60', 'customer', 'general', '54'),
('117', '61', 'cust_branch', 'general', '55'),
('118', '61', 'customer', 'general', '55'),
('119', '62', 'cust_branch', 'general', '56'),
('120', '62', 'customer', 'general', '56'),
('121', '63', 'cust_branch', 'general', '57'),
('122', '63', 'customer', 'general', '57'),
('123', '64', 'cust_branch', 'general', '58'),
('124', '64', 'customer', 'general', '58'),
('125', '65', 'cust_branch', 'general', '59'),
('126', '65', 'customer', 'general', '59'),
('127', '66', 'cust_branch', 'general', '60'),
('128', '66', 'customer', 'general', '60'),
('129', '67', 'cust_branch', 'general', '61'),
('130', '67', 'customer', 'general', '61'),
('131', '68', 'cust_branch', 'general', '62'),
('132', '68', 'customer', 'general', '62'),
('133', '69', 'cust_branch', 'general', '63'),
('134', '69', 'customer', 'general', '63'),
('135', '70', 'supplier', 'general', '7'),
('136', '71', 'supplier', 'general', '8'),
('137', '72', 'supplier', 'general', '9'),
('138', '73', 'cust_branch', 'general', '64'),
('139', '73', 'customer', 'general', '64'),
('140', '74', 'cust_branch', 'general', '65'),
('141', '74', 'customer', 'general', '65'),
('142', '75', 'cust_branch', 'general', '66'),
('143', '75', 'customer', 'general', '66'),
('144', '76', 'cust_branch', 'general', '67'),
('145', '76', 'customer', 'general', '67'),
('146', '77', 'cust_branch', 'general', '68'),
('147', '77', 'customer', 'general', '68'),
('148', '78', 'supplier', 'general', '10'),
('149', '79', 'cust_branch', 'general', '69'),
('150', '79', 'customer', 'general', '69'),
('151', '80', 'supplier', 'general', '11'),
('152', '81', 'supplier', 'general', '12'),
('153', '82', 'cust_branch', 'general', '70'),
('154', '82', 'customer', 'general', '70'),
('155', '83', 'supplier', 'general', '13'),
('156', '84', 'supplier', 'general', '14'),
('157', '85', 'supplier', 'general', '15'),
('158', '86', 'supplier', 'general', '16'),
('159', '87', 'supplier', 'general', '17'),
('160', '88', 'supplier', 'general', '18'),
('161', '89', 'cust_branch', 'general', '71'),
('162', '89', 'customer', 'general', '71'),
('163', '90', 'supplier', 'general', '19'),
('164', '91', 'supplier', 'general', '20'),
('165', '92', 'supplier', 'general', '21'),
('166', '93', 'supplier', 'general', '22'),
('167', '94', 'supplier', 'general', '23'),
('168', '95', 'supplier', 'general', '24'),
('169', '96', 'supplier', 'general', '25'),
('170', '97', 'supplier', 'general', '26'),
('171', '98', 'supplier', 'general', '27'),
('172', '99', 'supplier', 'general', '28'),
('173', '100', 'supplier', 'general', '29'),
('174', '101', 'supplier', 'general', '30'),
('175', '102', 'supplier', 'general', '31'),
('176', '103', 'supplier', 'general', '32'),
('177', '104', 'supplier', 'general', '33'),
('178', '105', 'supplier', 'general', '34'),
('179', '106', 'supplier', 'general', '35'),
('180', '107', 'supplier', 'general', '36'),
('181', '108', 'supplier', 'general', '37'),
('182', '109', 'supplier', 'general', '38'),
('183', '110', 'supplier', 'general', '39'),
('184', '111', 'supplier', 'general', '40'),
('185', '112', 'supplier', 'general', '41'),
('186', '113', 'supplier', 'general', '42'),
('187', '114', 'supplier', 'general', '43'),
('188', '115', 'supplier', 'general', '44'),
('189', '116', 'supplier', 'general', '45'),
('190', '117', 'cust_branch', 'general', '72'),
('191', '117', 'customer', 'general', '72'),
('192', '118', 'cust_branch', 'general', '73'),
('193', '118', 'customer', 'general', '73'),
('194', '119', 'cust_branch', 'general', '74'),
('195', '119', 'customer', 'general', '74'),
('196', '120', 'cust_branch', 'general', '75'),
('197', '120', 'customer', 'general', '75'),
('198', '121', 'cust_branch', 'general', '76'),
('199', '121', 'customer', 'general', '76'),
('200', '122', 'cust_branch', 'general', '77'),
('201', '122', 'customer', 'general', '77'),
('202', '123', 'cust_branch', 'general', '78'),
('203', '123', 'customer', 'general', '78'),
('204', '124', 'cust_branch', 'general', '79'),
('205', '124', 'customer', 'general', '79'),
('206', '125', 'cust_branch', 'general', '80'),
('207', '125', 'customer', 'general', '80'),
('208', '126', 'cust_branch', 'general', '81'),
('209', '126', 'customer', 'general', '81'),
('210', '127', 'cust_branch', 'general', '82'),
('211', '127', 'customer', 'general', '82'),
('212', '128', 'cust_branch', 'general', '83'),
('213', '128', 'customer', 'general', '83'),
('214', '129', 'cust_branch', 'general', '84'),
('215', '129', 'customer', 'general', '84'),
('216', '130', 'cust_branch', 'general', '85'),
('217', '130', 'customer', 'general', '85'),
('218', '131', 'cust_branch', 'general', '86'),
('219', '131', 'customer', 'general', '86'),
('220', '132', 'cust_branch', 'general', '87'),
('221', '132', 'customer', 'general', '87'),
('222', '133', 'cust_branch', 'general', '88'),
('223', '133', 'customer', 'general', '88'),
('224', '134', 'cust_branch', 'general', '89'),
('225', '134', 'customer', 'general', '89'),
('226', '135', 'cust_branch', 'general', '90'),
('227', '135', 'customer', 'general', '90'),
('228', '136', 'cust_branch', 'general', '91'),
('229', '136', 'customer', 'general', '91'),
('230', '137', 'cust_branch', 'general', '92'),
('231', '137', 'customer', 'general', '92'),
('232', '138', 'cust_branch', 'general', '93'),
('233', '138', 'customer', 'general', '93'),
('234', '139', 'cust_branch', 'general', '94'),
('235', '139', 'customer', 'general', '94'),
('236', '140', 'cust_branch', 'general', '95'),
('237', '140', 'customer', 'general', '95'),
('238', '141', 'cust_branch', 'general', '96'),
('239', '141', 'customer', 'general', '96'),
('240', '142', 'cust_branch', 'general', '97'),
('241', '142', 'customer', 'general', '97'),
('242', '143', 'cust_branch', 'general', '98'),
('243', '143', 'customer', 'general', '98'),
('244', '144', 'cust_branch', 'general', '99'),
('245', '144', 'customer', 'general', '99'),
('246', '145', 'cust_branch', 'general', '100'),
('247', '145', 'customer', 'general', '100'),
('248', '146', 'cust_branch', 'general', '101'),
('249', '146', 'customer', 'general', '101'),
('250', '147', 'cust_branch', 'general', '102'),
('251', '147', 'customer', 'general', '102'),
('252', '148', 'cust_branch', 'general', '103'),
('253', '148', 'customer', 'general', '103'),
('254', '149', 'cust_branch', 'general', '104'),
('255', '149', 'customer', 'general', '104'),
('256', '150', 'cust_branch', 'general', '105'),
('257', '150', 'customer', 'general', '105'),
('258', '151', 'cust_branch', 'general', '106'),
('259', '151', 'customer', 'general', '106'),
('260', '152', 'cust_branch', 'general', '107'),
('261', '152', 'customer', 'general', '107'),
('262', '153', 'cust_branch', 'general', '108'),
('263', '153', 'customer', 'general', '108'),
('264', '154', 'cust_branch', 'general', '109'),
('265', '154', 'customer', 'general', '109'),
('266', '155', 'cust_branch', 'general', '110'),
('267', '155', 'customer', 'general', '110'),
('268', '156', 'cust_branch', 'general', '111'),
('269', '156', 'customer', 'general', '111'),
('270', '157', 'cust_branch', 'general', '112'),
('271', '157', 'customer', 'general', '112'),
('272', '158', 'cust_branch', 'general', '113'),
('273', '158', 'customer', 'general', '113'),
('274', '159', 'cust_branch', 'general', '114'),
('275', '159', 'customer', 'general', '114'),
('276', '160', 'cust_branch', 'general', '115'),
('277', '160', 'customer', 'general', '115'),
('278', '161', 'cust_branch', 'general', '116'),
('279', '161', 'customer', 'general', '116'),
('280', '162', 'cust_branch', 'general', '117'),
('281', '162', 'customer', 'general', '117'),
('282', '163', 'cust_branch', 'general', '118'),
('283', '163', 'customer', 'general', '118'),
('284', '164', 'cust_branch', 'general', '119'),
('285', '164', 'customer', 'general', '120'),
('286', '165', 'cust_branch', 'general', '120'),
('287', '165', 'customer', 'general', '121'),
('288', '166', 'cust_branch', 'general', '121'),
('289', '166', 'customer', 'general', '122'),
('290', '167', 'cust_branch', 'general', '122'),
('291', '167', 'customer', 'general', '123'),
('292', '168', 'cust_branch', 'general', '123'),
('293', '168', 'customer', 'general', '124'),
('294', '169', 'cust_branch', 'general', '124'),
('295', '169', 'customer', 'general', '125'),
('296', '170', 'cust_branch', 'general', '125'),
('297', '170', 'customer', 'general', '126'),
('298', '171', 'cust_branch', 'general', '126'),
('299', '171', 'customer', 'general', '128'),
('300', '172', 'cust_branch', 'general', '127'),
('301', '172', 'customer', 'general', '129'),
('302', '173', 'cust_branch', 'general', '128'),
('303', '173', 'customer', 'general', '131'),
('304', '174', 'cust_branch', 'general', '129'),
('305', '174', 'customer', 'general', '132'),
('306', '175', 'cust_branch', 'general', '130'),
('307', '175', 'customer', 'general', '133'),
('308', '176', 'cust_branch', 'general', '131'),
('309', '176', 'customer', 'general', '134'),
('310', '177', 'cust_branch', 'general', '132'),
('311', '177', 'customer', 'general', '135'),
('312', '178', 'cust_branch', 'general', '133'),
('313', '178', 'customer', 'general', '136'),
('314', '179', 'cust_branch', 'general', '134'),
('315', '179', 'customer', 'general', '137'),
('316', '180', 'cust_branch', 'general', '135'),
('317', '180', 'customer', 'general', '138'),
('318', '181', 'cust_branch', 'general', '136'),
('319', '181', 'customer', 'general', '139'),
('320', '182', 'cust_branch', 'general', '137'),
('321', '182', 'customer', 'general', '140'),
('322', '183', 'cust_branch', 'general', '138'),
('323', '183', 'customer', 'general', '141'),
('324', '184', 'cust_branch', 'general', '139'),
('325', '184', 'customer', 'general', '142'),
('326', '185', 'cust_branch', 'general', '140'),
('327', '185', 'customer', 'general', '144'),
('328', '186', 'cust_branch', 'general', '141'),
('329', '186', 'customer', 'general', '145'),
('330', '187', 'cust_branch', 'general', '142'),
('331', '187', 'customer', 'general', '146'),
('332', '188', 'cust_branch', 'general', '143'),
('333', '188', 'customer', 'general', '147'),
('334', '189', 'cust_branch', 'general', '144'),
('335', '189', 'customer', 'general', '148'),
('336', '190', 'cust_branch', 'general', '145'),
('337', '190', 'customer', 'general', '150'),
('338', '191', 'cust_branch', 'general', '146'),
('339', '191', 'customer', 'general', '152'),
('340', '192', 'cust_branch', 'general', '147'),
('341', '192', 'customer', 'general', '153'),
('342', '193', 'cust_branch', 'general', '148'),
('343', '193', 'customer', 'general', '154'),
('344', '194', 'cust_branch', 'general', '149'),
('345', '194', 'customer', 'general', '155'),
('346', '195', 'cust_branch', 'general', '150'),
('347', '195', 'customer', 'general', '157'),
('348', '196', 'cust_branch', 'general', '151'),
('349', '196', 'customer', 'general', '159'),
('350', '197', 'cust_branch', 'general', '152'),
('351', '197', 'customer', 'general', '161'),
('352', '198', 'cust_branch', 'general', '153'),
('353', '198', 'customer', 'general', '162'),
('354', '199', 'cust_branch', 'general', '154'),
('355', '199', 'customer', 'general', '163'),
('356', '200', 'cust_branch', 'general', '155'),
('357', '200', 'customer', 'general', '164'),
('358', '201', 'cust_branch', 'general', '156'),
('359', '201', 'customer', 'general', '165'),
('360', '202', 'cust_branch', 'general', '157'),
('361', '202', 'customer', 'general', '166'),
('362', '203', 'cust_branch', 'general', '158'),
('363', '203', 'customer', 'general', '167'),
('364', '204', 'cust_branch', 'general', '159'),
('365', '204', 'customer', 'general', '168'),
('366', '205', 'cust_branch', 'general', '160'),
('367', '205', 'customer', 'general', '169'),
('368', '206', 'cust_branch', 'general', '161'),
('369', '206', 'customer', 'general', '170'),
('370', '207', 'cust_branch', 'general', '162'),
('371', '207', 'customer', 'general', '171'),
('372', '208', 'cust_branch', 'general', '163'),
('373', '208', 'customer', 'general', '172'),
('374', '209', 'cust_branch', 'general', '164'),
('375', '209', 'customer', 'general', '173'),
('376', '210', 'cust_branch', 'general', '165'),
('377', '210', 'customer', 'general', '174'),
('378', '211', 'cust_branch', 'general', '166'),
('379', '211', 'customer', 'general', '175'),
('380', '212', 'cust_branch', 'general', '167'),
('381', '212', 'customer', 'general', '176'),
('382', '213', 'cust_branch', 'general', '168'),
('383', '213', 'customer', 'general', '177'),
('384', '214', 'cust_branch', 'general', '169'),
('385', '214', 'customer', 'general', '178'),
('386', '215', 'cust_branch', 'general', '170'),
('387', '215', 'customer', 'general', '179'),
('388', '216', 'cust_branch', 'general', '171'),
('389', '216', 'customer', 'general', '180'),
('390', '217', 'cust_branch', 'general', '172'),
('391', '217', 'customer', 'general', '181'),
('392', '218', 'cust_branch', 'general', '173'),
('393', '218', 'customer', 'general', '182'),
('394', '219', 'cust_branch', 'general', '174'),
('395', '219', 'customer', 'general', '183'),
('396', '220', 'cust_branch', 'general', '175'),
('397', '220', 'customer', 'general', '184'),
('398', '221', 'cust_branch', 'general', '176'),
('399', '221', 'customer', 'general', '185'),
('400', '222', 'cust_branch', 'general', '177'),
('401', '222', 'customer', 'general', '186'),
('402', '223', 'cust_branch', 'general', '178'),
('403', '223', 'customer', 'general', '188'),
('404', '224', 'cust_branch', 'general', '179'),
('405', '224', 'customer', 'general', '189'),
('406', '225', 'cust_branch', 'general', '180'),
('407', '225', 'customer', 'general', '190'),
('408', '226', 'cust_branch', 'general', '181'),
('409', '226', 'customer', 'general', '191'),
('410', '227', 'cust_branch', 'general', '182'),
('411', '227', 'customer', 'general', '192'),
('412', '228', 'cust_branch', 'general', '183'),
('413', '228', 'customer', 'general', '193'),
('414', '229', 'cust_branch', 'general', '184'),
('415', '229', 'customer', 'general', '194'),
('416', '230', 'cust_branch', 'general', '185'),
('417', '230', 'customer', 'general', '195'),
('418', '231', 'cust_branch', 'general', '186'),
('419', '231', 'customer', 'general', '196'),
('420', '232', 'cust_branch', 'general', '187'),
('421', '232', 'customer', 'general', '197'),
('422', '233', 'cust_branch', 'general', '188'),
('423', '233', 'customer', 'general', '198'),
('424', '234', 'cust_branch', 'general', '189'),
('425', '234', 'customer', 'general', '199'),
('426', '235', 'cust_branch', 'general', '190'),
('427', '235', 'customer', 'general', '200'),
('428', '236', 'cust_branch', 'general', '191'),
('429', '236', 'customer', 'general', '201'),
('430', '237', 'cust_branch', 'general', '192'),
('431', '237', 'customer', 'general', '202'),
('432', '238', 'cust_branch', 'general', '193'),
('433', '238', 'customer', 'general', '203'),
('434', '239', 'cust_branch', 'general', '194'),
('435', '239', 'customer', 'general', '204'),
('436', '240', 'cust_branch', 'general', '195'),
('437', '240', 'customer', 'general', '205'),
('438', '241', 'cust_branch', 'general', '196'),
('439', '241', 'customer', 'general', '206'),
('440', '242', 'cust_branch', 'general', '197'),
('441', '242', 'customer', 'general', '208'),
('442', '243', 'cust_branch', 'general', '198'),
('443', '243', 'customer', 'general', '209'),
('444', '244', 'cust_branch', 'general', '199'),
('445', '244', 'customer', 'general', '210'),
('446', '245', 'cust_branch', 'general', '200'),
('447', '245', 'customer', 'general', '211'),
('448', '246', 'cust_branch', 'general', '201'),
('449', '246', 'customer', 'general', '212'),
('450', '247', 'cust_branch', 'general', '202'),
('451', '247', 'customer', 'general', '213'),
('452', '248', 'cust_branch', 'general', '203'),
('453', '248', 'customer', 'general', '214'),
('454', '249', 'cust_branch', 'general', '204'),
('455', '249', 'customer', 'general', '215'),
('456', '250', 'cust_branch', 'general', '205'),
('457', '250', 'customer', 'general', '216'),
('458', '251', 'cust_branch', 'general', '206'),
('459', '251', 'customer', 'general', '217'),
('460', '252', 'cust_branch', 'general', '207'),
('461', '252', 'customer', 'general', '218'),
('462', '253', 'cust_branch', 'general', '208'),
('463', '253', 'customer', 'general', '219'),
('464', '254', 'cust_branch', 'general', '209'),
('465', '254', 'customer', 'general', '220'),
('466', '255', 'cust_branch', 'general', '210'),
('467', '255', 'customer', 'general', '221'),
('468', '256', 'cust_branch', 'general', '211'),
('469', '256', 'customer', 'general', '222'),
('470', '257', 'cust_branch', 'general', '212'),
('471', '257', 'customer', 'general', '223'),
('472', '258', 'cust_branch', 'general', '213'),
('473', '258', 'customer', 'general', '224'),
('474', '259', 'cust_branch', 'general', '214'),
('475', '259', 'customer', 'general', '225'),
('476', '260', 'cust_branch', 'general', '215'),
('477', '260', 'customer', 'general', '226'),
('478', '261', 'cust_branch', 'general', '216'),
('479', '261', 'customer', 'general', '227'),
('480', '262', 'cust_branch', 'general', '217'),
('481', '262', 'customer', 'general', '228'),
('482', '263', 'cust_branch', 'general', '218'),
('483', '263', 'customer', 'general', '229'),
('484', '264', 'cust_branch', 'general', '219'),
('485', '264', 'customer', 'general', '230'),
('486', '265', 'cust_branch', 'general', '220'),
('487', '265', 'customer', 'general', '231'),
('488', '266', 'cust_branch', 'general', '221'),
('489', '266', 'customer', 'general', '232'),
('490', '267', 'cust_branch', 'general', '222'),
('491', '267', 'customer', 'general', '240'),
('492', '268', 'cust_branch', 'general', '223'),
('493', '268', 'customer', 'general', '241'),
('494', '269', 'cust_branch', 'general', '224'),
('495', '269', 'customer', 'general', '242'),
('496', '270', 'cust_branch', 'general', '225'),
('497', '270', 'customer', 'general', '243'),
('498', '271', 'cust_branch', 'general', '226'),
('499', '271', 'customer', 'general', '244'),
('500', '272', 'cust_branch', 'general', '227'),
('501', '272', 'customer', 'general', '245'),
('502', '273', 'cust_branch', 'general', '228'),
('503', '273', 'customer', 'general', '246'),
('504', '274', 'cust_branch', 'general', '229'),
('505', '274', 'customer', 'general', '247');

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
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', 'Test Customer', 'Test Customer', NULL, 'Karachi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('2', 'Imtiaz Store', 'Imtiaz Store', NULL, 'Karachi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('3', 'qasab', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('4', 'jalal sons', 'jalal sons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('5', 'Avon psh', 'Avon Super Store', NULL, 'Spogmai Plaza , Jamrud Road Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('6', 'avon', 'Avon Super Store', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('7', 'Serena Islamabad', 'Serena Hotel Islamabad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('8', 'sahib', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('10', 'SHAYAN STORE ', 'SHAYAN STORE ', NULL, 'Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('11', 'Yum PIZZA ', 'Yum PIZZA ', NULL, 'Pesahwar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('12', 'Seven 11 Store ', 'P-1  Seven 11 Store ', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('13', 'P-1 9 to Eleven Store', 'P- 1 9 to Eleven Store', NULL, 'Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('14', ' P-1 AL-FATAH ', ' P-1 AL-FATAH ', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('15', 'P-1 CHIEF BURGER ', 'P-1 CHIEF BURGER ', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('16', 'P-1 CP STORE  (1 V LINE)', 'P-1 CP STORE  (1 V LINE)', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('17', ' P-1 DAY &amp; NIGHT STORE (1 ', ' P-1 DAY &amp; NIGHT STORE (1 WAVES)', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('18', 'P-1 CSD', 'P-1 CSD', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('19', 'P-1 ENTER MART ', 'P-1 ENTER MART ', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('20', 'P-1 FAMILY STORE', 'P-1 FAMILY STORE', NULL, 'KOHAT ROAD PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('21', 'P-1 GREEN MART ', 'P-1 GREEN MART ', NULL, 'SADDAR PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('22', ' P-1 GUL COOL SPOT (1STAND FRE', ' P-1 GUL COOL SPOT (1STAND FREEZER)', NULL, 'UNIVERSITY ROAD PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('23', 'P-1 ITALIAN PIZZA', 'P-1 ITALIAN PIZZA', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('24', 'P-1 JAN SHOPING GULBAHAR', 'P-1 JAN SHOPING GULBAHAR', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('25', 'P-1 KING &amp; QUEEN PIZZA', 'P-1 KING &amp; QUEEN PIZZA', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('26', 'P-1 M MART (I WAVES)', 'P-1 M MART (I WAVES)', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('27', 'P-1 MEAT SHOP SHAHEEN', 'P-1 MEAT SHOP SHAHEEN', NULL, 'UNIVERSITY TOWN PEHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('28', 'P-1 NAN SENS CAFFE', 'P-1 NAN SENS CAFFE', NULL, 'PESHAWAR ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('29', 'P-1 NIAZ SB', 'P-1 NIAZ SB', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('30', 'P-1 POTATO PLUS (P1P2) I HOT T', 'P-1 POTATO PLUS (P1P2) I HOT TOP', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('31', 'P-1 RAHAT BAKERY', 'P-1 RAHAT BAKERY', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('32', 'P-1 S MART STORE (1 FREEZER SM', 'P-1 S MART STORE (1 FREEZER SMALL)', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('33', 'P-1 SHAHEEN AIRLINE ', 'P-1 SHAHEEN AIRLINE ', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('34', 'P-1 SHAHEEN SUPER STORE(1 WAVE', 'P-1 SHAHEEN SUPER STORE(1 WAVES)', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('35', 'P-1 TIME PHARMACY (1 CANDY)', 'P-1 TIME PHARMACY (1 CANDY)', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('36', 'P-1 YUMMS PIZZA ', 'P-1 YUMMS PIZZA ', NULL, 'PESHAWAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('37', 'ISD- H AFGHAN BURGER ', 'ISD- H AFGHAN BURGER ', NULL, 'ISLAMABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('38', 'ISD- H AFGHAN BURGER F10', 'ISD- H AFGHAN BURGER F10', NULL, 'ISLAMABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('39', ' ISD-H ARIF TRADER', ' ISD-H ARIF TRADER', NULL, 'ISLAMABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('40', 'ISD H- AL-HILAL STORE', 'ISD H- AL-HILAL STORE', NULL, 'ISLAMABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('41', 'ISD-H  BAIYA PIZZA', 'ISD-H  BAIYA PIZZA', NULL, 'GUJRAT', NULL, NULL, NULL, NULL, NULL, '', '0'),
('42', 'ISD-H BASHIR GILGAT', 'ISD-H BASHIR GILGAT', NULL, 'ISLAMABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('43', 'Af', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('44', 'agro Tech ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('45', 'Al habib Plastic ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('46', 'Al Halal chicken ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('47', 'Head Office', 'Euro Shop HO', NULL, 'Plot 111 Hayatabad Peshawar', '091-5891234', NULL, NULL, NULL, NULL, '', '0'),
('48', 'Gates Sales', 'Gate Sales ', NULL, 'Plot 111 Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('49', 'Afghani Burger', 'ISD-H Afghani Burger Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('50', 'Burger Party Islamabad', 'ISD-H Burger Party Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('51', 'Crown Plaza Islamabad', 'ISD-H Crown Plaza Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('52', 'Margala hotel Islamabad', 'ISD-H Margala hotel Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('53', 'Papa Saleh Islamabad', 'ISD-H Papa Saleh Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('54', 'Papa Saleh Rawalpindi', 'ISD-H Papa Saleh Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('55', 'Pia Cattring Islamabad', 'ISD-H Pia Cattring Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('56', 'Pizza Fort Islamabad', 'ISD-H Pizza Fort Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('57', 'QFF Islamabad', 'ISD-H QFF Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('58', 'Rahat Bakers Adyala Rawalpindi', 'ISD-H Rahat Bakers Adyala Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('59', 'Rahat bakers barakoh Islamabad', 'ISD-H Rahat Bakers Barakoh Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('60', 'Rahat Bakers F 11 Islamabad', 'ISD-H Rahat Bakers F 11 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('61', 'Rahat Bakers PAF Islamabad', 'ISD-H Rahat Bakers PAF Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('62', 'Rahat Bakers F10 Islamabad', 'ISD-H Rahat Bakers F10 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('63', 'Rahat Bakers  G 11 Islamabad', 'ISD-H Rahat Bakers G 11 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('64', 'Rahat Bakers Godra Rawalpindi', 'ISD-H Rahat Bakers Godra Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('65', 'Rahat Bakers I8 Islamabad', 'ISD-H Rahat Bakers I 8 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('66', 'Serina Hotel Islamabad', 'ISD-H Serina Hotel Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('67', 'Tehzeeb Bakery Islamabad', 'ISD-H Tehzeeb Bakery Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('68', 'Unique Foods Islamabad', 'ISD-H Unique Foods Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('69', 'Western Global Services Isb', 'ISD-H Western Global Services Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('70', 'Al khair Enterprise ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('71', 'Ameen Tech Lahore ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('72', 'Art line Peshewar ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('73', 'Zia &amp; Sons Islamabad', 'ISD-H Zia &amp; Sons Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('74', 'Alfatah Store Islamabad ( ZM )', 'ISD-R Alfatah Store Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('75', 'Bachat Mall Sector B Askari 14', 'ISD-R Bachat Mall Sector B Askari 14 RWP', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('76', 'Best Price Islamabad', 'ISD-R Best Price Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('77', 'Csd Store Rawalpindi', 'ISD-R Csd Store Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('78', 'B &amp; S Chicken ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('79', 'CSD Westirage Rawalpindi', 'ISD-R CSD Westirage Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('80', 'Big Bird pvt ltd ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('81', 'D L Leasing company Germany ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('82', 'D Wastson BK Islamabad ', 'ISD-R D Watson BK Islamabad (1Frezer)', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('83', 'East West Foofd Lahore ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('84', 'Faisal Qureshi Rawalpindi', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('85', 'Fazal Malik ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('86', 'Fazal Trading Lahore corporati', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('87', 'Haleem &amp; Saleem butecher ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('88', 'Hamid Butcher Peshawar ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('89', 'E Mart Hall View Road Islamaba', 'ISD-R E Mart Hall View  Road ( 1Freezer)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('90', 'Hareem&amp; Iman Enterprises ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('91', 'Hayatabad Packages ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('92', 'Hazrat Intestine Peshawar city', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('93', 'HI Enterprises karachi ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('94', 'Ilyas Plastic Dalazak Road Pes', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('95', 'khan Packages Peshawar ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('96', 'Kold caraft Refgiration pvt lt', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('97', 'Malik Mazhar Ali chemicals Pes', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('98', 'Maso printers Hayatabad ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('99', 'Meat Suppilesr Shahibzada Pesh', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('100', 'Naveed Vegitable Peshawar ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('101', 'Pakistan International Printer', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('102', 'Perfect foods pvt ltd lahroe ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('103', 'Poultry Plus lahroe ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('104', 'Pros Pro Accounts ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('105', 'Qadir Buksh &amp; sons (Nadeem', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('106', 'READA industries pvt ltd karac', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('107', 'Rehmat Pacakages Hayatabad ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('108', 'Royal Frozen foods', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('109', 'Salman Zaki karachi ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('110', 'Sareer Adverrtiser ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('111', 'Sayed Intertional Islambad ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('112', 'Season Foods Lahore ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('113', 'Shahzullah Printer New Account', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('114', 'Shahzullah Printer old Account', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('115', 'Tahir Packaages', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('116', 'TUV Austria ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('117', 'Empire Mart A/S Rawalpindi', 'ISD-R Empire Mart A/S Rawalpindi (1Freezer)', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('118', 'Galaini Mart Adyala Rawalpindi', 'ISD-R Galaini Mart Adyala Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('119', 'HM Store Islamabad', 'ISD-R HM Store Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('120', 'J Mart  Dha Islamabad', 'ISD-R J Mart Dha Islamabad ( 1 Freezer)', NULL, 'Islamabad ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('121', 'Khusbo Cash In Carry Islamabad', 'ISD-R Khushabo Cash In Carry Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('122', 'Leader Price Pakistan Town Isb', 'ISD-R Leader Price Pakistan Town (1 Freezer)', NULL, 'Islamabad ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('123', 'Luft Store Pwd Islamabad', 'ISD-R Luft Store Pwd Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('124', 'M Mart Islamabad', 'ISD-R M Mart Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('125', 'Maac Mart Islamabad', 'ISD-R Maac Mart Islamabad ( Freezer)', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('126', 'Maf Hyper Star Islamabad', 'ISD-R Maf Hyper Star Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('127', 'Mcc Airport Rawalindi ', 'ISD-R Mcc Airport Rawalpindi (Frezer)', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('128', 'Mcc Comerical Mkt Rawalpindi', 'ISD-R Mcc Comerical Mkt Rawalpindi ( 1 Freezer )', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('129', 'Mcc F 11 Islamabad', 'ISD-R Mcc F 11 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('130', 'Mcc Gujar Khan Rawalpindi', 'ISD-R Mcc Gujar Khan Rwp ( Freezer )', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('131', 'Mcc I 8 Islamabad ', 'ISD-R Mcc I 8 Islamabad ( 1Freezer )', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('132', 'Mcc Khana Pul Rawalindi ', 'ISD-R Mcc Khana Pul Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('133', 'Mcc Store G9 Islamabad', 'ISD-R Mcc Store G9 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('134', 'Mcc Taramari Islamabad', 'ISD-R Mcc Taramari Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('135', 'Metro Cash In Carry Islamabad', 'ISD-R Metro Cash In Carry Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('136', ' Pcc Barakoh Islamabad', 'ISD-R Pcc Barakoh Islamabad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('137', 'Pcc Commette Chowk Rawalpindi', 'ISD-R Pcc Commette Chowk Rawalpindi', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('138', 'Pcc G9 Islamabad', 'ISD-R Pcc G9 Islamabad ( 1Freezer )', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('139', 'Pcc Range Road Rawalpindi', 'ISD-R Pcc Range Road Rawalpindi ', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('140', 'Save Mart Rawat Rawalpindi', 'ISD-R Save Mart Rawat Rawalpindi ( 1 Freezer )', NULL, 'Rawalpindi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('141', 'Shaheen Chemist I 8 Islamabad', 'ISD-R Shaheen Chemist I 8 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('142', 'Shaheen Grocer F7 Islamabad', 'ISD-R Shaheen Grocer F7 Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('143', 'Islamabad Free Scheme ', 'ISD- Free Scheme Islamabad', NULL, 'Islamabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('144', 'Afc Burawala Lahore', 'LHR-H Afc Burawala Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('145', 'Arbaz Mailk Lahore', 'LHR-H Arbaz Mailk Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('146', 'Babar Sb Lahore', 'LHR-H Babar Sb Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('147', 'Buttler Caffe Lahore', 'LHR-H Buttler Caffe Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('148', 'Caffe Pizzaro Lahore', 'LHR-H Caffe Pizzaro Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('149', 'Cock N Bull Lahore', 'LHR-H Cock N Bull Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('150', 'Delish Pizza Lahore', 'LHR-R Delish Pizza Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('151', 'Friender Pizza Lahore', 'LHR-R Friender Pizza Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('152', 'Galitos Hotel Lahore', 'LHR-R Galitos Hotel Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('153', 'Ginos Pizza Johar Town Lahore', 'LHR-H Ginos Pizza Johar Town Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('154', 'Irfan Multan', 'LHR-H Irfan Multan', NULL, 'Multan', NULL, NULL, NULL, NULL, NULL, '', '0'),
('155', 'Itlaian Pizza Punjab Society L', 'LHR-R Itlaian Pizza Punjab Society Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('156', 'Jameel Sb LAhore', 'LHR-H Jameel Sb Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('157', 'King &amp; Queen Lahore', 'LHR-H King &amp; Queen Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('158', 'Maro Tandur Lahore', 'LHR-H Maro Tandur Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('159', 'Master Pizza Wapda Town Lhr', 'LHR-H Master Pizza W/T Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('160', ' Mozaraella Resturant 27Lahore', 'LHR-H Mozaraella Resturant 27 Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('161', 'Nishat Hotel Lahore', 'LHR-H Nishat Hotel Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('162', 'Parkland Hotel Lahore', 'LHR-H Parkland Hotel Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('163', 'Pizza &amp; Pizza Fortress Lah', 'LHR-H Pizza &amp; Pizza Fortress Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('164', 'Pizza 21 Lahore', 'LHR-H Pizza 21 Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('165', 'Pizza Channel F/T Lahore', 'LHR-H Pizza Channel F/T Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('166', ' Pizza Channel W/T Lahore', 'LHR-H Pizza Channel W/T Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('167', 'Pizza Company Lahore', 'LHR-H Pizza Company Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('168', 'Pizza House Lahore', 'LHR-H Pizza House Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('169', 'Pizza Point Lahore', 'LHR-H Pizza Point Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('170', 'Rajpoot Trades Lahore', 'LHR-H Rajpoot Traders Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('171', 'Popo Pizza Lahore', 'LHR-H Popo Pizza Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('172', 'Spice Cattring Lahore', 'LHR-H Spice Cattring Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('173', 'Usman &amp; Co Lahore', 'LHR-H Usman &amp; Co Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('174', 'Wahid Foods Lahore', 'LHR-H Wahid Foods Lahore', NULL, ' Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('175', 'Waqas Gujrat', 'LHR-H Waqas Gujrat ', NULL, 'Gujrat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('176', 'Waves 21 Lahore', 'LHR-H Waves 21 Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('177', 'Flates Hotel Lahore', 'LHR-H Flates Hotel Lahore', NULL, 'Lahore ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('178', ' Holiday Inn Lahhore', 'LHR-H Holiday Inn Hotel Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('179', 'Maf Hyper Star Emporium Lahore', 'LHR-I Maf Hyper Star Emporium Lahore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('180', 'Maf Hyper Star Fotress  Lahore', 'LHR-H Maf Hyper Star Fotress  Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('181', 'Maf Hyper Star Package  Lahore', 'LHR-H Maf Hyper Star Packages  Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('182', 'Metro Cash In Carry Dha Lahore', 'LHR-I Metro Cash In Carry Dha Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('183', 'Metro Cash In Carry Link Road ', 'LHR-R Metro Cash In Carry Link Road Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('184', ' Metro Cash In Carry Multan Rd', 'LHR-R Metro Cash In Carry Multan  Road Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('185', 'Subway Wahdat Road Lahore', 'LHR-I Subway Wahdat Road Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('186', 'Unique Foods Lahore', 'LHR-I Unique Foods Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('187', 'Imtiaz Store Gujranawala', 'LHR-O Imtiaz Store Gujrana Wala ', NULL, 'Gujranawala', NULL, NULL, NULL, NULL, NULL, '', '0'),
('188', 'Serina hotel Faisalabad', 'LHR-O Serina Hotel Faisalabad', NULL, 'Faisalabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('189', ' Zubaida Associates Faisalabad', 'LHR-O Zubaida Associates Faisalabad', NULL, 'Faisalabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('190', 'Broadway Lahore', 'LHR-R Broad Way Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('191', ' Csd Cavelry Lahore', 'LHR-R Csd Cavelry Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('192', 'Csd Store Mall Lahore', 'LHR-R Csd Store Mall Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('193', 'Sabari Store Lahore', 'LHR-R Sabari Store Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('194', 'ZM Store Dha Y Block Lahore', 'LHR-R ZM Store Dha Y Block Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('195', 'Zubaida Associate Hussain Chow', 'LHR-R Zubaida Associate Hussain Chowk Lahore', NULL, 'Lahore', NULL, NULL, NULL, NULL, NULL, '', '0'),
('196', 'Zubaida Associate JT DD Lahore', 'LHR-R Zubaida Associate JT DD Lahore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('197', 'Akbar Mart Mardan', 'O-1 Akbar Mart Mardan ( 1Small )', NULL, 'Mardan', NULL, NULL, NULL, NULL, NULL, '', '0'),
('198', 'AlHaram Store ', 'O-1 AlHaram Store ( 1CB Waves) ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('199', 'Asain Mall Gt Road Kamra', 'O-1 Asain Mall GT Road Kamra ( 1 CB Waves) ', NULL, 'Kamra', NULL, NULL, NULL, NULL, NULL, '', '0'),
('200', 'Asain Mall WahCantt ', 'O-1 Asain Mall WahCantt  ( 2 Candy Freezer )', NULL, 'WahCantt', NULL, NULL, NULL, NULL, NULL, '', '0'),
('201', 'Asfawul Khair Store Swat', 'O-1 Asfawul Khair Store Swat ( H Top )', NULL, 'Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('202', 'Asaiyana Mart Mardan ', 'O-1 Asaiyana Mart  Mardan ( 1 Waves )', NULL, 'Asaiyana Mart Mardan', NULL, NULL, NULL, NULL, NULL, '', '0'),
('203', 'Best Store Hazro', 'O-1 Best Store Hazro ( 1 V Line )', NULL, 'HAZRO', NULL, NULL, NULL, NULL, NULL, '', '0'),
('204', 'Big B Mega Mart Swat', 'O-1 Big B Mega Mart Swat( 1 Cb Waves )', NULL, 'Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('205', 'Big Khan Mart Thana Swat', 'O-1 Big Khan Mart Thana Swat ', NULL, 'Thana Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('206', 'Cammissery Shop Kamra ', 'O-1 Cammissery Shop Kamra ( 1 V Line &amp; Chiller )', NULL, 'Kamra', NULL, NULL, NULL, NULL, NULL, '', '0'),
('207', 'Cammissery Shop Tarbella', 'O-1 Cammissery Shop Tarbella', NULL, 'Tarbella', NULL, NULL, NULL, NULL, NULL, '', '0'),
('208', 'City Mart Swat', 'O-1 City Mart Swat', NULL, 'Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('209', 'Csd Store Nowshera', 'O-1 Csd Store Nowshera', NULL, 'Nowshera', NULL, NULL, NULL, NULL, NULL, '', '0'),
('210', 'Fazal Super Store Swat', 'O-1 Fazal Super Store Swat ( 1 Small )', NULL, 'Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('211', 'Galaini Mart WahCantt', 'O-1 Galaini Mart Wahcantt ( 2 V Line )', NULL, 'WahCantt', NULL, NULL, NULL, NULL, NULL, '', '0'),
('212', 'Home Plus shami Road Mardan', 'O-1 Home Plus Shami Road Mardan ( 1 S Wave )', NULL, 'Mardan', NULL, NULL, NULL, NULL, NULL, '', '0'),
('213', 'Khaksar Store Nowshera', 'O-1 Khaksar Store Nowshera ( 1 S Waves )', NULL, 'Nowshera', NULL, NULL, NULL, NULL, NULL, '', '0'),
('214', 'Mardan Mega Mart ', 'O-1 Mardan Mega Mart Mardan( 1 V Line )', NULL, 'Mardan', NULL, NULL, NULL, NULL, NULL, '', '0'),
('215', 'Marina Shopping Mall WahCantt', 'O-1 Marina Shopping Mall WahCantt ( 1 Candy )', NULL, 'WahCantt', NULL, NULL, NULL, NULL, NULL, '', '0'),
('216', 'Moon Shopping Mall WahCantt', 'O-1 Moon Shopping Mall Wahcantt ( 1 Cb Wave )', NULL, 'WahCantt', NULL, NULL, NULL, NULL, NULL, '', '0'),
('217', 'Naseem Mart  Attock', 'O-1 Naseem Mart Attock ( 1 Candy )', NULL, 'Attock', NULL, NULL, NULL, NULL, NULL, '', '0'),
('218', 'Nesto Hyper Mall TakthBhai', 'O-1 Nesto Hyper Mall TakthBhai Sawabi', NULL, 'TakhthBhai Sawabi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('219', 'Pso Shell Shop Mardan', 'O-1 Pso Shell Shop Mardan', NULL, 'Mardan', NULL, NULL, NULL, NULL, NULL, '', '0'),
('220', 'Rajpoot Mega Mall Taxila', 'O-1 Rajpoot Mega Mall City Taxila', NULL, 'Taxila', NULL, NULL, NULL, NULL, NULL, '', '0'),
('221', 'Rice Mart Nowshera', 'O-1 Rice Mart Nowshera ( 1 V Line )', NULL, 'Nowshera', NULL, NULL, NULL, NULL, NULL, '', '0'),
('222', 'Rite Bank Tarbella', 'O-1 Rite Bank Tarbella ', NULL, 'Tarbella', NULL, NULL, NULL, NULL, NULL, '', '0'),
('223', 'Safa Cash In Carry Taxila', 'O-1 Safa Cash In Carry Taxila ( 1 Waves )', NULL, 'Taxila', NULL, NULL, NULL, NULL, NULL, '', '0'),
('224', 'Serina Hotel Swat', 'O-1 Serina Hotel Swat ', NULL, 'Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('225', 'Shah Store Swat', 'O-1 Shah Store Swat  ( 1 Waves )', NULL, 'Swat', NULL, NULL, NULL, NULL, NULL, '', '0'),
('226', 'Tarbella Mart Store', 'O-1 Tarbella Mart ( 1 Small Waves )', NULL, 'Tarbella', NULL, NULL, NULL, NULL, NULL, '', '0'),
('227', 'Village Mart Charsada', 'O-1 Village Mart Charsada ( 1 Candy Freezer )', NULL, 'Charsada ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('228', 'Zam Zama Store Attock', 'O-1 Zam Zama Store Attock', NULL, 'Attock', NULL, NULL, NULL, NULL, NULL, '', '0'),
('229', 'Boon Super Abbotabad', 'O-2 Boon Super Abbotabad ( 1 Waves )', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('230', 'City Shopper Haripur', 'O-1 City Shopper Haripur ( 1 Waves )', NULL, 'Haripur', NULL, NULL, NULL, NULL, NULL, '', '0'),
('231', 'Hazara Mall Havalian ', 'O-1 Hazara Mall Havalian ( 1 Waves )', NULL, 'Havalian ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('232', 'Hotel One Abbotabad', 'O-2 Hotel One Abbotabad', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('233', 'Italian Mall Abbotabad', 'O-2 Itaalian Mall Abbotabad ( 2 Waves )', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('234', 'Italian Mall Haripur', 'O-2 Italian Mall HariPur ( 1 Waves )', NULL, 'Haripur', NULL, NULL, NULL, NULL, NULL, '', '0'),
('235', 'Kifayat Cash In Carry Abbotaba', 'O-2 Kifayat Cash In Carry Abbotabad ( 1 Waves )', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('236', 'Lasani Store Abbotabad', 'O-2 Lasani Store Abbotabad', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('237', 'M Saeed &amp; Brother Natiyaga', 'O-2 M Saeed &amp; Brother Natiyagali ( 1 Hot Top)', NULL, ' Natiyagali', NULL, NULL, NULL, NULL, NULL, '', '0'),
('238', 'Naan Sense Abbotabad', 'O-2 Naan Sense  Abbotabad ', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('239', 'Pakistan Super Store Abbotabad', 'O-2 Pakistan Super Store Abbotabad ', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('240', 'Rahat Bakery Abbotabad', 'O-2 Rahat Bakery Abbotabad ( 1 Hot Top )', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('241', 'Shaheen Store Abbotabad', 'O-2 Shaheen Store Abbotabad (1 Waves )', NULL, 'Abbotabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('242', 'Waamzz Cash In Carry Haripur', 'O-2 Waamzz Cash In Carry Haripur (1 Waves )', NULL, 'Haripur', NULL, NULL, NULL, NULL, NULL, '', '0'),
('243', 'AD Mart Hayatabad Peshawar', 'P-2 AD Mart Hayatabad Peshawar', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('244', 'Afridi Store Phase 7 Hayatabad', 'P-2 Afridi Store Hayatabad Phase 7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('245', 'Al Nazar Juice Hayatabad', 'P-2 Al Nazar Juice Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('246', 'Aziz Juice Karkhano Market', 'P-2 Aziz Juice Karkhano Market', NULL, 'Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('247', 'Baker Cusine Hayatabad', 'P-2 Baker Cusine Hayatabad ', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('248', 'Bilal Super Store Hayatabad', 'P-2 Bilal Super Store Hayatabad', NULL, 'Hayatabad ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('249', 'Bread Shop Hayatabad ', 'P-2 Bread Shop Hayatabad Peshawar', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('250', 'Brother Juice Bilal Market Hay', 'P-2 Brother Juice Bilal Market Hayatabad', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('251', 'Caffe Pizzaro Hayatabad', 'P-2 Caffe Pizzaro Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('252', 'City Mart Store Hayatabad', 'P-2 City Mart Store Hayatabad ', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('253', 'D Watson Pda Hayatabad', 'P-2 D Watson Pda Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('254', 'Engineer Juice Hayatabad', 'P-2 Engineer Juice Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('255', 'Hash Mart Hayatabad', 'P-2 Hash Mart Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('256', 'Hayatabad Pizza', 'P-2 Hayatabad Pizza', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('257', 'Hyper Mall Ring Road Peshawar', 'P-2 Hyper Mall Ring Road Peshawar', NULL, 'Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('258', 'Ihsan Juice Hayatabad', 'P-2 Ihsan Juice Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('259', 'Insaf Juice Bilal Market Hayat', 'P-2 Insaf Juice Bilal Market Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('260', 'Jan Bakery Nasir Bagh Road', 'P-2 Jan Bakery Nasir Bagh Road ( Waves )', NULL, 'Nasir Bagh Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('261', 'Khyber Store Hayatabad', 'P-2 Khyber Store Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('262', 'Kokany Foods Hayatabad', 'P-2 Kokany Foods Hayatabad', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('263', 'Nigarhar Juice Hayatabad', 'P-2 Nigarhar Juice Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('264', 'On Theway Store Hayatabad', 'P-2 On TheWay Store Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('265', 'Pick N Save Super Market Hayat', 'P-2 Pick N Save Super Market Hayatabad  (1 Waves )', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('266', 'Shah Store Hayatabad', 'P-2 Shah Store Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('267', 'Spotage Pizza Hayatabad', 'P-2 Spotage Pizza Hayatabad', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('268', 'Super Value Store Hayatabad', 'P-2 Super Value Store Hayatabad', NULL, 'Hayatabad ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('269', 'The Wall Mart Hayatabad', 'P-2 The Wall Mart Hayatabad ( 1 V Line )', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('270', 'Top N Town Peshawar Hayatabad', 'P-2 Top N Town Peshawar ( V Line 1)', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('271', 'Usama Juice Hayatabad', 'P-2 Usama Juice Hayatabad ', NULL, 'Hayatabad', NULL, NULL, NULL, NULL, NULL, '', '0'),
('272', 'Wadood Sons Pda Hayatabad', 'P-2 Wadood Sons Pda Hayatabad', NULL, 'Hayatabad Peshawar', NULL, NULL, NULL, NULL, NULL, '', '0'),
('273', 'Wah Khan Pizzza Hayataba', 'P-2 Wah Khan Pizza Hayatabad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('274', 'IHSAN ULLAH KARACHI', 'KHI- IHSAN ULLAH KARACHI', NULL, 'KARACHI', NULL, NULL, NULL, NULL, NULL, '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_allocations` ###

INSERT INTO `0_cust_allocations` VALUES
('1', '122', '0', '2017-06-30', '1', '12', '15', '10'),
('2', '122', '0', '2017-06-30', '2', '12', '16', '10'),
('3', '14', '9260', '2017-10-02', '3', '12', '19', '10'),
('4', '225', '3960', '2017-10-02', '4', '12', '20', '10'),
('5', '193', '36864', '2017-10-02', '5', '12', '21', '10');

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
  `contact_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_trans` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`branch_code`,`debtor_no`),
  KEY `branch_ref` (`branch_ref`),
  KEY `group_no` (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('2', '2', 'Imtiaz Store', 'Imtiaz Store', 'Karachi', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Karachi', '0', '', NULL, '0', NULL, NULL),
('4', '4', 'Avon Super Store', 'Avon psh', 'Spogmai Plaza , Jamrud Road Peshawar', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Spogmai Plaza , Jamrud Road Peshawar', '0', '', NULL, '0', NULL, NULL),
('5', '5', 'Avon Super Store', 'avon', '', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('6', '6', 'Serena Hotel Islamabad', 'Serena Islamabad', '', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('9', '9', 'Yum PIZZA ', 'Yum PIZZA ', 'Pesahwar', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Pesahwar', '0', '', NULL, '0', NULL, NULL),
('11', '11', 'P- 1 9 to Eleven Store', 'P-1 9 to Eleven Store', 'Peshawar', '1', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Peshawar', '0', '', NULL, '0', NULL, NULL),
('12', '12', ' P-1 AL-FATAH ', ' P-1 AL-FATAH ', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('13', '13', 'P-1 CHIEF BURGER ', 'P-1 CHIEF BURGER ', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('14', '14', 'P-1 CP STORE  (1 V LINE)', 'P-1 CP STORE  (1 V LINE)', 'PESHAWAR', '1', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('15', '15', ' P-1 DAY &amp; NIGHT STORE (1 WAVES)', ' P-1 DAY &amp; NIGHT STORE (1 ', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('16', '16', 'P-1 CSD PESHAWAR', 'P-1 CSD PESHAWAR', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('17', '17', 'P-1 ENTER MART ', 'P-1 ENTER MART ', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('18', '18', 'P-1 FAMILY STORE', 'P-1 FAMILY STORE', 'KOHAT ROAD PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KOHAT ROAD PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('19', '19', 'P-1 GREEN MART ', 'P-1 GREEN MART ', 'SADDAR PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SADDAR PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('20', '20', ' P-1 GUL COOL SPOT (1STAND FREEZER)', ' P-1 GUL COOL SPOT (1STAND FRE', 'UNIVERSITY ROAD PESHAWAR', '1', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'UNIVERSITY ROAD PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('21', '21', 'P-1 ITALIAN PIZZA', 'P-1 ITALIAN PIZZA', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('22', '22', 'P-1 JAN SHOPING GULBAHAR', 'P-1 JAN SHOPING GULBAHAR', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('23', '23', 'P-1 KING &amp; QUEEN PIZZA', 'P-1 KING &amp; QUEEN PIZZA', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('24', '24', 'P-1 M MART (I WAVES)', 'P-1 M MART (I WAVES)', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('25', '25', 'P-1 MEAT SHOP SHAHEEN', 'P-1 MEAT SHOP SHAHEEN', 'UNIVERSITY TOWN PEHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'UNIVERSITY TOWN PEHAWAR', '0', '', NULL, '0', NULL, NULL),
('26', '26', 'P-1 NAN SENS CAFFE', 'P-1 NAN SENS CAFFE', 'PESHAWAR ', '1', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR ', '0', '', NULL, '0', NULL, NULL),
('27', '27', 'P-1 NIAZ SB', 'P-1 NIAZ SB', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('28', '28', 'P-1 POTATO PLUS (P1P2) I HOT TOP', 'P-1 POTATO PLUS (P1P2) I HOT T', 'PESHAWAR', '1', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('29', '29', 'P-1 RAHAT BAKERY', 'P-1 RAHAT BAKERY', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('30', '30', 'P-1 S MART STORE (1 FREEZER SMALL)', 'P-1 S MART STORE (1 FREEZER SM', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('31', '31', 'P-1 SHAHEEN AIRLINE ', 'P-1 SHAHEEN AIRLINE ', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('32', '32', 'P-1 SHAHEEN SUPER STORE(1 WAVES)', 'P-1 SHAHEEN SUPER STORE(1 WAVE', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('33', '33', 'P-1 TIME PHARMACY (1 CANDY)', 'P-1 TIME PHARMACY (1 CANDY)', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('34', '34', 'P-1 YUMMS PIZZA ', 'P-1 YUMMS PIZZA ', 'PESHAWAR', '2', '4', 'DEF', '1', '', '4025', '1013', '4025', '1', 'PESHAWAR', '0', '', NULL, '0', NULL, NULL),
('35', '35', 'ISD- H AFGHAN BURGER ', 'ISD- H AFGHAN BURGER ', 'ISLAMABAD', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ISLAMABAD', '0', '', NULL, '0', NULL, NULL),
('36', '36', 'ISD- H AFGHAN BURGER F10', 'ISD- H AFGHAN BURGER F10', 'ISLAMABAD', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ISLAMABAD', '0', '', NULL, '0', NULL, NULL),
('37', '37', ' ISD-H ARIF TRADER', ' ISD-H ARIF TRADER', 'ISLAMABAD', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ISLAMABAD', '0', '', NULL, '0', NULL, NULL),
('38', '38', 'ISD H- AL-HILAL STORE', 'ISD H- AL-HILAL STORE', 'ISLAMABAD', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ISLAMABAD', '0', '', NULL, '0', NULL, NULL),
('39', '39', 'ISD-H  BAIYA PIZZA', 'ISD-H  BAIYA PIZZA', 'GUJRAT', '8', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'GUJRAT', '0', '', NULL, '0', NULL, NULL),
('40', '40', 'ISD-H BASHIR GILGAT', 'ISD-H BASHIR GILGAT', 'ISLAMABAD', '8', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ISLAMABAD', '0', '', NULL, '0', NULL, NULL),
('41', '41', 'Euro Shop HO', 'Head Office', 'Plot 111 Hayatabad Peshawar', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Plot 111 Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('42', '42', 'Gate Sales ', 'Gates Sales', 'Plot 111 Hayatabad', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Plot 111 Hayatabad', '0', '', NULL, '0', NULL, NULL),
('43', '43', 'ISD-H Afghani Burger Islamabad', 'Afghani Burger', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('44', '44', 'ISD-H Burger Party Islamabad', 'Burger Party Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('45', '45', 'ISD-H Crown Plaza Islamabad', 'Crown Plaza Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('46', '46', 'ISD-H Margala hotel Islamabad', 'Margala hotel Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('47', '47', 'ISD-H Papa Saleh Islamabad', 'Papa Saleh Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('48', '48', 'ISD-H Papa Saleh Rawalpindi', 'Papa Saleh Rawalpindi', 'Rawalpindi', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('49', '49', 'ISD-H Pia Cattring Islamabad', 'Pia Cattring Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('50', '50', 'ISD-H Pizza Fort Islamabad', 'Pizza Fort Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('51', '51', 'ISD-H QFF Islamabad', 'QFF Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('52', '52', 'ISD-H Rahat Bakers Adyala Rawalpindi', 'Rahat Bakers Adyala Rawalpindi', 'Rawalpindi', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('53', '53', 'ISD-H Rahat Bakers Barakoh Islamabad', 'Rahat bakers barakoh Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('54', '54', 'ISD-H Rahat Bakers F 11 Islamabad', 'Rahat Bakers F 11 Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('55', '55', 'ISD-H Rahat Bakers PAF Islamabad', 'Rahat Bakers PAF Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('56', '56', 'ISD-H Rahat Bakers F10 Islamabad', 'Rahat Bakers F10 Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('57', '57', 'ISD-H Rahat Bakers G 11 Islamabad', 'Rahat Bakers  G 11 Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('58', '58', 'ISD-H Rahat Bakers Godra Rawalpindi', 'Rahat Bakers Godra Rawalpindi', 'Rawalpindi', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('59', '59', 'ISD-H Rahat Bakers I 8 Islamabad', 'Rahat Bakers I8 Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('60', '60', 'ISD-H Serina Hotel Islamabad', 'Serina Hotel Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('61', '61', 'ISD-H Tehzeeb Bakery Islamabad', 'Tehzeeb Bakery Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('62', '62', 'ISD-H Unique Foods Islamabad', 'Unique Foods Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('63', '63', 'ISD-H Western Global Services Islamabad', 'Western Global Services Isb', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('64', '64', 'ISD-H Zia &amp; Sons Islamabad', 'Zia &amp; Sons Islamabad', 'Islamabad', '8', '7', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('65', '65', 'ISD-R Alfatah Store Islamabad', 'Alfatah Store Islamabad ( ZM )', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('66', '66', 'ISD-R Bachat Mall Sector B Askari 14 RWP', 'Bachat Mall Sector B Askari 14', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('67', '67', 'ISD-R Best Price Islamabad', 'Best Price Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('68', '68', 'ISD-R Csd Store Rawalpindi', 'Csd Store Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('69', '69', 'ISD-R CSD Westirage Rawalpindi', 'CSD Westirage Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('70', '70', 'ISD-R D Watson BK Islamabad (1Frezer)', 'D Wastson BK Islamabad ', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('71', '71', 'ISD-R E Mart Hall View  Road ( 1Freezer)', 'E Mart Hall View Road Islamaba', '', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('72', '72', 'ISD-R Empire Mart A/S Rawalpindi (1Freezer)', 'Empire Mart A/S Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('73', '73', 'ISD-R Galaini Mart Adyala Rawalpindi', 'Galaini Mart Adyala Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('74', '74', 'ISD-R HM Store Islamabad', 'HM Store Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('75', '75', 'ISD-R J Mart Dha Islamabad ( 1 Freezer)', 'J Mart  Dha Islamabad', 'Islamabad ', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad ', '0', '', NULL, '0', NULL, NULL),
('76', '76', 'ISD-R Khushabo Cash In Carry Islamabad', 'Khusbo Cash In Carry Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('77', '77', 'ISD-R Leader Price Pakistan Town (1 Freezer)', 'Leader Price Pakistan Town Isb', 'Islamabad ', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad ', '0', '', NULL, '0', NULL, NULL),
('78', '78', 'ISD-R Luft Store Pwd Islamabad', 'Luft Store Pwd Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('79', '79', 'ISD-R M Mart Islamabad', 'M Mart Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('80', '80', 'ISD-R Maac Mart Islamabad ( Freezer)', 'Maac Mart Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('81', '81', 'ISD-R Maf Hyper Star Islamabad', 'Maf Hyper Star Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('82', '82', 'ISD-R Mcc Airport Rawalpindi (Frezer)', 'Mcc Airport Rawalindi ', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('83', '83', 'ISD-R Mcc Comerical Mkt Rawalpindi ( 1 Freezer )', 'Mcc Comerical Mkt Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('84', '84', 'ISD-R Mcc F 11 Islamabad', 'Mcc F 11 Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('85', '85', 'ISD-R Mcc Gujar Khan Rwp ( Freezer )', 'Mcc Gujar Khan Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('86', '86', 'ISD-R Mcc I 8 Islamabad ( 1Freezer )', 'Mcc I 8 Islamabad ', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('87', '87', 'ISD-R Mcc Khana Pul Rawalpindi', 'Mcc Khana Pul Rawalindi ', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('88', '88', 'ISD-R Mcc Store G9 Islamabad', 'Mcc Store G9 Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('89', '89', 'ISD-R Mcc Taramari Islamabad', 'Mcc Taramari Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('90', '90', 'ISD-R Metro Cash In Carry Islamabad', 'Metro Cash In Carry Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('91', '91', 'ISD-R Pcc Barakoh Islamabad', ' Pcc Barakoh Islamabad', '', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('92', '92', 'ISD-R Pcc Commette Chowk Rawalpindi', 'Pcc Commette Chowk Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('93', '93', 'ISD-R Pcc G9 Islamabad ( 1Freezer )', 'Pcc G9 Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('94', '94', 'ISD-R Pcc Range Road Rawalpindi ', 'Pcc Range Road Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('95', '95', 'ISD-R Save Mart Rawat Rawalpindi ( 1 Freezer )', 'Save Mart Rawat Rawalpindi', 'Rawalpindi', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Rawalpindi', '0', '', NULL, '0', NULL, NULL),
('96', '96', 'ISD-R Shaheen Chemist I 8 Islamabad', 'Shaheen Chemist I 8 Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('97', '97', 'ISD-R Shaheen Grocer F7 Islamabad', 'Shaheen Grocer F7 Islamabad', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('98', '98', 'ISD- Free Scheme Islamabad', 'Islamabad Free Scheme ', 'Islamabad', '9', '6', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Islamabad', '0', '', NULL, '0', NULL, NULL),
('99', '99', 'LHR-H Afc Burawala Lahore', 'Afc Burawala Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('100', '100', 'LHR-H Arbaz Mailk Lahore', 'Arbaz Mailk Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('101', '101', 'LHR-H Babar Sb Lahore', 'Babar Sb Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('102', '102', 'LHR-H Buttler Caffe Lahore', 'Buttler Caffe Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('103', '103', 'LHR-H Caffe Pizzaro Lahore', 'Caffe Pizzaro Lahore', 'Lahore', '1', '8', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('104', '104', 'LHR-H Cock N Bull Lahore', 'Cock N Bull Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('105', '105', 'LHR-R Delish Pizza Lahore', 'Delish Pizza Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('106', '106', 'LHR-R Friender Pizza Lahore', 'Friender Pizza Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('107', '107', 'LHR-R Galitos Hotel Lahore', 'Galitos Hotel Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('108', '108', 'LHR-H Ginos Pizza Johar Town Lahore', 'Ginos Pizza Johar Town Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('109', '109', 'LHR-H Irfan Multan', 'Irfan Multan', 'Multan', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Multan', '0', '', NULL, '0', NULL, NULL),
('110', '110', 'LHR-R Itlaian Pizza Punjab Society Lahore', 'Itlaian Pizza Punjab Society L', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('111', '111', 'LHR-H Jameel Sb Lahore', 'Jameel Sb LAhore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('112', '112', 'LHR-H King &amp; Queen Lahore', 'King &amp; Queen Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('113', '113', 'LHR-H Maro Tandur Lahore', 'Maro Tandur Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('114', '114', 'LHR-H Master Pizza W/T Lahore', 'Master Pizza Wapda Town Lhr', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('115', '115', 'LHR-H Mozaraella Resturant 27 Lahore', ' Mozaraella Resturant 27Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('116', '116', 'LHR-H Nishat Hotel Lahore', 'Nishat Hotel Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('117', '117', 'LHR-H Parkland Hotel Lahore', 'Parkland Hotel Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('118', '118', 'LHR-H Pizza &amp; Pizza Fortress Lahore', 'Pizza &amp; Pizza Fortress Lah', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('119', '120', 'LHR-H Pizza 21 Lahore', 'Pizza 21 Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('120', '121', 'LHR-H Pizza Channel F/T Lahore', 'Pizza Channel F/T Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('121', '122', 'LHR-H Pizza Channel W/T Lahore', ' Pizza Channel W/T Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('122', '123', 'LHR-H Pizza Company Lahore', 'Pizza Company Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('123', '124', 'LHR-H Pizza House Lahore', 'Pizza House Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('124', '125', 'LHR-H Pizza Point Lahore', 'Pizza Point Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('125', '126', 'LHR-H Rajpoot Traders Lahore', 'Rajpoot Trades Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('126', '128', 'LHR-H Popo Pizza Lahore', 'Popo Pizza Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('127', '129', 'LHR-H Spice Cattring Lahore', 'Spice Cattring Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('128', '131', 'LHR-H Usman &amp; Co Lahore', 'Usman &amp; Co Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('129', '132', 'LHR-H Wahid Foods Lahore', 'Wahid Foods Lahore', ' Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', ' Lahore', '0', '', NULL, '0', NULL, NULL),
('130', '133', 'LHR-H Waqas Gujrat ', 'Waqas Gujrat', 'Gujrat', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Gujrat', '0', '', NULL, '0', NULL, NULL),
('131', '134', 'LHR-H Waves 21 Lahore', 'Waves 21 Lahore', 'Lahore', '1', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('132', '135', 'LHR-H Flates Hotel Lahore', 'Flates Hotel Lahore', 'Lahore ', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore ', '0', '', NULL, '0', NULL, NULL),
('133', '136', 'LHR-H Holiday Inn Hotel Lahore', ' Holiday Inn Lahhore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('134', '137', 'LHR-I Maf Hyper Star Emporium Lahore', 'Maf Hyper Star Emporium Lahore', '', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('135', '138', 'LHR-H Maf Hyper Star Fotress  Lahore', 'Maf Hyper Star Fotress  Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('136', '139', 'LHR-H Maf Hyper Star Packages  Lahore', 'Maf Hyper Star Package  Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('137', '140', 'LHR-I Metro Cash In Carry Dha Lahore', 'Metro Cash In Carry Dha Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('138', '141', 'LHR-R Metro Cash In Carry Link Road Lahore', 'Metro Cash In Carry Link Road ', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('139', '142', 'LHR-R Metro Cash In Carry Multan  Road Lahore', ' Metro Cash In Carry Multan Rd', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('140', '144', 'LHR-I Subway Wahdat Road Lahore', 'Subway Wahdat Road Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('141', '145', 'LHR-I Unique Foods Lahore', 'Unique Foods Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('142', '146', 'LHR-O Imtiaz Store Gujrana Wala ', 'Imtiaz Store Gujranawala', 'Gujranawala', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Gujranawala', '0', '', NULL, '0', NULL, NULL),
('143', '147', 'LHR-O Serina Hotel Faisalabad', 'Serina hotel Faisalabad', 'Faisalabad', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Faisalabad', '0', '', NULL, '0', NULL, NULL),
('144', '148', 'LHR-O Zubaida Associates Faisalabad', ' Zubaida Associates Faisalabad', 'Faisalabad', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Faisalabad', '0', '', NULL, '0', NULL, NULL),
('145', '150', 'LHR-R Broad Way Lahore', 'Broadway Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('146', '152', 'LHR-R Csd Cavelry Lahore', ' Csd Cavelry Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('147', '153', 'LHR-R Csd Store Mall Lahore', 'Csd Store Mall Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('148', '154', 'LHR-R Sabari Store Lahore', 'Sabari Store Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('149', '155', 'LHR-R ZM Store Dha Y Block Lahore', 'ZM Store Dha Y Block Lahore', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('150', '157', 'LHR-R Zubaida Associate Hussain Chowk Lahore', 'Zubaida Associate Hussain Chow', 'Lahore', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Lahore', '0', '', NULL, '0', NULL, NULL),
('151', '159', 'LHR-R Zubaida Associate JT DD Lahore', 'Zubaida Associate JT DD Lahore', '', '11', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('152', '161', 'O-1 Akbar Mart Mardan ( 1Small )', 'Akbar Mart Mardan', 'Mardan', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Mardan', '0', '', NULL, '0', NULL, NULL),
('153', '162', 'O-1 AlHaram Store ( 1CB Waves) ', 'AlHaram Store ', '', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('154', '163', 'O-1 Asain Mall GT Road Kamra ( 1 CB Waves) ', 'Asain Mall Gt Road Kamra', 'Kamra', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Kamra', '0', '', NULL, '0', NULL, NULL),
('155', '164', 'O-1 Asain Mall WahCantt  ( 2 Candy Freezer )', 'Asain Mall WahCantt ', 'WahCantt', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'WahCantt', '0', '', NULL, '0', NULL, NULL),
('156', '165', 'O-1 Asfawul Khair Store Swat ( H Top )', 'Asfawul Khair Store Swat', 'Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Swat', '0', '', NULL, '0', NULL, NULL),
('157', '166', 'O-1 Asaiyana Mart  Mardan ( 1 Waves )', 'Asaiyana Mart Mardan ', 'Asaiyana Mart Mardan', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Asaiyana Mart Mardan', '0', '', NULL, '0', NULL, NULL),
('158', '167', 'O-1 Best Store Hazro ( 1 V Line )', 'Best Store Hazro', 'HAZRO', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'HAZRO', '0', '', NULL, '0', NULL, NULL),
('159', '168', 'O-1 Big B Mega Mart Swat( 1 Cb Waves )', 'Big B Mega Mart Swat', 'Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Swat', '0', '', NULL, '0', NULL, NULL),
('160', '169', 'O-1 Big Khan Mart Thana Swat ', 'Big Khan Mart Thana Swat', 'Thana Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Thana Swat', '0', '', NULL, '0', NULL, NULL),
('161', '170', 'O-1 Cammissery Shop Kamra ( 1 V Line &amp; Chiller )', 'Cammissery Shop Kamra ', 'Kamra', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Kamra', '0', '', NULL, '0', NULL, NULL),
('162', '171', 'O-1 Cammissery Shop Tarbella', 'Cammissery Shop Tarbella', 'Tarbella', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Tarbella', '0', '', NULL, '0', NULL, NULL),
('163', '172', 'O-1 City Mart Swat', 'City Mart Swat', 'Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Swat', '0', '', NULL, '0', NULL, NULL),
('164', '173', 'O-1 Csd Store Nowshera', 'Csd Store Nowshera', 'Nowshera', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Nowshera', '0', '', NULL, '0', NULL, NULL),
('165', '174', 'O-1 Fazal Super Store Swat ( 1 Small )', 'Fazal Super Store Swat', 'Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Swat', '0', '', NULL, '0', NULL, NULL),
('166', '175', 'O-1 Galaini Mart Wahcantt ( 2 V Line )', 'Galaini Mart WahCantt', 'WahCantt', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'WahCantt', '0', '', NULL, '0', NULL, NULL),
('167', '176', 'O-1 Home Plus Shami Road Mardan ( 1 S Wave )', 'Home Plus shami Road Mardan', 'Mardan', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Mardan', '0', '', NULL, '0', NULL, NULL),
('168', '177', 'O-1 Khaksar Store Nowshera ( 1 S Waves )', 'Khaksar Store Nowshera', 'Nowshera', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Nowshera', '0', '', NULL, '0', NULL, NULL),
('169', '178', 'O-1 Mardan Mega Mart Mardan( 1 V Line )', 'Mardan Mega Mart ', 'Mardan', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Mardan', '0', '', NULL, '0', NULL, NULL),
('170', '179', 'O-1 Marina Shopping Mall WahCantt ( 1 Candy )', 'Marina Shopping Mall WahCantt', 'WahCantt', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'WahCantt', '0', '', NULL, '0', NULL, NULL),
('171', '180', 'O-1 Moon Shopping Mall Wahcantt ( 1 Cb Wave )', 'Moon Shopping Mall WahCantt', 'WahCantt', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'WahCantt', '0', '', NULL, '0', NULL, NULL),
('172', '181', 'O-1 Naseem Mart Attock ( 1 Candy )', 'Naseem Mart  Attock', 'Attock', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Attock', '0', '', NULL, '0', NULL, NULL),
('173', '182', 'O-1 Nesto Hyper Mall TakthBhai Sawabi', 'Nesto Hyper Mall TakthBhai', 'TakhthBhai Sawabi', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'TakhthBhai Sawabi', '0', '', NULL, '0', NULL, NULL),
('174', '183', 'O-1 Pso Shell Shop Mardan', 'Pso Shell Shop Mardan', 'Mardan', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Mardan', '0', '', NULL, '0', NULL, NULL),
('175', '184', 'O-1 Rajpoot Mega Mall City Taxila', 'Rajpoot Mega Mall Taxila', 'Taxila', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Taxila', '0', '', NULL, '0', NULL, NULL),
('176', '185', 'O-1 Rice Mart Nowshera ( 1 V Line )', 'Rice Mart Nowshera', 'Nowshera', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Nowshera', '0', '', NULL, '0', NULL, NULL),
('177', '186', 'O-1 Rite Bank Tarbella ', 'Rite Bank Tarbella', 'Tarbella', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Tarbella', '0', '', NULL, '0', NULL, NULL),
('178', '188', 'O-1 Safa Cash In Carry Taxila ( 1 Waves )', 'Safa Cash In Carry Taxila', 'Taxila', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Taxila', '0', '', NULL, '0', NULL, NULL),
('179', '189', 'O-1 Serina Hotel Swat ', 'Serina Hotel Swat', 'Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Swat', '0', '', NULL, '0', NULL, NULL),
('180', '190', 'O-1 Shah Store Swat  ( 1 Waves )', 'Shah Store Swat', 'Swat', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Swat', '0', '', NULL, '0', NULL, NULL),
('181', '191', 'O-1 Tarbella Mart ( 1 Small Waves )', 'Tarbella Mart Store', 'Tarbella', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Tarbella', '0', '', NULL, '0', NULL, NULL),
('182', '192', 'O-1 Village Mart Charsada ( 1 Candy Freezer )', 'Village Mart Charsada', 'Charsada ', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Charsada ', '0', '', NULL, '0', NULL, NULL),
('183', '193', 'O-1 Zam Zama Store Attock', 'Zam Zama Store Attock', 'Attock', '4', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Attock', '0', '', NULL, '0', NULL, NULL),
('184', '194', 'O-2 Boon Super Abbotabad ( 1 Waves )', 'Boon Super Abbotabad', 'Abbotabad', '6', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('185', '195', 'O-1 City Shopper Haripur ( 1 Waves )', 'City Shopper Haripur', 'Haripur', '6', '5', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Haripur', '0', '', NULL, '0', NULL, NULL),
('186', '196', 'O-1 Hazara Mall Havalian ( 1 Waves )', 'Hazara Mall Havalian ', 'Havalian ', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Havalian ', '0', '', NULL, '0', NULL, NULL),
('187', '197', 'O-2 Hotel One Abbotabad', 'Hotel One Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('188', '198', 'O-2 Itaalian Mall Abbotabad ( 2 Waves )', 'Italian Mall Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('189', '199', 'O-2 Italian Mall HariPur ( 1 Waves )', 'Italian Mall Haripur', 'Haripur', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Haripur', '0', '', NULL, '0', NULL, NULL),
('190', '200', 'O-2 Kifayat Cash In Carry Abbotabad ( 1 Waves )', 'Kifayat Cash In Carry Abbotaba', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('191', '201', 'O-2 Lasani Store Abbotabad', 'Lasani Store Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('192', '202', 'O-2 M Saeed &amp; Brother Natiyagali ( 1 Hot Top)', 'M Saeed &amp; Brother Natiyaga', ' Natiyagali', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', ' Natiyagali', '0', '', NULL, '0', NULL, NULL),
('193', '203', 'O-2 Naan Sense  Abbotabad ', 'Naan Sense Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('194', '204', 'O-2 Pakistan Super Store Abbotabad ', 'Pakistan Super Store Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('195', '205', 'O-2 Rahat Bakery Abbotabad ( 1 Hot Top )', 'Rahat Bakery Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('196', '206', 'O-2 Shaheen Store Abbotabad (1 Waves )', 'Shaheen Store Abbotabad', 'Abbotabad', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Abbotabad', '0', '', NULL, '0', NULL, NULL),
('197', '208', 'O-2 Waamzz Cash In Carry Haripur (1 Waves )', 'Waamzz Cash In Carry Haripur', 'Haripur', '6', '9', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Haripur', '0', '', NULL, '0', NULL, NULL),
('198', '209', 'P-2 AD Mart Hayatabad Peshawar', 'AD Mart Hayatabad Peshawar', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('199', '210', 'P-2 Afridi Store Hayatabad Phase 7', 'Afridi Store Phase 7 Hayatabad', '', '8', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('200', '211', 'P-2 Al Nazar Juice Hayatabad', 'Al Nazar Juice Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('201', '212', 'P-2 Aziz Juice Karkhano Market', 'Aziz Juice Karkhano Market', 'Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Peshawar', '0', '', NULL, '0', NULL, NULL),
('202', '213', 'P-2 Baker Cusine Hayatabad ', 'Baker Cusine Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('203', '214', 'P-2 Bilal Super Store Hayatabad', 'Bilal Super Store Hayatabad', 'Hayatabad ', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad ', '0', '', NULL, '0', NULL, NULL),
('204', '215', 'P-2 Bread Shop Hayatabad Peshawar', 'Bread Shop Hayatabad ', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('205', '216', 'P-2 Brother Juice Bilal Market Hayatabad', 'Brother Juice Bilal Market Hay', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('206', '217', 'P-2 Caffe Pizzaro Hayatabad', 'Caffe Pizzaro Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('207', '218', 'P-2 City Mart Store Hayatabad ', 'City Mart Store Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('208', '219', 'P-2 D Watson Pda Hayatabad', 'D Watson Pda Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('209', '220', 'P-2 Engineer Juice Hayatabad', 'Engineer Juice Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('210', '221', 'P-2 Hash Mart Hayatabad', 'Hash Mart Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('211', '222', 'P-2 Hayatabad Pizza', 'Hayatabad Pizza', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('212', '223', 'P-2 Hyper Mall Ring Road Peshawar', 'Hyper Mall Ring Road Peshawar', 'Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Peshawar', '0', '', NULL, '0', NULL, NULL),
('213', '224', 'P-2 Ihsan Juice Hayatabad', 'Ihsan Juice Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('214', '225', 'P-2 Insaf Juice Bilal Market Hayatabad', 'Insaf Juice Bilal Market Hayat', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('215', '226', 'P-2 Jan Bakery Nasir Bagh Road ( Waves )', 'Jan Bakery Nasir Bagh Road', 'Nasir Bagh Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Nasir Bagh Peshawar', '0', '', NULL, '0', NULL, NULL),
('216', '227', 'P-2 Khyber Store Hayatabad', 'Khyber Store Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('217', '228', 'P-2 Kokany Foods Hayatabad', 'Kokany Foods Hayatabad', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('218', '229', 'P-2 Nigarhar Juice Hayatabad', 'Nigarhar Juice Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('219', '230', 'P-2 On TheWay Store Hayatabad', 'On Theway Store Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('220', '231', 'P-2 Pick N Save Super Market Hayatabad  (1 Waves )', 'Pick N Save Super Market Hayat', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('221', '232', 'P-2 Shah Store Hayatabad', 'Shah Store Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('222', '240', 'P-2 Spotage Pizza Hayatabad', 'Spotage Pizza Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('223', '241', 'P-2 Super Value Store Hayatabad', 'Super Value Store Hayatabad', 'Hayatabad ', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad ', '0', '', NULL, '0', NULL, NULL),
('224', '242', 'P-2 The Wall Mart Hayatabad ( 1 V Line )', 'The Wall Mart Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('225', '243', 'P-2 Top N Town Peshawar ( V Line 1)', 'Top N Town Peshawar Hayatabad', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('226', '244', 'P-2 Usama Juice Hayatabad ', 'Usama Juice Hayatabad', 'Hayatabad', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad', '0', '', NULL, '0', NULL, NULL),
('227', '245', 'P-2 Wadood Sons Pda Hayatabad', 'Wadood Sons Pda Hayatabad', 'Hayatabad Peshawar', '3', '3', 'DEF', '1', '', '4025', '1013', '4025', '1', 'Hayatabad Peshawar', '0', '', NULL, '0', NULL, NULL),
('228', '246', 'P-2 Wah Khan Pizza Hayatabad', 'Wah Khan Pizzza Hayataba', '', '8', '2', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('229', '247', 'KHI- IHSAN ULLAH KARACHI', 'IHSAN ULLAH KARACHI', 'KARACHI', '10', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI', '0', '', NULL, '0', NULL, NULL);

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
  `opening` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `discount1` double NOT NULL,
  `discount2` double NOT NULL,
  `disc1` double NOT NULL,
  `disc2` double NOT NULL,
  `cheque_date` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `text_1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `text_2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cheque_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `debtor_no` (`debtor_no`,`branch_code`),
  KEY `tran_date` (`tran_date`),
  KEY `order_` (`order_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans` ###

INSERT INTO `0_debtor_trans` VALUES
('2', '0', '0', '37', '37', '2017-10-03', '0000-00-00', 'JV002/10/2017', '0', '0', '-70815', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('3', '0', '0', '37', '37', '2017-10-03', '0000-00-00', 'JV003/10/2017', '0', '0', '-10', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('4', '0', '0', '12', '12', '2017-10-03', '0000-00-00', 'JV004/10/2017', '0', '0', '-70825', '0', '0', '0', '0', '0', '0', '0', '1', NULL, '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('1', '10', '0', '36', '36', '2017-06-30', '2017-08-09', 'SI001/06/2017', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('2', '10', '0', '36', '36', '2017-06-30', '2017-07-10', 'SI002/06/2017', '4', '2', '12500', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('3', '10', '0', '152', '146', '2017-06-30', '2017-06-30', 'SI001/10/2017', '2', '3', '11160', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('4', '10', '0', '136', '133', '2017-10-01', '2017-11-10', 'SI002/10/2017', '2', '4', '98490', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('5', '10', '0', '37', '37', '2017-10-01', '2017-11-10', 'SI003/10/2017', '4', '5', '70825', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('6', '10', '0', '142', '139', '2017-10-01', '2017-11-10', 'SI004/10/2017', '2', '6', '108433', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('7', '10', '0', '115', '115', '2017-10-01', '2017-11-10', 'SI005/10/2017', '4', '7', '47450', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('8', '10', '0', '12', '12', '2017-10-01', '2017-11-10', 'SI006/10/2017', '12', '8', '94647', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '9464.7', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('9', '10', '0', '15', '15', '2017-06-30', '2017-07-15', 'SI003/06/2017', '7', '9', '56277', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('10', '10', '0', '20', '20', '2017-06-30', '2017-07-10', 'SI004/06/2017', '7', '10', '15067', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '753.35', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('11', '10', '0', '91', '91', '2017-06-30', '2017-08-09', 'SI005/06/2017', '1', '11', '55487', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('12', '10', '0', '122', '121', '2017-06-30', '2017-08-09', 'SI006/06/2017', '4', '12', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('13', '10', '0', '122', '121', '2017-07-01', '2017-11-11', 'SI001/07/2017', '4', '13', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('14', '10', '0', '122', '121', '2017-07-01', '2017-08-10', 'SI002/07/2017', '3', '14', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('15', '10', '0', '122', '121', '2017-06-30', '2017-10-02', 'SI007/06/2017', '3', '16', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('16', '10', '0', '122', '121', '2017-06-30', '2017-10-02', 'SI008/06/2017', '3', '17', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('17', '10', '0', '148', '144', '2017-06-30', '2017-06-30', 'SI009/06/2017', '2', '18', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('18', '10', '0', '28', '28', '2017-10-02', '2017-11-12', 'SI007/10/2017', '7', '19', '1710', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('19', '10', '0', '14', '14', '2017-10-02', '2017-10-03', 'SI008/10/2017', '7', '20', '9260', '0', '0', '0', '0', '0', '9260', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('20', '10', '0', '225', '214', '2017-10-02', '2017-10-03', 'SI009/10/2017', '7', '21', '3960', '0', '0', '0', '0', '0', '3960', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '360', '0', '0', '0020-00-00', '', '', '0', ''),
('21', '10', '0', '193', '183', '2017-10-02', '2017-10-03', 'SI010/10/2017', '7', '22', '36864', '0', '0', '0', '0', '0', '36864', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0020-00-00', '', '', '0', ''),
('1', '12', '0', '122', '121', '2017-06-30', '0000-00-00', 'CP001/06/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '0', '0', '0', '0'),
('2', '12', '0', '122', '121', '2017-06-30', '0000-00-00', 'CP002/06/2017', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '0', '0', '0', '0'),
('3', '12', '0', '14', '14', '2017-10-02', '0000-00-00', 'CP001/10/2017', '0', '0', '9260', '0', '0', '0', '0', '0', '9260', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '0', '0', '0', '0'),
('4', '12', '0', '225', '214', '2017-10-02', '0000-00-00', 'CP002/10/2017', '0', '0', '3960', '0', '0', '0', '0', '0', '3960', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '0', '0', '0', '0'),
('5', '12', '0', '193', '183', '2017-10-02', '0000-00-00', 'CP003/10/2017', '0', '0', '36864', '0', '0', '0', '0', '0', '36864', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '0', '0', '0', '0'),
('1', '13', '1', '36', '36', '2017-06-30', '2017-08-09', 'auto', '4', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('2', '13', '1', '36', '36', '2017-06-30', '2017-07-10', 'auto', '4', '2', '12500', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('3', '13', '3', '152', '146', '2017-10-01', '2017-11-10', 'auto', '2', '3', '11160', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('4', '13', '1', '136', '133', '2017-10-01', '2017-11-10', 'auto', '2', '4', '98490', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('5', '13', '1', '37', '37', '2017-10-01', '2017-11-10', 'auto', '4', '5', '70825', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('6', '13', '1', '142', '139', '2017-10-01', '2017-11-10', 'auto', '2', '6', '108433', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('7', '13', '1', '115', '115', '2017-10-01', '2017-11-10', 'auto', '4', '7', '47450', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('8', '13', '1', '12', '12', '2017-10-01', '2017-11-10', 'auto', '12', '8', '94647', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '9464.7', '0', '0', '0', '', '', '', '', ''),
('9', '13', '1', '15', '15', '2017-06-30', '2017-07-15', 'auto', '7', '9', '56277', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('10', '13', '1', '20', '20', '2017-06-30', '2017-07-10', 'auto', '7', '10', '15067', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '753.35', '0', '0', '0', '', '', '', '', ''),
('11', '13', '1', '91', '91', '2017-06-30', '2017-08-09', 'auto', '1', '11', '55487', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('12', '13', '1', '122', '121', '2017-06-30', '2017-08-09', 'auto', '4', '12', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('13', '13', '1', '122', '121', '2017-07-01', '2017-11-11', 'auto', '4', '13', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('14', '13', '1', '122', '121', '2017-07-01', '2017-08-10', 'auto', '3', '14', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('15', '13', '1', '122', '121', '2017-06-30', '2017-10-02', 'auto', '3', '16', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('16', '13', '1', '122', '121', '2017-06-30', '2017-10-02', 'auto', '3', '17', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('17', '13', '1', '148', '144', '2017-06-30', '2017-06-30', 'auto', '2', '18', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('18', '13', '1', '28', '28', '2017-10-02', '2017-11-12', 'auto', '7', '19', '1710', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('19', '13', '1', '14', '14', '2017-10-02', '2017-10-03', 'auto', '7', '20', '9260', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', ''),
('20', '13', '1', '225', '214', '2017-10-02', '2017-10-03', 'auto', '7', '21', '3960', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '360', '0', '0', '', '', '', '', ''),
('21', '13', '1', '193', '183', '2017-10-02', '2017-10-03', 'auto', '7', '22', '36864', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '', '', '', '', '');

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
  `units_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text1` int(11) NOT NULL,
  `text2` int(11) NOT NULL,
  `text3` int(11) NOT NULL,
  `text4` int(11) NOT NULL,
  `text5` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `amount3` double NOT NULL,
  `amount4` double NOT NULL,
  `amount5` double DEFAULT NULL,
  `amount6` double DEFAULT NULL,
  `date1` date NOT NULL,
  `date2` date NOT NULL,
  `date3` date NOT NULL,
  `combo1` int(11) NOT NULL,
  `combo2` int(11) NOT NULL,
  `combo3` int(11) NOT NULL,
  `combo4` int(11) DEFAULT NULL,
  `combo5` int(11) DEFAULT NULL,
  `combo6` int(11) DEFAULT NULL,
  `opening` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  KEY `src_id` (`src_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans_details` ###

INSERT INTO `0_debtor_trans_details` VALUES
('1', '1', '13', 'OB', 'Opening Balance Equity', '0', '0', '12500', '0', '0', '12500', '1', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('2', '1', '10', 'OB', 'Opening Balance Equity', '0', '0', '12500', '0', '0', '0', '1', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('3', '2', '13', 'OB', 'Opening Balance Equity', '12500', '0', '1', '0', '0', '1', '2', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('4', '2', '10', 'OB', 'Opening Balance Equity', '12500', '0', '1', '0', '0', '0', '3', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('5', '3', '13', 'OB', 'Opening Balance Equity', '11160', '0', '1', '0', '0', '1', '3', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('6', '3', '10', 'OB', 'Opening Balance Equity', '11160', '0', '1', '0', '0', '0', '5', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('7', '4', '13', 'OB', 'Opening Balance Equity', '98490', '0', '1', '0', '0', '1', '4', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('8', '4', '10', 'OB', 'Opening Balance Equity', '98490', '0', '1', '0', '0', '0', '7', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('9', '5', '13', 'OB', 'Opening Balance Equity', '70825', '0', '1', '0', '0', '1', '5', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('10', '5', '10', 'OB', 'Opening Balance Equity', '70825', '0', '1', '0', '0', '0', '9', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('11', '6', '13', 'OB', 'Opening Balance Equity', '108433', '0', '1', '0', '0', '1', '6', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('12', '6', '10', 'OB', 'Opening Balance Equity', '108433', '0', '1', '0', '0', '0', '11', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('13', '7', '13', 'OB', 'Opening Balance Equity', '47450', '0', '1', '0', '0', '1', '7', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('14', '7', '10', 'OB', 'Opening Balance Equity', '47450', '0', '1', '0', '0', '0', '13', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('15', '8', '13', 'OB', 'Opening Balance Equity', '94647', '0', '1', '0', '0', '1', '8', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('16', '8', '10', 'OB', 'Opening Balance Equity', '94647', '0', '1', '0', '0', '0', '15', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('17', '9', '13', 'OB', 'Opening Balance Equity', '56277', '0', '1', '0', '0', '1', '9', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('18', '9', '10', 'OB', 'Opening Balance Equity', '56277', '0', '1', '0', '0', '0', '17', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('19', '10', '13', 'OB', 'Opening Balance Equity', '15067', '0', '1', '0', '0', '1', '10', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('20', '10', '10', 'OB', 'Opening Balance Equity', '15067', '0', '1', '0', '0', '0', '19', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('21', '11', '13', 'OB', 'Opening Balance Equity', '55487', '0', '1', '0', '0', '1', '11', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('22', '11', '10', 'OB', 'Opening Balance Equity', '55487', '0', '1', '0', '0', '0', '21', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, ''),
('23', '12', '13', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '12', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('24', '12', '10', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '23', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('25', '13', '13', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '13', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('26', '13', '10', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '25', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('27', '14', '13', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '14', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('28', '14', '10', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '27', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('29', '15', '13', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '16', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('30', '15', '10', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '29', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('31', '16', '13', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '17', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('32', '16', '10', 'OB', 'Opening Balance Equity', '10150', '0', '0', '0', '0', '0', '31', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('33', '17', '13', 'OB', 'Opening Balance Equity', '88261', '0', '0', '0', '0', '0', '18', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('34', '17', '10', 'OB', 'Opening Balance Equity', '88261', '0', '0', '0', '0', '0', '33', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('35', '18', '13', 'Fg10031', '18 Piece Chicken Seekh Kabab', '355', '0', '2', '0', '100.4', '2', '19', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('36', '18', '13', 'FG1007', 'Chicken Sausages', '200', '0', '5', '0', '55.58', '5', '20', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('37', '18', '10', 'Fg10031', '18 Piece Chicken Seekh Kabab', '355', '0', '2', '0', '100.4', '0', '35', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('38', '18', '10', 'FG1007', 'Chicken Sausages', '200', '0', '5', '0', '55.58', '0', '36', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('39', '19', '13', 'FG10030', 'Beef Kofta 12 pieces', '170', '0', '20', '0', '73.76', '20', '21', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('40', '19', '13', 'FG10038', 'Chicken Kofta 12 pieces', '170', '0', '20', '0', '96.45', '20', '22', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('41', '19', '13', 'FG1001', 'Frankfurter sausages', '190', '0', '6', '0', '81.36', '6', '23', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('42', '19', '13', 'FG1007', 'Chicken Sausages', '220', '0', '6', '0', '55.58', '6', '24', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('43', '19', '10', 'FG10030', 'Beef Kofta 12 pieces', '170', '0', '20', '0', '73.76', '0', '39', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('44', '19', '10', 'FG10038', 'Chicken Kofta 12 pieces', '170', '0', '20', '0', '96.45', '0', '40', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('45', '19', '10', 'FG1001', 'Frankfurter sausages', '190', '0', '6', '0', '81.36', '0', '41', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('46', '19', '10', 'FG1007', 'Chicken Sausages', '220', '0', '6', '0', '55.58', '0', '42', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('47', '20', '13', 'FG1001', 'Frankfurter sausages', '180', '0', '22', '0', '81.36', '22', '25', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('48', '20', '10', 'FG1001', 'Frankfurter sausages', '180', '0', '22', '0', '81.36', '0', '47', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('49', '21', '13', 'Fg10035', 'Chicken Shami Kabab', '162', '0', '15', '0', '38.12', '15', '26', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('50', '21', '13', 'Fg10031', '18 Piece Chicken Seekh Kabab', '383', '0', '12', '0', '100.4', '12', '27', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('51', '21', '13', 'Fg10036', 'Chicken Kofta Small', '179', '0', '12', '0', '43.42', '12', '28', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('52', '21', '13', 'FG1007', 'Chicken Sausages', '260', '0', '15', '0', '55.58', '15', '29', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('53', '21', '13', 'FG1001', 'Frankfurter sausages', '235', '0', '15', '0', '81.36', '15', '30', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('54', '21', '13', 'FG1006', 'Hunter Sausages', '235', '0', '15', '0', '80.2', '15', '31', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('55', '21', '13', 'FG10024', 'Small Beef seekh Kabab', '179', '0', '12', '0', '42.39', '12', '32', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('56', '21', '13', 'Fg10032', '7 Piece Chicken Seek Kabab', '166', '0', '12', '0', '37.31', '12', '33', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('57', '21', '13', 'FG10041', 'Euro Chicken Nuggets Economy', '459', '0', '12', '0', '119.68', '12', '34', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('58', '21', '13', 'FG10040', 'Small Chicken  Nuggets', '170', '0', '12', '0', '29', '12', '35', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('59', '21', '13', 'FG10037', 'Economy Chicken Kofta', '421', '0', '12', '0', '111.16', '12', '36', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('60', '21', '10', 'Fg10035', 'Chicken Shami Kabab', '162', '0', '15', '0', '38.12', '0', '49', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('61', '21', '10', 'Fg10031', '18 Piece Chicken Seekh Kabab', '383', '0', '12', '0', '100.4', '0', '50', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('62', '21', '10', 'Fg10036', 'Chicken Kofta Small', '179', '0', '12', '0', '43.42', '0', '51', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('63', '21', '10', 'FG1007', 'Chicken Sausages', '260', '0', '15', '0', '55.58', '0', '52', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('64', '21', '10', 'FG1001', 'Frankfurter sausages', '235', '0', '15', '0', '81.36', '0', '53', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('65', '21', '10', 'FG1006', 'Hunter Sausages', '235', '0', '15', '0', '80.2', '0', '54', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('66', '21', '10', 'FG10024', 'Small Beef seekh Kabab', '179', '0', '12', '0', '42.39', '0', '55', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('67', '21', '10', 'Fg10032', '7 Piece Chicken Seek Kabab', '166', '0', '12', '0', '37.31', '0', '56', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('68', '21', '10', 'FG10041', 'Euro Chicken Nuggets Economy', '459', '0', '12', '0', '119.68', '0', '57', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('69', '21', '10', 'FG10040', 'Small Chicken  Nuggets', '170', '0', '12', '0', '29', '0', '58', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', ''),
('70', '21', '10', 'FG10037', 'Economy Chicken Kofta', '421', '0', '12', '0', '111.16', '0', '59', NULL, '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('2', 'Imtiaz Store', 'Imtiaz Store', 'Karachi', '', '', 'PKR', '3', '0', '0', '1', '5', '0', '0', '0', '', '0', NULL),
('3', 'jalal sons', 'jalal sons', NULL, '', '', 'PKR', '1', '0', '0', '1', '3', '0', '0', '0', '', '0', NULL),
('4', 'Avon Super Store', 'Avon psh', 'Spogmai Plaza , Jamrud Road Peshawar', '', '', 'PKR', '1', '0', '0', '1', '3', '0.05', '0', '150000', '', '0', NULL),
('5', 'Avon Super Store', 'avon', NULL, '', '', 'PKR', '1', '0', '0', '1', '3', '0.1', '0', '100000', '', '0', NULL),
('6', 'Serena Hotel Islamabad', 'Serena Islamabad', NULL, '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', NULL),
('7', '9 To Eleven Store', '9 To Eleven Store', 'Peshawar', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('8', 'SHAYAN STORE ', 'SHAYAN STORE ', 'Peshawar', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', NULL),
('9', 'Yum PIZZA ', 'Yum PIZZA ', 'Pesahwar', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', NULL),
('10', 'Seven 11 Store ', 'Seven 11 Store ', 'Hayatabad', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', NULL),
('11', 'P- 1 9 to Eleven Store', 'P-1 9 to Eleven Store', 'Peshawar', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('12', ' P-1 AL-FATAH ', ' P-1 AL-FATAH ', 'PESHAWAR', '', '', 'PKR', '12', '0', '0', '1', '7', '0.1', '0', '50000', '', '0', '75000'),
('13', 'P-1 CHIEF BURGER ', 'P-1 CHIEF BURGER ', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('14', 'P-1 CP STORE  (1 V LINE)', 'P-1 CP STORE  (1 V LINE)', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('15', ' P-1 DAY &amp; NIGHT STORE (1 WAVES)', ' P-1 DAY &amp; NIGHT STORE (1 ', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('16', 'P-1 CSD', 'P-1 CSD', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('17', 'P-1 ENTER MART ', 'P-1 ENTER MART ', ' WARSAK ROAD PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('18', 'P-1 FAMILY STORE', 'P-1 FAMILY STORE', 'KOHAT ROAD PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('19', 'P-1 GREEN MART ', 'P-1 GREEN MART ', 'SADDAR PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('20', ' P-1 GUL COOL SPOT (1STAND FREEZER)', ' P-1 GUL COOL SPOT (1STAND FRE', 'UNIVERSITY ROAD PESHAWAR', '', '', 'PKR', '7', '0', '0', '1', '3', '0.05', '0', '10000', '', '0', '20000'),
('21', 'P-1 ITALIAN PIZZA', 'P-1 ITALIAN PIZZA', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('22', 'P-1 JAN SHOPING GULBAHAR', 'P-1 JAN SHOPING GULBAHAR', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('23', 'P-1 KING &amp; QUEEN PIZZA', 'P-1 KING &amp; QUEEN PIZZA', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('24', 'P-1 M MART (I WAVES)', 'P-1 M MART (I WAVES)', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('25', 'P-1 MEAT SHOP SHAHEEN', 'P-1 MEAT SHOP SHAHEEN', 'UNIVERSITY TOWN PEHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('26', 'P-1 NAN SENS CAFFE', 'P-1 NAN SENS CAFFE', 'PESHAWAR ', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('27', 'P-1 NIAZ SB', 'P-1 NIAZ SB', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('28', 'P-1 POTATO PLUS (P1P2) I HOT TOP', 'P-1 POTATO PLUS (P1P2) I HOT T', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('29', 'P-1 RAHAT BAKERY', 'P-1 RAHAT BAKERY', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('30', 'P-1 S MART STORE (1 FREEZER SMALL)', 'P-1 S MART STORE (1 FREEZER SM', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('31', 'P-1 SHAHEEN AIRLINE ', 'P-1 SHAHEEN AIRLINE ', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('32', 'P-1 SHAHEEN SUPER STORE(1 WAVES)', 'P-1 SHAHEEN SUPER STORE(1 WAVE', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('33', 'P-1 TIME PHARMACY (1 CANDY)', 'P-1 TIME PHARMACY (1 CANDY)', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('34', 'P-1 YUMMS PIZZA ', 'P-1 YUMMS PIZZA ', 'PESHAWAR', '', '', 'PKR', '1', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('35', 'ISD- H AFGHAN BURGER ', 'ISD- H AFGHAN BURGER ', 'ISLAMABAD', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('36', 'ISD- H AFGHAN BURGER F10', 'ISD- H AFGHAN BURGER F10', 'ISLAMABAD', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('37', ' ISD-H ARIF TRADER', ' ISD-H ARIF TRADER', 'ISLAMABAD', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('38', 'ISD -H AL-HILAL STORE', 'ISD H- AL-HILAL STORE', 'ISLAMABAD', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('39', 'ISD-H  BAIYA PIZZA', 'ISD-H  BAIYA PIZZA', 'GUJRAT', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('40', 'ISD-H BASHIR GILGAT', 'ISD-H BASHIR GILGAT', 'ISLAMABAD', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('41', 'Euro Shop HO', 'Head Office', 'Plot 111 Hayatabad Peshawar', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('42', 'Gate Sales ', 'Gates Sales', 'Plot 111 Hayatabad', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('43', 'ISD-H Afghani Burger Islamabad', 'Afghani Burger', 'Islamabad', '', '', 'PKR', '6', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('44', 'ISD-H Burger Party Islamabad', 'Burger Party Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('45', 'ISD-H Crown Plaza Islamabad', 'Crown Plaza Islamabad', 'Islamabad', '', '', 'PKR', '6', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('46', 'ISD-H Margala hotel Islamabad', 'Margala hotel Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('47', 'ISD-H Papa Saleh Islamabad', 'Papa Saleh Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('48', 'ISD-H Papa Saleh Rawalpindi', 'Papa Saleh Rawalpindi', 'Rawalpindi', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('49', 'ISD-H Pia Cattring Islamabad', 'Pia Cattring Islamabad', 'Islamabad', '', '', 'PKR', '4', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('50', 'ISD-H Pizza Fort Islamabad', 'Pizza Fort Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('51', 'ISD-H QFF Islamabad', 'QFF Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('52', 'ISD-H Rahat Bakers Adyala Rawalpindi', 'Rahat Bakers Adyala Rawalpindi', 'Rawalpindi', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('53', 'ISD-H Rahat Bakers Barakoh Islamabad', 'Rahat bakers barakoh Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('54', 'ISD-H Rahat Bakers F 11 Islamabad', 'Rahat Bakers F 11 Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('55', 'ISD-H Rahat Bakers PAF Islamabad', 'Rahat Bakers PAF Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('56', 'ISD-H Rahat Bakers F10 Islamabad', 'Rahat Bakers F10 Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('57', 'ISD-H Rahat Bakers G 11 Islamabad', 'Rahat Bakers  G 11 Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('58', 'ISD-H Rahat Bakers Godra Rawalpindi', 'Rahat Bakers Godra Rawalpindi', 'Rawalpindi', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('59', 'ISD-H Rahat Bakers I 8 Islamabad', 'Rahat Bakers I8 Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('60', 'ISD-H Serina Hotel Islamabad', 'Serina Hotel Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('61', 'ISD-H Tehzeeb Bakery Islamabad', 'Tehzeeb Bakery Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('62', 'ISD-H Unique Foods Islamabad', 'Unique Foods Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('63', 'ISD-H Western Global Services Islamabad', 'Western Global Services Isb', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('64', 'ISD-H Zia &amp; Sons Islamabad', 'Zia &amp; Sons Islamabad', 'Islamabad', '', '', 'PKR', '4', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('65', 'ISD-R Alfatah Store Islamabad', 'Alfatah Store Islamabad ( ZM )', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('66', 'ISD-R Bachat Mall Sector B Askari 14 RWP', 'Bachat Mall Sector B Askari 14', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('67', 'ISD-R Best Price Islamabad', 'Best Price Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('68', 'ISD-R Csd Store Rawalpindi', 'Csd Store Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('69', 'ISD-R CSD Westirage Rawalpindi', 'CSD Westirage Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('70', 'ISD-R D Watson BK Islamabad (1Frezer)', 'D Wastson BK Islamabad ', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('71', 'ISD-R E Mart Hall View  Road ( 1Freezer)', 'E Mart Hall View Road Islamaba', NULL, '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('72', 'ISD-R Empire Mart A/S Rawalpindi (1Freezer)', 'Empire Mart A/S Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('73', 'ISD-R Galaini Mart Adyala Rawalpindi', 'Galaini Mart Adyala Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('74', 'ISD-R HM Store Islamabad', 'HM Store Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('75', 'ISD-R J Mart Dha Islamabad ( 1 Freezer)', 'J Mart  Dha Islamabad', 'Islamabad ', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('76', 'ISD-R Khushabo Cash In Carry Islamabad', 'Khusbo Cash In Carry Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('77', 'ISD-R Leader Price Pakistan Town (1 Freezer)', 'Leader Price Pakistan Town Isb', 'Islamabad ', '', '', 'PKR', '7', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('78', 'ISD-R Luft Store Pwd Islamabad', 'Luft Store Pwd Islamabad', 'Islamabad', '', '', 'PKR', '8', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('79', 'ISD-R M Mart Islamabad', 'M Mart Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('80', 'ISD-R Maac Mart Islamabad ( Freezer)', 'Maac Mart Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('81', 'ISD-R Maf Hyper Star Islamabad', 'Maf Hyper Star Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('82', 'ISD-R Mcc Airport Rawalpindi (Frezer)', 'Mcc Airport Rawalindi ', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('83', 'ISD-R Mcc Comerical Mkt Rawalpindi ( 1 Freezer )', 'Mcc Comerical Mkt Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('84', 'ISD-R Mcc F 11 Islamabad', 'Mcc F 11 Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('85', 'ISD-R Mcc Gujar Khan Rwp ( Freezer )', 'Mcc Gujar Khan Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('86', 'ISD-R Mcc I 8 Islamabad ( 1Freezer )', 'Mcc I 8 Islamabad ', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('87', 'ISD-R Mcc Khana Pul Rawalpindi', 'Mcc Khana Pul Rawalindi ', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('88', 'ISD-R Mcc Store G9 Islamabad', 'Mcc Store G9 Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('89', 'ISD-R Mcc Taramari Islamabad', 'Mcc Taramari Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('90', 'ISD-R Metro Cash In Carry Islamabad', 'Metro Cash In Carry Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('91', 'ISD-R Pcc Barakoh Islamabad', ' Pcc Barakoh Islamabad', NULL, '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('92', 'ISD-R Pcc Commette Chowk Rawalpindi', 'Pcc Commette Chowk Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('93', 'ISD-R Pcc G9 Islamabad ( 1Freezer )', 'Pcc G9 Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('94', 'ISD-R Pcc Range Road Rawalpindi ', 'Pcc Range Road Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('95', 'ISD-R Save Mart Rawat Rawalpindi ( 1 Freezer )', 'Save Mart Rawat Rawalpindi', 'Rawalpindi', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('96', 'ISD-R Shaheen Chemist I 8 Islamabad', 'Shaheen Chemist I 8 Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('97', 'ISD-R Shaheen Grocer F7 Islamabad', 'Shaheen Grocer F7 Islamabad', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('98', 'ISD- Free Scheme Islamabad', 'Islamabad Free Scheme ', 'Islamabad', '', '', 'PKR', '1', '1', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('99', 'LHR-H Afc Burawala Lahore', 'Afc Burawala Lahore', 'Lahore', '', '', 'PKR', '1', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('100', 'LHR-H Arbaz Mailk Lahore', 'Arbaz Mailk Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('101', 'LHR-H Babar Sb Lahore', 'Babar Sb Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('102', 'LHR-H Buttler Caffe Lahore', 'Buttler Caffe Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('103', 'LHR-H Caffe Pizzaro Lahore', 'Caffe Pizzaro Lahore', 'Lahore', '', '', 'PKR', '1', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('104', 'LHR-H Cock N Bull Lahore', 'Cock N Bull Lahore', 'Lahore', '', '', 'PKR', '1', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('105', 'LHR-R Delish Pizza Lahore', 'Delish Pizza Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('106', 'LHR-R Friender Pizza Lahore', 'Friender Pizza Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('107', 'LHR-R Galitos Hotel Lahore', 'Galitos Hotel Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('108', 'LHR-H Ginos Pizza Johar Town Lahore', 'Ginos Pizza Johar Town Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('109', 'LHR-H Irfan Multan', 'Irfan Multan', 'Multan', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('110', 'LHR-R Itlaian Pizza Punjab Society Lahore', 'Itlaian Pizza Punjab Society L', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('111', 'LHR-H Jameel Sb Lahore', 'Jameel Sb LAhore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('112', 'LHR-H King &amp; Queen Lahore', 'King &amp; Queen Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('113', 'LHR-H Maro Tandur Lahore', 'Maro Tandur Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('114', 'LHR-H Master Pizza W/T Lahore', 'Master Pizza Wapda Town Lhr', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('115', 'LHR-H Mozaraella Resturant 27 Lahore', ' Mozaraella Resturant 27Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('116', 'LHR-H Nishat Hotel Lahore', 'Nishat Hotel Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('117', 'LHR-H Parkland Hotel Lahore', 'Parkland Hotel Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('118', 'LHR-H Pizza &amp; Pizza Fortress Lahore', 'Pizza &amp; Pizza Fortress Lah', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('120', 'LHR-H Pizza 21 Lahore', 'Pizza 21 Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('121', 'LHR-H Pizza Channel F/T Lahore', 'Pizza Channel F/T Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('122', 'LHR-H Pizza Channel W/T Lahore', ' Pizza Channel W/T Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('123', 'LHR-H Pizza Company Lahore', 'Pizza Company Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('124', 'LHR-H Pizza House Lahore', 'Pizza House Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('125', 'LHR-H Pizza Point Lahore', 'Pizza Point Lahore', 'Lahore', '', '', 'PKR', '4', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('126', 'LHR-H Rajpoot Traders Lahore', 'Rajpoot Trades Lahore', 'Lahore', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('128', 'LHR-H Popo Pizza Lahore', 'Popo Pizza Lahore', 'Lahore', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('129', 'LHR-H Spice Cattring Lahore', 'Spice Cattring Lahore', 'Lahore', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('131', 'LHR-H Usman &amp; Co Lahore', 'Usman &amp; Co Lahore', 'Lahore', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('132', 'LHR-H Wahid Foods Lahore', 'Wahid Foods Lahore', ' Lahore', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('133', 'LHR-H Waqas Gujrat ', 'Waqas Gujrat', 'Gujrat', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('134', 'LHR-H Waves 21 Lahore', 'Waves 21 Lahore', 'Lahore', '', '', 'PKR', '3', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('135', 'LHR-H Flates Hotel Lahore', 'Flates Hotel Lahore', 'Lahore ', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('136', 'LHR-H Holiday Inn Hotel Lahore', ' Holiday Inn Lahhore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('137', 'LHR-I Maf Hyper Star Emporium Lahore', 'Maf Hyper Star Emporium Lahore', NULL, '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('138', 'LHR-H Maf Hyper Star Fotress  Lahore', 'Maf Hyper Star Fotress  Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('139', 'LHR-H Maf Hyper Star Packages  Lahore', 'Maf Hyper Star Package  Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('140', 'LHR-I Metro Cash In Carry Dha Lahore', 'Metro Cash In Carry Dha Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('141', 'LHR-R Metro Cash In Carry Link Road Lahore', 'Metro Cash In Carry Link Road ', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('142', 'LHR-R Metro Cash In Carry Multan  Road Lahore', ' Metro Cash In Carry Multan Rd', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('144', 'LHR-I Subway Wahdat Road Lahore', 'Subway Wahdat Road Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('145', 'LHR-I Unique Foods Lahore', 'Unique Foods Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('146', 'LHR-O Imtiaz Store Gujrana Wala ', 'Imtiaz Store Gujranawala', 'Gujranawala', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('147', 'LHR-O Serina Hotel Faisalabad', 'Serina hotel Faisalabad', 'Faisalabad', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('148', 'LHR-O Zubaida Associates Faisalabad', ' Zubaida Associates Faisalabad', 'Faisalabad', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('150', 'LHR-R Broad Way Lahore', 'Broadway Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('152', 'LHR-R Csd Cavelry Lahore', ' Csd Cavelry Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('153', 'LHR-R Csd Store Mall Lahore', 'Csd Store Mall Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('154', 'LHR-R Sabari Store Lahore', 'Sabari Store Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('155', 'LHR-R ZM Store Dha Y Block Lahore', 'ZM Store Dha Y Block Lahore', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('157', 'LHR-R Zubaida Associate Hussain Chowk Lahore', 'Zubaida Associate Hussain Chow', 'Lahore', '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('159', 'LHR-R Zubaida Associate JT DD Lahore', 'Zubaida Associate JT DD Lahore', NULL, '', '', 'PKR', '2', '3', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('161', 'O-1 Akbar Mart Mardan ( 1Small )', 'Akbar Mart Mardan', 'Mardan', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('162', 'O-1 AlHaram Store ( 1CB Waves) ', 'AlHaram Store ', NULL, '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('163', 'O-1 Asain Mall GT Road Kamra ( 1 CB Waves) ', 'Asain Mall Gt Road Kamra', 'Kamra', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('164', 'O-1 Asain Mall WahCantt  ( 2 Candy Freezer )', 'Asain Mall WahCantt ', 'WahCantt', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('165', 'O-1 Asfawul Khair Store Swat ( H Top )', 'Asfawul Khair Store Swat', 'Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('166', 'O-1 Asaiyana Mart  Mardan ( 1 Waves )', 'Asaiyana Mart Mardan ', 'Asaiyana Mart Mardan', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('167', 'O-1 Best Store Hazro ( 1 V Line )', 'Best Store Hazro', 'HAZRO', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('168', 'O-1 Big B Mega Mart Swat( 1 Cb Waves )', 'Big B Mega Mart Swat', 'Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('169', 'O-1 Big Khan Mart Thana Swat ', 'Big Khan Mart Thana Swat', 'Thana Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('170', 'O-1 Cammissery Shop Kamra ( 1 V Line &amp; Chiller )', 'Cammissery Shop Kamra ', 'Kamra', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('171', 'O-1 Cammissery Shop Tarbella', 'Cammissery Shop Tarbella', 'Tarbella', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('172', 'O-1 City Mart Swat', 'City Mart Swat', 'Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('173', 'O-1 Csd Store Nowshera', 'Csd Store Nowshera', 'Nowshera', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('174', 'O-1 Fazal Super Store Swat ( 1 Small )', 'Fazal Super Store Swat', 'Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('175', 'O-1 Galaini Mart Wahcantt ( 2 V Line )', 'Galaini Mart WahCantt', 'WahCantt', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('176', 'O-1 Home Plus Shami Road Mardan ( 1 S Wave )', 'Home Plus shami Road Mardan', 'Mardan', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('177', 'O-1 Khaksar Store Nowshera ( 1 S Waves )', 'Khaksar Store Nowshera', 'Nowshera', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('178', 'O-1 Mardan Mega Mart Mardan( 1 V Line )', 'Mardan Mega Mart ', 'Mardan', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('179', 'O-1 Marina Shopping Mall WahCantt ( 1 Candy )', 'Marina Shopping Mall WahCantt', 'WahCantt', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('180', 'O-1 Moon Shopping Mall Wahcantt ( 1 Cb Wave )', 'Moon Shopping Mall WahCantt', 'WahCantt', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('181', 'O-1 Naseem Mart Attock ( 1 Candy )', 'Naseem Mart  Attock', 'Attock', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('182', 'O-1 Nesto Hyper Mall TakthBhai Sawabi', 'Nesto Hyper Mall TakthBhai', 'TakhthBhai Sawabi', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('183', 'O-1 Pso Shell Shop Mardan', 'Pso Shell Shop Mardan', 'Mardan', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('184', 'O-1 Rajpoot Mega Mall City Taxila', 'Rajpoot Mega Mall Taxila', 'Taxila', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('185', 'O-1 Rice Mart Nowshera ( 1 V Line )', 'Rice Mart Nowshera', 'Nowshera', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('186', 'O-1 Rite Bank Tarbella ', 'Rite Bank Tarbella', 'Tarbella', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('188', 'O-1 Safa Cash In Carry Taxila ( 1 Waves )', 'Safa Cash In Carry Taxila', 'Taxila', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('189', 'O-1 Serina Hotel Swat ', 'Serina Hotel Swat', 'Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('190', 'O-1 Shah Store Swat  ( 1 Waves )', 'Shah Store Swat', 'Swat', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('191', 'O-1 Tarbella Mart ( 1 Small Waves )', 'Tarbella Mart Store', 'Tarbella', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('192', 'O-1 Village Mart Charsada ( 1 Candy Freezer )', 'Village Mart Charsada', 'Charsada ', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('193', 'O-1 Zam Zama Store Attock', 'Zam Zama Store Attock', 'Attock', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('194', 'O-2 Boon Super Abbotabad ( 1 Waves )', 'Boon Super Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('195', 'O-1 City Shopper Haripur ( 1 Waves )', 'City Shopper Haripur', 'Haripur', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('196', 'O-1 Hazara Mall Havalian ( 1 Waves )', 'Hazara Mall Havalian ', 'Havalian ', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('197', 'O-2 Hotel One Abbotabad', 'Hotel One Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('198', 'O-2 Itaalian Mall Abbotabad ( 2 Waves )', 'Italian Mall Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('199', 'O-2 Italian Mall HariPur ( 1 Waves )', 'Italian Mall Haripur', 'Haripur', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('200', 'O-2 Kifayat Cash In Carry Abbotabad ( 1 Waves )', 'Kifayat Cash In Carry Abbotaba', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('201', 'O-2 Lasani Store Abbotabad', 'Lasani Store Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('202', 'O-2 M Saeed &amp; Brother Natiyagali ( 1 Hot Top)', 'M Saeed &amp; Brother Natiyaga', ' Natiyagali', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('203', 'O-2 Naan Sense  Abbotabad ', 'Naan Sense Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('204', 'O-2 Pakistan Super Store Abbotabad ', 'Pakistan Super Store Abbotabad', 'Abbotabad', '', '', 'PKR', '6', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('205', 'O-2 Rahat Bakery Abbotabad ( 1 Hot Top )', 'Rahat Bakery Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('206', 'O-2 Shaheen Store Abbotabad (1 Waves )', 'Shaheen Store Abbotabad', 'Abbotabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('208', 'O-2 Waamzz Cash In Carry Haripur (1 Waves )', 'Waamzz Cash In Carry Haripur', 'Haripur', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('209', 'P-2 AD Mart Hayatabad Peshawar', 'AD Mart Hayatabad Peshawar', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('210', 'P-2 Afridi Store Hayatabad Phase 7', 'Afridi Store Phase 7 Hayatabad', NULL, '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('211', 'P-2 Al Nazar Juice Hayatabad', 'Al Nazar Juice Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('212', 'P-2 Aziz Juice Karkhano Market', 'Aziz Juice Karkhano Market', 'Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('213', 'P-2 Baker Cusine Hayatabad ', 'Baker Cusine Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('214', 'P-2 Bilal Super Store Hayatabad', 'Bilal Super Store Hayatabad', 'Hayatabad ', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('215', 'P-2 Bread Shop Hayatabad Peshawar', 'Bread Shop Hayatabad ', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('216', 'P-2 Brother Juice Bilal Market Hayatabad', 'Brother Juice Bilal Market Hay', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('217', 'P-2 Caffe Pizzaro Hayatabad', 'Caffe Pizzaro Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('218', 'P-2 City Mart Store Hayatabad ', 'City Mart Store Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('219', 'P-2 D Watson Pda Hayatabad', 'D Watson Pda Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('220', 'P-2 Engineer Juice Hayatabad', 'Engineer Juice Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('221', 'P-2 Hash Mart Hayatabad', 'Hash Mart Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('222', 'P-2 Hayatabad Pizza', 'Hayatabad Pizza', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('223', 'P-2 Hyper Mall Ring Road Peshawar', 'Hyper Mall Ring Road Peshawar', 'Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('224', 'P-2 Ihsan Juice Hayatabad', 'Ihsan Juice Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('225', 'P-2 Insaf Juice Bilal Market Hayatabad', 'Insaf Juice Bilal Market Hayat', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('226', 'P-2 Jan Bakery Nasir Bagh Road ( Waves )', 'Jan Bakery Nasir Bagh Road', 'Nasir Bagh Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('227', 'P-2 Khyber Store Hayatabad', 'Khyber Store Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('228', 'P-2 Kokany Foods Hayatabad', 'Kokany Foods Hayatabad', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('229', 'P-2 Nigarhar Juice Hayatabad', 'Nigarhar Juice Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('230', 'P-2 On TheWay Store Hayatabad', 'On Theway Store Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('231', 'P-2 Pick N Save Super Market Hayatabad  (1 Waves )', 'Pick N Save Super Market Hayat', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('232', 'P-2 Shah Store Hayatabad', 'Shah Store Hayatabad', 'Hayatabad', '', '', 'PKR', '6', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('240', 'P-2 Spotage Pizza Hayatabad', 'Spotage Pizza Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('241', 'P-2 Super Value Store Hayatabad', 'Super Value Store Hayatabad', 'Hayatabad ', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('242', 'P-2 The Wall Mart Hayatabad ( 1 V Line )', 'The Wall Mart Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('243', 'P-2 Top N Town Peshawar ( V Line 1)', 'Top N Town Peshawar Hayatabad', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('244', 'P-2 Usama Juice Hayatabad ', 'Usama Juice Hayatabad', 'Hayatabad', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('245', 'P-2 Wadood Sons Pda Hayatabad', 'Wadood Sons Pda Hayatabad', 'Hayatabad Peshawar', '', '', 'PKR', '7', '4', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('246', 'P-2 Wah Khan Pizza Hayatabad', 'Wah Khan Pizzza Hayataba', NULL, '', '', 'PKR', '6', '0', '0', '1', '7', '0', '0', '0', '', '0', '0'),
('247', 'KHI- IHSAN ULLAH KARACHI', 'IHSAN ULLAH KARACHI', 'KARACHI', '', '', 'PKR', '1', '2', '0', '1', '7', '0', '0', '0', '', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_exchange_rates` ###

INSERT INTO `0_exchange_rates` VALUES
('2', 'USD', '105', '105', '2017-02-17');

### Structure of table `0_f_combo1` ###

DROP TABLE IF EXISTS `0_f_combo1`;

CREATE TABLE `0_f_combo1` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_f_combo1` ###


### Structure of table `0_f_combo2` ###

DROP TABLE IF EXISTS `0_f_combo2`;

CREATE TABLE `0_f_combo2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_f_combo2` ###


### Structure of table `0_f_combo3` ###

DROP TABLE IF EXISTS `0_f_combo3`;

CREATE TABLE `0_f_combo3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_f_combo3` ###


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
  `inactive` tinyint(4) NOT NULL,
  `cheque_date` date NOT NULL,
  `cheque_no` int(11) NOT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `opening` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###

INSERT INTO `0_gl_trans` VALUES
('1', '10', '2', '2017-06-30', '3012', '', '-12500', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('2', '10', '2', '2017-06-30', '1013', '', '12500', '0', '0', '2', '36', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('3', '10', '2', '2017-06-30', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('4', '10', '3', '2017-10-01', '3012', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('5', '10', '3', '2017-10-01', '1013', '', '0', '0', '0', '2', '152', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('6', '10', '3', '2017-10-01', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('7', '10', '4', '2017-10-01', '3012', '', '-98490', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('8', '10', '4', '2017-10-01', '1013', '', '98490', '0', '0', '2', '136', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('9', '10', '4', '2017-10-01', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('10', '10', '5', '2017-10-01', '3012', '', '-70825', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('11', '10', '5', '2017-10-01', '1013', '', '70825', '0', '0', '2', '37', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('12', '10', '5', '2017-10-01', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('13', '10', '6', '2017-10-01', '3012', '', '-108433', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('14', '10', '6', '2017-10-01', '1013', '', '108433', '0', '0', '2', '142', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('15', '10', '6', '2017-10-01', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('16', '10', '7', '2017-10-01', '3012', '', '-47450', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('17', '10', '7', '2017-10-01', '1013', '', '47450', '0', '0', '2', '115', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('18', '10', '7', '2017-10-01', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('19', '10', '8', '2017-10-01', '3012', '', '-94647', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('20', '10', '8', '2017-10-01', '1013', '', '85182.3', '0', '0', '2', '12', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('21', '10', '8', '2017-10-01', '4025', '', '9464.7', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('22', '10', '8', '2017-10-01', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('23', '10', '9', '2017-06-30', '3012', '', '-56277', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('24', '10', '9', '2017-06-30', '1013', '', '56277', '0', '0', '2', '15', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('25', '10', '9', '2017-06-30', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('26', '10', '10', '2017-06-30', '3012', '', '-15067', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('27', '10', '10', '2017-06-30', '1013', '', '14313.65', '0', '0', '2', '20', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('28', '10', '10', '2017-06-30', '4025', '', '753.35', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('29', '10', '10', '2017-06-30', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('30', '10', '11', '2017-06-30', '3012', '', '-55487', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('31', '10', '11', '2017-06-30', '1013', '', '55487', '0', '0', '2', '91', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('32', '10', '11', '2017-06-30', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('33', '12', '1', '2017-06-30', '10122', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('34', '12', '2', '2017-06-30', '10122', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('35', '20', '1', '2017-06-30', '2011', '', '-36547', '0', '0', '3', '3', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('36', '20', '1', '2017-06-30', '3012', '', '36547', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('37', '17', '1', '2017-10-01', '5014', '', '-130130', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('38', '17', '1', '2017-10-01', '1022', '', '130130', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('39', '17', '1', '2017-10-01', '5014', '', '-2731515.71', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('40', '17', '1', '2017-10-01', '1022', '', '2731515.71', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('41', '17', '2', '2017-10-01', '5014', '', '-72491.76', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('42', '17', '2', '2017-10-01', '1024', '', '72491.76', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('43', '17', '2', '2017-10-01', '5014', '', '-10524.29', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('44', '17', '2', '2017-10-01', '1024', '', '10524.29', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('45', '17', '2', '2017-10-01', '5014', '', '-15933.93', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('46', '17', '2', '2017-10-01', '1024', '', '15933.93', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('47', '17', '2', '2017-10-01', '5014', '', '-5911.86', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('48', '17', '2', '2017-10-01', '1024', '', '5911.86', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('49', '17', '2', '2017-10-01', '5014', '', '-19568.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('50', '17', '2', '2017-10-01', '1024', '', '19568.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('51', '17', '2', '2017-10-01', '5014', '', '-26456.08', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('52', '17', '2', '2017-10-01', '1024', '', '26456.08', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('53', '17', '2', '2017-10-01', '5014', '', '-7542.45', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('54', '17', '2', '2017-10-01', '1024', '', '7542.45', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('55', '17', '2', '2017-10-01', '5014', '', '-12411.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('56', '17', '2', '2017-10-01', '1024', '', '12411.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('57', '17', '2', '2017-10-01', '5014', '', '-462.15', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('58', '17', '2', '2017-10-01', '1024', '', '462.15', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('59', '17', '2', '2017-10-01', '5014', '', '-503.01', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('60', '17', '2', '2017-10-01', '1024', '', '503.01', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('61', '17', '2', '2017-10-01', '5014', '', '-26044.25', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('62', '17', '2', '2017-10-01', '1024', '', '26044.25', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('63', '17', '2', '2017-10-01', '5014', '', '-1509.42', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('64', '17', '2', '2017-10-01', '1024', '', '1509.42', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('65', '17', '2', '2017-10-01', '5014', '', '-33832', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('66', '17', '2', '2017-10-01', '1024', '', '33832', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('67', '17', '2', '2017-10-01', '5014', '', '-147303.77', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('68', '17', '2', '2017-10-01', '1024', '', '147303.77', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('69', '17', '2', '2017-10-01', '5014', '', '-16124', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('70', '17', '2', '2017-10-01', '1024', '', '16124', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('71', '17', '2', '2017-10-01', '5014', '', '-6967.02', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('72', '17', '2', '2017-10-01', '1024', '', '6967.02', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('73', '17', '2', '2017-10-01', '5014', '', '-6923.21', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('74', '17', '2', '2017-10-01', '1024', '', '6923.21', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('75', '17', '2', '2017-10-01', '5014', '', '-15202.1', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('76', '17', '2', '2017-10-01', '1024', '', '15202.1', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('77', '17', '2', '2017-10-01', '5014', '', '-13383.56', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('78', '17', '2', '2017-10-01', '1024', '', '13383.56', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('79', '17', '2', '2017-10-01', '5014', '', '-9225', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('80', '17', '2', '2017-10-01', '1024', '', '9225', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('81', '17', '2', '2017-10-01', '5014', '', '-29184.84', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('82', '17', '2', '2017-10-01', '1024', '', '29184.84', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('83', '17', '2', '2017-10-01', '5014', '', '-42885', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('84', '17', '2', '2017-10-01', '1024', '', '42885', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('85', '17', '2', '2017-10-01', '5014', '', '-73104.6', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('86', '17', '2', '2017-10-01', '1024', '', '73104.6', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('87', '17', '2', '2017-10-01', '5014', '', '-27171.99', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('88', '17', '2', '2017-10-01', '1024', '', '27171.99', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('89', '17', '2', '2017-10-01', '5014', '', '-93773.6', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('90', '17', '2', '2017-10-01', '1024', '', '93773.6', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('91', '17', '2', '2017-10-01', '5014', '', '-29362.97', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('92', '17', '2', '2017-10-01', '1024', '', '29362.97', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('93', '17', '2', '2017-10-01', '5014', '', '-24707.43', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('94', '17', '2', '2017-10-01', '1024', '', '24707.43', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('95', '17', '2', '2017-10-01', '5014', '', '-12719.52', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('96', '17', '2', '2017-10-01', '1024', '', '12719.52', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('97', '17', '2', '2017-10-01', '5014', '', '-19350.36', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('98', '17', '2', '2017-10-01', '1024', '', '19350.36', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('99', '17', '2', '2017-10-01', '5014', '', '-20899.17', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('100', '17', '2', '2017-10-01', '1024', '', '20899.17', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('101', '17', '2', '2017-10-01', '5014', '', '-38991.16', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('102', '17', '2', '2017-10-01', '1024', '', '38991.16', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('103', '17', '2', '2017-10-01', '5014', '', '-52985.36', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('104', '17', '2', '2017-10-01', '1024', '', '52985.36', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('105', '17', '2', '2017-10-01', '5014', '', '-145530.88', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('106', '17', '2', '2017-10-01', '1024', '', '145530.88', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('107', '17', '2', '2017-10-01', '5014', '', '-50344', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('108', '17', '2', '2017-10-01', '1024', '', '50344', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('109', '17', '2', '2017-10-01', '5014', '', '-4411.12', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('110', '17', '2', '2017-10-01', '1024', '', '4411.12', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('111', '17', '2', '2017-10-01', '5014', '', '-5314.32', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('112', '17', '2', '2017-10-01', '1024', '', '5314.32', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('113', '17', '3', '2017-10-01', '5014', '', '-26344.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('114', '17', '3', '2017-10-01', '1024', '', '26344.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('115', '17', '3', '2017-10-01', '5014', '', '-10388', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('116', '17', '3', '2017-10-01', '1024', '', '10388', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('117', '17', '3', '2017-10-01', '5014', '', '-19868.7', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('118', '17', '3', '2017-10-01', '1024', '', '19868.7', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('119', '17', '3', '2017-10-01', '5014', '', '-13571.84', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('120', '17', '3', '2017-10-01', '1024', '', '13571.84', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('121', '17', '3', '2017-10-01', '5014', '', '-29415', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('122', '17', '3', '2017-10-01', '1024', '', '29415', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('123', '17', '3', '2017-10-01', '5014', '', '-23222.9', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('124', '17', '3', '2017-10-01', '1024', '', '23222.9', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('125', '0', '1', '2017-10-03', '2011', '', '36547', '0', '0', '3', '3', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('126', '0', '1', '2017-10-03', '3012', '', '-36547', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('127', '10', '3', '2017-06-30', '3012', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('128', '10', '3', '2017-06-30', '1013', '', '0', '0', '0', '2', '152', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('129', '10', '3', '2017-06-30', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('130', '10', '3', '2017-06-30', '3012', '', '-11160', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('131', '10', '3', '2017-06-30', '1013', '', '11160', '0', '0', '2', '152', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('132', '10', '3', '2017-06-30', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('141', '0', '2', '2017-10-03', '4011', '', '70815', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('142', '0', '2', '2017-10-03', '1013', '', '-70815', '0', '0', '2', '37', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('143', '0', '3', '2017-10-03', '4011', '', '10', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('144', '0', '3', '2017-10-03', '1013', '', '-10', '0', '0', '2', '37', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('145', '13', '18', '2017-10-02', '5019', '', '200.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('146', '13', '18', '2017-10-02', '1024', '', '-200.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('147', '13', '18', '2017-10-02', '5019', '', '277.9', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('148', '13', '18', '2017-10-02', '1024', '', '-277.9', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('149', '10', '18', '2017-10-02', '4042', '', '-710', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('150', '10', '18', '2017-10-02', '4041', '', '-1000', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('151', '10', '18', '2017-10-02', '1013', '', '1710', '0', '0', '2', '28', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('152', '10', '18', '2017-10-02', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('153', '0', '4', '2017-10-03', '4011', '', '70825', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('154', '0', '4', '2017-10-03', '1013', '', '-70825', '0', '0', '2', '12', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('155', '13', '19', '2017-10-02', '5018', '', '1475.2', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('156', '13', '19', '2017-10-02', '1024', '', '-1475.2', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('157', '13', '19', '2017-10-02', '5019', '', '1929', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('158', '13', '19', '2017-10-02', '1024', '', '-1929', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('159', '13', '19', '2017-10-02', '5018', '', '488.16', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('160', '13', '19', '2017-10-02', '1024', '', '-488.16', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('161', '13', '19', '2017-10-02', '5019', '', '333.48', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('162', '13', '19', '2017-10-02', '1024', '', '-333.48', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('163', '10', '19', '2017-10-02', '4032', '', '-3400', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('164', '10', '19', '2017-10-02', '4042', '', '-3400', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('165', '10', '19', '2017-10-02', '4031', '', '-1140', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('166', '10', '19', '2017-10-02', '4041', '', '-1320', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('167', '10', '19', '2017-10-02', '1013', '', '9260', '0', '0', '2', '14', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('168', '10', '19', '2017-10-02', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('169', '12', '3', '2017-10-02', '10122', '', '9260', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('170', '12', '3', '2017-10-02', '1013', '', '-9260', '0', '0', '2', '14', '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('171', '13', '20', '2017-10-02', '5018', '', '1789.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('172', '13', '20', '2017-10-02', '1024', '', '-1789.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('173', '10', '20', '2017-10-02', '4031', '', '-3960', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('174', '10', '20', '2017-10-02', '1013', '', '3600', '0', '0', '2', '225', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('175', '10', '20', '2017-10-02', '4025', '', '360', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('176', '10', '20', '2017-10-02', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('177', '12', '4', '2017-10-02', '10122', '', '3960', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('178', '12', '4', '2017-10-02', '1013', '', '-3960', '0', '0', '2', '225', '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('179', '13', '21', '2017-10-02', '5019', '', '571.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('180', '13', '21', '2017-10-02', '1024', '', '-571.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('181', '13', '21', '2017-10-02', '5019', '', '1204.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('182', '13', '21', '2017-10-02', '1024', '', '-1204.8', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('183', '13', '21', '2017-10-02', '5019', '', '521.04', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('184', '13', '21', '2017-10-02', '1024', '', '-521.04', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('185', '13', '21', '2017-10-02', '5019', '', '833.7', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('186', '13', '21', '2017-10-02', '1024', '', '-833.7', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('187', '13', '21', '2017-10-02', '5018', '', '1220.4', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('188', '13', '21', '2017-10-02', '1024', '', '-1220.4', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('189', '13', '21', '2017-10-02', '5018', '', '1203', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('190', '13', '21', '2017-10-02', '1024', '', '-1203', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('191', '13', '21', '2017-10-02', '5018', '', '508.68', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('192', '13', '21', '2017-10-02', '1024', '', '-508.68', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('193', '13', '21', '2017-10-02', '5019', '', '447.72', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('194', '13', '21', '2017-10-02', '1024', '', '-447.72', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('195', '13', '21', '2017-10-02', '5019', '', '1436.16', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('196', '13', '21', '2017-10-02', '1024', '', '-1436.16', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('197', '13', '21', '2017-10-02', '5019', '', '348', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('198', '13', '21', '2017-10-02', '1024', '', '-348', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('199', '13', '21', '2017-10-02', '5019', '', '1333.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('200', '13', '21', '2017-10-02', '1024', '', '-1333.92', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('201', '10', '21', '2017-10-02', '4042', '', '-2430', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('202', '10', '21', '2017-10-02', '4042', '', '-4596', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('203', '10', '21', '2017-10-02', '4042', '', '-2148', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('204', '10', '21', '2017-10-02', '4041', '', '-3900', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('205', '10', '21', '2017-10-02', '4031', '', '-3525', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('206', '10', '21', '2017-10-02', '4031', '', '-3525', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('207', '10', '21', '2017-10-02', '4032', '', '-2148', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('208', '10', '21', '2017-10-02', '4042', '', '-1992', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('209', '10', '21', '2017-10-02', '4042', '', '-5508', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('210', '10', '21', '2017-10-02', '4042', '', '-2040', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('211', '10', '21', '2017-10-02', '4042', '', '-5052', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('212', '10', '21', '2017-10-02', '1013', '', '36864', '0', '0', '2', '193', '0', '0', '0000-00-00', '0', '', '', '', NULL),
('213', '10', '21', '2017-10-02', '2013', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '', '', '', NULL),
('214', '12', '5', '2017-10-02', '10122', '', '36864', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', '0', '0', '0', NULL),
('215', '12', '5', '2017-10-02', '1013', '', '-36864', '0', '0', '2', '193', '0', '0', '0000-00-00', '0', '0', '0', '0', NULL);

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
  `h_text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_text3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_comb1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_comb2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `h_comb3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Comments1` text COLLATE utf8_unicode_ci NOT NULL,
  `Comments2` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_date` (`delivery_date`),
  KEY `purch_order_no` (`purch_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_batch` ###

INSERT INTO `0_grn_batch` VALUES
('1', '3', '1', 'auto', '2017-06-30', 'DEF', '1', '0', '', '', '', '', '', '', '', '');

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
  `text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text4` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text5` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text6` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `amount3` double NOT NULL,
  `amount4` double NOT NULL,
  `amount5` double NOT NULL,
  `amount6` double NOT NULL,
  `date1` date NOT NULL DEFAULT '0000-00-00',
  `date2` date NOT NULL DEFAULT '0000-00-00',
  `date3` date NOT NULL DEFAULT '0000-00-00',
  `combo1` int(11) NOT NULL,
  `combo2` int(11) NOT NULL,
  `combo3` int(11) NOT NULL,
  `combo4` int(11) NOT NULL,
  `combo5` int(11) NOT NULL,
  `combo6` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grn_batch_id` (`grn_batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_items` ###

INSERT INTO `0_grn_items` VALUES
('1', '1', '1', 'OB', 'Opening Balance Equity', '1', '1', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0');

### Structure of table `0_groups` ###

DROP TABLE IF EXISTS `0_groups`;

CREATE TABLE `0_groups` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_groups` ###

INSERT INTO `0_groups` VALUES
('1', 'Small', '0'),
('2', 'Medium', '0'),
('3', 'Large', '0'),
('4', 'Retail', '0'),
('5', 'HORICA', '0'),
('6', 'IMT', '0');

### Structure of table `0_h_combo1` ###

DROP TABLE IF EXISTS `0_h_combo1`;

CREATE TABLE `0_h_combo1` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_h_combo1` ###


### Structure of table `0_h_combo2` ###

DROP TABLE IF EXISTS `0_h_combo2`;

CREATE TABLE `0_h_combo2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_h_combo2` ###


### Structure of table `0_h_combo3` ###

DROP TABLE IF EXISTS `0_h_combo3`;

CREATE TABLE `0_h_combo3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_h_combo3` ###


### Structure of table `0_hf_pref` ###

DROP TABLE IF EXISTS `0_hf_pref`;

CREATE TABLE `0_hf_pref` (
  `name` varchar(60) NOT NULL,
  `label_value` varchar(60) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `s_position` tinyint(1) DEFAULT NULL,
  `p_position` tinyint(1) NOT NULL,
  `s_width` tinyint(4) NOT NULL DEFAULT '20',
  `p_width` tinyint(4) NOT NULL DEFAULT '20',
  PRIMARY KEY (`name`),
  UNIQUE KEY `s_position` (`s_position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_hf_pref` ###

INSERT INTO `0_hf_pref` VALUES
('f_combo1', 'comb4', '2', '0', '19', '0', '10', '10'),
('f_combo2', 'comb5', '2', '0', '20', '0', '10', '10'),
('f_combo3', 'comb6', '2', '0', '21', '0', '10', '10'),
('f_comment1', 'Grm/Mircon', '1', '0', '16', '0', '10', '10'),
('f_comment2', 'Length', '1', '0', '17', '0', '10', '10'),
('f_comment3', '6', '1', '0', '18', '0', '10', '10'),
('f_date1', 'date1', '3', '0', '22', '0', '10', '10'),
('f_date2', 'date2', '3', '0', '23', '0', '10', '10'),
('f_date3', 'date3', '3', '0', '24', '0', '10', '10'),
('f_text1', 'Text Field 4', '4', '0', '13', '0', '10', '10'),
('f_text2', 'Text Field 5', '4', '0', '14', '0', '10', '10'),
('f_text3', 'Text Field 6', '4', '0', '15', '0', '10', '10'),
('h_amount1', 'Factor', '1', '0', '4', '0', '10', '10'),
('h_amount2', 'Width(Inch)/Paper', '1', '0', '5', '0', '10', '10'),
('h_amount3', 'Width (MM)', '1', '0', '6', '0', '10', '10'),
('h_combo1', 'comb1', '2', '0', '7', '0', '10', '10'),
('h_combo2', 'comb2', '2', '0', '8', '0', '10', '10'),
('h_combo3', 'comb3', '2', '0', '9', '0', '10', '10'),
('h_date1', 'date1', '3', '0', '10', '0', '10', '10'),
('h_date2', 'date2', '3', '0', '11', '0', '10', '10'),
('h_date3', 'date3', '3', '0', '12', '0', '10', '10'),
('h_text1', 'Constant', '4', '0', '1', '0', '10', '10'),
('h_text2', 'Text Field 2	', '4', '0', '2', '0', '10', '10'),
('h_text3', 'Text Field 3	', '4', '0', '3', '0', '10', '10'),
('total_amount', '5', '30', '0', NULL, '0', '10', '10'),
('total_combo', '6', '30', '0', NULL, '0', '10', '10'),
('total_date', '3', '30', '0', NULL, '0', '10', '10'),
('total_text', '1', '30', '0', NULL, '0', '10', '10');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES
('2', 'RM1001', 'RM1001', 'Beef meat', '2', '1', '0', '0'),
('5', 'FG1003', 'FG1003', 'Frankfurter Cheese sausages', '8', '1', '0', '0'),
('10', 'RM1003', 'RM1003', 'Beef meat', '9', '1', '0', '0'),
('11', 'RM1002', 'RM1002', 'Chicken Boneless Meat', '9', '1', '0', '0'),
('12', 'RM1004', 'RM1004', 'Chicken Skin', '9', '1', '0', '0'),
('13', 'FG1001', 'FG1001', 'Frankfurter sausages', '8', '1', '0', '0'),
('14', 'FG1002', 'FG1002', 'Frankfurter Cocktail sausages', '8', '1', '0', '0'),
('15', 'FG1004', 'FG1004', 'Frankfurter Low fat', '8', '1', '0', '0'),
('16', 'FG1005', 'FG1005', 'Frankfurter Jumbo Sausages', '8', '1', '0', '0'),
('17', 'FG1006', 'FG1006', 'Hunter Sausages', '8', '1', '0', '0'),
('18', 'FG1007', 'FG1007', 'Chicken Sausages', '11', '1', '0', '0'),
('19', 'FG1008', 'FG1008', 'Chicken Cheese Sausages', '11', '1', '0', '0'),
('20', 'FG1009', 'FG1009', 'Chicken Low Fat Sasuages', '11', '1', '0', '0'),
('21', 'FG10010', 'FG10010', 'Chicken Jumbo Sausages', '11', '1', '0', '0'),
('22', 'FG10011', 'FG10011', 'Baked Meat Loaf 200gm', '8', '1', '0', '0'),
('23', 'FG10012', 'FG10012', 'Baked Meat Loaf 400gm', '8', '1', '0', '0'),
('24', 'FG10013', 'FG10013', 'Paprika Pie 200gm', '8', '1', '0', '0'),
('25', 'FG10014', 'FG10014', 'Mortadella Pie 200gm', '8', '1', '0', '0'),
('26', 'FG10015', 'FG10015', 'Pepperoni Salami', '8', '1', '0', '0'),
('27', 'FG10016', 'FG10016', 'Beef Salami 200gm', '8', '1', '0', '0'),
('28', 'FG10017', 'FG10017', 'Smoked Veal Meat', '8', '1', '0', '0'),
('29', 'FG10018', 'FG10018', 'Smoked Chicken', '11', '1', '0', '0'),
('30', 'Fg10019', 'Fg10019', 'Chicken Pie 200gm', '11', '1', '0', '0'),
('31', 'FG10020', 'FG10020', 'Chicken Pepperoni 200gm', '11', '1', '0', '0'),
('32', 'FG10021', 'FG10021', 'Chicken Paprika', '11', '1', '0', '0'),
('33', 'FG10022', 'FG10022', 'Chicken Fajita', '11', '1', '0', '0'),
('34', 'FG10023', 'FG10023', '18 Piece Beef Seekh Kabab', '5', '1', '0', '0'),
('35', 'FG10024', 'FG10024', 'Small Beef seekh Kabab', '5', '1', '0', '0'),
('36', 'Fg10025', 'Fg10025', '14 Piece Beef Chapli Kabab', '5', '1', '0', '0'),
('37', 'FG10026', 'FG10026', '6 piece Beef Chapli Kabab', '5', '1', '0', '0'),
('38', 'FG10027', 'FG10027', 'Beef Shami Kabab small', '5', '1', '0', '0'),
('39', 'FG10028', 'FG10028', 'Beef Kofta small', '5', '1', '0', '0'),
('40', 'FG10029', 'FG10029', 'Beef Kofta Economy Pack', '5', '1', '0', '0'),
('41', 'FG10030', 'FG10030', 'Beef Kofta 12 pieces', '5', '1', '0', '0'),
('42', 'Fg10031', 'Fg10031', '18 Piece Chicken Seekh Kabab', '12', '1', '0', '0'),
('43', 'Fg10032', 'Fg10032', '7 Piece Chicken Seek Kabab', '12', '1', '0', '0'),
('44', 'FG10033', 'FG10033', '14 Piece Chicken Chapli Kabab', '12', '1', '0', '0'),
('46', 'Fg10035', 'Fg10035', 'Chicken Shami Kabab', '12', '1', '0', '0'),
('47', 'FG10034', 'FG10034', '6 piece Chicken Chapli Kabab', '12', '1', '0', '0'),
('48', 'Fg10036', 'Fg10036', 'Chicken Kofta Small', '12', '1', '0', '0'),
('50', 'FG10038', 'FG10038', 'Chicken Kofta 12 pieces', '12', '1', '0', '0'),
('51', 'Fg10039', 'Fg10039', 'Chicken Shots', '12', '1', '0', '0'),
('52', 'FG10037', 'FG10037', 'Economy Chicken Kofta', '12', '1', '0', '0'),
('53', 'FG10040', 'FG10040', 'Small Chicken  Nuggets', '12', '1', '0', '0'),
('54', 'FG10041', 'FG10041', 'Euro Chicken Nuggets Economy', '12', '1', '0', '0'),
('55', 'FG10042', 'FG10042', 'Chicken Burger Patties Small', '12', '1', '0', '0'),
('56', 'FG10043', 'FG10043', 'Chicken Burger Patties Eco', '12', '1', '0', '0'),
('57', 'FG10044', 'FG10044', 'Peshawari Beef Seekh Kabab', '5', '1', '0', '0'),
('58', 'FG10045', 'FG10045', 'Peshawari Chicken Seekh Kabab', '12', '1', '0', '0'),
('59', 'Fg10046', 'Fg10046', 'Beef Mince 400gm', '13', '1', '0', '0'),
('60', 'FG10047', 'FG10047', 'Chicken Mince', '13', '1', '0', '0'),
('61', 'FG10048', 'FG10048', 'Parata 5 piece ', '13', '1', '0', '0'),
('62', 'Fg10049', 'Fg10049', 'Special items 500gm', '13', '1', '0', '0'),
('63', 'OB', 'OB', 'Opening Balance Equity', '13', '1', '0', '0'),
('64', 'PM1001', 'PM1001', 'Packing Material Boxes', '2', '1', '0', '0'),
('65', 'RM1005', 'RM1005', 'Beef Fat', '9', '1', '0', '0'),
('66', 'RM1006', 'RM1006', 'Local Spices and Misc Items', '9', '1', '0', '0'),
('67', 'RM1007', 'RM1007', 'Carton consumed', '13', '1', '0', '0'),
('68', 'FG10050', 'FG10050', 'Frankfurter Juice partise', '8', '1', '0', '0'),
('69', 'FG10051', 'FG10051', 'Speical Items 200gm', '13', '1', '0', '0'),
('71', '13', '13', 'Frankfurter 340 gm JUICE', '8', '1', '0', '0');

### Structure of table `0_item_pref` ###

DROP TABLE IF EXISTS `0_item_pref`;

CREATE TABLE `0_item_pref` (
  `name` varchar(60) NOT NULL,
  `label_value` varchar(60) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `item_enable` tinyint(1) NOT NULL,
  `sale_enable` tinyint(1) NOT NULL,
  `purchase_enable` tinyint(1) NOT NULL,
  `s_position` tinyint(1) DEFAULT NULL,
  `p_position` tinyint(1) NOT NULL,
  `s_width` tinyint(4) NOT NULL DEFAULT '20',
  `p_width` tinyint(4) NOT NULL DEFAULT '20',
  PRIMARY KEY (`name`),
  UNIQUE KEY `s_position` (`s_position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_item_pref` ###

INSERT INTO `0_item_pref` VALUES
('amount1', 'Factor', '1', '0', '0', '0', '19', '0', '10', '10'),
('amount2', 'Width(Inch)/Paper', '1', '0', '0', '0', '2', '0', '10', '10'),
('amount3', 'Width (MM)', '1', '0', '0', '0', '3', '0', '10', '10'),
('amount4', 'Grm/Mircon', '1', '0', '0', '0', '5', '0', '10', '10'),
('amount5', 'Length', '1', '0', '0', '0', '7', '0', '10', '10'),
('amount6', '6', '1', '0', '0', '0', '15', '0', '10', '10'),
('combo1', 'comb1', '2', '0', '0', '0', '4', '0', '10', '10'),
('combo2', 'comb2', '2', '0', '0', '0', '6', '0', '10', '10'),
('combo3', 'comb3', '2', '0', '0', '0', '14', '0', '10', '10'),
('combo4', 'comb4', '2', '0', '0', '0', '16', '0', '10', '10'),
('combo5', 'comb5', '2', '0', '0', '0', '17', '0', '10', '10'),
('combo6', 'comb6', '2', '0', '0', '0', '18', '0', '10', '10'),
('date1', 'date1', '3', '0', '0', '0', '8', '0', '10', '10'),
('date2', 'date2', '3', '0', '0', '0', '12', '0', '10', '10'),
('date3', 'date3', '3', '0', '0', '0', '13', '0', '10', '10'),
('text1', 'Constant', '4', '0', '0', '0', '1', '0', '10', '10'),
('text2', 'Text Field 2	', '4', '0', '0', '0', '9', '0', '10', '10'),
('text3', 'Text Field 3	', '4', '0', '0', '0', '10', '0', '10', '10'),
('text4', 'Text Field 4', '4', '0', '0', '0', '11', '0', '10', '10'),
('text5', 'Text Field 5', '4', '0', '0', '0', '20', '0', '10', '10'),
('text6', 'Text Field 6', '4', '0', '0', '0', '21', '0', '10', '10'),
('total_amount', '5', '30', '0', '0', '0', NULL, '0', '10', '10'),
('total_combo', '6', '30', '0', '0', '0', NULL, '0', '10', '10'),
('total_date', '3', '30', '0', '0', '0', NULL, '0', '10', '10'),
('total_text', '1', '30', '0', '0', '0', NULL, '0', '10', '10');

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
('kg', 'kilogram', '-1', '0'),
('pcs', 'pcs', '-1', '0'),
('pkt', 'packets', '-1', '0');

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
('0', '1', '2017-10-03', 'JV001/10/2017', '', '2017-10-03', '2017-10-03', 'PKR', '36547', '1'),
('0', '2', '2017-10-03', 'JV002/10/2017', '', '2017-10-03', '2017-10-03', 'PKR', '70815', '1'),
('0', '3', '2017-10-03', 'JV003/10/2017', '', '2017-10-03', '2017-10-03', 'PKR', '10', '1'),
('0', '4', '2017-10-03', 'JV004/10/2017', '', '2017-10-03', '2017-10-03', 'PKR', '70825', '1');

### Structure of table `0_loc_stock` ###

DROP TABLE IF EXISTS `0_loc_stock`;

CREATE TABLE `0_loc_stock` (
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reorder_level` double NOT NULL DEFAULT '0',
  `rack_location` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`loc_code`,`stock_id`),
  KEY `stock_id` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_loc_stock` ###

INSERT INTO `0_loc_stock` VALUES
('DEF', '13', '0', NULL),
('DEF', 'FG1001', '0', NULL),
('DEF', 'FG10010', '0', NULL),
('DEF', 'FG10011', '0', NULL),
('DEF', 'FG10012', '0', NULL),
('DEF', 'FG10013', '0', NULL),
('DEF', 'FG10014', '0', NULL),
('DEF', 'FG10015', '0', NULL),
('DEF', 'FG10016', '0', NULL),
('DEF', 'FG10017', '0', NULL),
('DEF', 'FG10018', '0', NULL),
('DEF', 'Fg10019', '0', NULL),
('DEF', 'FG1002', '0', NULL),
('DEF', 'FG10020', '0', NULL),
('DEF', 'FG10021', '0', NULL),
('DEF', 'FG10022', '0', NULL),
('DEF', 'FG10023', '600', NULL),
('DEF', 'FG10024', '800', NULL),
('DEF', 'Fg10025', '400', NULL),
('DEF', 'FG10026', '400', NULL),
('DEF', 'FG10027', '0', NULL),
('DEF', 'FG10028', '0', NULL),
('DEF', 'FG10029', '0', NULL),
('DEF', 'FG1003', '500', NULL),
('DEF', 'FG10030', '0', NULL),
('DEF', 'Fg10031', '0', NULL),
('DEF', 'Fg10032', '0', NULL),
('DEF', 'FG10033', '0', NULL),
('DEF', 'FG10034', '0', NULL),
('DEF', 'Fg10035', '0', NULL),
('DEF', 'Fg10036', '0', NULL),
('DEF', 'FG10037', '0', NULL),
('DEF', 'FG10038', '0', NULL),
('DEF', 'Fg10039', '0', NULL),
('DEF', 'FG1004', '0', NULL),
('DEF', 'FG10040', '0', NULL),
('DEF', 'FG10041', '0', NULL),
('DEF', 'FG10042', '0', NULL),
('DEF', 'FG10043', '0', NULL),
('DEF', 'FG10044', '0', NULL),
('DEF', 'FG10045', '0', NULL),
('DEF', 'Fg10046', '0', NULL),
('DEF', 'FG10047', '0', NULL),
('DEF', 'FG10048', '0', NULL),
('DEF', 'Fg10049', '0', NULL),
('DEF', 'FG1005', '0', NULL),
('DEF', 'FG10050', '0', NULL),
('DEF', 'FG10051', '0', NULL),
('DEF', 'FG1006', '0', NULL),
('DEF', 'FG1007', '0', NULL),
('DEF', 'FG1008', '0', NULL),
('DEF', 'FG1009', '0', NULL),
('DEF', 'OB', '0', NULL),
('DEF', 'PM1001', '0', NULL),
('DEF', 'RM1001', '0', NULL),
('DEF', 'RM1002', '0', NULL),
('DEF', 'RM1003', '0', NULL),
('DEF', 'RM1004', '0', NULL),
('DEF', 'RM1005', '0', NULL),
('DEF', 'RM1006', '0', NULL),
('DEF', 'RM1007', '0', NULL),
('ISL', '13', '0', NULL),
('ISL', 'FG1001', '0', NULL),
('ISL', 'FG10010', '0', NULL),
('ISL', 'FG10011', '0', NULL),
('ISL', 'FG10012', '0', NULL),
('ISL', 'FG10013', '0', NULL),
('ISL', 'FG10014', '0', NULL),
('ISL', 'FG10015', '0', NULL),
('ISL', 'FG10016', '0', NULL),
('ISL', 'FG10017', '0', NULL),
('ISL', 'FG10018', '0', NULL),
('ISL', 'Fg10019', '0', NULL),
('ISL', 'FG1002', '0', NULL),
('ISL', 'FG10020', '0', NULL),
('ISL', 'FG10021', '0', NULL),
('ISL', 'FG10022', '0', NULL),
('ISL', 'FG10023', '300', NULL),
('ISL', 'FG10024', '200', NULL),
('ISL', 'Fg10025', '0', NULL),
('ISL', 'FG10026', '100', NULL),
('ISL', 'FG10027', '0', NULL),
('ISL', 'FG10028', '0', NULL),
('ISL', 'FG10029', '0', NULL),
('ISL', 'FG1003', '300', NULL),
('ISL', 'FG10030', '0', NULL),
('ISL', 'Fg10031', '0', NULL),
('ISL', 'Fg10032', '0', NULL),
('ISL', 'FG10033', '0', NULL),
('ISL', 'FG10034', '0', NULL),
('ISL', 'Fg10035', '0', NULL),
('ISL', 'Fg10036', '0', NULL),
('ISL', 'FG10037', '0', NULL),
('ISL', 'FG10038', '0', NULL),
('ISL', 'Fg10039', '0', NULL),
('ISL', 'FG1004', '0', NULL),
('ISL', 'FG10040', '0', NULL),
('ISL', 'FG10041', '0', NULL),
('ISL', 'FG10042', '0', NULL),
('ISL', 'FG10043', '0', NULL),
('ISL', 'FG10044', '0', NULL),
('ISL', 'FG10045', '0', NULL),
('ISL', 'Fg10046', '0', NULL),
('ISL', 'FG10047', '0', NULL),
('ISL', 'FG10048', '0', NULL),
('ISL', 'Fg10049', '0', NULL),
('ISL', 'FG1005', '0', NULL),
('ISL', 'FG10050', '0', NULL),
('ISL', 'FG10051', '0', NULL),
('ISL', 'FG1006', '0', NULL),
('ISL', 'FG1007', '0', NULL),
('ISL', 'FG1008', '0', NULL),
('ISL', 'FG1009', '0', NULL),
('ISL', 'OB', '0', NULL),
('ISL', 'PM1001', '0', NULL),
('ISL', 'RM1001', '0', NULL),
('ISL', 'RM1002', '0', NULL),
('ISL', 'RM1003', '0', NULL),
('ISL', 'RM1004', '0', NULL),
('ISL', 'RM1005', '0', NULL),
('ISL', 'RM1006', '0', NULL),
('ISL', 'RM1007', '0', NULL),
('KHI', '13', '0', NULL),
('KHI', 'FG1001', '0', NULL),
('KHI', 'FG10010', '0', NULL),
('KHI', 'FG10011', '0', NULL),
('KHI', 'FG10012', '0', NULL),
('KHI', 'FG10013', '0', NULL),
('KHI', 'FG10014', '0', NULL),
('KHI', 'FG10015', '0', NULL),
('KHI', 'FG10016', '0', NULL),
('KHI', 'FG10017', '0', NULL),
('KHI', 'FG10018', '0', NULL),
('KHI', 'Fg10019', '0', NULL),
('KHI', 'FG1002', '0', NULL),
('KHI', 'FG10020', '0', NULL),
('KHI', 'FG10021', '0', NULL),
('KHI', 'FG10022', '0', NULL),
('KHI', 'FG10023', '0', NULL),
('KHI', 'FG10024', '0', NULL),
('KHI', 'Fg10025', '0', NULL),
('KHI', 'FG10026', '0', NULL),
('KHI', 'FG10027', '0', NULL),
('KHI', 'FG10028', '0', NULL),
('KHI', 'FG10029', '0', NULL),
('KHI', 'FG1003', '0', NULL),
('KHI', 'FG10030', '0', NULL),
('KHI', 'Fg10031', '0', NULL),
('KHI', 'Fg10032', '0', NULL),
('KHI', 'FG10033', '0', NULL),
('KHI', 'FG10034', '0', NULL),
('KHI', 'Fg10035', '0', NULL),
('KHI', 'Fg10036', '0', NULL),
('KHI', 'FG10037', '0', NULL),
('KHI', 'FG10038', '0', NULL),
('KHI', 'Fg10039', '0', NULL),
('KHI', 'FG1004', '0', NULL),
('KHI', 'FG10040', '0', NULL),
('KHI', 'FG10041', '0', NULL),
('KHI', 'FG10042', '0', NULL),
('KHI', 'FG10043', '0', NULL),
('KHI', 'FG10044', '0', NULL),
('KHI', 'FG10045', '0', NULL),
('KHI', 'Fg10046', '0', NULL),
('KHI', 'FG10047', '0', NULL),
('KHI', 'FG10048', '0', NULL),
('KHI', 'Fg10049', '0', NULL),
('KHI', 'FG1005', '0', NULL),
('KHI', 'FG10050', '0', NULL),
('KHI', 'FG10051', '0', NULL),
('KHI', 'FG1006', '0', NULL),
('KHI', 'FG1007', '0', NULL),
('KHI', 'FG1008', '0', NULL),
('KHI', 'FG1009', '0', NULL),
('KHI', 'OB', '0', NULL),
('KHI', 'PM1001', '0', NULL),
('KHI', 'RM1001', '0', NULL),
('KHI', 'RM1002', '0', NULL),
('KHI', 'RM1003', '0', NULL),
('KHI', 'RM1004', '0', NULL),
('KHI', 'RM1005', '0', NULL),
('KHI', 'RM1006', '0', NULL),
('KHI', 'RM1007', '0', NULL),
('LHE', '13', '0', NULL),
('LHE', 'FG1001', '0', NULL),
('LHE', 'FG10010', '0', NULL),
('LHE', 'FG10011', '0', NULL),
('LHE', 'FG10012', '0', NULL),
('LHE', 'FG10013', '0', NULL),
('LHE', 'FG10014', '0', NULL),
('LHE', 'FG10015', '0', NULL),
('LHE', 'FG10016', '0', NULL),
('LHE', 'FG10017', '0', NULL),
('LHE', 'FG10018', '0', NULL),
('LHE', 'Fg10019', '0', NULL),
('LHE', 'FG1002', '0', NULL),
('LHE', 'FG10020', '0', NULL),
('LHE', 'FG10021', '0', NULL),
('LHE', 'FG10022', '0', NULL),
('LHE', 'FG10023', '0', NULL),
('LHE', 'FG10024', '0', NULL),
('LHE', 'Fg10025', '0', NULL),
('LHE', 'FG10026', '0', NULL),
('LHE', 'FG10027', '0', NULL),
('LHE', 'FG10028', '0', NULL),
('LHE', 'FG10029', '0', NULL),
('LHE', 'FG1003', '300', NULL),
('LHE', 'FG10030', '0', NULL),
('LHE', 'Fg10031', '0', NULL),
('LHE', 'Fg10032', '0', NULL),
('LHE', 'FG10033', '0', NULL),
('LHE', 'FG10034', '0', NULL),
('LHE', 'Fg10035', '0', NULL),
('LHE', 'Fg10036', '0', NULL),
('LHE', 'FG10037', '0', NULL),
('LHE', 'FG10038', '0', NULL),
('LHE', 'Fg10039', '0', NULL),
('LHE', 'FG1004', '0', NULL),
('LHE', 'FG10040', '0', NULL),
('LHE', 'FG10041', '0', NULL),
('LHE', 'FG10042', '0', NULL),
('LHE', 'FG10043', '0', NULL),
('LHE', 'FG10044', '0', NULL),
('LHE', 'FG10045', '0', NULL),
('LHE', 'Fg10046', '0', NULL),
('LHE', 'FG10047', '0', NULL),
('LHE', 'FG10048', '0', NULL),
('LHE', 'Fg10049', '0', NULL),
('LHE', 'FG1005', '0', NULL),
('LHE', 'FG10050', '0', NULL),
('LHE', 'FG10051', '0', NULL),
('LHE', 'FG1006', '0', NULL),
('LHE', 'FG1007', '0', NULL),
('LHE', 'FG1008', '0', NULL),
('LHE', 'FG1009', '0', NULL),
('LHE', 'OB', '0', NULL),
('LHE', 'PM1001', '0', NULL),
('LHE', 'RM1001', '0', NULL),
('LHE', 'RM1002', '0', NULL),
('LHE', 'RM1003', '0', NULL),
('LHE', 'RM1004', '0', NULL),
('LHE', 'RM1005', '0', NULL),
('LHE', 'RM1006', '0', NULL),
('LHE', 'RM1007', '0', NULL);

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
('ISL', 'Islamabad', '', '', '', '', '', 'Mr Inam', '0', '0'),
('KHI', 'karachi', '', '', '', '', '', '', '0', '0'),
('LHE', 'Lahore', '', '', '', '', '', '', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_payment_terms` ###

INSERT INTO `0_payment_terms` VALUES
('3', 'Payment due within 10 days', '10', '0', '0'),
('4', 'Cash Only', '0', '0', '0'),
('5', '90 Days', '90', '0', '0'),
('6', 'Advance Payment', '-1', '0', '0'),
('7', '40 Days', '40', '0', '0'),
('8', 'Bill To Bill', '15', '0', '0');

### Structure of table `0_ph_combo1` ###

DROP TABLE IF EXISTS `0_ph_combo1`;

CREATE TABLE `0_ph_combo1` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_ph_combo1` ###


### Structure of table `0_ph_combo2` ###

DROP TABLE IF EXISTS `0_ph_combo2`;

CREATE TABLE `0_ph_combo2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_ph_combo2` ###


### Structure of table `0_ph_combo3` ###

DROP TABLE IF EXISTS `0_ph_combo3`;

CREATE TABLE `0_ph_combo3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_ph_combo3` ###


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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('4', '1002', '2', 'PKR', '200'),
('5', '001', '1', 'PKR', '77.72'),
('21', 'FG10023', '7', 'PKR', '391'),
('22', 'FG10024', '7', 'PKR', '179'),
('23', 'Fg10025', '7', 'PKR', '421'),
('24', 'FG10026', '7', 'PKR', '183'),
('25', 'FG10027', '7', 'PKR', '166'),
('26', 'FG10028', '7', 'PKR', '179'),
('27', 'FG10029', '7', 'PKR', '425'),
('28', 'FG10030', '7', 'PKR', '170'),
('29', 'FG10044', '7', 'PKR', '180'),
('30', 'FG1001', '7', 'PKR', '235'),
('31', 'FG10011', '7', 'PKR', '140'),
('32', 'FG10013', '7', 'PKR', '140'),
('33', 'FG10014', '7', 'PKR', '140'),
('34', 'FG10015', '7', 'PKR', '150'),
('35', 'FG10016', '7', 'PKR', '150'),
('36', 'FG10012', '7', 'PKR', '175'),
('37', 'FG10017', '7', 'PKR', '250'),
('38', 'FG1002', '7', 'PKR', '235'),
('39', 'FG1003', '7', 'PKR', '245'),
('40', 'FG1004', '7', 'PKR', '245'),
('41', 'FG1005', '7', 'PKR', '235'),
('42', 'FG1006', '7', 'PKR', '235'),
('43', 'FG10010', '7', 'PKR', '260'),
('44', 'FG10018', '7', 'PKR', '180'),
('45', 'Fg10019', '7', 'PKR', '150'),
('46', 'FG10020', '7', 'PKR', '150'),
('47', 'FG10021', '7', 'PKR', '150'),
('48', 'FG10022', '7', 'PKR', '170'),
('49', 'FG1007', '7', 'PKR', '260'),
('50', 'FG1008', '7', 'PKR', '270'),
('51', 'FG1009', '7', 'PKR', '270'),
('52', 'Fg10046', '7', 'PKR', '230'),
('53', 'FG10047', '7', 'PKR', '225'),
('54', 'FG10048', '7', 'PKR', '83'),
('55', 'Fg10031', '7', 'PKR', '383'),
('56', 'Fg10032', '7', 'PKR', '166'),
('57', 'FG10033', '7', 'PKR', '425'),
('58', 'FG10034', '7', 'PKR', '174'),
('59', 'Fg10035', '7', 'PKR', '162'),
('60', 'Fg10036', '7', 'PKR', '179'),
('61', 'FG10037', '7', 'PKR', '421'),
('62', 'Fg10039', '7', 'PKR', '174'),
('63', 'FG10038', '7', 'PKR', '170'),
('64', 'FG10040', '7', 'PKR', '170'),
('65', 'FG10041', '7', 'PKR', '459'),
('66', 'FG10043', '7', 'PKR', '442'),
('67', 'FG10042', '7', 'PKR', '174'),
('68', 'FG10023', '8', 'PKR', '391'),
('69', 'FG10024', '8', 'PKR', '179'),
('70', 'Fg10025', '8', 'PKR', '421'),
('71', 'FG10026', '8', 'PKR', '183'),
('72', 'FG10027', '8', 'PKR', '166'),
('73', 'FG10028', '8', 'PKR', '179'),
('74', 'FG10029', '8', 'PKR', '425'),
('75', 'FG10044', '8', 'PKR', '180'),
('76', 'FG1001', '8', 'PKR', '255'),
('77', 'FG10011', '8', 'PKR', '145'),
('78', 'FG10013', '8', 'PKR', '145'),
('79', 'FG10014', '8', 'PKR', '145'),
('80', 'FG10015', '8', 'PKR', '170'),
('81', 'FG10016', '8', 'PKR', '170'),
('82', 'FG10017', '8', 'PKR', '270'),
('83', 'FG1002', '8', 'PKR', '255'),
('84', 'FG1003', '8', 'PKR', '260'),
('85', 'FG1004', '8', 'PKR', '260'),
('86', 'FG1005', '8', 'PKR', '255'),
('87', 'FG1006', '8', 'PKR', '255'),
('88', 'FG10010', '8', 'PKR', '280'),
('89', 'FG10018', '8', 'PKR', '185'),
('90', 'Fg10019', '8', 'PKR', '150'),
('91', 'FG10020', '8', 'PKR', '170'),
('92', 'FG10021', '8', 'PKR', '150'),
('93', 'FG10022', '8', 'PKR', '170'),
('94', 'FG1007', '8', 'PKR', '290'),
('95', 'FG1008', '8', 'PKR', '300'),
('96', 'FG1009', '8', 'PKR', '295'),
('98', 'Fg10031', '8', 'PKR', '383'),
('99', 'Fg10032', '8', 'PKR', '166'),
('100', 'FG10033', '8', 'PKR', '425'),
('101', 'FG10034', '8', 'PKR', '174'),
('102', 'Fg10035', '8', 'PKR', '162'),
('103', 'Fg10036', '8', 'PKR', '179'),
('104', 'FG10037', '8', 'PKR', '421'),
('105', 'Fg10039', '8', 'PKR', '174'),
('106', 'FG10040', '8', 'PKR', '170'),
('107', 'FG10041', '8', 'PKR', '459'),
('108', 'FG10042', '8', 'PKR', '174'),
('109', 'FG10043', '8', 'PKR', '442'),
('110', 'FG10048', '8', 'PKR', '83'),
('111', 'FG10045', '8', 'PKR', '210'),
('112', 'FG10045', '7', 'PKR', '210'),
('113', 'FG10023', '6', 'PKR', '401'),
('114', 'FG10024', '6', 'PKR', '184'),
('115', 'Fg10025', '6', 'PKR', '431'),
('116', 'FG10026', '6', 'PKR', '188'),
('117', 'FG10027', '6', 'PKR', '171'),
('118', 'FG10028', '6', 'PKR', '184'),
('119', 'FG10029', '6', 'PKR', '435'),
('120', 'FG10044', '6', 'PKR', '180'),
('121', 'Fg10031', '6', 'PKR', '393'),
('122', 'Fg10032', '6', 'PKR', '171'),
('123', 'FG10045', '6', 'PKR', '210'),
('124', 'FG10033', '6', 'PKR', '435'),
('125', 'FG10034', '6', 'PKR', '179'),
('126', 'Fg10035', '6', 'PKR', '167'),
('127', 'Fg10036', '6', 'PKR', '184'),
('128', 'FG10037', '6', 'PKR', '431'),
('129', 'Fg10039', '6', 'PKR', '179'),
('130', 'FG10040', '6', 'PKR', '175'),
('131', 'FG10041', '6', 'PKR', '469'),
('132', 'FG10042', '6', 'PKR', '179'),
('133', 'FG10043', '6', 'PKR', '452'),
('134', 'FG10048', '6', 'PKR', '83'),
('135', 'Fg10046', '6', 'PKR', '230'),
('136', 'FG10047', '6', 'PKR', '225'),
('137', 'FG10022', '6', 'PKR', '160'),
('138', 'FG1001', '6', 'PKR', '235'),
('139', 'FG10011', '6', 'PKR', '140'),
('140', 'FG10013', '6', 'PKR', '140'),
('141', 'FG10014', '6', 'PKR', '140'),
('142', 'FG10015', '6', 'PKR', '150'),
('143', 'FG10016', '6', 'PKR', '150'),
('144', 'FG10017', '6', 'PKR', '250'),
('145', 'FG1002', '6', 'PKR', '235'),
('146', 'FG1003', '6', 'PKR', '245'),
('147', 'FG1004', '6', 'PKR', '245'),
('148', 'FG1005', '6', 'PKR', '235'),
('149', 'FG1006', '6', 'PKR', '235'),
('150', 'FG10010', '6', 'PKR', '260'),
('151', 'FG10018', '6', 'PKR', '180'),
('152', 'Fg10019', '6', 'PKR', '150'),
('153', 'FG10020', '6', 'PKR', '150'),
('154', 'FG10021', '6', 'PKR', '150'),
('155', 'FG1007', '6', 'PKR', '260'),
('156', 'FG1008', '6', 'PKR', '270'),
('157', 'FG1009', '6', 'PKR', '270'),
('158', 'FG10023', '10', 'PKR', '282'),
('159', 'FG10024', '10', 'PKR', '110'),
('160', 'FG10044', '10', 'PKR', '166'),
('161', 'Fg10025', '10', 'PKR', '300'),
('162', 'FG10026', '10', 'PKR', '131'),
('163', 'FG10027', '10', 'PKR', '119'),
('164', 'FG10028', '10', 'PKR', '117'),
('165', 'FG10029', '10', 'PKR', '360'),
('166', 'Fg10031', '10', 'PKR', '282'),
('167', 'Fg10032', '10', 'PKR', '110'),
('168', 'FG10033', '10', 'PKR', '300'),
('169', 'FG10034', '10', 'PKR', '131'),
('170', 'Fg10035', '10', 'PKR', '113'),
('171', 'FG10045', '10', 'PKR', '166'),
('172', 'Fg10036', '10', 'PKR', '117'),
('173', 'FG10037', '10', 'PKR', '360'),
('174', 'Fg10039', '10', 'PKR', '114'),
('175', 'FG10041', '10', 'PKR', '378'),
('176', 'FG10040', '10', 'PKR', '105'),
('177', 'FG10043', '10', 'PKR', '355'),
('178', 'FG10042', '10', 'PKR', '126'),
('179', 'FG1001', '10', 'PKR', '170'),
('180', 'FG10011', '10', 'PKR', '100'),
('181', 'FG10013', '10', 'PKR', '100'),
('182', 'FG10014', '10', 'PKR', '100'),
('183', 'FG10015', '10', 'PKR', '140'),
('184', 'FG10016', '10', 'PKR', '140'),
('185', 'FG10017', '10', 'PKR', '200'),
('186', 'FG1002', '10', 'PKR', '190'),
('187', 'FG1003', '10', 'PKR', '200'),
('188', 'FG1004', '10', 'PKR', '200'),
('189', 'FG1005', '10', 'PKR', '180'),
('190', 'FG1006', '10', 'PKR', '190'),
('191', 'FG10010', '10', 'PKR', '220'),
('192', 'FG10018', '10', 'PKR', '130'),
('193', 'Fg10019', '10', 'PKR', '110'),
('194', 'FG10020', '10', 'PKR', '140'),
('195', 'FG10021', '10', 'PKR', '140'),
('196', 'FG1007', '10', 'PKR', '215'),
('197', 'FG1008', '10', 'PKR', '230'),
('198', 'FG1009', '10', 'PKR', '230'),
('200', 'FG10028', '12', 'PKR', '157');

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
('3', 'OB', '36547', '', '1', 'Opening Balance Equity');

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
  `text4` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `amount3` double NOT NULL,
  `amount4` double NOT NULL,
  `amount5` double NOT NULL,
  `amount6` double NOT NULL,
  `date1` date NOT NULL DEFAULT '0000-00-00',
  `date2` date NOT NULL DEFAULT '0000-00-00',
  `date3` date NOT NULL DEFAULT '0000-00-00',
  `combo1` int(11) NOT NULL,
  `combo2` int(11) NOT NULL,
  `combo3` int(11) NOT NULL,
  `combo4` int(11) NOT NULL,
  `combo5` int(11) NOT NULL,
  `combo6` int(11) NOT NULL,
  `op_po` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`po_detail_item`),
  KEY `order` (`order_no`,`po_detail_item`),
  KEY `itemcode` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_order_details` ###

INSERT INTO `0_purch_order_details` VALUES
('1', '1', 'OB', 'Opening Balance Equity', '2017-06-30', '1', '36547', '36547', '0', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL);

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
  `op_po` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `receive_ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`order_no`),
  KEY `ord_date` (`ord_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_orders` ###

INSERT INTO `0_purch_orders` VALUES
('1', '3', NULL, '2017-06-30', 'auto', 'op bal', 'DEF', 'N/A', '36547', '0', '0', '0', '', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '');

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
('cart1', '', '0', '0'),
('cart2', '', '0', '0'),
('cart3', '', '0', '0'),
('cart4', '', '0', '0'),
('cart5', 'Header 5', '0', '0'),
('cart6', 'Header 6', '0', '0'),
('footer_long_text1', 'Header Combo Label 3', '0', '0'),
('footer_long_text2', '', '0', '0'),
('header_combo1', '', '0', '0'),
('header_combo2', '', '0', '0'),
('header_combo3', 'Header Combo Label 3', '1', '0'),
('header_long_text', '', '0', '0'),
('header_text1', 'Label text 1', '0', '0'),
('header_text2', ' Text Label 2', '0', '0'),
('header_text3', 'Label text 3', '0', '0'),
('h_combo1', 'h1', '0', '1'),
('h_combo2', 'h2', '0', '1'),
('h_combo3', 'h3', '0', '1'),
('total_headers', 'h1', '0', '0'),
('total_headers2', 'f', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_reflines` ###

INSERT INTO `0_reflines` VALUES
('1', '0', 'JV', '{001}/{MM}/{YYYY}', '', '1', '0'),
('2', '1', 'BPV', '{001}/{MM}/{YYYY}', '', '1', '0'),
('3', '2', 'BRV', '{001}/{MM}/{YYYY}', '', '1', '0'),
('4', '4', 'FT', '{001}/{MM}/{YYYY}', '', '1', '0'),
('5', '10', 'SI', '{001}/{MM}/{YYYY}', '107', '1', '0'),
('6', '11', 'CCN', '{001}/{MM}/{YYYY}', '113', '1', '0'),
('7', '12', 'CP', '{001}/{MM}/{YYYY}', '', '1', '0'),
('8', '13', 'DN', '{001}/{MM}/{YYYY}', '110', '1', '0'),
('9', '16', 'LT', '{001}/{MM}/{YYYY}', '', '1', '0'),
('10', '17', 'IA', '{001}/{MM}/{YYYY}', '', '1', '0'),
('11', '18', 'PO', '{001}/{MM}/{YYYY}', '209', '1', '0'),
('12', '20', 'PI', '{001}/{MM}/{YYYY}', '', '1', '0'),
('13', '21', 'SCN', '{001}/{MM}/{YYYY}', '', '1', '0'),
('14', '22', 'SP', '{001}/{MM}/{YYYY}', '210', '1', '0'),
('15', '25', 'GRN', '{001}/{MM}/{YYYY}', '', '1', '0'),
('16', '26', 'WO', '{001}/{MM}/{YYYY}', '409', '1', '0'),
('17', '28', 'WOI', '{001}/{MM}/{YYYY}', '', '1', '0'),
('18', '29', 'WOP', '{001}/{MM}/{YYYY}', '', '1', '0'),
('19', '30', 'SO', '{001}/{MM}/{YYYY}', '109', '1', '0'),
('20', '32', 'SQ', '{001}/{MM}/{YYYY}', '110', '1', '0'),
('21', '35', 'CU', '{001}/{MM}/{YYYY}', '', '1', '0'),
('22', '40', 'CC', '{001}/{MM}/{YYYY}', '', '1', '0'),
('23', '41', 'CPV', '{001}/{MM}/{YYYY}', '', '1', '0'),
('24', '42', 'CRV', '{001}/{MM}/{YYYY}', '', '1', '0'),
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
('1', '0', 'JV001/10/2017'),
('2', '0', 'JV002/10/2017'),
('3', '0', 'JV003/10/2017'),
('4', '0', 'JV004/10/2017'),
('1', '10', 'SI001/06/2017'),
('13', '10', 'SI001/07/2017'),
('3', '10', 'SI001/10/2017'),
('2', '10', 'SI002/06/2017'),
('14', '10', 'SI002/07/2017'),
('4', '10', 'SI002/10/2017'),
('9', '10', 'SI003/06/2017'),
('5', '10', 'SI003/10/2017'),
('10', '10', 'SI004/06/2017'),
('6', '10', 'SI004/10/2017'),
('11', '10', 'SI005/06/2017'),
('7', '10', 'SI005/10/2017'),
('12', '10', 'SI006/06/2017'),
('8', '10', 'SI006/10/2017'),
('15', '10', 'SI007/06/2017'),
('18', '10', 'SI007/10/2017'),
('16', '10', 'SI008/06/2017'),
('19', '10', 'SI008/10/2017'),
('17', '10', 'SI009/06/2017'),
('20', '10', 'SI009/10/2017'),
('21', '10', 'SI010/10/2017'),
('1', '12', 'CP001/06/2017'),
('3', '12', 'CP001/10/2017'),
('2', '12', 'CP002/06/2017'),
('4', '12', 'CP002/10/2017'),
('5', '12', 'CP003/10/2017'),
('1', '17', 'IA001/10/2017'),
('2', '17', 'IA002/10/2017'),
('3', '17', 'IA003/10/2017'),
('1', '20', 'PI001/06/2017'),
('15', '30', 'SO001/10/2017');

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
  `units_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `text1` int(11) NOT NULL,
  `text2` int(11) NOT NULL,
  `text3` int(11) NOT NULL,
  `text4` int(11) NOT NULL,
  `text5` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `amount3` double NOT NULL,
  `amount4` double NOT NULL,
  `amount5` double DEFAULT NULL,
  `amount6` double DEFAULT NULL,
  `date1` date NOT NULL,
  `date2` date NOT NULL,
  `date3` date NOT NULL,
  `combo1` int(11) NOT NULL,
  `combo2` int(11) NOT NULL,
  `combo3` int(11) NOT NULL,
  `combo4` int(11) DEFAULT NULL,
  `combo5` int(11) DEFAULT NULL,
  `combo6` int(11) DEFAULT NULL,
  `op_so` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sorder` (`trans_type`,`order_no`),
  KEY `stkcode` (`stk_code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_order_details` ###

INSERT INTO `0_sales_order_details` VALUES
('1', '1', '30', 'OB', 'Opening Balance Equity', '12500', '0', '12500', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('2', '2', '30', 'OB', 'Opening Balance Equity', '1', '12500', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('3', '3', '30', 'OB', 'Opening Balance Equity', '1', '11160', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('4', '4', '30', 'OB', 'Opening Balance Equity', '1', '98490', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('5', '5', '30', 'OB', 'Opening Balance Equity', '1', '70825', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('6', '6', '30', 'OB', 'Opening Balance Equity', '1', '108433', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('7', '7', '30', 'OB', 'Opening Balance Equity', '1', '47450', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('8', '8', '30', 'OB', 'Opening Balance Equity', '1', '94647', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('9', '9', '30', 'OB', 'Opening Balance Equity', '1', '56277', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('10', '10', '30', 'OB', 'Opening Balance Equity', '1', '15067', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('11', '11', '30', 'OB', 'Opening Balance Equity', '1', '55487', '1', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', NULL, NULL, '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', NULL, NULL, NULL, NULL),
('12', '12', '30', 'OB', 'Opening Balance Equity', '0', '10150', '0', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('13', '13', '30', 'OB', 'Opening Balance Equity', '0', '10150', '0', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('14', '14', '30', 'OB', 'Opening Balance Equity', '0', '10150', '0', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('15', '15', '30', 'FG10024', 'Small Beef seekh Kabab', '0', '0', '20', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('16', '16', '30', 'OB', 'Opening Balance Equity', '0', '10150', '0', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('17', '17', '30', 'OB', 'Opening Balance Equity', '0', '10150', '0', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('18', '18', '30', 'OB', 'Opening Balance Equity', '0', '88261', '0', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('19', '19', '30', 'Fg10031', '18 Piece Chicken Seekh Kabab', '2', '355', '2', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('20', '19', '30', 'FG1007', 'Chicken Sausages', '5', '200', '5', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('21', '20', '30', 'FG10030', 'Beef Kofta 12 pieces', '20', '170', '20', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('22', '20', '30', 'FG10038', 'Chicken Kofta 12 pieces', '20', '170', '20', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('23', '20', '30', 'FG1001', 'Frankfurter sausages', '6', '190', '6', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('24', '20', '30', 'FG1007', 'Chicken Sausages', '6', '220', '6', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('25', '21', '30', 'FG1001', 'Frankfurter sausages', '22', '180', '22', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('26', '22', '30', 'Fg10035', 'Chicken Shami Kabab', '15', '162', '15', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('27', '22', '30', 'Fg10031', '18 Piece Chicken Seekh Kabab', '12', '383', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('28', '22', '30', 'Fg10036', 'Chicken Kofta Small', '12', '179', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('29', '22', '30', 'FG1007', 'Chicken Sausages', '15', '260', '15', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('30', '22', '30', 'FG1001', 'Frankfurter sausages', '15', '235', '15', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('31', '22', '30', 'FG1006', 'Hunter Sausages', '15', '235', '15', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('32', '22', '30', 'FG10024', 'Small Beef seekh Kabab', '12', '179', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('33', '22', '30', 'Fg10032', '7 Piece Chicken Seek Kabab', '12', '166', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('34', '22', '30', 'FG10041', 'Euro Chicken Nuggets Economy', '12', '459', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('35', '22', '30', 'FG10040', 'Small Chicken  Nuggets', '12', '170', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('36', '22', '30', 'FG10037', 'Economy Chicken Kofta', '12', '421', '12', '0', '0', '', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL);

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
  `discount1` double NOT NULL,
  `discount2` double NOT NULL,
  `disc1` double NOT NULL,
  `disc2` double NOT NULL,
  `po_date` date NOT NULL DEFAULT '0000-00-00',
  `term_cond` longtext COLLATE utf8_unicode_ci,
  `h_text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `h_text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `h_text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `h_amount1` double NOT NULL,
  `h_amount2` double NOT NULL,
  `h_amount3` double NOT NULL,
  `h_date1` date NOT NULL DEFAULT '0000-00-00',
  `h_date2` date NOT NULL DEFAULT '0000-00-00',
  `h_date3` date NOT NULL DEFAULT '0000-00-00',
  `h_combo1` int(11) NOT NULL,
  `h_combo2` int(11) NOT NULL,
  `h_combo3` int(11) NOT NULL,
  `f_text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `f_text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `f_text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `f_date1` date NOT NULL DEFAULT '0000-00-00',
  `f_date2` date NOT NULL DEFAULT '0000-00-00',
  `f_date3` date NOT NULL DEFAULT '0000-00-00',
  `f_combo1` int(11) NOT NULL,
  `f_combo2` int(11) NOT NULL,
  `f_combo3` int(11) NOT NULL,
  `f_comment1` text COLLATE utf8_unicode_ci NOT NULL,
  `f_comment2` text COLLATE utf8_unicode_ci NOT NULL,
  `f_comment3` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`trans_type`,`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_orders` ###

INSERT INTO `0_sales_orders` VALUES
('1', '30', '1', '0', '36', '36', 'auto', '', NULL, '2017-06-30', '4', '1', 'ISLAMABAD', NULL, NULL, 'ISD- H AFGHAN BURGER F10', '0', 'DEF', '2017-08-09', '7', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-09-29', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('2', '30', '1', '0', '36', '36', 'auto', '', NULL, '2017-06-30', '4', '1', 'ISLAMABAD', NULL, NULL, 'ISD- H AFGHAN BURGER F10', '0', 'DEF', '2017-07-10', '3', '12500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-09-29', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('3', '30', '1', '0', '152', '146', 'auto', '', NULL, '2017-10-01', '2', '1', 'Lahore', NULL, NULL, 'LHR-R Csd Cavelry Lahore', '0', 'DEF', '2017-11-10', '7', '11160', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('4', '30', '1', '0', '136', '133', 'auto', '', NULL, '2017-10-01', '2', '1', 'Lahore', NULL, NULL, 'LHR-H Holiday Inn Hotel Lahore', '0', 'DEF', '2017-11-10', '7', '98490', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('5', '30', '1', '0', '37', '37', 'auto', '', NULL, '2017-10-01', '4', '1', 'ISLAMABAD', NULL, NULL, ' ISD-H ARIF TRADER', '0', 'DEF', '2017-11-10', '7', '70825', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('6', '30', '1', '0', '142', '139', 'auto', '', NULL, '2017-10-01', '2', '1', 'Lahore', NULL, NULL, 'LHR-R Metro Cash In Carry Multan  Road Lahore', '0', 'DEF', '2017-11-10', '7', '108433', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('7', '30', '1', '0', '115', '115', 'auto', '', NULL, '2017-10-01', '4', '1', 'Lahore', NULL, NULL, 'LHR-H Mozaraella Resturant 27 Lahore', '0', 'DEF', '2017-11-10', '7', '47450', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('8', '30', '1', '0', '12', '12', 'auto', '', NULL, '2017-10-01', '12', '1', 'PESHAWAR', NULL, NULL, ' P-1 AL-FATAH ', '0', 'DEF', '2017-11-10', '7', '94647', '0', '0', '0', '0', '0', '0', '', '9464.7', '0', '10', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('9', '30', '1', '0', '15', '15', 'auto', '', NULL, '2017-06-30', '7', '1', 'PESHAWAR', NULL, NULL, ' P-1 DAY &amp; NIGHT STORE (1 WAVES)', '0', 'DEF', '2017-07-15', '8', '56277', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('10', '30', '1', '0', '20', '20', 'auto', '', NULL, '2017-06-30', '7', '1', 'UNIVERSITY ROAD PESHAWAR', NULL, NULL, ' P-1 GUL COOL SPOT (1STAND FREEZER)', '0', 'DEF', '2017-07-10', '3', '15067', '0', '0', '0', '0', '0', '0', '', '753.35', '0', '5', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('11', '30', '1', '0', '91', '91', 'auto', '', NULL, '2017-06-30', '1', '1', '111', NULL, NULL, 'ISD-R Pcc Barakoh Islamabad', '0', 'DEF', '2017-08-09', '7', '55487', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-01', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('12', '30', '1', '0', '122', '121', 'auto', '', NULL, '2017-06-30', '4', '1', 'Lahore', NULL, NULL, 'LHR-H Pizza Channel W/T Lahore', '0', 'DEF', '2017-08-09', '7', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-02', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('13', '30', '1', '0', '122', '121', 'auto', '', NULL, '2017-07-01', '4', '1', 'Lahore', NULL, NULL, 'LHR-H Pizza Channel W/T Lahore', '0', 'DEF', '2017-11-11', '7', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-02', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('14', '30', '1', '0', '122', '121', 'auto', '', NULL, '2017-07-01', '3', '1', 'Lahore', NULL, NULL, 'LHR-H Pizza Channel W/T Lahore', '0', 'DEF', '2017-08-10', '7', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-02', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('15', '30', '0', '0', '12', '12', 'SO001/10/2017', '', NULL, '2017-10-02', '12', '1', 'PESHAWAR', NULL, NULL, ' P-1 AL-FATAH ', '0', 'DEF', '2017-10-03', '7', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-02', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('16', '30', '1', '0', '122', '121', 'auto', '', NULL, '2017-06-30', '3', '1', 'Lahore', NULL, NULL, 'LHR-H Pizza Channel W/T Lahore', '0', 'DEF', '2017-10-02', '4', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0000-00-00', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('17', '30', '1', '0', '122', '121', 'auto', '', NULL, '2017-06-30', '3', '1', 'Lahore', NULL, NULL, 'LHR-H Pizza Channel W/T Lahore', '0', 'DEF', '2017-10-02', '4', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0000-00-00', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('18', '30', '1', '0', '148', '144', 'auto', '', NULL, '2017-06-30', '2', '1', 'Faisalabad', NULL, NULL, 'LHR-O Zubaida Associates Faisalabad', '0', 'DEF', '2017-06-30', '7', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-06-30', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('19', '30', '1', '0', '28', '28', 'auto', '', NULL, '2017-10-02', '7', '1', 'PESHAWAR', NULL, NULL, 'P-1 POTATO PLUS (P1P2) I HOT TOP', '0', 'DEF', '2017-11-12', '7', '1710', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '2017-10-03', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('20', '30', '1', '0', '14', '14', 'auto', '', NULL, '2017-10-02', '7', '1', 'PESHAWAR', NULL, NULL, 'P-1 CP STORE  (1 V LINE)', '0', 'DEF', '2017-10-03', '4', '9260', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0000-00-00', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('21', '30', '1', '0', '225', '214', 'auto', '', NULL, '2017-10-02', '7', '1', 'Hayatabad', NULL, NULL, 'P-2 Insaf Juice Bilal Market Hayatabad', '0', 'DEF', '2017-10-03', '4', '3960', '0', '0', '0', '0', '0', '0', '', '0', '360', '0', '0', '0000-00-00', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', ''),
('22', '30', '1', '0', '193', '183', 'auto', '', NULL, '2017-10-02', '7', '1', 'Attock', NULL, NULL, 'O-1 Zam Zama Store Attock', '0', 'DEF', '2017-10-03', '4', '36864', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0000-00-00', NULL, '', '', '', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '', '', '');

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
('1', 'Default', '1', '1', 'DEF', '2', '0');

### Structure of table `0_sales_pref` ###

DROP TABLE IF EXISTS `0_sales_pref`;

CREATE TABLE `0_sales_pref` (
  `name` varchar(20) NOT NULL,
  `label_value` varchar(30) NOT NULL,
  `so_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_sales_pref` ###

INSERT INTO `0_sales_pref` VALUES
('amount_1', 'amount_1', '0'),
('amount_2', 'amount_2', '0'),
('amount_3', 'amount_3', '0'),
('amount_4', 'amount_4', '0'),
('amount_5', 'amount_5', '0'),
('amount_6', 'amount_6', '0'),
('f_combo1', 'footer_combo1', '0'),
('f_combo2', 'footer_combo2', '0'),
('f_combo3', 'Footer Combo 3', '0'),
('h_combo1', 'h_combo1', '0'),
('h_combo2', 'h_combo2', '0'),
('h_combo3', 'footer_combo3', '0'),
('so_cart1', 'jh', '0'),
('so_cart2', 'jg', '0'),
('so_cart3', 'jhg', '0'),
('so_cart4', 'gjh', '0'),
('so_cart5', 'jhg', '0'),
('so_cart6', 'gjh', '0'),
('so_footer_long_text1', 'klhkhjkj', '0'),
('so_footer_long_text2', 'gjh', '0'),
('so_footer_long_text3', 'g', '0'),
('so_footer_long_text4', 'jh', '0'),
('so_footer_long_text5', 'gjh', '0'),
('so_footer_long_text6', 'jhg', '0'),
('so_header_combo1', 'jhg', '0'),
('so_header_combo2', 'gj', '0'),
('so_header_combo3', 'jh', '0'),
('so_header_combo4', 'so_header_combo4', '0'),
('so_header_combo5', 'so_header_combo5', '0'),
('so_header_combo6', 'so_header_combo6', '0'),
('so_header_long_text', '', '0'),
('so_header_text1', 'jhg', '0'),
('so_header_text2', 'gjh', '0'),
('so_header_text3', 'jhg', '0'),
('so_header_text4', 'so_header_text4', '0'),
('so_header_text5', 'so_header_text5', '0'),
('so_header_text6', 'so_header_text6', '0'),
('text_box_1', 'asd', '0'),
('text_box_2', 'sdfd', '0'),
('text_box_3', 'sd', '0'),
('text_box_4', '1', '0'),
('text_box_5', '2', '0'),
('text_box_6', '3', '0'),
('total_date', '1', '1'),
('total_footer', '1', '1'),
('total_footer_text', '1', '1'),
('total_headers', '2131', '0'),
('total_headers2', '123', '0'),
('total_headers_long', '1', '1'),
('total_header_text', '1', '1'),
('total_h_combo', '1', '1'),
('total_long_footer', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_types` ###

INSERT INTO `0_sales_types` VALUES
('1', 'Retail', '1', '1', '0'),
('2', 'Lahore Retail/Instut', '0', '0.7', '0'),
('3', 'HORICA LAHORE', '0', '1', '0'),
('4', 'HORICA ISLAMABAD', '0', '1', '0'),
('6', 'Pcc/Galaini Prices', '0', '1', '0'),
('7', 'KPK Market Price lis', '0', '1', '0'),
('8', 'ISLAMABAD RETAIL', '0', '1', '0'),
('10', 'Ihsan Karachi Price', '0', '1', '0'),
('12', 'Alftatah rate list', '0', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_salesman` ###

INSERT INTO `0_salesman` VALUES
('1', 'Sales Person', '', '', '', '5', '1000', '4', '0'),
('2', 'adnan', '', '', '', '0', '0', '0', '0'),
('3', 'Tanveer Shah', '', '', '', '0', '0', '0', '0'),
('4', 'Salim Khan', '', '', '', '0', '0', '0', '0'),
('5', 'Zahir Badshah', '', '', '', '0', '0', '0', '0'),
('6', 'shahzad Retail Islamabad', '', '', '', '0', '0', '0', '0'),
('7', 'alamzeb Horica Islamabad', '', '', '', '0', '0', '0', '0'),
('8', 'Karachi Ihsan', '', '', '', '0', '0', '0', '0'),
('9', 'Ejaz Abbotabad', '', '', '', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_security_roles` ###

INSERT INTO `0_security_roles` VALUES
('1', 'Inquiries', 'Inquiries', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132;775', '0'),
('2', 'System Administrator', 'System Administrator', '512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;9216;9472;9728;10496;10752;11008;13056;13312;15616;15872;16128;484352;943104;1008640', '513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;775;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;9217;9218;9220;9473;9474;9475;9476;9729;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15630;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;15884;16129;16130;16131;16132;484452;943204;943205;1008740', '0'),
('3', 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873;775', '0'),
('4', 'Stock Manager', 'Stock Manager', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132;775', '0'),
('5', 'Production Manager', 'Production Manager', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('6', 'Purchase Officer', 'Purchase Officer', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132;775', '0'),
('7', 'AR Officer', 'AR Officer', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132;775', '0'),
('8', 'AP Officer', 'AP Officer', '5632', '5633;5635;5636;3073;3074;3082;3076;3077;3078;3079;3080;3081;3335;13057', '0'),
('9', 'Accountant', 'New Accountant', '2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;15616;15872;16128;16384;1074176;1336320', '2817;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11012;15617;15618;15619;15620;15621;15624;15626;15630;15873;15874;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132;16400;521;523;524;771;772;773;774;775;13313;13315', '0'),
('10', 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;8192;8448;13312;15616;15872;16128', '521;523;771;772;773;774;2818;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3331;3334;3335;8193;8194;8196;8197;8450;8451;13315;15621;15873;15874;15876;15877;15880;15882;16132;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;10497;10753;10755;11009;11010;11012;13057', '0'),
('11', 'cash account', 'cash account', '768;15616;15872', '774;15873;15877;15878;15879', '0'),
('13', 'Sales accountant', 'Sales and despatch accountant', '3072;3328;5632;8192;8448;10752;15872;16128', '3073;3082;3075;3076;3077;3078;3079;3080;3081;3331;3334;3335;5633;5634;5635;5636;5637;5638;5639;5640;8193;8196;8449;8451;10754;10755;10756;10757;15874;15876;15877;15878;15880;15881', '0'),
('14', 'Regional Accounts Isla', 'Regional accounts based in Islamabad', '3072;3328;8192;13312;15872', '3073;3075;3076;3077;3078;3080;3331;3334;3335;8193;13313;15874;15876;15877', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('2', 'Material', '1', 'each', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('3', 'Supplies', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('5', ' HMR beef items', '2', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '0', '1'),
('8', 'CLASSIC Beef', '2', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '0', '1'),
('9', 'Raw material', '1', 'kg', 'B', '4011', '5011', '1022', '5014', '1023', '0', '0', '0', '1', '0'),
('11', 'Classic Chicken Items', '2', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '0'),
('12', 'HMR Chicken Items', '2', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '1'),
('13', 'Other Items', '2', 'pkt', 'M', '4011', '5011', '1024', '5014', '1023', '0', '0', '0', '0', '0');

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
  `text1` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount1` double DEFAULT NULL,
  `amount2` double DEFAULT NULL,
  `amount3` double DEFAULT NULL,
  `amount4` double DEFAULT NULL,
  `amount5` double DEFAULT NULL,
  `amount6` double DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `date3` date DEFAULT NULL,
  `combo1` int(11) DEFAULT NULL,
  `combo2` int(11) DEFAULT NULL,
  `combo3` int(11) DEFAULT NULL,
  `combo4` int(11) DEFAULT NULL,
  `combo5` int(11) DEFAULT NULL,
  `combo6` int(11) DEFAULT NULL,
  `combo_so_1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_4` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_5` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_6` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_master` ###

INSERT INTO `0_stock_master` VALUES
('13', '8', '2', 'Frankfurter 340 gm JUICE', 'Frankfurter340gm JUICE', '1', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '', '', '', '', '', ''),
('FG1001', '8', '1', 'Frankfurter sausages', 'Frankfurter Sausages 340gm pkt', '', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '81.36', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10010', '11', '2', 'Chicken Jumbo Sausages', 'Chicken Jumbo Sausages 300gm', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '54.1', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10011', '8', '2', 'Baked Meat Loaf 200gm', 'Baked Meat Loaf 200gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '35.55', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10012', '8', '2', 'Baked Meat Loaf 400gm', 'Baked Meat Loaf 400gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '75', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10013', '8', '2', 'Paprika Pie 200gm', 'Paprika Pie 200gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '54.83', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10014', '8', '2', 'Mortadella Pie 200gm', 'Mortadella Pie 200gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '55.89', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10015', '8', '2', 'Pepperoni Salami', 'Pepperoni Salami 200gm ', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '56.59', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10016', '8', '2', 'Beef Salami 200gm', 'Beef salami 200gm ', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '55.6', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10017', '8', '2', 'Smoked Veal Meat', 'Smoked veal meat 200gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10018', '11', '2', 'Smoked Chicken', 'Smoked Chicken 200gm ', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '84.58', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10019', '11', '2', 'Chicken Pie 200gm', 'Chicken Pie', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '45.74', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG1002', '8', '2', 'Frankfurter Cocktail sausages', 'Frankfurter Cocktail sausages 340gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '79.13', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10020', '11', '2', 'Chicken Pepperoni 200gm', 'Chicken Pepperoni 200gm', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '34.79', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10021', '11', '2', 'Chicken Paprika', 'Chicken Paprika 200gm', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '27.98', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10022', '11', '2', 'Chicken Fajita', 'Chicken Fajita 200gm', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10023', '5', '2', '18 Piece Beef Seekh Kabab', 'Beef seekh Kabab Economy', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '98.79', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10024', '5', '2', 'Small Beef seekh Kabab', 'Beef seekh kabab 210gm', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '42.39', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10025', '5', '2', '14 Piece Beef Chapli Kabab', 'Economy Beef Chapli 840gm', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '83.19', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10026', '5', '2', '6 piece Beef Chapli Kabab', 'small beef chapli kabab 380gm', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '32.12', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10027', '5', '2', 'Beef Shami Kabab small', 'Beef Shami Kabab small 320gm', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '53.16', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10028', '5', '2', 'Beef Kofta small', 'beef Kofta small 300gm', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '47.14', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10029', '5', '2', 'Beef Kofta Economy Pack', 'Beef Kofta economy 1000gm', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '42.4', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG1003', '8', '2', 'Frankfurter Cheese sausages', 'Frankfurter Cheese sausages 340gm', 'Pkt', 'pcs', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '80.07', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10030', '5', '2', 'Beef Kofta 12 pieces', 'Beef Kofta 12 Pieces', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '73.76', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10031', '12', '2', '18 Piece Chicken Seekh Kabab', 'Economy chicken seekh kabab', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '100.4', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10032', '12', '2', '7 Piece Chicken Seek Kabab', 'Small chicken seekh kabab 210gm', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '37.31', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10033', '12', '2', '14 Piece Chicken Chapli Kabab', 'Economy Chicken seekh Kabab', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '78.66', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10034', '12', '2', '6 piece Chicken Chapli Kabab', 'Small chicken Chapli Kabab 380gm', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '31.81', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10035', '12', '2', 'Chicken Shami Kabab', 'Small chicken shami Kabab 320gm', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '38.12', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10036', '12', '2', 'Chicken Kofta Small', 'Small Chicken Kofta 300gm', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '43.42', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10037', '12', '2', 'Economy Chicken Kofta', 'Economy Chicken Kofta 1000gm', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '111.16', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10038', '12', '2', 'Chicken Kofta 12 pieces', 'Chicken Kofta 12 pieces', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '96.45', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10039', '12', '2', 'Chicken Shots', 'Small chicken shots', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG1004', '8', '1', 'Frankfurter Low fat', 'Frankfurter Low fat sausages 340gm', 'pkt', 'kg', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '79.89', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10040', '12', '2', 'Small Chicken  Nuggets', 'Chicken Nuggets small 260gms', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '29', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10041', '12', '2', 'Euro Chicken Nuggets Economy', 'Economy Chicken Nuggets 1000gms', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '119.68', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10042', '12', '2', 'Chicken Burger Patties Small', 'Small Chicken Burger Patties 370gm', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '60.39', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10043', '12', '2', 'Chicken Burger Patties Eco', 'Chicken Burger Patties 1000gms', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '157.54', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10044', '5', '2', 'Peshawari Beef Seekh Kabab', 'Peshawari beef seekh kabab', 'pkt', 'pkt', 'M', '4032', '5018', '1024', '5014', '1023', '0', '0', '0', '88.3', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10045', '12', '2', 'Peshawari Chicken Seekh Kabab', 'Peshawari Chicken seekh Kabab', 'pkt', 'pkt', 'M', '4042', '5019', '1024', '5014', '1023', '0', '0', '0', '111', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10046', '13', '2', 'Beef Mince 400gm', 'Beef Mince 400gm', 'pkt', 'pkt', 'M', '4011', '5018', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10047', '13', '2', 'Chicken Mince', 'Chicken Mince 400gm', 'pkt', 'pkt', 'M', '4011', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10048', '13', '2', 'Parata 5 piece ', 'Parata 5 Piece Pack', 'pkt', 'pkt', 'B', '4011', '5011', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('Fg10049', '13', '2', 'Special items 500gm', '500 gmsubways and misc items 500gm', 'pkt', 'pkt', 'M', '4011', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '', '', '', '', '', ''),
('FG1005', '8', '1', 'Frankfurter Jumbo Sausages', 'Frankfurter Jumbo Sausages 300gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '63.13', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG10050', '8', '2', 'Frankfurter Juice partise', 'FrankfurterJuice Partiese', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '', '', '', '', '', ''),
('FG10051', '13', '2', 'Speical Items 200gm', 'Subway and other 200gm', 'pkt', 'pkt', 'M', '4011', '5019', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '', '', '', '', '', ''),
('FG1006', '8', '2', 'Hunter Sausages', 'Hunter Sausages 340gm', 'pkt', 'pkt', 'M', '4031', '5018', '1024', '5014', '1023', '0', '0', '0', '80.2', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG1007', '11', '2', 'Chicken Sausages', 'Chicken Sausages 340gm', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '55.58', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG1008', '11', '2', 'Chicken Cheese Sausages', 'Chicken Cheese Sausages 340gm', 'pkt', 'kg', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '55.87', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('FG1009', '11', '2', 'Chicken Low Fat Sasuages', 'Chicken Low Fat Sausages', 'pkt', 'pkt', 'M', '4041', '5019', '1024', '5014', '1023', '0', '0', '0', '54.92', '0', '0', '0', '0', '1', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('OB', '13', '1', 'Opening Balance Equity', '', '', 'pkt', 'D', '3012', '3012', '1024', '5014', '1023', '0', '0', '36547', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('PM1001', '2', '1', 'Packing Material Boxes', 'Packing Material for HMR', 'pkt', 'pkt', 'D', '4011', '50301', '1021', '5014', '1023', '0', '0', '25', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1001', '2', '1', 'Beef meat', '', '', 'pcs', 'B', '4011', '5011', '1022', '5014', '1023', '0', '0', '350', '350', '0', '0', '0', '0', '0', '1', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1002', '9', '1', 'Chicken Boneless Meat', 'Boneless chicken breast, thigh and trimings', 'kg', 'kg', 'B', '4011', '5011', '1022', '5014', '1023', '0', '0', '250', '262.57', '0', '0', '0', '1', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1003', '9', '1', 'Beef meat', '', 'kg', 'kg', 'B', '4011', '5011', '1022', '5014', '1023', '0', '0', '338', '338', '0', '0', '0', '1', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1004', '9', '1', 'Chicken Skin', 'Chicken Skin', 'kg', 'kg', 'B', '4011', '5011', '1022', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1005', '9', '1', 'Beef Fat', 'Beef Fat', 'kg', 'kg', 'D', '4011', '5027', '1022', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1006', '9', '1', 'Local Spices and Misc Items', 'Misc local purchase', 'kg', 'kg', 'D', '4011', '5025', '1022', '5014', '1023', '0', '0', '100', '0', '0', '0', '0', '1', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('RM1007', '13', '2', 'Carton consumed', 'Cartons for finished goods', 'ctns', 'pcs', 'D', '4011', '5028', '1024', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '');

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
  `text1` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text4` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount1` double DEFAULT NULL,
  `amount2` double DEFAULT NULL,
  `amount3` double DEFAULT NULL,
  `amount4` double DEFAULT NULL,
  `amount5` double DEFAULT NULL,
  `amount6` double DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `date3` date DEFAULT NULL,
  `combo1` int(11) DEFAULT NULL,
  `combo2` int(11) DEFAULT NULL,
  `combo3` int(11) DEFAULT NULL,
  `combo4` int(11) DEFAULT NULL,
  `combo5` int(11) DEFAULT NULL,
  `combo6` int(11) DEFAULT NULL,
  `opening` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `type` (`type`,`trans_no`),
  KEY `Move` (`stock_id`,`loc_code`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_moves` ###

INSERT INTO `0_stock_moves` VALUES
('1', '1', 'OB', '13', 'DEF', '2017-06-30', '0', '0', 'auto', '-12500', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2', '2', 'OB', '13', 'DEF', '2017-06-30', '0', '12500', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('3', '3', 'OB', '13', 'DEF', '2017-10-01', '0', '11160', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4', '4', 'OB', '13', 'DEF', '2017-10-01', '0', '98490', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5', '5', 'OB', '13', 'DEF', '2017-10-01', '0', '70825', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6', '6', 'OB', '13', 'DEF', '2017-10-01', '0', '108433', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7', '7', 'OB', '13', 'DEF', '2017-10-01', '0', '47450', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8', '8', 'OB', '13', 'DEF', '2017-10-01', '0', '94647', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9', '9', 'OB', '13', 'DEF', '2017-06-30', '0', '56277', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('10', '10', 'OB', '13', 'DEF', '2017-06-30', '0', '15067', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('11', '11', 'OB', '13', 'DEF', '2017-06-30', '0', '55487', 'auto', '-1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('12', '1', 'OB', '25', 'DEF', '2017-06-30', '3', '36547', '', '1', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('13', '1', 'RM1003', '17', 'DEF', '2017-10-01', '0', '0', 'IA001/10/2017', '385', '338', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('14', '1', 'RM1002', '17', 'DEF', '2017-10-01', '0', '0', 'IA001/10/2017', '10403', '262.57', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('15', '2', 'FG1001', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '891', '81.36', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('16', '2', 'FG1002', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '133', '79.13', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('17', '2', 'FG1003', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '199', '80.07', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('18', '2', 'FG1004', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '74', '79.89', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('19', '2', 'FG1006', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '244', '80.2', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('20', '2', 'FG1007', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '476', '55.58', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('21', '2', 'FG1008', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '135', '55.87', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('22', '2', 'FG1009', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '226', '54.92', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('23', '2', 'FG10011', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '13', '35.55', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('24', '2', 'FG10014', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '9', '55.89', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('25', '2', 'FG10013', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '475', '54.83', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('26', '2', 'Fg10019', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '33', '45.74', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('27', '2', 'FG10018', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '400', '84.58', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('28', '2', 'FG10015', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '2603', '56.59', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('29', '2', 'FG10016', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '290', '55.6', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('30', '2', 'FG10021', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '249', '27.98', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('31', '2', 'FG10020', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '199', '34.79', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('32', '2', 'FG10010', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '281', '54.1', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('33', '2', 'FG1005', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '212', '63.13', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('34', '2', 'FG10012', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '123', '75', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('35', '2', 'FG10027', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '549', '53.16', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('36', '2', 'Fg10035', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '1125', '38.12', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('37', '2', 'FG10023', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '740', '98.79', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('38', '2', 'FG10024', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '641', '42.39', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('39', '2', 'Fg10031', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '934', '100.4', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('40', '2', 'Fg10032', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '787', '37.31', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('41', '2', 'Fg10025', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '297', '83.19', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('42', '2', 'FG10026', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '396', '32.12', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('43', '2', 'FG10033', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '246', '78.66', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('44', '2', 'FG10034', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '657', '31.81', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('45', '2', 'Fg10036', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '898', '43.42', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('46', '2', 'FG10028', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '1124', '47.14', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('47', '2', 'FG10041', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '1216', '119.68', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('48', '2', 'FG10040', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '1736', '29', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('49', '2', 'FG10043', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '28', '157.54', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('50', '2', 'FG10042', '17', 'DEF', '2017-10-01', '0', '0', 'IA002/10/2017', '88', '60.39', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('51', '3', 'FG10037', '17', 'DEF', '2017-10-01', '0', '0', 'IA003/10/2017', '237', '111.16', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('52', '3', 'FG10029', '17', 'DEF', '2017-10-01', '0', '0', 'IA003/10/2017', '245', '42.4', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('53', '3', 'FG10038', '17', 'DEF', '2017-10-01', '0', '0', 'IA003/10/2017', '206', '96.45', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('54', '3', 'FG10030', '17', 'DEF', '2017-10-01', '0', '0', 'IA003/10/2017', '184', '73.76', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('55', '3', 'FG10045', '17', 'DEF', '2017-10-01', '0', '0', 'IA003/10/2017', '265', '111', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('56', '3', 'FG10044', '17', 'DEF', '2017-10-01', '0', '0', 'IA003/10/2017', '263', '88.3', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('57', '18', 'Fg10031', '13', 'DEF', '2017-10-02', '0', '355', 'auto', '-2', '100.4', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('58', '18', 'FG1007', '13', 'DEF', '2017-10-02', '0', '200', 'auto', '-5', '55.58', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('59', '19', 'FG10030', '13', 'DEF', '2017-10-02', '0', '170', 'auto', '-20', '73.76', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('60', '19', 'FG10038', '13', 'DEF', '2017-10-02', '0', '170', 'auto', '-20', '96.45', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('61', '19', 'FG1001', '13', 'DEF', '2017-10-02', '0', '190', 'auto', '-6', '81.36', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('62', '19', 'FG1007', '13', 'DEF', '2017-10-02', '0', '220', 'auto', '-6', '55.58', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('63', '20', 'FG1001', '13', 'DEF', '2017-10-02', '0', '180', 'auto', '-22', '81.36', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('64', '21', 'Fg10035', '13', 'DEF', '2017-10-02', '0', '162', 'auto', '-15', '38.12', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('65', '21', 'Fg10031', '13', 'DEF', '2017-10-02', '0', '383', 'auto', '-12', '100.4', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('66', '21', 'Fg10036', '13', 'DEF', '2017-10-02', '0', '179', 'auto', '-12', '43.42', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('67', '21', 'FG1007', '13', 'DEF', '2017-10-02', '0', '260', 'auto', '-15', '55.58', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('68', '21', 'FG1001', '13', 'DEF', '2017-10-02', '0', '235', 'auto', '-15', '81.36', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('69', '21', 'FG1006', '13', 'DEF', '2017-10-02', '0', '235', 'auto', '-15', '80.2', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('70', '21', 'FG10024', '13', 'DEF', '2017-10-02', '0', '179', 'auto', '-12', '42.39', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('71', '21', 'Fg10032', '13', 'DEF', '2017-10-02', '0', '166', 'auto', '-12', '37.31', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('72', '21', 'FG10041', '13', 'DEF', '2017-10-02', '0', '459', 'auto', '-12', '119.68', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('73', '21', 'FG10040', '13', 'DEF', '2017-10-02', '0', '170', 'auto', '-12', '29', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('74', '21', 'FG10037', '13', 'DEF', '2017-10-02', '0', '421', 'auto', '-12', '111.16', '0', '0', '0', '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL);

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
  `text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text4` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text5` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text6` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `amount3` double NOT NULL,
  `amount4` double NOT NULL,
  `amount5` double NOT NULL,
  `amount6` double NOT NULL,
  `date1` date NOT NULL DEFAULT '0000-00-00',
  `date2` date NOT NULL DEFAULT '0000-00-00',
  `date3` date NOT NULL DEFAULT '0000-00-00',
  `combo1` int(11) NOT NULL,
  `combo2` int(11) NOT NULL,
  `combo3` int(11) NOT NULL,
  `combo4` int(11) NOT NULL,
  `combo5` int(11) NOT NULL,
  `combo6` int(11) NOT NULL,
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
  `opening` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_invoice_items` ###

INSERT INTO `0_supp_invoice_items` VALUES
('1', '1', '20', '0', '1', '1', 'OB', 'Opening Balance Equity', '1', '36547', '0', NULL, '0', '0', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL);

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
  `cheque_date` date NOT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_5` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opening` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_trans` ###

INSERT INTO `0_supp_trans` VALUES
('1', '0', '3', 'JV001/10/2017', '', '2017-10-03', '0000-00-00', '-36547', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '', '', NULL, NULL, NULL, NULL),
('1', '20', '3', 'PI001/06/2017', 'op bal', '2017-06-30', '2017-06-30', '36547', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '', '', NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('1', 'a qasab', 'qasab', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('3', 'Afshan &amp; Co Hayatabad', 'AfShan &amp; Co', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('4', 'Agro Tech Gurnawala ', 'agro Tech ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('5', 'Al habib Plastic ', 'Al habib Plastic ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('6', 'Al Halal chicken Lahore ', 'Al Halal chicken ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('7', 'Al Khair Enterprise  lahore ', 'Al khair Enterprise ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('8', 'Ameen Tech Lahore ', 'Ameen Tech Lahore ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('9', 'Art line Peshewar ', 'Art line Peshewar ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('10', 'B &amp; S Chicken ', 'B &amp; S Chicken ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('11', 'Big Bird pvt ltd ', 'Big Bird pvt ltd ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('12', 'D L Leasing company Germany ', 'D L Leasing company Germany ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('13', 'East West Foofd Lahore ', 'East West Foofd Lahore ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('14', 'Faisal Qureshi Rawalpindi', 'Faisal Qureshi Rawalpindi', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('15', 'Fazal Malik ', 'Fazal Malik ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('16', 'Fazal Trading Lahore corporation ', 'Fazal Trading Lahore corporati', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('17', 'Haleem &amp; Saleem butecher ', 'Haleem &amp; Saleem butecher ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('18', 'Hamid Butcher Peshawar ', 'Hamid Butcher Peshawar ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('19', 'Hareem&amp; Iman Enterprises ', 'Hareem&amp; Iman Enterprises ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('20', 'Hayatabad Packages ', 'Hayatabad Packages ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('21', 'Hazrat Intestine Peshawar city ', 'Hazrat Intestine Peshawar city', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('22', 'HI Enterprises karachi ', 'HI Enterprises karachi ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('23', 'Ilyas Plastic Dalazak Road Peshawar ', 'Ilyas Plastic Dalazak Road Pes', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('24', 'khan Packages Peshawar ', 'khan Packages Peshawar ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('25', 'Kold caraft Refgiration pvt ltd ', 'Kold caraft Refgiration pvt lt', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('26', 'Malik Mazhar Ali chemicals Peshawar ', 'Malik Mazhar Ali chemicals Pes', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('27', 'Maso printers Hayatabad ', 'Maso printers Hayatabad ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('28', 'Meat Suppilesr Shahibzada Peshawar ', 'Meat Suppilesr Shahibzada Pesh', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('29', 'Naveed Vegitable Peshawar ', 'Naveed Vegitable Peshawar ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('30', 'Pakistan International Printers ', 'Pakistan International Printer', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('31', 'Perfect foods pvt ltd lahroe ', 'Perfect foods pvt ltd lahroe ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('32', 'Poultry Plus lahroe ', 'Poultry Plus lahroe ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('33', 'Pros Pro Accounts ', 'Pros Pro Accounts ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('34', 'Qadir Buksh &amp; sons (Nadeem instetine )', 'Qadir Buksh &amp; sons (Nadeem', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('35', 'READA industries pvt ltd karachi ', 'READA industries pvt ltd karac', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('36', 'Rehmat Pacakages Hayatabad ', 'Rehmat Pacakages Hayatabad ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('37', 'Royal Frozen foods ', 'Royal Frozen foods', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('38', 'Salman Zaki karachi ', 'Salman Zaki karachi ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('39', 'Sareer Adverrtiser ', 'Sareer Adverrtiser ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('40', 'Sayed Intertional Islambad ', 'Sayed Intertional Islambad ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('41', 'Season Foods Lahore ', 'Season Foods Lahore ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('42', 'Shahzullah Printer New Accounts ', 'Shahzullah Printer New Account', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('43', 'Shahzullah Printer old Accounts', 'Shahzullah Printer old Account', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('44', 'Tahir Packaages ', 'Tahir Packaages', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('45', 'TUV Austria ', 'TUV Austria ', '', '', '', '', '', '', '', 'PKR', '7', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0');

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
('add_pct', 'setup.company', 'int', '5', '-1'),
('allow_negative_prices', 'glsetup.inventory', 'tinyint', '1', '1'),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', '1', '0'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', ''),
('bank_account', 'setup.company', 'varchar', '40', ''),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '5036'),
('bank_details', 'setup.company', 'tinytext', '0', ''),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', ''),
('company_logo_report', 'setup.company', 'tinyint', '1', '0'),
('coy_logo', 'setup.company', 'varchar', '100', ''),
('coy_name', 'setup.company', 'varchar', '60', 'Halal foods '),
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
('deferred_income_act', 'glsetup.sales', 'varchar', '15', '4022'),
('depreciation_period', 'glsetup.company', 'tinyint', '1', '1'),
('discount_algorithm', 'glsetup.sales', 'INT', '11', '7'),
('discount1', 'glsetup.sales', 'varchar', '15', '4025'),
('discount2', 'glsetup.sales', 'varchar', '15', '4025'),
('domicile', 'setup.company', 'varchar', '55', ''),
('email', 'setup.company', 'varchar', '100', ''),
('exchange_diff_act', 'glsetup.general', 'varchar', '15', '4023'),
('f_year', 'setup.company', 'int', '11', '3'),
('fax', 'setup.company', 'varchar', '30', ''),
('freight_act', 'glsetup.customer', 'varchar', '15', '4021'),
('gl_closing_date', 'setup.closing_date', 'date', '8', '2016-06-30'),
('grn_clearing_act', 'glsetup.purchase', 'varchar', '15', ''),
('gst_no', 'setup.company', 'varchar', '25', ''),
('hide_prices_grn', 'glsetup.purchase', 'tinyint', '1', ''),
('legal_text', 'glsetup.customer', 'tinytext', '0', ''),
('loc_notification', 'glsetup.inventory', 'tinyint', '1', ''),
('login_tout', 'setup.company', 'smallint', '6', '2000'),
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
('postal_address', 'setup.company', 'tinytext', '0', 'Peshawar'),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '5030'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '5016'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '3021'),
('round_to', 'setup.company', 'int', '5', '1'),
('shortname_name_in_list', 'setup.company', 'tinyint', '1', '0'),
('show_doc_ref', 'glsetup.purchase', 'tinyint', '1', '0'),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', '1', ''),
('show_prices_dn', 'glsetup.purchase', 'tinyint', '1', '1'),
('suppress_tax_rates', 'setup.company', 'tinyint', '1', ''),
('tax_algorithm', 'glsetup.customer', 'tinyint', '1', '1'),
('tax_last', 'setup.company', 'int', '11', '1'),
('tax_prd', 'setup.company', 'int', '11', '1'),
('time_zone', 'setup.company', 'tinyint', '1', '0'),
('use_dimension', 'setup.company', 'tinyint', '1', '1'),
('use_fixed_assets', 'setup.company', 'tinyint', '1', '1'),
('use_manufacturing', 'setup.company', 'tinyint', '1', '1'),
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
('pf_drill_text', 'Profit and Loss Drilldown'),
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
('invoice_prepaid_order_text', 'Invoice Prepaid Orders'),
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
('pf_drill_text', 'Profit and Loss Drilldown'),
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_trans_tax_details` ###

INSERT INTO `0_trans_tax_details` VALUES
('1', '13', '2', '2017-06-30', '1', '0', '1', '0', '12500', '0', 'auto', NULL),
('2', '10', '2', '2017-06-30', '1', '0', '1', '0', '12500', '0', 'SI002/06/2017', '0'),
('3', '13', '3', '2017-10-01', '1', '0', '1', '0', '11160', '0', 'auto', NULL),
('4', '10', '3', '2017-10-01', '1', '0', '1', '0', '0', '0', 'SI001/10/2017', '0'),
('5', '13', '4', '2017-10-01', '1', '0', '1', '0', '98490', '0', 'auto', NULL),
('6', '10', '4', '2017-10-01', '1', '0', '1', '0', '98490', '0', 'SI002/10/2017', '0'),
('7', '13', '5', '2017-10-01', '1', '0', '1', '0', '70825', '0', 'auto', NULL),
('8', '10', '5', '2017-10-01', '1', '0', '1', '0', '70825', '0', 'SI003/10/2017', '0'),
('9', '13', '6', '2017-10-01', '1', '0', '1', '0', '108433', '0', 'auto', NULL),
('10', '10', '6', '2017-10-01', '1', '0', '1', '0', '108433', '0', 'SI004/10/2017', '0'),
('11', '13', '7', '2017-10-01', '1', '0', '1', '0', '47450', '0', 'auto', NULL),
('12', '10', '7', '2017-10-01', '1', '0', '1', '0', '47450', '0', 'SI005/10/2017', '0'),
('13', '13', '8', '2017-10-01', '1', '0', '1', '0', '85182.3', '0', 'auto', NULL),
('14', '10', '8', '2017-10-01', '1', '0', '1', '0', '85182.3', '0', 'SI006/10/2017', '0'),
('15', '13', '9', '2017-06-30', '1', '0', '1', '0', '56277', '0', 'auto', NULL),
('16', '10', '9', '2017-06-30', '1', '0', '1', '0', '56277', '0', 'SI003/06/2017', '0'),
('17', '13', '10', '2017-06-30', '1', '0', '1', '0', '14313.65', '0', 'auto', NULL),
('18', '10', '10', '2017-06-30', '1', '0', '1', '0', '14313.65', '0', 'SI004/06/2017', '0'),
('19', '13', '11', '2017-06-30', '1', '0', '1', '1', '55487', '0', 'auto', NULL),
('20', '10', '11', '2017-06-30', '1', '0', '1', '1', '55487', '0', 'SI005/06/2017', '0'),
('21', '20', '1', '2017-06-30', '0', '0', '1', '0', '36547', '0', 'op bal', '1'),
('22', '10', '3', '2017-06-30', '1', '0', '1', '0', '0', '0', 'SI001/10/2017', '0'),
('23', '10', '3', '2017-06-30', '1', '0', '1', '0', '11160', '0', 'SI001/10/2017', '0'),
('24', '13', '18', '2017-10-02', '1', '0', '1', '0', '1710', '0', 'auto', NULL),
('25', '10', '18', '2017-10-02', '1', '0', '1', '0', '1710', '0', 'SI007/10/2017', '0'),
('26', '13', '19', '2017-10-02', '1', '0', '1', '0', '9260', '0', 'auto', NULL),
('27', '10', '19', '2017-10-02', '1', '0', '1', '0', '9260', '0', 'SI008/10/2017', '0'),
('28', '13', '20', '2017-10-02', '1', '0', '1', '0', '3600', '0', 'auto', NULL),
('29', '10', '20', '2017-10-02', '1', '0', '1', '0', '3600', '0', 'SI009/10/2017', '0'),
('30', '13', '21', '2017-10-02', '1', '0', '1', '0', '36864', '0', 'auto', NULL),
('31', '10', '21', '2017-10-02', '1', '0', '1', '0', '36864', '0', 'SI010/10/2017', '0');

### Structure of table `0_user_locations` ###

DROP TABLE IF EXISTS `0_user_locations`;

CREATE TABLE `0_user_locations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `loc_code` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_user_locations` ###

INSERT INTO `0_user_locations` VALUES
('1', 'DEF', '12', '0'),
('2', 'DEF', '18', '0'),
('3', 'DEF', '19', '0'),
('4', 'LHE', '19', '0'),
('5', 'DEF', '20', '0'),
('6', 'DEF', '21', '0'),
('7', 'ISL', '21', '0'),
('10', 'DEF', '23', '0'),
('9', 'ISL', '22', '0'),
('11', 'DEF', '24', '0'),
('12', 'DEF', '25', '0'),
('13', 'DEF', '26', '0'),
('14', 'DEF', '27', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5146 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###

INSERT INTO `0_useronline` VALUES
('5141', '1507020845', '111.119.172.84', '/sales/inquiry/customer_inquiry.php'),
('5142', '1507020855', '111.119.172.84', '/index.php'),
('5143', '1507020859', '111.119.172.84', '/manufacturing/work_order_entry.php'),
('5144', '1507020872', '111.119.172.84', '/index.php'),
('5145', '1507020877', '111.119.172.84', '/admin/backups.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('12', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Admin', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-03 13:54:03', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('20', 'adeel', '81dc9bdb52d04dc20036dbd8313ed055', 'Adeel Kakakhel', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '0', '2017-10-03 12:34:50', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('22', 'inam', '81dc9bdb52d04dc20036dbd8313ed055', 'Inam', '14', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-09-19 16:10:00', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('23', 'Qamar', '81dc9bdb52d04dc20036dbd8313ed055', 'qamar khan', '9', '', NULL, 'C', '1', '2', '0', '0', 'blackgold', 'A4', '2', '2', '4', '1', '1', '1', '0', '2017-10-03 12:33:02', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('24', 'imran', '81dc9bdb52d04dc20036dbd8313ed055', 'Imran shah', '9', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '0', '2017-10-03 11:50:16', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('25', 'Rahim', '81dc9bdb52d04dc20036dbd8313ed055', '', '13', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '0', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('26', 'aqeel', '81dc9bdb52d04dc20036dbd8313ed055', '', '13', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '0', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('27', 'NIAZ MUHAMMAD', 'd41d8cd98f00b204e9800998ecf8427e', 'NIAZ MUHAMMAD', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '0', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
  `co_account_supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`,`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wth_tax_types` ###

INSERT INTO `0_wth_tax_types` VALUES
('1', 'WHT Service', '0', 'wht_service', '1208', '0', '0', NULL),
('2', 'WHT Supply of goods', '0', 'wht_supply', '1210', '0', '0', NULL),
('3', 'WHT SRB Sales Tax', '0', 'wht_srb', '1209', '0', '0', NULL),
('4', 'WHT Sales Tax FBR', '0', 'wht_fbr', '1207', '0', '0', NULL),
('6', 'Filer Company', '4', '', '1015', '2', '1', NULL),
('7', 'Nonfiler Company', '6', '', '1210', '2', '1', NULL),
('8', 'Filer Other', '4.5', '', '1210', '2', '1', NULL),
('9', 'Nonfile Other', '6.5', '', '1210', '2', '1', NULL),
('10', 'Filer Company', '8', '', '1208', '1', '2', NULL),
('11', 'Nonfiler Company', '12', '', '1208', '1', '2', NULL),
('12', 'Filer Other', '10', '', '1208', '1', '2', NULL),
('13', 'Nonfiler Other', '15', '', '1208', '1', '2', NULL),
('14', 'SRB 1', '14', '', '1209', '3', '4', NULL),
('15', 'SRB 2', '20', '', '1209', '3', '4', NULL),
('16', 'FBR 1', '1', '', '1206', '4', '3', NULL),
('17', 'FBR 2', '20', '', '1206', '4', '3', NULL);
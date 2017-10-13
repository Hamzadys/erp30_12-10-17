# MySQL dump of database 'my_sysman' on host 'localhost'
# Backup Date and Time: 2017-07-31 00:35
# Built by SmartBiz 2.4.RC1
# http://smartbiz.cloud
# Company: RPL
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_areas` ###

INSERT INTO `0_areas` VALUES
('1', 'Global', '0'),
('2', 'Multan', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###

INSERT INTO `0_audit_trail` VALUES
('1', '32', '1', '1', '2017-07-04 02:15:33', NULL, '2', '2017-06-30', '0'),
('2', '32', '2', '6', '2017-07-04 04:16:36', NULL, '2', '2017-06-30', '0'),
('3', '18', '1', '6', '2017-07-04 04:28:46', NULL, '2', '2017-06-30', '0'),
('4', '1', '1', '1', '2017-07-04 04:54:24', NULL, '3', '2017-07-04', '0'),
('5', '30', '1', '1', '2017-07-04 05:11:18', NULL, '3', '2017-07-04', NULL),
('6', '13', '1', '1', '2017-07-12 04:27:11', NULL, '3', '2017-07-04', NULL),
('7', '10', '1', '1', '2017-07-12 04:27:11', NULL, '3', '2017-07-04', NULL),
('8', '30', '2', '1', '2017-07-04 05:09:38', NULL, '3', '2017-07-04', '0'),
('9', '13', '2', '1', '2017-07-12 04:27:01', NULL, '3', '2017-07-04', NULL),
('10', '10', '2', '1', '2017-07-12 04:27:01', NULL, '3', '2017-07-04', NULL),
('11', '30', '1', '1', '2017-07-04 05:11:18', 'Updated.', '3', '2017-07-04', '0'),
('12', '30', '3', '1', '2017-07-04 05:13:11', NULL, '3', '2017-07-04', '0'),
('13', '13', '3', '1', '2017-07-12 04:26:53', NULL, '3', '2017-07-04', NULL),
('14', '10', '3', '1', '2017-07-12 04:26:53', NULL, '3', '2017-07-04', NULL),
('15', '0', '17', '1', '2017-07-04 05:14:43', NULL, '3', '2017-07-04', '0'),
('16', '17', '1', '1', '2017-07-04 05:32:17', NULL, '3', '2017-07-04', '0'),
('17', '30', '4', '1', '2017-07-04 05:34:31', NULL, '3', '2017-07-04', '0'),
('18', '30', '5', '1', '2017-07-04 05:34:53', NULL, '3', '2017-07-04', '0'),
('19', '32', '3', '1', '2017-07-07 23:21:12', NULL, '3', '2017-07-07', '0'),
('20', '30', '6', '1', '2017-07-07 23:21:47', NULL, '3', '2017-07-07', '0'),
('21', '18', '2', '1', '2017-07-10 06:22:31', NULL, '3', '2017-07-10', '0'),
('22', '1', '2', '1', '2017-07-11 01:15:56', NULL, '3', '2017-07-11', '0'),
('23', '13', '3', '4', '2017-07-12 04:26:53', 'Voided.', '3', '2017-07-12', '0'),
('24', '10', '3', '4', '2017-07-12 04:26:53', 'Voided.\n', '3', '2017-07-12', '0'),
('25', '13', '2', '4', '2017-07-12 04:27:01', 'Voided.', '3', '2017-07-12', '0'),
('26', '10', '2', '4', '2017-07-12 04:27:01', 'Voided.\n', '3', '2017-07-12', '0'),
('27', '13', '1', '4', '2017-07-12 04:27:11', 'Voided.', '3', '2017-07-12', '0'),
('28', '10', '1', '4', '2017-07-12 04:27:11', 'Voided.\n', '3', '2017-07-12', '0'),
('29', '30', '7', '4', '2017-07-12 04:41:35', NULL, '3', '2017-07-12', '0'),
('30', '30', '8', '4', '2017-07-29 06:28:36', NULL, '3', '2017-07-01', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('101001', '3', 'PETTY CASH', '', 'PETTY CASH', NULL, 'PKR', '0', '9', '601605', '0000-00-00 00:00:00', '0', '0'),
('101005', '3', 'PETTY CASH PXS', '', 'PETTY CASH PXS', NULL, 'PKR', '0', '10', '601605', '0000-00-00 00:00:00', '0', '0'),
('101900', '3', 'PETTY CASH UOF', '', 'PETTY CASH UOF', NULL, 'PKR', '0', '11', '601605', '0000-00-00 00:00:00', '0', '0'),
('101999', '3', 'UNDEPOSIT CASH COLLECTION', '', 'UNDEPOSIT CASH COLLECTION', NULL, 'PKR', '0', '12', '601605', '0000-00-00 00:00:00', '0', '0'),
('102001', '0', 'HMBL 148581', '', 'HMBL 148581', NULL, 'PKR', '0', '13', '601605', '0000-00-00 00:00:00', '0', '0'),
('102002', '0', 'HMBL 150251', '', 'HMBL 150251', NULL, 'PKR', '0', '14', '601605', '0000-00-00 00:00:00', '0', '0'),
('102003', '0', 'NIB 10350287', '', 'NIB 10350287', NULL, 'PKR', '0', '15', '601605', '0000-00-00 00:00:00', '0', '0'),
('102900', '0', 'KASB 001 UOF', '', 'KASB 001 UOF', NULL, 'PKR', '0', '16', '601605', '0000-00-00 00:00:00', '0', '0'),
('102905', '0', 'NIB 547 UOF', '', 'NIB 547 UOF', NULL, 'PKR', '0', '17', '601605', '0000-00-00 00:00:00', '0', '0'),
('102910', '0', 'MCB 068', '', 'MCB 068', NULL, 'PKR', '0', '18', '601605', '0000-00-00 00:00:00', '0', '0');

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
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_trans` ###

INSERT INTO `0_bank_trans` VALUES
('1', '1', '1', '7', '001/2017', '2017-07-04', '-112000', '0', '0', '0', NULL, NULL),
('2', '1', '2', '13', '002/2017', '2017-07-11', '-1000', '0', '0', '0', NULL, NULL);

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
('101001 ', '', ' PETTY CASH   ', '101', '0'),
('101005 ', '', ' PETTY CASH PXS  ', '101', '0'),
('101900 ', '', ' PETTY CASH UOF  ', '101', '0'),
('101999 ', '', ' UNDEPOSIT CASH COLLECTION   ', '101', '0'),
('102001 ', '', ' HMBL 148581  ', '102', '0'),
('102002 ', '', ' HMBL 150251  ', '102', '0'),
('102003 ', '', ' NIB 10350287  ', '102', '0'),
('102900 ', '', ' KASB 19 619988 001 (UOF)', '102', '0'),
('102905 ', '', ' NIB HZ 10121547 (UOF)  ', '102', '0'),
('102910 ', '', ' MCB 10243068  ', '102', '0'),
('103100 ', '', ' PREPAID EXPENSE   ', '103', '0'),
('103100005 ', '', ' GENSET SERVICE &amp; MAINTENANCE   ', '103100', '0'),
('103200 ', '', ' DEPOSIT   ', '103', '0'),
('103200005 ', '', ' DEPOSIT FOR VEHICLE/GENSET FUEL   ', '103200', '0'),
('103300 ', '', ' ADVANCE TO STAFF   ', '103', '0'),
('103400 ', '', ' LOAN TO STAFF   ', '103', '0'),
('103400002 ', '', ' LOAN TO HAFIZ UR REHMAN   ', '103400', '0'),
('103400007 ', '', ' LOAN TO MOHAMMAD RAZA   ', '103400', '0'),
('103400015 ', '', ' LOAN TO SULEMAN   ', '103400', '0'),
('103400026 ', '', ' LOAN TO MUHAMMAD SOHAIL   ', '103400', '0'),
('103400027 ', '', ' LOAN TO SHOAIB KHAN   ', '103400', '0'),
('103400028 ', '', ' LOAN TO PERVAIZ KHAN   ', '103400', '0'),
('103400029 ', '', ' LOAN TO AYAZ   ', '103400', '0'),
('10340003 ', '', ' LOAN TO HUZEFA   ', '103400', '0'),
('103400030 ', '', ' LOAN TO BARKAT ALI   ', '103400', '0'),
('103400031 ', '', ' LOAN TO INAYATULLAH   ', '103400', '0'),
('103400032 ', '', ' LOAN TO FAROOQ AHMED   ', '103400', '0'),
('103400033 ', '', ' LOAN TO SULTAN ROOM   ', '103400', '0'),
('103400034 ', '', ' LOAN TO SAEED KHAN   ', '103400', '0'),
('103400035 ', '', ' LOAN TO QASIM ARMAN   ', '103400', '0'),
('103400036 ', '', ' LOAN TO VICTOR   ', '103400', '0'),
('103400037 ', '', ' LOAN TO RAHEEL UR REHMAN  ', '103400', '0'),
('103400038 ', '', ' LOAN TO KHUWAJA MOHAMMAD   ', '103400', '0'),
('103400039 ', '', ' LOAN TO USMAN   ', '103400', '0'),
('103400040 ', '', ' LOAN TO AQEEL DRIVER   ', '103400', '0'),
('103400041 ', '', ' LOAN TO IBRAHIM ABDULLAH   ', '103400', '0'),
('103400042 ', '', ' LOAN TO MAZHAR   ', '103400', '0'),
('103400043 ', '', ' LOAN TO GUL NAZAR   ', '103400', '0'),
('103400044 ', '', ' LOAN TO SAJID USMAN   ', '103400', '0'),
('103400045 ', '', ' LOAN TO SOHAIL SWEEPER   ', '103400', '0'),
('103400046 ', '', ' LOAN TO ADNAN SWEEPER   ', '103400', '0'),
('103400047 ', '', ' LOAN TO KALEEM AHMED   ', '103400', '0'),
('103400048 ', '', ' LOAN TO HUSSAIN SHABBIR   ', '103400', '0'),
('103400049 ', '', ' LOAN TO ABID   ', '103400', '0'),
('103400050 ', '', ' LOAN TO AKHTAR HUSSAIN   ', '103400', '0'),
('103400051 ', '', ' LOAN TO HANIF   ', '103400', '0'),
('103400052 ', '', ' LOAN TO SYED RASHID IQBAL   ', '103400', '0'),
('103400053 ', '', ' LOAN TO FURQAN   ', '103400', '0'),
('103400054 ', '', ' LOAN TO SHAFIQ SB   ', '103400', '0'),
('103400055 ', '', ' LOAN TO ZAINUDDIN   ', '103400', '0'),
('103400056 ', '', ' LOAN TO KEEMAT GUL   ', '103400', '0'),
('103400057 ', '', ' LOAN TO ISMAIL DRIVER   ', '103400', '0'),
('103400058 ', '', ' LOAN TO MOHAMMAD ALI BAIG   ', '103400', '0'),
('103400059 ', '', ' LOAN TO TAYYEB   ', '103400', '0'),
('103400060 ', '', ' LOAN TO NAVEED   ', '103400', '0'),
('103400061 ', '', ' LOAN TO ASHRAF   ', '103400', '0'),
('103800 ', '', ' ADVANCES TO SUPPLIER   ', '103', '0'),
('104001 ', '', ' ORD#001 ADW/0411/8741  ', '104', '0'),
('104002 ', '', ' ORD#002 KGT/0511/WCSL  ', '104', '0'),
('104003 ', '', ' ORD#003 KGT/0511/RI098  ', '104', '0'),
('104004 ', '', ' ORD#004 KGT/0611/RI100  ', '104', '0'),
('104005 ', '', ' ORD#005 R&amp;H/0611/906890704  ', '104', '0'),
('104006 ', '', ' ORD#006 KGT/0511/RI099  ', '104', '0'),
('10401 ', '', ' IMPORT RAW MATERIAL   ', '104', '0'),
('10401007 ', '', ' ORD#007 SHI/0611/LY11  ', '104', '0'),
('10401008 ', '', ' ORD#008 ASH/0611/11095  ', '104', '0'),
('10401009 ', '', ' ORD#009 KGT/0711/PWDD  ', '104', '0'),
('10401010 ', '', ' ORD#010 RKW/0711/AIC 1029 ', '104', '0'),
('10401011 ', '', ' ORD#011 YPN/0811/AS081602  ', '104', '0'),
('10401012 ', '', ' ORD#012 AKZ/0911/5400673035  ', '104', '0'),
('10401013 ', '', ' ORD#013 WCK/1111/142787089  ', '104', '0'),
('10401014 ', '', ' ORD#014 KGT/0112/WCSL2012  ', '104', '0'),
('10401015 ', '', ' ORD#015 KGT/0312/GPR201  ', '104', '0'),
('10401016 ', '', ' ORD#016 ECU/SCP/0612  ', '104', '0'),
('10401017 ', '', ' ORD#017 GRIM/EXPANDIT10R/0712  ', '104', '0'),
('10401018 ', '', ' ORD#018 KGT/KERNEOS/HAC/0712  ', '104', '0'),
('10401019 ', '', ' ORD#019 KGT/KG BONTIRA/FOAM AGNT/0812  ', '104', '0'),
('10401020 ', '', ' ORD#020 KGT/0812/GPR237883  ', '104', '0'),
('10401021 ', '', ' ORD#21 HFA/ADDITIVE FOR CONCRETE/MORTAR  ', '104', '0'),
('10401022 ', '', ' ORD #.22 BASF CHEMICALS/ACRONAL S 430 P  ', '104', '0'),
('10401023 ', '', ' ORD# 23 HFA/ADDITIVE FOR CONCRETE/MORTAR  ', '104', '0'),
('10401024 ', '', ' ORD #.24 ROCKWOOD CLAY NANOTHIX 1490 ', '104', '0'),
('10401025 ', '', ' ORD #25  SODIUM NAPTHALANE  ', '104', '0'),
('10401026 ', '', ' ORD #.26 DUO MIX SPARE PARTS   ', '104', '0'),
('10401027 ', '', ' ORD #.27 HANGZHONG FIRST ADHESIVE   ', '104', '0'),
('10401028 ', '', ' ORD #:28 REXIM TRADING FZE (POWER TROWEL)   ', '104', '0'),
('10401029 ', '', ' ORD #.29 M TEC SPARE PARTS  ', '104', '0'),
('10401030 ', '', ' ORD #.30 M TEC SPARE PARTS1  ', '104', '0'),
('10401031 ', '', ' ORD #:31 M TEC TRANSFER CHAMBER DUOMIX  ', '104', '0'),
('10401032 ', '', ' ORD # 32 STAINLESS STEEL MIXING TANK  ', '104', '0'),
('10401033 ', '', ' ORD #:33   TUBE FILLING &amp; SEALING MACHINE  ', '104', '0'),
('10401034 ', '', ' ORD #:34 EPOXY RESIN KAUKAWALA  ', '104', '0'),
('10401035 ', '', ' ORD #:35 M TEC RUBBER INSERT  ', '104', '0'),
('10401036 ', '', ' ORD #:36 M TEC SPARE PARTS  ', '104', '0'),
('10401037 ', '', ' ORD #:37 GLUE PACKING MACHINE   ', '104', '0'),
('10401038 ', '', ' ORD #:38 GR 100 PILOT PLT. FOR HARDNER &amp; EPOXY RES  ', '104', '0'),
('10405 ', '', ' LOCAL RM PURCHASE   ', '104', '0'),
('10405001 ', '', ' LOC ORD#001 RI/MATERIAL ', '104', '0'),
('10405002 ', '', ' LOC ORD#002 SABCON/VNP,ETHR ', '104', '0'),
('10405003 ', '', ' LOC ORD#003 PQCL/ HYDERATED LIME ', '104', '0'),
('10405004 ', '', ' LOC ORD#004 LUCKY CEMENT / OPC ', '104', '0'),
('10405005 ', '', ' LOC ORD#005 CROWN/SAND ', '104', '0'),
('10405006 ', '', ' LOC ORD#006 YGS/0811/?? ', '104', '0'),
('10405007 ', '', ' LOC ORD#007 FRZ/CALCIUM CARB. ', '104', '0'),
('10405008 ', '', ' LOC ORD#008 LUCKY CEMENT / W OPC', '104', '0'),
('10405009 ', '', ' LOC ORD#009 SOLVENT/XYLENE ', '104', '0'),
('10405010 ', '', ' LOC ORD#010 RED SAND  ', '104', '0'),
('10406 ', '', ' LOCAL PACKING MATERIAL   ', '104', '0'),
('10406001 ', '', ' PCK ORD#001 SPCL/PLASTIC BAGS ', '104', '0'),
('10406002 ', '', ' PCK ORD#002 TLP/PAPER BAGS ', '104', '0'),
('10411 ', '', ' IMPORT MACHINES &amp; EQUIPMENT   ', '104', '0'),
('10411001 ', '', ' PLM ORD#001 KGT/COMP/0811/GDFZ11 ', '104', '0'),
('10411002 ', '', ' PLM ORD#002 KGT/M TEC/DUOMIX', '104', '0'),
('10411003 ', '', ' PLM ORD#003 KGT/H&amp;B/PCK ', '104', '0'),
('10411004 ', '', ' PLM ORD#004 KGT/M TEC/LABEQ,MIXER,LABMIX', '104', '0'),
('10411005 ', '', ' PLM ORD#005 ECU/M TEC/DUOMIX', '104', '0'),
('10411006 ', '', ' PLM ORD#006 SFT/DIESEL/05048 ', '104', '0'),
('105010 ', '', ' ADV TAX IMPORT  WH U/S 148  ', '105', '0'),
('105015 ', '', ' ADV TAX SUPP/SVC   WH U/S 153  ', '105', '0'),
('105020 ', '', ' ADV TAX WD   WH U/S 231A  ', '105', '0'),
('105025 ', '', ' ADV TAX VEHICLE  WH U/S 234  ', '105', '0'),
('105030 ', '', ' ADV TAX TELEPHONE   WH U/S 236  ', '105', '0'),
('106005 ', '', ' BANK A/C CONTRA   ', '106', '0'),
('1081 ', '', 'Accounts Receivable Control A/C', '351', '0'),
('108ARC001', '', ' PROTECTION TECHNOLOGY   ', '108', '0'),
('108BUY002', '', '- ROCKRETE (PVT) LTD.', '108', '0'),
('108BUY003', '', '- FAIZE HAKIMI', '108', '0'),
('108BUY004', '', '- SAIFY MASJID', '108', '0'),
('108BUY005', '', '- MODERN HOSPITAL', '108', '0'),
('108BUY006', '', '- LUCKY PARAGON READYMIX LTD.', '108', '0'),
('108BUY007', '', '- UNICRETE (PVT) LTD.', '108', '0'),
('108BUY008', '', '- NADEEM BUKHARI', '108', '0'),
('108BUY009', '', '- KUTCHI JAMIA MASJID &quot;KASHTI WALI&quot; (KJM)', '108', '0'),
('108BUY010', '', '- JAVED SB', '108', '0'),
('108BUY011', '', '- MUSTAQEEM DYING &amp; PRINTING', '108', '0'),
('108BUY012', '', '- GULZARI ASSOCIATES', '108', '0'),
('108BUY013', '', '- BRISK ENGINEERING', '108', '0'),
('108BUY014', '', '- SAMEER GULZAR', '108', '0'),
('108BUY015', '', '- RIZWAN DEWAN', '108', '0'),
('108BUY016', '', '- GENERATION SCHOOL PVT. LTD', '108', '0'),
('108BUY017', '', '- INDUS DYEING MANUFACTURING CO. LTD.', '108', '0'),
('108BUY018', '', '- DECOR DISTRIBUTOR', '108', '0'),
('108BUY019', '', '- MOHAMMAD SHAFI TANNERIES (PVT.) LTD.', '108', '0'),
('108BUY020', '', '- TRADE LINKERS', '108', '0'),
('108BUY021', '', '- HIGH RISE PVT. LTD.', '108', '0'),
('108BUY022', '', '- PROGRESSIVE PLAZA', '108', '0'),
('108BUY023', '', '- MEHRAN PLASTIC', '108', '0'),
('108BUY024', '', '- AL-WAHID TOWER', '108', '0'),
('108BUY025', '', '- LAKHANI PRESIDENCY', '108', '0'),
('108BUY026', '', '- OM PERAKASH', '108', '0'),
('108BUY027', '', '- AHMED ZUBERI', '108', '0'),
('108BUY028', '', '- NAEEM BS', '108', '0'),
('108BUY029', '', '- HASANI MASJID', '108', '0'),
('108BUY030', '', '- ASGHAR WAHEED', '108', '0'),
('108BUY031', '', '- KHURRAM INAM', '108', '0'),
('108BUY032', '', '- SOHAIL BUKHARI', '108', '0'),
('108BUY033', '', '- RAMIZ BAIG', '108', '0'),
('108BUY034', '', '- PAN INDUSTRIES', '108', '0'),
('108BUY035', '', '- LIAQUAT NATIONAL HOSPITAL', '108', '0'),
('108BUY036', '', '- IMRAN LOTIA', '108', '0'),
('108BUY037', '', '- BRIGHT STAR BUILDER (SPORTS COMPLEX)', '108', '0'),
('108BUY038', '', '- A.G. GIGI (PVT) LTD', '108', '0'),
('108BUY039', '', '- NIRMAL DAAS', '108', '0'),
('108BUY040', '', '- AL-MAKKA TOWER', '108', '0'),
('108BUY041', '', '- FAWWAD &amp; JAWWAD (MEHMOOD MUKATI)', '108', '0'),
('108BUY042', '', '- DEEP ROCK DRILLING', '108', '0'),
('108BUY043', '', '- HUMAYUN USMAN', '108', '0'),
('108BUY044', '', '- QATAR HOUSE', '108', '0'),
('108BUY045', '', '- PROMPT ENGINEERING &amp; CONTRUCTOR', '108', '0'),
('108BUY046', '', '- AAA FACILITY MANAGMENT LTD', '108', '0'),
('108BUY047', '', '- TEXNET INTERNATIONAL (PVT) LTD', '108', '0'),
('108BUY048', '', '- BLOW PLAST (PVT) LTD', '108', '0'),
('108BUY049', '', '- MR. JAWEID C/O MUJEEB', '108', '0'),
('108BUY050', '', '- AZIZ SHIEKH', '108', '0'),
('108BUY051', '', '- POLYMER ACCESS (PVT) LTD', '108', '0'),
('108BUY052', '', '- PROGRESSIVE ENTERPRISES', '108', '0'),
('108BUY053', '', '- ARCH. FARIHA UBAID', '108', '0'),
('108BUY054', '', '- COMMANDER MALIK ARSHAD GILANI', '108', '0'),
('108BUY055', '', '- PROPORTIONS', '108', '0'),
('108BUY056', '', '- MR. FARHAN', '108', '0'),
('108BUY057', '', '- HANIF JALIAWALA', '108', '0'),
('108BUY058', '', '- TARIQ MASOOD ANSARI', '108', '0'),
('108BUY059', '', '- TUFAIL KHIMANI', '108', '0'),
('108BUY060', '', '- MUSTAFA HOSPITAL', '108', '0'),
('108BUY061', '', '- MUSHTAQ MUNAWAR', '108', '0'),
('108BUY062', '', '- REHM PACK (PROJECT MANAGER)', '108', '0'),
('108BUY063', '', '- AL-QAMAR MADRESSA', '108', '0'),
('108BUY064', '', '- IMDAD SB', '108', '0'),
('108BUY065', '', '- MR. FURQAN', '108', '0'),
('108BUY066', '', '- SHABBIR BHAI SADRIWALA', '108', '0'),
('108BUY067', '', '- HIRANI PHARMA', '108', '0'),
('108BUY068', '', '- GHAZANFAR ABBAS', '108', '0'),
('108BUY069', '', '- ASAD JUNAIDY', '108', '0'),
('108BUY070', '', '- MURTAZA JATOI', '108', '0'),
('108BUY071', '', '- SADIQ DHOSA', '108', '0'),
('108BUY072', '', '- PERVAIZ HASEEB', '108', '0'),
('108BUY073', '', '- EMAN AHMED', '108', '0'),
('108BUY074', '', '- JAMIA TUS SAIFIYAH', '108', '0'),
('108BUY075', '', '- TALAL KHAN', '108', '0'),
('108BUY076', '', '- OVAIS ASHRAF', '108', '0'),
('108BUY077', '', '- SHIELD CORPORATION LIMITED', '108', '0'),
('108BUY078', '', '- ALI MURTAZA', '108', '0'),
('108BUY079', '', '- R.B.BALOCH', '108', '0'),
('108BUY080', '', '- GHULAM MUSTAFA', '108', '0'),
('108BUY081', '', '- REHAN BALOCH', '108', '0'),
('108BUY082', '', '- ASHFAQ JANU', '108', '0'),
('108BUY083', '', '- IMAAN AHMED', '108', '0'),
('108BUY084', '', '- RABIA RAUF', '108', '0'),
('108BUY085', '', '- SHAMOON HALAI', '108', '0'),
('108BUY086', '', '- MACHIYARA GROUP', '108', '0'),
('108BUY087', '', '- MRS. MURAD RESIDENCE', '108', '0'),
('108BUY088', '', '- MRS. NOORI PATEL', '108', '0'),
('108BUY089', '', '- SAIFIYAH BOYS SCHOOL', '108', '0'),
('108BUY090', '', '- AL-RAHEEM TEXTILE', '108', '0'),
('108BUY091', '', '- IQRA UNIVERSITY', '108', '0'),
('108BUY092', '', '- FAR EASTERN IMPEX (PVT) LTD.', '108', '0'),
('108BUY093', '', '- MR. FARAZ C/O PROPORTION', '108', '0'),
('108BUY094', '', '- AZAM KHAN YOUSUF ZAI', '108', '0'),
('108BUY095', '', '- DR. JAVEID', '108', '0'),
('108BUY096', '', '- NOMAN MOTIWALA', '108', '0'),
('108BUY097', '', '- ATCO LABORATORIES', '108', '0'),
('108BUY098', '', '- THE PROFESSIONALS', '108', '0'),
('108BUY099', '', '- HANIF AGA SB', '108', '0'),
('108BUY100', '', '- NAFEES CONSTRUCTION', '108', '0'),
('108BUY101', '', '- SALMA MOIN', '108', '0'),
('108BUY102', '', '- IQBAL MEMON SB', '108', '0'),
('108BUY103', '', '- GUL MEMON SB', '108', '0'),
('108BUY104', '', '- FARHAN SB', '108', '0'),
('108BUY105', '', '- SHOAIB ISMAIL SB', '108', '0'),
('108BUY106', '', '- RASHEED TAREEN SB', '108', '0'),
('108BUY107', '', '- WAHEED ALI BURKI', '108', '0'),
('108BUY108', '', '- UNE ENTERPRISES', '108', '0'),
('108BUY109', '', '- UNION STEEL', '108', '0'),
('108BUY110', '', '- AJM CONSTRUCTION', '108', '0'),
('108BUY111', '', '- TOYOTA SOUTHERN MOTORS', '108', '0'),
('108BUY112', '', '- AHMED WAHEED', '108', '0'),
('108BUY113', '', '- NAWAB SB', '108', '0'),
('108BUY114', '', '- AMCORP CONSTRUCTION', '108', '0'),
('108BUY115', '', '- CAPT. NASIR', '108', '0'),
('108BUY116', '', '- ARCH. AFTAB ABBASI', '108', '0'),
('108BUY117', '', '- ZAHID ALI SHAH', '108', '0'),
('108BUY118', '', '- AL-HAMAD GLASS FIBER', '108', '0'),
('108BUY119', '', '- TANZO INTERNATIONAL (PAKISTAN)', '108', '0'),
('108BUY120', '', '- ARIF HABIB RESIDENCE', '108', '0'),
('108BUY121', '', '- RASHID AYUB SB', '108', '0'),
('108BUY122', '', '- SAQIB SB (ARA)', '108', '0'),
('108BUY123', '', '- FEROZE 1888 MILLS LIMITED', '108', '0'),
('108BUY124', '', '- ABDUL QADIR.', '108', '0'),
('108BUY125', '', '- ZAHRA HASSAN', '108', '0'),
('108BUY126', '', '- MOEEN AHMED SB', '108', '0'),
('108BUY127', '', '- SALIM SHAMS', '108', '0'),
('108BUY128', '', '- ARCH. SHEHLA TASLEEM', '108', '0'),
('108BUY129', '', '- ABDUL KAREEM', '108', '0'),
('108BUY130', '', '- BURJ-E-DEENAR', '108', '0'),
('108BUY131', '', '- MAIRAJ HOUSE', '108', '0'),
('108BUY132', '', '- FAZAIYA HOUSING SOCIETY', '108', '0'),
('108BUY133', '', '- PYRAMID CONSTRUCTION', '108', '0'),
('108BUY134', '', '- ARMY OFFICE HOUSING SOCIETY', '108', '0'),
('108BUY135', '', '- MR ZEESHAN', '108', '0'),
('108BUY136', '', '- COAST GUARD', '108', '0'),
('108BUY137', '', '- DEENU CHACHA', '108', '0'),
('108BUY138', '', '- M.RAFIQUE.IQBAL', '108', '0'),
('108CNT001', '', ' PARAGON CONSTRUCTORS (PVT) LTD   ', '108', '0'),
('108CNT002', '', ' SHAMSI BUILDERS LIMITED   ', '108', '0'),
('108CNT003', '', ' DEECON (PVT) LTD.   ', '108', '0'),
('108CNT004', '', ' SAUD   ', '108', '0'),
('108CNT005', '', ' A &amp; T BUILDERS   ', '108', '0'),
('108CNT006', '', ' CONTRACTOR MUBEEN   ', '108', '0'),
('108CNT007', '', ' STEEL CRETE   ', '108', '0'),
('108CNT008', '', ' PROGRESSIVE MARBLE   ', '108', '0'),
('108CNT009', '', ' NORTH VISTA   ', '108', '0'),
('108CNT010', '', ' AQEELA CORNER   ', '108', '0'),
('108CNT011', '', ' THE COMFORT   ', '108', '0'),
('108CNT012', '', ' SABIR   ', '108', '0'),
('108CNT013', '', ' AL KHALEEJ BUILDERS &amp; DEVELOPERS   ', '108', '0'),
('108CNT014', '', ' PIONEER ENTERPRISE   ', '108', '0'),
('108CNT015', '', ' AA QUALITY BUILDERS   ', '108', '0'),
('108CNT016', '', ' GOHAR TOWER   ', '108', '0'),
('108CNT017', '', ' CONTRACTOR MEHMOOD   ', '108', '0'),
('108CNT018', '', ' CONCRETE CONCEPT   ', '108', '0'),
('108CNT019', '', ' DATA SANITARY, HARDWARE &amp; ELECTRIC STORE   ', '108', '0'),
('108CNT020', '', ' QASIM   ', '108', '0'),
('108CNT021', '', ' TOTAL CONSTRUCTION   ', '108', '0'),
('108CNT022', '', ' RAO ISRAR   ', '108', '0'),
('108CNT023', '', ' NAJEEB RAHIM   ', '108', '0'),
('108CNT024', '', ' CONTRACTOR NAEEM   ', '108', '0'),
('108CNT025', '', ' MOHAMMAD HANIF   ', '108', '0'),
('108CNT026', '', ' CONT. RAFAT   ', '108', '0'),
('108CNT027', '', ' CONT. DEENU   ', '108', '0'),
('108CNT028', '', ' CONT. EHSAN   ', '108', '0'),
('108CSH100', '', ' CASH CUSTOMER   ', '108', '0'),
('108SUP001', '', '- FAME INTERNATIONAL', '108', '0'),
('108SUP002', '', '- S.M. ENTERPRISES', '108', '0'),
('108SUP003', '', '- NASIRUDDIN MARBLE', '108', '0'),
('108SUP004', '', '- NOOR ASSOCIATES', '108', '0'),
('108SUP005', '', '- TILES CENTRE', '108', '0'),
('108SUP006', '', '- MUSTAFA METAL MART', '108', '0'),
('108SUP007', '', '- GOGAN CEMENT', '108', '0'),
('108SUP008', '', '- HUSSAIN CHEMICAL', '108', '0'),
('108SUP009', '', '- MAKKA TILES', '108', '0'),
('108SUP010', '', '- CHINA TILE MART', '108', '0'),
('108SUP011', '', '- MUJEEB TRADERS', '108', '0'),
('108SUP012', '', '- USAMA TILE', '108', '0'),
('108SUP013', '', '- ROYAL CERAMICS', '108', '0'),
('108SUP014', '', '- GENERAL TRADERS', '108', '0'),
('108SUP015', '', '- MUZAMMIL TILES', '108', '0'),
('108SUP016', '', '- RAUSHAN MARBLE &amp; CO.', '108', '0'),
('108SUP017', '', '- AL-MADINA TILES', '108', '0'),
('108SUP018', '', '- SHAKEEL AHMED', '108', '0'),
('108SUP019', '', '- Z. BROTHERS (ZOEB SB)', '108', '0'),
('108SUP020', '', '- UNITED SANITARY', '108', '0'),
('108SUP021', '', '- K.N. GRANITE MARBLE &amp; TILES', '108', '0'),
('108SUP022', '', '- MAHMOOD SANITARY STORE', '108', '0'),
('108SUP023', '', '- KARACHI TRADING', '108', '0'),
('108SUP024', '', '- YOUNUS', '108', '0'),
('108SUP025', '', '- FIRDOUS TILES &amp; SANITARY', '108', '0'),
('108SUP026', '', '- NOBLE PAINT MART', '108', '0'),
('108SUP027', '', '- NASIR SANITARY', '108', '0'),
('108SUP028', '', '- UNIQUE CERAMICS', '108', '0'),
('108SUP029', '', '- KAMRAN', '108', '0'),
('108SUP030', '', '- MASTER SANITARY WORKS', '108', '0'),
('108SUP031', '', '- SUBHANALLAH SANITARY', '108', '0'),
('108SUP032', '', '- SALMAN SANITARY', '108', '0'),
('108SUP033', '', '- FLORA TILES', '108', '0'),
('108SUP034', '', '- ASIF CORPORATION', '108', '0'),
('108SUP035', '', '- SHAZIL PAKISTAN (PVT) LTD', '108', '0'),
('108SUP036', '', '- PROJECT MANAGERS', '108', '0'),
('108SUP037', '', '- RAJU TILE FIXTURES', '108', '0'),
('108SUP038', '', '- SUPREME PAINT HOUSE', '108', '0'),
('108SUP039', '', '- MR. KHALID', '108', '0'),
('108SUP040', '', '- MARIUM PAINT HOUSE', '108', '0'),
('108SUP041', '', '- ILYAS SB', '108', '0'),
('108SUP042', '', '- COLOR BANK', '108', '0'),
('108SUP043', '', '- LIAQAT PAINTS &amp; HARDWARE STORE', '108', '0'),
('108SUP044', '', '- TRIPLE TREE ASSOCIATES (THE MALL)', '108', '0'),
('108SUP045', '', '- AL-ABBAS PAINT HOUSE', '108', '0'),
('108SUP046', '', '- SONY SANITARY STORE', '108', '0'),
('108SUP047', '', '- A.S. PAINTS', '108', '0'),
('108SUP048', '', '- ASKARI BROTHERS', '108', '0'),
('108SUP049', '', '- SHAGUFTA PAINT HOUSE', '108', '0'),
('108SUP050', '', '- SANDLI TILES', '108', '0'),
('108SUP051', '', '- ALL PAKISTAN MEMON FEDERATION', '108', '0'),
('108SUP052', '', '- NOVATEX LIMITED', '108', '0'),
('108SUP053', '', '- AL-IBRAHIM &amp; SONS PAINT HOUSE', '108', '0'),
('108SUP054', '', '- NEW KHATTAK HARDWARE &amp; PAINT', '108', '0'),
('108SUP055', '', '- KHALID PAINT HOUSE', '108', '0'),
('108SUP056', '', '- BADRI PAINTS', '108', '0'),
('108SUP057', '', '- JAFERJEE &amp; SONS', '108', '0'),
('108SUP058', '', '- MOHAMMADI PAINTS &amp; HARDWARE STORE', '108', '0'),
('108SUP059', '', '- AHMED TRADER', '108', '0'),
('108SUP060', '', '- MADINA PAINT HOUSE', '108', '0'),
('108SUP061', '', '- MURTAZA CORPORATION', '108', '0'),
('108SUP062', '', '- SHAMIM PAINT HOUSE', '108', '0'),
('108SUP063', '', '- CONTRACTOR MUGHAL', '108', '0'),
('108SUP064', '', '- CONTRACTOR REHMAN', '108', '0'),
('108SUP065', '', '- HANIF GOHAR', '108', '0'),
('108SUP066', '', '- NEW BHATTI PAINTS &amp; HARDWARE STORE', '108', '0'),
('108SUP067', '', '- KHAN TRADERS', '108', '0'),
('108SUP068', '', '- KIRAN DEVELOPERS', '108', '0'),
('108SUP069', '', '- AMIR PAINT HOUSE', '108', '0'),
('108SUP070', '', '- NIPPON SANITATION', '108', '0'),
('108SUP071', '', '- LALA SARWAR CERA', '108', '0'),
('108SUP072', '', '- GRAVITY', '108', '0'),
('108SUP073', '', '- ZAIDI TRADERS', '108', '0'),
('108SUP074', '', '- DISCOVERY PAINT STORE', '108', '0'),
('108SUP075', '', '- BRIGHT ASSOCIATES', '108', '0'),
('108SUP076', '', '- KHALID AHMED', '108', '0'),
('108SUP077', '', '- SIFF (AJAZ ALI)', '108', '0'),
('108SUP078', '', '- PARSA CLASSIC', '108', '0'),
('108SUP079', '', '- LAKHANI TOWER &amp; SHOPPING MALL', '108', '0'),
('108SUP080', '', '- GOLDEN TILES', '108', '0'),
('108SUP081', '', '- PLOT #. F-75 (JAWAID SB', '108', '0'),
('108SUP082', '', '- RIGHT ANGLED', '108', '0'),
('108SUP083', '', '- UNITED TILE CENTRE', '108', '0'),
('108SUP084', '', '- M.IBRAHIM', '108', '0'),
('108SUP085', '', '- PARSA ESTABLISHMENT', '108', '0'),
('108SUP086', '', '- IRSHAD ALI SLAB WORKS', '108', '0'),
('108SUP087', '', '- PARSA TOWER', '108', '0'),
('108SUP088', '', '- MOSAIC COLLECTION', '108', '0'),
('108SUP089', '', '- INNOMATE', '108', '0'),
('108SUP090', '', '- FATIMIYAH EDUCATION NETWORK', '108', '0'),
('108SUP091', '', '- HAJI CHOHAN CEMENT', '108', '0'),
('108SUP092', '', '- TILE HOUSE', '108', '0'),
('108SUP093', '', '- KHALIQ &amp; SONS', '108', '0'),
('108SUP094', '', '- SINDH CEMENT DEPOT', '108', '0'),
('108SUP095', '', '- AHMED SANITARY', '108', '0'),
('108SUP096', '', '- AWAAN CERAMIC (TOTO)', '108', '0'),
('108SUP097', '', '- NOVOCHEM SPECIALITIES', '108', '0'),
('108SUP098', '', '- RAMZAN CEMENT DEPOT', '108', '0'),
('108SUP099', '', '- MR. ZAHEER', '108', '0'),
('108SUP100', '', '- TEHSEEN SB', '108', '0'),
('108SUP101', '', '- BURHANI TRADERS', '108', '0'),
('108SUP102', '', '- HAROON SB', '108', '0'),
('108SUP103', '', '- HAKIMI TRADERS', '108', '0'),
('108SUP104', '', '- POPULAR CEMENT WORK', '108', '0'),
('108SUP105', '', '- FAZAL HUSSAIN', '108', '0'),
('108SUP106', '', '- RESSICHEM GODAM (MISC)', '108', '0'),
('108SUP107', '', '- ABDULLAH TILES', '108', '0'),
('108SUP108', '', '- BHULLAY SHAH CERAMICS', '108', '0'),
('108SUP109', '', '- SONEX TILES &amp; CERAMICS', '108', '0'),
('108SUP110', '', '- ALI TILES', '108', '0'),
('108SUP111', '', '- PAK CORPORATION', '108', '0'),
('108SUP112', '', '- MEHMOOD SONS TILES &amp; SANITARY', '108', '0'),
('108SUP113', '', '- MOHAMMADI SANITARY MART', '108', '0'),
('108SUP114', '', '- ALI &amp; BROTHERS', '108', '0'),
('108SUP115', '', '- KING BUILDERS', '108', '0'),
('108SUP116', '', '- LIFE STYLE TILES', '108', '0'),
('108SUP117', '', '- MOHAMMADI CORPORATION', '108', '0'),
('108SUP118', '', '- THE ARCHITECTS', '108', '0'),
('108SUP119', '', '- AKBAR SANITARY', '108', '0'),
('108SUP120', '', '- BILAL CEMENT &amp; GROUTS', '108', '0'),
('108SUP121', '', '- FATIMA DEVELOPERS', '108', '0'),
('108SUP122', '', '- MUGHAL TILE', '108', '0'),
('108SUP123', '', '- THE BOOK MALL', '108', '0'),
('108SUP124', '', '- SAIFEE INTERIOR WORKS', '108', '0'),
('108SUP125', '', '- KAKA TILES', '108', '0'),
('108SUP126', '', '- A-1 TILES', '108', '0'),
('108SUP127', '', '- S.B. TILES', '108', '0'),
('108SUP128', '', '- TILE GALLERY', '108', '0'),
('108SUP129', '', '- CHOICE CENTRE', '108', '0'),
('108SUP130', '', '- SAIFY TILE', '108', '0'),
('108SUP131', '', '- SAIFEE PAINT HOUSE', '108', '0'),
('108SUP132', '', '- FEDERAL SANITARY', '108', '0'),
('108SUP133', '', '- AL-SEEMAB TILE', '108', '0'),
('108SUP134', '', '- ZCL', '108', '0'),
('108SUP135', '', '- VIRTRACO TILES', '108', '0'),
('108SUP136', '', '- SAMI TILES', '108', '0'),
('108SUP137', '', '- MASTER CENTRE', '108', '0'),
('108SUP138', '', '- IQBAL SANITARY MART', '108', '0'),
('108SUP139', '', '- ANWER SB (OK BUILDERS)', '108', '0'),
('108SUP140', '', '- ARABIAN SEA ENTERPRISES LIMITED', '108', '0'),
('108SUP141', '', '- A-ONE PAINT HARDWARE &amp; ELECTRIC STORE', '108', '0'),
('108SUP142', '', '- BISMILLAH PAINT &amp; HARDWARE', '108', '0'),
('108SUP143', '', '- NOOR MAHAL', '108', '0'),
('108SUP144', '', '- KHARADAR CEMENT DEPOT', '108', '0'),
('108SUP145', '', '- KOHINOOR PAINTS', '108', '0'),
('108SUP146', '', '- MOHAMMAD ALI MALKANI', '108', '0'),
('108SUP147', '', '- NASIR &amp; SONS', '108', '0'),
('108SUP148', '', '- AL-HATEMI PAINT HOUSE', '108', '0'),
('108SUP149', '', '- AL-RAHEEM PAINTS', '108', '0'),
('108SUP150', '', '- ARAISH', '108', '0'),
('108SUP151', '', '- AL-HAIDER PAINT HOUSE', '108', '0'),
('108SUP152', '', '- AL-KARIM PAINT HOUSE', '108', '0'),
('108SUP153', '', '- TILE MASTER', '108', '0'),
('108SUP154', '', '- SHERIYAL TILE', '108', '0'),
('108SUP155', '', '- KARACHI PAINT HOUSE', '108', '0'),
('108SUP156', '', '- SAMS HARDWARE', '108', '0'),
('108SUP157', '', '- TANVEER MAKHDOOMI SB', '108', '0'),
('108SUP158', '', '- BHAI JEE BHAI PAINTS', '108', '0'),
('108SUP159', '', '- MURAD HARDWARE', '108', '0'),
('108SUP160', '', '- AZIZ PAINTS', '108', '0'),
('108SUP161', '', '- ISRA UNIVERSITY', '108', '0'),
('108SUP162', '', '- KHUWAJA SANITATION', '108', '0'),
('108SUP163', '', '- PREMIER MARCHANTILE SERVICES', '108', '0'),
('108SUP164', '', '- WALLS &amp; WOODS', '108', '0'),
('108SUP165', '', '- BADRI HIGH SCHOOL', '108', '0'),
('108SUP166', '', '- IK ASSOCIATES', '108', '0'),
('108SUP167', '', '- ZAMZAM PAINTS (TARIQ SB)', '108', '0'),
('108SUP168', '', '- H.H. TRADERS', '108', '0'),
('108SUP169', '', '- DUBAI TILE', '108', '0'),
('108SUP170', '', '- SHAH HARDWARE', '108', '0'),
('108SUP171', '', '- HI-TECH CONSTRUCTION', '108', '0'),
('108SUP172', '', '- MALIK BROTHERS', '108', '0'),
('108SUP173', '', '- HATIMI HARDWARE &amp; SANITARY', '108', '0'),
('108SUP174', '', '- SAEED HABIB SB', '108', '0'),
('108SUP175', '', '- ZEESHAN TILE', '108', '0'),
('108SUP176', '', '- BOULEVARD MALL (HERO CONSTRUCTION)', '108', '0'),
('108SUP177', '', '- SOHAIL SANITARY STORE', '108', '0'),
('108SUP178', '', '- ASLAM ANWER SB', '108', '0'),
('108SUP179', '', '- AL-MUSTAFA PAINT HOUSE', '108', '0'),
('108SUP180', '', '- JAWED &amp; BROTHERS', '108', '0'),
('108SUP181', '', '- DR. COLOR PAINT HOUSE', '108', '0'),
('108SUP182', '', '- AL-BURHAN SANITARY', '108', '0'),
('108SUP183', '', '- YOUSUF ALI TAYABJI MUNDRAWALA &amp; SONS', '108', '0'),
('108SUP184', '', '- ZOAIB ALI &amp; COMPANY', '108', '0'),
('108SUP185', '', '- HUSSAIN TRADERS', '108', '0'),
('108SUP186', '', '- UNITED TILE GALLERY', '108', '0'),
('108SUP187', '', '- MRA BUILDER', '108', '0'),
('108SUP188', '', '- NASEEM KHAN', '108', '0'),
('108SUP189', '', '- NASIR-2', '108', '0'),
('108SUP190', '', '- AL-MOHAMMADI TILE', '108', '0'),
('108SUP191', '', '- THE CONSTRUCT', '108', '0'),
('108SUP192', '', '- M.TAHA TILE', '108', '0'),
('108SUP193', '', '- CONT. ALI', '108', '0'),
('108SUP194', '', '- ANJUM SB C/O RAFAY', '108', '0'),
('108SUP195', '', '- 3G CONSTRUCTION', '108', '0'),
('108SUP196', '', '- MR. MURTAZA', '108', '0'),
('108SUP197', '', '- BURHAN HARDWARE &amp; TOOLS CO.', '108', '0'),
('108SUP198', '', '- M. AKBAR HARDWARE STORE', '108', '0'),
('108SUP199', '', '- T.A.GULAMALLAY &amp; CO.', '108', '0'),
('108SUP200', '', '- GHANI HARDWARE', '108', '0'),
('108SUP201', '', '- ANSAR BROTHERS', '108', '0'),
('108SUP202', '', '- MAQBOOL AHMED', '108', '0'),
('108SUP203', '', '- BURHANI HARDWARE STORE', '108', '0'),
('108SUP204', '', '- G.N FUS', '108', '0'),
('108SUP205', '', '- MOHAMMADI TRADERS', '108', '0'),
('108SUP206', '', '- MOIZ TOOLS', '108', '0'),
('108SUP207', '', '- KHUWAJA RAFAY', '108', '0'),
('108SUP208', '', '- ZULFIQAR HARDWARE', '108', '0'),
('108SUP209', '', '- NOOR TRADERS', '108', '0'),
('108SUP210', '', '- ALVI HARDWARE', '108', '0'),
('108SUP211', '', '- EJAZ HARDWARE &amp; PAINT HOUSE', '108', '0'),
('108SUP212', '', '- NAEEM HARDWARE', '108', '0'),
('108SUP213', '', '- SAIFEE HARDWARE STORE', '108', '0'),
('108SUP214', '', '- M.M ALAM', '108', '0'),
('108SUP215', '', '- NAJAM HARDWARE STORE', '108', '0'),
('108SUP216', '', '- ABBASI TRADERS', '108', '0'),
('108SUP217', '', '- BURHANI ENTERPRISES', '108', '0'),
('108SUP218', '', '- AMIR TOOLS', '108', '0'),
('108SUP219', '', '- HAZARI ENTERPRISE', '108', '0'),
('108SUP220', '', '- Z.A TRADERS', '108', '0'),
('108SUP221', '', '- HAJI SALEEM', '108', '0'),
('108SUP222', '', '- GLOBAL HARDWARE &amp; PAINTS', '108', '0'),
('108SUP223', '', '- ABASEEN CONSTRUCTION CO. PVT LTD', '108', '0'),
('108SUP224', '', '- FAROOQ HARDWARE', '108', '0'),
('108SUP225', '', '- JAMA MASJID NOORANI', '108', '0'),
('108SUP226', '', '- COLOR CENTRE', '108', '0'),
('108SUP227', '', '- RAWAL MASJID', '108', '0'),
('108SUP228', '', '- SYED HARDWARE AND TOOLS', '108', '0'),
('108SUP229', '', '- IMRAN NAVTAKIA', '108', '0'),
('108SUP230', '', '- NIAZI HARDWARE', '108', '0'),
('108SUP231', '', '- ASK BUILDERS', '108', '0'),
('108SUP232', '', '- SHABBIR SONS', '108', '0'),
('108SUP233', '', '- MUNIR IMPEX', '108', '0'),
('108SUP234', '', '- SURROUND DESIGN STUDIO', '108', '0'),
('108SUP235', '', '- ABDUL JABBAR CARPENTER', '108', '0'),
('108SUP236', '', '- ABDUL QADIR JAAFRANI', '108', '0'),
('108SUP237', '', '- RAMZAN TRADERS', '108', '0'),
('108SUP238', '', '- AMMAR HARDWARE STORE', '108', '0'),
('108SUP239', '', '- AL-MOIZ HARDWARE', '108', '0'),
('108SUP240', '', '- FAISAL HARDWARE', '108', '0'),
('108SUP241', '', '- AL-HASNAIN HARDWARE', '108', '0'),
('108SUP242', '', '- H2O HOME TILES', '108', '0'),
('108SUP243', '', '- MUSTAFA HARDWARE', '108', '0'),
('108SUP244', '', '- MATRIX SYSTEM (PVT) LTD', '108', '0'),
('108SUP245', '', '- CLIFTON COMFORT', '108', '0'),
('108SUP246', '', '- NEW STAR HARDWARE', '108', '0'),
('108SUP247', '', '- TARIQ SIDDIQUI', '108', '0'),
('108SUP248', '', '- IQBAL HARDWARE', '108', '0'),
('108SUP249', '', '- ZEENAT HARDWARE', '108', '0'),
('108SUP250', '', '- AMEER BROTHERS HARDWARE STORE', '108', '0'),
('108SUP251', '', '- M.SIDDIQ SON', '108', '0'),
('108SUP252', '', '- COLOR WORLD', '108', '0'),
('108SUP253', '', '- ABDULLAH ESTATES', '108', '0'),
('108SUP254', '', '- MASHALLAH HARDWARE', '108', '0'),
('108SUP255', '', '- MUSTAFA TOOLS &amp; HARDWARE STORE', '108', '0'),
('108SUP256', '', '- HUSSAINI HARDWARE', '108', '0'),
('108SUP257', '', '- FARAZ CEMENT DEPOT', '108', '0'),
('108SUP258', '', '- M.I.M. SIDDIQ &amp; CO.', '108', '0'),
('108SUP259', '', '- MURTAZA LOKHANDWALA.', '108', '0'),
('108SUP260', '', '- MARGALA MOTORS', '108', '0'),
('108SUP261', '', '- TANVEER BANGLES', '108', '0'),
('108SUP262', '', '- KAMRAN TILE', '108', '0'),
('108SUP263', '', '- K.M.A. TRADING EST.', '108', '0'),
('108SUP264', '', '- TAHERI HARDWARE STORES', '108', '0'),
('108SUP265', '', '- AL-BILAL ELECTRIC', '108', '0'),
('108SUP266', '', '- SHAFQAT SB', '108', '0'),
('108SUP267', '', '- TECHNO CRATE', '108', '0'),
('108SUP268', '', '- SHAHID BEADING CENTRE', '108', '0'),
('108SUP269', '', '- MAKKI MASJID', '108', '0'),
('108SUP270', '', '- AMMAR HARDWARE &amp; KITCHEN', '108', '0'),
('108SUP271', '', '- HAZARI IMPEX', '108', '0'),
('108SUP272', '', '- MASHALLAH TRADERS', '108', '0'),
('108SUP273', '', '- ZAHID MARBLE', '108', '0'),
('108SUP274', '', '- BURHANI SANITARY', '108', '0'),
('108SUP275', '', '- UNIVERSAL TRADING / RASHID TILE', '108', '0'),
('108SUP276', '', '- R &amp; H ENTERPRISES', '108', '0'),
('108SUP277', '', '- JUNAID MAKDA', '108', '0'),
('108SUP278', '', '- R &amp; I ELECTRICAL APPLIANCES (PVT) LTD.', '108', '0'),
('108SUP279', '', '- HANIF BANGLES', '108', '0'),
('108SUP280', '', '- BOLAN ENTERPRISES', '108', '0'),
('108SUP281', '', '- MR FAISAL', '108', '0'),
('108SUP282', '', '- NEW JILLANI CEMENT', '108', '0'),
('108SUP283', '', '- GHANDHARA NISSAN LTD', '108', '0'),
('108SUP284', '', '- SALEEM INTERNATIONAL', '108', '0'),
('108SUP285', '', '- ANUSHA&#039;S RESIDENCY', '108', '0'),
('108SUP286', '', '- Popular Marble', '108', '0'),
('108SUP287', '', '- FOUR STAR CORPORATION.', '108', '0'),
('108SUP288', '', '- TAHER &amp; SONS HARDWARE HOUSE', '108', '0'),
('108SUP289', '', '- NATIONAL PAINT HOUSE', '108', '0'),
('108SUP290', '', '- DOLMEN REAL ESTATE MANAGEMENT (PVT) LTD', '108', '0'),
('108SUP999', '', '- TRADE CUSTOMERS', '108', '0'),
('109CSH101', '', '  ANEELA CHUGHTAI  ', '109', '0'),
('114005 ', '', ' SALES TAX   IMPORT/LOCAL  ', '114', '0'),
('114010 ', '', ' SALES TAX   OTHERS  ', '114', '0'),
('114015 ', '', ' SALES TAX   MOBILE PHONE  ', '114', '0'),
('114016 ', '', ' WH AR SALES TAX SPECIAL PROCEDURE   ', '114', '0'),
('115100 ', '', ' RAW MATERIAL   IMPORT  ', '115', '0'),
('115190 ', '', ' RAW MATERIAL SCP  ', '115', '0'),
('115300 ', '', ' RAW MATERIAL   LOCAL  ', '115', '0'),
('115910 ', '', ' RAW MATERIAL   SAMPLE  ', '115', '0'),
('115950 ', '', ' RAW MATERIAL   UOF  ', '115', '0'),
('115951 ', '', ' PROVISION FOR SLOW MOVING STOCK RM ', '115', '0'),
('117100 ', '', ' WORK IN PROCESS   RM  ', '117', '0'),
('119', '', '- STOCK IN HAND - FG', '', '0'),
('1191 ', '', 'Inventory Control A/C', '119', '0'),
('11910', '', ' FG-WATERPROOFING', '119', '0'),
('11910001', '', '- FG-RESSICOAT X-491', '119', '0'),
('11910002', '', '- FG-RESSICOAT-3020', '119', '0'),
('11910010', '', '- FG-RESSI LURRY', '119', '0'),
('11910051', '', '- FG-MOYA PROOF CWL', '119', '0'),
('11910056', '', '- FG-MOYA SHIELD BE', '119', '0'),
('11910061', '', '- FG-MOYA PROOF CWP', '119', '0'),
('11920', '', '- FG-DAMP PROOFING', '119', '0'),
('11920001', '', '- FG-SILBLOCK', '119', '0'),
('11920002', '', '- FG-SILBLOCK PR', '119', '0'),
('11920011', '', '- FG-SILDIP', '119', '0'),
('11920021', '', '- FG-SILMIX', '119', '0'),
('11930', '', '- FG-STAIN RESISTANT', '119', '0'),
('11930001', '', '- FG-SILBLOCK AG', '119', '0'),
('11940', '', '- FG-PRE MIX MORTARS', '119', '0'),
('11940001', '', '- FG-RESSI TA-210', '119', '0'),
('11940002', '', '- FG-RESSI TA-230', '119', '0'),
('11940003', '', '- FG-RESSI TA-240', '119', '0'),
('11940004', '', '- FG-RESSI TA-220', '119', '0'),
('11940005', '', '- FG-RESSI TA-250', '119', '0'),
('11940006', '', '- FG-RESSI TA-260', '119', '0'),
('11940007', '', '- FG-RESSI TA-230 G', '119', '0'),
('11940101', '', '- FG-RESSI PLASTOREND', '119', '0'),
('11940102', '', '- FG-RESSI PLASTOREND 110', '119', '0'),
('11940103', '', '- FG-RESSI PLASTOREND 120', '119', '0'),
('11940104', '', '- FG-RESSI GYPSOMIGHT 9010', '119', '0'),
('11940105', '', '- FG- RESSI PLASTOREND 120-R', '119', '0'),
('11940106', '', '- FG-RESSI  LIMOMIGHT 8000', '119', '0'),
('11940150', '', '- FG-RESSI SC-3009C', '119', '0'),
('11940201', '', '- FG-RESSI SLS-630', '119', '0'),
('11940202', '', '- FG-RESSI SLS-610', '119', '0'),
('11940203', '', '- FG-RESSI GROUT GP NSG-710', '119', '0'),
('11940301', '', '- FG-RESSI SC-310', '119', '0'),
('11940401', '', '- FG-PUMPABLE SCREED', '119', '0'),
('11944', '', '- FG-PREMIX REPAIR MORTAR', '119', '0'),
('11944001', '', '- FG-RESSI RM-410', '119', '0'),
('11944002', '', '- FG-RESSI CFC-920', '119', '0'),
('11944003', '', '- FG-RESSI RM-430', '119', '0'),
('11944101', '', '- FG-RESSI CFM--910', '119', '0'),
('11944201', '', '- FG-RESSI RUSHCOAT-170', '119', '0'),
('11946', '', '- FG-PREMIX TILE GROUT', '119', '0'),
('11946001', '', '- FG-TILE GROUT', '119', '0'),
('11960', '', '- FG-SPECIALITY &amp; PERFORMANCE MTRL', '119', '0'),
('11960001', '', '- FG-RESSI SBR-1358', '119', '0'),
('11960002', '', '- FG-SILPRIME-3K', '119', '0'),
('11960003', '', '- FG-SILPRIME WB', '119', '0'),
('11960200', '', '- FG-RESSI PUTTY', '119', '0'),
('11960300', '', '- FG-INSULATION PRODUCT', '119', '0'),
('11960400', '', '- FG-RESSI GRAPHY', '119', '0'),
('11960500', '', '- FG-RESSI MUD', '119', '0'),
('11960600', '', '- FG-RESSI CFM FLEXI 2K', '119', '0'),
('11960700', '', '- FG-RESSI SASSOLTALIA', '119', '0'),
('11960901', '', '- FG-OTHER FINISH GOOD STOCK', '119', '0'),
('11960902', '', '- PROVISION FOR SLOW-MOVING STOCK-TRADING', '119', '0'),
('11970', '', '- FG-ADMIXTURES', '119', '0'),
('11970001', '', '- FG-RESSI SP-088 N', '119', '0'),
('11970002', '', '- FG-RESSI SP-044 N', '119', '0'),
('11970003', '', '- FG-RESSI TILE LATEX 205', '119', '0'),
('11980', '', '- FG-SCP-SPECIALITY CONCRETE PRODUCT INC', '119', '0'),
('11980001', '', '- RELEASE AGENT (RENEW CRETE -POWDERED &amp; LIQUID)', '119', '0'),
('11980002', '', '- ANTIQUING RELEASE AGENT (SCP)', '119', '0'),
('11980003', '', '- CHROME ETCH CONC ACID STAIN', '119', '0'),
('11980004', '', '- IRON PIGMENT', '119', '0'),
('11980005', '', '- COLOR HARDNER (SCP &amp; RC)', '119', '0'),
('11980006', '', '- CONCRETE COUNTER TOP (MIX)', '119', '0'),
('11980007', '', '- STAMP OVERLAY MIX (SCP)', '119', '0'),
('11980008', '', '- STENCIL CRETE COLOR GROUT (SCP)', '119', '0'),
('11980009', '', '- VERTICAL STAMP MIX (MAGNUM CRETE)', '119', '0'),
('11980010', '', '- MICRO TOPING WHITE (SCP)', '119', '0'),
('11980011', '', '- ELVAC CPS 720', '119', '0'),
('11981', '', '- FG-Jali', '119', '0'),
('11981001', '', '- FG-RESSI JALI', '119', '0'),
('13105 ', '', ' LAND &amp; BUILDING   ', '131', '0'),
('13105100 ', '', ' BUILDING   ', '131', '0'),
('13105300 ', '', ' BUILDING CUM DEPR&#039;N   ', '131', '0'),
('13105301 ', '', ' ALLOWANCE FOR DEPRECIATION   ', '131', '0'),
('13105302 ', '', ' CWIP BUILDING   ', '131', '0'),
('13110 ', '', ' PLANT &amp; MACHINERY   ', '131', '0'),
('13110100 ', '', ' PLANT &amp; MACHINERY COST   ', '131', '0'),
('13110200 ', '', ' PLANT &amp; MACHINERY DISPOSAL   ', '131', '0'),
('13110300 ', '', ' PLANT &amp; MACHINERY CUM DEPR&#039;N   ', '131', '0'),
('13115 ', '', ' FACTORY TOOLS &amp; EQUIPMENTS   ', '131', '0'),
('13115100 ', '', ' FACTORY TOOLS &amp; EQUIPMENT COST   ', '131', '0'),
('13115200 ', '', ' FACTORY TOOLS &amp; EQUIPMENT DISPOSAL   ', '131', '0'),
('13115300 ', '', ' FACTORY TOOLS &amp; EQUIPMENT CUM DEPR&#039;N   ', '131', '0'),
('13115301 ', '', ' IMPULSE SEALEER 16&quot;   ', '131', '0'),
('13118 ', '', ' FACTORY GENERATORS   ', '131', '0'),
('13118100 ', '', ' FACTORY GENERATOR COST   ', '131', '0'),
('13118200 ', '', ' FACTORY GENERATOR DISPOSAL   ', '131', '0'),
('13118300 ', '', ' FACTORY GENERATOR CUM DEPR&#039;N   ', '131', '0'),
('13120 ', '', ' LAB EQUIPMENTS   ', '131', '0'),
('13120100 ', '', ' LAB EQUIPMENT COST   ', '131', '0'),
('13120200 ', '', ' LAB EQUIPMENT DISPOSAL   ', '131', '0'),
('13120300 ', '', ' LAB EQUIPMENT CUM DEPR&#039;N   ', '131', '0'),
('13122 ', '', ' LAB FURNITURE &amp; FIXTURE   ', '131', '0'),
('13122100 ', '', ' LAB FURNITURE &amp; FIX. COST   ', '131', '0'),
('13122200 ', '', ' LAB FURNITURE &amp; FIX. DISPOSAL   ', '131', '0'),
('13122300 ', '', ' LAB FURNITURE &amp; FIX. CUM DEPR&#039;N   ', '131', '0'),
('13125 ', '', ' FACTORY VEHICLES   ', '131', '0'),
('13125100 ', '', ' FACTORY VEHICLE COST   ', '131', '0'),
('13125200 ', '', ' FACTORY VEHICLE DISPOSAL   ', '131', '0'),
('13125300 ', '', ' FACTORY VEHICLE CUM DEPR&#039;N   ', '131', '0'),
('13130 ', '', ' FACTORY FURNITURE &amp; FIXTURE   ', '131', '0'),
('13130100 ', '', ' FACTORY FURNITURE &amp; FIX. COST   ', '131', '0'),
('13130200 ', '', ' FACTORY FURNITURE &amp; FIX. DISPOSAL   ', '131', '0'),
('13130300 ', '', ' FACTORY FURNITURE &amp; FIX. CUM DEPR&#039;N   ', '131', '0'),
('13135 ', '', ' PRINTING BLOCKS   ', '131', '0'),
('13135100 ', '', ' PRINTING BLOCKS COST   ', '131', '0'),
('13135200 ', '', ' PRINTING BLOCKS DISPOSAL   ', '131', '0'),
('13135300 ', '', ' PRINTING BLOCKS CUM DEPR&#039;N   ', '131', '0'),
('13140 ', '', ' OFFICE EQUIPMENTS   ', '131', '0'),
('13140100 ', '', ' OFFICE EQUIPMENT COST   ', '131', '0'),
('13140200 ', '', ' OFFICE EQUIPMENT DISPOSAL   ', '131', '0'),
('13140300 ', '', ' OFFICE EQUIPMENT CUM DEPR&#039;N   ', '131', '0'),
('13145 ', '', ' COMPUTER &amp; ACCESSORIES   ', '131', '0'),
('13145100 ', '', ' COMPUTER &amp; ACCESSORIES COST   ', '131', '0'),
('13145200 ', '', ' COMPUTER &amp; ACCESSORIES DISPOSAL   ', '131', '0'),
('13145300 ', '', ' COMPUTER &amp; ACCESSORIES CUM DEPR&#039;N   ', '131', '0'),
('13150 ', '', ' OFFICE FURNITURE &amp; FIXTURE   ', '131', '0'),
('13150100 ', '', ' OFFICE FURNITURE &amp; FIX. COST   ', '131', '0'),
('13150200 ', '', ' OFFICE FURNITURE &amp; FIX. DISPOSAL   ', '131', '0'),
('13150300 ', '', ' OFFICE FURNITURE &amp; FIX. CUM DEPR&#039;N   ', '131', '0'),
('13155 ', '', ' OFFICE VEHICLES   ', '131', '0'),
('13155100 ', '', ' OFFICE VEHICLE COST   ', '131', '0'),
('13155200 ', '', ' OFFICE VEHICLE DISPOSAL   ', '131', '0'),
('13155300 ', '', ' OFFICE VEHICLE CUM DEPR&#039;N   ', '131', '0'),
('13160 ', '', ' STANDARDS   ', '131', '0'),
('13160100 ', '', ' BSI STANDARDS   ', '131', '0'),
('13160300 ', '', ' BSI STANDARDS CUM DEPR&#039;N   ', '131', '0'),
('13510 ', '', ' W.I.P. PLANT &amp; MACHINERY   ', '135', '0'),
('13515 ', '', ' W.I.P. FACTORY EQUIPMENTS   ', '135', '0'),
('13525 ', '', ' W.I.P. ELECTRIC FITTING WORK   ', '135', '0'),
('13901 ', '', ' PRELIMINARY EXPENSES   ', '139', '0'),
('201FMS001', '', ' KAUKAWALA GENERAL TRADING   ', '201', '0'),
('201FMS002', '', ' ROHM &amp; HAAS SINGAPORE (PTE) LTD..   ', '201', '0'),
('201FMS003', '', ' SHANGHAI HOWELL IMP. &amp; EXP. CO.   ', '201', '0'),
('201FMS004', '', ' ASHLAND INDUSTRIES EUROPE   ', '201', '0'),
('201FMS005', '', ' ADWAN CHEMICALS INDUSTRIES   ', '201', '0'),
('201FMS006', '', ' ROCKWOOD ADDITIVES LTD.   ', '201', '0'),
('201FMS007', '', ' SHANGHAI YIPIN PIGMENTS CO. LTD.   ', '201', '0'),
('201FMS008', '', ' AKZONOBEL FUNCTIONAL CHEMICALS ELOTE AG.   ', '201', '0'),
('201FMS009', '', ' ECU LINE MIDDLE EAST   ', '201', '0'),
('201FMS010', '', ' GRIMM METALLPULVER GMBH   ', '201', '0'),
('201FMS011', '', ' HANZHONG FIRST ADHESIVE CO.,LTD   ', '201', '0'),
('201FMS012', '', ' REXIM TRADING FZE   ', '201', '0'),
('201FMS013', '', ' NEW VISION   ', '201', '0'),
('202FVN001', '', ' KAUKAWALA GENERAL TRADING FVN  ', '202', '0'),
('202FVN002', '', ' ECU LINE MIDDLE EAST FVN  ', '202', '0'),
('202FVN003', '', ' SOFTPAK FINANCIAL SYSTEM   ', '202', '0'),
('202FVN004', '', ' M TEC  ', '202', '0'),
('202FVN005', '', ' SHANGHAI SUNWAY INTERNATIONAL TRADE CO., LTD   ', '202', '0'),
('204GSP353', '', ' BESTWAY SERVICE STATION   ', '204', '0'),
('204LMS001', '', ' SABCON CHEMICALS   ', '204', '0'),
('204LMS002', '', ' PREMIER QUALITY  CHEMICALS PVT. LTD.   ', '204', '0'),
('204LMS003', '', ' LUCKY CEMENT LTD.   ', '204', '0'),
('204LMS004', '', ' RESSICHEM INTERNATIONAL   ', '204', '0'),
('204LMS005', '', ' CROWN MINES   ', '204', '0'),
('204LMS006', '', ' YOUSUF GYPSUM SUPPLIER   ', '204', '0'),
('204LMS007', '', ' FEROZ &amp; SONS   ', '204', '0'),
('204LMS008', '', ' A.G. ENTERPRISE   ', '204', '0'),
('204LMS009', '', ' BURHANI CHEMICAL   ', '204', '0'),
('204LMS010', '', ' AL NOOR MARBLE CO.  ', '204', '0'),
('204LMS011', '', ' JEELANI CEMENT   ', '204', '0'),
('204LMS012', '', ' GUIDES CORPORATION   ', '204', '0'),
('204LMS013', '', ' THATTA CEMENT COMPANY LIMITED   ', '204', '0'),
('204LMS014', '', ' D.S ENTERPRISES   ', '204', '0'),
('204LMS015', '', ' REDA INDUSTRIAL MATERIALS PAKISTAN (PVT) LTD.   ', '204', '0'),
('204LMS016', '', ' AAMIR &amp; CO   ', '204', '0'),
('204LMS101', '', ' SPECIALITY PRINTERS (PVT) LTD.   ', '204', '0'),
('204LMS102', '', ' THAL LTD, PAKISTAN PAPERSACK DIV.  ', '204', '0'),
('204LMS103', '', ' MAALIK TRADERS   ', '204', '0'),
('204LMS104', '', ' GUL HASSAN SAND SUPPLIER   ', '204', '0'),
('204LMS105', '', ' TECHNO PLASTIC WORKS   ', '204', '0'),
('204LMS106', '', ' AAS LPG DISTRIBUTION CO.   ', '204', '0'),
('204LMS107', '', ' SIFF   ', '204', '0'),
('204LMS108', '', ' MASH MERCHANDISING &amp; SHIPPING HOUSE   ', '204', '0'),
('204LMS109', '', ' STANDARD PAINT INDUSTRIES   ', '204', '0'),
('204LMS110', '', ' PARAMOUNT MINERAL TRADING   ', '204', '0'),
('204LMS111', '', ' POPULAR MINERAL GRINDING INDUSTRY   ', '204', '0'),
('204LMS112', '', ' ZEESHAN AZEEM SARWAR   ', '204', '0'),
('204LMS113', '', ' MOHAMMAD SHAHZAD   ', '204', '0'),
('204LMS114', '', ' AMIN MARBLE STONE CURUSH   ', '204', '0'),
('204LMS115', '', ' ISLAMUDDIN &amp; SONS   ', '204', '0'),
('204LMS116', '', ' HARRIS SILICONES &amp; GLASS (PVT) LTD   ', '204', '0'),
('204LMS117', '', ' SAAT TRADERS   ', '204', '0'),
('204LMS119', '', ' NOOR CHEMICALS   ', '204', '0'),
('204LMS120', '', ' POWER CEMENT LIMITED   ', '204', '0'),
('204LMS121', '', ' S.H.CORPORATION   ', '204', '0'),
('204LMS122', '', ' HAMZA ENTERPRISES   ', '204', '0'),
('204LMS123', '', ' A.F.PRINTERS   ', '204', '0'),
('204LMS124', '', ' HAROON PACKAGES   ', '204', '0'),
('204LMS125', '', ' IMPORIENT CHEMICALS (PVT) LTD   ', '204', '0'),
('204LMS126', '', ' SAIFY COMMERCIAL ESTABLISHMENT   ', '204', '0'),
('204LMS127', '', ' FAISAL PLASTIC (PVT) LTD.   ', '204', '0'),
('204LMS128', '', ' AL BADAR CEMENT &amp; STEEL  ', '204', '0'),
('204LMS129', '', ' DAWOOD TRADING CO.   ', '204', '0'),
('204LMS130', '', ' PAK PLASTIC INDUSTRIES   ', '204', '0'),
('204LMS131', '', ' AZM CHEMICAL COMPANY   ', '204', '0'),
('204LMS132', '', ' REFRAPRODUCTS   ', '204', '0'),
('204LMS133', '', ' MAPLE LEAF CEMENT FACTORY LIMITED   ', '204', '0'),
('204LMS134', '', ' M/S MITHANI INDUSTRY (PVT) LTD   ', '204', '0'),
('204LMS136', '', ' PRINTING SERVICES (PVT) LTD.   ', '204', '0'),
('204LMS137', '', ' M &amp; F COMMERCIAL CORPORATION (PVT) LTD.   ', '204', '0'),
('204LMS138', '', ' TAWHEED ENTERPRISES   ', '204', '0'),
('204LMS139', '', ' MYSF IMPEX   ', '204', '0'),
('204LMS140', '', ' PRESTIGIOUS STONE COLLECTION   ', '204', '0'),
('204LMS141', '', ' POLY PACK INTERNATIONAL   ', '204', '0'),
('204LMS142', '', ' HUSSAIN CHEMICALS   ', '204', '0'),
('204LMS143', '', ' ATTOCK CEMENT PAKISTAN LTD.   ', '204', '0'),
('204LMS144', '', ' MASH WAX &amp; PETROLEUM PRODUCTS   ', '204', '0'),
('204LMS145', '', ' ATOM PROCESSOR AND SUPPLIES   ', '204', '0'),
('204LMS146', '', ' ROYAL CHEMICALS   ', '204', '0'),
('204LMS147', '', ' AHMED CHEMICAL CO.   ', '204', '0'),
('204LMS148', '', ' NOMAN &amp; CO.   ', '204', '0'),
('204LMS149', '', ' TURNING POINT   ', '204', '0'),
('204LMS150', '', ' SUNRISE PLASTIC INDUSTRIES (PVT) LTD   ', '204', '0'),
('204LMS151', '', ' POWER MINNING COMPANY   ', '204', '0'),
('204LMS152', '', ' ALPHA CHEMICAL CO   ', '204', '0'),
('204LMS153', '', ' PLASTICS N PLASTICS PVT LTD   ', '204', '0'),
('204LMS154', '', ' ALPHA CONTAINER INDUSTRIES PVT LTD   ', '204', '0'),
('204LMS155', '', ' AL MEHRAN CHEMICALS   ', '204', '0'),
('204LMS156', '', ' NEW PRIME CHEMICALS   ', '204', '0'),
('204LMS157', '', ' GUL BADIEN AND CO.   ', '204', '0'),
('204LMS158', '', ' CHERAT PACKAGING LIMITED   ', '204', '0'),
('205GSV058', '', ' HUZEFA ENGINEERING SERVICES   ', '205', '0'),
('205GSV060', '', ' HAJI ABBAS BODY MAKER   ', '205', '0'),
('205LVN001', '', ' PHARMA ENGINEERING   ', '205', '0'),
('205LVN002', '', ' SASA METAL INDUSTRIES   ', '205', '0'),
('205LVN003', '', ' A.REHMAN SONS ENG. WORKS   ', '205', '0'),
('205LVN004', '', ' SADAQAT ENGINEERING WORKS   ', '205', '0'),
('205LVN005', '', ' RASTGAR &amp; COMPANY PVT. LTD.   ', '205', '0'),
('205LVN006', '', ' ALLIED ENGINEERING &amp; SVC. LTD.   ', '205', '0'),
('205LVN007', '', ' ORIENT ENERGY SYSTEMS (PVT.) LTD.   ', '205', '0'),
('205LVN008', '', ' MODERN ENTERPRISES   ', '205', '0'),
('205LVN009', '', ' SCIENTIFIC TRADERS   ', '205', '0'),
('205LVN020', '', ' AQEEL STEEL WORKS   ', '205', '0'),
('205LVN021', '', ' HARDMAN ENTERPRISES   ', '205', '0'),
('205LVN022', '', ' MODERN MACHINERY CORPORATION   ', '205', '0'),
('205LVN023', '', ' AMAFAHHA LOGISTIC   ', '205', '0'),
('205LVN051', '', ' MULTITECH   ', '205', '0'),
('205LVN052', '', ' MEGA ENTERPRISES   ', '205', '0'),
('205LVN053', '', ' S &amp; M SERVICES   ', '205', '0'),
('205LVN054', '', ' PAKISTAN CABLES LIMITED.   ', '205', '0'),
('205LVN055', '', ' NOBEL ENTERPRISE   ', '205', '0'),
('205LVN056', '', ' RAPID ENGINEERING SERVICES   ', '205', '0'),
('205LVN057', '', ' SHAH INTERNATIONAL   ', '205', '0'),
('205LVN058', '', ' HYDERI ENGINEERING SERVICES;   ', '205', '0'),
('205LVN059', '', ' 3 STAR WEIGHING ENTERPRISES   ', '205', '0'),
('205LVN060', '', ' FATIMA ENTERPRISES   ', '205', '0'),
('205LVN101', '', ' Z. BROTHERS   ', '205', '0'),
('205LVN102', '', ' INNO MATE   ', '205', '0'),
('205LVN103', '', ' TECHNO LINK SERVICES   ', '205', '0'),
('205LVN104', '', ' AMAFAHHA TRADING CO   ', '205', '0'),
('205LVN105', '', ' BURHANI PACKAGING MACHINERY   ', '205', '0'),
('205LVN106', '', ' MASTER SOCIETY MOTORS   ', '205', '0'),
('205LVN107', '', ' SAIFY IRON (PVT) LTD   ', '205', '0'),
('205LVN108', '', ' HAKIMI STEEL   ', '205', '0'),
('205LVN109', '', ' 3D PRINTERS   ', '205', '0'),
('207201 ', '', ' SALARY &amp; WAGES PAYABLE   ', '207', '0'),
('207205 ', '', ' SALARY TAX PAYABLE   ', '207', '0'),
('207210 ', '', ' EMPLOYEE OLD AGE BENEFIT   ', '207', '0'),
('207216 ', '', ' SINDH EMPLOYEES SOCIAL SECURITY   ', '207', '0'),
('207GSV001', '', ' ABBAS &amp; CO.   ', '207', '0'),
('207GSV002', '', ' SAIFY &amp; CO.   ', '207', '0'),
('207GSV011', '', ' SHERATON KARACHI HOTEL   ', '207', '0'),
('207GSV021', '', ' FOUR STAR CORPORATION   ', '207', '0'),
('207GSV022', '', ' HAROON TRADERS   ', '207', '0'),
('207GSV026', '', ' ATLAS INSURANCE   ', '207', '0'),
('207GSV031', '', ' REVOLUTION THE MARKETING CO.   ', '207', '0'),
('207GSV032', '', ' RSI ADVERTISING   ', '207', '0'),
('207GSV033', '', ' IAPEX   ', '207', '0'),
('207GSV034', '', ' HM DEVELOPERS   ', '207', '0'),
('207GSV040', '', ' HONDA   SITE  ', '207', '0'),
('207GSV041', '', ' MODERN MOTORS PVT. LTD.   ', '207', '0'),
('207GSV042', '', ' TPL DIRECT INSURANCE LTD.   ', '207', '0'),
('207GSV050', '', ' KOHISTAN TRANSPORT   ', '207', '0'),
('207UTL001', '', ' KARACHI ELECTRIC SUPPLY CO.   ', '207', '0'),
('207UTL006', '', ' SUI SOUTHERN GAS LTD   ', '207', '0'),
('207UTL008', '', ' SITE WATER SUPPLY  ', '207', '0'),
('207UTL011', '', ' PAKISTAN TELECOMMUNICATION LTD.   ', '207', '0'),
('207UTL012', '', ' WI TRIBE LIMITED  ', '207', '0'),
('207UTL013', '', ' PAKISTAN MOBILINK COMMUNICATION LTD.   ', '207', '0'),
('207UTL014', '', ' ZAKI BROTHERS   ', '207', '0'),
('2081 ', '', 'Accounts Payable Control A/C', '208', '0'),
('208GSP100', '', ' DESIGNMATTERS   ', '208', '0'),
('208GSP201', '', ' AL ZAIN PRINTERS  ', '208', '0'),
('208GSP301', '', ' NEW POINT STORE   ', '208', '0'),
('208GSP305', '', ' ALPHA BUSINESS  MACHINE   ', '208', '0'),
('208GSP310', '', ' MM TRADE SERVICES   ', '208', '0'),
('208GSP311', '', ' MUSTAFA METAL MART.   ', '208', '0'),
('208GSP320', '', ' AL HABIB ENTERPRISES  ', '208', '0'),
('208GSP340', '', ' BURHANI SYNDICATE   ', '208', '0'),
('208GSP350', '', ' UNITED PETROLEUM &amp; SVC STATION   ', '208', '0'),
('208GSP351', '', ' POLYMER ACCESS (PVT) LTD.   ', '208', '0'),
('208GSP352', '', ' RESSICHEM INTERNATIONAL VHL  ', '208', '0'),
('208GSP354', '', ' GHANDHARA INDUSTRIES LIMITED   ', '208', '0'),
('208GSP355', '', ' N.J.AUTO INDUSTRY (PRIVATE) LIMITED   ', '208', '0'),
('208GSP999', '', ' SUNDRY CREDITOR   ', '208', '0'),
('208GSV003', '', ' BADAMI LAW ASSOCIATES   ', '208', '0'),
('208GSV051', '', ' CHOUDARY BROTHERS TRANSPORT COMPANY   ', '208', '0'),
('208GSV052', '', ' AL MASKEEN AL HABIB GOODS TRANSPORT COMPANY ', '208', '0'),
('208GSV053', '', ' SOHAIL&#039;S COMMERCIAL STUDIO   ', '208', '0'),
('208GSV054', '', ' NATIONAL GRAPHICS   ', '208', '0'),
('208GSV056', '', ' ASB 2000   ', '208', '0'),
('208GSV057', '', ' HAJI DUR MUHAMMAD PALARI   ', '208', '0');
INSERT INTO `0_chart_master` VALUES
('208GSV059', '', ' MUSAKHEL ENTERPRISES   ', '208', '0'),
('208LMS118', '', ' AHMED TRADERS   ', '208', '0'),
('208LMS135', '', ' SAIFY ENTERPRISES   ', '208', '0'),
('210110 ', '', ' PAYABLE TO ZH   ', '210', '0'),
('210310 ', '', ' LOAN FROM CHIEF EXECUTIVE   ', '210', '0'),
('210500 ', '', ' ADVANCE FROM CUSTOMERS   ', '210', '0'),
('210900 ', '', ' ZH (CASH INVESTMENT PKR)   ', '210', '0'),
('210902 ', '', ' ZH (FOREIGN CUR. INVESTMENT)   ', '210', '0'),
('210905 ', '', ' NS (CASH INVESTMENT PKR)   ', '210', '0'),
('210907 ', '', ' NS (FOREIGN CUR. INVESTMENT)   ', '210', '0'),
('210GSV055', '', ' MAIMOONTECH   ', '210', '0'),
('210GSV061', '', ' INDEPENDENT NEWSPAPERS CORPORATION (PRIVATE) LTD   ', '210', '0'),
('218101 ', '', ' INCOME TAX PAYABLE   ', '218', '0'),
('218201 ', '', ' SALES TAX PAYABLE   ', '218', '0'),
('218301 ', '', ' WH TAX PAYABLE SUPP/SVC   ', '218', '0'),
('218302 ', '', ' WH SALES TAX SPECIAL PROCEDURE   ', '218', '0'),
('225101 ', '', ' LOAN FROM ZH   ', '225', '0'),
('225201 ', '', ' LOAN FROM NS   ', '225', '0'),
('230101 ', '', ' PROVISION FOR AUDITOR FEE   ', '230', '0'),
('251101 ', '', ' PAID UP CAPITAL  ', '4011', '0'),
('251201 ', '', ' RETAINED EARNINGS   ', '4011', '0'),
('251900 ', '', ' ZH CAPITAL   ', '4011', '0'),
('251905 ', '', ' NS CAPITAL   ', '4011', '0'),
('259100 ', '', ' RI   INVESTMENT.  ', '259', '0'),
('30110 ', '', ' WATERPROOFING   ', '301', '0'),
('30110001 ', '', ' RESSICOAT X 491  ', '30110', '0'),
('30110002 ', '', ' RESSICOAT 3020  ', '30110', '0'),
('30110010 ', '', ' RESSI LURRY   ', '30110', '0'),
('30110051 ', '', ' MOYA PROOF CWL   ', '30110', '0'),
('30110056 ', '', ' MOYA SHIELD BE   ', '30110', '0'),
('30110061 ', '', ' MOYA PROOF CWP   ', '30110', '0'),
('30120 ', '', ' DAMP PROOFING   ', '301', '0'),
('30120001 ', '', ' SILBLOCK   ', '30120', '0'),
('30120002 ', '', ' SILBLOCK PR   ', '30120', '0'),
('30120011 ', '', ' SILDIP   ', '30120', '0'),
('30120021 ', '', ' SILMIX   ', '30120', '0'),
('30130 ', '', ' STAIN RESISTANT   ', '301', '0'),
('30130001 ', '', ' SILBLOCK AG   ', '30130', '0'),
('30140 ', '', ' PRE MIX MORTARS   ', '301', '0'),
('30140001 ', '', ' RESSI TA 210  ', '30140', '0'),
('30140002 ', '', ' RESSI TA 230  ', '30140', '0'),
('30140003 ', '', ' RESSI TA 240  ', '30140', '0'),
('30140004 ', '', ' RESSI TA 220  ', '30140', '0'),
('30140005 ', '', ' RESSI TA 250  ', '30140', '0'),
('30140006 ', '', ' RESSI TA 260  ', '30140', '0'),
('30140007 ', '', ' RESSI TA 230 G  ', '30140', '0'),
('30140101 ', '', ' RESSI PLASTOREND   ', '30140', '0'),
('30140102 ', '', ' RESSI PLASTOREND 110   ', '30140', '0'),
('30140103 ', '', ' RESSI PLASTOREND 120   ', '30140', '0'),
('30140104 ', '', ' RESSI GYPSOMIGHT 9010   ', '30140', '0'),
('30140105 ', '', ' RESSI PLASTOREND 120 R  ', '30140', '0'),
('30140106 ', '', ' RESSI  LIMOMIGHT 8000   ', '30140', '0'),
('30140150 ', '', ' RESSI SC 3009C  ', '30140', '0'),
('30140201 ', '', ' RESSI SLS 630  ', '30140', '0'),
('30140202 ', '', ' RESSI SLS 610  ', '30140', '0'),
('30140203 ', '', ' RESSI GROUT GP NSG 710  ', '30140', '0'),
('30140301 ', '', ' RESSI SC 310  ', '30140', '0'),
('30140401 ', '', ' PUMPABLE SCREED   ', '30140', '0'),
('30144 ', '', ' PREMIX REPAIR MORTAR   ', '301', '0'),
('30144001 ', '', ' RESSI RM 410  ', '30144', '0'),
('30144002 ', '', ' RESSI CFC 920  ', '30144', '0'),
('30144003 ', '', ' RESSI RM 430  ', '30144', '0'),
('30144101 ', '', ' RESSI CFM  910 ', '30144', '0'),
('30144201 ', '', ' RESSI RUSHCOAT 170  ', '30144', '0'),
('30146 ', '', ' PREMIX TILE GROUT   ', '301', '0'),
('30146001 ', '', ' TILE GROUT   ', '30146', '0'),
('30160 ', '', ' SPECIALITY &amp; PERFORMANCE MTRL   ', '301', '0'),
('30160001 ', '', ' RESSI SBR 1358  ', '30160', '0'),
('30160002 ', '', ' SILPRIME 3K  ', '30160', '0'),
('30160003 ', '', ' SILPRIME WB   ', '30160', '0'),
('30160200 ', '', ' RESSI PUTTY   ', '30160', '0'),
('30160300 ', '', ' INSULATION PRODUCT   ', '30160', '0'),
('30160400 ', '', ' RESSI GRAPHY   ', '30160', '0'),
('30160500 ', '', ' RESSI MUD   ', '30160', '0'),
('30160600 ', '', ' RESSI CFM FLEXI 2K   ', '30160', '0'),
('30160700 ', '', ' RESSI SASSOLTALIA   ', '30160', '0'),
('30160901 ', '', ' OTHER FINISH GOOD STOCK   ', '30160', '0'),
('30170 ', '', ' ADMIXTURES   ', '301', '0'),
('30170001 ', '', ' RESSI SP 088 N  ', '30170', '0'),
('30170002 ', '', ' RESSI SP 044 N  ', '30170', '0'),
('30170003 ', '', ' RESSI TILE LATEX 205   ', '30170', '0'),
('30180 ', '', ' MICRO TOPING   ', '301', '0'),
('30180010 ', '', ' MT   ', '30180', '0'),
('30181 ', '', ' Jali   ', '301', '0'),
('30181001 ', '', ' RESSI JALI   ', '30181', '0'),
('30190 ', '', ' APPLICATION AT SITE   ', '301', '0'),
('30190001 ', '', ' APPLICATION FOR WATER PROOF   ', '30190', '0'),
('30190010 ', '', ' APPLICATION FOR PLASTER WORK   ', '30190', '0'),
('30199 ', '', ' STOCK FOR SALE   RI  ', '301', '0'),
('30199001 ', '', ' STOCK FOR SALE   RI.  ', '30199', '0'),
('35110 ', '', ' CP WATERPROOFING  ', '351', '0'),
('35110001 ', '', ' CP RESSICOAT X 491 ', '35110', '0'),
('35110002 ', '', ' CO RESSICOAT 3020 ', '35110', '0'),
('35110010 ', '', ' CP RESSI LURRY  ', '35110', '0'),
('35110051 ', '', ' CP MOYA PROOF CWL  ', '35110', '0'),
('35110056 ', '', ' CP MOYA SHIELD BE  ', '35110', '0'),
('35110061 ', '', ' CP MOYA PROOF CWP  ', '35110', '0'),
('35120 ', '', ' CP DAMP PROOFING  ', '351', '0'),
('35120001 ', '', ' CP SILBLOCK  ', '35120', '0'),
('35120002 ', '', ' CP SILBLOCK PR  ', '35120', '0'),
('35120011 ', '', ' CP SILDIP  ', '35120', '0'),
('35120021 ', '', ' CP SILMIX  ', '35120', '0'),
('35130 ', '', ' CP STAIN RESISTANT  ', '351', '0'),
('35130001 ', '', ' CP SILBLOCK AG  ', '35130', '0'),
('35140 ', '', ' CP PREMIX MORTARS  ', '351', '0'),
('35140001 ', '', ' CP RESSI TA 210 ', '35140', '0'),
('35140002 ', '', ' CP RESSI TA 230 ', '35140', '0'),
('35140003 ', '', ' CP RESSI TA 240 ', '35140', '0'),
('35140004 ', '', ' CP RESSI TA 220 ', '35140', '0'),
('35140005 ', '', ' CP RESSI TA 250 ', '35140', '0'),
('35140006 ', '', ' CP RESSI TA 260 ', '35140', '0'),
('35140007 ', '', ' CP RESSI TA 230 G ', '35140', '0'),
('35140101 ', '', ' CP RESSI PLASTOREND  ', '35140', '0'),
('35140102 ', '', ' CP RESSI PLASTOREND 110  ', '35140', '0'),
('35140103 ', '', ' CP RESSI PLASTOREND 120  ', '35140', '0'),
('35140104 ', '', ' CP RESSI GYPSOMIGHT 9010  ', '35140', '0'),
('35140105 ', '', ' CP  RESSI PLASTOREND 120 R ', '35140', '0'),
('35140106 ', '', ' CP RESSI  LIMOMIGHT 8000  ', '35140', '0'),
('35140150 ', '', ' CP RESSI SC 3009C ', '35140', '0'),
('35140201 ', '', ' CP RESSI SLS 630 ', '35140', '0'),
('35140202 ', '', ' CP RESSI SLS 610 ', '35140', '0'),
('35140203 ', '', ' CP RESSI GROUT GP NSG 710 ', '35140', '0'),
('35140301 ', '', ' CP RESSI SC 310 ', '35140', '0'),
('35140401 ', '', ' CP PUMPABLE SCREED  ', '35140', '0'),
('35142 ', '', ' CP PREMIX PLASTOREND  ', '351', '0'),
('35144 ', '', ' CP PREMIX REPAIR MORTAR  ', '351', '0'),
('35144001 ', '', ' CP RESSI RM 410 ', '35144', '0'),
('35144002 ', '', ' CP RESSI CFC 920 ', '35144', '0'),
('35144003 ', '', ' CP RESSI RM 430 ', '35144', '0'),
('35144101 ', '', ' CP RESSI CFM  910', '35144', '0'),
('35144201 ', '', ' CP RESSI RUSHCOAT 170 ', '35144', '0'),
('35146 ', '', ' CP PREMIX TILE GROUT  ', '351', '0'),
('35146001 ', '', ' CP TILE GROUT  ', '35146', '0'),
('35160 ', '', ' CP SPECIALITY &amp; PERFORMANCE MTRL  ', '351', '0'),
('35160001 ', '', ' CP RESSI SBR 1358 ', '35160', '0'),
('35160002 ', '', ' CP SILPRIME 3K ', '35160', '0'),
('35160003 ', '', ' CP SILPRIME WB  ', '35160', '0'),
('35160200 ', '', ' CP RESSI PUTTY  ', '35160', '0'),
('35160300 ', '', ' CP INSULATION PRODUCT  ', '35160', '0'),
('35160400 ', '', ' CP RESSI GRAPHY  ', '35160', '0'),
('35160500 ', '', ' CP RESSI MUD  ', '35160', '0'),
('35160600 ', '', ' CP RESSI CFM FLEXI 2K  ', '35160', '0'),
('35160700 ', '', ' CP RESSI SASSOLTALIA  ', '35160', '0'),
('35160901 ', '', ' CP OTHER FINISH GOOD STOCK  ', '35160', '0'),
('35170 ', '', ' CP ADMIXTURES  ', '351', '0'),
('35170001 ', '', ' CP RESSI SP 088 N ', '35170', '0'),
('35170002 ', '', ' CP RESSI SP 044 N ', '35170', '0'),
('35170003 ', '', ' CP RESSI TILE LATEX 205  ', '35170', '0'),
('35180 ', '', ' CP SCP FINISHED GOODS ', '351', '0'),
('35180001 ', '', ' CP RELEASE AGENT(RENEW CRETE)  ', '35180', '0'),
('35180002 ', '', ' CP ANTIQUING RELEASE AGENT(SCP)  ', '35180', '0'),
('35180003 ', '', ' CP CHROME ETCH CONC ACID STONE  ', '35180', '0'),
('35180004 ', '', ' CP IRON PIGMENT  ', '35180', '0'),
('35180005 ', '', ' CP COLOR HARDNER(SCP&amp;RC)  ', '35180', '0'),
('35180006 ', '', ' CP CONCRETE COUNTER TOP MIX  ', '35180', '0'),
('35180007 ', '', ' CP STAMP OVERLAY MIX (SCP)  ', '35180', '0'),
('35180008 ', '', ' CP STENCIL COLOR GROUT  ', '35180', '0'),
('35180009 ', '', ' CP VERTICAL STAMP MIX (MAGNUM)  ', '35180', '0'),
('35180010 ', '', ' CP MICRO TOPING WHITE (SCP)  ', '35180', '0'),
('35180011 ', '', ' CP ELVACE CPS 720 (SCP) ', '35180', '0'),
('35180012 ', '', ' CP VARIOUS MATERIAL (SCP)  ', '35180', '0'),
('35181 ', '', ' CP Jali  ', '351', '0'),
('35181001 ', '', ' CP RESSI JALI  ', '35181', '0'),
('35190 ', '', ' INVENTORY COST   RI  ', '351', '0'),
('35190001 ', '', ' COST OF PRODUCT   RI  ', '35190', '0'),
('35190010 ', '', ' COST OF DRY MATERIAL   RI  ', '35190', '0'),
('35190015 ', '', ' COST OF LQD MATERIAL   RI  ', '35190', '0'),
('35199 ', '', ' PRODUCT SAMPLING COST   ', '351', '0'),
('35199100 ', '', ' LIQUID FINISH PRODUCT   ', '35199', '0'),
('35199200 ', '', ' DRY FINISH PRODUCT   ', '35199', '0'),
('35199300 ', '', ' LIQUID FINISH PRODUCT SAMPLE  ', '35199', '0'),
('35199310 ', '', ' DRY FINISH PRODUCT SAMPLE  ', '35199', '0'),
('35200 ', '', 'Purchase Price Variance', '351', '0'),
('35201 ', '', 'Discount Given', '351', '0'),
('355100 ', '', ' RAW MATERIAL COST   IMPORT  ', '355', '0'),
('355100010 ', '', ' DRY RAW MATERIALS   IMPORT  ', '355100', '0'),
('355100015 ', '', ' LIQUID RAW MATERIAL   IMPORT  ', '355100', '0'),
('355100020 ', '', ' SEMILIQUID RAW MATERIAL   IMPORT  ', '355100', '0'),
('355100080 ', '', ' RAW MATERIAL COST   SCP  ', '355100', '0'),
('355150 ', '', ' RAW MATERIAL COST   LOCAL  ', '355', '0'),
('355150010 ', '', ' CELLULOSE RAW MATERIAL   LOCAL  ', '355150', '0'),
('355150015 ', '', ' VINAPASS RAW MATERIAL   LOCAL  ', '355150', '0'),
('355150020 ', '', ' DRY RAW MATERIALS   LOCAL  ', '355150', '0'),
('355150025 ', '', ' LIQUID RAW MATERIAL   LOCAL  ', '355150', '0'),
('355200 ', '', ' PACKING MATERIAL COST   ', '355', '0'),
('355200100 ', '', ' PACKING BAGS   HDPE 20KG  ', '355200', '0'),
('355200110 ', '', ' PLASTIC BAGS LDPE 1 KG  ', '355200', '0'),
('355200116 ', '', ' PLASTIC BAGS LDPE 2 KG  ', '355200', '0'),
('355200190 ', '', ' PACKING MATERIAL   MISC.  ', '355200', '0'),
('355200200 ', '', ' PLASTIC BUCKET   16KG  ', '355200', '0'),
('355200600 ', '', ' PACKING BAGS   3PLY OPEN 50KG  ', '355200', '0'),
('355300 ', '', ' SALARIES &amp; ALLOWANCES FACTORY  ', '355', '0'),
('355300005 ', '', ' SALARIES FOR FACTORY   ', '355300', '0'),
('355300031 ', '', ' WAGES FOR LABOUR   ', '355300', '0'),
('355300035 ', '', ' CONVEYANCE ALLOW. AT SITE   ', '355300', '0'),
('355300037 ', '', ' TEA ALLOW. AT SITE   ', '355300', '0'),
('355300051 ', '', ' SESSI FOR FACTORY STAFF   ', '355300', '0'),
('355300055 ', '', ' LEAVE ENCASHMENT FACTORY  ', '355300', '0'),
('355300100 ', '', ' FUEL FOR STAFF VEHICLE   ', '355300', '0'),
('355300105 ', '', ' MAINTENANCE FOR STAFF VEHICLE   ', '355300', '0'),
('355300200 ', '', ' MOBILE PHONE CHARGES   ', '355300', '0'),
('355300201 ', '', ' BONUS EXPENSE (FACTORY)   ', '355300', '0'),
('355400 ', '', ' INDIRECT MATERIAL COST   ', '355', '0'),
('355410 ', '', ' INDIRECT LABOUR COST   ', '355', '0'),
('355420 ', '', ' OTHER INDIRECT COST   ', '355', '0'),
('355420005 ', '', ' ELECTRICTY FOR FACTORY   ', '355420', '0'),
('355420010 ', '', ' GAS CHARGES   ', '355420', '0'),
('355420015 ', '', ' FUEL FOR GENERATOR   ', '355420', '0'),
('355420016 ', '', ' FUEL FOR LIFTER   ', '355420', '0'),
('355420018 ', '', ' FUEL FOR SAND DRY   ', '355420', '0'),
('355420021 ', '', ' REPAIR &amp; MAINTENANCE GENSET  ', '355420', '0'),
('355420022 ', '', ' REPAIR &amp; MAINTENANCE LIFTER  ', '355420', '0'),
('355420050 ', '', ' CARRIAGE INWARD   ', '355420', '0'),
('355420051 ', '', ' CARRIAGE OUTWARD   ', '355420', '0'),
('355420100 ', '', ' REPAIR &amp; MAINTENANCE   ', '355420', '0'),
('355420201 ', '', ' UNIFORM FOR WORKERS   ', '355420', '0'),
('355420301 ', '', ' CONSUMABLE   ', '355420', '0'),
('355420304 ', '', ' TOOLS FOR FACTORY   ', '355420', '0'),
('355420305 ', '', ' MEDICAL EXPENSES   ', '355420', '0'),
('355420800 ', '', ' CONTRACTR COST AT SITE   ', '355420', '0'),
('355420900 ', '', ' PRODUCT RESEARCH &amp; DEVELOPMENT.   ', '355420', '0'),
('355420901 ', '', ' SALES TAX EXPENSES   ', '355420', '0'),
('355420902 ', '', ' EMPLOYEE OLD AGE BENEFIT APPLICATION  ', '355420', '0'),
('355420903 ', '', ' EMPLOYEE OLD AGE BENEFIT MFG  ', '355420', '0'),
('355500 ', '', ' DEPRECIATION   ', '355', '0'),
('355500900 ', '', ' DEPRECIATION EXPENSE MFG  ', '355500', '0'),
('355900 ', '', ' RAW MATERIAL COST  UOF  ', '355', '0'),
('355900950 ', '', ' RAW MATERIAL COST   UOF.  ', '355900', '0'),
('355900990 ', '', ' MANUFACTURING COST OTHER   ', '355900', '0'),
('400 ', '', ' PROJECT COST   ', '400', '0'),
('400100 ', '', ' APPLICATION COMMISSION   ', '400', '0'),
('400900 ', '', ' PROJECT COST AT SITE   ', '400', '0'),
('400900000 ', '', ' PROJ#NAEEM MOHIUDDIN/2011/000   ', '400900', '0'),
('400900001 ', '', ' PROJ#TOTAL CONS/DALDA/0112/001   ', '400900', '0'),
('400900007 ', '', ' PROJ#KHURAM INAM/0112/007   ', '400900', '0'),
('400900008 ', '', ' PROJ#IMRAN AHMED/2012/A 14  ', '400900', '0'),
('400900009 ', '', ' PROJ#DE COMFORT/2012/008   ', '400900', '0'),
('400900010 ', '', ' PROJ#HASANI MASJID/2012/009   ', '400900', '0'),
('400900011 ', '', ' PROJ#ASGHAR WAHEED   ', '400900', '0'),
('400900012 ', '', ' PROJ#PAN INDUSTRIES/2012   ', '400900', '0'),
('400900013 ', '', ' PROJ#A.G.GIGI (PVT) LTD/2012   ', '400900', '0'),
('400900014 ', '', ' PROJ#LIAQAT NATIONAL HOSPITAL   ', '400900', '0'),
('400900015 ', '', ' PROJ#IMRAN LOTIA   ', '400900', '0'),
('400900016 ', '', ' PROJ#BRIGHT STAR BUILDERS/ SPORTS COMPLEX   ', '400900', '0'),
('400900017 ', '', ' PROJ# ARCH. FARIHA UBAID   ', '400900', '0'),
('400900018 ', '', ' PROJ #.FAWWAD JAWWAD SITE   ', '400900', '0'),
('400900019 ', '', ' PROJ #.HUMAYUN USMAN   ', '400900', '0'),
('400900020 ', '', ' PROJ #.BLOW PLAST   ', '400900', '0'),
('400900021 ', '', ' PROJ#COMMANDAR ARSHAD GILANI   ', '400900', '0'),
('400900022 ', '', ' PROJ#ZH RESIDENCE   ', '400900', '0'),
('400904001 ', '', ' PROJ#SHAKEEL AHMED/2011   ', '400904', '0'),
('400904002 ', '', ' PROJ#SAMEER GULZAR/2011   ', '400904', '0'),
('400904003 ', '', ' PROJ#RIZWAN DEWAN/2011   ', '400904', '0'),
('400904004 ', '', ' PROJ#AHMED ZUBERI/2012/B.STREET   ', '400904', '0'),
('400905001 ', '', ' IQRA UNIVERSITY SITE SAMPLE  ', '400905', '0'),
('400905002 ', '', ' LAKHANI FANTASIA SITE SAMPLE  ', '400905', '0'),
('400905003 ', '', ' REHM PACK SITE SAMPLE  ', '400905', '0'),
('400905004 ', '', ' AL KHALEEJ TOWER SITE SAMPLE ', '400905', '0'),
('400905005 ', '', ' A.T BUILDERS SITE SAMPLE  ', '400905', '0'),
('400905006 ', '', ' QATAR HOUSE SITE SAMPLE  ', '400905', '0'),
('400905100 ', '', ' SAMPLING AT SITE   ', '400905', '0'),
('401 ', '', ' SAMPLING COST AT SITE   ', '400', '0'),
('501201 ', '', ' SALARIES   SALES STAFF  ', '501', '0'),
('501210 ', '', ' SESSI   SALES STAFF  ', '501', '0'),
('501212 ', '', ' LEAVE ENCASHMENT SALES  ', '501', '0'),
('501215 ', '', ' MEDICAL EXPENSES SALES  ', '501', '0'),
('501301 ', '', ' FUEL FOR STAFF VEHICLE   SALES  ', '501', '0'),
('501311 ', '', ' FUEL FOR STAFF M/CYCLE   SALES  ', '501', '0'),
('501325 ', '', ' MOBILE PHONE CHARGES   SALES  ', '501', '0'),
('501351 ', '', ' VRM FOR STAFF VEHICLE   SALES  ', '501', '0'),
('501361 ', '', ' VRM FOR STAFF M/CYCLE   SALES  ', '501', '0'),
('501401 ', '', ' EMAIL MARKETING EXPENSE   ', '501', '0'),
('501410 ', '', ' PRINTING &amp; STATIONARY   SALES  ', '501', '0'),
('501415 ', '', ' POSTAGE &amp; COURIER   SALES  ', '501', '0'),
('501416 ', '', ' BAD DEBT EXPENSE   ', '501', '0'),
('501501 ', '', ' SALES COMMISSION   ', '501', '0'),
('501601 ', '', ' CARRIAGE OUTWARD   SALES/MKT  ', '501', '0'),
('501605 ', '', ' VEHICLE REPAIR &amp; MAINTENANCE SELLING(KP 3560) ', '501', '0'),
('501606 ', '', ' VEHICLE REPAIR &amp; MAINTENANCE SELLING(JV 910) ', '501', '0'),
('501607 ', '', ' VEHICLE REPAIR &amp; MAINTENANCE SELLING(JU 5652) ', '501', '0'),
('501608 ', '', ' VEHICLE REPAIR &amp; MAINTENANCE SELLING(KP 5264) ', '501', '0'),
('501610 ', '', ' VEHICLE TAX &amp; INSURANCE SELLING  ', '501', '0'),
('501620 ', '', ' RENT EXPENSE (GODAM)   ', '501', '0'),
('501900 ', '', ' MARKETING &amp; SELLING EXP OTHER   ', '501', '0'),
('501901 ', '', ' TRAVELLING EXPENSES   ', '501', '0'),
('501902 ', '', ' EMPLOYEE OLD AGE BENEFIT MKT  ', '501', '0'),
('501903 ', '', ' BONUS EXPENSE (MARKETING &amp; SELLING)   ', '501', '0'),
('601605 ', '', ' BANK CHARGES   ', '601', '0'),
('601610 ', '', ' BANK COMMISSION CHGS   ', '601', '0'),
('601705 ', '', ' FOREIGN EXCHANGE GAIN/LOSS   ', '601', '0'),
('602005 ', '', ' PRELIMINARY EXPENSE   ', '602', '0'),
('602010 ', '', ' AUDIT FEE   ', '602', '0'),
('602015 ', '', ' PROFESSIONAL FEE   ', '602', '0'),
('602020 ', '', ' MEMBERSHIP FEE   ', '602', '0'),
('602025 ', '', ' FEES &amp; SUBSCRIPTION   ', '602', '0'),
('602050 ', '', ' TAX CONSULTANCY CHGS   ', '602', '0'),
('602105 ', '', ' DIRECTOR REMUNERATION   ', '602', '0'),
('602205 ', '', ' SALARIES   ADMIN &amp; OTHER  ', '602', '0'),
('602207 ', '', ' FUEL FOR STAFF VEHICLE   ADM  ', '602', '0'),
('602208 ', '', ' VEHICLE RUNNING &amp; MAINT.  ADM  ', '602', '0'),
('602209 ', '', ' VEHICLE TAX &amp; INSURANCE  ADMIN  ', '602', '0'),
('602210 ', '', ' SESSI   ADMIN &amp; OTHER  ', '602', '0'),
('602215 ', '', ' LEAVE ENCASHMENT ADM  ', '602', '0'),
('602220 ', '', ' EDUCATION CESS   ', '602', '0'),
('602304 ', '', ' COMPUTER ACCESSORIES   ', '602', '0'),
('602305 ', '', ' OFFICE EXPENSE   ', '602', '0'),
('602306 ', '', ' OFFICE ENTERTAINMENT   ', '602', '0'),
('602307 ', '', ' CONVEYANCE CHARGES   ', '602', '0'),
('602308 ', '', ' OFFICE EQP. REPAIR &amp; MAINT.   ', '602', '0'),
('602309 ', '', ' OFFICE REPAIR &amp; MAINTENACE   ', '602', '0'),
('602310 ', '', ' PRINTING &amp; STATIONARY   ', '602', '0'),
('602311 ', '', ' OFFICE FURNITURE REPAIR &amp; MAINT.   ', '602', '0'),
('602312 ', '', ' POSTAGE &amp; COURIER CHGS   ', '602', '0'),
('602313 ', '', ' CUSTOM CLEARANCE CHARGES   ', '602', '0'),
('602315 ', '', ' ADVERTISING EXPENSE   ', '602', '0'),
('602316 ', '', ' CANTEEN EXPENSES   ', '602', '0'),
('602399 ', '', ' OFFICE CONSUMABLE   ', '602', '0'),
('602505 ', '', ' TELEPHONE  COMMUNICATION  ', '602', '0'),
('602510 ', '', ' MOBILE PHONE CHARGES   ADM  ', '602', '0'),
('602511 ', '', ' MOBILE PHONE CHARGES   APPLICATION  ', '602', '0'),
('602515 ', '', ' INTERNET   COMMUNICATION  ', '602', '0'),
('602550 ', '', ' ELECTRICITY CHARGES   ', '602', '0'),
('602600 ', '', ' WATER CHARGES   ', '602', '0'),
('602900 ', '', ' ADMIN EXPENSE OTHER   ', '602', '0'),
('602950 ', '', ' DEPRECIATION EXPENSE ADM  ', '602', '0'),
('602951 ', '', ' INCOME TAX TURN OVER TAX  ', '602', '0'),
('602952 ', '', ' EMPLOYEE OLD AGE BENEFIT ADMIN  ', '602', '0'),
('602953 ', '', ' MISCELLANEOUS EXENSES   ', '602', '0'),
('602954 ', '', ' BONUS EXPENSE (ADMIN)   ', '602', '0'),
('602955 ', '', ' PROFESSIONAL TAX   ', '602', '0'),
('602956 ', '', ' MEDICAL EXPENSE   ', '602', '0'),
('701001 ', '', ' DISCOUNT   ', '701', '0'),
('701001001 ', '', ' DISCOUNT FROM VENDORS   ', '701001', '0'),
('701010 ', '', ' OTHER INCOME (DEBTORS)   ', '701', '0'),
('999999 ', '', 'Profit and Loss', '602', '0');

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
('101', ' CASH IN HAND', '10', '', '0'),
('102', ' CASH AT BANK', '10', '101', '0'),
('103', ' PREPAID, DEPOSIT &amp; ADVANCE', '10', '101', '0'),
('103100', 'PREPAID EXPENSE', '10', '103', '0'),
('103200', 'DEPOSIT', '10', '103', '0'),
('103300', ' ADVANCE TO STAFF', '10', '103', '0'),
('103400', 'LOAN TO STAFF', '10', '103', '0'),
('104', ' IMPORT,  LC &amp; LOCAL', '10', '', '0'),
('105', ' ADVANCE TAXES', '10', '', '0'),
('106', ' OTHER RECEIVABLE', '10', '', '0'),
('108', ' TRADE DEBTORS', '10', '', '0'),
('109', ' TRADE DEBTORS  CASH', '10', '', '0'),
('114', ' SALES TAX RECEIVABLE', '10', '', '0'),
('115', ' STOCK IN HAND  RM', '10', '', '0'),
('117', ' STOCK IN HAND  WIP', '10', '', '0'),
('119', ' STOCK IN HAND  FG', '10', '', '0'),
('121', ' STOCK IN HAND  OTHER', '10', '', '0'),
('131', ' PROPERTY PLANT &amp; EQUIPMENTS', '10', '', '0'),
('135', ' WORK IN PROGRESS', '10', '', '0'),
('139', ' PRELIMINARY', '10', '', '0'),
('201', ' FOREIGN MATERIAL SUPPLIERS', '20', '', '0'),
('202', ' FOREIGN VENDROS &amp; CONTRACTORS', '20', '', '0'),
('204', ' LOCAL MATERIAL SUPPLIERS', '20', '', '0'),
('205', ' LOCAL VENDORS &amp; CONTRACTOR', '20', '', '0'),
('207', ' ACCRUDE LIABILITIES', '20', '', '0'),
('208', ' GENERAL SUPPLIERS', '20', '', '0'),
('209', ' UTILITY &amp; OTHERS', '20', '', '0'),
('210', ' OTHER PAYABLES', '20', '', '0'),
('218', ' TAX PAYABLE', '20', '', '0'),
('225', ' LOAN FROM DIRECTORS', '30', '', '0'),
('230', ' PROVISION FOR LIABILITY', '20', '', '0'),
('259', ' INVESTMENT', '10', '', '0'),
('301', ' SALES', '40', '', '0'),
('321', ' SALE RETURN', '40', '', '0'),
('331', ' SALES ALLOWANCE', '40', '', '0'),
('351', ' COST OF PRODUCT', '50', '', '0'),
('355', ' MANUFACTURING COST', '50', '', '0'),
('400', ' APPLICATION WORK AT SITE', '50', '', '0'),
('4011', ' EQUITY', '30', '', '0'),
('501', ' MARKETING &amp; SELLING EXPENSE', '50', '', '0'),
('601', ' FINANCIAL CHARGES', '50', '', '0'),
('602', ' ADMIN EXPENSE', '50', '', '0'),
('701', ' OTHER INCOME', '50', '', '0'),
('715', ' INCOME DEDUCTION', '50', '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('1', '1', 'customer', 'general', '1'),
('2', '2', 'customer', 'general', '2'),
('3', '3', 'customer', 'general', '3'),
('4', '4', 'customer', 'general', '4'),
('5', '5', 'customer', 'general', '5'),
('6', '6', 'customer', 'general', '6'),
('7', '7', 'customer', 'general', '7'),
('8', '8', 'customer', 'general', '8'),
('9', '9', 'customer', 'general', '9'),
('10', '10', 'customer', 'general', '10'),
('11', '11', 'customer', 'general', '11'),
('12', '12', 'customer', 'general', '12'),
('13', '13', 'customer', 'general', '13'),
('14', '14', 'customer', 'general', '14'),
('15', '15', 'customer', 'general', '15'),
('16', '16', 'customer', 'general', '16'),
('17', '17', 'customer', 'general', '17'),
('18', '18', 'customer', 'general', '18'),
('19', '19', 'customer', 'general', '19'),
('20', '20', 'customer', 'general', '20'),
('21', '21', 'customer', 'general', '21'),
('22', '22', 'customer', 'general', '22'),
('23', '23', 'customer', 'general', '23'),
('24', '24', 'customer', 'general', '24'),
('25', '25', 'customer', 'general', '25'),
('26', '26', 'customer', 'general', '26'),
('27', '27', 'customer', 'general', '27'),
('28', '28', 'customer', 'general', '28'),
('29', '29', 'customer', 'general', '29'),
('30', '30', 'customer', 'general', '30'),
('31', '31', 'customer', 'general', '31'),
('32', '32', 'customer', 'general', '32'),
('33', '33', 'customer', 'general', '33'),
('34', '34', 'customer', 'general', '34'),
('35', '35', 'customer', 'general', '35'),
('36', '36', 'customer', 'general', '36'),
('37', '37', 'customer', 'general', '37'),
('38', '38', 'customer', 'general', '38'),
('39', '39', 'customer', 'general', '39'),
('40', '40', 'customer', 'general', '40'),
('41', '41', 'customer', 'general', '41'),
('42', '42', 'customer', 'general', '42'),
('43', '43', 'customer', 'general', '43'),
('44', '44', 'customer', 'general', '44'),
('45', '45', 'customer', 'general', '45'),
('46', '46', 'customer', 'general', '46'),
('47', '47', 'customer', 'general', '47'),
('48', '48', 'customer', 'general', '48'),
('49', '49', 'customer', 'general', '49'),
('50', '50', 'customer', 'general', '50'),
('51', '51', 'customer', 'general', '51'),
('52', '52', 'customer', 'general', '52'),
('53', '53', 'customer', 'general', '53'),
('54', '54', 'customer', 'general', '54'),
('55', '55', 'customer', 'general', '55'),
('56', '56', 'customer', 'general', '56'),
('57', '57', 'customer', 'general', '57'),
('58', '58', 'customer', 'general', '58'),
('59', '59', 'customer', 'general', '59'),
('60', '60', 'customer', 'general', '60'),
('61', '61', 'customer', 'general', '61'),
('62', '62', 'customer', 'general', '62'),
('63', '63', 'customer', 'general', '63'),
('64', '64', 'customer', 'general', '64'),
('65', '65', 'customer', 'general', '65'),
('66', '66', 'customer', 'general', '66'),
('67', '67', 'customer', 'general', '67'),
('68', '68', 'customer', 'general', '68'),
('69', '69', 'customer', 'general', '69'),
('70', '70', 'customer', 'general', '70'),
('71', '71', 'customer', 'general', '71'),
('72', '72', 'customer', 'general', '72'),
('73', '73', 'customer', 'general', '73'),
('74', '74', 'customer', 'general', '74'),
('75', '75', 'customer', 'general', '75'),
('76', '76', 'customer', 'general', '76'),
('77', '77', 'customer', 'general', '77'),
('78', '78', 'customer', 'general', '78'),
('79', '79', 'customer', 'general', '79'),
('80', '80', 'customer', 'general', '80'),
('81', '81', 'customer', 'general', '81'),
('82', '82', 'customer', 'general', '82'),
('83', '83', 'customer', 'general', '83'),
('84', '84', 'customer', 'general', '84'),
('85', '85', 'customer', 'general', '85'),
('86', '86', 'customer', 'general', '86'),
('87', '87', 'customer', 'general', '87'),
('88', '88', 'customer', 'general', '88'),
('89', '89', 'customer', 'general', '89'),
('90', '90', 'customer', 'general', '90'),
('91', '91', 'customer', 'general', '91'),
('92', '92', 'customer', 'general', '92'),
('93', '93', 'customer', 'general', '93'),
('94', '94', 'customer', 'general', '94'),
('95', '95', 'customer', 'general', '95'),
('96', '96', 'customer', 'general', '96'),
('97', '97', 'customer', 'general', '97'),
('98', '98', 'customer', 'general', '98'),
('99', '99', 'customer', 'general', '99'),
('100', '100', 'customer', 'general', '100'),
('101', '101', 'customer', 'general', '101'),
('102', '102', 'customer', 'general', '102'),
('103', '103', 'customer', 'general', '103'),
('104', '104', 'customer', 'general', '104'),
('105', '105', 'customer', 'general', '105'),
('106', '106', 'customer', 'general', '106'),
('107', '107', 'customer', 'general', '107'),
('108', '108', 'customer', 'general', '108'),
('109', '109', 'customer', 'general', '109'),
('110', '110', 'customer', 'general', '110'),
('111', '111', 'customer', 'general', '111'),
('112', '112', 'customer', 'general', '112'),
('113', '113', 'customer', 'general', '113'),
('114', '114', 'customer', 'general', '114'),
('115', '115', 'customer', 'general', '115'),
('116', '116', 'customer', 'general', '116'),
('117', '117', 'customer', 'general', '117'),
('118', '118', 'customer', 'general', '118'),
('119', '119', 'customer', 'general', '119'),
('120', '120', 'customer', 'general', '120'),
('121', '121', 'customer', 'general', '121'),
('122', '122', 'customer', 'general', '122'),
('123', '123', 'customer', 'general', '123'),
('124', '124', 'customer', 'general', '124'),
('125', '125', 'customer', 'general', '125'),
('126', '126', 'customer', 'general', '126'),
('127', '127', 'customer', 'general', '127'),
('128', '128', 'customer', 'general', '128'),
('129', '129', 'customer', 'general', '129'),
('130', '130', 'customer', 'general', '130'),
('131', '131', 'customer', 'general', '131'),
('132', '132', 'customer', 'general', '132'),
('133', '133', 'customer', 'general', '133'),
('134', '134', 'customer', 'general', '134'),
('135', '135', 'customer', 'general', '135'),
('136', '136', 'customer', 'general', '136'),
('137', '137', 'customer', 'general', '137'),
('138', '138', 'customer', 'general', '138'),
('139', '139', 'customer', 'general', '139'),
('140', '140', 'customer', 'general', '140'),
('141', '141', 'customer', 'general', '141'),
('142', '142', 'customer', 'general', '142'),
('143', '143', 'customer', 'general', '143'),
('144', '144', 'customer', 'general', '144'),
('145', '145', 'customer', 'general', '145'),
('146', '146', 'customer', 'general', '146'),
('147', '147', 'customer', 'general', '147'),
('148', '148', 'customer', 'general', '148'),
('149', '149', 'customer', 'general', '149'),
('150', '150', 'customer', 'general', '150'),
('151', '151', 'customer', 'general', '151'),
('152', '152', 'customer', 'general', '152'),
('153', '153', 'customer', 'general', '153'),
('154', '154', 'customer', 'general', '154'),
('155', '155', 'customer', 'general', '155'),
('156', '156', 'customer', 'general', '156'),
('157', '157', 'customer', 'general', '157'),
('158', '158', 'customer', 'general', '158'),
('159', '159', 'customer', 'general', '159'),
('160', '160', 'customer', 'general', '160'),
('161', '161', 'customer', 'general', '161'),
('162', '162', 'customer', 'general', '162'),
('163', '163', 'customer', 'general', '163'),
('164', '164', 'customer', 'general', '164'),
('165', '165', 'customer', 'general', '165'),
('166', '166', 'customer', 'general', '166'),
('167', '167', 'customer', 'general', '167'),
('168', '168', 'customer', 'general', '168'),
('169', '169', 'customer', 'general', '169'),
('170', '170', 'customer', 'general', '170'),
('171', '171', 'customer', 'general', '171'),
('172', '172', 'customer', 'general', '172'),
('173', '173', 'customer', 'general', '173'),
('174', '174', 'customer', 'general', '174'),
('175', '175', 'customer', 'general', '175'),
('176', '176', 'customer', 'general', '176'),
('177', '177', 'customer', 'general', '177'),
('178', '178', 'customer', 'general', '178'),
('179', '179', 'customer', 'general', '179'),
('180', '180', 'customer', 'general', '180'),
('181', '181', 'customer', 'general', '181'),
('182', '182', 'customer', 'general', '182'),
('183', '183', 'customer', 'general', '183'),
('184', '184', 'customer', 'general', '184'),
('185', '185', 'customer', 'general', '185'),
('186', '186', 'customer', 'general', '186'),
('187', '187', 'customer', 'general', '187'),
('188', '188', 'customer', 'general', '188'),
('189', '189', 'customer', 'general', '189'),
('190', '190', 'customer', 'general', '190'),
('191', '191', 'customer', 'general', '191'),
('192', '192', 'customer', 'general', '192'),
('193', '193', 'customer', 'general', '193'),
('194', '194', 'customer', 'general', '194'),
('195', '195', 'customer', 'general', '195'),
('196', '196', 'customer', 'general', '196'),
('197', '197', 'customer', 'general', '197'),
('198', '198', 'customer', 'general', '198'),
('199', '199', 'customer', 'general', '199'),
('200', '200', 'customer', 'general', '200'),
('201', '201', 'customer', 'general', '201'),
('202', '202', 'customer', 'general', '202'),
('203', '203', 'customer', 'general', '203'),
('204', '204', 'customer', 'general', '204'),
('205', '205', 'customer', 'general', '205'),
('206', '206', 'customer', 'general', '206'),
('207', '207', 'customer', 'general', '207'),
('208', '208', 'customer', 'general', '208'),
('209', '209', 'customer', 'general', '209'),
('210', '210', 'customer', 'general', '210'),
('211', '211', 'customer', 'general', '211'),
('212', '212', 'customer', 'general', '212'),
('213', '213', 'customer', 'general', '213'),
('214', '214', 'customer', 'general', '214'),
('215', '215', 'customer', 'general', '215'),
('216', '216', 'customer', 'general', '216'),
('217', '217', 'customer', 'general', '217'),
('218', '218', 'customer', 'general', '218'),
('219', '219', 'customer', 'general', '219'),
('220', '220', 'customer', 'general', '220'),
('221', '221', 'customer', 'general', '221'),
('222', '222', 'customer', 'general', '222'),
('223', '223', 'customer', 'general', '223'),
('224', '224', 'customer', 'general', '224'),
('225', '225', 'customer', 'general', '225'),
('226', '226', 'customer', 'general', '226'),
('227', '227', 'customer', 'general', '227'),
('228', '228', 'customer', 'general', '228'),
('229', '229', 'customer', 'general', '229'),
('230', '230', 'cust_branch', 'general', '230'),
('231', '230', 'customer', 'general', '230');

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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', '3G CONSTRUCTION', '3G CONSTRUCTION', NULL, 'BAHRIA HEIGHTS, BAHRIA TOWN,', '0347-7287606', NULL, NULL, NULL, NULL, '', '0'),
('2', 'A.G. GIGI (PVT) LTD', 'A.G. GIGI (PVT) LTD', NULL, 'NEAR BROOKS CHOWRANGI,', '0300-8294784', NULL, NULL, NULL, NULL, '', '0'),
('3', 'A.M HUSSAIN &amp; CO', 'A.M HUSSAIN &amp; CO', NULL, 'SHOP # 2 &amp; 3 ANUM ARCADE, SUNSET LANE-1 PHASE II EXT. DHA', '0300-9219126 ', NULL, NULL, NULL, NULL, '', '0'),
('4', 'AA QUALITY BUILDERS', 'AA QUALITY BUILDERS', NULL, 'C-6, BLOCK-7, Gulshan-e-Iqbal,', '0344-2830697,0303-2946982', NULL, NULL, NULL, NULL, '', '0'),
('5', 'AAA Associates', 'AAA Associates', NULL, 'D.H.A.', '0321-2674000', NULL, NULL, NULL, NULL, '', '0'),
('6', 'AAA FACILITY MANAGEMENT LTD', 'AAA FACILITY MANAGEMENT LTD', NULL, 'C-19, KH-E-BUKHARI, DHA,', '0321-8254009', NULL, NULL, NULL, NULL, '', '0'),
('7', 'ABASEEN CONSTRUCTION CO. PVT L', 'ABASEEN CONSTRUCTION CO. PVT LTD', NULL, 'Office No. 7, Afzal Apartments, Stadium Road, Karachi, ', '0333-2414481', NULL, NULL, NULL, NULL, '', '0'),
('8', 'ABDUL KAREEM', 'ABDUL KAREEM', NULL, 'GULSHAN', '0300-8247966', NULL, NULL, NULL, NULL, '', '0'),
('9', 'ABDUL QADIR', 'ABDUL QADIR', NULL, 'PLOT # 78, SABA AVENUE, NEAR IMAM BARGAH, DHA,', '0333-2145984', NULL, NULL, NULL, NULL, '', '0'),
('10', 'ABDUL QADIR JAAFRANI', 'ABDUL QADIR JAAFRANI', NULL, 'PLOT # C-43-10, BLOCK-6, PECHS, NEAR FEROZABAD POLICE STATION', '0300-8236110', NULL, NULL, NULL, NULL, '', '0'),
('11', 'ABDULLAH TILES', 'ABDULLAH TILES', NULL, '26TH STREET, TAUHEED COMMERCIAL, DHA,', '021-35362405-7', NULL, NULL, NULL, NULL, '', '0'),
('12', 'RAMZAN TRADERS', 'RAMZAN TRADERS', NULL, 'AEROMOTIVE', '0', NULL, NULL, NULL, NULL, '', '0'),
('13', 'AHMED ENGINEERING', 'AHMED ENGINEERING', NULL, 'CLARINAT CHEMICALS PAKISTAN,', '0301-8484041', NULL, NULL, NULL, NULL, '', '0'),
('14', 'AHMED SANITARY', 'AHMED SANITARY', NULL, 'CYCLE MARKET, LIGHT HOUSE,', '0', NULL, NULL, NULL, NULL, '', '0'),
('15', 'AL-ABBAS PAINT HOUSE', 'AL-ABBAS PAINT HOUSE', NULL, 'MAIN GIZRI, OPP. MUBARAK MASJID, KH-E-HAFEEZ,', '0322-2549351', NULL, NULL, NULL, NULL, '', '0'),
('16', 'AL-BURHAN SANITARY', 'AL-BURHAN SANITARY', NULL, 'SHOP # 4, JAVERIA MANSION, AKBAR ALI LANE, SADDAR,', '0300-0928052 / 0333-7235252', NULL, NULL, NULL, NULL, '', '0'),
('17', 'AL-HAIDER PAINT HOUSE', 'AL-HAIDER PAINT HOUSE', NULL, 'SHOP # 15-16, SAKINA ARCADE, OPP. MUBARAK MASJID, GIZRI,', '021-35876057', NULL, NULL, NULL, NULL, '', '0'),
('18', 'AL-HASNAIN HARDWARE', 'AL-HASNAIN HARDWARE', NULL, 'UPPER GIZRI RD, NEAR MUBARAK, MASJID,', '021-35372076', NULL, NULL, NULL, NULL, '', '0'),
('19', 'AL-HATEMI PAINT HOUSE', 'AL-HATEMI PAINT HOUSE', NULL, 'LOWER GIZRI, AVENUE ROAD, OPP. AL-KARIM PAINT, ', '0', NULL, NULL, NULL, NULL, '', '0'),
('20', 'AL-KARIM PAINT HOUSE', 'AL-KARIM PAINT HOUSE', NULL, 'LOWER GIZRI, AVENUE ROAD, NEAR ASIF CORP, ', '0333-2106878', NULL, NULL, NULL, NULL, '', '0'),
('21', 'AL-MADINA TILES', 'AL-MADINA TILES', NULL, 'R-413, SECTOR 11C-1, ADAM TOWN NORTH KARACHI', '0321-2557191', NULL, NULL, NULL, NULL, '', '0'),
('22', 'AL-MOHAMMADI TILE', 'AL-MOHAMMADI TILE', NULL, 'SADDAR, NEAR SHABBIR BIRYANI,', '0321-3041886 ', NULL, NULL, NULL, NULL, '', '0'),
('23', 'AL-MOIZ HARDWARE', 'AL-MOIZ HARDWARE', NULL, 'MAIN GIZRI,', '0302-8248151', NULL, NULL, NULL, NULL, '', '0'),
('24', 'AL-SIRAJ FARMHOUSE', 'AL-SIRAJ FARMHOUSE', NULL, 'GHAREEBABAD, NEAR PSO PUMP, ', '0300-8973341', NULL, NULL, NULL, NULL, '', '0'),
('25', 'ALVI HARDWARE', 'ALVI HARDWARE', NULL, 'PLOT # 30-C, LANE-8, BUKHARI COMMERCIAL, AHMAD APPARTMENT,DHA,', '0333-7981586', NULL, NULL, NULL, NULL, '', '0'),
('26', 'AMCORP CONSTRUCTION', 'AMCORP CONSTRUCTION', NULL, 'M.U.E.T., JAMSHORO,', '0322-2889608', NULL, NULL, NULL, NULL, '', '0'),
('27', 'AMIN DHOSA C/O THE ARCHITECT', 'AMIN DHOSA C/O THE ARCHITECT', NULL, 'PLOT # F-92, BATH ISLAND, NEAR AGA KHAN JAMAT KHANA,', '0', NULL, NULL, NULL, NULL, '', '0'),
('28', 'AMIR TOOLS', 'AMIR TOOLS', NULL, 'SHOP # 2/3, SHUJA MARKET, KATCHI GALI # 3, MARRIOT ROAD,', '0345-2217672', NULL, NULL, NULL, NULL, '', '0'),
('29', 'AMMAR HARDWARE &amp; KITCHEN', 'AMMAR HARDWARE &amp; KITCHEN', NULL, 'F-18, GRACE CENTRE, GIZRI,', '021-35831611', NULL, NULL, NULL, NULL, '', '0'),
('30', 'AMMAR HARDWARE STORE', 'AMMAR HARDWARE STORE', NULL, 'C-CH, REHMAT ALI RD, MANZOOR COLONY, GUJJAR CHOWK,', '0312-2023656', NULL, NULL, NULL, NULL, '', '0'),
('31', 'AMMAR PAINTS &amp; HARDWARE', 'AMMAR PAINTS &amp; HARDWARE', NULL, 'HYDERABAD,', '0333-2626052', NULL, NULL, NULL, NULL, '', '0'),
('32', 'ANSAR BROTHERS', 'ANSAR BROTHERS', NULL, 'ABDUL MAJID SIDHI STREET, MARRIOT ROAD,', '021-32414258', NULL, NULL, NULL, NULL, '', '0'),
('33', 'ANWER OK', 'ANWER OK', NULL, '11-C, MOHAMMAD ALI SOCIETY, NEAR KAYBEES,', '0312-3399978', NULL, NULL, NULL, NULL, '', '0'),
('34', 'A-ONE MARBLE', 'A-ONE MARBLE', NULL, 'K-22, JOHAR COLONY, MANGOPIR ROAD,', '0300-2114011', NULL, NULL, NULL, NULL, '', '0'),
('35', 'A-ONE PAINT HARDWARE &amp; ELE', 'A-ONE PAINT HARDWARE &amp; ELECTRIC STORE', NULL, 'SHOP # 21, KHAWAJA MANZIL, BAHADURABAD,', '0324-2006135', NULL, NULL, NULL, NULL, '', '0'),
('36', 'ARAISH', 'ARAISH', NULL, 'OFFICE # 210, TAYYAB ALI STREET, SADDAR,', '0333-2776396 ', NULL, NULL, NULL, NULL, '', '0'),
('37', 'ARCH. AFTAB ABBASI', 'ARCH. AFTAB ABBASI', NULL, 'GAWADAR,', '0321-2379862', NULL, NULL, NULL, NULL, '', '0'),
('38', 'ARCH. AHMED JUMANI', 'ARCH. AHMED JUMANI', NULL, '17A KDA SCHEME # 1 NEAR PEER PAGARA HOUSE', '0301-8222534', NULL, NULL, NULL, NULL, '', '0'),
('39', 'ARCH. AMBREEN', 'ARCH. AMBREEN', NULL, '912/9TH FLOOR, WEST POINT TOWER, PHASE-2, KORANGI ROAD,', '0', NULL, NULL, NULL, NULL, '', '0'),
('40', 'ARCH. FAROOQI', 'ARCH. FAROOQI', NULL, 'SHABBIRABAD, BLOCK A', '0301-2194604', NULL, NULL, NULL, NULL, '', '0'),
('41', 'ARCH. SHEHLA TASLEEM', 'ARCH. SHEHLA TASLEEM', NULL, 'PLOT # S22, STREET # 4, PH-VII, NEAR FATIMA MASJID, DHA,', '0300-7069436', NULL, NULL, NULL, NULL, '', '0'),
('42', 'ARCH. ZAHRA', 'ARCH. ZAHRA', NULL, 'ISLAMABAD,', '0302-8540446', NULL, NULL, NULL, NULL, '', '0'),
('43', 'ARIF HABIB RESIDENCY', 'ARIF HABIB RESIDENCY', NULL, 'A-116, BLOCK-A, NEW NAZIMABAD, MANGHOPIR ROAD,', '0334-0383919', NULL, NULL, NULL, NULL, '', '0'),
('44', 'ARIF SB', 'ARIF SB', NULL, 'SHAHEED-E-MILLAT ROAD, TIGER HOUSE,', '0333-2141821', NULL, NULL, NULL, NULL, '', '0'),
('45', 'ARMY OFFICER HOUSING SOCIETY', 'ARMY OFFICER HOUSING SOCIETY', NULL, 'ARMY OFFICER SOCIETY, NEAR STADIUM,', '0', NULL, NULL, NULL, NULL, '', '0'),
('46', 'ASIF BANGLES', 'ASIF BANGLES', NULL, 'KORANGI NEAR CHINIOT HOSPITAL', '0306-1837828', NULL, NULL, NULL, NULL, '', '0'),
('47', 'ASIF CORPORATION', 'ASIF CORPORATION', NULL, 'plot # 78, jam sadiq ali road, near pumping station, lower gizri,', '0300-2326395', NULL, NULL, NULL, NULL, '', '0'),
('48', 'ASIF DEVELOPERS', 'ASIF DEVELOPERS', NULL, 'BAHRIA TOWN IQBAL VILLA STREET 21', '0321-4268624', NULL, NULL, NULL, NULL, '', '0'),
('49', 'ASIF ISMAIL SB', 'ASIF ISMAIL SB', NULL, 'PLOT # 6-B, KH-E-HILAL, LANE-3, PHASE-6, DHA,', '0300-8211941', NULL, NULL, NULL, NULL, '', '0'),
('50', 'AWAAN CERAMICS (TOTO)', 'AWAAN CERAMICS (TOTO)', NULL, '95/3, NEAR LIAQAT LIBRARY, STADIUM ROAD,', '021-34920997 ', NULL, NULL, NULL, NULL, '', '0'),
('51', 'AZHAR PAINT HOUSE', 'AZHAR PAINT HOUSE', NULL, '6 INSHAD CENTRE, ARAM BAGH FURNITURE MARKET', '0322-2109441', NULL, NULL, NULL, NULL, '', '0'),
('52', 'AZIZ PAINTS', 'AZIZ PAINTS', NULL, 'BOHRAPIR,', '021-32725414', NULL, NULL, NULL, NULL, '', '0'),
('53', 'BHAI JEE BHAI PAINTS', 'BHAI JEE BHAI PAINTS', NULL, 'BEHIND BOHRA MAZAAR, BOHRAPIR,', '0', NULL, NULL, NULL, NULL, '', '0'),
('54', 'BILAL CEMENT DEPOT', 'BILAL CEMENT DEPOT', NULL, 'GOLIMAR #1, NAWAB SADDIQUE ALI KHAN RD, ', '0308-2489601', NULL, NULL, NULL, NULL, '', '0'),
('55', 'BISMILLAH PAINT &amp; HARDWARE', 'BISMILLAH PAINT &amp; HARDWARE', NULL, 'SHOP#8/A, ABDULLAH APPARTMENT, BLOCK-16, GULISTAN-E-JOHAR,', '0321-2463890 ', NULL, NULL, NULL, NULL, '', '0'),
('56', 'BMS GAWADER', 'BMS GAWADER', NULL, 'GAWADER', '0333-2020652', NULL, NULL, NULL, NULL, '', '0'),
('57', 'BOLAN ENTERPRISES', 'BOLAN ENTERPRISES', NULL, 'TARIQ ROAD, NEAR BOMBAY SWEETS,', '0300-3855627', NULL, NULL, NULL, NULL, '', '0'),
('58', 'BURHAN HARDWARE &amp; TOOLS CO', 'BURHAN HARDWARE &amp; TOOLS CO.', NULL, 'SHOP # 2, NIAZI MANZIL, MURAD KHAN ROAD, OPP. MARRIOT ROAD,', '021-32444184', NULL, NULL, NULL, NULL, '', '0'),
('59', 'BURHANI CHEMICALS', 'BURHANI CHEMICALS', NULL, 'PXS,', '0', NULL, NULL, NULL, NULL, '', '0'),
('60', 'BURHANI ENTERPRISES', 'BURHANI ENTERPRISES', NULL, 'JODIA BAZAAR, GHULAM SHAH STREET,', '0300-2371930', NULL, NULL, NULL, NULL, '', '0'),
('61', 'BURHANI HARDWARE STORE', 'BURHANI HARDWARE STORE', NULL, 'PAK COLONY, BADAR MARKET, MANGOPIR ROAD,', '021-35482171', NULL, NULL, NULL, NULL, '', '0'),
('62', 'BURHANI SANITARY', 'BURHANI SANITARY', NULL, 'KH-E-BUKHARI/CHOTA BUKHARI, BACK TO J.B.SAEED, DHA,', '0300-0926052', NULL, NULL, NULL, NULL, '', '0'),
('63', 'BURHANI TRADERS', 'BURHANI TRADERS', NULL, 'BOHRI BAZAR, SADDAR,', '0332-2177570', NULL, NULL, NULL, NULL, '', '0'),
('64', 'BURJ-E-DEENAR', 'BURJ-E-DEENAR', NULL, 'C-104 DHORAJEE COLONY NEAR AGA KHAN HOSPITAL', '0300-2218434', NULL, NULL, NULL, NULL, '', '0'),
('65', 'CDC-TRUSTEE DOLMEN CITY REIT', 'CDC-TRUSTEE DOLMEN CITY REIT', NULL, '1ST FLOOR, EXECUTIVE TOWER,  DOLMEN CITY, HC-3, BLOCK-4, MARINE DRIVE, CLIFTON,', '021-35296192-94', NULL, NULL, NULL, NULL, '', '0'),
('66', 'CHOICE CENTRE', 'CHOICE CENTRE', NULL, 'SHOP # 181, GOLIMAR,', '021-36603596', NULL, NULL, NULL, NULL, '', '0'),
('67', 'CLIFTON COMFORT', 'CLIFTON COMFORT', NULL, 'PLOT # D-12, BLOCK-9, KEHKASHAN, CLIFTON,', '0300-2673515', NULL, NULL, NULL, NULL, '', '0'),
('68', 'COAST GUARD', 'COAST GUARD', NULL, 'KORANGI 2 1/2', '0333-2227701', NULL, NULL, NULL, NULL, '', '0'),
('69', 'COLONEL MUSHTAQ C/O ARAISH', 'COLONEL MUSHTAQ C/O ARAISH', NULL, 'BILTY AT GHOTKI', 'HAFEEZ', NULL, NULL, NULL, NULL, '', '0'),
('70', 'COLOR BANK', 'COLOR BANK', NULL, 'SHOP # 8, NEAR MUBARAK MASJID, MAIN GIZRI,', '0300-2833655', NULL, NULL, NULL, NULL, '', '0'),
('71', 'COLOR CENTRE', 'COLOR CENTRE', NULL, 'SHOP # 9, CHAND BIBI CENTRE, BOHRAPIR,', '0300-2270481', NULL, NULL, NULL, NULL, '', '0'),
('72', 'COLOR WORLD', 'COLOR WORLD', NULL, 'SHOP # 44, CHAND BIBI CENTRE, BOHRAPIR, ', '0300-2442318', NULL, NULL, NULL, NULL, '', '0'),
('73', 'Concrete Concept', 'Concrete Concept', NULL, 'C-21, BLOCK N, North Nazimabad,', '021-36675534', NULL, NULL, NULL, NULL, '', '0'),
('74', 'CONT. AHSAN ALI', 'CONT. AHSAN ALI', NULL, 'ADJACENT TO INTER WOOD OFFICE DALMIA ROAD ', '0335-2208954  ', NULL, NULL, NULL, NULL, '', '0'),
('75', 'CONT. EHSAN', 'CONT. EHSAN', NULL, 'DHA,', '0302-2300032', NULL, NULL, NULL, NULL, '', '0'),
('76', 'CONT. NAEEM', 'CONT. NAEEM', NULL, 'HOUSE # 52/4, STREET 22H, MIRZA ADAM KHAN ROAD,', '0321-2026666', NULL, NULL, NULL, NULL, '', '0'),
('77', 'CONT. RAFAT', 'CONT. RAFAT', NULL, 'BANGLOW # E-38, BLOCK-7, GULSHAN-E-IQBAL,', '0321-2213309', NULL, NULL, NULL, NULL, '', '0'),
('78', 'CONTRACTOR MEHMOOD.', 'CONTRACTOR MEHMOOD.', NULL, 'Korangi Industrial Area, Near Salim Industries', '0300-2113603', NULL, NULL, NULL, NULL, '', '0'),
('79', 'DEECON (PVT) LTD.', 'DEECON (PVT) LTD.', NULL, '7C, CG HOUSE, MEZANINE FLOOR, PHASE 2, DHA,', '0300-8221978', NULL, NULL, NULL, NULL, '', '0'),
('80', 'DEENU CHACHA', 'DEENU CHACHA', NULL, 'PLOT # 240 SHABBIRABAD BLOCK B', '0300-8962773', NULL, NULL, NULL, NULL, '', '0'),
('81', 'DILKUSHA GOHAR RESIDENCIA', 'DILKUSHA GOHAR RESIDENCIA', NULL, 'BAHADURABAD, GOHAR COMFORTS,', '0345-9990744', NULL, NULL, NULL, NULL, '', '0'),
('82', 'DIN BROTHERS', 'DIN BROTHERS', NULL, 'D-50/C, SITE, WAREHOUSE,', '0333-2355574', NULL, NULL, NULL, NULL, '', '0'),
('83', 'DOLMEN MALL', 'DOLMEN MALL', NULL, 'DOLMEN MALL, TARIQ ROAD,', '0345-3096425', NULL, NULL, NULL, NULL, '', '0'),
('84', 'DOLMEN REAL ESTATE MANAGEMENT ', 'DOLMEN REAL ESTATE MANAGEMENT (PVT) LTD', NULL, 'Dolmen City, Clifton,', '021-35296192-4 ', NULL, NULL, NULL, NULL, '', '0'),
('85', 'DR. COLOR PAINT HOUSE', 'DR. COLOR PAINT HOUSE', NULL, 'NEAR BIN HASHIM, SAFORA GOTH,', '0333-2196820', NULL, NULL, NULL, NULL, '', '0'),
('86', 'EVERSHINE CONSTRUCTION', 'EVERSHINE CONSTRUCTION', NULL, 'SINDH ASSEMBLY NEW ART COUNCIL', '0331-2048439', NULL, NULL, NULL, NULL, '', '0'),
('87', 'FAISAL BILWANI', 'FAISAL BILWANI', NULL, 'PLOT # 183 GENERAL HOUSING SOCIETY ', '0300-8211684', NULL, NULL, NULL, NULL, '', '0'),
('88', 'FAISAL MALIK', 'FAISAL MALIK', NULL, 'BAHRIA TOWN, HOME-4', '0349-3647278 ', NULL, NULL, NULL, NULL, '', '0'),
('89', 'FAISAL PAINTS', 'FAISAL PAINTS', NULL, 'GIZRI, NEAR COLOR BANK,', '0', NULL, NULL, NULL, NULL, '', '0'),
('90', 'FAIZ-E-HAKIMI', 'FAIZ-E-HAKIMI', NULL, '245, 35TH STREET, PHASE VIII, P.D.H.O.A, ', '0333-3075752', NULL, NULL, NULL, NULL, '', '0'),
('91', 'FAR EASTERN IMPEX (PVT) LTD.', 'FAR EASTERN IMPEX (PVT) LTD.', NULL, 'Plot No. D-49, Hassan Disalwa Town, Memon Ghoot, Malir,', '0308-2228663', NULL, NULL, NULL, NULL, '', '0'),
('92', 'FARAZ CEMENT DEPOT', 'FARAZ CEMENT DEPOT', NULL, 'BOHRAPIR,', '0300-8298398', NULL, NULL, NULL, NULL, '', '0'),
('93', 'FAROOQ HARDWARE', 'FAROOQ HARDWARE', NULL, 'ALLAMA IQBAL RD, OPP AL-QUBA MASJID, NEAR GUJJAR CHOWK, MANZOOR COLONY, ', '0313-2253018 ', NULL, NULL, NULL, NULL, '', '0'),
('94', 'FATIMA DEVELOPERS', 'FATIMA DEVELOPERS', NULL, 'DHA,', '0321-8781636', NULL, NULL, NULL, NULL, '', '0'),
('95', 'FATIMIYAH HOSPITAL', 'FATIMIYAH HOSPITAL', NULL, 'JM-168, SHAH ABDUL LATIF ROAD, NEAR NISHTAR PARK,', '0300-8310968', NULL, NULL, NULL, NULL, '', '0'),
('96', 'FAZAIYA HOUSING SOCIETY', 'FAZAIYA HOUSING SOCIETY', NULL, 'NORTHERN BYPASS,  SCHEME-2,', '0321-2852270', NULL, NULL, NULL, NULL, '', '0'),
('97', 'FEDERAL SANITARY', 'FEDERAL SANITARY', NULL, 'G, C-22, OPP. KAUSAR WATER SUPPLY, GULBAHAR-2,', '0321-3212017', NULL, NULL, NULL, NULL, '', '0'),
('98', 'FEROZE 1888 MILLS LIMITED', 'FEROZE 1888 MILLS LIMITED', NULL, 'PLOT # C-3, SITE, MANGOPIR ROAD,', '0305-2220658', NULL, NULL, NULL, NULL, '', '0'),
('99', 'FOUR STAR CORPORATION', 'FOUR STAR CORPORATION', NULL, 'UNI PLAZA I.I CHUNDRIGAR ROAD ROOM # 506-507 5TH FLOOR', '021-32423543', NULL, NULL, NULL, NULL, '', '0'),
('100', 'G.N FUS', 'G.N FUS', NULL, 'MR 2/36-37, MARRIOT ROAD,', '0300-2206252', NULL, NULL, NULL, NULL, '', '0'),
('101', 'GHANDHARA NISSAN LTD', 'GHANDHARA NISSAN LTD', NULL, 'SITE, NEAR SHERSHAH CHOWRANGI,', '0300-5040527', NULL, NULL, NULL, NULL, '', '0'),
('102', 'Gogan Cement', 'Gogan Cement', NULL, '244/B, Lehra Square, Shop # 15, Opp. Karimi Mosque, Block-6, PECHS, ', '0300-8921330', NULL, NULL, NULL, NULL, '', '0'),
('103', 'Golden Tiles', 'Golden Tiles', NULL, 'Golimar No.1, Nawab Siddiq Ali Khan Road,', '021-38645733', NULL, NULL, NULL, NULL, '', '0'),
('104', 'GOMAL CEMENT', 'GOMAL CEMENT', NULL, 'OFFICE B-202 CHAPPAL GARDEN ABUL HASAN ISPAHANI ROAD', '0312-8978887', NULL, NULL, NULL, NULL, '', '0'),
('105', 'GRAVITY BUILDERS', 'GRAVITY BUILDERS', NULL, 'A-29, STREET # 8, CENTRAL AVENUE PHASE-2 DHA', '0300-2246445', NULL, NULL, NULL, NULL, '', '0'),
('106', 'H.H. TRADERS', 'H.H. TRADERS', NULL, 'GOLIMAAR, OPP. USAMA TILE,', '0343-5248564', NULL, NULL, NULL, NULL, '', '0'),
('107', 'H2O HOME TILES', 'H2O HOME TILES', NULL, 'GIZRI,', '0306-2441633', NULL, NULL, NULL, NULL, '', '0'),
('108', 'HAJI CHOHAN CEMENT', 'HAJI CHOHAN CEMENT', NULL, 'RC-4/372, SHOP#9, HAJI IQBAL HOTEL, BOHRAPIR.', '0333-2307801', NULL, NULL, NULL, NULL, '', '0'),
('109', 'HAJI NAEEM', 'HAJI NAEEM', NULL, 'HYDERABAD, BILTY FROM A-ONE GOODS TRANSPORT', '0300-3017916', NULL, NULL, NULL, NULL, '', '0'),
('110', 'HAJI SALEEM', 'HAJI SALEEM', NULL, 'HYDERABAD, BILTY FROM A-ONE GOODS TRANSPORT', '0300-9376413', NULL, NULL, NULL, NULL, '', '0'),
('111', 'HAKIMI TRADERS', 'HAKIMI TRADERS', NULL, 'SHOP#2, PLOT 54/C, STREET-7,BADAR COMMERCIAL, PH-5, DHA,', '0336-2462652', NULL, NULL, NULL, NULL, '', '0'),
('112', 'HATIMI HARDWARE &amp; SANITARY', 'HATIMI HARDWARE &amp; SANITARY', NULL, 'BABUJEE ARCADE, SHOP # 2, NEAR ASGHAR ALI SHAH STADIUM,', '021-36706295', NULL, NULL, NULL, NULL, '', '0'),
('113', 'HATIMI HARDWARE STORE', 'HATIMI HARDWARE STORE', NULL, 'SHOP # 4, WSA 20/16, WATER PUMP, F.B.AREA,', '0', NULL, NULL, NULL, NULL, '', '0'),
('114', 'HAZARI ENTERPRISE', 'HAZARI ENTERPRISE', NULL, '1/14, MARRIOT ROAD,', '021-32442711', NULL, NULL, NULL, NULL, '', '0'),
('115', 'Hazari Impex', 'Hazari Impex', NULL, 'Marriot Road,', '0300-9223490', NULL, NULL, NULL, NULL, '', '0'),
('116', 'HI-TECH CONSTRUCTION', 'HI-TECH CONSTRUCTION', NULL, '163/2, 23RD STREET, OFF. KH-E-IQBAL, PHASE-8, DHA,', '0315-2804813', NULL, NULL, NULL, NULL, '', '0'),
('117', 'HUSSAINI HARDWARE', 'HUSSAINI HARDWARE', NULL, 'MOHAMMAD SHAH STREET, JODIA BAZAR, OPP. Z.A TRADERS,', '021-32544417', NULL, NULL, NULL, NULL, '', '0'),
('118', 'IK ASSOCIATE', 'IK ASSOCIATE', NULL, 'PLOT # 111/111, 26TH STREET, KH-E-MUHAFIZ, DHA,', '0333-2131168', NULL, NULL, NULL, NULL, '', '0'),
('119', 'IMRAN NAVTAKIA', 'IMRAN NAVTAKIA', NULL, 'F-50, BLOCK-8, CLIFTON,', '0300-8236065', NULL, NULL, NULL, NULL, '', '0'),
('120', 'IMRAN SB PEARL ENGINEERING', 'IMRAN SB PEARL ENGINEERING', NULL, 'S.M.B  FATIMA GIRLS COLLEGE GARDEN ', '0300-2072435', NULL, NULL, NULL, NULL, '', '0'),
('121', 'IQBAL MOTIWALA', 'IQBAL MOTIWALA', NULL, 'DHA,', '0333-2108875', NULL, NULL, NULL, NULL, '', '0'),
('122', 'IQBAL SANITARY MART', 'IQBAL SANITARY MART', NULL, 'JOHAR STREET, NEAR CHOONA BHATTI, BOHRAPIR,', '021-32735023', NULL, NULL, NULL, NULL, '', '0'),
('123', 'IRSHAD ALI SLAB WORKS', 'IRSHAD ALI SLAB WORKS', NULL, 'HAJIALI BAGH BUILDING, AMBAJI VILLA RD, RANCHORLINE,', '0322-2399352', NULL, NULL, NULL, NULL, '', '0'),
('124', 'JAMA MASJID NOORANI', 'JAMA MASJID NOORANI', NULL, 'PAK COLONY,', ' 0333-2174591', NULL, NULL, NULL, NULL, '', '0'),
('125', 'JAWED &amp; BROTHERS', 'JAWED &amp; BROTHERS', NULL, '351-36/C, OPP. KORANGI STADIUM, KORANGI # 5,', '0307-2060791', NULL, NULL, NULL, NULL, '', '0'),
('126', 'K.M.A. TRADING EST.', 'K.M.A. TRADING EST.', NULL, 'AJA MAUJI STREET, BOHRAPIR,', '0300-8295062', NULL, NULL, NULL, NULL, '', '0'),
('127', 'KAKA TILES', 'KAKA TILES', NULL, 'TIMBER MARKET, STREET 7, SIDDIQUE WAHAB ROAD,', '0321-2981080', NULL, NULL, NULL, NULL, '', '0'),
('128', 'KAMRAN TILE', 'KAMRAN TILE', NULL, 'GALI # 11, TIMBER MARKET,', '0334-3093894 ', NULL, NULL, NULL, NULL, '', '0'),
('129', 'KARACHI PAINT HOUSE', 'KARACHI PAINT HOUSE', NULL, '12-147, AMBAJI VILLA ROAD, BOHRA PIR,', '0321-9259000 ', NULL, NULL, NULL, NULL, '', '0'),
('130', 'Karachi Trading', 'Karachi Trading', NULL, 'K-72, Golimar No.1', '36605911, 36687983', NULL, NULL, NULL, NULL, '', '0'),
('131', 'KHARADAR CEMENT DEPOT', 'KHARADAR CEMENT DEPOT', NULL, 'JAFFAR FIDR ROAD, NEAR KHARADAR PARK, KHARADAR,', '0345-2406383', NULL, NULL, NULL, NULL, '', '0'),
('132', 'KHURASAAN HEIGHT', 'KHURASAAN HEIGHT', NULL, 'NUMAISH, OPP. MAZAR-E-QUAID,', '0300-9285283', NULL, NULL, NULL, NULL, '', '0'),
('133', 'KHUWAJA RAFAY', 'KHUWAJA RAFAY', NULL, 'DHA,', '0331-2857328', NULL, NULL, NULL, NULL, '', '0'),
('134', 'KING BUILDERS', 'KING BUILDERS', NULL, 'PALM RESIDENCY, NEAR KAMRAN CHOWK, GULISTAN-E-JOHAR,', '0333-3487289', NULL, NULL, NULL, NULL, '', '0'),
('135', 'KING COTTAGES', 'KING COTTAGES', NULL, 'SURVEY # 197, OPP. JAUHAR COMPLEX, BLOCK-7, JAUHAR,', '0300-9255660 ', NULL, NULL, NULL, NULL, '', '0'),
('136', 'KOHINOOR PAINTS', 'KOHINOOR PAINTS', NULL, 'SHOP # 23, CHAND BIBI CENTRE, BOHRAPIR, OPP. MEHFOOZ SHERMAL,', '0300-2109555', NULL, NULL, NULL, NULL, '', '0'),
('137', 'LAKHANI PRESIDENCY', 'LAKHANI PRESIDENCY', NULL, 'SURVEY# 42 OLD DALMIA CEMENT FACTORY, DALMIA ROAD,', '0300-8984243 ', NULL, NULL, NULL, NULL, '', '0'),
('138', 'LALA SARWAR CERA', 'LALA SARWAR CERA', NULL, '1/8, FIRDOUS COLONY, GULBAHAR,', '0322-8254878', NULL, NULL, NULL, NULL, '', '0'),
('139', 'LASANI ENTERPRISES', 'LASANI ENTERPRISES', NULL, 'BARA BOARD, NEAR PSO PUMP,', '0300-2166407', NULL, NULL, NULL, NULL, '', '0'),
('140', 'LIFE STYLE', 'LIFE STYLE', NULL, 'STADIUM ROAD,', '0304-1200328 ', NULL, NULL, NULL, NULL, '', '0'),
('141', 'M.I.M. SIDDIQ &amp; CO.', 'M.I.M. SIDDIQ &amp; CO.', NULL, 'SHOP # 3, KHORI GARDEN, MEMON MASJID, KAMBHARTI STREET,', '021-32434334', NULL, NULL, NULL, NULL, '', '0'),
('142', 'M.M. ALAM', 'M.M. ALAM', NULL, 'KUTCHI GALI # 3, MARRIOT ROAD,', '021-32436633', NULL, NULL, NULL, NULL, '', '0'),
('143', 'M.RAFIQUE.IQBAL', 'M.RAFIQUE.IQBAL', NULL, 'F-48, BLOCK 8 CLIFTON', '0', NULL, NULL, NULL, NULL, '', '0'),
('144', 'M.S CONSTRUCTIONS', 'M.S CONSTRUCTIONS', NULL, 'PLOT # 166, 30TH STREET KHYABAN-E-IQBAL PH 8 DHA KHI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('145', 'M.S. TOWER', 'M.S. TOWER', NULL, 'BAHADURABAD, NEAR UNITED BAKERY,', '0323-2627129', NULL, NULL, NULL, NULL, '', '0'),
('146', 'MACHIYARA SPRING FIELD', 'MACHIYARA SPRING FIELD', NULL, 'PLOT # D-2, BLOCK-8, CLIFTON, NEAR AGHA&#039;S SUPER MARKET,', '0321-8721457 ', NULL, NULL, NULL, NULL, '', '0'),
('147', 'MAIRAJ HOUSE', 'MAIRAJ HOUSE', NULL, '21ST STREET, KH-E-ROOMI, DHA,', '0333-2288949  ', NULL, NULL, NULL, NULL, '', '0'),
('148', 'Makka Tiles', 'Makka Tiles', NULL, 'Plot#14, Area G-31, Korangi Crossing,', '0345-2237620', NULL, NULL, NULL, NULL, '', '0'),
('149', 'MALIK BROTHERS', 'MALIK BROTHERS', NULL, '10-E, LANE-11, STREET # 21, KH-E-SEHAR, DHA,', '0321-2388661', NULL, NULL, NULL, NULL, '', '0'),
('150', 'MALIK BROTHERS-BUKHARI', 'MALIK BROTHERS-BUKHARI', NULL, 'BUKHARI COMMERCIAL, PHASE-6, DHA,', '0300-2342135  ', NULL, NULL, NULL, NULL, '', '0'),
('151', 'MANSOOR JOKHIO', 'MANSOOR JOKHIO', NULL, 'PLOT # 80, STREET # 15 KHAYABAN-E-SEHAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('152', 'MAQBOOL &amp; CO', 'MAQBOOL &amp; CO', NULL, 'NAWABSHAH', '0300-3200797  ', NULL, NULL, NULL, NULL, '', '0'),
('153', 'MAQSOOD AHMED', 'MAQSOOD AHMED', NULL, 'PLOT#50/II, KHAYABANE-MUJAHID, STREET#15, DHA', '0321-8976944', NULL, NULL, NULL, NULL, '', '0'),
('154', 'MARGALA MOTORS', 'MARGALA MOTORS', NULL, '72/4, SINDHI MUSLIM SOCIETY, NEAR SHAH LATIF SCHOOL,', '0300-8970210  ', NULL, NULL, NULL, NULL, '', '0'),
('155', 'MATRIX SYSTEM (PVT) LTD', 'MATRIX SYSTEM (PVT) LTD', NULL, '605, PROGRESSIVE SQUARE, SH-E-FAISAL,', '0333-2122756  ', NULL, NULL, NULL, NULL, '', '0'),
('156', 'MOEEN AHMED SB', 'MOEEN AHMED SB', NULL, 'H # 99, 27TH STREET, PHASE-6, KH-E-SEHAR, DHA,', '0333-2155818', NULL, NULL, NULL, NULL, '', '0'),
('157', 'MOIZ TOOLS', 'MOIZ TOOLS', NULL, 'SHOP # 2, CHAND BIBI CENTRE, BOHRAPIR,', '0', NULL, NULL, NULL, NULL, '', '0'),
('158', 'MOSAIC COLLECTION', 'MOSAIC COLLECTION', NULL, 'UNIT # 203, SEA BREEZE PLAZA, SHAHRAH-E-FAISAL,', '0300-2144299 ', NULL, NULL, NULL, NULL, '', '0'),
('159', 'MR AFAQ', 'MR AFAQ', NULL, '8 CHOWK LEE MARKET GAWADAR QARWAN', '0333-3368692  ', NULL, NULL, NULL, NULL, '', '0'),
('160', 'MR HAJI SHAKOOR', 'MR HAJI SHAKOOR', NULL, 'GENERAL HOUSING SOCIETY GATE # 5 PLOT # 128 STREET II', '0321-2840140  ', NULL, NULL, NULL, NULL, '', '0'),
('161', 'MR JAVAID', 'MR JAVAID', NULL, 'SELF PICK,', '0', NULL, NULL, NULL, NULL, '', '0'),
('162', 'MR ZEESHAN', 'MR ZEESHAN', NULL, 'C-55 BLOCK 8 BAIT UL MUKKARAM MASJID GULSHAN-E-IQBAL', '0321-2549532', NULL, NULL, NULL, NULL, '', '0'),
('163', 'MR FAISAL.', 'MR FAISAL.', NULL, 'SUKKUR,', '0300-8228082 ', NULL, NULL, NULL, NULL, '', '0'),
('164', 'MRA BUILDERS', 'MRA BUILDERS', NULL, 'NEW CHALI, NEAR TECHNO CITY,', '0321-3713418', NULL, NULL, NULL, NULL, '', '0'),
('165', 'MUGHAL CONSTRUCTION', 'MUGHAL CONSTRUCTION', NULL, 'PLOT # 114-A, COMMERCIAL AVENUE, PHASE-7 DHA', '0303-7543231  ', NULL, NULL, NULL, NULL, '', '0'),
('166', 'Mujeeb Traders', 'Mujeeb Traders', NULL, 'Neelam Colony, D.H.A.,', '0334-9549365', NULL, NULL, NULL, NULL, '', '0'),
('167', 'MUNIR IMPEX', 'MUNIR IMPEX', NULL, 'FAISALABAD, BILTY FROM NEW SITARA GOODS', '0300-2273652', NULL, NULL, NULL, NULL, '', '0'),
('168', 'MURAD HARDWARE', 'MURAD HARDWARE', NULL, 'SHOP # 5, PLOT 20/C, PH-4, NEAR REHMAN MASJID, DHA,', '0333-3714827 ', NULL, NULL, NULL, NULL, '', '0'),
('169', 'MURTAZA SB', 'MURTAZA SB', NULL, 'KORANGI INDUSTRIAL AREA, NEAR TRAFFIC LICENSE OFFICE,', '0300-8207552', NULL, NULL, NULL, NULL, '', '0'),
('170', 'MUSTAFA METAL MART', 'MUSTAFA METAL MART', NULL, '31, AL-HYDRI MEMORIAL MARKET, NORTH NAZIMABAD', '021-36671845', NULL, NULL, NULL, NULL, '', '0'),
('171', 'MUSTAQIM DYEING &amp; PRINTING', 'MUSTAQIM DYEING &amp; PRINTING IND. (PVT) LTD', NULL, 'D-14/A, BADA BOARD, SITE,', '0333-3637083  ', NULL, NULL, NULL, NULL, '', '0'),
('172', 'NADEEM BUKHARI', 'NADEEM BUKHARI', NULL, 'KHYABAN-E-MUSLIM', '0301-8281155', NULL, NULL, NULL, NULL, '', '0'),
('173', 'NASIR &amp; SONS', 'NASIR &amp; SONS', NULL, 'ALAMGIR ROAD, BAHADURABAD,', '021-34930052  ', NULL, NULL, NULL, NULL, '', '0'),
('174', 'NATIONAL PAINT HOUSE', 'NATIONAL PAINT HOUSE', NULL, 'KHARADAR', '0', NULL, NULL, NULL, NULL, '', '0'),
('175', 'NEW JILLANI CEMENT', 'NEW JILLANI CEMENT', NULL, '10/729, LIAQATABAD,', '0322-2145067  ', NULL, NULL, NULL, NULL, '', '0'),
('176', 'NEW KHATTAK HARDWARE &amp; PAI', 'NEW KHATTAK HARDWARE &amp; PAINT', NULL, 'SHOP#102, TIPU SULTAN ROAD,', '0342-2851786', NULL, NULL, NULL, NULL, '', '0'),
('177', 'NIAZI HARDWARE', 'NIAZI HARDWARE', NULL, 'PLOT # F-6, BOAT BUILDING YARD, NEAR KALA PANI, FISHRI,', '0333-3428761', NULL, NULL, NULL, NULL, '', '0'),
('178', 'NOOR MAHAL', 'NOOR MAHAL', NULL, 'SHOP # 10, BOHRAPIR,', '021-32737172 ', NULL, NULL, NULL, NULL, '', '0'),
('179', 'NOVOCHEM SPECIALITIES', 'NOVOCHEM SPECIALITIES', NULL, 'F-388, SITE,', '0345-8802586', NULL, NULL, NULL, NULL, '', '0'),
('180', 'PARAGON CONSTRUCTION.', 'PARAGON CONSTRUCTION.', NULL, 'BAHRIA APPARTMENT-2, SUPER HIGHWAY, BAHRIA TOWN,', '0346-8210834 ', NULL, NULL, NULL, NULL, '', '0'),
('181', 'PARSA TOWER', 'PARSA TOWER', NULL, 'PARSA TOWER, SHAHRAH-E-FAISAL,', '0346-8288823', NULL, NULL, NULL, NULL, '', '0'),
('182', 'POPULAR CEMENT WORK', 'POPULAR CEMENT WORK', NULL, 'SHOP # 5, JAMSHED ROAD # 3, NEAR YADGAR FISH,', '0321-2672215 ', NULL, NULL, NULL, NULL, '', '0'),
('183', 'Popular Marble', 'Popular Marble', NULL, '240-242, Badar Colony, Pak Colony,', '021-32570865 ', NULL, NULL, NULL, NULL, '', '0'),
('184', 'Progressive Marble', 'Progressive Marble', NULL, 'Plot#10-11, Sector 26, K.I.A', '0302-2338240 ', NULL, NULL, NULL, NULL, '', '0'),
('185', 'R &amp; H ENTERPRISES', 'R &amp; H ENTERPRISES', NULL, 'PARSA CITY, GARDEN, OPP. POLICE HEAD QUARTER,', '0321-8740216  ', NULL, NULL, NULL, NULL, '', '0'),
('186', 'R &amp; I ELECTRICAL APPLIANCE', 'R &amp; I ELECTRICAL APPLIANCES (PVT) LTD.', NULL, 'PARSA TOWER, SHAHRAH-E-FAISAL,', '0346-2262756  ', NULL, NULL, NULL, NULL, '', '0'),
('187', 'RAMZAN CEMENT DEPOT', 'RAMZAN CEMENT DEPOT', NULL, 'BOHRAPIR, NEAR IRSHAD ALI SLAB WORKS,', '0333-231749 0', NULL, NULL, NULL, NULL, '', '0'),
('188', 'RAWAL MASJID', 'RAWAL MASJID', NULL, 'NEAR HILL PARK,', '0321-9220969  ', NULL, NULL, NULL, NULL, '', '0'),
('189', 'RESSICHEM GODOWN', 'RESSICHEM GODOWN', NULL, 'GOLIMAR,', '0302-2289100', NULL, NULL, NULL, NULL, '', '0'),
('190', 'RESSICHEM INTERNATIONAL', 'RESSICHEM INTERNATIONAL', NULL, '309, PROGRESSIVE PLAZA, BEUMOUNT ROAD,', '021-111052052', NULL, NULL, NULL, NULL, '', '0'),
('191', 'SAIFEE HARDWARE STORE', 'SAIFEE HARDWARE STORE', NULL, 'SHOP # 5, 1-C, 27TH TAUHEED COMM. STREET, PHASE-5, DHA,', '021-35864864', NULL, NULL, NULL, NULL, '', '0'),
('192', 'SAIFEE INTERIOR WORKS', 'SAIFEE INTERIOR WORKS', NULL, 'U.P. MORE,', '0345-2747010', NULL, NULL, NULL, NULL, '', '0'),
('193', 'SAIFEE PAINT HOUSE', 'SAIFEE PAINT HOUSE', NULL, 'STREET-7,BADAR COMMERCIAL, PH-5, DHA, OPP. HAKIMI TRADERS,', '0345-2690372 ', NULL, NULL, NULL, NULL, '', '0'),
('194', 'SAIFY MASJID', 'SAIFY MASJID', NULL, 'SAIFY BAGH, CHAKIWARA,', '0', NULL, NULL, NULL, NULL, '', '0'),
('195', 'SALIM SHAMS SB', 'SALIM SHAMS SB', NULL, 'DHA,', '0300-2427014', NULL, NULL, NULL, NULL, '', '0'),
('196', 'SAMS HARDWARE', 'SAMS HARDWARE', NULL, 'SHOP # 2, PLOT # 8C, BUKHARI COMM., LANE-8, PHASE 6, DHA,', '0321-2423752 ', NULL, NULL, NULL, NULL, '', '0'),
('197', 'SHABBIR SONS', 'SHABBIR SONS', NULL, 'SHOP # 224, OPP. KASB BANK, SADDAR,', '022-2900807 ', NULL, NULL, NULL, NULL, '', '0'),
('198', 'SHAH HARDWARE', 'SHAH HARDWARE', NULL, 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,', '0333-3190927', NULL, NULL, NULL, NULL, '', '0'),
('199', 'SHOAIB ISMAIL SB', 'SHOAIB ISMAIL SB', NULL, 'PLOT #30/1, STREET # 10, KH-E-HILAL, DHA,', '0321-3787609 ', NULL, NULL, NULL, NULL, '', '0'),
('200', 'SOHAIL SANITARY STORE', 'SOHAIL SANITARY STORE', NULL, 'PLOT # 1307/3M, SIDDIQABAD, F.B.AREA,', '0323-2787105  ', NULL, NULL, NULL, NULL, '', '0'),
('201', 'T.A.GULAMALLAY &amp; CO.', 'T.A.GULAMALLAY &amp; CO.', NULL, 'FIDRI CHAMBER, JEWANI STREET, OFF. AIWAN-E-TIJARAT RD,', '021-32414452 ', NULL, NULL, NULL, NULL, '', '0'),
('202', 'TAHER &amp; SONS HARDWARE HOUS', 'TAHER &amp; SONS HARDWARE HOUSE', NULL, 'PLOT # A-979 SECTOR 11/B SHOP # 1 JAMALI TRUST', '0333-6405252 ', NULL, NULL, NULL, NULL, '', '0'),
('203', 'TAHERI HARDWARE STORES', 'TAHERI HARDWARE STORES', NULL, 'SHOP # 6, LUCKY HOUSE, OPP. BOHRAPIR,', '0333-3377652 ', NULL, NULL, NULL, NULL, '', '0'),
('204', 'TAHERI SONS &amp; HARDWARE HOU', 'TAHERI SONS &amp; HARDWARE HOUSE', NULL, 'SHOP # 1 JAMALI TRUST BUILDING 4 UP MOOR', '0333-6405252', NULL, NULL, NULL, NULL, '', '0'),
('205', 'TANVEER BANGLES', 'TANVEER BANGLES', NULL, 'KORANGI # 2, ', '0321-2232560', NULL, NULL, NULL, NULL, '', '0'),
('206', 'TANZO INTERNATIONAL (PAKISTAN)', 'TANZO INTERNATIONAL (PAKISTAN)', NULL, 'PLOT # 566, Q BLOCK, JOHAR TOWN,', '0321-9991991 ', NULL, NULL, NULL, NULL, '', '0'),
('207', 'TECHNO CRATE', 'TECHNO CRATE', NULL, 'BAHRIA TOWN, SUPER HIGHWAY,', '0308-8617236  ', NULL, NULL, NULL, NULL, '', '0'),
('208', 'THE ARCHITECTS', 'THE ARCHITECTS', NULL, 'NEAR CAR DEAL, CLIFTON, 2 TALWAR,', '0', NULL, NULL, NULL, NULL, '', '0'),
('209', 'THE COMFORT', 'THE COMFORT', NULL, 'SB-3, BLOCK-8, YASEENABAD,', '0321-9214890 ', NULL, NULL, NULL, NULL, '', '0'),
('210', 'THE CONSTRUCT', 'THE CONSTRUCT', NULL, 'BAHRIA ICON TOWER, NEAR ABDULLAH SHAH GHAZI TOMB, CLIFTON,', '0334-6009005 ', NULL, NULL, NULL, NULL, '', '0'),
('211', 'TILE HOUSE', 'TILE HOUSE', NULL, 'TARIQ ROAD, NEAR BOMBAY SWEETS,', '0307-2222901 ', NULL, NULL, NULL, NULL, '', '0'),
('212', 'Tiles Centre', 'Tiles Centre', NULL, 'Shop# GC-63, Main Gulbahar Road, Golimar No.1', '0333-3642832', NULL, NULL, NULL, NULL, '', '0'),
('213', 'TIMES RESIDENCY', 'TIMES RESIDENCY', NULL, 'D-11, NORTH NAZIMABAD, NEAR BOARD OFFICE,', '0300-7005423 ', NULL, NULL, NULL, NULL, '', '0'),
('214', 'UNE ENTERPRISES', 'UNE ENTERPRISES', NULL, 'BAHRIA HOSPITAL, BAHRIA TOWN,', '0321-2021983 ', NULL, NULL, NULL, NULL, '', '0'),
('215', 'UNION STEEL', 'UNION STEEL', NULL, 'PLOT # D-1-56, MANGOPIR ROAD, SITE,', '0321-2887126', NULL, NULL, NULL, NULL, '', '0'),
('216', 'UNITED SANITARY', 'UNITED SANITARY', NULL, 'B.S 16, BLOCK 14, SHOP NO.3, UROOJ SQUARE, F.B. AREA, KARACHI', '021-36325490 ', NULL, NULL, NULL, NULL, '', '0'),
('217', 'United Tile Center', 'United Tile Center', NULL, 'A-26, Farhan Paradise, Block-14, Gulistan-e-Johar', '0314-2228190 ', NULL, NULL, NULL, NULL, '', '0'),
('218', 'UNIVERSAL TRADING / RASHID TIL', 'UNIVERSAL TRADING / RASHID TILE', NULL, 'NEAR UMER MASJID, OPP. H.M.SONS, GOLIMAAR,', '0315-3709042', NULL, NULL, NULL, NULL, '', '0'),
('219', 'VALI RANGOONWALA', 'VALI RANGOONWALA', NULL, '8/A, KDA SCHEME # 1, KARSAZ ROAD,', '0331-7531723 ', NULL, NULL, NULL, NULL, '', '0'),
('220', 'VIRTRACO TILES', 'VIRTRACO TILES', NULL, '15/139, SHOP # 3-4, FATIMA TOWER, BAHADURABAD, J. AFGHANI ROAD,', '021-34123666 ', NULL, NULL, NULL, NULL, '', '0'),
('221', 'Walls &amp; Woods', 'Walls &amp; Woods', NULL, 'Building#28-C, Mezzanine Floor,Sunset Lane, DHA', '021-353181414-5  ', NULL, NULL, NULL, NULL, '', '0'),
('222', 'YOUSUF ALI TAYABJI MUNDRAWALA ', 'YOUSUF ALI TAYABJI MUNDRAWALA &amp; SONS', NULL, 'SHOP#2, RAEES BUILDING, BOHRAPR', '0346-2398764 ', NULL, NULL, NULL, NULL, '', '0'),
('223', 'ZAFAR CEMENT', 'ZAFAR CEMENT', NULL, 'SHOP # 155/2, JOHAR ROAD, AMEER KHUSROO ROAD', '0300-9276606 ', NULL, NULL, NULL, NULL, '', '0'),
('224', 'ZAHID ALI SHAH', 'ZAHID ALI SHAH', NULL, 'COMMERCIAL AVENUE, PHASE-4, KH-E-HILAL, DHA,', '0300-2943738 ', NULL, NULL, NULL, NULL, '', '0'),
('225', 'ZAHID TILE', 'ZAHID TILE', NULL, 'BESIDE SUBHANALLAH TILE, BLOCK-16, WATER PUMP,', '0311-4999414 ', NULL, NULL, NULL, NULL, '', '0'),
('226', 'ZCL', 'ZCL', NULL, '501, BANK BUSINESS CENTRE, SULTAN AHMED SHAH ROAD, K.E.C.H.S,', '021-34528367', NULL, NULL, NULL, NULL, '', '0'),
('227', 'ZEENAT HARDWARE', 'ZEENAT HARDWARE', NULL, 'PAK COLONY, NEAR BISMILLAH HOTEL,', '0300-2299803 ', NULL, NULL, NULL, NULL, '', '0'),
('228', 'ZOAIB ALI &amp; COMPANY', 'ZOAIB ALI &amp; COMPANY', NULL, 'FATEH CHOWK NEAR BOULEVARD MALL', '022-2782644 45  ', NULL, NULL, NULL, NULL, '', '0'),
('229', 'ZULFIQAR HARDWARE', 'ZULFIQAR HARDWARE', NULL, 'SHOP # S-96, GROUND FLOOR, GRACE CENTRE, GIZRI, DHA,', '0321-9209150 ', NULL, NULL, NULL, NULL, '', '0'),
('230', 'hareem1', 'hareem', NULL, 'hareem3', NULL, NULL, NULL, NULL, NULL, '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('1', '1', '3G CONSTRUCTION', '3G CONSTRUCTION', 'BAHRIA HEIGHTS, BAHRIA TOWN,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('2', '2', 'A.G. GIGI (PVT) LTD', 'A.G. GIGI (PVT) LTD', 'NEAR BROOKS CHOWRANGI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('3', '3', 'A.M HUSSAIN &amp; CO', 'A.M HUSSAIN &amp; CO', 'SHOP # 2 &amp; 3 ANUM ARCADE, SUNSET LANE-1 PHASE II EXT. DHA', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('4', '4', 'AA QUALITY BUILDERS', 'AA QUALITY BUILDERS', 'C-6, BLOCK-7, Gulshan-e-Iqbal,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('5', '5', 'AAA Associates', 'AAA Associates', 'D.H.A.', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('6', '6', 'AAA FACILITY MANAGEMENT LTD', 'AAA FACILITY MANAGEMENT LTD', 'C-19, KH-E-BUKHARI, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('7', '7', 'ABASEEN CONSTRUCTION CO. PVT LTD', 'ABASEEN CONSTRUCTION CO. PVT L', 'Office No. 7, Afzal Apartments, Stadium Road, Karachi, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('8', '8', 'ABDUL KAREEM', 'ABDUL KAREEM', 'GULSHAN', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('9', '9', 'ABDUL QADIR', 'ABDUL QADIR', 'PLOT # 78, SABA AVENUE, NEAR IMAM BARGAH, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('10', '10', 'ABDUL QADIR JAAFRANI', 'ABDUL QADIR JAAFRANI', 'PLOT # C-43-10, BLOCK-6, PECHS, NEAR FEROZABAD POLICE STATION', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('11', '11', 'ABDULLAH TILES', 'ABDULLAH TILES', '26TH STREET, TAUHEED COMMERCIAL, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('12', '12', 'RAMZAN TRADERS', 'RAMZAN TRADERS', 'AEROMOTIVE', '3', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('13', '13', 'AHMED ENGINEERING', 'AHMED ENGINEERING', 'CLARINAT CHEMICALS PAKISTAN,', '4', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('14', '14', 'AHMED SANITARY', 'AHMED SANITARY', 'CYCLE MARKET, LIGHT HOUSE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('15', '15', 'AL-ABBAS PAINT HOUSE', 'AL-ABBAS PAINT HOUSE', 'MAIN GIZRI, OPP. MUBARAK MASJID, KH-E-HAFEEZ,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('16', '16', 'AL-BURHAN SANITARY', 'AL-BURHAN SANITARY', 'SHOP # 4, JAVERIA MANSION, AKBAR ALI LANE, SADDAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('17', '17', 'AL-HAIDER PAINT HOUSE', 'AL-HAIDER PAINT HOUSE', 'SHOP # 15-16, SAKINA ARCADE, OPP. MUBARAK MASJID, GIZRI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('18', '18', 'AL-HASNAIN HARDWARE', 'AL-HASNAIN HARDWARE', 'UPPER GIZRI RD, NEAR MUBARAK, MASJID,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('19', '19', 'AL-HATEMI PAINT HOUSE', 'AL-HATEMI PAINT HOUSE', 'LOWER GIZRI, AVENUE ROAD, OPP. AL-KARIM PAINT, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('20', '20', 'AL-KARIM PAINT HOUSE', 'AL-KARIM PAINT HOUSE', 'LOWER GIZRI, AVENUE ROAD, NEAR ASIF CORP, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('21', '21', 'AL-MADINA TILES', 'AL-MADINA TILES', 'R-413, SECTOR 11C-1, ADAM TOWN NORTH KARACHI', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('22', '22', 'AL-MOHAMMADI TILE', 'AL-MOHAMMADI TILE', 'SADDAR, NEAR SHABBIR BIRYANI,', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('23', '23', 'AL-MOIZ HARDWARE', 'AL-MOIZ HARDWARE', 'MAIN GIZRI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('24', '24', 'AL-SIRAJ FARMHOUSE', 'AL-SIRAJ FARMHOUSE', 'GHAREEBABAD, NEAR PSO PUMP, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('25', '25', 'ALVI HARDWARE', 'ALVI HARDWARE', 'PLOT # 30-C, LANE-8, BUKHARI COMMERCIAL, AHMAD APPARTMENT,DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('26', '26', 'AMCORP CONSTRUCTION', 'AMCORP CONSTRUCTION', 'M.U.E.T., JAMSHORO,', '6', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('27', '27', 'AMIN DHOSA C/O THE ARCHITECT', 'AMIN DHOSA C/O THE ARCHITECT', 'PLOT # F-92, BATH ISLAND, NEAR AGA KHAN JAMAT KHANA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('28', '28', 'AMIR TOOLS', 'AMIR TOOLS', 'SHOP # 2/3, SHUJA MARKET, KATCHI GALI # 3, MARRIOT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('29', '29', 'AMMAR HARDWARE &amp; KITCHEN', 'AMMAR HARDWARE &amp; KITCHEN', 'F-18, GRACE CENTRE, GIZRI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('30', '30', 'AMMAR HARDWARE STORE', 'AMMAR HARDWARE STORE', 'C-CH, REHMAT ALI RD, MANZOOR COLONY, GUJJAR CHOWK,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('31', '31', 'AMMAR PAINTS &amp; HARDWARE', 'AMMAR PAINTS &amp; HARDWARE', 'HYDERABAD,', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('32', '32', 'ANSAR BROTHERS', 'ANSAR BROTHERS', 'ABDUL MAJID SIDHI STREET, MARRIOT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('33', '33', 'ANWER OK', 'ANWER OK', '11-C, MOHAMMAD ALI SOCIETY, NEAR KAYBEES,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('34', '34', 'A-ONE MARBLE', 'A-ONE MARBLE', 'K-22, JOHAR COLONY, MANGOPIR ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('35', '35', 'A-ONE PAINT HARDWARE &amp; ELECTRIC STORE', 'A-ONE PAINT HARDWARE &amp; ELE', 'SHOP # 21, KHAWAJA MANZIL, BAHADURABAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('36', '36', 'ARAISH', 'ARAISH', 'OFFICE # 210, TAYYAB ALI STREET, SADDAR,', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('37', '37', 'ARCH. AFTAB ABBASI', 'ARCH. AFTAB ABBASI', 'GAWADAR,', '7', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('38', '38', 'ARCH. AHMED JUMANI', 'ARCH. AHMED JUMANI', '17A KDA SCHEME # 1 NEAR PEER PAGARA HOUSE', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('39', '39', 'ARCH. AMBREEN', 'ARCH. AMBREEN', '912/9TH FLOOR, WEST POINT TOWER, PHASE-2, KORANGI ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('40', '40', 'ARCH. FAROOQI', 'ARCH. FAROOQI', 'SHABBIRABAD, BLOCK A', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('41', '41', 'ARCH. SHEHLA TASLEEM', 'ARCH. SHEHLA TASLEEM', 'PLOT # S22, STREET # 4, PH-VII, NEAR FATIMA MASJID, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('42', '42', 'ARCH. ZAHRA', 'ARCH. ZAHRA', 'ISLAMABAD,', '3', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('43', '43', 'ARIF HABIB RESIDENCY', 'ARIF HABIB RESIDENCY', 'A-116, BLOCK-A, NEW NAZIMABAD, MANGHOPIR ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('44', '44', 'ARIF SB', 'ARIF SB', 'SHAHEED-E-MILLAT ROAD, TIGER HOUSE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('45', '45', 'ARMY OFFICER HOUSING SOCIETY', 'ARMY OFFICER HOUSING SOCIETY', 'ARMY OFFICER SOCIETY, NEAR STADIUM,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('46', '46', 'ASIF BANGLES', 'ASIF BANGLES', 'KORANGI NEAR CHINIOT HOSPITAL', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('47', '47', 'ASIF CORPORATION', 'ASIF CORPORATION', 'plot # 78, jam sadiq ali road, near pumping station, lower gizri,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('48', '48', 'ASIF DEVELOPERS', 'ASIF DEVELOPERS', 'BAHRIA TOWN IQBAL VILLA STREET 21', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('49', '49', 'ASIF ISMAIL SB', 'ASIF ISMAIL SB', 'PLOT # 6-B, KH-E-HILAL, LANE-3, PHASE-6, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('50', '50', 'AWAAN CERAMICS (TOTO)', 'AWAAN CERAMICS (TOTO)', '95/3, NEAR LIAQAT LIBRARY, STADIUM ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('51', '51', 'AZHAR PAINT HOUSE', 'AZHAR PAINT HOUSE', '6 INSHAD CENTRE, ARAM BAGH FURNITURE MARKET', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('52', '52', 'AZIZ PAINTS', 'AZIZ PAINTS', 'BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('53', '53', 'BHAI JEE BHAI PAINTS', 'BHAI JEE BHAI PAINTS', 'BEHIND BOHRA MAZAAR, BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('54', '54', 'BILAL CEMENT DEPOT', 'BILAL CEMENT DEPOT', 'GOLIMAR #1, NAWAB SADDIQUE ALI KHAN RD, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('55', '55', 'BISMILLAH PAINT &amp; HARDWARE', 'BISMILLAH PAINT &amp; HARDWARE', 'SHOP#8/A, ABDULLAH APPARTMENT, BLOCK-16, GULISTAN-E-JOHAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('56', '56', 'BMS 7', 'BMS 7', 'GAWADER', '7', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('57', '57', 'BOLAN ENTERPRISES', 'BOLAN ENTERPRISES', 'TARIQ ROAD, NEAR BOMBAY SWEETS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('58', '58', 'BURHAN HARDWARE &amp; TOOLS CO.', 'BURHAN HARDWARE &amp; TOOLS CO', 'SHOP # 2, NIAZI MANZIL, MURAD KHAN ROAD, OPP. MARRIOT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('59', '59', 'BURHANI CHEMICALS', 'BURHANI CHEMICALS', 'PXS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('60', '60', 'BURHANI ENTERPRISES', 'BURHANI ENTERPRISES', 'JODIA BAZAAR, GHULAM SHAH STREET,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('61', '61', 'BURHANI HARDWARE STORE', 'BURHANI HARDWARE STORE', 'PAK COLONY, BADAR MARKET, MANGOPIR ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('62', '62', 'BURHANI SANITARY', 'BURHANI SANITARY', 'KH-E-BUKHARI/CHOTA BUKHARI, BACK TO J.B.SAEED, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('63', '63', 'BURHANI TRADERS', 'BURHANI TRADERS', 'BOHRI BAZAR, SADDAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('64', '64', 'BURJ-E-DEENAR', 'BURJ-E-DEENAR', 'C-104 DHORAJEE COLONY NEAR AGA KHAN HOSPITAL', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('65', '65', 'CDC-TRUSTEE DOLMEN CITY REIT', 'CDC-TRUSTEE DOLMEN CITY REIT', '1ST FLOOR, EXECUTIVE TOWER,  DOLMEN CITY, HC-3, BLOCK-4, MARINE DRIVE, CLIFTON,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('66', '66', 'CHOICE CENTRE', 'CHOICE CENTRE', 'SHOP # 181, GOLIMAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('67', '67', 'CLIFTON COMFORT', 'CLIFTON COMFORT', 'PLOT # D-12, BLOCK-9, KEHKASHAN, CLIFTON,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('68', '68', 'COAST GUARD', 'COAST GUARD', 'KORANGI 2 1/2', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('69', '69', 'COLONEL MUSHTAQ C/O ARAISH', 'COLONEL MUSHTAQ C/O ARAISH', 'BILTY AT GHOTKI', '8', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('70', '70', 'COLOR BANK', 'COLOR BANK', 'SHOP # 8, NEAR MUBARAK MASJID, MAIN GIZRI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('71', '71', 'COLOR CENTRE', 'COLOR CENTRE', 'SHOP # 9, CHAND BIBI CENTRE, BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('72', '72', 'COLOR WORLD', 'COLOR WORLD', 'SHOP # 44, CHAND BIBI CENTRE, BOHRAPIR, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('73', '73', 'Concrete Concept', 'Concrete Concept', 'C-21, BLOCK N, North Nazimabad,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('74', '74', 'CONT. AHSAN ALI', 'CONT. AHSAN ALI', 'ADJACENT TO INTER WOOD OFFICE DALMIA ROAD ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('75', '75', 'CONT. EHSAN', 'CONT. EHSAN', 'DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('76', '76', 'CONT. NAEEM', 'CONT. NAEEM', 'HOUSE # 52/4, STREET 22H, MIRZA ADAM KHAN ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('77', '77', 'CONT. RAFAT', 'CONT. RAFAT', 'BANGLOW # E-38, BLOCK-7, GULSHAN-E-IQBAL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('78', '78', 'CONTRACTOR MEHMOOD.', 'CONTRACTOR MEHMOOD.', 'Korangi Industrial Area, Near Salim Industries', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('79', '79', 'DEECON (PVT) LTD.', 'DEECON (PVT) LTD.', '7C, CG HOUSE, MEZANINE FLOOR, PHASE 2, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('80', '80', 'DEENU CHACHA', 'DEENU CHACHA', 'PLOT # 240 SHABBIRABAD BLOCK B', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('81', '81', 'DILKUSHA GOHAR RESIDENCIA', 'DILKUSHA GOHAR RESIDENCIA', 'BAHADURABAD, GOHAR COMFORTS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('82', '82', 'DIN BROTHERS', 'DIN BROTHERS', 'D-50/C, SITE, WAREHOUSE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('83', '83', 'DOLMEN MALL', 'DOLMEN MALL', 'DOLMEN MALL, TARIQ ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('84', '84', 'DOLMEN REAL ESTATE MANAGEMENT (PVT) LTD', 'DOLMEN REAL ESTATE MANAGEMENT ', 'Dolmen City, Clifton,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('85', '85', 'DR. COLOR PAINT HOUSE', 'DR. COLOR PAINT HOUSE', 'NEAR BIN HASHIM, SAFORA GOTH,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('86', '86', 'EVERSHINE CONSTRUCTION', 'EVERSHINE CONSTRUCTION', 'SINDH ASSEMBLY NEW ART COUNCIL', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('87', '87', 'FAISAL BILWANI', 'FAISAL BILWANI', 'PLOT # 183 GENERAL HOUSING SOCIETY ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('88', '88', 'FAISAL MALIK', 'FAISAL MALIK', 'BAHRIA TOWN, HOME-4', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('89', '89', 'FAISAL PAINTS', 'FAISAL PAINTS', 'GIZRI, NEAR COLOR BANK,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('90', '90', 'FAIZ-E-HAKIMI', 'FAIZ-E-HAKIMI', '245, 35TH STREET, PHASE VIII, P.D.H.O.A, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('91', '91', 'FAR EASTERN IMPEX (PVT) LTD.', 'FAR EASTERN IMPEX (PVT) LTD.', 'Plot No. D-49, Hassan Disalwa Town, Memon Ghoot, Malir,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('92', '92', 'FARAZ CEMENT DEPOT', 'FARAZ CEMENT DEPOT', 'BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('93', '93', 'FAROOQ HARDWARE', 'FAROOQ HARDWARE', 'ALLAMA IQBAL RD, OPP AL-QUBA MASJID, NEAR GUJJAR CHOWK, MANZOOR COLONY, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('94', '94', 'FATIMA DEVELOPERS', 'FATIMA DEVELOPERS', 'DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('95', '95', 'FATIMIYAH HOSPITAL', 'FATIMIYAH HOSPITAL', 'JM-168, SHAH ABDUL LATIF ROAD, NEAR NISHTAR PARK,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('96', '96', 'FAZAIYA HOUSING SOCIETY', 'FAZAIYA HOUSING SOCIETY', 'NORTHERN BYPASS,  SCHEME-2,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('97', '97', 'FEDERAL SANITARY', 'FEDERAL SANITARY', 'G, C-22, OPP. KAUSAR WATER SUPPLY, GULBAHAR-2,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('98', '98', 'FEROZE 1888 MILLS LIMITED', 'FEROZE 1888 MILLS LIMITED', 'PLOT # C-3, SITE, MANGOPIR ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('99', '99', 'FOUR STAR CORPORATION', 'FOUR STAR CORPORATION', 'UNI PLAZA I.I CHUNDRIGAR ROAD ROOM # 506-507 5TH FLOOR', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('100', '100', 'G.N FUS', 'G.N FUS', 'MR 2/36-37, MARRIOT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('101', '101', 'GHANDHARA NISSAN LTD', 'GHANDHARA NISSAN LTD', 'SITE, NEAR SHERSHAH CHOWRANGI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('102', '102', 'Gogan Cement', 'Gogan Cement', '244/B, Lehra Square, Shop # 15, Opp. Karimi Mosque, Block-6, PECHS, ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('103', '103', 'Golden Tiles', 'Golden Tiles', 'Golimar No.1, Nawab Siddiq Ali Khan Road,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('104', '104', 'GOMAL CEMENT', 'GOMAL CEMENT', 'OFFICE B-202 CHAPPAL GARDEN ABUL HASAN ISPAHANI ROAD', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('105', '105', 'GRAVITY BUILDERS', 'GRAVITY BUILDERS', 'A-29, STREET # 8, CENTRAL AVENUE PHASE-2 DHA', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('106', '106', 'H.H. TRADERS', 'H.H. TRADERS', 'GOLIMAAR, OPP. USAMA TILE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('107', '107', 'H2O HOME TILES', 'H2O HOME TILES', 'GIZRI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('108', '108', 'HAJI CHOHAN CEMENT', 'HAJI CHOHAN CEMENT', 'RC-4/372, SHOP#9, HAJI IQBAL HOTEL, BOHRAPIR.', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('109', '109', 'HAJI NAEEM', 'HAJI NAEEM', 'HYDERABAD, BILTY FROM A-ONE GOODS TRANSPORT', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('110', '110', 'HAJI SALEEM', 'HAJI SALEEM', 'HYDERABAD, BILTY FROM A-ONE GOODS TRANSPORT', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('111', '111', 'HAKIMI TRADERS', 'HAKIMI TRADERS', 'SHOP#2, PLOT 54/C, STREET-7,BADAR COMMERCIAL, PH-5, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('112', '112', 'HATIMI HARDWARE &amp; SANITARY', 'HATIMI HARDWARE &amp; SANITARY', 'BABUJEE ARCADE, SHOP # 2, NEAR ASGHAR ALI SHAH STADIUM,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('113', '113', 'HATIMI HARDWARE STORE', 'HATIMI HARDWARE STORE', 'SHOP # 4, WSA 20/16, WATER PUMP, F.B.AREA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('114', '114', 'HAZARI ENTERPRISE', 'HAZARI ENTERPRISE', '1/14, MARRIOT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('115', '115', 'Hazari Impex', 'Hazari Impex', 'Marriot Road,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('116', '116', 'HI-TECH CONSTRUCTION', 'HI-TECH CONSTRUCTION', '163/2, 23RD STREET, OFF. KH-E-IQBAL, PHASE-8, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('117', '117', 'HUSSAINI HARDWARE', 'HUSSAINI HARDWARE', 'MOHAMMAD SHAH STREET, JODIA BAZAR, OPP. Z.A TRADERS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('118', '118', 'IK ASSOCIATE', 'IK ASSOCIATE', 'PLOT # 111/111, 26TH STREET, KH-E-MUHAFIZ, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('119', '119', 'IMRAN NAVTAKIA', 'IMRAN NAVTAKIA', 'F-50, BLOCK-8, CLIFTON,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('120', '120', 'IMRAN SB PEARL ENGINEERING', 'IMRAN SB PEARL ENGINEERING', 'S.M.B  FATIMA GIRLS COLLEGE GARDEN ', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('121', '121', 'IQBAL MOTIWALA', 'IQBAL MOTIWALA', 'DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('122', '122', 'IQBAL SANITARY MART', 'IQBAL SANITARY MART', 'JOHAR STREET, NEAR CHOONA BHATTI, BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('123', '123', 'IRSHAD ALI SLAB WORKS', 'IRSHAD ALI SLAB WORKS', 'HAJIALI BAGH BUILDING, AMBAJI VILLA RD, RANCHORLINE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('124', '124', 'JAMA MASJID NOORANI', 'JAMA MASJID NOORANI', 'PAK COLONY,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('125', '125', 'JAWED &amp; BROTHERS', 'JAWED &amp; BROTHERS', '351-36/C, OPP. KORANGI STADIUM, KORANGI # 5,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('126', '126', 'K.M.A. TRADING EST.', 'K.M.A. TRADING EST.', 'AJA MAUJI STREET, BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('127', '127', 'KAKA TILES', 'KAKA TILES', 'TIMBER MARKET, STREET 7, SIDDIQUE WAHAB ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('128', '128', 'KAMRAN TILE', 'KAMRAN TILE', 'GALI # 11, TIMBER MARKET,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('129', '129', '1 PAINT HOUSE', '1 PAINT HOUSE', '12-147, AMBAJI VILLA ROAD, BOHRA PIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('130', '130', '1 Trading', '1 Trading', 'K-72, Golimar No.1', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('131', '131', 'KHARADAR CEMENT DEPOT', 'KHARADAR CEMENT DEPOT', 'JAFFAR FIDR ROAD, NEAR KHARADAR PARK, KHARADAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('132', '132', 'KHURASAAN HEIGHT', 'KHURASAAN HEIGHT', 'NUMAISH, OPP. MAZAR-E-QUAID,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('133', '133', 'KHUWAJA RAFAY', 'KHUWAJA RAFAY', 'DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('134', '134', 'KING BUILDERS', 'KING BUILDERS', 'PALM RESIDENCY, NEAR KAMRAN CHOWK, GULISTAN-E-JOHAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('135', '135', 'KING COTTAGES', 'KING COTTAGES', 'SURVEY # 197, OPP. JAUHAR COMPLEX, BLOCK-7, JAUHAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('136', '136', 'KOHINOOR PAINTS', 'KOHINOOR PAINTS', 'SHOP # 23, CHAND BIBI CENTRE, BOHRAPIR, OPP. MEHFOOZ SHERMAL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('137', '137', 'LAKHANI PRESIDENCY', 'LAKHANI PRESIDENCY', 'SURVEY# 42 OLD DALMIA CEMENT FACTORY, DALMIA ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('138', '138', 'LALA SARWAR CERA', 'LALA SARWAR CERA', '1/8, FIRDOUS COLONY, GULBAHAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('139', '139', 'LASANI ENTERPRISES', 'LASANI ENTERPRISES', 'BARA BOARD, NEAR PSO PUMP,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('140', '140', 'LIFE STYLE', 'LIFE STYLE', 'STADIUM ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('141', '141', 'M.I.M. SIDDIQ &amp; CO.', 'M.I.M. SIDDIQ &amp; CO.', 'SHOP # 3, KHORI GARDEN, MEMON MASJID, KAMBHARTI STREET,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('142', '142', 'M.M. ALAM', 'M.M. ALAM', 'KUTCHI GALI # 3, MARRIOT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('143', '143', 'M.RAFIQUE.IQBAL', 'M.RAFIQUE.IQBAL', 'F-48, BLOCK 8 CLIFTON', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('144', '144', 'M.S CONSTRUCTIONS', 'M.S CONSTRUCTIONS', 'PLOT # 166, 30TH STREET KHYABAN-E-IQBAL PH 8 DHA KHI', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('145', '145', 'M.S. TOWER', 'M.S. TOWER', 'BAHADURABAD, NEAR UNITED BAKERY,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('146', '146', 'MACHIYARA SPRING FIELD', 'MACHIYARA SPRING FIELD', 'PLOT # D-2, BLOCK-8, CLIFTON, NEAR AGHA&#039;S SUPER MARKET,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('147', '147', 'MAIRAJ HOUSE', 'MAIRAJ HOUSE', '21ST STREET, KH-E-ROOMI, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('148', '148', 'Makka Tiles', 'Makka Tiles', 'Plot#14, Area G-31, Korangi Crossing,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('149', '149', 'MALIK BROTHERS', 'MALIK BROTHERS', '10-E, LANE-11, STREET # 21, KH-E-SEHAR, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('150', '150', 'MALIK BROTHERS-BUKHARI', 'MALIK BROTHERS-BUKHARI', 'BUKHARI COMMERCIAL, PHASE-6, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('151', '151', 'MANSOOR JOKHIO', 'MANSOOR JOKHIO', 'PLOT # 80, STREET # 15 KHAYABAN-E-SEHAR', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('152', '152', 'MAQBOOL &amp; CO', 'MAQBOOL &amp; CO', 'NAWABSHAH', '9', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('153', '153', 'MAQSOOD AHMED', 'MAQSOOD AHMED', 'PLOT#50/II, KHAYABANE-MUJAHID, STREET#15, DHA', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('154', '154', 'MARGALA MOTORS', 'MARGALA MOTORS', '72/4, SINDHI MUSLIM SOCIETY, NEAR SHAH LATIF SCHOOL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('155', '155', 'MATRIX SYSTEM (PVT) LTD', 'MATRIX SYSTEM (PVT) LTD', '605, PROGRESSIVE SQUARE, SH-E-FAISAL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('156', '156', 'MOEEN AHMED SB', 'MOEEN AHMED SB', 'H # 99, 27TH STREET, PHASE-6, KH-E-SEHAR, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('157', '157', 'MOIZ TOOLS', 'MOIZ TOOLS', 'SHOP # 2, CHAND BIBI CENTRE, BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('158', '158', 'MOSAIC COLLECTION', 'MOSAIC COLLECTION', 'UNIT # 203, SEA BREEZE PLAZA, SHAHRAH-E-FAISAL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('159', '159', 'MR AFAQ', 'MR AFAQ', '8 CHOWK LEE MARKET GAWADAR QARWAN', '7', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('160', '160', 'MR HAJI SHAKOOR', 'MR HAJI SHAKOOR', 'GENERAL HOUSING SOCIETY GATE # 5 PLOT # 128 STREET II', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('161', '161', 'MR JAVAID', 'MR JAVAID', 'SELF PICK,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('162', '162', 'MR ZEESHAN', 'MR ZEESHAN', 'C-55 BLOCK 8 BAIT UL MUKKARAM MASJID GULSHAN-E-IQBAL', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('163', '163', 'MR FAISAL.', 'MR FAISAL.', 'SUKKUR,', '11', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('164', '164', 'MRA BUILDERS', 'MRA BUILDERS', 'NEW CHALI, NEAR TECHNO CITY,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('165', '165', 'MUGHAL CONSTRUCTION', 'MUGHAL CONSTRUCTION', 'PLOT # 114-A, COMMERCIAL AVENUE, PHASE-7 DHA', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('166', '166', 'Mujeeb Traders', 'Mujeeb Traders', 'Neelam Colony, D.H.A.,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('167', '167', 'MUNIR IMPEX', 'MUNIR IMPEX', 'FAISALABAD, BILTY FROM NEW SITARA GOODS', '12', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('168', '168', 'MURAD HARDWARE', 'MURAD HARDWARE', 'SHOP # 5, PLOT 20/C, PH-4, NEAR REHMAN MASJID, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('169', '169', 'MURTAZA SB', 'MURTAZA SB', 'KORANGI INDUSTRIAL AREA, NEAR TRAFFIC LICENSE OFFICE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('170', '170', 'MUSTAFA METAL MART', 'MUSTAFA METAL MART', '31, AL-HYDRI MEMORIAL MARKET, NORTH NAZIMABAD', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('171', '171', 'MUSTAQIM DYEING &amp; PRINTING IND. (PVT) LTD', 'MUSTAQIM DYEING &amp; PRINTING', 'D-14/A, BADA BOARD, SITE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('172', '172', 'NADEEM BUKHARI', 'NADEEM BUKHARI', 'KHYABAN-E-MUSLIM', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('173', '173', 'NASIR &amp; SONS', 'NASIR &amp; SONS', 'ALAMGIR ROAD, BAHADURABAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('174', '174', 'NATIONAL PAINT HOUSE', 'NATIONAL PAINT HOUSE', 'KHARADAR', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('175', '175', 'NEW JILLANI CEMENT', 'NEW JILLANI CEMENT', '10/729, LIAQATABAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('176', '176', 'NEW KHATTAK HARDWARE &amp; PAINT', 'NEW KHATTAK HARDWARE &amp; PAI', 'SHOP#102, TIPU SULTAN ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('177', '177', 'NIAZI HARDWARE', 'NIAZI HARDWARE', 'PLOT # F-6, BOAT BUILDING YARD, NEAR KALA PANI, FISHRI,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('178', '178', 'NOOR MAHAL', 'NOOR MAHAL', 'SHOP # 10, BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('179', '179', 'NOVOCHEM SPECIALITIES', 'NOVOCHEM SPECIALITIES', 'F-388, SITE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('180', '180', 'PARAGON CONSTRUCTION.', 'PARAGON CONSTRUCTION.', 'BAHRIA APPARTMENT-2, SUPER HIGHWAY, BAHRIA TOWN,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('181', '181', 'PARSA TOWER', 'PARSA TOWER', 'PARSA TOWER, SHAHRAH-E-FAISAL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('182', '182', 'POPULAR CEMENT WORK', 'POPULAR CEMENT WORK', 'SHOP # 5, JAMSHED ROAD # 3, NEAR YADGAR FISH,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('183', '183', 'Popular Marble', 'Popular Marble', '240-242, Badar Colony, Pak Colony,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('184', '184', 'Progressive Marble', 'Progressive Marble', 'Plot#10-11, Sector 26, K.I.A', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('185', '185', 'R &amp; H ENTERPRISES', 'R &amp; H ENTERPRISES', 'PARSA CITY, GARDEN, OPP. POLICE HEAD QUARTER,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('186', '186', 'R &amp; I ELECTRICAL APPLIANCES (PVT) LTD.', 'R &amp; I ELECTRICAL APPLIANCE', 'PARSA TOWER, SHAHRAH-E-FAISAL,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('187', '187', 'RAMZAN CEMENT DEPOT', 'RAMZAN CEMENT DEPOT', 'BOHRAPIR, NEAR IRSHAD ALI SLAB WORKS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('188', '188', 'RAWAL MASJID', 'RAWAL MASJID', 'BILTY FROM ABBAS &amp; CO TO MULTAN,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('189', '189', 'RESSICHEM GODOWN', 'RESSICHEM GODOWN', 'NEAR HILL PARK,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('190', '190', 'RESSICHEM INTERNATIONAL', 'RESSICHEM INTERNATIONAL', 'GOLIMAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('191', '191', 'SAIFEE HARDWARE STORE', 'SAIFEE HARDWARE STORE', '309, PROGRESSIVE PLAZA, BEUMOUNT ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('192', '192', 'SAIFEE INTERIOR WORKS', 'SAIFEE INTERIOR WORKS', 'SHOP # 5, 1-C, 27TH TAUHEED COMM. STREET, PHASE-5, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('193', '193', 'SAIFEE PAINT HOUSE', 'SAIFEE PAINT HOUSE', 'U.P. MORE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('194', '194', 'SAIFY MASJID', 'SAIFY MASJID', 'STREET-7,BADAR COMMERCIAL, PH-5, DHA, OPP. HAKIMI TRADERS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('195', '195', 'SALIM SHAMS SB', 'SALIM SHAMS SB', 'SAIFY BAGH, CHAKIWARA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('196', '196', 'SAMS HARDWARE', 'SAMS HARDWARE', 'DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('197', '197', 'SHABBIR SONS', 'SHABBIR SONS', 'SHOP # 2, PLOT # 8C, BUKHARI COMM., LANE-8, PHASE 6, DHA,', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('198', '198', 'SHAH HARDWARE', 'SHAH HARDWARE', 'SHOP # 224, OPP. KASB BANK, SADDAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('199', '199', 'SHOAIB ISMAIL SB', 'SHOAIB ISMAIL SB', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('200', '200', 'SOHAIL SANITARY STORE', 'SOHAIL SANITARY STORE', 'PLOT #30/1, STREET # 10, KH-E-HILAL, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('201', '201', 'T.A.GULAMALLAY &amp; CO.', 'T.A.GULAMALLAY &amp; CO.', 'PLOT # 1307/3M, SIDDIQABAD, F.B.AREA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('202', '202', 'TAHER &amp; SONS HARDWARE HOUSE', 'TAHER &amp; SONS HARDWARE HOUS', 'FIDRI CHAMBER, JEWANI STREET, OFF. AIWAN-E-TIJARAT RD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('203', '203', 'TAHERI HARDWARE STORES', 'TAHERI HARDWARE STORES', 'PLOT # A-979 SECTOR 11/B SHOP # 1 JAMALI TRUST', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('204', '204', 'TAHERI SONS &amp; HARDWARE HOUSE', 'TAHERI SONS &amp; HARDWARE HOU', 'SHOP # 6, LUCKY HOUSE, OPP. BOHRAPIR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('205', '205', 'TANVEER BANGLES', 'TANVEER BANGLES', 'SHOP # 1 JAMALI TRUST BUILDING 4 UP MOOR', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('206', '206', 'TANZO INTERNATIONAL (PAKISTAN)', 'TANZO INTERNATIONAL (PAKISTAN)', 'KORANGI # 2, ', '4', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('207', '207', 'TECHNO CRATE', 'TECHNO CRATE', 'PLOT # 566, Q BLOCK, JOHAR TOWN,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('208', '208', 'THE ARCHITECTS', 'THE ARCHITECTS', 'BAHRIA TOWN, SUPER HIGHWAY,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('209', '209', 'THE COMFORT', 'THE COMFORT', 'NEAR CAR DEAL, CLIFTON, 2 TALWAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('210', '210', 'THE CONSTRUCT', 'THE CONSTRUCT', 'SB-3, BLOCK-8, YASEENABAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('211', '211', 'TILE HOUSE', 'TILE HOUSE', 'BAHRIA ICON TOWER, NEAR ABDULLAH SHAH GHAZI TOMB, CLIFTON,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('212', '212', 'Tiles Centre', 'Tiles Centre', 'TARIQ ROAD, NEAR BOMBAY SWEETS,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('213', '213', 'TIMES RESIDENCY', 'TIMES RESIDENCY', 'Shop# GC-63, Main Gulbahar Road, Golimar No.1', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('214', '214', 'UNE ENTERPRISES', 'UNE ENTERPRISES', 'D-11, NORTH NAZIMABAD, NEAR BOARD OFFICE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('215', '215', 'UNION STEEL', 'UNION STEEL', 'BAHRIA HOSPITAL, BAHRIA TOWN,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('216', '216', 'UNITED SANITARY', 'UNITED SANITARY', 'PLOT # D-1-56, MANGOPIR ROAD, SITE,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('217', '217', 'United Tile Center', 'United Tile Center', 'B.S 16, BLOCK 14, SHOP NO.3, UROOJ SQUARE, F.B. AREA, KARACHI', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('218', '218', 'UNIVERSAL TRADING / RASHID TILE', 'UNIVERSAL TRADING / RASHID TIL', 'A-26, Farhan Paradise, Block-14, Gulistan-e-Johar', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('219', '219', 'VALI RANGOONWALA', 'VALI RANGOONWALA', 'NEAR UMER MASJID, OPP. H.M.SONS, GOLIMAAR,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('220', '220', 'VIRTRACO TILES', 'VIRTRACO TILES', '8/A, KDA SCHEME # 1, KARSAZ ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('221', '221', 'Walls &amp; Woods', 'Walls &amp; Woods', '15/139, SHOP # 3-4, FATIMA TOWER, BAHADURABAD, J. AFGHANI ROAD,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('222', '222', 'YOUSUF ALI TAYABJI MUNDRAWALA &amp; SONS', 'YOUSUF ALI TAYABJI MUNDRAWALA ', 'Building#28-C, Mezzanine Floor,Sunset Lane, DHA', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('223', '223', 'ZAFAR CEMENT', 'ZAFAR CEMENT', 'SHOP#2, RAEES BUILDING, BOHRAPR', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('224', '224', 'ZAHID ALI SHAH', 'ZAHID ALI SHAH', 'SHOP # 155/2, JOHAR ROAD, AMEER KHUSROO ROAD', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('225', '225', 'ZAHID TILE', 'ZAHID TILE', 'COMMERCIAL AVENUE, PHASE-4, KH-E-HILAL, DHA,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('226', '226', 'ZCL', 'ZCL', 'BESIDE SUBHANALLAH TILE, BLOCK-16, WATER PUMP,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('227', '227', 'ZEENAT HARDWARE', 'ZEENAT HARDWARE', '501, BANK BUSINESS CENTRE, SULTAN AHMED SHAH ROAD, K.E.C.H.S,', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('228', '228', 'ZOAIB ALI &amp; COMPANY', 'ZOAIB ALI &amp; COMPANY', 'PAK COLONY, NEAR BISMILLAH HOTEL,', '5', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('229', '229', 'ZULFIQAR HARDWARE', 'ZULFIQAR HARDWARE', 'FATEH CHOWK NEAR BOULEVARD MALL', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0', '', NULL, '0'),
('230', '230', 'hareem', 'hareem1', 'hareem3', '1', '1', 'DEF', '1', '', '35201', '1081', '35201', '1', 'hareem3', '0', '', NULL, '0');

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
('1', '10', '2', '1', '1', '2017-07-04', '2017-10-02', '001/2017', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '5', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('2', '10', '2', '1', '1', '2017-07-04', '2017-08-17', '002/2017', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('3', '10', '2', '1', '1', '2017-07-04', '2017-08-17', '003/2017', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('1', '13', '2', '1', '1', '2017-07-04', '2017-10-02', 'auto', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '5', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('2', '13', '2', '1', '1', '2017-07-04', '2017-08-17', 'auto', '1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('3', '13', '2', '1', '1', '2017-07-04', '2017-08-17', 'auto', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans_details` ###

INSERT INTO `0_debtor_trans_details` VALUES
('1', '1', '13', '1', 'Test Item', '0', '0', '0', '0', '0', '1400', '0'),
('2', '1', '10', '1', 'Test Item', '0', '0', '0', '0', '0', '0', '0'),
('3', '2', '13', '1', 'Test Item', '0', '0', '0', '0', '0', '1', '0'),
('4', '2', '10', '1', 'Test Item', '0', '0', '0', '0', '0', '0', '0'),
('5', '3', '13', '1', 'Test Item', '0', '0', '0', '0', '0', '100', '0'),
('6', '3', '10', '1', 'Test Item', '0', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('1', '3G CONSTRUCTION', '3G CONSTRUCTION', 'BAHRIA HEIGHTS, BAHRIA TOWN,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('2', 'A.G. GIGI (PVT) LTD', 'A.G. GIGI (PVT) LTD', 'NEAR BROOKS CHOWRANGI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('3', 'A.M HUSSAIN &amp; CO', 'A.M HUSSAIN &amp; CO', 'SHOP # 2 &amp; 3 ANUM ARCADE, SUNSET LANE-1 PHASE II EXT. DHA', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('4', 'AA QUALITY BUILDERS', 'AA QUALITY BUILDERS', 'C-6, BLOCK-7, Gulshan-e-Iqbal,', '', '1439182-1', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('5', 'AAA Associates', 'AAA Associates', 'D.H.A.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('6', 'AAA FACILITY MANAGEMENT LTD', 'AAA FACILITY MANAGEMENT LTD', 'C-19, KH-E-BUKHARI, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('7', 'ABASEEN CONSTRUCTION CO. PVT LTD', 'ABASEEN CONSTRUCTION CO. PVT L', 'Office No. 7, Afzal Apartments, Stadium Road, Karachi, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('8', 'ABDUL KAREEM', 'ABDUL KAREEM', 'GULSHAN', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('9', 'ABDUL QADIR', 'ABDUL QADIR', 'PLOT # 78, SABA AVENUE, NEAR IMAM BARGAH, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('10', 'ABDUL QADIR JAAFRANI', 'ABDUL QADIR JAAFRANI', 'PLOT # C-43-10, BLOCK-6, PECHS, NEAR FEROZABAD POLICE STATION', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('11', 'ABDULLAH TILES', 'ABDULLAH TILES', '26TH STREET, TAUHEED COMMERCIAL, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('12', 'RAMZAN TRADERS', 'RAMZAN TRADERS', 'AEROMOTIVE', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('13', 'AHMED ENGINEERING', 'AHMED ENGINEERING', 'CLARINAT CHEMICALS PAKISTAN,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('14', 'AHMED SANITARY', 'AHMED SANITARY', 'CYCLE MARKET, LIGHT HOUSE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('15', 'AL-ABBAS PAINT HOUSE', 'AL-ABBAS PAINT HOUSE', 'MAIN GIZRI, OPP. MUBARAK MASJID, KH-E-HAFEEZ,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('16', 'AL-BURHAN SANITARY', 'AL-BURHAN SANITARY', 'SHOP # 4, JAVERIA MANSION, AKBAR ALI LANE, SADDAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('17', 'AL-HAIDER PAINT HOUSE', 'AL-HAIDER PAINT HOUSE', 'SHOP # 15-16, SAKINA ARCADE, OPP. MUBARAK MASJID, GIZRI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('18', 'AL-HASNAIN HARDWARE', 'AL-HASNAIN HARDWARE', 'UPPER GIZRI RD, NEAR MUBARAK, MASJID,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('19', 'AL-HATEMI PAINT HOUSE', 'AL-HATEMI PAINT HOUSE', 'LOWER GIZRI, AVENUE ROAD, OPP. AL-KARIM PAINT, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('20', 'AL-KARIM PAINT HOUSE', 'AL-KARIM PAINT HOUSE', 'LOWER GIZRI, AVENUE ROAD, NEAR ASIF CORP, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('21', 'AL-MADINA TILES', 'AL-MADINA TILES', 'R-413, SECTOR 11C-1, ADAM TOWN NORTH KARACHI', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('22', 'AL-MOHAMMADI TILE', 'AL-MOHAMMADI TILE', 'SADDAR, NEAR SHABBIR BIRYANI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('23', 'AL-MOIZ HARDWARE', 'AL-MOIZ HARDWARE', 'MAIN GIZRI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('24', 'AL-SIRAJ FARMHOUSE', 'AL-SIRAJ FARMHOUSE', 'GHAREEBABAD, NEAR PSO PUMP, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('25', 'ALVI HARDWARE', 'ALVI HARDWARE', 'PLOT # 30-C, LANE-8, BUKHARI COMMERCIAL, AHMAD APPARTMENT,DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('26', 'AMCORP CONSTRUCTION', 'AMCORP CONSTRUCTION', 'M.U.E.T., JAMSHORO,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('27', 'AMIN DHOSA C/O THE ARCHITECT', 'AMIN DHOSA C/O THE ARCHITECT', 'PLOT # F-92, BATH ISLAND, NEAR AGA KHAN JAMAT KHANA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('28', 'AMIR TOOLS', 'AMIR TOOLS', 'SHOP # 2/3, SHUJA MARKET, KATCHI GALI # 3, MARRIOT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('29', 'AMMAR HARDWARE &amp; KITCHEN', 'AMMAR HARDWARE &amp; KITCHEN', 'F-18, GRACE CENTRE, GIZRI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('30', 'AMMAR HARDWARE STORE', 'AMMAR HARDWARE STORE', 'C-CH, REHMAT ALI RD, MANZOOR COLONY, GUJJAR CHOWK,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('31', 'AMMAR PAINTS &amp; HARDWARE', 'AMMAR PAINTS &amp; HARDWARE', 'HYDERABAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('32', 'ANSAR BROTHERS', 'ANSAR BROTHERS', 'ABDUL MAJID SIDHI STREET, MARRIOT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('33', 'ANWER OK', 'ANWER OK', '11-C, MOHAMMAD ALI SOCIETY, NEAR KAYBEES,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('34', 'A-ONE MARBLE', 'A-ONE MARBLE', 'K-22, JOHAR COLONY, MANGOPIR ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('35', 'A-ONE PAINT HARDWARE &amp; ELECTRIC STORE', 'A-ONE PAINT HARDWARE &amp; ELE', 'SHOP # 21, KHAWAJA MANZIL, BAHADURABAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('36', 'ARAISH', 'ARAISH', 'OFFICE # 210, TAYYAB ALI STREET, SADDAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('37', 'ARCH. AFTAB ABBASI', 'ARCH. AFTAB ABBASI', 'GAWADAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('38', 'ARCH. AHMED JUMANI', 'ARCH. AHMED JUMANI', '17A KDA SCHEME # 1 NEAR PEER PAGARA HOUSE', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('39', 'ARCH. AMBREEN', 'ARCH. AMBREEN', '912/9TH FLOOR, WEST POINT TOWER, PHASE-2, KORANGI ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('40', 'ARCH. FAROOQI', 'ARCH. FAROOQI', 'SHABBIRABAD, BLOCK A', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('41', 'ARCH. SHEHLA TASLEEM', 'ARCH. SHEHLA TASLEEM', 'PLOT # S22, STREET # 4, PH-VII, NEAR FATIMA MASJID, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('42', 'ARCH. ZAHRA', 'ARCH. ZAHRA', 'ISLAMABAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('43', 'ARIF HABIB RESIDENCY', 'ARIF HABIB RESIDENCY', 'A-116, BLOCK-A, NEW NAZIMABAD, MANGHOPIR ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('44', 'ARIF SB', 'ARIF SB', 'SHAHEED-E-MILLAT ROAD, TIGER HOUSE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('45', 'ARMY OFFICER HOUSING SOCIETY', 'ARMY OFFICER HOUSING SOCIETY', 'ARMY OFFICER SOCIETY, NEAR STADIUM,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('46', 'ASIF BANGLES', 'ASIF BANGLES', 'KORANGI NEAR CHINIOT HOSPITAL', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('47', 'ASIF CORPORATION', 'ASIF CORPORATION', 'plot # 78, jam sadiq ali road, near pumping station, lower gizri,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('48', 'ASIF DEVELOPERS', 'ASIF DEVELOPERS', 'BAHRIA TOWN IQBAL VILLA STREET 21', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('49', 'ASIF ISMAIL SB', 'ASIF ISMAIL SB', 'PLOT # 6-B, KH-E-HILAL, LANE-3, PHASE-6, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('50', 'AWAAN CERAMICS (TOTO)', 'AWAAN CERAMICS (TOTO)', '95/3, NEAR LIAQAT LIBRARY, STADIUM ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('51', 'AZHAR PAINT HOUSE', 'AZHAR PAINT HOUSE', '6 INSHAD CENTRE, ARAM BAGH FURNITURE MARKET', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('52', 'AZIZ PAINTS', 'AZIZ PAINTS', 'BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('53', 'BHAI JEE BHAI PAINTS', 'BHAI JEE BHAI PAINTS', 'BEHIND BOHRA MAZAAR, BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('54', 'BILAL CEMENT DEPOT', 'BILAL CEMENT DEPOT', 'GOLIMAR #1, NAWAB SADDIQUE ALI KHAN RD, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('55', 'BISMILLAH PAINT &amp; HARDWARE', 'BISMILLAH PAINT &amp; HARDWARE', 'SHOP#8/A, ABDULLAH APPARTMENT, BLOCK-16, GULISTAN-E-JOHAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('56', 'BMS GAWADER', 'BMS GAWADER', 'GAWADER', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('57', 'BOLAN ENTERPRISES', 'BOLAN ENTERPRISES', 'TARIQ ROAD, NEAR BOMBAY SWEETS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('58', 'BURHAN HARDWARE &amp; TOOLS CO.', 'BURHAN HARDWARE &amp; TOOLS CO', 'SHOP # 2, NIAZI MANZIL, MURAD KHAN ROAD, OPP. MARRIOT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('59', 'BURHANI CHEMICALS', 'BURHANI CHEMICALS', 'PXS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('60', 'BURHANI ENTERPRISES', 'BURHANI ENTERPRISES', 'JODIA BAZAAR, GHULAM SHAH STREET,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('61', 'BURHANI HARDWARE STORE', 'BURHANI HARDWARE STORE', 'PAK COLONY, BADAR MARKET, MANGOPIR ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('62', 'BURHANI SANITARY', 'BURHANI SANITARY', 'KH-E-BUKHARI/CHOTA BUKHARI, BACK TO J.B.SAEED, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('63', 'BURHANI TRADERS', 'BURHANI TRADERS', 'BOHRI BAZAR, SADDAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('64', 'BURJ-E-DEENAR', 'BURJ-E-DEENAR', 'C-104 DHORAJEE COLONY NEAR AGA KHAN HOSPITAL', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('65', 'CDC-TRUSTEE DOLMEN CITY REIT', 'CDC-TRUSTEE DOLMEN CITY REIT', '1ST FLOOR, EXECUTIVE TOWER,  DOLMEN CITY, HC-3, BLOCK-4, MARINE DRIVE, CLIFTON,', '', '4386954-8', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('66', 'CHOICE CENTRE', 'CHOICE CENTRE', 'SHOP # 181, GOLIMAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('67', 'CLIFTON COMFORT', 'CLIFTON COMFORT', 'PLOT # D-12, BLOCK-9, KEHKASHAN, CLIFTON,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('68', 'COAST GUARD', 'COAST GUARD', 'KORANGI 2 1/2', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('69', 'COLONEL MUSHTAQ C/O ARAISH', 'COLONEL MUSHTAQ C/O ARAISH', 'BILTY AT GHOTKI', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('70', 'COLOR BANK', 'COLOR BANK', 'SHOP # 8, NEAR MUBARAK MASJID, MAIN GIZRI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('71', 'COLOR CENTRE', 'COLOR CENTRE', 'SHOP # 9, CHAND BIBI CENTRE, BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('72', 'COLOR WORLD', 'COLOR WORLD', 'SHOP # 44, CHAND BIBI CENTRE, BOHRAPIR, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('73', 'Concrete Concept', 'Concrete Concept', 'C-21, BLOCK N, North Nazimabad,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('74', 'CONT. AHSAN ALI', 'CONT. AHSAN ALI', 'ADJACENT TO INTER WOOD OFFICE DALMIA ROAD ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('75', 'CONT. EHSAN', 'CONT. EHSAN', 'DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('76', 'CONT. NAEEM', 'CONT. NAEEM', 'HOUSE # 52/4, STREET 22H, MIRZA ADAM KHAN ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('77', 'CONT. RAFAT', 'CONT. RAFAT', 'BANGLOW # E-38, BLOCK-7, GULSHAN-E-IQBAL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('78', 'CONTRACTOR MEHMOOD.', 'CONTRACTOR MEHMOOD.', 'Korangi Industrial Area, Near Salim Industries', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('79', 'DEECON (PVT) LTD.', 'DEECON (PVT) LTD.', '7C, CG HOUSE, MEZANINE FLOOR, PHASE 2, DHA,', '99-99-9999-999-99', '2136301-3', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('80', 'DEENU CHACHA', 'DEENU CHACHA', 'PLOT # 240 SHABBIRABAD BLOCK B', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('81', 'DILKUSHA GOHAR RESIDENCIA', 'DILKUSHA GOHAR RESIDENCIA', 'BAHADURABAD, GOHAR COMFORTS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('82', 'DIN BROTHERS', 'DIN BROTHERS', 'D-50/C, SITE, WAREHOUSE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('83', 'DOLMEN MALL', 'DOLMEN MALL', 'DOLMEN MALL, TARIQ ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('84', 'DOLMEN REAL ESTATE MANAGEMENT (PVT) LTD', 'DOLMEN REAL ESTATE MANAGEMENT ', 'Dolmen City, Clifton,', '32-77-8761-204-81', '4386954-8', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('85', 'DR. COLOR PAINT HOUSE', 'DR. COLOR PAINT HOUSE', 'NEAR BIN HASHIM, SAFORA GOTH,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('86', 'EVERSHINE CONSTRUCTION', 'EVERSHINE CONSTRUCTION', 'SINDH ASSEMBLY NEW ART COUNCIL', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('87', 'FAISAL BILWANI', 'FAISAL BILWANI', 'PLOT # 183 GENERAL HOUSING SOCIETY ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('88', 'FAISAL MALIK', 'FAISAL MALIK', 'BAHRIA TOWN, HOME-4', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('89', 'FAISAL PAINTS', 'FAISAL PAINTS', 'GIZRI, NEAR COLOR BANK,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('90', 'FAIZ-E-HAKIMI', 'FAIZ-E-HAKIMI', '245, 35TH STREET, PHASE VIII, P.D.H.O.A, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('91', 'FAR EASTERN IMPEX (PVT) LTD.', 'FAR EASTERN IMPEX (PVT) LTD.', 'Plot No. D-49, Hassan Disalwa Town, Memon Ghoot, Malir,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('92', 'FARAZ CEMENT DEPOT', 'FARAZ CEMENT DEPOT', 'BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('93', 'FAROOQ HARDWARE', 'FAROOQ HARDWARE', 'ALLAMA IQBAL RD, OPP AL-QUBA MASJID, NEAR GUJJAR CHOWK, MANZOOR COLONY, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('94', 'FATIMA DEVELOPERS', 'FATIMA DEVELOPERS', 'DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('95', 'FATIMIYAH HOSPITAL', 'FATIMIYAH HOSPITAL', 'JM-168, SHAH ABDUL LATIF ROAD, NEAR NISHTAR PARK,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('96', 'FAZAIYA HOUSING SOCIETY', 'FAZAIYA HOUSING SOCIETY', 'NORTHERN BYPASS,  SCHEME-2,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('97', 'FEDERAL SANITARY', 'FEDERAL SANITARY', 'G, C-22, OPP. KAUSAR WATER SUPPLY, GULBAHAR-2,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('98', 'FEROZE 1888 MILLS LIMITED', 'FEROZE 1888 MILLS LIMITED', 'PLOT # C-3, SITE, MANGOPIR ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('99', 'FOUR STAR CORPORATION', 'FOUR STAR CORPORATION', 'UNI PLAZA I.I CHUNDRIGAR ROAD ROOM # 506-507 5TH FLOOR', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('100', 'G.N FUS', 'G.N FUS', 'MR 2/36-37, MARRIOT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('101', 'GHANDHARA NISSAN LTD', 'GHANDHARA NISSAN LTD', 'SITE, NEAR SHERSHAH CHOWRANGI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('102', 'Gogan Cement', 'Gogan Cement', '244/B, Lehra Square, Shop # 15, Opp. Karimi Mosque, Block-6, PECHS, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('103', 'Golden Tiles', 'Golden Tiles', 'Golimar No.1, Nawab Siddiq Ali Khan Road,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('104', 'GOMAL CEMENT', 'GOMAL CEMENT', 'OFFICE B-202 CHAPPAL GARDEN ABUL HASAN ISPAHANI ROAD', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('105', 'GRAVITY BUILDERS', 'GRAVITY BUILDERS', 'A-29, STREET # 8, CENTRAL AVENUE PHASE-2 DHA', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('106', 'H.H. TRADERS', 'H.H. TRADERS', 'GOLIMAAR, OPP. USAMA TILE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('107', 'H2O HOME TILES', 'H2O HOME TILES', 'GIZRI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('108', 'HAJI CHOHAN CEMENT', 'HAJI CHOHAN CEMENT', 'RC-4/372, SHOP#9, HAJI IQBAL HOTEL, BOHRAPIR.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('109', 'HAJI NAEEM', 'HAJI NAEEM', 'HYDERABAD, BILTY FROM A-ONE GOODS TRANSPORT', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('110', 'HAJI SALEEM', 'HAJI SALEEM', 'HYDERABAD, BILTY FROM A-ONE GOODS TRANSPORT', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('111', 'HAKIMI TRADERS', 'HAKIMI TRADERS', 'SHOP#2, PLOT 54/C, STREET-7,BADAR COMMERCIAL, PH-5, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('112', 'HATIMI HARDWARE &amp; SANITARY', 'HATIMI HARDWARE &amp; SANITARY', 'BABUJEE ARCADE, SHOP # 2, NEAR ASGHAR ALI SHAH STADIUM,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('113', 'HATIMI HARDWARE STORE', 'HATIMI HARDWARE STORE', 'SHOP # 4, WSA 20/16, WATER PUMP, F.B.AREA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('114', 'HAZARI ENTERPRISE', 'HAZARI ENTERPRISE', '1/14, MARRIOT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('115', 'Hazari Impex', 'Hazari Impex', 'Marriot Road,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('116', 'HI-TECH CONSTRUCTION', 'HI-TECH CONSTRUCTION', '163/2, 23RD STREET, OFF. KH-E-IQBAL, PHASE-8, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('117', 'HUSSAINI HARDWARE', 'HUSSAINI HARDWARE', 'MOHAMMAD SHAH STREET, JODIA BAZAR, OPP. Z.A TRADERS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('118', 'IK ASSOCIATE', 'IK ASSOCIATE', 'PLOT # 111/111, 26TH STREET, KH-E-MUHAFIZ, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('119', 'IMRAN NAVTAKIA', 'IMRAN NAVTAKIA', 'F-50, BLOCK-8, CLIFTON,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('120', 'IMRAN SB PEARL ENGINEERING', 'IMRAN SB PEARL ENGINEERING', 'S.M.B  FATIMA GIRLS COLLEGE GARDEN ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('121', 'IQBAL MOTIWALA', 'IQBAL MOTIWALA', 'DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('122', 'IQBAL SANITARY MART', 'IQBAL SANITARY MART', 'JOHAR STREET, NEAR CHOONA BHATTI, BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('123', 'IRSHAD ALI SLAB WORKS', 'IRSHAD ALI SLAB WORKS', 'HAJIALI BAGH BUILDING, AMBAJI VILLA RD, RANCHORLINE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('124', 'JAMA MASJID NOORANI', 'JAMA MASJID NOORANI', 'PAK COLONY,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('125', 'JAWED &amp; BROTHERS', 'JAWED &amp; BROTHERS', '351-36/C, OPP. KORANGI STADIUM, KORANGI # 5,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('126', 'K.M.A. TRADING EST.', 'K.M.A. TRADING EST.', 'AJA MAUJI STREET, BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('127', 'KAKA TILES', 'KAKA TILES', 'TIMBER MARKET, STREET 7, SIDDIQUE WAHAB ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('128', 'KAMRAN TILE', 'KAMRAN TILE', 'GALI # 11, TIMBER MARKET,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('129', 'KARACHI PAINT HOUSE', 'KARACHI PAINT HOUSE', '12-147, AMBAJI VILLA ROAD, BOHRA PIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('130', 'Karachi Trading', 'Karachi Trading', 'K-72, Golimar No.1', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('131', 'KHARADAR CEMENT DEPOT', 'KHARADAR CEMENT DEPOT', 'JAFFAR FIDR ROAD, NEAR KHARADAR PARK, KHARADAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('132', 'KHURASAAN HEIGHT', 'KHURASAAN HEIGHT', 'NUMAISH, OPP. MAZAR-E-QUAID,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('133', 'KHUWAJA RAFAY', 'KHUWAJA RAFAY', 'DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('134', 'KING BUILDERS', 'KING BUILDERS', 'PALM RESIDENCY, NEAR KAMRAN CHOWK, GULISTAN-E-JOHAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('135', 'KING COTTAGES', 'KING COTTAGES', 'SURVEY # 197, OPP. JAUHAR COMPLEX, BLOCK-7, JAUHAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('136', 'KOHINOOR PAINTS', 'KOHINOOR PAINTS', 'SHOP # 23, CHAND BIBI CENTRE, BOHRAPIR, OPP. MEHFOOZ SHERMAL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('137', 'LAKHANI PRESIDENCY', 'LAKHANI PRESIDENCY', 'SURVEY# 42 OLD DALMIA CEMENT FACTORY, DALMIA ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('138', 'LALA SARWAR CERA', 'LALA SARWAR CERA', '1/8, FIRDOUS COLONY, GULBAHAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('139', 'LASANI ENTERPRISES', 'LASANI ENTERPRISES', 'BARA BOARD, NEAR PSO PUMP,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('140', 'LIFE STYLE', 'LIFE STYLE', 'STADIUM ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('141', 'M.I.M. SIDDIQ &amp; CO.', 'M.I.M. SIDDIQ &amp; CO.', 'SHOP # 3, KHORI GARDEN, MEMON MASJID, KAMBHARTI STREET,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('142', 'M.M. ALAM', 'M.M. ALAM', 'KUTCHI GALI # 3, MARRIOT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('143', 'M.RAFIQUE.IQBAL', 'M.RAFIQUE.IQBAL', 'F-48, BLOCK 8 CLIFTON', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('144', 'M.S CONSTRUCTIONS', 'M.S CONSTRUCTIONS', 'PLOT # 166, 30TH STREET KHYABAN-E-IQBAL PH 8 DHA KHI', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('145', 'M.S. TOWER', 'M.S. TOWER', 'BAHADURABAD, NEAR UNITED BAKERY,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('146', 'MACHIYARA SPRING FIELD', 'MACHIYARA SPRING FIELD', 'PLOT # D-2, BLOCK-8, CLIFTON, NEAR AGHA&#039;S SUPER MARKET,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('147', 'MAIRAJ HOUSE', 'MAIRAJ HOUSE', '21ST STREET, KH-E-ROOMI, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('148', 'Makka Tiles', 'Makka Tiles', 'Plot#14, Area G-31, Korangi Crossing,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('149', 'MALIK BROTHERS', 'MALIK BROTHERS', '10-E, LANE-11, STREET # 21, KH-E-SEHAR, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('150', 'MALIK BROTHERS-BUKHARI', 'MALIK BROTHERS-BUKHARI', 'BUKHARI COMMERCIAL, PHASE-6, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('151', 'MANSOOR JOKHIO', 'MANSOOR JOKHIO', 'PLOT # 80, STREET # 15 KHAYABAN-E-SEHAR', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('152', 'MAQBOOL &amp; CO', 'MAQBOOL &amp; CO', 'NAWABSHAH', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('153', 'MAQSOOD AHMED', 'MAQSOOD AHMED', 'PLOT#50/II, KHAYABANE-MUJAHID, STREET#15, DHA', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('154', 'MARGALA MOTORS', 'MARGALA MOTORS', '72/4, SINDHI MUSLIM SOCIETY, NEAR SHAH LATIF SCHOOL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('155', 'MATRIX SYSTEM (PVT) LTD', 'MATRIX SYSTEM (PVT) LTD', '605, PROGRESSIVE SQUARE, SH-E-FAISAL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('156', 'MOEEN AHMED SB', 'MOEEN AHMED SB', 'H # 99, 27TH STREET, PHASE-6, KH-E-SEHAR, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('157', 'MOIZ TOOLS', 'MOIZ TOOLS', 'SHOP # 2, CHAND BIBI CENTRE, BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('158', 'MOSAIC COLLECTION', 'MOSAIC COLLECTION', 'UNIT # 203, SEA BREEZE PLAZA, SHAHRAH-E-FAISAL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('159', 'MR AFAQ', 'MR AFAQ', '8 CHOWK LEE MARKET GAWADAR QARWAN', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('160', 'MR HAJI SHAKOOR', 'MR HAJI SHAKOOR', 'GENERAL HOUSING SOCIETY GATE # 5 PLOT # 128 STREET II', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('161', 'MR JAVAID', 'MR JAVAID', 'SELF PICK,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('162', 'MR ZEESHAN', 'MR ZEESHAN', 'C-55 BLOCK 8 BAIT UL MUKKARAM MASJID GULSHAN-E-IQBAL', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('163', 'MR FAISAL.', 'MR FAISAL.', 'SUKKUR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('164', 'MRA BUILDERS', 'MRA BUILDERS', 'NEW CHALI, NEAR TECHNO CITY,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('165', 'MUGHAL CONSTRUCTION', 'MUGHAL CONSTRUCTION', 'PLOT # 114-A, COMMERCIAL AVENUE, PHASE-7 DHA', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('166', 'Mujeeb Traders', 'Mujeeb Traders', 'Neelam Colony, D.H.A.,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('167', 'MUNIR IMPEX', 'MUNIR IMPEX', 'FAISALABAD, BILTY FROM NEW SITARA GOODS', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('168', 'MURAD HARDWARE', 'MURAD HARDWARE', 'SHOP # 5, PLOT 20/C, PH-4, NEAR REHMAN MASJID, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('169', 'MURTAZA SB', 'MURTAZA SB', 'KORANGI INDUSTRIAL AREA, NEAR TRAFFIC LICENSE OFFICE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('170', 'MUSTAFA METAL MART', 'MUSTAFA METAL MART', '31, AL-HYDRI MEMORIAL MARKET, NORTH NAZIMABAD', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('171', 'MUSTAQIM DYEING &amp; PRINTING IND. (PVT) LTD', 'MUSTAQIM DYEING &amp; PRINTING', 'D-14/A, BADA BOARD, SITE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('172', 'NADEEM BUKHARI', 'NADEEM BUKHARI', 'KHYABAN-E-MUSLIM', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('173', 'NASIR &amp; SONS', 'NASIR &amp; SONS', 'ALAMGIR ROAD, BAHADURABAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('174', 'NATIONAL PAINT HOUSE', 'NATIONAL PAINT HOUSE', 'KHARADAR', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('175', 'NEW JILLANI CEMENT', 'NEW JILLANI CEMENT', '10/729, LIAQATABAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('176', 'NEW KHATTAK HARDWARE &amp; PAINT', 'NEW KHATTAK HARDWARE &amp; PAI', 'SHOP#102, TIPU SULTAN ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('177', 'NIAZI HARDWARE', 'NIAZI HARDWARE', 'PLOT # F-6, BOAT BUILDING YARD, NEAR KALA PANI, FISHRI,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('178', 'NOOR MAHAL', 'NOOR MAHAL', 'SHOP # 10, BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('179', 'NOVOCHEM SPECIALITIES', 'NOVOCHEM SPECIALITIES', 'F-388, SITE,', '17-50-3800-083-28', '3091636-4', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('180', 'PARAGON CONSTRUCTION.', 'PARAGON CONSTRUCTION.', 'BAHRIA APPARTMENT-2, SUPER HIGHWAY, BAHRIA TOWN,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('181', 'PARSA TOWER', 'PARSA TOWER', 'PARSA TOWER, SHAHRAH-E-FAISAL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('182', 'POPULAR CEMENT WORK', 'POPULAR CEMENT WORK', 'SHOP # 5, JAMSHED ROAD # 3, NEAR YADGAR FISH,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('183', 'Popular Marble', 'Popular Marble', '240-242, Badar Colony, Pak Colony,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('184', 'Progressive Marble', 'Progressive Marble', 'Plot#10-11, Sector 26, K.I.A', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('185', 'R &amp; H ENTERPRISES', 'R &amp; H ENTERPRISES', 'PARSA CITY, GARDEN, OPP. POLICE HEAD QUARTER,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('186', 'R &amp; I ELECTRICAL APPLIANCES (PVT) LTD.', 'R &amp; I ELECTRICAL APPLIANCE', 'PARSA TOWER, SHAHRAH-E-FAISAL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('187', 'RAMZAN CEMENT DEPOT', 'RAMZAN CEMENT DEPOT', 'BOHRAPIR, NEAR IRSHAD ALI SLAB WORKS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('188', 'RAWAL MASJID', 'RAWAL MASJID', 'NEAR HILL PARK,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('189', 'RESSICHEM GODOWN', 'RESSICHEM GODOWN', 'GOLIMAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('190', 'RESSICHEM INTERNATIONAL', 'RESSICHEM INTERNATIONAL', '309, PROGRESSIVE PLAZA, BEUMOUNT ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('191', 'SAIFEE HARDWARE STORE', 'SAIFEE HARDWARE STORE', 'SHOP # 5, 1-C, 27TH TAUHEED COMM. STREET, PHASE-5, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('192', 'SAIFEE INTERIOR WORKS', 'SAIFEE INTERIOR WORKS', 'U.P. MORE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('193', 'SAIFEE PAINT HOUSE', 'SAIFEE PAINT HOUSE', 'STREET-7,BADAR COMMERCIAL, PH-5, DHA, OPP. HAKIMI TRADERS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('194', 'SAIFY MASJID', 'SAIFY MASJID', 'SAIFY BAGH, CHAKIWARA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('195', 'SALIM SHAMS SB', 'SALIM SHAMS SB', 'DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('196', 'SAMS HARDWARE', 'SAMS HARDWARE', 'SHOP # 2, PLOT # 8C, BUKHARI COMM., LANE-8, PHASE 6, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('197', 'SHABBIR SONS', 'SHABBIR SONS', 'SHOP # 224, OPP. KASB BANK, SADDAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('198', 'SHAH HARDWARE', 'SHAH HARDWARE', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('199', 'SHOAIB ISMAIL SB', 'SHOAIB ISMAIL SB', 'PLOT #30/1, STREET # 10, KH-E-HILAL, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('200', 'SOHAIL SANITARY STORE', 'SOHAIL SANITARY STORE', 'PLOT # 1307/3M, SIDDIQABAD, F.B.AREA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('201', 'T.A.GULAMALLAY &amp; CO.', 'T.A.GULAMALLAY &amp; CO.', 'FIDRI CHAMBER, JEWANI STREET, OFF. AIWAN-E-TIJARAT RD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('202', 'TAHER &amp; SONS HARDWARE HOUSE', 'TAHER &amp; SONS HARDWARE HOUS', 'PLOT # A-979 SECTOR 11/B SHOP # 1 JAMALI TRUST', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('203', 'TAHERI HARDWARE STORES', 'TAHERI HARDWARE STORES', 'SHOP # 6, LUCKY HOUSE, OPP. BOHRAPIR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('204', 'TAHERI SONS &amp; HARDWARE HOUSE', 'TAHERI SONS &amp; HARDWARE HOU', 'SHOP # 1 JAMALI TRUST BUILDING 4 UP MOOR', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('205', 'TANVEER BANGLES', 'TANVEER BANGLES', 'KORANGI # 2, ', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('206', 'TANZO INTERNATIONAL (PAKISTAN)', 'TANZO INTERNATIONAL (PAKISTAN)', 'PLOT # 566, Q BLOCK, JOHAR TOWN,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('207', 'TECHNO CRATE', 'TECHNO CRATE', 'BAHRIA TOWN, SUPER HIGHWAY,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('208', 'THE ARCHITECTS', 'THE ARCHITECTS', 'NEAR CAR DEAL, CLIFTON, 2 TALWAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('209', 'THE COMFORT', 'THE COMFORT', 'SB-3, BLOCK-8, YASEENABAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('210', 'THE CONSTRUCT', 'THE CONSTRUCT', 'BAHRIA ICON TOWER, NEAR ABDULLAH SHAH GHAZI TOMB, CLIFTON,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('211', 'TILE HOUSE', 'TILE HOUSE', 'TARIQ ROAD, NEAR BOMBAY SWEETS,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('212', 'Tiles Centre', 'Tiles Centre', 'Shop# GC-63, Main Gulbahar Road, Golimar No.1', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('213', 'TIMES RESIDENCY', 'TIMES RESIDENCY', 'D-11, NORTH NAZIMABAD, NEAR BOARD OFFICE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('214', 'UNE ENTERPRISES', 'UNE ENTERPRISES', 'BAHRIA HOSPITAL, BAHRIA TOWN,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('215', 'UNION STEEL', 'UNION STEEL', 'PLOT # D-1-56, MANGOPIR ROAD, SITE,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('216', 'UNITED SANITARY', 'UNITED SANITARY', 'B.S 16, BLOCK 14, SHOP NO.3, UROOJ SQUARE, F.B. AREA, KARACHI', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('217', 'United Tile Center', 'United Tile Center', 'A-26, Farhan Paradise, Block-14, Gulistan-e-Johar', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('218', 'UNIVERSAL TRADING / RASHID TILE', 'UNIVERSAL TRADING / RASHID TIL', 'NEAR UMER MASJID, OPP. H.M.SONS, GOLIMAAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('219', 'VALI RANGOONWALA', 'VALI RANGOONWALA', '8/A, KDA SCHEME # 1, KARSAZ ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('220', 'VIRTRACO TILES', 'VIRTRACO TILES', '15/139, SHOP # 3-4, FATIMA TOWER, BAHADURABAD, J. AFGHANI ROAD,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('221', 'Walls &amp; Woods', 'Walls &amp; Woods', 'Building#28-C, Mezzanine Floor,Sunset Lane, DHA', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('222', 'YOUSUF ALI TAYABJI MUNDRAWALA &amp; SONS', 'YOUSUF ALI TAYABJI MUNDRAWALA ', 'SHOP#2, RAEES BUILDING, BOHRAPR', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('223', 'ZAFAR CEMENT', 'ZAFAR CEMENT', 'SHOP # 155/2, JOHAR ROAD, AMEER KHUSROO ROAD', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('224', 'ZAHID ALI SHAH', 'ZAHID ALI SHAH', 'COMMERCIAL AVENUE, PHASE-4, KH-E-HILAL, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('225', 'ZAHID TILE', 'ZAHID TILE', 'BESIDE SUBHANALLAH TILE, BLOCK-16, WATER PUMP,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('226', 'ZCL', 'ZCL', '501, BANK BUSINESS CENTRE, SULTAN AHMED SHAH ROAD, K.E.C.H.S,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('227', 'ZEENAT HARDWARE', 'ZEENAT HARDWARE', 'PAK COLONY, NEAR BISMILLAH HOTEL,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('228', 'ZOAIB ALI &amp; COMPANY', 'ZOAIB ALI &amp; COMPANY', 'FATEH CHOWK NEAR BOULEVARD MALL', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('229', 'ZULFIQAR HARDWARE', 'ZULFIQAR HARDWARE', 'SHOP # S-96, GROUND FLOOR, GRACE CENTRE, GIZRI, DHA,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0'),
('230', 'hareem', 'hareem1', 'hareem3', 'strn', 'ntn', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0');

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
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###

INSERT INTO `0_gl_trans` VALUES
('1', '1', '1', '2017-07-04', '5038', 'jhjhsjkdchjkdshjkhsjfkh', '100000', '0', '0', NULL, NULL),
('2', '1', '1', '2017-07-04', '5040', 'gffhghgjhkj', '12000', '0', '0', NULL, NULL),
('3', '1', '1', '2017-07-04', '10122', '', '-112000', '0', '0', NULL, NULL),
('4', '10', '1', '2017-07-04', '4011', '', '0', '0', '0', NULL, NULL),
('5', '10', '1', '2017-07-04', '1013', '', '0', '0', '0', '2', '1'),
('6', '10', '1', '2017-07-04', '2013', '', '0', '0', '0', NULL, NULL),
('7', '10', '2', '2017-07-04', '4011', '', '0', '0', '0', NULL, NULL),
('8', '10', '2', '2017-07-04', '1013', '', '0', '0', '0', '2', '1'),
('9', '10', '2', '2017-07-04', '2013', '', '0', '0', '0', NULL, NULL),
('10', '10', '3', '2017-07-04', '4011', '', '0', '0', '0', NULL, NULL),
('11', '10', '3', '2017-07-04', '1013', '', '0', '0', '0', '2', '1'),
('12', '10', '3', '2017-07-04', '2013', '', '0', '0', '0', NULL, NULL),
('13', '0', '17', '2017-07-04', '5015', '', '100', '0', '0', NULL, NULL),
('14', '0', '17', '2017-07-04', '5034', '', '-100', '0', '0', NULL, NULL),
('15', '1', '2', '2017-07-11', '35190', '', '1000', '0', '0', NULL, NULL),
('16', '1', '2', '2017-07-11', '102001', '', '-1000', '0', '0', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES
('1', '01FG', '01FG', 'RESSI TA 210', '1', '1', '0', '0'),
('2', '02FG', '02FG', 'RESSI TA 220', '1', '1', '0', '0'),
('3', '03FG', '03FG', 'RESSI TA 230', '1', '1', '0', '0'),
('4', '04FG', '04FG', 'RESSI TA 240', '1', '1', '0', '0'),
('5', '05FG', '05FG', 'RESSI TA 250', '1', '1', '0', '0'),
('6', '06FG', '06FG', 'RESSI TA 260', '1', '1', '0', '0'),
('7', '07FG', '07FG', 'RESSI TA 270', '1', '1', '0', '0'),
('8', '08FG', '08FG', 'RESSI TA 280', '1', '1', '0', '0'),
('9', '09FG', '09FG', 'RESSI TA 290', '1', '1', '0', '0'),
('10', '10FG', '10FG', 'RESSI TA 0001 B', '1', '1', '0', '0'),
('11', '11FG', '11FG', 'RESSI ETA', '1', '1', '0', '0'),
('12', '12FG', '12FG', 'RESSI TA 2K', '1', '1', '0', '0'),
('13', '13FG', '13FG', 'RESSI TA HPA', '1', '1', '0', '0'),
('14', '14FG', '14FG', 'RESSI TG 810', '2', '1', '0', '0'),
('15', '15FG', '15FG', 'RESSI TG 810 0001 (BRIGHT WHITE)', '2', '1', '0', '0'),
('16', '16FG', '16FG', 'RESSI TG 810 1110 (IVORY)', '2', '1', '0', '0'),
('17', '17FG', '17FG', 'RESSI TG 810 1211 (BEIGE)', '2', '1', '0', '0'),
('18', '18FG', '18FG', 'RESSI TG 810 1421 (DARK BEIGE)', '2', '1', '0', '0'),
('19', '19FG', '19FG', 'RESSI TG 810 1600 (YELLOW)', '2', '1', '0', '0'),
('20', '20FG', '20FG', 'RESSI TG 810 1950 (MAPLE WOOD)', '2', '1', '0', '0'),
('21', '21FG', '21FG', 'RESSI TG 810 2400 (LIGHT GREEN)', '2', '1', '0', '0'),
('22', '22FG', '22FG', 'RESSI TG 810 2770 (AQUA GREEN)', '2', '1', '0', '0'),
('23', '23FG', '23FG', 'RESSI TG 810 3100 (PINK)', '2', '1', '0', '0'),
('24', '24FG', '24FG', 'RESSI TG 810 3700 (TERRACOTTA)', '2', '1', '0', '0'),
('25', '25FG', '25FG', 'RESSI TG 810 4720 (BURGUNDY)', '2', '1', '0', '0'),
('26', '26FG', '26FG', 'RESSI TG 810 5110 (LIGHT GREY)', '2', '1', '0', '0'),
('27', '27FG', '27FG', 'RESSI TG 810 5210 1 (SKY BLUE)', '2', '1', '0', '0'),
('28', '28FG', '28FG', 'RESSI TG 810 5210 2 (MARBLE BEIGE)', '2', '1', '0', '0'),
('29', '29FG', '29FG', 'RESSI TG 810 5410 (Dark Blue)', '2', '1', '0', '0'),
('30', '30FG', '30FG', 'RESSI TG 810 5410 1 (AQUA BLUE)', '2', '1', '0', '0'),
('31', '31FG', '31FG', 'RESSI TG 810 5650 (PURPLE)', '2', '1', '0', '0'),
('32', '32FG', '32FG', 'RESSI TG 810 5960 (INDIGO BLUE)', '2', '1', '0', '0'),
('33', '33FG', '33FG', 'RESSI TG 810 6110 (OFF WHITE)', '2', '1', '0', '0'),
('34', '34FG', '34FG', 'RESSI TG 810 6400 (PEACH)', '2', '1', '0', '0'),
('35', '35FG', '35FG', 'RESSI TG 810 8111 (DARK IVORY)', '2', '1', '0', '0'),
('36', '36FG', '36FG', 'RESSI TG 810 9000 (GREY)', '2', '1', '0', '0'),
('37', '37FG', '37FG', 'RESSI TG 810 9111 (ASH WHITE)', '2', '1', '0', '0'),
('38', '38FG', '38FG', 'RESSI TG 810 9111 1 (DESERT TAN)', '2', '1', '0', '0'),
('39', '39FG', '39FG', 'RESSI TG 810 9200 (DARK GREY)', '2', '1', '0', '0'),
('40', '40FG', '40FG', 'RESSI TG 810 9321 (BROWN)', '2', '1', '0', '0'),
('41', '41FG', '41FG', 'RESSI TG 810 9642 (DARK BROWN)', '2', '1', '0', '0'),
('42', '42FG', '42FG', 'RESSI TG 810 9960 (BLACK)', '2', '1', '0', '0'),
('43', '43FG', '43FG', 'RESSI TG 820 ', '2', '1', '0', '0'),
('44', '44FG', '44FG', 'RESSI TG 2K', '2', '1', '0', '0'),
('45', '45FG', '45FG', 'RESSI TG BATH SEAL 2K ', '2', '1', '0', '0'),
('46', '46FG', '46FG', 'RESSI TG BATH SEAL 2K 810', '2', '1', '0', '0'),
('47', '47FG', '47FG', 'RESSI TG BATH SEAL 2K 810 0001 (BRIGHT WHITE)', '2', '1', '0', '0'),
('48', '48FG', '48FG', 'RESSI TG BATH SEAL 2K 810 1110 (IVORY)', '2', '1', '0', '0'),
('49', '49FG', '49FG', 'RESSI TG BATH SEAL 2K 810 1211 (BEIGE)', '2', '1', '0', '0'),
('50', '50FG', '50FG', 'RESSI TG BATH SEAL 2K 810 1421 (DARK BEIGE)', '2', '1', '0', '0'),
('51', '51FG', '51FG', 'RESSI TG BATH SEAL 2K 810 1600 (YELLOW)', '2', '1', '0', '0'),
('52', '52FG', '52FG', 'RESSI TG BATH SEAL 2K 810 1950 (MAPLE WOOD)', '2', '1', '0', '0'),
('53', '53FG', '53FG', 'RESSI TG BATH SEAL 2K 810 2400 (LIGHT GREEN)', '2', '1', '0', '0'),
('54', '54FG', '54FG', 'RESSI TG BATH SEAL 2K 810 2770 (AQUA GREEN)', '2', '1', '0', '0'),
('55', '55FG', '55FG', 'RESSI TG BATH SEAL 2K 810 3100 (PINK)', '2', '1', '0', '0'),
('56', '56FG', '56FG', 'RESSI TG BATH SEAL 2K 810 3700 (TERRACOTTA)', '2', '1', '0', '0'),
('57', '57FG', '57FG', 'RESSI TG BATH SEAL 2K 810 4720 (BURGUNDY)', '2', '1', '0', '0'),
('58', '58FG', '58FG', 'RESSI TG BATH SEAL 2K 810 5110 (LIGHT GREY)', '2', '1', '0', '0'),
('59', '59FG', '59FG', 'RESSI TG BATH SEAL 2K 810 5210 1 (SKY BLUE)', '2', '1', '0', '0'),
('60', '60FG', '60FG', 'RESSI TG BATH SEAL 2K 810 5210 2 (MARBLE BEIGE)', '2', '1', '0', '0'),
('61', '61FG', '61FG', 'RESSI TG BATH SEAL 2K 810 5410 (Dark Blue)', '2', '1', '0', '0'),
('62', '62FG', '62FG', 'RESSI TG BATH SEAL 2K 810 5410 1 (AQUA BLUE)', '2', '1', '0', '0'),
('63', '63FG', '63FG', 'RESSI TG BATH SEAL 2K 810 5650 (PURPLE)', '2', '1', '0', '0'),
('64', '64FG', '64FG', 'RESSI TG BATH SEAL 2K 810 5960 (INDIGO BLUE)', '2', '1', '0', '0'),
('65', '65FG', '65FG', 'RESSI TG BATH SEAL 2K 810 6110 (OFF WHITE)', '2', '1', '0', '0'),
('66', '66FG', '66FG', 'RESSI TG BATH SEAL 2K 810 6400 (PEACH)', '2', '1', '0', '0'),
('67', '67FG', '67FG', 'RESSI TG BATH SEAL 2K 810 8111 (DARK IVORY)', '2', '1', '0', '0'),
('68', '68FG', '68FG', 'RESSI TG BATH SEAL 2K 810 9000 (GREY)', '2', '1', '0', '0'),
('69', '69FG', '69FG', 'RESSI TG BATH SEAL 2K 810 9111 (ASH WHITE)', '2', '1', '0', '0'),
('70', '70FG', '70FG', 'RESSI TG BATH SEAL 2K 810 9111 1 (DESERT TAN)', '2', '1', '0', '0'),
('71', '71FG', '71FG', 'RESSI TG BATH SEAL 2K 810 9200 (DARK GREY)', '2', '1', '0', '0'),
('72', '72FG', '72FG', 'RESSI TG BATH SEAL 2K 810 9321 (BROWN)', '2', '1', '0', '0'),
('73', '73FG', '73FG', 'RESSI TG BATH SEAL 2K 810 9642 (DARK BROWN)', '2', '1', '0', '0'),
('74', '74FG', '74FG', 'RESSI TG BATH SEAL 2K 810 9960 (BLACK)', '2', '1', '0', '0'),
('75', '75FG', '75FG', 'RESSI TG CR HIGH GLOSS', '2', '1', '0', '0'),
('76', '76FG', '76FG', 'RESSI TG CR SEMI GLOSS', '2', '1', '0', '0'),
('77', '77FG', '77FG', 'RESSI ETG DP MATT', '2', '1', '0', '0'),
('78', '78FG', '78FG', 'RESSI TILE LATEX 205', '2', '1', '0', '0'),
('79', '79FG', '79FG', 'RESSI SBR 1358 ', '3', '1', '0', '0'),
('80', '80FG', '80FG', 'RESSI SBR 5813 ', '3', '1', '0', '0'),
('81', '81FG', '81FG', 'RESSI SBR 5840 ', '3', '1', '0', '0'),
('82', '82FG', '82FG', 'RESSI SBR 5850 ', '3', '1', '0', '0'),
('83', '83FG', '83FG', 'RESSI POLYMER B', '3', '1', '0', '0'),
('84', '84FG', '84FG', 'RPR 100', '4', '1', '0', '0'),
('85', '85FG', '85FG', 'RPR 110', '4', '1', '0', '0'),
('86', '86FG', '86FG', 'RPR 110 0001 ', '4', '1', '0', '0'),
('87', '87FG', '87FG', 'RPR 110 0001 B ', '4', '1', '0', '0'),
('88', '88FG', '88FG', 'RPR 110 0002 ', '4', '1', '0', '0'),
('89', '89FG', '89FG', 'RPR 110 0003 ', '4', '1', '0', '0'),
('90', '90FG', '90FG', 'RPR 110 1100 ', '4', '1', '0', '0'),
('91', '91FG', '91FG', 'RPR 110 1101 ', '4', '1', '0', '0'),
('92', '92FG', '92FG', 'RPR 110 1111 ', '4', '1', '0', '0'),
('93', '93FG', '93FG', 'RPR 110 1200 ', '4', '1', '0', '0'),
('94', '94FG', '94FG', 'RPR 110 1210 ', '4', '1', '0', '0'),
('95', '95FG', '95FG', 'RPR 110 1211 ', '4', '1', '0', '0'),
('96', '96FG', '96FG', 'RPR 110 1220 ', '4', '1', '0', '0'),
('97', '97FG', '97FG', 'RPR 110 1320', '4', '1', '0', '0'),
('98', '98FG', '98FG', 'RPR 110 2100 1', '4', '1', '0', '0'),
('99', '99FG', '99FG', 'RPR 110 5210 ', '4', '1', '0', '0'),
('100', '100FG', '100FG', 'RPR 110 5211 ', '4', '1', '0', '0'),
('101', '101FG', '101FG', 'RPR 110 5950 ', '4', '1', '0', '0'),
('102', '102FG', '102FG', 'RPR 110 7000 W ', '4', '1', '0', '0'),
('103', '103FG', '103FG', 'RPR 110 9110 W ', '4', '1', '0', '0'),
('104', '104FG', '104FG', 'RPR 110 9210 ', '4', '1', '0', '0'),
('105', '105FG', '105FG', 'RPR 110 9210 ', '4', '1', '0', '0'),
('106', '106FG', '106FG', 'RPR 110 9211', '4', '1', '0', '0'),
('107', '107FG', '107FG', 'RPR 110 9400', '4', '1', '0', '0'),
('108', '108FG', '108FG', 'RPR 110 9410', '4', '1', '0', '0'),
('109', '109FG', '109FG', 'RPR 110 9411 ', '4', '1', '0', '0'),
('110', '110FG', '110FG', 'RPR 120', '4', '1', '0', '0'),
('111', '111FG', '111FG', 'RPR 120 C', '4', '1', '0', '0'),
('112', '112FG', '112FG', 'RESSI SC 310', '4', '1', '0', '0'),
('113', '113FG', '113FG', 'RESSI SLS 610', '4', '1', '0', '0'),
('114', '114FG', '114FG', 'RESSI PFS 620', '4', '1', '0', '0'),
('115', '115FG', '115FG', 'RESSI BRC 7000', '4', '1', '0', '0'),
('116', '116FG', '116FG', 'ZEPOXY 100 F ', '5', '1', '0', '0'),
('117', '117FG', '117FG', 'ZEPOXY 100 H ', '5', '1', '0', '0'),
('118', '118FG', '118FG', 'ZEPOXY 100 Q ', '5', '1', '0', '0'),
('119', '119FG', '119FG', 'ZEPOXY 100 MINI', '5', '1', '0', '0'),
('120', '120FG', '120FG', 'ZEPOXY 150 F', '5', '1', '0', '0'),
('121', '121FG', '121FG', 'ZEPOXY 150 H', '5', '1', '0', '0'),
('122', '122FG', '122FG', 'ZEPOXY 200 F', '5', '1', '0', '0'),
('123', '123FG', '123FG', 'ZEPOXY 200 H', '5', '1', '0', '0'),
('124', '124FG', '124FG', 'ZEPOXY 200 Q', '5', '1', '0', '0'),
('125', '125FG', '125FG', 'ZEPOXY 200 MINI', '5', '1', '0', '0'),
('126', '126FG', '126FG', 'ZEPOXY 250 MINI', '5', '1', '0', '0'),
('127', '127FG', '127FG', 'ZEPOXY 300 F ', '5', '1', '0', '0'),
('128', '128FG', '128FG', 'ZEPOXY 300 Q ', '5', '1', '0', '0'),
('129', '129FG', '129FG', 'ZEPOXY 300 H', '5', '1', '0', '0'),
('130', '130FG', '130FG', 'ZEPOXY 300 MINI', '5', '1', '0', '0'),
('131', '131FG', '131FG', 'ZEPOXY 500 H', '5', '1', '0', '0'),
('132', '132FG', '132FG', 'ZEPOXY 500 MINI', '5', '1', '0', '0'),
('133', '133FG', '133FG', 'ZEPOXY 600 F', '5', '1', '0', '0'),
('134', '134FG', '134FG', 'ZEPOXY 600 H', '5', '1', '0', '0'),
('135', '135FG', '135FG', 'ZEPOXY 600 MINI', '5', '1', '0', '0'),
('136', '136FG', '136FG', 'ZEPOXY 700 F', '5', '1', '0', '0'),
('137', '137FG', '137FG', 'ZEPOXY 700 MINI', '5', '1', '0', '0'),
('138', '138FG', '138FG', 'ZEPOXY 800 MINI', '5', '1', '0', '0'),
('139', '139FG', '139FG', 'ZEPOXY QUICK H', '5', '1', '0', '0'),
('140', '140FG', '140FG', 'ZEPOXY QUICK MINI', '5', '1', '0', '0'),
('141', '141FG', '141FG', 'ZHITE GLUE FULL', '6', '1', '0', '0'),
('142', '142FG', '142FG', 'ZHITE GLUE HALF', '6', '1', '0', '0'),
('143', '143FG', '143FG', 'ZHITE GLUE QUARTER', '6', '1', '0', '0'),
('144', '144FG', '144FG', 'ZHITE GLUE FULL', '6', '1', '0', '0'),
('145', '145FG', '145FG', 'ZHITE GLUE HALF', '6', '1', '0', '0'),
('146', '146FG', '146FG', 'ZHITE GLUE QUARTER', '6', '1', '0', '0'),
('147', '147FG', '147FG', 'RESSI EPO CRACK FILL', '7', '1', '0', '0'),
('148', '148FG', '148FG', 'RESSI EPO PREMIER', '7', '1', '0', '0'),
('149', '149FG', '149FG', 'RESSI EPO TOUGH MIGHT', '7', '1', '0', '0'),
('150', '150FG', '150FG', 'RESSI EPO GLOSS MIGHT', '7', '1', '0', '0'),
('151', '151FG', '151FG', 'RESSI EPO ECO MIGHT', '7', '1', '0', '0'),
('152', '152FG', '152FG', 'RESSI INSUFIX 200', '8', '1', '0', '0'),
('153', '153FG', '153FG', 'RESSI FOAM CRETE', '8', '1', '0', '0'),
('154', '154FG', '154FG', 'RESSI HARDENER', '9', '1', '0', '0'),
('155', '155FG', '155FG', 'RESSI POWDER RELEASE', '9', '1', '0', '0'),
('156', '156FG', '156FG', 'RESSI CHROME SEAL', '9', '1', '0', '0'),
('157', '157FG', '157FG', 'RESSI LIQUID RELEASE', '9', '1', '0', '0'),
('158', '158FG', '158FG', 'RESSI CFM 910', '10', '1', '0', '0'),
('159', '159FG', '159FG', 'RESSI CFM 910 2K', '10', '1', '0', '0'),
('160', '160FG', '160FG', 'RESSI CFM 920', '10', '1', '0', '0'),
('161', '161FG', '161FG', 'RESSI CFM 920 2K', '10', '1', '0', '0'),
('162', '162FG', '162FG', 'RESSI CFM FLEXI 2K', '10', '1', '0', '0'),
('163', '163FG', '163FG', 'RESSI RM 410', '10', '1', '0', '0'),
('164', '164FG', '164FG', 'RESSI RM 410 2K', '10', '1', '0', '0'),
('165', '165FG', '165FG', 'RESSI PUTTY 10000', '10', '1', '0', '0'),
('166', '166FG', '166FG', 'RESSI PUTTY 11000 G', '10', '1', '0', '0'),
('167', '167FG', '167FG', 'RESSI COAT X 491', '10', '1', '0', '0'),
('168', '168FG', '168FG', 'RESSI COAT X 491 3.2', '10', '1', '0', '0'),
('169', '169FG', '169FG', 'SILPRIME 3K', '10', '1', '0', '0'),
('170', '170FG', '170FG', 'RESSI DAMP SEAL', '10', '1', '0', '0'),
('171', '171FG', '171FG', 'SILMIX', '10', '1', '0', '0'),
('172', '172FG', '172FG', 'RESSI HEAT GUARD 1000', '10', '1', '0', '0'),
('173', '173FG', '173FG', 'RESSI SP 099', '10', '1', '0', '0'),
('174', '174FG', '174FG', 'RESSI SP 044N', '10', '1', '0', '0'),
('175', '175FG', '175FG', 'RESSI SP 088', '10', '1', '0', '0'),
('176', '176FG', '176FG', 'SILBLOCK', '10', '1', '0', '0'),
('177', '177FG', '177FG', 'SILBLOCK AG', '10', '1', '0', '0'),
('178', '178FG', '178FG', 'RESSI LURRY 2020', '10', '1', '0', '0'),
('179', '01 DML', '01 DML', 'SILICA SAND', '12', '1', '0', '0'),
('180', '02 DML', '02 DML', 'RED SAND', '12', '1', '0', '0'),
('181', '03 DML', '03 DML', 'GREY CEMENT', '12', '1', '0', '0'),
('182', '04 DML', '04 DML', 'WHITE CEMENT', '12', '1', '0', '0'),
('183', '05 DML', '05 DML', 'WHITE DANAYDAR', '12', '1', '0', '0'),
('184', '06 DML', '06 DML', 'WHITE BAREK', '12', '1', '0', '0'),
('185', '07 DML', '07 DML', 'SUPER WHITE RAKWAL', '12', '1', '0', '0'),
('186', '09 DML', '09 DML', 'CALCIUM STERATE', '12', '1', '0', '0'),
('187', '10 DML', '10 DML', 'SILRES POWDER D', '12', '1', '0', '0'),
('188', '11 DML', '11 DML', 'SILRES POWDER S', '12', '1', '0', '0'),
('189', '12 DML', '12 DML', 'SODA ASH', '12', '1', '0', '0'),
('190', '13 DML', '13 DML', 'TATRIC ACID', '12', '1', '0', '0'),
('191', '14 DML', '14 DML', 'GECEDRAL BZ 111', '12', '1', '0', '0'),
('192', '15 DML', '15 DML', 'GECEDRAL L', '12', '1', '0', '0'),
('193', '16 DML', '16 DML', 'SUPERPAS N2028', '12', '1', '0', '0'),
('194', '17 DML', '17 DML', 'SUPERPAS N2098', '12', '1', '0', '0'),
('195', '18 DML', '18 DML', 'COMBIZELL LH20MR', '12', '1', '0', '0'),
('196', '19 DML', '19 DML', 'TITANIUM', '12', '1', '0', '0'),
('197', '20 DML', '20 DML', 'MULAISES', '12', '1', '0', '0'),
('198', '21 DML', '21 DML', 'POLYNAPTHELENE SULPHONIC ACID', '12', '1', '0', '0'),
('199', '22 DML', '22 DML', 'SODIUM LIGNOSULPHATE', '12', '1', '0', '0'),
('200', '23 DML', '23 DML', 'SILICA FLOUR', '12', '1', '0', '0'),
('201', '24 DML', '24 DML', 'MELLAPLAST', '12', '1', '0', '0'),
('202', '25 DML', '25 DML', 'SUPERCEL 250', '12', '1', '0', '0'),
('203', '26 DML', '26 DML', 'SILIPON RN 6031', '12', '1', '0', '0'),
('204', '27 DML', '27 DML', 'MILOCELL', '12', '1', '0', '0'),
('205', '28 DML', '28 DML', 'MELAMINE', '12', '1', '0', '0'),
('206', '29 DML', '29 DML', 'HIGH ALUMINIA', '12', '1', '0', '0'),
('207', '30 DML', '30 DML', 'BERMODOL AEA 8200', '12', '1', '0', '0'),
('208', '31 DML', '31 DML', 'MANGANESE CHLORIDE', '12', '1', '0', '0'),
('209', '32 DML', '32 DML', 'OPTIBENT MF', '12', '1', '0', '0'),
('210', '33 DML', '33 DML', 'OPTIBENT 602', '12', '1', '0', '0'),
('211', '34 DML', '34 DML', 'IRON OXIDE ORANGE S960', '12', '1', '0', '0'),
('212', '35 DML', '35 DML', 'IRON OXIDE BROWN S660', '12', '1', '0', '0'),
('213', '36 DML', '36 DML', 'IRON OXIDE BLUE U08', '12', '1', '0', '0'),
('214', '37 DML', '37 DML', 'IRON OXIDE GREEN S5605', '12', '1', '0', '0'),
('215', '38 DML', '38 DML', 'IRON OXIDE RED S-110', '12', '1', '0', '0'),
('216', '39 DML', '39 DML', 'IRON OXIDE RED S-120', '12', '1', '0', '0'),
('217', '40 DML', '40 DML', 'IRON OXIDE RED S-140', '12', '1', '0', '0'),
('218', '41 DML', '41 DML', 'IRON OXIDE RED S-190', '12', '1', '0', '0'),
('219', '42 DML', '42 DML', 'IRON OXIDE BLACK 4330-3', '12', '1', '0', '0'),
('220', '43 DML', '43 DML', 'IRON OXIDE YELLOW S920', '12', '1', '0', '0'),
('221', '44 DML', '44 DML', 'IRON OXIDE BROWN 4686', '12', '1', '0', '0'),
('222', '45 DML', '45 DML', 'CALCIUM CARBONATE 100-200 MESH AMIN MARBLE', '12', '1', '0', '0'),
('223', '46 DML', '46 DML', 'CALCIUM CARBONATE 400 STD PAINT', '12', '1', '0', '0'),
('224', '47 DML', '47 DML', 'HYDRATED LIME', '12', '1', '0', '0'),
('225', '48 DML', '48 DML', 'MARBLE POWDER', '12', '1', '0', '0'),
('226', '49 LMI', '49 LMI', 'RESIN YD-128', '13', '1', '0', '0'),
('227', '50 LML', '50 LML', 'RESIN YD-553', '13', '1', '0', '0'),
('228', '51 LML', '51 LML', 'RESIN BYD-7201', '13', '1', '0', '0'),
('229', '52 LML', '52 LML', 'R 2020', '13', '1', '0', '0'),
('230', '53 LML', '53 LML', 'SILRES BS 4004', '13', '1', '0', '0'),
('231', '54 LML', '54 LML', 'XYLENE SOLVENT', '13', '1', '0', '0'),
('232', '55 LML', '55 LML', 'LINDRON 31', '13', '1', '0', '0'),
('233', '56 LML', '56 LML', 'LINDRON 34', '13', '1', '0', '0'),
('234', '57 LML', '57 LML', 'KR 40', '13', '1', '0', '0'),
('235', '58 LML', '58 LML', 'FOAM CONCRETE', '13', '1', '0', '0'),
('236', '59 LML', '59 LML', 'HARDENER TH 7301', '13', '1', '0', '0'),
('237', '60 LML', '60 LML', 'HARDENER TH 7201', '13', '1', '0', '0'),
('238', '61 LML', '61 LML', 'HARDENER TH 4504', '13', '1', '0', '0'),
('239', '62 LML', '62 LML', 'HARDENER TH 3702', '13', '1', '0', '0'),
('240', '63 LML', '63 LML', 'HARDENER TH 7167', '13', '1', '0', '0'),
('241', '64 LML', '64 LML', 'HARDENER TH 7269', '13', '1', '0', '0'),
('242', '65 LML', '65 LML', 'HARDENER 140', '13', '1', '0', '0'),
('243', '66 LML', '66 LML', 'EMULTEX-1602', '13', '1', '0', '0'),
('244', '67 LML', '67 LML', 'PRIMAL CS 4000', '13', '1', '0', '0'),
('245', '68 LML', '68 LML', 'REVACRYL 2091', '13', '1', '0', '0'),
('246', '69 LML', '69 LML', 'REVACRYL 3020', '13', '1', '0', '0'),
('247', '70 LML', '70 LML', 'REVACRYL 478', '13', '1', '0', '0'),
('248', '71 LML', '71 LML', 'SBR', '13', '1', '0', '0'),
('249', '72 LML', '72 LML', 'IMPREGNATING AGENT SK', '13', '1', '0', '0'),
('250', '73 LML', '73 LML', 'BIOCIDE', '13', '1', '0', '0'),
('251', '74 PML', '74 PML', 'PLASTIC BAG TA 210', '14', '1', '0', '0'),
('252', '75 PML', '75 PML', 'PLASTIC BAG TA 220', '14', '1', '0', '0'),
('253', '76 PML', '76 PML', 'PLASTIC BAG TA 230', '14', '1', '0', '0'),
('254', '77 PML', '77 PML', 'PLASTIC LDPE 1 KG (TG 810)', '14', '1', '0', '0'),
('255', '78 PML', '78 PML', 'PLASTIC LDPE 2 KG', '14', '1', '0', '0'),
('256', '79 PML', '79 PML', 'PAPER BAG 50 KG VALVE RPR 110', '14', '1', '0', '0'),
('257', '80 PML', '80 PML', 'CORRUGATED CARTON FOR 1 KG POUCH', '14', '1', '0', '0'),
('258', '81 PML', '81 PML', 'CORRUGATED CARTON FOR UNIVERSAL', '14', '1', '0', '0'),
('259', '82 PML', '82 PML', 'PAPER BOX X 491', '14', '1', '0', '0'),
('260', '83 PML', '83 PML', 'CORRUGATED CARTON FOR ZEPOXY', '14', '1', '0', '0'),
('261', '84 PML', '84 PML', 'PAPER BOX BATH SEAL 2K', '14', '1', '0', '0'),
('262', '85 PML', '85 PML', 'PLASTIC BAG TG 820 1KG', '14', '1', '0', '0'),
('263', '86 PML', '86 PML', 'PAPER BOX ETG DP MATT', '14', '1', '0', '0'),
('264', '87 PML', '87 PML', 'PAPER BOX ETG 2K', '14', '1', '0', '0'),
('265', '88 PML', '88 PML', 'PLASTIC BAG BATH SEAL 2K', '14', '1', '0', '0'),
('266', '89 PML', '89 PML', 'PLASTIC BAG ETG DP MATT', '14', '1', '0', '0'),
('267', '90 PML', '90 PML', 'PLASTIC BAG TG 2K', '14', '1', '0', '0'),
('268', '91 PML', '91 PML', 'GLUE BOTTLE SMALL', '14', '1', '0', '0'),
('269', '92 PML', '92 PML', 'GLUE BOTTLE MEDIUM', '14', '1', '0', '0'),
('270', '93 PML', '93 PML', 'GLUE BOTTLE LARGE', '14', '1', '0', '0'),
('271', '94 PML', '94 PML', 'CAP GLUE BOTTLE RED', '14', '1', '0', '0'),
('272', '95 PML', '95 PML', 'CAP GLUE BOTTLE BLUE', '14', '1', '0', '0'),
('273', '96 PML', '96 PML', 'PET BOTTLE WITH CAP (FLINT)', '14', '1', '0', '0'),
('274', '97 PML', '97 PML', 'PET BOTTLE WITH CAP (SQUARE)', '14', '1', '0', '0');

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
('each', 'Each', '0', '0'),
('KT', 'Kits', '0', '0');

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
('0', '17', '2017-07-04', '017/2017', '', '2017-07-04', '2017-07-04', 'PKR', '100', '1');

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
('DEF', '01 DML', '0'),
('DEF', '01FG', '0'),
('DEF', '02 DML', '0'),
('DEF', '02FG', '0'),
('DEF', '03 DML', '0'),
('DEF', '03FG', '0'),
('DEF', '04 DML', '0'),
('DEF', '04FG', '0'),
('DEF', '05 DML', '0'),
('DEF', '05FG', '0'),
('DEF', '06 DML', '0'),
('DEF', '06FG', '0'),
('DEF', '07 DML', '0'),
('DEF', '07FG', '0'),
('DEF', '08FG', '0'),
('DEF', '09 DML', '0'),
('DEF', '09FG', '0'),
('DEF', '10 DML', '0'),
('DEF', '100FG', '0'),
('DEF', '101FG', '0'),
('DEF', '102FG', '0'),
('DEF', '103FG', '0'),
('DEF', '104FG', '0'),
('DEF', '105FG', '0'),
('DEF', '106FG', '0'),
('DEF', '107FG', '0'),
('DEF', '108FG', '0'),
('DEF', '109FG', '0'),
('DEF', '10FG', '0'),
('DEF', '11 DML', '0'),
('DEF', '110FG', '0'),
('DEF', '111FG', '0'),
('DEF', '112FG', '0'),
('DEF', '113FG', '0'),
('DEF', '114FG', '0'),
('DEF', '115FG', '0'),
('DEF', '116FG', '0'),
('DEF', '117FG', '0'),
('DEF', '118FG', '0'),
('DEF', '119FG', '0'),
('DEF', '11FG', '0'),
('DEF', '12 DML', '0'),
('DEF', '120FG', '0'),
('DEF', '121FG', '0'),
('DEF', '122FG', '0'),
('DEF', '123FG', '0'),
('DEF', '124FG', '0'),
('DEF', '125FG', '0'),
('DEF', '126FG', '0'),
('DEF', '127FG', '0'),
('DEF', '128FG', '0'),
('DEF', '129FG', '0'),
('DEF', '12FG', '0'),
('DEF', '13 DML', '0'),
('DEF', '130FG', '0'),
('DEF', '131FG', '0'),
('DEF', '132FG', '0'),
('DEF', '133FG', '0'),
('DEF', '134FG', '0'),
('DEF', '135FG', '0'),
('DEF', '136FG', '0'),
('DEF', '137FG', '0'),
('DEF', '138FG', '0'),
('DEF', '139FG', '0'),
('DEF', '13FG', '0'),
('DEF', '14 DML', '0'),
('DEF', '140FG', '0'),
('DEF', '141FG', '0'),
('DEF', '142FG', '0'),
('DEF', '143FG', '0'),
('DEF', '144FG', '0'),
('DEF', '145FG', '0'),
('DEF', '146FG', '0'),
('DEF', '147FG', '0'),
('DEF', '148FG', '0'),
('DEF', '149FG', '0'),
('DEF', '14FG', '0'),
('DEF', '15 DML', '0'),
('DEF', '150FG', '0'),
('DEF', '151FG', '0'),
('DEF', '152FG', '0'),
('DEF', '153FG', '0'),
('DEF', '154FG', '0'),
('DEF', '155FG', '0'),
('DEF', '156FG', '0'),
('DEF', '157FG', '0'),
('DEF', '158FG', '0'),
('DEF', '159FG', '0'),
('DEF', '15FG', '0'),
('DEF', '16 DML', '0'),
('DEF', '160FG', '0'),
('DEF', '161FG', '0'),
('DEF', '162FG', '0'),
('DEF', '163FG', '0'),
('DEF', '164FG', '0'),
('DEF', '165FG', '0'),
('DEF', '166FG', '0'),
('DEF', '167FG', '0'),
('DEF', '168FG', '0'),
('DEF', '169FG', '0'),
('DEF', '16FG', '0'),
('DEF', '17 DML', '0'),
('DEF', '170FG', '0'),
('DEF', '171FG', '0'),
('DEF', '172FG', '0'),
('DEF', '173FG', '0'),
('DEF', '174FG', '0'),
('DEF', '175FG', '0'),
('DEF', '176FG', '0'),
('DEF', '177FG', '0'),
('DEF', '178FG', '0'),
('DEF', '17FG', '0'),
('DEF', '18 DML', '0'),
('DEF', '18FG', '0'),
('DEF', '19 DML', '0'),
('DEF', '19FG', '0'),
('DEF', '20 DML', '0'),
('DEF', '20FG', '0'),
('DEF', '21 DML', '0'),
('DEF', '21FG', '0'),
('DEF', '22 DML', '0'),
('DEF', '22FG', '0'),
('DEF', '23 DML', '0'),
('DEF', '23FG', '0'),
('DEF', '24 DML', '0'),
('DEF', '24FG', '0'),
('DEF', '25 DML', '0'),
('DEF', '25FG', '0'),
('DEF', '26 DML', '0'),
('DEF', '26FG', '0'),
('DEF', '27 DML', '0'),
('DEF', '27FG', '0'),
('DEF', '28 DML', '0'),
('DEF', '28FG', '0'),
('DEF', '29 DML', '0'),
('DEF', '29FG', '0'),
('DEF', '30 DML', '0'),
('DEF', '30FG', '0'),
('DEF', '31 DML', '0'),
('DEF', '31FG', '0'),
('DEF', '32 DML', '0'),
('DEF', '32FG', '0'),
('DEF', '33 DML', '0'),
('DEF', '33FG', '0'),
('DEF', '34 DML', '0'),
('DEF', '34FG', '0'),
('DEF', '35 DML', '0'),
('DEF', '35FG', '0'),
('DEF', '36 DML', '0'),
('DEF', '36FG', '0'),
('DEF', '37 DML', '0'),
('DEF', '37FG', '0'),
('DEF', '38 DML', '0'),
('DEF', '38FG', '0'),
('DEF', '39 DML', '0'),
('DEF', '39FG', '0'),
('DEF', '40 DML', '0'),
('DEF', '40FG', '0'),
('DEF', '41 DML', '0'),
('DEF', '41FG', '0'),
('DEF', '42 DML', '0'),
('DEF', '42FG', '0'),
('DEF', '43 DML', '0'),
('DEF', '43FG', '0'),
('DEF', '44 DML', '0'),
('DEF', '44FG', '0'),
('DEF', '45 DML', '0'),
('DEF', '45FG', '0'),
('DEF', '46 DML', '0'),
('DEF', '46FG', '0'),
('DEF', '47 DML', '0'),
('DEF', '47FG', '0'),
('DEF', '48 DML', '0'),
('DEF', '48FG', '0'),
('DEF', '49 LMI', '0'),
('DEF', '49FG', '0'),
('DEF', '50 LML', '0'),
('DEF', '50FG', '0'),
('DEF', '51 LML', '0'),
('DEF', '51FG', '0'),
('DEF', '52 LML', '0'),
('DEF', '52FG', '0'),
('DEF', '53 LML', '0'),
('DEF', '53FG', '0'),
('DEF', '54 LML', '0'),
('DEF', '54FG', '0'),
('DEF', '55 LML', '0'),
('DEF', '55FG', '0'),
('DEF', '56 LML', '0'),
('DEF', '56FG', '0'),
('DEF', '57 LML', '0'),
('DEF', '57FG', '0'),
('DEF', '58 LML', '0'),
('DEF', '58FG', '0'),
('DEF', '59 LML', '0'),
('DEF', '59FG', '0'),
('DEF', '60 LML', '0'),
('DEF', '60FG', '0'),
('DEF', '61 LML', '0'),
('DEF', '61FG', '0'),
('DEF', '62 LML', '0'),
('DEF', '62FG', '0'),
('DEF', '63 LML', '0'),
('DEF', '63FG', '0'),
('DEF', '64 LML', '0'),
('DEF', '64FG', '0'),
('DEF', '65 LML', '0'),
('DEF', '65FG', '0'),
('DEF', '66 LML', '0'),
('DEF', '66FG', '0'),
('DEF', '67 LML', '0'),
('DEF', '67FG', '0'),
('DEF', '68 LML', '0'),
('DEF', '68FG', '0'),
('DEF', '69 LML', '0'),
('DEF', '69FG', '0'),
('DEF', '70 LML', '0'),
('DEF', '70FG', '0'),
('DEF', '71 LML', '0'),
('DEF', '71FG', '0'),
('DEF', '72 LML', '0'),
('DEF', '72FG', '0'),
('DEF', '73 LML', '0'),
('DEF', '73FG', '0'),
('DEF', '74 PML', '0'),
('DEF', '74FG', '0'),
('DEF', '75 PML', '0'),
('DEF', '75FG', '0'),
('DEF', '76 PML', '0'),
('DEF', '76FG', '0'),
('DEF', '77 PML', '0'),
('DEF', '77FG', '0'),
('DEF', '78 PML', '0'),
('DEF', '78FG', '0'),
('DEF', '79 PML', '0'),
('DEF', '79FG', '0'),
('DEF', '80 PML', '0'),
('DEF', '80FG', '0'),
('DEF', '81 PML', '0'),
('DEF', '81FG', '0'),
('DEF', '82 PML', '0'),
('DEF', '82FG', '0'),
('DEF', '83 PML', '0'),
('DEF', '83FG', '0'),
('DEF', '84 PML', '0'),
('DEF', '84FG', '0'),
('DEF', '85 PML', '0'),
('DEF', '85FG', '0'),
('DEF', '86 PML', '0'),
('DEF', '86FG', '0'),
('DEF', '87 PML', '0'),
('DEF', '87FG', '0'),
('DEF', '88 PML', '0'),
('DEF', '88FG', '0'),
('DEF', '89 PML', '0'),
('DEF', '89FG', '0'),
('DEF', '90 PML', '0'),
('DEF', '90FG', '0'),
('DEF', '91 PML', '0'),
('DEF', '91FG', '0'),
('DEF', '92 PML', '0'),
('DEF', '92FG', '0'),
('DEF', '93 PML', '0'),
('DEF', '93FG', '0'),
('DEF', '94 PML', '0'),
('DEF', '94FG', '0'),
('DEF', '95 PML', '0'),
('DEF', '95FG', '0'),
('DEF', '96 PML', '0'),
('DEF', '96FG', '0'),
('DEF', '97 PML', '0'),
('DEF', '97FG', '0'),
('DEF', '98FG', '0'),
('DEF', '99FG', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_payment_terms` ###

INSERT INTO `0_payment_terms` VALUES
('1', 'Due 15th Of the Following Month', '0', '17', '0'),
('2', 'Due By End Of The Following Month', '0', '30', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('4', '1002', '2', 'PKR', '200');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_order_details` ###

INSERT INTO `0_purch_order_details` VALUES
('1', '1', '1', 'Test Item', '2017-07-14', '0', '150', '0', '0', '200', '0'),
('2', '2', '165FG', 'RESSI PUTTY 10000', '2017-07-20', '0', '0', '0', '0', '1', '0');

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
  PRIMARY KEY (`order_no`),
  KEY `ord_date` (`ord_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_orders` ###

INSERT INTO `0_purch_orders` VALUES
('1', '2', NULL, '2017-06-30', '001/2017', '001/2017', 'DEF', 'N/A', '30000', '0', '0', '1', '', '0'),
('2', '60', NULL, '2017-07-10', '002/2017', NULL, 'DEF', 'N/A', '0', '0', '0', '1', '', '1');

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
('1', '0', '', '{001}/{YYYY}', '', '1', '0'),
('2', '1', '', '{001}/{YYYY}', '', '1', '0'),
('3', '2', '', '{001}/{YYYY}', '', '1', '0'),
('4', '4', '', '{001}/{YYYY}', '', '1', '0'),
('5', '10', '', '{001}/{YYYY}', '', '1', '0'),
('6', '11', '', '{001}/{YYYY}', '', '1', '0'),
('7', '12', '', '{001}/{YYYY}', '', '1', '0'),
('8', '13', '', '{001}/{YYYY}', '', '1', '0'),
('9', '16', '', '{001}/{YYYY}', '', '1', '0'),
('10', '17', '', '{001}/{YYYY}', '', '1', '0'),
('11', '18', '', '{001}/{YYYY}', '', '1', '0'),
('12', '20', '', '{001}/{YYYY}', '', '1', '0'),
('13', '21', '', '{001}/{YYYY}', '', '1', '0'),
('14', '22', '', '{001}/{YYYY}', '', '1', '0'),
('15', '25', '', '{001}/{YYYY}', '', '1', '0'),
('16', '26', '', '{001}/{YYYY}', '', '1', '0'),
('17', '28', '', '{001}/{YYYY}', '', '1', '0'),
('18', '29', '', '{001}/{YYYY}', '', '1', '0'),
('19', '30', '', '{001}/{YYYY}', '', '1', '0'),
('20', '32', '', '{001}/{YYYY}', '', '1', '0'),
('21', '35', '', '{001}/{YYYY}', '', '1', '0'),
('22', '40', '', '{001}/{YYYY}', '', '1', '0'),
('23', '41', '', '{001}/{YYYY}', '', '1', '0'),
('24', '42', '', '{001}/{YYYY}', '', '1', '0');

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
('17', '0', '017/2017'),
('1', '1', '001/2017'),
('2', '1', '002/2017'),
('1', '10', '001/2017'),
('2', '10', '002/2017'),
('3', '10', '003/2017'),
('1', '17', '001/2017'),
('1', '18', '001/2017'),
('2', '18', '002/2017'),
('1', '30', '001/2017'),
('4', '30', '002/2017'),
('5', '30', '003/2017'),
('6', '30', '004/2017'),
('7', '30', '005/2017'),
('8', '30', '006/2017'),
('1', '32', '001/2017'),
('2', '32', '002/2017'),
('3', '32', '003/2017');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_sales_order_details` ###

INSERT INTO `0_sales_order_details` VALUES
('1', '1', '32', '1', 'Test Item', '0', '12000', '10', '0', '0.1'),
('2', '2', '32', '1', 'Test Item', '0', '210', '50', '0', '0'),
('3', '1', '30', '1', 'Test Item', '1400', '50000', '1400', '0', '0'),
('4', '2', '30', '1', 'Test Item', '1', '100', '1', '0', '0'),
('5', '3', '30', '1', 'Test Item', '100', '10', '100', '0', '0'),
('6', '4', '30', '1', 'Test Item', '0', '100', '1', '0', '0'),
('7', '5', '30', '1', 'Test Item', '0', '250', '100', '0', '0'),
('8', '3', '32', '165FG', 'RESSI PUTTY 10000', '0', '1000', '1', '0', '0'),
('9', '6', '30', '141FG', 'ZHITE GLUE FULL', '0', '12300', '1', '0', '0'),
('10', '7', '30', '01FG', 'RESSI TA 210', '0', '200', '150', '0', '0'),
('11', '8', '30', '01FG', 'RESSI TA 210', '0', '200', '200', '0', '0'),
('12', '8', '30', '167FG', 'RESSI COAT X 491', '0', '2000', '5', '0', '0');

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

INSERT INTO `0_sales_orders` VALUES
('1', '30', '2', '0', '1', '1', '001/2017', '', NULL, '2017-07-04', '1', '1', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,\n', '0333-3190927', NULL, 'SHAH HARDWARE', '0', 'DEF', '2017-10-02', '5', '70000000', '0', '0', '0', '0', '0', '0', ''),
('2', '30', '1', '0', '1', '1', 'auto', '', NULL, '2017-07-04', '1', '1', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,\n', '0333-3190927', NULL, 'SHAH HARDWARE', '0', 'DEF', '2017-08-17', '1', '100', '0', '0', '0', '0', '0', '0', ''),
('3', '30', '1', '0', '1', '1', 'auto', '', NULL, '2017-07-04', '1', '1', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,\n', '0333-3190927', NULL, 'SHAH HARDWARE', '0', 'DEF', '2017-08-17', '1', '1000', '0', '0', '0', '0', '0', '0', ''),
('4', '30', '0', '0', '1', '1', '002/2017', '', NULL, '2017-07-04', '1', '1', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,\n', '0333-3190927', NULL, 'SHAH HARDWARE', '0', 'DEF', '2017-07-05', '1', '100', '0', '0', '0', '0', '0', '0', ''),
('5', '30', '0', '0', '1', '1', '003/2017', '', NULL, '2017-07-04', '1', '1', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,\n', '0333-3190927', NULL, 'SHAH HARDWARE', '0', 'DEF', '2017-07-05', '1', '25000', '0', '0', '0', '0', '0', '0', ''),
('6', '30', '0', '0', '1', '1', '004/2017', '', NULL, '2017-07-07', '1', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0347-7287606', NULL, '3G CONSTRUCTION', '0', 'DEF', '2017-07-08', '5', '12300', '0', '0', '0', '0', '0', '0', ''),
('7', '30', '0', '0', '33', '33', '005/2017', '', NULL, '2017-07-12', '1', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0312-3399978', NULL, 'ANWER OK', '0', 'DEF', '2017-07-13', '5', '30000', '0', '0', '0', '0', '0', '0', ''),
('8', '30', '0', '0', '166', '166', '006/2017', '', 'Delivered to Poly Access', '2017-07-01', '1', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0334-9549365', NULL, 'Mujeeb Traders', '0', 'DEF', '2017-07-02', '3', '50000', '0', '0', '1', '1', '0', '0', 'Survey on 31-12-2017'),
('1', '32', '0', '0', '2', '15', '001/2017', '', 'ghfhgfghfghfghfghfghfghfghfghfghffhgfghfghfghfgh', '2017-06-30', '1', '1', 'DHA', NULL, NULL, 'Murad Hardware', '0', 'DEF', '2017-07-01', '3', '108000', '0', '0', '0', '0', '0', '0', ''),
('2', '32', '0', '0', '1', '1', '002/2017', '', NULL, '2017-06-30', '1', '1', 'PLOT # 18/D, MAIN KH-E-BUKHARI, NISHAT CORNER, DHA,\n', '0333-3190927', NULL, 'SHAH HARDWARE', '0', '', '2017-07-30', '1', '10500', '0', '0', '0', '0', '0', '0', ''),
('3', '32', '0', '0', '1', '1', '003/2017', '', NULL, '2017-07-07', '1', '1', 'BAHRIA HEIGHTS, BAHRIA TOWN,\n', '0347-7287606', NULL, '3G CONSTRUCTION', '0', 'DEF', '2017-08-06', '5', '1000', '0', '0', '0', '0', '0', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('1', 'TILE ADDHESIVE', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('2', 'GROUTING MATERIALS', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('3', 'WATER PROOFING', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('4', 'DRY MIX MORTARS/PREMIX PLASTERS', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('5', 'EPOXY ADDHESIVE AND  COATINGS', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('6', 'ADDHESIVE ', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('7', 'EPOXY FLOORINGS', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('8', 'BUILDING INSULATION', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('9', 'DECORATIVE CONCRETE', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('10', 'BUILDING CARE AND  MAINTENANCE', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('11', 'MISC', '2', 'each', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('12', 'DRY MATERIAL', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0'),
('13', 'LIQUID MATERIAL', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0'),
('14', 'PACKING MATERIAL', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0');

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
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_master` ###

INSERT INTO `0_stock_master` VALUES
('01 DML', '12', '1', 'SILICA SAND', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('01FG', '1', '1', 'RESSI TA 210', '', 'BG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', ''),
('02 DML', '12', '1', 'RED SAND', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('02FG', '1', '1', 'RESSI TA 220', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('03 DML', '12', '1', 'GREY CEMENT', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('03FG', '1', '1', 'RESSI TA 230', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('04 DML', '12', '1', 'WHITE CEMENT', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('04FG', '1', '1', 'RESSI TA 240', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('05 DML', '12', '1', 'WHITE DANAYDAR', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('05FG', '1', '1', 'RESSI TA 250', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('06 DML', '12', '1', 'WHITE BAREK', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('06FG', '1', '1', 'RESSI TA 260', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('07 DML', '12', '1', 'SUPER WHITE RAKWAL', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('07FG', '1', '1', 'RESSI TA 270', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('08FG', '1', '1', 'RESSI TA 280', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('09 DML', '12', '1', 'CALCIUM STERATE', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('09FG', '1', '1', 'RESSI TA 290', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('10 DML', '12', '1', 'SILRES POWDER D', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('100FG', '4', '1', 'RPR 110 5211 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('101FG', '4', '1', 'RPR 110 5950 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('102FG', '4', '1', 'RPR 110 7000 W ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('103FG', '4', '1', 'RPR 110 9110 W ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('104FG', '4', '1', 'RPR 110 9210 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('105FG', '4', '1', 'RPR 110 9210 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('106FG', '4', '1', 'RPR 110 9211', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('107FG', '4', '1', 'RPR 110 9400', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('108FG', '4', '1', 'RPR 110 9410', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('109FG', '4', '1', 'RPR 110 9411 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('10FG', '1', '1', 'RESSI TA 0001 B', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('11 DML', '12', '1', 'SILRES POWDER S', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('110FG', '4', '1', 'RPR 120', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('111FG', '4', '1', 'RPR 120 C', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('112FG', '4', '1', 'RESSI SC 310', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('113FG', '4', '1', 'RESSI SLS 610', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('114FG', '4', '1', 'RESSI PFS 620', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('115FG', '4', '1', 'RESSI BRC 7000', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('116FG', '5', '1', 'ZEPOXY 100 F ', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('117FG', '5', '1', 'ZEPOXY 100 H ', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('118FG', '5', '1', 'ZEPOXY 100 Q ', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('119FG', '5', '1', 'ZEPOXY 100 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('11FG', '1', '1', 'RESSI ETA', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('12 DML', '12', '1', 'SODA ASH', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('120FG', '5', '1', 'ZEPOXY 150 F', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('121FG', '5', '1', 'ZEPOXY 150 H', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('122FG', '5', '1', 'ZEPOXY 200 F', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('123FG', '5', '1', 'ZEPOXY 200 H', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('124FG', '5', '1', 'ZEPOXY 200 Q', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('125FG', '5', '1', 'ZEPOXY 200 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('126FG', '5', '1', 'ZEPOXY 250 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('127FG', '5', '1', 'ZEPOXY 300 F ', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('128FG', '5', '1', 'ZEPOXY 300 Q ', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('129FG', '5', '1', 'ZEPOXY 300 H', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('12FG', '1', '1', 'RESSI TA 2K', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('13 DML', '12', '1', 'TATRIC ACID', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('130FG', '5', '1', 'ZEPOXY 300 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('131FG', '5', '1', 'ZEPOXY 500 H', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('132FG', '5', '1', 'ZEPOXY 500 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('133FG', '5', '1', 'ZEPOXY 600 F', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('134FG', '5', '1', 'ZEPOXY 600 H', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('135FG', '5', '1', 'ZEPOXY 600 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('136FG', '5', '1', 'ZEPOXY 700 F', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('137FG', '5', '1', 'ZEPOXY 700 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('138FG', '5', '1', 'ZEPOXY 800 MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('139FG', '5', '1', 'ZEPOXY QUICK H', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('13FG', '1', '1', 'RESSI TA HPA', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('14 DML', '12', '1', 'GECEDRAL BZ 111', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('140FG', '5', '1', 'ZEPOXY QUICK MINI', '', 'SET', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('141FG', '6', '1', 'ZHITE GLUE FULL', '', 'POUCH', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('142FG', '6', '1', 'ZHITE GLUE HALF', '', 'POUCH', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('143FG', '6', '1', 'ZHITE GLUE QUARTER', '', 'POUCH', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('144FG', '6', '1', 'ZHITE GLUE FULL', '', 'BOTTLE', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('145FG', '6', '1', 'ZHITE GLUE HALF', '', 'BOTTLE', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('146FG', '6', '1', 'ZHITE GLUE QUARTER', '', 'BOTTLE', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('147FG', '7', '1', 'RESSI EPO CRACK FILL', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('148FG', '7', '1', 'RESSI EPO PREMIER', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('149FG', '7', '1', 'RESSI EPO TOUGH MIGHT', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('14FG', '2', '1', 'RESSI TG 810', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('15 DML', '12', '1', 'GECEDRAL L', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('150FG', '7', '1', 'RESSI EPO GLOSS MIGHT', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('151FG', '7', '1', 'RESSI EPO ECO MIGHT', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('152FG', '8', '1', 'RESSI INSUFIX 200', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('153FG', '8', '1', 'RESSI FOAM CRETE', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('154FG', '9', '1', 'RESSI HARDENER', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('155FG', '9', '1', 'RESSI POWDER RELEASE', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('156FG', '9', '1', 'RESSI CHROME SEAL', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('157FG', '9', '1', 'RESSI LIQUID RELEASE', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('158FG', '10', '1', 'RESSI CFM 910', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('159FG', '10', '1', 'RESSI CFM 910 2K', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('15FG', '2', '1', 'RESSI TG 810 0001 (BRIGHT WHITE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('16 DML', '12', '1', 'SUPERPAS N2028', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('160FG', '10', '1', 'RESSI CFM 920', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('161FG', '10', '1', 'RESSI CFM 920 2K', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('162FG', '10', '1', 'RESSI CFM FLEXI 2K', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('163FG', '10', '1', 'RESSI RM 410', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('164FG', '10', '1', 'RESSI RM 410 2K', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('165FG', '10', '1', 'RESSI PUTTY 10000', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('166FG', '10', '1', 'RESSI PUTTY 11000 G', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('167FG', '10', '1', 'RESSI COAT X 491', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('168FG', '10', '1', 'RESSI COAT X 491 3.2', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('169FG', '10', '1', 'SILPRIME 3K', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('16FG', '2', '1', 'RESSI TG 810 1110 (IVORY)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('17 DML', '12', '1', 'SUPERPAS N2098', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('170FG', '10', '1', 'RESSI DAMP SEAL', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('171FG', '10', '1', 'SILMIX', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('172FG', '10', '1', 'RESSI HEAT GUARD 1000', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('173FG', '10', '1', 'RESSI SP 099', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('174FG', '10', '1', 'RESSI SP 044N', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('175FG', '10', '1', 'RESSI SP 088', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('176FG', '10', '1', 'SILBLOCK', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('177FG', '10', '1', 'SILBLOCK AG', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('178FG', '10', '1', 'RESSI LURRY 2020', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('17FG', '2', '1', 'RESSI TG 810 1211 (BEIGE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('18 DML', '12', '1', 'COMBIZELL LH20MR', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('18FG', '2', '1', 'RESSI TG 810 1421 (DARK BEIGE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('19 DML', '12', '1', 'TITANIUM', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('19FG', '2', '1', 'RESSI TG 810 1600 (YELLOW)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('20 DML', '12', '1', 'MULAISES', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('20FG', '2', '1', 'RESSI TG 810 1950 (MAPLE WOOD)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('21 DML', '12', '1', 'POLYNAPTHELENE SULPHONIC ACID', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('21FG', '2', '1', 'RESSI TG 810 2400 (LIGHT GREEN)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('22 DML', '12', '1', 'SODIUM LIGNOSULPHATE', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('22FG', '2', '1', 'RESSI TG 810 2770 (AQUA GREEN)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('23 DML', '12', '1', 'SILICA FLOUR', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('23FG', '2', '1', 'RESSI TG 810 3100 (PINK)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('24 DML', '12', '1', 'MELLAPLAST', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('24FG', '2', '1', 'RESSI TG 810 3700 (TERRACOTTA)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('25 DML', '12', '1', 'SUPERCEL 250', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('25FG', '2', '1', 'RESSI TG 810 4720 (BURGUNDY)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('26 DML', '12', '1', 'SILIPON RN 6031', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('26FG', '2', '1', 'RESSI TG 810 5110 (LIGHT GREY)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('27 DML', '12', '1', 'MILOCELL', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('27FG', '2', '1', 'RESSI TG 810 5210 1 (SKY BLUE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('28 DML', '12', '1', 'MELAMINE', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('28FG', '2', '1', 'RESSI TG 810 5210 2 (MARBLE BEIGE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('29 DML', '12', '1', 'HIGH ALUMINIA', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('29FG', '2', '1', 'RESSI TG 810 5410 (Dark Blue)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('30 DML', '12', '1', 'BERMODOL AEA 8200', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('30FG', '2', '1', 'RESSI TG 810 5410 1 (AQUA BLUE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('31 DML', '12', '1', 'MANGANESE CHLORIDE', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('31FG', '2', '1', 'RESSI TG 810 5650 (PURPLE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('32 DML', '12', '1', 'OPTIBENT MF', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('32FG', '2', '1', 'RESSI TG 810 5960 (INDIGO BLUE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('33 DML', '12', '1', 'OPTIBENT 602', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('33FG', '2', '1', 'RESSI TG 810 6110 (OFF WHITE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('34 DML', '12', '1', 'IRON OXIDE ORANGE S960', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('34FG', '2', '1', 'RESSI TG 810 6400 (PEACH)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('35 DML', '12', '1', 'IRON OXIDE BROWN S660', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('35FG', '2', '1', 'RESSI TG 810 8111 (DARK IVORY)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('36 DML', '12', '1', 'IRON OXIDE BLUE U08', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('36FG', '2', '1', 'RESSI TG 810 9000 (GREY)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('37 DML', '12', '1', 'IRON OXIDE GREEN S5605', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('37FG', '2', '1', 'RESSI TG 810 9111 (ASH WHITE)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('38 DML', '12', '1', 'IRON OXIDE RED S-110', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('38FG', '2', '1', 'RESSI TG 810 9111 1 (DESERT TAN)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('39 DML', '12', '1', 'IRON OXIDE RED S-120', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('39FG', '2', '1', 'RESSI TG 810 9200 (DARK GREY)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('40 DML', '12', '1', 'IRON OXIDE RED S-140', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('40FG', '2', '1', 'RESSI TG 810 9321 (BROWN)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('41 DML', '12', '1', 'IRON OXIDE RED S-190', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('41FG', '2', '1', 'RESSI TG 810 9642 (DARK BROWN)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('42 DML', '12', '1', 'IRON OXIDE BLACK 4330-3', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('42FG', '2', '1', 'RESSI TG 810 9960 (BLACK)', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('43 DML', '12', '1', 'IRON OXIDE YELLOW S920', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('43FG', '2', '1', 'RESSI TG 820 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('44 DML', '12', '1', 'IRON OXIDE BROWN 4686', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('44FG', '2', '1', 'RESSI TG 2K', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('45 DML', '12', '1', 'CALCIUM CARBONATE 100-200 MESH AMIN MARBLE', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('45FG', '2', '1', 'RESSI TG BATH SEAL 2K ', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('46 DML', '12', '1', 'CALCIUM CARBONATE 400 STD PAINT', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('46FG', '2', '1', 'RESSI TG BATH SEAL 2K 810', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('47 DML', '12', '1', 'HYDRATED LIME', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('47FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 0001 (BRIGHT WHITE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('48 DML', '12', '1', 'MARBLE POWDER', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('48FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 1110 (IVORY)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('49 LMI', '13', '1', 'RESIN YD-128', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('49FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 1211 (BEIGE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('50 LML', '13', '1', 'RESIN YD-553', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('50FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 1421 (DARK BEIGE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('51 LML', '13', '1', 'RESIN BYD-7201', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('51FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 1600 (YELLOW)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('52 LML', '13', '1', 'R 2020', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('52FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 1950 (MAPLE WOOD)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('53 LML', '13', '1', 'SILRES BS 4004', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('53FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 2400 (LIGHT GREEN)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('54 LML', '13', '1', 'XYLENE SOLVENT', '', 'LTR', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('54FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 2770 (AQUA GREEN)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('55 LML', '13', '1', 'LINDRON 31', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('55FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 3100 (PINK)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('56 LML', '13', '1', 'LINDRON 34', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('56FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 3700 (TERRACOTTA)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('57 LML', '13', '1', 'KR 40', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('57FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 4720 (BURGUNDY)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('58 LML', '13', '1', 'FOAM CONCRETE', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('58FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5110 (LIGHT GREY)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('59 LML', '13', '1', 'HARDENER TH 7301', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('59FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5210 1 (SKY BLUE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('60 LML', '13', '1', 'HARDENER TH 7201', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('60FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5210 2 (MARBLE BEIGE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('61 LML', '13', '1', 'HARDENER TH 4504', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('61FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5410 (Dark Blue)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('62 LML', '13', '1', 'HARDENER TH 3702', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('62FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5410 1 (AQUA BLUE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('63 LML', '13', '1', 'HARDENER TH 7167', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('63FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5650 (PURPLE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('64 LML', '13', '1', 'HARDENER TH 7269', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('64FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 5960 (INDIGO BLUE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('65 LML', '13', '1', 'HARDENER 140', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('65FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 6110 (OFF WHITE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('66 LML', '13', '1', 'EMULTEX-1602', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('66FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 6400 (PEACH)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('67 LML', '13', '1', 'PRIMAL CS 4000', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('67FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 8111 (DARK IVORY)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('68 LML', '13', '1', 'REVACRYL 2091', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('68FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9000 (GREY)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('69 LML', '13', '1', 'REVACRYL 3020', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('69FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9111 (ASH WHITE)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('70 LML', '13', '1', 'REVACRYL 478', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('70FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9111 1 (DESERT TAN)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('71 LML', '13', '1', 'SBR', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('71FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9200 (DARK GREY)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('72 LML', '13', '1', 'IMPREGNATING AGENT SK', '', 'KG', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('72FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9321 (BROWN)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('73 LML', '13', '1', 'BIOCIDE', '', 'LTR', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('73FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9642 (DARK BROWN)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('74 PML', '14', '1', 'PLASTIC BAG TA 210', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('74FG', '2', '1', 'RESSI TG BATH SEAL 2K 810 9960 (BLACK)', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('75 PML', '14', '1', 'PLASTIC BAG TA 220', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('75FG', '2', '1', 'RESSI TG CR HIGH GLOSS', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('76 PML', '14', '1', 'PLASTIC BAG TA 230', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('76FG', '2', '1', 'RESSI TG CR SEMI GLOSS', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('77 PML', '14', '1', 'PLASTIC LDPE 1 KG (TG 810)', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('77FG', '2', '1', 'RESSI ETG DP MATT', '', 'KIT', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('78 PML', '14', '1', 'PLASTIC LDPE 2 KG', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('78FG', '2', '1', 'RESSI TILE LATEX 205', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('79 PML', '14', '1', 'PAPER BAG 50 KG VALVE RPR 110', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('79FG', '3', '1', 'RESSI SBR 1358 ', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('80 PML', '14', '1', 'CORRUGATED CARTON FOR 1 KG POUCH', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('80FG', '3', '1', 'RESSI SBR 5813 ', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('81 PML', '14', '1', 'CORRUGATED CARTON FOR UNIVERSAL', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('81FG', '3', '1', 'RESSI SBR 5840 ', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('82 PML', '14', '1', 'PAPER BOX X 491', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('82FG', '3', '1', 'RESSI SBR 5850 ', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('83 PML', '14', '1', 'CORRUGATED CARTON FOR ZEPOXY', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('83FG', '3', '1', 'RESSI POLYMER B', '', 'LTR', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('84 PML', '14', '1', 'PAPER BOX BATH SEAL 2K', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('84FG', '4', '1', 'RPR 100', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('85 PML', '14', '1', 'PLASTIC BAG TG 820 1KG', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('85FG', '4', '1', 'RPR 110', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('86 PML', '14', '1', 'PAPER BOX ETG DP MATT', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', '');
INSERT INTO `0_stock_master` VALUES
('86FG', '4', '1', 'RPR 110 0001 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('87 PML', '14', '1', 'PAPER BOX ETG 2K', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('87FG', '4', '1', 'RPR 110 0001 B ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('88 PML', '14', '1', 'PLASTIC BAG BATH SEAL 2K', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('88FG', '4', '1', 'RPR 110 0002 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('89 PML', '14', '1', 'PLASTIC BAG ETG DP MATT', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('89FG', '4', '1', 'RPR 110 0003 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('90 PML', '14', '1', 'PLASTIC BAG TG 2K', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('90FG', '4', '1', 'RPR 110 1100 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('91 PML', '14', '1', 'GLUE BOTTLE SMALL', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('91FG', '4', '1', 'RPR 110 1101 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('92 PML', '14', '1', 'GLUE BOTTLE MEDIUM', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('92FG', '4', '1', 'RPR 110 1111 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('93 PML', '14', '1', 'GLUE BOTTLE LARGE', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('93FG', '4', '1', 'RPR 110 1200 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('94 PML', '14', '1', 'CAP GLUE BOTTLE RED', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('94FG', '4', '1', 'RPR 110 1210 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('95 PML', '14', '1', 'CAP GLUE BOTTLE BLUE', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('95FG', '4', '1', 'RPR 110 1211 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('96 PML', '14', '1', 'PET BOTTLE WITH CAP (FLINT)', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('96FG', '4', '1', 'RPR 110 1220 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('97 PML', '14', '1', 'PET BOTTLE WITH CAP (SQUARE)', '', 'PC', 'B', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('97FG', '4', '1', 'RPR 110 1320', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('98FG', '4', '1', 'RPR 110 2100 1', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', ''),
('99FG', '4', '1', 'RPR 110 5210 ', '', 'KG', 'M', '30199', '35190', '1191', '35200', '117100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'S', '0', '1', '0000-00-00', '0000-00-00', '');

### Structure of table `0_stock_moves` ###

DROP TABLE IF EXISTS `0_stock_moves`;

CREATE TABLE `0_stock_moves` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_no` int(11) NOT NULL DEFAULT '0',
  `stock_id` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `loc_code` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tran_date` date NOT NULL DEFAULT '0000-00-00',
  `price` double NOT NULL DEFAULT '0',
  `reference` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT '1',
  `standard_cost` double NOT NULL DEFAULT '0',
  `discount_percent` double NOT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `type` (`type`,`trans_no`),
  KEY `Move` (`stock_id`,`loc_code`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_moves` ###

INSERT INTO `0_stock_moves` VALUES
('4', '1', '2', '17', 'DEF', '2017-07-04', '0', '001/2017', '50', '0', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_invoice_items` ###


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
  PRIMARY KEY (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_trans` ###


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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('1', 'KAUKAWALA GENERAL TRADING', 'KAUKAWALA GENERAL TRADING', 'A, BUSINESS CENTRE 4, R.A.K. FREE TRADE ZONE,', '', '', '+971504876244', '', '', '', 'PKR', '4', '0', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('2', 'SOFTPAK FINANCIAL SYSTEM', 'SOFTPAK FINANCIAL SYSTEM', '51 RIVER STREET,, WELLESELEY, MA 02481,  ', 'Lahore', '', '51 RIVER STREET,, WELLESELEY, MA 02', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('3', 'M-TEC', 'M-TEC', 'M-TEC MATHIS TECHNIK GMBH OTTO-HAHN-STRA D-79395 NEUNBERG', '', '', '+497631709-0', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('4', 'BURHANI SYNDICATE', 'BURHANI SYNDICATE', 'SHOP# 9A, RAWALPINDIWALA BUILDING, JESWANI STREET, SERAI ROAD,', '', '', '32425808', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('5', 'UNITED PETROLEUM &amp; SVC STATION', 'UNITED PETROLEUM &amp; SVC STA', '', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '980763', '0'),
('6', 'POLYMER ACCESS (PVT) LTD.', 'POLYMER ACCESS (PVT) LTD.', '309, PROGRESSIVE PLAZA, BEUMOUNT ROAD,', '', '', '021-35686244', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('7', 'RESSICHEM INTERNATIONAL-VHL', 'RESSICHEM INTERNATIONAL-VHL', '309, PROGRESSIVE PLAZA, BEUMOUNT ROAD,  ', '', '', '111-052-052', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('8', 'BESTWAY SERVICE STATION', 'BESTWAY SERVICE STATION', 'DR. ZIAUDDIN AHMED ROAD, OPP. POLO GROUND', '', '', '5688380', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1173714', '0'),
('9', 'GHANDHARA INDUSTRIES LIMITED', 'GHANDHARA INDUSTRIES LIMITED', 'SC-43, CHANDNI CHOWK, STADIUM ROAD,', '', '', '021-34937733,34933775,34934423', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('10', 'N.J.AUTO INDUSTRY (PRIVATE) LIMITED', 'N.J.AUTO INDUSTRY (PRIVATE) LI', 'NOOR HOUSE, DARYALAL STREET, JODIA BAZAR,', '', '17-12-8708-022-91', '021-32720575', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '2134894', '0'),
('11', 'SUNDRY CREDITOR', 'SUNDRY CREDITOR', 'KARACHI', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('12', 'ABBAS &amp; CO.', 'ABBAS &amp; CO.', 'SUITE # 69, 2ND FLOOR, GLASS TOWER, MAIN CLIFTON ROAD, FRERE TOWN,', '', '', '+922132727979, 35639593', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '623378', '0'),
('13', 'SAIFY &amp; CO.', 'SAIFY &amp; CO.', 'OFFICE NO.122, SAIMA TRADE TOWER, I.I. CHANDRIGAR ROAD,', '', '', '+922132624321', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '757228', '0'),
('14', 'BADAMI LAW ASSOCIATES', 'BADAMI LAW ASSOCIATES', '210, 2ND FLOOR, BEAUMONT PLAZA, BEHIND P.I.D.C. HOUSE, BEAUMONT ROAD,', '', '', '021-35658857,35658858,35658859', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '4350860', '0'),
('15', 'FOUR STAR CORPORATION', 'FOUR STAR CORPORATION', '506-507, UNI CENTER, 5TH FLOOR,I.I. CHANDRIGAR ROAD,', '', '12-00-9805-345-37', '+922132410156-7', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '2311279', '0'),
('16', 'ATLAS INSURANCE', 'ATLAS INSURANCE', 'FEDERATION HOUSE, ABDULLAH SHAH GHAZI ROAD, MAIN CLIFTON,', '', '', '021-32421030', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '2396345', '0'),
('17', 'HONDA - SITE', 'HONDA - SITE', 'C-1, MAIN MANGHOPIR ROAD, SITE', '', '11-02-9999-476-19', '021-32563857', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '704028', '0'),
('18', 'KOHISTAN TRANSPORT', 'KOHISTAN TRANSPORT', 'A-8, BAKHAR GOTH, SOHRAB GOTH, SCHEME-33', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1215136', '0'),
('19', 'MUSAKHEL ENTERPRISES', 'MUSAKHEL ENTERPRISES', '6-A, Mohammad Ali Society A. Aziz Hashim Tabba Street Karachi - 75350, Pakistan   ', '', '', '+92 21 111 786 555', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '4348341', '0'),
('20', 'PREMIER QUALITY  CHEMICALS PVT. LTD.', 'PREMIER QUALITY  CHEMICALS PVT', 'KHANNAH RANGRAN STOP  8- KM, MURIDKE SHIEKHUPURA ROAD', '', '03-00-3800-019-37', '042-35517163', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3332703', '0'),
('21', 'LUCKY CEMENT LTD.', 'LUCKY CEMENT LTD.', '58KM, MAIN SUPER HIGHWAY NEAR EDHI VILLAGE, KARACHI EAST', '', '05-03-2523-001-28', '111-786-555', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '9807', '0'),
('22', 'RESSICHEM INTERNATIONAL', 'RESSICHEM INTERNATIONAL', 'PLOT#D-83, S.I.T.E, MANGHOPIR ROAD,', '', '12-00-3900-841-82', '021-32593800-02', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '572216', '0'),
('23', 'CROWN MINES', 'CROWN MINES', 'B-15, BAKHAR GOTH, SOHRAB GOTH,', '', '12-04-9999-614-46', '021-37630336', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1215136', '0'),
('24', 'FEROZ &amp; SONS', 'FEROZ &amp; SONS', 'D-153, NEAR VALIKA HOSPITAL. SITE, MANGHOPIR ROAD', '', '42401-1577662-5', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '2898984', '0'),
('25', 'BURHANI CHEMICAL', 'BURHANI CHEMICAL', 'SHOP#100, FEROZ PURWALA CENTER, BOLTEN MARKET. MA JINAH ROAD,', '', '', '021-32461853', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '279875', '0'),
('26', 'AL-NOOR MARBLE CO.', 'AL-NOOR MARBLE CO.', 'PLOT#137, QASBA INDUSTRIAL AREA, MAIN MANGHOPIR ROAD,', '', '', '0332-3215264', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3749480', '0'),
('27', 'GUIDES CORPORATION', 'GUIDES CORPORATION', '416, MADINA CITY MALL, ABDULLAH HAROON ROAD, SADDAR', '', '11-00-2800-076-55', '35655241-2', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '616508', '0'),
('28', 'THATTA CEMENT COMPANY LIMITED', 'THATTA CEMENT COMPANY LIMITED', 'HEAD OFFICE # 606-608-A, 6TH FLOOR, CONTINENTAL TRADE CENTER CLIFTON, BLOCK-8,', '', '', '021-111-842-882, 35303071-73', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '712394', '0'),
('29', 'D.S ENTERPRISES', 'D.S ENTERPRISES', 'HAJVERY ARCADE, 2ND FLOOR,OFFICE#1, MAIN BUND ROAD,LAHORE.', '', '03-00-3835-423-15', '042-37146688,042-36110089', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3835423', '0'),
('30', 'REDA INDUSTRIAL MATERIALS PAKISTAN (PVT) LTD.', 'REDA INDUSTRIAL MATERIALS PAKI', 'G/F 002,PLOT NO.188-E/II, BLOCK-2, P.E.C.H.S. KARACHI PAKISTAN', '', '17-00-3800-021-37', '34302200-3', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '2877554', '0'),
('31', 'SPECIALITY PRINTERS (PVT) LTD.', 'SPECIALITY PRINTERS (PVT) LTD.', 'F/159, SITE, OFF HUB RIVER ROAD,', '', '02-01-4816-004-55', '021-32579030-34', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '800617', '0'),
('32', 'THAL LTD, PAKISTAN-PAPERSACK DIV.', 'THAL LTD, PAKISTAN-PAPERSACK D', '5TH FLOOR, SIDDIQ SONS TOWER, 3--JCHS,  MAIN SHARA-E-FAISAL,', '', '12-01-8415-001-64', '021-34312030-4', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '711010', '0'),
('33', 'GUL HASSAN SAND SUPPLIER', 'GUL HASSAN SAND SUPPLIER', '62/21 PAK PEOPLES  COLONY BLOCK 21, FEDERAL B. AREA', '', '42101-1774526-5', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3677518', '0'),
('34', 'STANDARD PAINT INDUSTRIES', 'STANDARD PAINT INDUSTRIES', 'F-104, SITE, HAWKSBAY ROAD,', '', '02-01-3208-008-46', '021-32354391', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '276897', '0'),
('35', 'PARAMOUNT MINERAL TRADING', 'PARAMOUNT MINERAL TRADING', 'BUFFERZONE', '', '', '021-36905446', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('36', 'AMIN MARBLE STONE CURUSH', 'AMIN MARBLE STONE CURUSH', 'D/75-A, MANBHOPIR ROAD, SITE,', '', '', '03002195877', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3033825', '0'),
('37', 'SAAT TRADERS', 'SAAT TRADERS', '29-30, PAK CENTRE, PAKISTAN CHOWK', '', '12-22-9999-621-73', '021-32620280', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '514954', '0'),
('38', 'AHMED TRADERS', 'AHMED TRADERS', 'PLOT #.97-24/1, STREET NO.01, K.S.1492 B.ROAD, BEHAR COLONY. KARACHI', '', '11-00-3923-057-55', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1139874', '0'),
('39', 'NOOR CHEMICALS', 'NOOR CHEMICALS', '4-A, AMIN ARCADE, PLOT #.7E, 27TH TAUHEED COMMERCIAL STREET, PHASE V, D.H.A., KARACHI', '', '', '021-35831406-7', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('40', 'POWER CEMENT LIMITED', 'POWER CEMENT LIMITED', 'ARIF HABIB CENTRE 23, M.T. Khan Road,', '', '01-01-2523-004-46', '021-32468231-2', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '700886', '0'),
('41', 'A.F.PRINTERS', 'A.F.PRINTERS', 'EBRAHIMJEE ESSAJEE BUILDING, PAKISTAN CHOWK,', '', '42301-0915872-7', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1278700', '0'),
('42', 'IMPORIENT CHEMICALS (PVT) LTD', 'IMPORIENT CHEMICALS (PVT) LTD', 'T-09, HAFEEZ CENTRE, MAIN BOULEVARD GULBERG-III,', '', '0390999965873', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '683674', '0'),
('43', 'MAPLE LEAF CEMENT FACTORY LIMITED', 'MAPLE LEAF CEMENT FACTORY LIMI', '42-LAWRENCE ROAD. LAHORE, PAKISTAN.', '', '04-09-2523-001-91', '021-32316844', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '786576', '0'),
('44', 'M/S MITHANI INDUSTRY (PVT) LTD', 'M/S MITHANI INDUSTRY (PVT) LTD', 'F-273 KAKA COMPOUND, SITE, KARACHI.', '', '17-00-3554-755-11', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3554755', '0'),
('45', 'SAIFY ENTERPRISES', 'SAIFY ENTERPRISES', 'SHOP#32, BURHANI CENTRE, JESWANI STREET, M.A. JINNAH ROAD,', '', '17-00-3831-440-11', '32428479', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3831440', '0'),
('46', 'PRINTING SERVICES (PVT) LTD.', 'PRINTING SERVICES (PVT) LTD.', 'F-42/A, HUB RIVER ROAD. S.I.T.E., KARACHI-75700, PAKISTAN', '', '02-02-3900-007-64', '021-2574861-64,2565443,2576936', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '711728', '0'),
('47', 'M &amp; F COMMERCIAL CORPORATION (PVT) LTD.', 'M &amp; F COMMERCIAL CORPORATI', 'L-A 8/15, 8/16 BLOCK-22 FEDERAL &quot;B&quot; INDUSTRIAL AREA,', '', '', '021-36834486-90', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '860414', '0'),
('48', 'MYSF IMPEX', 'MYSF IMPEX', '101/1 5TH COMMERCIAL STREET PHASE-4 D.H.A, KARACHI', '', '1750320600228', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3033831', '0'),
('49', 'POLY PACK INTERNATIONAL', 'POLY PACK INTERNATIONAL', 'B-7/A-1, Memon Complex, Block-M, North Nazimabad, Karachi.', '', '42101-1827065-7', '0300-2446513', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '2241284', '0'),
('50', 'ATOM PROCESSOR AND SUPPLIES', 'ATOM PROCESSOR AND SUPPLIES', 'HOUSE # 109, BLOCK-21, PAK PEOPLES COLONY, BABA REHMAN ROAD,', '', '42201-8961577-3', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3599294', '0'),
('51', 'TURNING POINT', 'TURNING POINT', 'SIUTE # 18-19, MEZZANINE FLOOR, MUHAMMADI PRIDE, PAKISTAN CHOWK,', '', '42101-1712314-7', '32212390', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1440649', '0'),
('52', 'SUNRISE PLASTIC INDUSTRIES (PVT) LTD', 'SUNRISE PLASTIC INDUSTRIES (PV', 'F-105 HUB RIVER ROAD SITE', '', '02-01-3900-010-19', '021-32572469', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '860347', '0'),
('53', 'ALPHA CHEMICAL CO', 'ALPHA CHEMICAL CO', 'AHMED ARCADE, DARYALAL STREET, JODIA BAZAR', '', '11-20-9999-509-73', '021-32472479', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '626362', '0'),
('54', 'PLASTICS N PLASTICS PVT LTD', 'PLASTICS N PLASTICS PVT LTD', 'PLOT NO DP-45, SECTOR 12-D, NORTH KARACHI INDUSTRIAL AREA', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '4360062', '0'),
('55', 'ALPHA CONTAINER INDUSTRIES PVT LTD', 'ALPHA CONTAINER INDUSTRIES PVT', 'SALE OFFICE, ROOM NO 3, 2ND FLOOR, ZAFAR NADEEM PLAZA 31-B, MAIN FAISAL TOWN', '', '02-017310-025-46', '042-35167429', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3239632', '0'),
('56', 'AL MEHRAN CHEMICALS', 'AL MEHRAN CHEMICALS', '104, 1ST FLOOR, A/30, M YOUSUF CHAMBER K.C.H SOCIETY BLOCK, 7-8 UNION COMM. AREA', '', '11-00-2800-007-64', '021-34320758-7', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '897452', '0'),
('57', 'NEW PRIME CHEMICALS', 'NEW PRIME CHEMICALS', '4 ALVI CHAMBERS NORTH NAPIER ROAD', '', '', '021-32437022 - 021-32473304', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('58', 'GUL BADIEN AND CO.', 'GUL BADIEN AND CO.', 'SOHRAB GOTH FEDERAL B AREA BLOCK 21 PAK PEOPLES COLONY', '', '42101-6985805-5', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '7409572', '0'),
('59', 'ORIENT ENERGY SYSTEMS (PVT.) LTD.', 'ORIENT ENERGY SYSTEMS (PVT.) L', 'PLOT#16, SECTOR-24, KORANGI INDUSTRIAL AREA,', '', '17-50-8502-008-91', '021-', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3032072', '0'),
('60', '3 STAR WEIGHING ENTERPRISES', '3 STAR WEIGHING ENTERPRISES', 'OFFICE NO.306, 3RD FLOOR, PAK BAITUL QAYYAM BUILDING, HAQQANI CHOWK, I.I. CHANDRIGAR ROAD,', '', '42201-2275670-9', '+922132633176', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1187031', '0'),
('61', 'BURHANI PACKAGING MACHINERY', 'BURHANI PACKAGING MACHINERY', 'SHOP # 3/A, FAZAL CHAMBER, KHORI GARDEN,', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '3236217', '0'),
('62', 'MASTER SOCIETY MOTORS', 'MASTER SOCIETY MOTORS', '87-S BLOCK 2, ALLAMA IQBAL ROAD, PECHS', '', '1700870803555', '34553058', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1201654', '0'),
('63', 'SAIFY IRON (PVT) LTD', 'SAIFY IRON (PVT) LTD', 'NISHTAR ROAD, OFF BABA-E-URDU ROAD', '', '12-20-9999-506-28', '32777202', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1234705', '0'),
('64', 'HAKIMI STEEL', 'HAKIMI STEEL', 'SHOP # 6, BISMILLAH TERRACE, NAJMUDDIN STREET, NANAKWARA,', '', '', '021-32760033', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1192843', '0'),
('65', '3D PRINTERS', '3D PRINTERS', 'SHOP # 5, BURHANI GARDEN, NEAR HAQANI CHOWK', '', '42501-1522471-7', '021-32623975', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1306681', '0'),
('66', 'KARACHI ELECTRIC SUPPLY CO.', 'KARACHI ELECTRIC SUPPLY CO.', '2ND FLOOR, ANUM TRADE CENTER, GHANI CHOWRANGI, SITE,  ', '', '12-00-2716-007-28', '118', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '1543137', '0'),
('67', 'SUI SOUTHERN GAS LTD', 'SUI SOUTHERN GAS LTD', 'HASAN SQUARE', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('68', 'SITE-WATER SUPPLY', 'SITE-WATER SUPPLY', '', '', '', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('69', 'PAKISTAN TELECOMMUNICATION LTD.', 'PAKISTAN TELECOMMUNICATION LTD', 'EXCHANGE NO.024-EWSD-SITE-II DGTL  ', '', '07-01-8517-013-46', '', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '801599', '0'),
('70', 'WI-TRIBE LIMITED', 'WI-TRIBE LIMITED', 'NORTH NAZIMABAD OUTLET', '', '', '111-187-423', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '0', '0'),
('71', 'PAKISTAN MOBILINK COMMUNICATION LTD.', 'PAKISTAN MOBILINK COMMUNICATIO', '', '', '07-01-8517-004-37', '11300300', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '802694', '0'),
('72', 'ZAKI BROTHERS', 'ZAKI BROTHERS', 'F-46 SITE', '', '02-06-6902-001-64', '32589740', '', '', '', 'PKR', '1', '1', '0', '0', '1', '0', '', '2081', '701001', '', '301354', '0');

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
('allow_negative_stock', 'glsetup.inventory', 'tinyint', '1', '1'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', ''),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '601605'),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', ''),
('coy_logo', 'setup.company', 'varchar', '100', ''),
('coy_name', 'setup.company', 'varchar', '60', 'RESSiCHEM PRIVATE LIMITED'),
('coy_no', 'setup.company', 'varchar', '25', ''),
('creditors_act', 'glsetup.purchase', 'varchar', '15', '2081'),
('curr_default', 'setup.company', 'char', '3', 'PKR'),
('debtors_act', 'glsetup.sales', 'varchar', '15', '1081'),
('default_adj_act', 'glsetup.items', 'varchar', '15', '35200'),
('default_cogs_act', 'glsetup.items', 'varchar', '15', '35190'),
('default_credit_limit', 'glsetup.customer', 'int', '11', '0'),
('default_delivery_required', 'glsetup.sales', 'smallint', '6', '1'),
('default_dim_required', 'glsetup.dims', 'int', '11', '20'),
('default_inv_sales_act', 'glsetup.items', 'varchar', '15', '30199'),
('default_inventory_act', 'glsetup.items', 'varchar', '15', '1191'),
('default_loss_on_asset_disposal_act', 'glsetup.items', 'varchar', '15', '101001'),
('default_prompt_payment_act', 'glsetup.sales', 'varchar', '15', '35201'),
('default_quote_valid_days', 'glsetup.sales', 'smallint', '6', '30'),
('default_receival_required', 'glsetup.purchase', 'smallint', '6', '10'),
('default_sales_act', 'glsetup.sales', 'varchar', '15', ''),
('default_sales_discount_act', 'glsetup.sales', 'varchar', '15', '35201'),
('default_wip_act', 'glsetup.items', 'varchar', '15', '117100'),
('default_workorder_required', 'glsetup.manuf', 'int', '11', '20'),
('deferred_income_act', 'glsetup.sales', 'varchar', '15', ''),
('depreciation_period', 'glsetup.company', 'tinyint', '1', '1'),
('domicile', 'setup.company', 'varchar', '55', ''),
('email', 'setup.company', 'varchar', '100', 'info@ressichem.com'),
('exchange_diff_act', 'glsetup.general', 'varchar', '15', '35200'),
('f_year', 'setup.company', 'int', '11', '3'),
('fax', 'setup.company', 'varchar', '30', ''),
('freight_act', 'glsetup.customer', 'varchar', '15', '101001'),
('gl_closing_date', 'setup.closing_date', 'date', '8', ''),
('grn_clearing_act', 'glsetup.purchase', 'varchar', '15', ''),
('gst_no', 'setup.company', 'varchar', '25', ''),
('legal_text', 'glsetup.customer', 'tinytext', '0', ''),
('loc_notification', 'glsetup.inventory', 'tinyint', '1', ''),
('login_tout', 'setup.company', 'smallint', '6', '600'),
('no_customer_list', 'setup.company', 'tinyint', '1', '0'),
('no_item_list', 'setup.company', 'tinyint', '1', '0'),
('no_supplier_list', 'setup.company', 'tinyint', '1', '0'),
('no_zero_lines_amount', 'glsetup.sales', 'tinyint', '1', '1'),
('past_due_days', 'glsetup.general', 'int', '11', '30'),
('phone', 'setup.company', 'varchar', '30', '021-322593800'),
('po_over_charge', 'glsetup.purchase', 'int', '11', '10'),
('po_over_receive', 'glsetup.purchase', 'int', '11', '10'),
('postal_address', 'setup.company', 'tinytext', '0', 'Plot # D-83, S.I.T.E, Industrial Area, Manghopir Road, Karachi.'),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '999999'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '701001'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '251201'),
('round_to', 'setup.company', 'int', '5', '1'),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', '1', ''),
('suppress_tax_rates', 'setup.company', 'tinyint', '1', ''),
('tax_algorithm', 'glsetup.customer', 'tinyint', '1', '1'),
('tax_last', 'setup.company', 'int', '11', '1'),
('tax_prd', 'setup.company', 'int', '11', '1'),
('time_zone', 'setup.company', 'tinyint', '1', '0'),
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
('closing', '1'),
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
('sales_quotation_text', 'Sale Quotation Entry'),
('sale_order_entry_text', 'Sale Order Entry'),
('delivery_against_text', 'Delivery Against Sales Orders'),
('invoice_against_text', 'Invoice Against Sales Delivery'),
('direct_invoice_text', 'Direct Invoice'),
('customer_payment_text', 'Customer Payments'),
('customer_credit_note_text', 'Customer Credit Note'),
('allocate_text', 'Allocate Customer Payments Or Credit Notes'),
('sales_quotation_inquiry_text', 'Sale Quotation Inquiry'),
('sale_order_inquiry_text', 'sale_order_inquiry_text'),
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
('recorder_levels_text', 'Recorder_levels'),
('import_csv_text', ''),
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
('trial_balance_text', 'Tiral Balance'),
('pf_drill_text', 'Balance Sheet drilldown'),
('drill_balance_text', 'Balance Sheet drilldown'),
('banking_reports_text', 'Banking Reports'),
('general_ledger_text', 'General Ledger Reports'),
('bank_account_text', 'Bank Account'),
('quick_entries_text', 'Quick Entries'),
('account_tag_text', 'Account Tags'),
('gl_account_text', 'GL Accounts'),
('gl_account_group_text', 'GL Account Groups'),
('closing_text', 'Closing GL Transactions'),
('company_setup_text', 'Company Setup'),
('user_account_setup_text', 'user_account_setup_text'),
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
('sales_quotation_text', 'Sale Quotation Entry'),
('sales_quotation', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_trans_tax_details` ###

INSERT INTO `0_trans_tax_details` VALUES
('1', '13', '1', '2017-07-04', '1', '19', '1', '1', '0', '0', 'auto', NULL),
('2', '10', '1', '2017-07-04', '1', '19', '1', '1', '0', '0', '001/2017', '0'),
('3', '13', '2', '2017-07-04', '1', '19', '1', '1', '0', '0', 'auto', NULL),
('4', '10', '2', '2017-07-04', '1', '19', '1', '1', '0', '0', '002/2017', '0'),
('5', '13', '3', '2017-07-04', '1', '19', '1', '1', '0', '0', 'auto', NULL),
('6', '10', '3', '2017-07-04', '1', '19', '1', '1', '0', '0', '003/2017', '0');

### Structure of table `0_user_locations` ###

DROP TABLE IF EXISTS `0_user_locations`;

CREATE TABLE `0_user_locations` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `loc_code` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_user_locations` ###

INSERT INTO `0_user_locations` VALUES
('1', 'DEF', '1', '0'),
('2', 'DEF', '2', '0'),
('3', 'DEF', '3', '0'),
('7', 'DEF', '5', '0'),
('5', 'DEF', '6', '0'),
('6', 'DEF', '4', '0'),
('8', 'DEF', '7', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('1', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Administrator', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-07-31 00:06:10', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('4', 'aamir', '6a187acf3a64c7421e001b846201af97', 'Aamir Afaq Siddiqi', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-07-31 00:29:58', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('5', 'saleem', '81dc9bdb52d04dc20036dbd8313ed055', 'Saleemuddin', '10', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-07-05 06:17:36', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('6', 'hanif', '81dc9bdb52d04dc20036dbd8313ed055', '', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-07-04 05:44:26', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('7', 'aqadir', '81dc9bdb52d04dc20036dbd8313ed055', 'Abdul Qadir', '10', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
('10', '1', '2017-07-12', ''),
('10', '2', '2017-07-12', ''),
('10', '3', '2017-07-12', ''),
('13', '1', '2017-07-12', ''),
('13', '2', '2017-07-12', ''),
('13', '3', '2017-07-12', '');

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
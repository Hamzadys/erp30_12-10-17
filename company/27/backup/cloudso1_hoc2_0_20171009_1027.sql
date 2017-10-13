# MySQL dump of database 'cloudso1_hoc2' on host 'localhost'
# Backup Date and Time: 2017-10-09 10:27
# Built by Hisaab.pk 2.4.2
# http://www.hisaab.pk
# Company: HOC2
# User: Omer

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
  `opening` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  KEY `Type_and_Number` (`type`,`trans_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###


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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('1013-', '0', 'HBL  1905455', '7901905455 (B C 0212)', 'CHOUDHARY BROTHERS', 'GALLA MANDI VEHARI\n', 'PKR', '0', '25', '5036', '0000-00-00 00:00:00', '0', '0'),
('10412', '3', 'PATTY CASH', '', '', 'VHR', 'PKR', '0', '26', '5036', '0000-00-00 00:00:00', '0', '0'),
('10123', '0', 'UBL 240183635', '000240183635 (B C 0360)', 'UBL', 'GALLA MANDI VEHARI\nCH BROTHERS', 'PKR', '0', '27', '5036', '0000-00-00 00:00:00', '0', '0'),
('10125', '0', 'HBL 190', '', 'CH BROTHERS', NULL, 'PKR', '0', '28', '5036', '0000-00-00 00:00:00', '0', '1'),
('10126', '0', 'HBL 11111', '', '', NULL, 'PKR', '0', '29', '5036', '0000-00-00 00:00:00', '0', '1'),
('10417', '0', 'HBL CH   1905455', '', '', NULL, 'PKR', '0', '31', '5036', '0000-00-00 00:00:00', '0', '0'),
('10418', '0', 'MCB 7207', '0926675941007207', 'CHOUDHARY BROTHERS', 'GALLAH MANDI VEHARI', 'PKR', '0', '32', '5036', '0000-00-00 00:00:00', '0', '0'),
('10419', '0', 'ABL 20015', '0010046305520015', 'ABL ', 'GALLAH MANDI VEHARI (0402)', 'PKR', '0', '33', '5036', '0000-00-00 00:00:00', '0', '0'),
('10420', '0', 'PENDING CHEQUE', '', 'ALL BANK', 'VHR', 'PKR', '0', '34', '5036', '0000-00-00 00:00:00', '0', '0'),
('101211', '0', 'SARFARZ  DRIVER', '', 'A', NULL, 'PKR', '0', '35', '5036', '0000-00-00 00:00:00', '0', '1'),
('101212', '0', 'P RANA KHALID DRIVER', '', '', NULL, 'PKR', '0', '36', '5036', '0000-00-00 00:00:00', '0', '1'),
('101213', '0', 'P SAFDAR DRIVER', '', '', NULL, 'PKR', '0', '37', '5036', '0000-00-00 00:00:00', '0', '1'),
('101214', '0', 'P NAEEM DRIVER', '', '', NULL, 'PKR', '0', '38', '5036', '0000-00-00 00:00:00', '0', '1'),
('101215', '0', 'P AKBAR 6 TARPI DRIVER', '', '', NULL, 'PKR', '0', '39', '5036', '0000-00-00 00:00:00', '0', '1'),
('101217', '0', 'P AKMAL 6 TARPI DRIVER', '', '', NULL, 'PKR', '0', '40', '5036', '0000-00-00 00:00:00', '0', '1'),
('101216', '0', 'P AKBAR 5 CHAK', '', '', NULL, 'PKR', '0', '41', '5036', '0000-00-00 00:00:00', '0', '1'),
('10121', '0', 'ZAFAR DRIVER ZAFRI', '', '', NULL, 'PKR', '0', '42', '5036', '0000-00-00 00:00:00', '0', '1');

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
  `text_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_trans` ###


### Structure of table `0_batch` ###

DROP TABLE IF EXISTS `0_batch`;

CREATE TABLE `0_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `inactive` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ;

### Data of table `0_batch` ###

INSERT INTO `0_batch` VALUES
('1', '', '0');

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
('10121', '', 'BANK ACCOUNT', '1012', '0'),
('101211', '', 'P SARFARZ DRIVER SUMANDRI', '10121', '0'),
('101212', '', 'RANA KHALID', '10121', '0'),
('101213', '', 'SAFDAR DRIVER', '10121', '0'),
('101214', '', 'NAEEM DRIVER', '10121', '0'),
('101215', '', 'AKBAR 6 TARPI', '10121', '0'),
('101216', '', 'AKBAR 5 CHAK', '10121', '0'),
('101217', '', 'AKMAL 6 TARPI', '10121', '0'),
('101218', '', 'ZAFAR DRIVER ZAFRI', '10121', '0'),
('101219', 'NASEER  Driver', 'NASEER  Driver', '10121', '0'),
('10122', '10122', 'HBL 55', '1012', '0'),
('101220', '', 'AFZAL DRIVER 11/WB', '10121', '0'),
('101221', '', 'M.YOUSAF DRIVER', '10121', '0'),
('10123', '10123', 'UBL  635', '1012', '0'),
('10124', '', 'UBL ', '1012', '1'),
('10125', '10125', '', '1012', '0'),
('10126', '', '', '1012', '0'),
('1013', '', 'Accounts Receivables', '101', '0'),
('1021', '', 'Inventory', '102', '0'),
('10211', '10211', 'SWA 138', '505', '0'),
('10212', '10212', 'LS 4155', '505', '0'),
('10213', '10213', 'LSA 7519', '505', '0'),
('10214', '10214', 'TTD 397', '505', '0'),
('10215', '10215', 'MNQ 5186', '505', '0'),
('10216', '10216', 'SA 2055', '505', '0'),
('10217', '10217', 'GA 1830', '505', '0'),
('10218', '10218', 'C 1955', '505', '0'),
('10220', '10220', 'JQ 0166', '505', '0'),
('10221', '10221', 'JQ 0167', '505', '0'),
('10222', '', 'TLC 114 ', '505', '0'),
('10223', '', 'MNP 4757', '505', '0'),
('10224', '', 'BRG 6095 ', '505', '0'),
('10225', '', 'TMB 540 ', '505', '0'),
('1023', '', 'Stocks of Work In Progress', '503', '1'),
('1031', '', 'Office Furniture and Equipment', '103', '0'),
('1033', '', 'Vehicle', '103', '0'),
('1035', '1035', 'OPNING BALLANCE', '301', '0'),
('1041', '', 'HASCOL CARRIAGE BILLS', '105', '0'),
('10411', '', 'ACCOUNT RECEIVABLE', '101', '0'),
('10412', '10412', 'PATTY CASH', '101', '0'),
('10413', '10413', 'ZULFIQAR ALI', '101', '1'),
('10414', '10414', 'IFTIKHAR AHMED', '101', '1'),
('10415', '10415', 'M ZUBAIR', '101', '1'),
('10416', '10416', 'OMER FAROOQ', '101', '1'),
('10417', '', 'HBL CH BROTHERS', '1012', '0'),
('10418', '', 'MCB CH BROTHER', '1012', '0'),
('10419', '', 'ABL 5520015', '1012', '0'),
('10420', '', 'Pending Cheque', '1012', '0'),
('2011', '', 'Accounts Payable', '201', '0'),
('2012', '', 'INCENTIVE', '201', '0'),
('2013', '', 'GST Input', '101', '1'),
('2014', '', 'GST Output', '101', '1'),
('2021', '', 'Bank Loans', '202', '0'),
('2022', '', 'Loans from Shareholders', '202', '0'),
('3012', '3012.1', 'SHEAR CAPTAIL', '301', '0'),
('3021', '', 'Reserves and Surplus', '302', '0'),
('4011', '', 'Sales Revenue', '401', '0'),
('4021', '', 'Shipping and Handling', '402', '0'),
('4023', '', 'Foreign Exchange Gain', '101', '1'),
('4025', '', 'Discounts Given', '101', '1'),
('4031', '', '6095 BRG PTO INCOME', '403', '0'),
('4032', '', '0166 JQ PTO INCOME ', '403', '0'),
('5011', '', 'Cost of Goods Sold - Retail', '501', '0'),
('5012', '', 'DIP SHORT LOSSES', '501', '0'),
('5014', '', 'Purchase Price Variance', '101', '1'),
('5016', '', 'Discounts Received', '101', '1'),
('5017', '', 'Freight', '501', '0'),
('5021', '', 'SARFARZ DRIVER SUMANDRI', '502', '0'),
('50210', '', 'AKBAR 5 CHAK DRIVER', '502', '0'),
('50211', '', 'NAEEM DRIVER', '502', '0'),
('50212', '', 'SAFDAR HUSSAIN 6 TARPI DRIVER', '502', '0'),
('50213', '', 'AZAR HUSSAIN HELPER', '502', '0'),
('50214', '', 'QASER HUSSAIN HELPER', '502', '0'),
('50215', '', 'SAJJAD HUSSAIN HELPER', '502', '0'),
('50216', '', 'IKRAM JAVED', '502', '0'),
('50217', '', 'GHULAM MUSTAFA ', '502', '0'),
('50218', '', 'AKTHAR ALI ', '502', '0'),
('50219', '', 'ATIQ UL REHMAN', '502', '0'),
('5022', '', 'ZAFAR IQBAL DRIVER', '502', '0'),
('50220', '', 'ABDUL GHAFOOR ', '502', '0'),
('50221', '', 'AQIB IQBAL', '502', '0'),
('50222', '', 'INTAZAR DRIVER', '502', '0'),
('5023', '', 'M AFZAL DRIVER', '502', '0'),
('5024', '', 'ABDUL AL ISLAM DRIVER', '502', '0'),
('5025', '', 'M YOUSEF DRIVER', '502', '0'),
('5026', '', 'NASEER DRIVER', '502', '0'),
('5027', '', 'RANA KHALID DRIVER', '502', '0'),
('5028', '', 'AKMAL 6 TARPI DRIVER', '502', '0'),
('5029', '', 'AKBAR 6 TARPI DRIVER', '502', '0'),
('5030', '', 'Profit and Loss', '101', '1'),
('5032', '', 'MOBILE EXP', '503', '0'),
('5033', '', 'ENTERTAINMENT', '503', '0'),
('5034', '', 'MISc.', '503', '0'),
('5035', '', 'Bank Charges', '503', '0'),
('5036', '', 'Interest and Bank Charges', '101', '1'),
('5037', '', 'Bank MISc', '503', '0'),
('5038', '', 'WHT Bank', '503', '0'),
('50511', '', '0166 JQ PTO EXPS', '5052', '1');

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
('1012', 'Bank', '10', '101', '0'),
('10121', 'P ADVANCES	', '10', '1012', '0'),
('102', 'Inventory Assets', '10', '', '0'),
('103', 'Fixed Assets', '10', '', '0'),
('105', 'CARRIAGE BILL ', '10', '', '0'),
('201', 'Current Liabilities', '20', '', '0'),
('202', 'Long Term Liabilities', '20', '', '0'),
('301', 'Share Capital', '30', '', '0'),
('302', 'Retained Earnings', '30', '', '0'),
('401', 'Sales Revenue', '40', '', '0'),
('402', 'Other Revenue', '40', '', '0'),
('403', 'PTO VEHICLE  INCOME', '40', '', '0'),
('501', 'Cost of Goods Sold', '50', '', '0'),
('502', 'Payroll Expenses', '50', '', '0'),
('503', 'General &amp; Administrative Expenses', '50', '', '0'),
('505', 'VEHICLE EXP', '50', '', '0'),
('5052', 'PTO VEHICLE EXPS', '50', '505', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_item_1` ###


### Structure of table `0_combo_item_2` ###

DROP TABLE IF EXISTS `0_combo_item_2`;

CREATE TABLE `0_combo_item_2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_item_2` ###


### Structure of table `0_combo_item_3` ###

DROP TABLE IF EXISTS `0_combo_item_3`;

CREATE TABLE `0_combo_item_3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_item_3` ###


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
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('2', '1', 'customer', 'general', '1'),
('4', '2', 'customer', 'general', '2'),
('6', '3', 'customer', 'general', '3'),
('8', '4', 'customer', 'general', '4'),
('10', '5', 'customer', 'general', '5'),
('12', '6', 'customer', 'general', '6'),
('14', '7', 'customer', 'general', '7'),
('16', '8', 'customer', 'general', '8'),
('18', '9', 'customer', 'general', '9'),
('20', '10', 'customer', 'general', '10'),
('22', '11', 'customer', 'general', '11'),
('24', '12', 'customer', 'general', '12'),
('26', '13', 'customer', 'general', '13'),
('28', '14', 'customer', 'general', '14'),
('30', '15', 'customer', 'general', '15'),
('34', '17', 'customer', 'general', '17'),
('36', '18', 'customer', 'general', '18'),
('38', '19', 'customer', 'general', '19'),
('40', '20', 'customer', 'general', '20'),
('42', '21', 'customer', 'general', '21'),
('44', '22', 'customer', 'general', '22'),
('46', '23', 'customer', 'general', '23'),
('48', '24', 'customer', 'general', '24'),
('50', '25', 'customer', 'general', '25'),
('52', '26', 'customer', 'general', '26'),
('54', '27', 'customer', 'general', '27'),
('56', '28', 'customer', 'general', '28'),
('58', '29', 'customer', 'general', '29'),
('60', '30', 'customer', 'general', '30'),
('62', '31', 'customer', 'general', '31'),
('64', '32', 'customer', 'general', '32'),
('66', '33', 'customer', 'general', '33'),
('68', '34', 'customer', 'general', '34'),
('69', '35', 'supplier', 'general', '1'),
('70', '36', 'supplier', 'general', '2'),
('71', '37', 'supplier', 'general', '3'),
('72', '38', 'supplier', 'general', '4'),
('73', '39', 'supplier', 'general', '5'),
('74', '40', 'supplier', 'general', '6'),
('76', '41', 'customer', 'general', '35'),
('78', '42', 'customer', 'general', '36'),
('80', '43', 'customer', 'general', '37'),
('91', '52', 'customer', 'general', '39'),
('93', '53', 'customer', 'general', '40'),
('96', '55', 'supplier', 'general', '7'),
('98', '56', 'customer', 'general', '42'),
('100', '57', 'customer', 'general', '43'),
('102', '58', 'customer', 'general', '44'),
('104', '59', 'customer', 'general', '45'),
('106', '60', 'customer', 'general', '46'),
('108', '61', 'customer', 'general', '47'),
('110', '62', 'customer', 'general', '48'),
('111', '63', 'supplier', 'general', '8'),
('113', '64', 'customer', 'general', '49'),
('114', '65', 'cust_branch', 'general', '57'),
('115', '66', 'cust_branch', 'general', '58'),
('116', '67', 'cust_branch', 'general', '59'),
('117', '68', 'cust_branch', 'general', '60'),
('118', '69', 'cust_branch', 'general', '61'),
('119', '70', 'cust_branch', 'general', '62'),
('120', '71', 'cust_branch', 'general', '63'),
('121', '72', 'cust_branch', 'general', '64'),
('122', '73', 'cust_branch', 'general', '65'),
('123', '74', 'cust_branch', 'general', '66'),
('124', '75', 'cust_branch', 'general', '67'),
('125', '76', 'cust_branch', 'general', '68'),
('126', '77', 'cust_branch', 'general', '69'),
('127', '78', 'cust_branch', 'general', '70'),
('128', '79', 'cust_branch', 'general', '71'),
('129', '80', 'cust_branch', 'general', '72'),
('130', '81', 'cust_branch', 'general', '73'),
('131', '82', 'cust_branch', 'general', '74'),
('132', '83', 'cust_branch', 'general', '75'),
('133', '84', 'cust_branch', 'general', '76'),
('134', '85', 'cust_branch', 'general', '77'),
('135', '86', 'cust_branch', 'general', '78'),
('136', '87', 'cust_branch', 'general', '79'),
('137', '88', 'cust_branch', 'general', '80'),
('138', '89', 'cust_branch', 'general', '81'),
('139', '90', 'cust_branch', 'general', '82'),
('140', '91', 'cust_branch', 'general', '83'),
('141', '92', 'cust_branch', 'general', '84'),
('142', '93', 'cust_branch', 'general', '85'),
('143', '94', 'cust_branch', 'general', '86'),
('144', '95', 'cust_branch', 'general', '87'),
('145', '96', 'cust_branch', 'general', '88'),
('146', '97', 'cust_branch', 'general', '89'),
('148', '99', 'cust_branch', 'general', '91'),
('149', '100', 'cust_branch', 'general', '92'),
('150', '101', 'cust_branch', 'general', '93'),
('151', '102', 'cust_branch', 'general', '94'),
('152', '103', 'cust_branch', 'general', '95'),
('153', '104', 'cust_branch', 'general', '96'),
('154', '105', 'cust_branch', 'general', '97'),
('155', '106', 'cust_branch', 'general', '98'),
('156', '107', 'cust_branch', 'general', '99'),
('157', '108', 'cust_branch', 'general', '100'),
('158', '109', 'cust_branch', 'general', '101'),
('159', '110', 'cust_branch', 'general', '102'),
('160', '98', 'cust_branch', 'general', '90'),
('163', '112', 'cust_branch', 'general', '104'),
('164', '112', 'customer', 'general', '51'),
('165', '113', 'cust_branch', 'general', '105'),
('166', '113', 'customer', 'general', '52'),
('167', '114', 'cust_branch', 'general', '106'),
('168', '114', 'customer', 'general', '53'),
('169', '115', 'cust_branch', 'general', '107'),
('170', '115', 'customer', 'general', '54'),
('171', '116', 'cust_branch', 'general', '108'),
('172', '116', 'customer', 'general', '55'),
('173', '117', 'cust_branch', 'general', '109'),
('174', '117', 'customer', 'general', '56'),
('175', '118', 'supplier', 'general', '7'),
('176', '119', 'supplier', 'general', '8'),
('177', '120', 'supplier', 'general', '9'),
('178', '121', 'supplier', 'general', '10'),
('179', '122', 'cust_branch', 'general', '110'),
('180', '122', 'customer', 'general', '57'),
('181', '123', 'cust_branch', 'general', '111'),
('182', '123', 'customer', 'general', '58'),
('183', '124', 'cust_branch', 'general', '112'),
('184', '125', 'cust_branch', 'general', '113'),
('185', '125', 'customer', 'general', '59'),
('186', '126', 'cust_branch', 'general', '114'),
('187', '126', 'customer', 'general', '60'),
('188', '127', 'cust_branch', 'general', '115'),
('189', '127', 'customer', 'general', '61'),
('190', '128', 'cust_branch', 'general', '116'),
('191', '128', 'customer', 'general', '62'),
('192', '129', 'cust_branch', 'general', '117'),
('193', '129', 'customer', 'general', '64'),
('194', '130', 'cust_branch', 'general', '118'),
('195', '130', 'customer', 'general', '65'),
('196', '131', 'cust_branch', 'general', '119'),
('197', '131', 'customer', 'general', '66'),
('198', '132', 'cust_branch', 'general', '120'),
('199', '132', 'customer', 'general', '67'),
('200', '133', 'cust_branch', 'general', '121'),
('201', '133', 'customer', 'general', '68'),
('202', '134', 'cust_branch', 'general', '122'),
('203', '134', 'customer', 'general', '69'),
('204', '135', 'cust_branch', 'general', '123'),
('205', '136', 'supplier', 'general', '11'),
('206', '137', 'supplier', 'general', '12'),
('207', '138', 'cust_branch', 'general', '124'),
('208', '138', 'customer', 'general', '70'),
('209', '139', 'cust_branch', 'general', '125'),
('210', '139', 'customer', 'general', '71'),
('211', '140', 'cust_branch', 'general', '126'),
('212', '140', 'customer', 'general', '72'),
('213', '141', 'cust_branch', 'general', '127'),
('214', '141', 'customer', 'general', '73'),
('215', '142', 'cust_branch', 'general', '128'),
('216', '142', 'customer', 'general', '74'),
('219', '144', 'cust_branch', 'general', '130'),
('220', '144', 'customer', 'general', '76'),
('221', '145', 'cust_branch', 'general', '131'),
('222', '145', 'customer', 'general', '77'),
('223', '146', 'cust_branch', 'general', '132'),
('224', '146', 'customer', 'general', '78'),
('225', '147', 'supplier', 'general', '13'),
('226', '148', 'cust_branch', 'general', '133'),
('227', '148', 'customer', 'general', '79'),
('228', '149', 'cust_branch', 'general', '134'),
('229', '149', 'customer', 'general', '80'),
('230', '150', 'cust_branch', 'general', '135'),
('231', '150', 'customer', 'general', '81'),
('232', '151', 'cust_branch', 'general', '136'),
('233', '151', 'customer', 'general', '82'),
('234', '152', 'cust_branch', 'general', '137'),
('235', '152', 'customer', 'general', '83'),
('236', '153', 'cust_branch', 'general', '138'),
('237', '153', 'customer', 'general', '84'),
('238', '154', 'cust_branch', 'general', '139'),
('239', '154', 'customer', 'general', '85'),
('240', '155', 'supplier', 'general', '14'),
('241', '156', 'cust_branch', 'general', '140'),
('242', '156', 'customer', 'general', '86'),
('243', '157', 'cust_branch', 'general', '141'),
('244', '157', 'customer', 'general', '87'),
('245', '158', 'cust_branch', 'general', '142'),
('246', '158', 'customer', 'general', '88'),
('247', '159', 'cust_branch', 'general', '143'),
('248', '159', 'customer', 'general', '89'),
('249', '160', 'supplier', 'general', '15'),
('250', '161', 'cust_branch', 'general', '144'),
('251', '161', 'customer', 'general', '90'),
('252', '162', 'cust_branch', 'general', '145'),
('253', '162', 'customer', 'general', '91'),
('254', '163', 'cust_branch', 'general', '146'),
('255', '163', 'customer', 'general', '92'),
('256', '164', 'cust_branch', 'general', '147'),
('257', '164', 'customer', 'general', '93'),
('258', '165', 'cust_branch', 'general', '148'),
('259', '165', 'customer', 'general', '94'),
('260', '166', 'cust_branch', 'general', '149'),
('261', '166', 'customer', 'general', '95'),
('262', '167', 'cust_branch', 'general', '150'),
('263', '167', 'customer', 'general', '96'),
('264', '168', 'cust_branch', 'general', '151'),
('265', '168', 'customer', 'general', '97'),
('266', '169', 'cust_branch', 'general', '152'),
('267', '169', 'customer', 'general', '98');

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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', 'ALTAF  HUSSAIN AGNCY', 'ALTAF  HUSSAIN AGNCY', NULL, 'POLL GARDAR', '03017936427', NULL, NULL, NULL, NULL, '', '0'),
('2', 'RANA AMJAD', 'RANA AMJAD', NULL, 'CHAK 567/EB ', '03026575867', NULL, NULL, NULL, NULL, '', '0'),
('3', 'AL MADINA  HOC', 'AL MADINA  HOC', NULL, 'KABIRWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('4', 'Al BARKAT HOC', 'Al BARKAT HOC', NULL, 'GAIZA ABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('5', 'Al HAJJ PS(HOC)', 'Al HAJJ PS(HOC)', NULL, 'DOKOTA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('6', 'BAGHA HASILPUR', 'BAGHA HASILPUR', NULL, 'HASILPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('7', 'HASSAIN SOHAIL', 'HASSAIN SOHAIL', NULL, 'PULL BAGAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('8', 'DEOL BROTHERS (HOC)', 'DEOL BROTHERS (HOC)', NULL, '9 DOHIYAN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('9', 'RAFIQ PAKHIMOR  ', 'RAFIQ PAKHIMOR  ', NULL, 'PAKHIMOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('10', 'SALEEM P/S (HOC)', 'SALEEM P/S (HOC)', NULL, 'SAHOKA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('11', 'SATLUJJ P/S', 'SATLUJJ P/S', NULL, 'LUDDEN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('12', 'SARWAR P/S', 'SARWAR P/S', NULL, 'CHAK NO 50', NULL, NULL, NULL, NULL, NULL, '', '0'),
('13', 'SHOKAT SEHAR (PSO)', 'SHOKAT SEHAR (PSO)', NULL, 'SEHRAYA WALA ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('14', 'SHRAFAT BAHTTI', 'SHRAFAT BAHTTI', NULL, '48 POLL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('15', 'TAHIR IQBAL', 'TAHIR IQBAL', NULL, 'CHAK 159', NULL, NULL, NULL, NULL, NULL, '', '0'),
('16', 'ARBAN F/S', 'ARBAN F/S', NULL, 'BAHAWALPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('17', 'ARBAN F/S', 'ARBAN F/S', NULL, 'BAHAWALPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('18', 'ABAD UL REHAMAN', 'ABAD UL REHAMAN', NULL, 'MANA MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('19', 'ABDUL JABBAR', 'ABDUL JABBAR', NULL, 'SHALLI GARBI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('20', 'ABDUL LATIF KLASRA', 'ABDUL LATIF KLASRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('21', 'IRFAN BHAWALNAGER', 'IRFAN BHAWALNAGER', NULL, 'BHAWALNAGER', NULL, NULL, NULL, NULL, NULL, '', '0'),
('22', 'GULLAM YASEEN', 'GULLAM YASEEN', NULL, 'BAGH ARIYAN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('23', 'FAZAL KHAN', 'FAZAL KHAN', NULL, 'SAIDIQA ABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('24', 'QARI P/S', 'QARI P/S', NULL, 'JALAL PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('25', 'FOJI OIL', 'FOJI OIL', NULL, 'KHAN PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('26', 'ZAMINDARA  CO', 'ZAMINDARA  CO', NULL, 'VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('27', 'KAZIM SHAH', 'KAZIM SHAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('28', 'LALAN WALA', 'LALAN WALA', NULL, 'BUREWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('29', 'MAKHAN P/S', 'MAKHAN P/S', NULL, 'GAGOO', NULL, NULL, NULL, NULL, NULL, '', '0'),
('30', 'NAWAB KHAN', 'NAWAB KHAN', NULL, 'PULL GARDER', NULL, NULL, NULL, NULL, NULL, '', '0'),
('31', 'NABEEL AKBER', 'NABEEL AKBER', NULL, '37 PHATAK BUREWLA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('32', 'NAWAB P/S JAMLAIRA', 'NAWAB P/S JAMLAIRA', NULL, 'JAMLAIRA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('33', 'NAWAB SONS ', 'NAWAB SONS ', NULL, '35 MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('34', 'WATOO P/S ', 'WATOO P/S ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('35', 'SHELL PAKISTAN LIMITED', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('36', 'HORIZON OIL COMPANY', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('37', 'HAROONABAD', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('38', 'MUNIER CARRIAGE CO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('39', 'HASCOL (SAIFULLAH)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('40', 'BAKRI', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('41', 'HAFIZ PS', 'HAFIZ PS', NULL, '48 PULL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('42', 'FRIENDS P/S', 'FRIENDS P/S', NULL, 'KHANEWAL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('43', 'NADIR  P/S', 'NADIR  P/S', NULL, '35 CHAK', NULL, NULL, NULL, NULL, NULL, '', '0'),
('44', 'OPENING BALANCE', 'OPENING BALANCE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('45', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('46', 'Main Branch', 'Main Branch', NULL, 'MANA MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('47', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('48', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('49', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('50', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('51', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('52', 'VEHARI P/S', 'VEHARI P/S', NULL, 'V CHOCK VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('53', 'Noman P/S', 'Noman P/S', NULL, 'Garrah Mor', '03000738016', NULL, NULL, NULL, NULL, '', '0'),
('54', 'ON WHEEL', 'ON WHEEL', NULL, 'VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('55', 'ON WHEEL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('56', 'DUBAI P/S', 'DUBAI P/S', NULL, 'DARANAWALA ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('57', 'ABDUL GHAFFAR', 'ABDUL GHAFFAR', NULL, 'CHAK NO 553 ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('58', 'Fiaz and Abid', 'Fiaz and Abid', NULL, 'chak no 228', NULL, NULL, NULL, NULL, NULL, '', '0'),
('59', 'Mailsi P/S', 'Mailsi P/S', NULL, 'Mailsi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('60', 'AL_HAMMD  F/S', 'AL_HAMMD  F/S', NULL, 'BUREWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('61', 'ALLAH BAHKSH', 'ALLAH BAHKSH', NULL, 'SUJJAH ABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('62', 'AHMAD F/S', 'AHMAD F/S', NULL, 'LIAQUT PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('63', 'Z SUSPENSE ACCOUNT', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('64', 'JAVAID FSD ', 'JAVAID  FAISLABAD', NULL, 'FAISLABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('65', 'Main Branch', 'Main Branch', NULL, 'MANA MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('66', 'Main Branch', 'Main Branch', NULL, 'CHAK NO 553 ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('67', 'Main Branch', 'Main Branch', NULL, 'SHALLI GARBI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('68', 'Main Branch', 'Main Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('69', 'Main Branch', 'Main Branch', NULL, 'LIAQUT PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('70', 'Main Branch', 'Main Branch', NULL, 'GAIZA ABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('71', 'Main Branch', 'Main Branch', NULL, 'DOKOTA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('72', 'Main Branch', 'Main Branch', NULL, 'KABIRWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('73', 'Main Branch', 'Main Branch', NULL, 'BUREWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('74', 'Main Branch', 'Main Branch', NULL, 'SUJJAH ABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('75', 'Main Branch', 'Main Branch', NULL, 'POLL GARDAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('76', 'Main Branch', 'Main Branch', NULL, 'BAHAWALPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('77', 'Main Branch', 'Main Branch', NULL, 'HASILPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('78', 'Main Branch', 'Main Branch', NULL, '9 DOHIYAN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('79', 'Main Branch', 'Main Branch', NULL, 'DARANAWALA ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('80', 'Main Branch', 'Main Branch', NULL, 'SAIDIQA ABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('81', 'Main Branch', 'Main Branch', NULL, 'chak no 228', NULL, NULL, NULL, NULL, NULL, '', '0'),
('82', 'Main Branch', 'Main Branch', NULL, 'KHAN PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('83', 'Main Branch', 'Main Branch', NULL, 'KHANEWAL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('84', 'Main Branch', 'Main Branch', NULL, 'BAGH ARIYAN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('85', 'Main Branch', 'Main Branch', NULL, '48 PULL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('86', 'Main Branch', 'Main Branch', NULL, 'PULL BAGAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('87', 'Main Branch', 'Main Branch', NULL, 'BHAWALNAGER', NULL, NULL, NULL, NULL, NULL, '', '0'),
('88', 'Main Branch', 'Main Branch', NULL, 'FAISLABAD', NULL, NULL, NULL, NULL, NULL, '', '0'),
('89', 'Main Branch', 'Main Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('90', 'Main Branch', 'Main Branch', NULL, 'BUREWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('91', 'Main Branch', 'Main Branch', NULL, 'Mailsi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('92', 'Main Branch', 'Main Branch', NULL, 'GAGOO', NULL, NULL, NULL, NULL, NULL, '', '0'),
('93', 'Main Branch', 'Main Branch', NULL, '37 PHATAK BUREWLA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('94', 'Main Branch', 'Main Branch', NULL, '35 CHAK', NULL, NULL, NULL, NULL, NULL, '', '0'),
('95', 'Main Branch', 'Main Branch', NULL, 'PULL GARDER', NULL, NULL, NULL, NULL, NULL, '', '0'),
('96', 'Main Branch', 'Main Branch', NULL, 'JAMLAIRA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('97', 'Main Branch', 'Main Branch', NULL, '35 MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('98', 'Main Branch', 'Main Branch', NULL, 'Garrah Mor', '0', '0', '0', '0', NULL, '0', '0'),
('99', 'Main Branch', 'Main Branch', NULL, 'JALAL PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('100', 'Main Branch', 'Main Branch', NULL, 'PAKHIMOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('101', 'Main Branch', 'Main Branch', NULL, 'CHAK 567/EB ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('102', 'Main Branch', 'Main Branch', NULL, 'SAHOKA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('103', 'Main Branch', 'Main Branch', NULL, 'CHAK NO 50', NULL, NULL, NULL, NULL, NULL, '', '0'),
('104', 'Main Branch', 'Main Branch', NULL, 'LUDDEN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('105', 'Main Branch', 'Main Branch', NULL, 'SEHRAYA WALA ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('106', 'Main Branch', 'Main Branch', NULL, '48 POLL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('107', 'Main Branch', 'Main Branch', NULL, 'CHAK 159', NULL, NULL, NULL, NULL, NULL, '', '0'),
('108', 'Main Branch', 'Main Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('109', 'Main Branch', 'Main Branch', NULL, 'VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('110', 'Main Branch', 'Main Branch', NULL, 'V CHOCK VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('111', 'd', 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('112', 'RAO AFSAR PETROLEUM SERVICES', 'RAO AFSAR PETROLEUM SERVICES', NULL, 'MAIN PAKKI ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('113', 'SOFI ASHRAF', 'SOFI ASHRAF', NULL, 'CHAK NO 73/WB VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('114', 'ZEESHAN PETROLEUM SERVICES', 'ZEESHAN PETROLEUM SERVICES', NULL, 'CHAK NO 63/WB', NULL, NULL, NULL, NULL, NULL, '', '0'),
('115', 'GHMANPETROLEUM SERVICES', 'GHMANPETROLEUM SERVICES', NULL, 'JAH SHYAL', NULL, NULL, NULL, NULL, NULL, '', '0'),
('116', 'AMEN BROTHERS', 'AMEN BROTHERS', NULL, 'GHRA MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('117', 'HAJI BAGHA', 'HAJI BAGHA', NULL, 'SAFIEN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('118', 'PSO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('119', 'CH P/S  PSO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('120', 'AMIN BROTHERS PSO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('121', 'PSO GENERAL', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('122', 'AL- WASI   P/S', 'AL- WASI   P/S', NULL, 'SHATAB GHAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('123', 'QAZI  KALRAA  P/S', 'QAZI  KALRAA  P/S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('124', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('125', 'AL KAMAL P/S', 'AL KAMAL P/S', NULL, 'JAMLARA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('126', 'RAB RAKHA F/S', 'RAB RAKHA F/S', NULL, 'RAB RAKHA MOR VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('127', 'SHAFIQ P/S', 'SHAFIQ P/S', NULL, 'HASIPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('128', 'KHAWJA P/S', 'KHAWJA P/S', NULL, 'MAIN PAKI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('129', 'NADEEM KHALI SHAH', 'NADEEM KHALI SHAH', NULL, 'KHALI SHAH', NULL, NULL, NULL, NULL, NULL, '', '0'),
('130', 'KHAWAR ABBAS ', 'KHAWAR ABBAS ', NULL, '77', NULL, NULL, NULL, NULL, NULL, '', '0'),
('131', 'HAQ BAHOO', 'HAQ BAHOO', NULL, 'LUDDEN ROAD ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('132', 'MISc CUSTOMER', 'MISc CUSTOMER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('133', 'NASIR P/S', 'NASIR P/S', NULL, 'PUL RANGOO', NULL, NULL, NULL, NULL, NULL, '', '0'),
('134', 'IQBAL  SHARON P/S', 'IQBAL  SHARON P/S', NULL, 'VHRI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('135', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('136', ' PSO KHURSHEED', '', NULL, 'VHR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('137', 'PSO GHUMAN P/S', '', NULL, 'VHR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('138', ' SARDAR GILL P/S', 'SARDAR GILL P/S', NULL, 'HASSILPUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('139', 'SAJID SHAH KALI SHAH', 'SAJID SHAH KALI SHAH', NULL, 'KALI SHAH', NULL, NULL, NULL, NULL, NULL, '', '0'),
('140', 'SYED FAQEER HUSSAIN ', 'SYED FAQEER HUSSAIN ', NULL, 'MOZA DHARLA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('141', 'MIAN TAYYAB  PS', 'MIAN TAYYAB  PS', NULL, 'BHAWALNAGAR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('142', 'MALIK GHAFOOR WAH  PS', 'MALIK GHAFOOR WAH  PS', NULL, ' GHAFOR WAH', NULL, NULL, NULL, NULL, NULL, '', '0'),
('143', 'QAISER  PS', 'QAISER  PS', NULL, 'MURAD WAH', NULL, NULL, NULL, NULL, NULL, '', '0'),
('144', 'AL WAHAAB OIL AGCY ', 'AL WAHAAB OIL AGCY ', NULL, 'BASTI PULER', NULL, NULL, NULL, NULL, NULL, '', '0'),
('145', 'MALIK WARYAM 58', 'MALIK WARYAM 58', NULL, '58', NULL, NULL, NULL, NULL, NULL, '', '0'),
('146', 'JAAN', 'JAAN', NULL, 'JAAN', NULL, NULL, NULL, NULL, NULL, '', '0'),
('147', 'PSO BASHIR', '', NULL, 'VHR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('148', 'ALLAH TAWAKAL PS', 'ALLAH TAWAKAL PS', NULL, 'JAMLIRA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('149', 'FOJI  ABDUL RASHEED  22 LOT', 'FOJI  ABDUL RASHEED  22 LOT', NULL, '22  LOT', NULL, NULL, NULL, NULL, NULL, '', '0'),
('150', 'MISTRI   IQBAL', 'MISTRI   IQBAL', NULL, 'VHRI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('151', 'HAJI MUNIEER ', 'HAJI MUNIEER ', NULL, 'DHAHRA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('152', 'MAQBOOL AHMED', 'MAQBOOL AHMED', NULL, 'D', NULL, NULL, NULL, NULL, NULL, '', '0'),
('153', 'RANA AFZAL ', 'RANA AFZAL ', NULL, 'MAIN PAKI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('154', 'MUJAHID OIL AGNCY', 'MUJAHID OIL AGNCY', NULL, 'VEHARI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('155', 'MADINA PSO', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('156', 'Choudhary P/S', 'Choudhary P/S', NULL, 'CHICHAWATNI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('157', 'BASHIR &amp; SONS', 'BASHIR &amp; SONS', NULL, '27 BHATA ', NULL, NULL, NULL, NULL, NULL, '', '0'),
('158', 'ZAHOOR RATTA TIBBA', 'ZAHOOR RATTA TIBBA', NULL, 'RATTA TIBBA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('159', 'MARHABA  P/S', 'MARHABA  P/S', NULL, 'VHRI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('160', 'PSO C/H.2', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('161', 'USMAN  SHELI GHARBI', 'USMAN  SHELI GHARBI', NULL, 'USMAN  SHELI GHARBI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('162', 'QAISER  ABBAS DHRALA', 'QAISER  ABBAS DHRALA', NULL, ' DHRALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('163', 'ASLAM KHAN TIBA', 'ASLAM KHAN TIBA', NULL, 'TIBA SULTAN PUR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('164', 'NAVEED SAGAR PAKI MOR', 'NAVEED SAGAR PAKI MOR', NULL, 'PAKI MOR', NULL, NULL, NULL, NULL, NULL, '', '0'),
('165', 'SHABBIR AHMED PS', 'SHABBIR AHMED PS', NULL, 'VHRI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('166', 'WAHEED AHMED PS', 'WAHEED AHMED PS', NULL, 'VHRI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('167', 'LAIQAT PS .HARI CHAND', 'LAIQAT PS .HARI CHAND', NULL, 'HARI CHAND  MAILSI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('168', 'WARIS P/S   37', 'WARIS P/S   37', NULL, '37 PHATAK    BUREWALA', NULL, NULL, NULL, NULL, NULL, '', '0'),
('169', 'ASLAM BALOCH  PS', 'ASLAM BALOCH  PS', NULL, 'BHATTA  UMER DIN', NULL, NULL, NULL, NULL, NULL, '', '0');

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
  `contact_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_trans` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`branch_code`,`debtor_no`),
  KEY `branch_ref` (`branch_ref`),
  KEY `group_no` (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('57', '18', 'ABAD UL REHAMAN', 'ABAD UL REHAMAN', 'MANA MOR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'MANA MOR', '0', '', NULL, '0', NULL, NULL),
('58', '43', 'ABDUL GHAFFAR', 'ABDUL GHAFFAR', 'CHAK NO 553 ', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'CHAK NO 553 ', '0', '', NULL, '0', NULL, NULL),
('59', '19', 'ABDUL JABBAR', 'ABDUL JABBAR', 'SHALLI GARBI', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'SHALLI GARBI', '0', '', NULL, '0', NULL, NULL),
('60', '20', 'ABDUL LATIF KLASRA', 'ABDUL LATIF KLASRA', '', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('61', '48', 'AHMAD F/S', 'AHMAD F/S', 'LIAQUT PUR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'LIAQUT PUR', '0', '', NULL, '0', NULL, NULL),
('62', '4', 'Al BARKAT HOC', 'Al BARKAT HOC', 'GAIZA ABAD', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'GAIZA ABAD', '0', '', NULL, '0', NULL, NULL),
('63', '5', 'Al HAJJ PS(HOC)', 'Al HAJJ PS(HOC)', 'DOKOTA', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'DOKOTA', '0', '', NULL, '0', NULL, NULL),
('64', '3', 'AL MADINA  HOC', 'AL MADINA  HOC', 'KABIRWALA', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'KABIRWALA', '0', '', NULL, '0', NULL, NULL),
('65', '46', 'AL_HAMMD  F/S', 'AL_HAMMD  F/S', 'BUREWALA', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'BUREWALA', '0', '', NULL, '0', NULL, NULL),
('66', '47', 'ALLAH BAHKSH', 'ALLAH BAHKSH', 'SUJJAH ABAD', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'SUJJAH ABAD', '0', '', NULL, '0', NULL, NULL),
('67', '1', 'ALTAF  HUSSAIN AGNCY', 'ALTAF  HUSSAIN AGNCY', 'POLL GARDAR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'POLL GARDAR', '0', '', NULL, '0', NULL, NULL),
('68', '17', 'ARABIAN F/S', 'ARABIAN F/S', 'BAHAWALPUR', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'BAHAWALPUR', '0', '', NULL, '0', NULL, NULL),
('69', '6', 'BAGHA HASILPUR', 'BAGHA HASILPUR', 'HASILPUR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'HASILPUR', '0', '', NULL, '0', NULL, NULL),
('70', '8', 'DEOL BROTHERS (HOC)', 'DEOL BROTHERS (HOC)', '9 DOHIYAN', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '9 DOHIYAN', '0', '', NULL, '0', NULL, NULL),
('71', '42', 'DUBAI P/S', 'DUBAI P/S', 'DARANAWALA ', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'DARANAWALA ', '0', '', NULL, '0', NULL, NULL),
('72', '23', 'FAZAL KHAN', 'FAZAL KHAN', 'SAIDIQA ABAD', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'SAIDIQA ABAD', '0', '', NULL, '0', NULL, NULL),
('73', '44', 'FIAZ AND ABID', 'FIAZ AND ABID', 'chak no 228', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'chak no 228', '0', '', NULL, '0', NULL, NULL),
('74', '25', 'FOJI OIL', 'FOJI OIL', 'KHAN PUR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'KHAN PUR', '0', '', NULL, '0', NULL, NULL),
('75', '36', 'FRIENDS P/S', 'FRIENDS P/S', 'KHANEWAL', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'KHANEWAL', '0', '', NULL, '0', NULL, NULL),
('76', '22', 'GULLAM YASEEN', 'GULLAM YASEEN', 'BAGH ARIYAN', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'BAGH ARIYAN', '0', '', NULL, '0', NULL, NULL),
('77', '35', 'HAFIZ PS', 'HAFIZ PS', '48 PULL', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '48 PULL', '0', '', NULL, '0', NULL, NULL),
('78', '7', 'HASSAIN SOHAIL', 'HASSAIN SOHAIL', 'PULL BAGAR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'PULL BAGAR', '0', '', NULL, '0', NULL, NULL),
('79', '21', 'IRFAN BHAWALNAGER', 'IRFAN BHAWALNAGER', 'BHAWALNAGER', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'BHAWALNAGER', '0', '', NULL, '0', NULL, NULL),
('80', '49', 'JAVAID  FAISLABAD', 'JAVAID FSD ', 'FAISLABAD', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'FAISLABAD', '0', '', NULL, '0', NULL, NULL),
('81', '27', 'KAZIM SHAH', 'KAZIM SHAH', '', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('82', '28', 'LALAN WALA', 'LALAN WALA', 'BUREWALA', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'BUREWALA', '0', '', NULL, '0', NULL, NULL),
('83', '45', 'MAILSI  P/S', 'MAILSI  P/S', 'Mailsi', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'Mailsi', '0', '', NULL, '0', NULL, NULL),
('84', '29', 'MAKHAN P/S', 'MAKHAN P/S', 'GAGOO', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'GAGOO', '0', '', NULL, '0', NULL, NULL),
('85', '31', 'NABEEL AKBER', 'NABEEL AKBER', '37 PHATAK BUREWLA', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '37 PHATAK BUREWLA', '0', '', NULL, '0', NULL, NULL),
('86', '37', 'NADIR  P/S', 'NADIR  P/S', '35 CHAK', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '35 CHAK', '0', '', NULL, '0', NULL, NULL),
('87', '30', 'NAWAB KHAN', 'NAWAB KHAN', 'PULL GARDER', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'PULL GARDER', '0', '', NULL, '0', NULL, NULL),
('88', '32', 'NAWAB P/S JAMLAIRA', 'NAWAB P/S JAMLAIRA', 'JAMLAIRA', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'JAMLAIRA', '0', '', NULL, '0', NULL, NULL),
('89', '33', 'NAWAB SONS ', 'NAWAB SONS ', '35 MOR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '35 MOR', '0', '', NULL, '0', NULL, NULL),
('90', '40', 'NOMAN P/S', 'NOMAN P/S', 'Garrah Mor', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'Garrah Mor', '0', '', NULL, '0', NULL, NULL),
('91', '24', 'QARI P/S', 'QARI P/S', 'JALAL PUR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'JALAL PUR', '0', '', NULL, '0', NULL, NULL),
('92', '9', 'RAFIQ PAKHIMOR  ', 'RAFIQ PAKHIMOR  ', 'PAKHIMOR', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'PAKHIMOR', '0', '', NULL, '0', NULL, NULL),
('93', '2', 'RANA AMJAD', 'RANA AMJAD', 'CHAK 567/EB ', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'CHAK 567/EB ', '0', '', NULL, '0', NULL, NULL),
('94', '10', 'SALEEM P/S (HOC)', 'SALEEM P/S (HOC)', 'SAHOKA', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'SAHOKA', '0', '', NULL, '0', NULL, NULL),
('95', '12', 'SARWAR P/S', 'SARWAR P/S', 'CHAK NO 50', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'CHAK NO 50', '0', '', NULL, '0', NULL, NULL),
('96', '11', 'SATLUJJ P/S', 'SATLUJJ P/S', 'LUDDEN', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'LUDDEN', '0', '', NULL, '0', NULL, NULL),
('97', '13', 'SHOKAT SEHAR (PSO)', 'SHOKAT SEHAR (PSO)', 'SEHRAYA WALA ', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'SEHRAYA WALA ', '0', '', NULL, '0', NULL, NULL),
('98', '14', 'SHRAFAT BAHTTI', 'SHRAFAT BAHTTI', '48 POLL', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '48 POLL', '0', '', NULL, '0', NULL, NULL),
('99', '15', 'TAHIR IQBAL', 'TAHIR IQBAL', 'CHAK 159', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'CHAK 159', '0', '', NULL, '0', NULL, NULL),
('100', '34', 'WATOO P/S ', 'WATOO P/S ', '', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('101', '26', 'ZAMINDARA  CO', 'ZAMINDARA  CO', 'VEHARI', '1', '1', '20001', '1', '', '4025', '1013', '4025', '1', 'VEHARI', '0', '', NULL, '0', NULL, NULL),
('102', '39', 'VEHARI P/S', 'VEHARI P/S', 'V CHOCK VEHARI', '1', '1', '20002', '1', '', '4025', '10411', '4025', '1', 'V CHOCK VEHARI', '0', '', NULL, '0', NULL, NULL),
('104', '51', 'RAO AFSAR PETROLEUM SERVICES', 'RAO AFSAR PETROLEUM SERVICES', 'MAIN PAKKI ', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'MAIN PAKKI ', '0', '', NULL, '0', NULL, NULL),
('105', '52', 'SOFI ASHRAF', 'SOFI ASHRAF', 'CHAK NO 73/WB VEHARI', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'CHAK NO 73/WB VEHARI', '0', '', NULL, '0', NULL, NULL),
('106', '53', 'ZEESHAN PETROLEUM SERVICES', 'ZEESHAN PETROLEUM SERVICES', 'CHAK NO 63/WB', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'CHAK NO 63/WB', '0', '', NULL, '0', NULL, NULL),
('107', '54', 'GHUMAN  P/S', 'GHUMAN  P/S', 'JAH SHYAL', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'JAH SHYAL', '0', '', NULL, '0', NULL, NULL),
('108', '55', 'AMEN BROTHERS', 'AMEN BROTHERS', 'GHRA MOR', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'GHRA MOR', '0', '', NULL, '0', NULL, NULL),
('109', '56', 'HAJI BAGHA', 'HAJI BAGHA', 'SAFIEN', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'SAFIEN', '0', '', NULL, '0', NULL, NULL),
('110', '57', 'AL- WASI   P/S', 'AL- WASI   P/S', 'SHATAB GHAR', '1', '1', '20001', '2', '', '4025', '1013', '4025', '1', 'SHATAB GHAR', '0', '', NULL, '0', NULL, NULL),
('111', '58', 'QAZI  KALRAA  P/S', 'QAZI  KALRAA  P/S', '', '1', '1', '20001', '2', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('112', '58', 'QAZI KALRAA P/S', 'QAZI KALRAA P/S', '', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('113', '59', 'AL KAMAL P/S', 'AL KAMAL P/S', 'JAMLARA', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'JAMLARA', '0', '', NULL, '0', NULL, NULL),
('114', '60', 'RAB RAKHA F/S', 'RAB RAKHA F/S', 'RAB RAKHA MOR VEHARI', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'RAB RAKHA MOR VEHARI', '0', '', NULL, '0', NULL, NULL),
('115', '61', 'SHAFIQ P/S', 'SHAFIQ P/S', 'HASIPUR', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'HASIPUR', '0', '', NULL, '0', NULL, NULL),
('116', '62', 'KHAWJA P/S', 'KHAWJA P/S', 'MAIN PAKI', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'MAIN PAKI', '0', '', NULL, '0', NULL, NULL),
('117', '64', 'NADEEM KHALI SHAH', 'NADEEM KHALI SHAH', 'KHALI SHAH', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'KHALI SHAH', '0', '', NULL, '0', NULL, NULL),
('118', '65', 'KHAWAR ABBAS ', 'KHAWAR ABBAS ', '77', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '77', '0', '', NULL, '0', NULL, NULL),
('119', '66', 'HAQ BAHOO', 'HAQ BAHOO', 'LUDDEN ROAD ', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'LUDDEN ROAD ', '0', '', NULL, '0', NULL, NULL),
('120', '67', 'MISc CUSTOMER', 'MISc CUSTOMER', '', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('121', '68', 'NISAAR P/S', 'NISAAR P/S', 'PUL RANGOO', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'PUL RANGOO', '0', '', NULL, '0', NULL, NULL),
('122', '69', 'IQBAL  SHARON P/S', 'IQBAL  SHARON P/S', 'VHRI', '1', '1', '20001', '2', '', '4025', '1013', '4025', '2', 'VHRI', '0', '', NULL, '0', NULL, NULL),
('123', '69', 'IQBAL SHARON P/S', 'IQBAL SHARON P/S', '', '1', '1', '20001', '2', '', '4025', '10411', '4025', '2', '', '0', '', NULL, '0', NULL, NULL),
('124', '70', 'SARDAR GILL P/S', ' SARDAR GILL P/S', 'HASSILPUR', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'HASSILPUR', '0', '', NULL, '0', NULL, NULL),
('125', '71', 'SAJID SHAH KALI SHAH', 'SAJID SHAH KALI SHAH', 'KALI SHAH', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'KALI SHAH', '0', '', NULL, '0', NULL, NULL),
('126', '72', 'SYED FAQEER HUSSAIN ', 'SYED FAQEER HUSSAIN ', 'MOZA DHARLA', '1', '1', '20001', '2', '', '4025', '1013', '4025', '1', 'MOZA DHARLA', '0', '', NULL, '0', NULL, NULL),
('127', '73', 'MIAN TAYYAB  PS', 'MIAN TAYYAB  PS', 'BHAWALNAGAR', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'BHAWALNAGAR', '0', '', NULL, '0', NULL, NULL),
('128', '74', 'MALIK GHAFOOR WAH  PS', 'MALIK GHAFOOR WAH  PS', ' GHAFOR WAH', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', ' GHAFOR WAH', '0', '', NULL, '0', NULL, NULL),
('130', '76', 'AL WAHAAB OIL AGCY ', 'AL WAHAAB OIL AGCY ', 'BASTI PULER', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'BASTI PULER', '0', '', NULL, '0', NULL, NULL),
('131', '77', 'QAISER P/S', 'QAISER P/S', '58', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '58', '0', '', NULL, '0', NULL, NULL),
('132', '78', 'KHAN MUHAMMAD GAFOOR WAH', 'KHAN MUHAMMAD GAFOOR WAH', 'JAAN', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'JAAN', '0', '', NULL, '0', NULL, NULL),
('133', '79', 'ALLAH TAWAKAL PS', 'ALLAH TAWAKAL PS', 'JAMLIRA', '1', '1', '20001', '2', '', '4025', '1013', '4025', '1', 'JAMLIRA', '0', '', NULL, '0', NULL, NULL),
('134', '80', 'FOJI  ABDUL RASHEED  22 LOT', 'FOJI  ABDUL RASHEED  22 LOT', '22  LOT', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '22  LOT', '0', '', NULL, '0', NULL, NULL),
('135', '81', 'MISTRI   IQBAL', 'MISTRI   IQBAL', 'VHRI', '1', '1', '20001', '1', '', '4025', '1013', '4025', '2', 'VHRI', '0', '', NULL, '0', NULL, NULL),
('136', '82', 'HAJI MUNIEER ', 'HAJI MUNIEER ', 'DHAHRA', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'DHAHRA', '0', '', NULL, '0', NULL, NULL),
('137', '83', 'MAQBOOL AHMED', 'MAQBOOL AHMED', 'D', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'D', '0', '', NULL, '0', NULL, NULL),
('138', '84', 'RANA AFZAL ', 'RANA AFZAL ', 'MAIN PAKI', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'MAIN PAKI', '0', '', NULL, '0', NULL, NULL),
('139', '85', 'MUJAHID OIL AGNCY', 'MUJAHID OIL AGNCY', 'VEHARI', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'VEHARI', '0', '', NULL, '0', NULL, NULL),
('140', '86', 'Choudhary P/S', 'Choudhary P/S', 'CHICHAWATNI', '1', '2', '20001', '2', '', '4025', '10411', '4025', '1', 'CHICHAWATNI', '0', '', NULL, '0', NULL, NULL),
('141', '87', 'BASHIR and SONS', 'BASHIR and SONS', '27 BHATA ', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', '27 BHATA ', '0', '', NULL, '0', NULL, NULL),
('142', '88', 'ZAHOOR RATTA TIBBA', 'ZAHOOR RATTA TIBBA', 'RATTA TIBBA', '1', '1', '20001', '2', '', '4025', '10411', '4025', '1', 'RATTA TIBBA', '0', '', NULL, '0', NULL, NULL),
('143', '89', 'MARHABA  P/S', 'MARHABA  P/S', 'VHRI', '1', '2', '20001', '2', '', '4025', '10411', '4025', '1', 'VHRI', '0', '', NULL, '0', NULL, NULL),
('144', '90', 'USMAN  SHELI GHARBI', 'USMAN  SHELI GHARBI', 'USMAN  SHELI GHARBI', '1', '2', '20001', '2', '', '4025', '10411', '4025', '1', 'USMAN  SHELI GHARBI', '0', '', NULL, '0', NULL, NULL),
('145', '91', 'QAISER  ABBAS DHRALA', 'QAISER  ABBAS DHRALA', ' DHRALA', '1', '2', '20001', '2', '', '4025', '1013', '4025', '1', ' DHRALA', '0', '', NULL, '0', NULL, NULL),
('146', '92', 'ASLAM KHAN TIBA', 'ASLAM KHAN TIBA', 'TIBA SULTAN PUR', '1', '2', '20001', '2', '', '4025', '10411', '4025', '1', 'TIBA SULTAN PUR', '0', '', NULL, '0', NULL, NULL),
('147', '93', 'NAVEED SAGAR PAKI MOR', 'NAVEED SAGAR PAKI MOR', 'PAKI MOR', '1', '1', '20001', '2', '', '4025', '1013', '4025', '1', 'PAKI MOR', '0', '', NULL, '0', NULL, NULL),
('148', '94', 'SHABBIR AHMED PS', 'SHABBIR AHMED PS', 'VHRI', '1', '2', '20001', '2', '', '4025', '1013', '4025', '1', 'VHRI', '0', '', NULL, '0', NULL, NULL),
('149', '95', 'WAHEED AHMED PS', 'WAHEED AHMED PS', 'VHRI', '1', '2', '20001', '2', '', '4025', '1013', '4025', '1', 'VHRI', '0', '', NULL, '0', NULL, NULL),
('150', '96', 'LAIQAT PS .HARI CHAND', 'LAIQAT PS .HARI CHAND', 'HARI CHAND  MAILSI', '1', '2', '20001', '2', '', '4025', '1013', '4025', '1', 'HARI CHAND  MAILSI', '0', '', NULL, '0', NULL, NULL),
('151', '97', 'WARIS P/S   37', 'WARIS P/S   37', '37 PHATAK    BUREWALA', '1', '2', '20001', '2', '', '4025', '1013', '4025', '1', '37 PHATAK    BUREWALA', '0', '', NULL, '0', NULL, NULL),
('152', '98', 'ASLAM BALOCH  PS', 'ASLAM BALOCH  PS', 'BHATTA  UMER DIN', '1', '2', '20001', '2', '', '4025', '1013', '4025', '1', 'BHATTA  UMER DIN', '0', '', NULL, '0', NULL, NULL);

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
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `debtor_no` (`debtor_no`,`branch_code`),
  KEY `tran_date` (`tran_date`),
  KEY `order_` (`order_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtor_trans` ###


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
  `con_factor` double NOT NULL,
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
  `credit_allowed` double DEFAULT NULL,
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('1', 'ALTAF  HUSSAIN AGNCY', 'ALTAF  HUSSAIN AGNCY', 'POLL GARDAR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('2', 'RANA AMJAD', 'RANA AMJAD', 'CHAK 567/EB ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('3', 'AL MADINA  HOC', 'AL MADINA  HOC', 'KABIRWALA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('4', 'Al BARKAT HOC', 'Al BARKAT HOC', 'GAIZA ABAD', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('5', 'Al HAJJ PS(HOC)', 'Al HAJJ PS(HOC)', 'DOKOTA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('6', 'BAGHA HASILPUR', 'BAGHA HASILPUR', 'HASILPUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('7', 'HASSAIN SOHAIL', 'HASSAIN SOHAIL', 'PULL BAGAR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('8', 'DEOL BROTHERS (HOC)', 'DEOL BROTHERS (HOC)', '9 DOHLIYAN  KAMANDHA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('9', 'RAFIQ PAKHIMOR  ', 'RAFIQ PAKHIMOR  ', 'PAKHIMOR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('10', 'SALEEM P/S (HOC)', 'SALEEM P/S (HOC)', 'SAHOKA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('11', 'SATLUJJ P/S', 'SATLUJJ P/S', 'LUDDEN', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('12', 'SARWAR P/S', 'SARWAR P/S', 'CHAK NO 50', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('13', 'SHOKAT SEHAR (PSO)', 'SHOKAT SEHAR (PSO)', 'SEHRAYA WALA ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('14', 'SHRAFAT BAHTTI', 'SHRAFAT BAHTTI', '48 POLL', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('15', 'TAHIR IQBAL', 'TAHIR IQBAL', 'CHAK 159', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('17', 'ARABIAN F/S', 'ARABIAN F/S', 'BAHAWALPUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('18', 'ABAD UL REHAMAN', 'ABAD UL REHAMAN', 'LUDDEN ROAD', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('19', 'ABDUL JABBAR', 'ABDUL JABBAR', 'SHALLI GARBI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('20', 'ABDUL LATIF KLASRA', 'ABDUL LATIF KLASRA', 'QASBA  GUJRAT', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('21', 'IRFAN BHAWALNAGER', 'IRFAN BHAWALNAGER', 'BHAWALNAGER', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('22', 'GULLAM YASEEN', 'GULLAM YASEEN', 'BAGH ARIYAN', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('23', 'FAZAL KHAN', 'FAZAL KHAN', 'SAIDIQA ABAD', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('24', 'QARI P/S', 'QARI P/S', 'JALAL PUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('25', 'FOJI OIL', 'FOJI OIL', 'KHAN PUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('26', 'ZAMINDARA  CO', 'ZAMINDARA  CO', 'VEHARI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('27', 'KAZIM SHAH', 'KAZIM SHAH', 'ADDA BATLIYAN', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('28', 'LALAN WALA', 'LALAN WALA', 'BUREWALA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('29', 'MAKHAN P/S', 'MAKHAN P/S', 'GAGOO', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('30', 'NAWAB KHAN', 'NAWAB KHAN', 'PULL GARDER', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('31', 'NABEEL AKBER', 'NABEEL AKBER', '37 PHATAK BUREWLA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('32', 'NAWAB P/S JAMLAIRA', 'NAWAB P/S JAMLAIRA', 'JAMLAIRA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('33', 'NAWAB SONS ', 'NAWAB SONS ', '35 MOR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('34', 'WATOO P/S ', 'WATOO P/S ', 'JAMLAIRA ROAD MANA MOR ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('35', 'HAFIZ PS', 'HAFIZ PS', '48 PULL', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('36', 'FRIENDS P/S', 'FRIENDS P/S', 'KHANEWAL', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('37', 'NADIR  P/S', 'NADIR  P/S', '35 CHAK', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('39', 'VEHARI P/S', 'VEHARI P/S', 'V CHOCK VEHARI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('40', 'NOMAN P/S', 'NOMAN P/S', 'GHARA MOR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('42', 'DUBAI P/S', 'DUBAI P/S', 'DARANAWALA ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('43', 'ABDUL GHAFFAR', 'ABDUL GHAFFAR', 'CHAK NO 553 ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('44', 'FIAZ AND ABID', 'FIAZ AND ABID', 'chak no 228', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('45', 'MAILSI  P/S', 'MAILSI  P/S', 'Mailsi', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('46', 'AL_HAMMD  F/S', 'AL_HAMMD  F/S', 'BUREWALA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('47', 'ALLAH BAHKSH', 'ALLAH BAHKSH', 'SUJJAH ABAD', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('48', 'AHMAD F/S', 'AHMAD F/S', 'LIAQUT PUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('49', 'JAVAID  FAISLABAD', 'JAVAID FSD ', 'FAISLABAD', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('51', 'RAO AFSAR PETROLEUM SERVICES', 'RAO AFSAR PETROLEUM SERVICES', 'MAIN PAKKI ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('52', 'SOFI ASHRAF', 'SOFI ASHRAF', 'CHAK NO 73/WB VEHARI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('53', 'ZEESHAN PETROLEUM SERVICES', 'ZEESHAN PETROLEUM SERVICES', 'CHAK NO 63/WB', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('54', 'GHUMAN  P/S', 'GHUMAN  P/S', 'JAH SHYAL', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('55', 'AMEN BROTHERS', 'AMEN BROTHERS', 'GHRA MOR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('56', 'HAJI BAGHA', 'HAJI BAGHA', 'SAFIEN', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('57', 'AL- WASI   P/S', 'AL- WASI   P/S', 'SHATAB GHAR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('58', 'QAZI  KALRAA  P/S', 'QAZI  KALRAA  P/S', 'HEAD SAIFAIN   MAILSI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('59', 'AL KAMAL P/S', 'AL KAMAL P/S', 'JAMLARA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('60', 'RAB RAKHA F/S', 'RAB RAKHA F/S', 'RAB RAKHA MOR VEHARI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('61', 'SHAFIQ P/S', 'SHAFIQ P/S', 'HASIPUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('62', 'KHAWJA P/S', 'KHAWJA P/S', 'MAIN PAKI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('64', 'NADEEM KHALI SHAH', 'NADEEM KHALI SHAH', 'KHALI SHAH', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('65', 'KHAWAR ABBAS ', 'KHAWAR ABBAS ', '77', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('66', 'HAQ BAHOO', 'HAQ BAHOO', 'LUDDEN ROAD ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('67', 'MISc CUSTOMER', 'MISc CUSTOMER', 'KOT ADDU', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('68', 'NISAAR P/S', 'NISAAR P/S', 'PUL RANGOO', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('69', 'IQBAL  SHARON P/S', 'IQBAL  SHARON P/S', 'VHRI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('70', 'SARDAR GILL P/S', ' SARDAR GILL P/S', 'HASSILPUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('71', 'SAJID SHAH KALI SHAH', 'SAJID SHAH KALI SHAH', 'KALI SHAH', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('72', 'SYED FAQEER HUSSAIN ', 'SYED FAQEER HUSSAIN ', 'MOZA DHARLA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', NULL),
('73', 'MIAN TAYYAB  PS', 'MIAN TAYYAB  PS', 'BHAWALNAGAR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('74', 'MALIK GHAFOOR WAH  PS', 'MALIK GHAFOOR WAH  PS', ' GHAFOR WAH', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('76', 'AL WAHAAB OIL AGCY ', 'AL WAHAAB OIL AGCY ', 'BASTI PULER', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('77', 'QAISER  PS ', 'QAISER  PS ', '58', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('78', 'KHAN MUHAMMAD GAFOOR WAH', 'KHAN MUHAMMAD GAFOOR WAH', 'GAFOOR WAH', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('79', 'ALLAH TAWAKAL PS', 'ALLAH TAWAKAL PS', 'JAMLIRA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('80', 'FOJI  ABDUL RASHEED  22 LOT', 'FOJI  ABDUL RASHEED  22 LOT', '22  LOT', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('81', 'MISTRI   IQBAL', 'MISTRI   IQBAL', 'VHRI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('82', 'HAJI MUNIEER ', 'HAJI MUNIEER ', 'DHAHRA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('83', 'MAQBOOL AHMED', 'MAQBOOL AHMED', 'D', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('84', 'RANA AFZAL ', 'RANA AFZAL ', 'MAIN PAKI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('85', 'MUJAHID OIL AGNCY', 'MUJAHID OIL AGNCY', 'VEHARI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('86', 'Choudhary P/S', 'Choudhary P/S', 'CHICHAWATNI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('87', 'BASHIR and SONS', 'BASHIR and SONS', '27 BHATA ', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('88', 'ZAHOOR RATTA TIBBA', 'ZAHOOR RATTA TIBBA', 'RATTA TIBBA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('89', 'MARHABA  P/S', 'MARHABA  P/S', 'VHRI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('90', 'USMAN  SHELI GHARBI', 'USMAN  SHELI GHARBI', 'USMAN  SHELI GHARBI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('91', 'QAISER  ABBAS DHRALA', 'QAISER  ABBAS DHRALA', ' DHRALA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('92', 'ASLAM KHAN TIBA', 'ASLAM KHAN TIBA', 'TIBA SULTAN PUR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('93', 'NAVEED SAGAR PAKI MOR', 'NAVEED SAGAR PAKI MOR', 'PAKI MOR', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('94', 'SHABBIR AHMED PS', 'SHABBIR AHMED PS', 'VHRI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('95', 'WAHEED AHMED PS', 'WAHEED AHMED PS', 'VHRI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('96', 'LAIQAT PS .HARI CHAND', 'LAIQAT PS .HARI CHAND', 'HARI CHAND  MAILSI', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('97', 'WARIS P/S   37', 'WARIS P/S   37', '37 PHATAK    BUREWALA', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0'),
('98', 'ASLAM BALOCH  PS', 'ASLAM BALOCH  PS', 'BHATTA  UMER DIN', '', '', 'PKR', '1', '0', '0', '1', '1', '0', '0', '0', '', '0', '0');

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
  `cheque_date` date DEFAULT NULL,
  `cheque_no` int(11) NOT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `opening` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###


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
  `grn_batch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES
('1', '10001', '10001', 'PMG', '2', '1', '0', '0'),
('2', '10002', '10002', 'HSD', '2', '1', '0', '0'),
('3', '10003', '10003', 'LUBRICANTS ', '2', '1', '0', '0'),
('4', '26', '26', 'OPENING BALANCE', '2', '1', '0', '0');

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
('20001', '10001', '0', NULL),
('20001', '10002', '0', NULL),
('20001', '10003', '0', NULL),
('20001', '26', '0', NULL),
('20002', '10001', '0', NULL),
('20002', '10002', '0', NULL),
('20002', '10003', '0', NULL),
('20002', '26', '0', NULL),
('20003', '10001', '0', NULL),
('20003', '10002', '0', NULL),
('20003', '10003', '0', NULL),
('20003', '26', '0', NULL),
('20004', '10001', '0', NULL),
('20004', '10002', '0', NULL),
('20004', '10003', '0', NULL),
('20004', '26', '0', NULL),
('20005', '10001', '0', NULL),
('20005', '10002', '0', NULL),
('20005', '10003', '0', NULL),
('20005', '26', '0', NULL),
('20006', '10001', '0', NULL),
('20006', '10002', '0', NULL),
('20006', '10003', '0', NULL),
('20006', '26', '0', NULL),
('20007', '10001', '0', NULL),
('20007', '10002', '0', NULL),
('20007', '10003', '0', NULL),
('20007', '26', '0', NULL),
('20008', '10001', '0', NULL),
('20008', '10002', '0', NULL),
('20008', '10003', '0', NULL),
('20008', '26', '0', NULL),
('20009', '10001', '0', NULL),
('20009', '10002', '0', NULL),
('20009', '10003', '0', NULL),
('20009', '26', '0', NULL),
('20011', '10001', '0', NULL),
('20011', '10002', '0', NULL),
('20011', '10003', '0', NULL),
('20011', '26', '0', NULL),
('20012', '10001', '0', NULL),
('20012', '10002', '0', NULL),
('20012', '10003', '0', NULL),
('20012', '26', '0', NULL),
('20013', '10001', '0', NULL),
('20013', '10002', '0', NULL),
('20013', '10003', '0', NULL),
('20013', '26', '0', NULL),
('20014', '10001', '0', NULL),
('20014', '10002', '0', NULL),
('20014', '10003', '0', NULL),
('20014', '26', '0', NULL),
('20015', '10001', '0', NULL),
('20015', '10002', '0', NULL),
('20015', '10003', '0', NULL),
('20015', '26', '0', NULL),
('20016', '10001', '0', NULL),
('20016', '10002', '0', NULL),
('20016', '10003', '0', NULL),
('20016', '26', '0', NULL),
('20017', '10001', '0', NULL),
('20017', '10002', '0', NULL),
('20017', '10003', '0', NULL),
('20017', '26', '0', NULL),
('20018', '10001', '0', NULL),
('20018', '10002', '0', NULL),
('20018', '10003', '0', NULL),
('20018', '26', '0', NULL),
('DEF', '10001', '0', NULL),
('DEF', '10002', '0', NULL),
('DEF', '10003', '0', NULL),
('DEF', '26', '0', NULL);

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
('20001', 'DEMAND ', '', '', '', '', '', '', '0', '0'),
('20002', '5186  MNQ ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20003', '2055 SA ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20004', '1830 GA ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20005', '7519 LSA  ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20006', '138 SWA ON WHEEL ', '', '', '', '', '', '', '0', '0'),
('20007', '397 TTD ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20008', '1955 C ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20009', '4757  MNP ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20011', '4155 LS ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20012', '114 TLC ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20013', '0166 ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20014', '0167 ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20015', 'STOCK DEPOT', '', '', '', '', '', '', '0', '0'),
('20016', '540  TMB  ONWHEEL', 'VHRI', '', '', '', '', '', '0', '0'),
('20017', 'ON WHEEL', '', '', '', '', '', '', '0', '0'),
('20018', 'SHAHEEN MARKET', 'SHAHEEN MARKET VEHARI', '0673362865', '', '', '', '', '0', '0'),
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
('1', '1 Days', '1', '0', '0'),
('2', '2 days', '2', '0', '0'),
('3', 'Payment due within 10 days', '10', '0', '0'),
('4', 'Cash Only', '0', '0', '0'),
('5', '90 Days', '90', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('4', '1002', '2', 'PKR', '200'),
('5', '001', '1', 'PKR', '77.72'),
('6', '10002', '1', 'PKR', '77.22'),
('7', '10001', '1', 'PKR', '70.89');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_orders` ###


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
('1', '0', 'JV', '{001}/{YYYY}', '', '1', '0'),
('2', '1', 'BPV', '{001}/{YYYY}', '', '1', '0'),
('3', '2', 'BRV', '{001}/{YYYY}', '', '1', '0'),
('4', '4', 'FT', '{001}/{YYYY}', '', '1', '0'),
('5', '10', 'SI', '{001}/{YYYY}', '107', '1', '0'),
('6', '11', 'CCN', '{001}/{YYYY}', '113', '1', '0'),
('7', '12', 'CP', '{001}/{YYYY}', '', '1', '0'),
('8', '13', 'DN', '{001}/{YYYY}', '1101', '1', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_requisitions` ###

INSERT INTO `0_requisitions` VALUES
('1', '54235', '452', '2017-09-05 03:10:11', '0', '0', '0', NULL);

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
  `con_factor` double NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_salesman` ###

INSERT INTO `0_salesman` VALUES
('1', 'Sales Person', '', '', '', '5', '1000', '4', '0'),
('2', 'Abdul gafooe', '', '', '', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
('9', 'Accounts manager', 'Accounts manager', '512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;15616;15872;16128', '771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8449;8450;8451;15618;15619;15620;15621;15623;15626;15627;15873;15874;15876;15877;15878;15879;15880;15883;15882;16129;16131;16132;10497;10753;10755;11009;11010;11012;13313;13315', '0'),
('10', 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132;775', '0'),
('11', 'cash account', 'cash account', '768;15872;16128', '774;15877;15878;16129', '0'),
('12', 'Logistic Manager', 'Logistic Manager', '768;15872;16128', '774;15873;15880;15883;16129;16131;16132', '0');

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
('1', 'Default', '', '', '', '', '0'),
('2', '1830 GA', '', '', 'YOUSAF', '', '0');

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
  `batch_status` int(11) NOT NULL,
  `alt_units` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `con_factor` double NOT NULL,
  `con_type` tinyint(1) NOT NULL,
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
('10001', '2', '1', 'PMG', 'PETROL', 'TANK', 'LTRs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '70.89', '70.283226381693', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('10002', '2', '1', 'HSD', 'HIGH SPEED DISEL', 'TANK', 'LTRs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '77.5635', '77.192922081615', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '0', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('10003', '2', '1', 'LUBRICANTS ', 'LUBE OIL', 'BOX', 'LTRs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '44179', '44179', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '0', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('26', '2', '1', 'OPENING BALANCE', '', '', 'LTRs', 'D', '1035', '1035', '1021', '5014', '1023', '0', '0', '932', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '0', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '');

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
  `units_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `con_factor` double NOT NULL,
  `batch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
  `text1` double NOT NULL,
  `text2` double NOT NULL,
  `text3` double NOT NULL,
  `text4` double NOT NULL,
  `text5` double NOT NULL,
  `text6` double NOT NULL,
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
  `batch` int(11) NOT NULL,
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
  `cheque` int(11) NOT NULL,
  `gross_rate` double NOT NULL,
  `total_` double NOT NULL,
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_5` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opening` tinyint(1) DEFAULT NULL,
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
  `ntn_no` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_id`),
  KEY `supp_ref` (`supp_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('1', 'SHELL PAKISTAN LIMITED', 'SHELL PAKISTAN LIMITED', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('2', 'HORIZON OIL COMPANY', 'HORIZON OIL COMPANY', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('3', 'HAROONABAD', 'HAROONABAD', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('4', 'MUNIER CARRIAGE CO', 'MUNIER CARRIAGE CO', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('5', 'HASCOL ', 'HASCOL ', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('6', 'BAKRI', 'BAKRI', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('8', 'PSO CH P/S  ', 'PSO CH P/S  ', 'CHICHAWATNI', 'CHICHAWATNI', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('9', 'PSO AMIN BROTHERS ', 'PSO AMIN BROTHERS ', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('10', 'PSO GENERAL', 'PSO GENERAL', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('11', 'PSO KHURSHEED', ' PSO KHURSHEED', 'VHR', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('12', 'PSO GHUMAN P/S', 'PSO GHUMAN P/S', 'VHR', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('13', 'PSO BASHIR', 'PSO BASHIR', 'VHR', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('14', 'MADINA PSO', 'MADINA PSO', '', '', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('15', 'PSO CH PS.2', 'PSO CH PS.2', 'VEHARI', 'VEHARI', '', '', '', '', '', 'PKR', '1', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0');

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
('alt_uom', 'gl_setup.general', 'tinyint', '1', '0'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', ''),
('bank_account', 'setup.company', 'varchar', '40', ''),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '5036'),
('bank_details', 'setup.company', 'tinytext', '0', ''),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', ''),
('company_logo_report', 'setup.company', 'tinyint', '1', '0'),
('coy_logo', 'setup.company', 'varchar', '100', ''),
('coy_name', 'setup.company', 'varchar', '60', 'HORIZON OIL COMPANY'),
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
('discount_algorithm', 'glsetup.sales', 'INT', '11', '6'),
('discount1', 'glsetup.sales', 'varchar', '15', ''),
('discount2', 'glsetup.sales', 'varchar', '15', '701001 '),
('domicile', 'setup.company', 'varchar', '55', ''),
('email', 'setup.company', 'varchar', '100', ''),
('exchange_diff_act', 'glsetup.general', 'varchar', '15', '4023'),
('f_year', 'setup.company', 'int', '11', '3'),
('fax', 'setup.company', 'varchar', '30', ''),
('freight_act', 'glsetup.customer', 'varchar', '15', '4021'),
('gl_closing_date', 'setup.closing_date', 'date', '8', '2017-07-01'),
('grn_clearing_act', 'glsetup.purchase', 'varchar', '15', ''),
('gst_no', 'setup.company', 'varchar', '25', ''),
('hide_prices_grn', 'glsetup.purchase', 'tinyint', '1', '0'),
('legal_text', 'glsetup.customer', 'tinytext', '0', ''),
('loc_notification', 'glsetup.inventory', 'tinyint', '1', ''),
('login_tout', 'setup.company', 'smallint', '6', '43200'),
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
('postal_address', 'setup.company', 'tinytext', '0', 'Vehari'),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '5030'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '5016'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '3021'),
('round_to', 'setup.company', 'int', '5', '1'),
('shortname_name_in_list', 'setup.company', 'tinyint', '1', '0'),
('show_doc_ref', 'glsetup.purchase', 'tinyint', '1', '0'),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', '1', ''),
('show_prices_dn', 'glsetup.purchase', 'tinyint', '1', '0'),
('suppress_tax_rates', 'setup.company', 'tinyint', '1', ''),
('tax_algorithm', 'glsetup.customer', 'tinyint', '1', '1'),
('tax_last', 'setup.company', 'int', '11', '1'),
('tax_prd', 'setup.company', 'int', '11', '1'),
('time_zone', 'setup.company', 'tinyint', '1', '0'),
('use_dimension', 'setup.company', 'tinyint', '1', '2'),
('use_fixed_assets', 'setup.company', 'tinyint', '1', '1'),
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
('gl_account_classes_text', 'Gl Account Classes'),
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

INSERT INTO `0_tag_associations` VALUES
('101218', '1'),
('5012', '1'),
('5032', '1');

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

INSERT INTO `0_tags` VALUES
('1', '1', 'DIRECT EXPENSES', 'DIRECT EXPENSES', '0'),
('2', '1', 'FINANCING', 'FINANCING', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_user_locations` ###

INSERT INTO `0_user_locations` VALUES
('1', 'DEF', '1', '0'),
('2', 'DEF', '2', '0'),
('3', 'DEF', '3', '0'),
('7', 'SMKT', '7', '0'),
('5', 'DEF', '6', '0'),
('13', '20001', '7', '0'),
('8', 'L001', '8', '0'),
('9', '20001', '10', '0'),
('10', '20002', '10', '0'),
('11', '20001', '9', '0'),
('12', '20002', '9', '0'),
('14', '20002', '7', '0'),
('15', '20001', '11', '0'),
('16', '20002', '11', '0'),
('17', '20013', '11', '0'),
('29', '20013', '12', '0'),
('19', '20014', '11', '0'),
('20', '20008', '11', '0'),
('21', '20003', '11', '0'),
('22', '20011', '11', '0'),
('23', '20005', '11', '0'),
('24', '20009', '11', '0'),
('25', '20004', '11', '0'),
('26', '20006', '11', '0'),
('27', '20012', '11', '0'),
('28', '20007', '11', '0'),
('30', '20014', '12', '0'),
('31', '20015', '11', '0'),
('32', '20013', '9', '0'),
('33', '20014', '9', '0'),
('34', '20012', '9', '0'),
('35', '20006', '9', '0'),
('36', '20004', '9', '0'),
('37', '20008', '9', '0'),
('38', '20003', '9', '0'),
('39', '20007', '9', '0'),
('40', '20011', '9', '0'),
('41', '20009', '9', '0'),
('42', '20005', '9', '0'),
('43', '20015', '9', '0'),
('44', 'DEF', '9', '0'),
('45', '20016', '9', '0'),
('46', 'DEF', '14', '0'),
('47', 'DEF', '15', '0'),
('48', 'DEF', '16', '0'),
('49', 'DEF', '17', '0'),
('50', '20011', '12', '0'),
('51', '20012', '12', '0'),
('52', '20015', '12', '0'),
('53', '20016', '12', '0'),
('54', '20002', '12', '0'),
('55', '20003', '12', '0'),
('56', '20004', '12', '0'),
('57', '20001', '12', '0'),
('58', '20006', '12', '0'),
('59', '20005', '12', '0'),
('60', '9', '20017', '0'),
('61', '20016', '11', '0'),
('62', '20018', '11', '0'),
('63', '20018', '12', '0'),
('64', '20018', '9', '0'),
('65', '20013', '10', '0'),
('66', '20014', '10', '0'),
('67', '20012', '10', '0'),
('68', '20006', '10', '0'),
('69', '20004', '10', '0'),
('70', '20008', '10', '0'),
('71', '20003', '10', '0'),
('72', '20007', '10', '0'),
('73', '20011', '10', '0'),
('74', '20009', '10', '0'),
('75', '20016', '10', '0'),
('76', '20005', '10', '0'),
('77', '20017', '10', '0'),
('78', '20018', '10', '0'),
('79', '20015', '10', '0'),
('80', '20017', '9', '0'),
('81', '20017', '11', '0'),
('82', '20013', '7', '0'),
('83', '20014', '7', '0'),
('84', '20012', '7', '0'),
('85', '20006', '7', '0'),
('86', '20004', '7', '0'),
('87', '20008', '7', '0'),
('88', '20003', '7', '0'),
('89', '20007', '7', '0'),
('90', '20011', '7', '0'),
('91', '20009', '7', '0'),
('92', '20016', '7', '0'),
('93', '20005', '7', '0'),
('94', '20017', '7', '0'),
('95', 'DEF', '18', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=21375 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###

INSERT INTO `0_useronline` VALUES
('21369', '1507526814', '111.88.15.172', '/index.php'),
('21370', '1507526823', '111.88.15.172', '/index.php'),
('21371', '1507526856', '111.88.15.172', '/gl/inquiry/gl_trial_balance.php'),
('21372', '1507526864', '111.88.15.172', '/index.php'),
('21373', '1507526870', '111.88.15.172', '/index.php'),
('21374', '1507526873', '111.88.15.172', '/admin/backups.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('7', 'omer', 'f43c589c0c09bf226170f4fb3460d439', 'Omer', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-10-07 13:22:59', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('9', 'ikram', '7c1ed55e575e5dbe04a26400e208f740', 'ikram', '9', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '4', '4', '4', '1', '1', '0', '0', '2017-10-07 13:48:21', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('10', 'abdulgafoor', 'f682e53184d33b517e01b8bce6f9e1d3', 'abdul gafoor', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '4', '4', '4', '1', '1', '0', '0', '2017-10-07 14:41:33', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('11', 'aqib', '4e075844d2e00e4c800c8c62716bed8c', 'Aqib Iqbal', '9', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '4', '2', '4', '1', '1', '0', '0', '2017-10-07 17:02:31', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('12', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Omer', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '1', '2017-10-09 10:26:53', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('16', 'shahid', '4e075844d2e00e4c800c8c62716bed8c', 'shahid', '11', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '4', '2', '4', '1', '1', '0', '0', '2017-10-07 15:41:43', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('17', 'imran', 'cacfac4970100a1824e9f4975b1ddd4f', 'imran', '11', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '4', '2', '4', '1', '1', '0', '0', '2017-10-07 01:09:56', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('18', 'atiq ', '4089c6c194e9386d8e75cc9be4a2f951', 'M. atiq ur rehman', '12', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '0', '0', '2017-10-07 17:05:55', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
('6', 'Filer Company', '4', '', '1210', '2', '3', NULL),
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
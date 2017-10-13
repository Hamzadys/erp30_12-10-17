# MySQL dump of database 'cloudso1_jasco' on host 'localhost'
# Backup Date and Time: 2017-10-09 16:33
# Built by Hisaab.pk 2.4.2
# http://www.hisaab.pk
# Company: JASCO
# User: Habib Rafiq

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_areas` ###

INSERT INTO `0_areas` VALUES
('1', 'WHOLESLAE KARACHI', '0'),
('2', 'MARKET', '0'),
('3', 'WHOLESALE OUT OF KHI', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###

INSERT INTO `0_audit_trail` VALUES
('1', '17', '1', '23', '2017-09-26 03:49:59', NULL, '3', '2017-09-26', NULL, NULL),
('2', '17', '1', '23', '2017-09-26 03:49:59', 'Voided.\n', '3', '2017-09-26', '0', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('10121', '0', 'JS Bank', '', 'JS Bank', NULL, 'PKR', '0', '1', '5036', '0000-00-00 00:00:00', '0', '0'),
('10122', '0', 'SCB', '', 'SCB', NULL, 'PKR', '0', '2', '5036', '0000-00-00 00:00:00', '0', '0'),
('10111', '3', 'Cash in Hand', '', 'Cash in Hand', NULL, 'PKR', '0', '3', '5036', '0000-00-00 00:00:00', '0', '0'),
('10112', '3', 'Petty Cash', '', 'Petty Cash', NULL, 'PKR', '0', '4', '5036', '0000-00-00 00:00:00', '0', '0'),
('10123', '0', 'Bank 3', '', 'Bank 3', NULL, 'PKR', '0', '5', '5036', '0000-00-00 00:00:00', '0', '0'),
('101211', '3', 'Bank Al Habiba Ltd', '', '', NULL, 'PKR', '0', '6', '5036', '0000-00-00 00:00:00', '0', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_batch` ###


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
('10111', '', 'Cash in Hand', '1011', '0'),
('10112', '', 'Petty Cash', '1011', '0'),
('10121', '', 'JS Bank', '1012', '0'),
('101211', '', 'Bank Al Falah saddar', '10121', '0'),
('10122', '', 'SCB', '1012', '0'),
('10123', '', 'Bank 3', '1012', '0'),
('10124', '', 'Bank Al Falah', '1012', '0'),
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
('4011', '', 'Sales Revenue', '403', '0'),
('4021', '', 'Shipping and Handling', '402', '0'),
('4022', '', 'Interest', '402', '0'),
('4023', '', 'Foreign Exchange Gain', '402', '0'),
('4024', '', 'Incentives', '101', '0'),
('4025', '', 'Discounts Given', '402', '0'),
('5011', '', 'Cost of Goods Sold - Retail', '501', '0'),
('5012', '', 'Material Usage Variance', '501', '0'),
('5013', '', 'Consumable Materials', '501', '0'),
('5014', '', 'Purchase Price Variance', '501', '0'),
('5015', '', 'Purchases of Materials', '501', '0'),
('5016', '', 'Discounts Received', '501', '0'),
('5017', '', 'Freight', '501', '0'),
('5018', '', 'Salary Expense - Operations', '101', '0'),
('5030', '', 'Profit and Loss', '503', '0'),
('5031', '', 'Accounting and Legal', '503', '0'),
('5032', '', 'Advertising and Promotions', '503', '0'),
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
('10121', 'Bank Al Falah', '10', '1012', '0'),
('102', 'Inventory Assets', '10', '', '0'),
('103', 'Fixed Assets', '10', '', '0'),
('201', 'Current Liabilities', '20', '', '0'),
('202', 'Long Term Liabilities', '20', '', '0'),
('301', 'Share Capital', '30', '', '0'),
('302', 'Retained Earnings', '30', '', '0'),
('402', 'Other Revenue', '40', '', '0'),
('403', 'Sales Revenue Beef Classic Items', '40', '', '0'),
('501', 'Cost of Goods Sold', '50', '', '0'),
('502', 'Payroll Expenses', '50', '', '0'),
('5022', 'INTERNET BILL', '50', '502', '0'),
('503', 'General &amp; Administrative Expenses', '50', '', '0'),
('504', 'Travelling Expense', '50', '', '0');

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
  `combo_code` int(11) NOT NULL,
  `description` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('3', '2', 'supplier', 'general', '1'),
('6', '4', 'supplier', 'general', '2'),
('11', '7', 'supplier', 'general', '3'),
('14', '9', 'supplier', 'general', '4'),
('17', '11', 'supplier', 'general', '5'),
('20', '13', 'cust_branch', 'general', '8'),
('21', '13', 'customer', 'general', '8'),
('22', '14', 'supplier', 'general', '6'),
('23', '15', 'cust_branch', 'general', '9'),
('24', '15', 'customer', 'general', '9'),
('25', '16', 'cust_branch', 'general', '10'),
('26', '16', 'customer', 'general', '10'),
('27', '17', 'cust_branch', 'general', '11'),
('28', '17', 'customer', 'general', '11'),
('29', '18', 'cust_branch', 'general', '12'),
('30', '18', 'customer', 'general', '12'),
('31', '19', 'cust_branch', 'general', '13'),
('32', '19', 'customer', 'general', '13'),
('33', '20', 'cust_branch', 'general', '14'),
('34', '20', 'customer', 'general', '14'),
('35', '21', 'cust_branch', 'general', '15'),
('36', '21', 'customer', 'general', '15'),
('37', '22', 'cust_branch', 'general', '16'),
('38', '22', 'customer', 'general', '16'),
('39', '23', 'cust_branch', 'general', '17'),
('40', '23', 'customer', 'general', '19'),
('41', '24', 'cust_branch', 'general', '18'),
('42', '24', 'customer', 'general', '20'),
('43', '25', 'cust_branch', 'general', '19'),
('44', '25', 'customer', 'general', '21'),
('45', '26', 'cust_branch', 'general', '20'),
('46', '26', 'customer', 'general', '22'),
('47', '27', 'cust_branch', 'general', '21'),
('48', '27', 'customer', 'general', '23'),
('49', '28', 'cust_branch', 'general', '22'),
('50', '28', 'customer', 'general', '24'),
('51', '29', 'cust_branch', 'general', '23'),
('52', '29', 'customer', 'general', '25'),
('53', '30', 'cust_branch', 'general', '24'),
('54', '30', 'customer', 'general', '26'),
('55', '31', 'cust_branch', 'general', '25'),
('56', '31', 'customer', 'general', '27'),
('57', '32', 'cust_branch', 'general', '26'),
('58', '32', 'customer', 'general', '28'),
('59', '33', 'cust_branch', 'general', '27'),
('60', '33', 'customer', 'general', '29'),
('61', '34', 'cust_branch', 'general', '28'),
('62', '34', 'customer', 'general', '30'),
('63', '35', 'cust_branch', 'general', '29'),
('64', '35', 'customer', 'general', '31'),
('65', '36', 'cust_branch', 'general', '30'),
('66', '36', 'customer', 'general', '32'),
('67', '37', 'cust_branch', 'general', '31'),
('68', '37', 'customer', 'general', '33'),
('69', '38', 'cust_branch', 'general', '32'),
('70', '38', 'customer', 'general', '34'),
('71', '39', 'cust_branch', 'general', '33'),
('72', '39', 'customer', 'general', '35'),
('73', '40', 'cust_branch', 'general', '34'),
('74', '40', 'customer', 'general', '36'),
('75', '41', 'cust_branch', 'general', '35'),
('76', '41', 'customer', 'general', '37'),
('77', '42', 'cust_branch', 'general', '36'),
('78', '42', 'customer', 'general', '38'),
('79', '43', 'cust_branch', 'general', '37'),
('80', '43', 'customer', 'general', '39'),
('81', '44', 'cust_branch', 'general', '38'),
('82', '44', 'customer', 'general', '40'),
('83', '45', 'cust_branch', 'general', '39'),
('84', '45', 'customer', 'general', '41'),
('85', '46', 'cust_branch', 'general', '40'),
('86', '46', 'customer', 'general', '42'),
('87', '47', 'cust_branch', 'general', '41'),
('88', '47', 'customer', 'general', '43'),
('89', '48', 'cust_branch', 'general', '42'),
('90', '48', 'customer', 'general', '44'),
('91', '49', 'cust_branch', 'general', '43'),
('92', '49', 'customer', 'general', '47'),
('93', '50', 'cust_branch', 'general', '44'),
('94', '50', 'customer', 'general', '48'),
('95', '51', 'cust_branch', 'general', '45'),
('96', '51', 'customer', 'general', '49'),
('97', '52', 'cust_branch', 'general', '46'),
('98', '52', 'customer', 'general', '50'),
('99', '53', 'cust_branch', 'general', '47'),
('100', '53', 'customer', 'general', '51'),
('101', '54', 'cust_branch', 'general', '48'),
('102', '54', 'customer', 'general', '52'),
('103', '55', 'cust_branch', 'general', '49'),
('104', '55', 'customer', 'general', '53'),
('105', '56', 'cust_branch', 'general', '50'),
('106', '56', 'customer', 'general', '54'),
('107', '57', 'cust_branch', 'general', '51'),
('108', '57', 'customer', 'general', '55'),
('109', '58', 'cust_branch', 'general', '52'),
('110', '58', 'customer', 'general', '56'),
('111', '59', 'cust_branch', 'general', '53'),
('112', '59', 'customer', 'general', '57'),
('113', '60', 'cust_branch', 'general', '54'),
('114', '60', 'customer', 'general', '58'),
('115', '61', 'cust_branch', 'general', '55'),
('116', '61', 'customer', 'general', '59'),
('117', '62', 'cust_branch', 'general', '56'),
('118', '62', 'customer', 'general', '60'),
('119', '63', 'cust_branch', 'general', '57'),
('120', '63', 'customer', 'general', '61'),
('121', '64', 'cust_branch', 'general', '58'),
('122', '64', 'customer', 'general', '62'),
('123', '65', 'cust_branch', 'general', '59'),
('124', '65', 'customer', 'general', '63');

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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', 'Test Customer', 'Test Customer', NULL, 'Karachi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('2', 'Test Supplier', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('3', 'Mr. Habib', 'Mr. Habib', NULL, 'Karachi.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('4', 'Abdul Rehman spare parts ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('5', 'adnan raees ', 'adnan raees', NULL, 'me 389 malir', NULL, NULL, NULL, NULL, NULL, '', '0'),
('6', 'RABIA RAEES', 'RABIA RAEES', NULL, 'KORANGI-3\n', NULL, NULL, NULL, NULL, NULL, '', '0'),
('7', 'LATH WORK', 'IMRAN', NULL, NULL, 'O3OO-OOOOOOO', NULL, NULL, NULL, NULL, '', '0'),
('8', 'faraz', 'faraz', NULL, 'karachi', NULL, NULL, NULL, NULL, NULL, '', '0'),
('9', 'hussain', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('10', 'FAISAL', 'FAISAL BROTHERS', NULL, 'SHOP# 56 ', '021-3450631', '0300-4502136', '021-336405', NULL, NULL, '', '0'),
('11', 'FEROZ ELECTRICIAN', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('12', 'WAQAR GHARO', 'WAQAR GHARO', NULL, NULL, '0321-3828049   ', '0321-3828049', NULL, NULL, NULL, '', '0'),
('13', 'FAISAL BROTHERS', 'FAISAL BROTHERS', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('14', 'DB', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('15', 'ANWER', 'ANWER ENGGNIERING', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('16', 'OVIAS', 'MUHAMMAD ALI TRADING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('17', 'DAWOOD', 'DAWOOD TRADERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('18', 'DAWOOD', 'DAWOOD TRADERS', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('19', 'MOHSIN', 'MOHSIN ENGG', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('20', 'FAISAL', 'FAISAL &amp; SON&#039;S', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('21', 'FRIEND', 'FRIEND MACHINERY', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('22', 'JAWAID', 'JAWAID CORPORATION', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('23', 'FAISAL 2', 'FAISAL BROTHERS', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('24', 'OSAMA', 'OSAMA GENERATOR', NULL, 'SHAHRAH -E- LIAQUAT kARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('25', 'ABID MALIR', 'HUSNAN BROTHER', NULL, 'MALIR, KARACHI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('26', 'H.H C/O ABIB', 'H.H ENTERPRISES ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('27', 'ABDUL REHMAN', 'A.R. TRADERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('28', 'FAISAL MUNAWAR', 'SALEH &amp; SONS FB', NULL, 'FB AREA, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('29', 'ALI IMRAN', 'ALI IMRAN ', NULL, 'GODRAH, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('30', 'NAJAM', 'JASCO HYDRI', NULL, 'HYDRI, KARACHI', NULL, NULL, NULL, NULL, NULL, '', '0'),
('31', 'HANIF', 'SIDDIQUE GENERATOR', NULL, 'ORANGI, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('32', 'ANWAR', 'HUSSAIN &amp; SONS', NULL, 'ORANGI, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('33', 'WALI', 'MUJAHID ELECTRONIC  ', NULL, 'CUTTAL COLONY, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('34', 'JAWWAD ', 'NADEEM ELECTRONIC', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('35', 'SAMI', 'SAMI GENERATOR', NULL, 'METROVILLE, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('36', 'MAQBOOL', 'WALI ENTERPRISES', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('37', 'ADNAN', 'ADNAN POWER', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('38', 'SAJID', 'WHOLE SALE HOUSE', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('39', 'KHALID / SHAHID', 'BURKI GENERATOR', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('40', 'AL ', 'AL MAKKAH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('41', 'NIDIR', 'NADIR ELECTRONIC', NULL, 'TANDO ALLAHYAR,', NULL, NULL, NULL, NULL, NULL, '', '0'),
('42', 'MASHA ALLAH', 'MASHAALLAH ELECTRONIC', NULL, 'SULTANABAD, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('43', 'A.Z', 'A.Z MACHINERY', NULL, 'LANDHI, KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('44', 'ANAS', 'ANAS CORPORATION', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('45', 'JAMAIL', 'USHBA GENERATOR', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('46', 'ZEESHAN', 'ANSARI GENERATOR', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('47', 'ADID KHAN', 'B.TRADERS', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('48', 'AMIR', 'HE ENGINEERING', NULL, 'KARACHI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('49', 'HAFIZ TANVEER', 'ALI AHMED MACHINERY', NULL, 'SUKKUR.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('50', 'ISHAQUE', 'ABBASI GENERATOR', NULL, 'KHAIRPUR.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('51', 'RIZWAN', 'ABBASEEN AUTOS', NULL, 'D.I.KHAN.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('52', 'JUMSHAID', 'ADLIP ', NULL, 'TURBAT.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('53', 'MUSHTAQ', 'AKER ALI ABDUL ALI', NULL, 'HYDERABAD.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('54', 'SIKANDAR', 'AL BARQ MACHINERY', NULL, 'SARGODHA.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('55', 'CLASIC', 'CLASIC ELECTRONIC', NULL, 'JACOBABAD.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('56', 'ADEEL', 'DAWON RADIO', NULL, 'KHAIRPUR.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('57', 'FARAZ', 'EJAZ HARDWEAR', NULL, 'MIRPUR KHAS.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('58', 'AKBER', 'FIVE STAR MACHINERY', NULL, 'SUKKUR.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('59', 'NAZIR', 'LG ELECTRONIC', NULL, 'LARKANA.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('60', 'MAVIA', 'MAVIA ELECTRONIC', NULL, 'GAWADAR.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('61', 'YASIR', 'SINDHRI TUBEWELL', NULL, 'MORO.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('62', 'SUNDEEP', 'SUNSHINE HARDWARE', NULL, 'GOTTI.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('63', 'ABDULLAH', 'UNIVERSAL MILL STOR', NULL, 'NAWABSHAH.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('64', 'HUSNAIN', 'ZAIN SONS', NULL, 'HYDERABAD.', NULL, NULL, NULL, NULL, NULL, '', '0'),
('65', 'SUBAIR', 'ZUBAIR SOLOR', NULL, 'NAWABSHAH.', NULL, NULL, NULL, NULL, NULL, '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('8', '8', 'FAISAL BROTHERS', 'FARAZ', 'KARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('9', '9', 'ANWER ENGGNIERING', 'ANWER', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('10', '10', 'MUHAMMAD ALI TRADING', 'OVIAS', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('11', '11', 'DAWOOD TRADERS', 'DAWOOD', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('12', '12', 'DAWOOD TRADERS', 'DAWOOD', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('13', '13', 'MOHSIN ENGG', 'MOHSIN', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('14', '14', 'FAISAL &amp; SON&#039;S', 'FAISAL', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('15', '15', 'FRIEND MACHINERY', 'FRIEND', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('16', '16', 'JAWAID CORPORATION', 'JAWAID', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('17', '19', 'FAISAL BROTHERS', 'FAISAL ', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('18', '20', 'OSAMA GENERATOR', 'OSAMA', 'SHAHRAH -E- LIAQUAT kARACHI.', '2', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SHAHRAH -E- LIAQUAT kARACHI.', '0', '', NULL, '0', NULL, NULL),
('19', '21', 'HUSNAN BROTHER', 'ABID MALIR', 'MALIR, KARACHI', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'MALIR, KARACHI', '0', '', NULL, '0', NULL, NULL),
('20', '22', 'H.H ENTERPRISES ', 'H.H C/O ABIB', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('21', '23', 'A.R. TRADERS', 'ABDUL REHMAN', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('22', '24', 'SALEH &amp; SONS FB', 'FAISAL MUNAWAR', 'FB AREA, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'FB AREA, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('23', '25', 'ALI IMRAN ', 'ALI IMRAN', 'GODRAH, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'GODRAH, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('24', '26', 'JASCO HYDRI', 'NAJAM', 'HYDRI, KARACHI', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'HYDRI, KARACHI', '0', '', NULL, '0', NULL, NULL),
('25', '27', 'SIDDIQUE GENERATOR', 'HANIF', 'ORANGI, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ORANGI, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('26', '28', 'HUSSAIN &amp; SONS', 'ANWAR', 'ORANGI, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'ORANGI, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('27', '29', 'MUJAHID ELECTRONIC  ', 'WALI', 'CUTTAL COLONY, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'CUTTAL COLONY, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('28', '30', 'NADEEM ELECTRONIC', 'JAWAID ', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('29', '31', 'SAMI GENERATOR', 'SAMI', 'METROVILLE, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'METROVILLE, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('30', '32', 'WALI ENTERPRISES', 'MAQBOOL', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('31', '33', 'ADNAN POWER', 'ADNAN', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('32', '34', 'WHOLE SALE HOUSE', 'SAJID', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('33', '35', 'BURKI GENERATOR', 'KHALID / SHAHID', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('34', '36', 'AL MAKKAH', 'AL ', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('35', '37', 'NADIR ELECTRONIC', 'NIDIR', 'TANDO ALLAHYAR,', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'TANDO ALLAHYAR,', '0', '', NULL, '0', NULL, NULL),
('36', '38', 'MASHAALLAH ELECTRONIC', 'MASHA ALLAH', 'SULTANABAD, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SULTANABAD, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('37', '39', 'A.Z MACHINERY', 'A.Z', 'LANDHI, KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'LANDHI, KARACHI.', '0', '', NULL, '0', NULL, NULL),
('38', '40', 'ANAS CORPORATION', 'ANAS', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('39', '41', 'USHBA GENERATOR', 'JAMAIL', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('40', '42', 'ANSARI GENERATOR', 'ZEESHAN', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('41', '43', 'B.TRADERS', 'ADID KHAN', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('42', '44', 'HE ENGINEERING', 'AMIR', 'KARACHI.', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KARACHI.', '0', '', NULL, '0', NULL, NULL),
('43', '47', 'ALI AHMED MACHINERY', 'HAFIZ TANVEER', 'SUKKUR.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SUKKUR.', '0', '', NULL, '0', NULL, NULL),
('44', '48', 'ABBASI GENERATOR', 'ISHAQUE', 'KHAIRPUR.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KHAIRPUR.', '0', '', NULL, '0', NULL, NULL),
('45', '49', 'ABBASEEN AUTOS', 'RIZWAN', 'D.I.KHAN.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'D.I.KHAN.', '0', '', NULL, '0', NULL, NULL),
('46', '50', 'ADLIP ', 'JUMSHAID', 'TURBAT.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'TURBAT.', '0', '', NULL, '0', NULL, NULL),
('47', '51', 'AKER ALI ABDUL ALI', 'MUSHTAQ', 'HYDERABAD.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'HYDERABAD.', '0', '', NULL, '0', NULL, NULL),
('48', '52', 'AL BARQ MACHINERY', 'SIKANDAR', 'SARGODHA.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SARGODHA.', '0', '', NULL, '0', NULL, NULL),
('49', '53', 'CLASIC ELECTRONIC', 'CLASIC', 'JACOBABAD.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'JACOBABAD.', '0', '', NULL, '0', NULL, NULL),
('50', '54', 'DAWON RADIO', 'ADEEL', 'KHAIRPUR.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'KHAIRPUR.', '0', '', NULL, '0', NULL, NULL),
('51', '55', 'EJAZ HARDWEAR', 'FARAZ', 'MIRPUR KHAS.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'MIRPUR KHAS.', '0', '', NULL, '0', NULL, NULL),
('52', '56', 'FIVE STAR MACHINERY', 'AKBER', 'SUKKUR.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'SUKKUR.', '0', '', NULL, '0', NULL, NULL),
('53', '57', 'LG ELECTRONIC', 'NAZIR', 'LARKANA.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'LARKANA.', '0', '', NULL, '0', NULL, NULL),
('54', '58', 'MAVIA ELECTRONIC', 'MAVIA', 'GAWADAR.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'GAWADAR.', '0', '', NULL, '0', NULL, NULL),
('55', '59', 'SINDHRI TUBEWELL', 'YASIR', 'MORO.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'MORO.', '0', '', NULL, '0', NULL, NULL),
('56', '60', 'SUNSHINE HARDWARE', 'SUNDEEP', 'GOTTI.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'GOTTI.', '0', '', NULL, '0', NULL, NULL),
('57', '61', 'UNIVERSAL MILL STOR', 'ABDULLAH', 'NAWABSHAH.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'NAWABSHAH.', '0', '', NULL, '0', NULL, NULL),
('58', '62', 'ZAIN SONS', 'HUSNAIN', 'HYDERABAD.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'HYDERABAD.', '0', '', NULL, '0', NULL, NULL),
('59', '63', 'ZUBAIR SOLOR', 'SUBAIR', 'NAWABSHAH.', '3', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', 'NAWABSHAH.', '0', '', NULL, '0', NULL, NULL);

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
  `disc1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `disc2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
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
  `text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text4` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
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
  `credit_allowed` double NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('8', 'A.S GENERATOR', 'SHAMIM', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('9', 'ANWER ENGGNIERING', 'ANWER', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('10', 'MUHAMMAD ALI TRADING', 'OVIAS', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('11', 'NATIONAL ENGG', 'NATIONAL', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('12', 'DAWOOD TRADERS', 'DAWOOD', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('13', 'MOHSIN ENGG', 'MOHSIN', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('14', 'FAISAL &amp; SON&#039;S', 'FAISAL', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('15', 'FRIEND MACHINERY', 'FRIEND', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('16', 'JAWAID CORPORATION', 'JAWAID', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('19', 'FAISAL BROTHERS', 'FAISAL 2', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('20', 'OSAMA GENERATOR', 'OSAMA', 'SHAHRAH -E- LIAQUAT kARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('21', 'HUSNAN BROTHER', 'ABID MALIR', 'MALIR, KARACHI', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('22', 'H.H ENTERPRISES ', 'H.H C/O ABIB', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('23', 'A.R. TRADERS', 'ABDUL REHMAN', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('24', 'SALEH &amp; SONS FB', 'FAISAL MUNAWAR', 'FB AREA, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('25', 'ALI IMRAN ', 'ALI IMRAN', 'GODRAH, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('26', 'JASCO HYDRI', 'NAJAM', 'HYDRI, KARACHI', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('27', 'SIDDIQUE GENERATOR', 'HANIF', 'ORANGI, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('28', 'HUSSAIN &amp; SONS', 'ANWAR', 'ORANGI, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('29', 'MUJAHID ELECTRONIC  ', 'WALI', 'CUTTAL COLONY, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('30', 'NADEEM ELECTRONIC', 'JAWWAD ', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('31', 'SAMI GENERATOR', 'SAMI', 'METROVILLE, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('32', 'WALI ENTERPRISES', 'MAQBOOL', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('33', 'ADNAN POWER', 'ADNAN', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('34', 'WHOLE SALE HOUSE', 'SAJID', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('35', 'BURKI GENERATOR', 'KHALID / SHAHID', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('36', 'AL MAKKAH', 'AL ', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('37', 'NADIR ELECTRONIC', 'NIDIR', 'TANDO ALLAHYAR,', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('38', 'MASHAALLAH ELECTRONIC', 'MASHA ALLAH', 'SULTANABAD, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('39', 'A.Z MACHINERY', 'A.Z', 'LANDHI, KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('40', 'ANAS CORPORATION', 'ANAS', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('41', 'USHBA GENERATOR', 'JAMAIL', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('42', 'ANSARI GENERATOR', 'ZEESHAN', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('43', 'B.TRADERS', 'ADID KHAN', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('44', 'HE ENGINEERING', 'AMIR', 'KARACHI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('47', 'ALI AHMED MACHINERY', 'HAFIZ TANVEER', 'SUKKUR.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('48', 'ABBASI GENERATOR', 'ISHAQUE', 'KHAIRPUR.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('49', 'ABBASEEN AUTOS', 'RIZWAN', 'D.I.KHAN.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('50', 'ADLIP ', 'JUMSHAID', 'TURBAT.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('51', 'AKER ALI ABDUL ALI', 'MUSHTAQ', 'HYDERABAD.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('52', 'AL BARQ MACHINERY', 'SIKANDAR', 'SARGODHA.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('53', 'CLASIC ELECTRONIC', 'CLASIC', 'JACOBABAD.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('54', 'DAWON RADIO', 'ADEEL', 'KHAIRPUR.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('55', 'EJAZ HARDWEAR', 'FARAZ', 'MIRPUR KHAS.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('56', 'FIVE STAR MACHINERY', 'AKBER', 'SUKKUR.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('57', 'LG ELECTRONIC', 'NAZIR', 'LARKANA.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('58', 'MAVIA ELECTRONIC', 'MAVIA', 'GAWADAR.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('59', 'SINDHRI TUBEWELL', 'YASIR', 'MORO.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('60', 'SUNSHINE HARDWARE', 'SUNDEEP', 'GOTTI.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('61', 'UNIVERSAL MILL STOR', 'ABDULLAH', 'NAWABSHAH.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('62', 'ZAIN SONS', 'HUSNAIN', 'HYDERABAD.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('63', 'ZUBAIR SOLOR', 'SUBAIR', 'NAWABSHAH.', '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0');

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
  `text_3` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `opening` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###

INSERT INTO `0_gl_trans` VALUES
('1', '17', '1', '2017-09-26', '5014', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('2', '17', '1', '2017-09-26', '1021', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES
('2', '01', '01', 'J-1000', '9', '1', '0', '0'),
('3', '2', '2', 'J-1500', '9', '1', '0', '0'),
('6', '4', '4', 'J-1800 S/S', '9', '1', '0', '0'),
('7', '5', '5', 'J-2000 M', '9', '1', '0', '0'),
('8', '6', '6', 'J-2000 S/S', '9', '1', '0', '0'),
('9', '7', '7', 'J-2200', '9', '1', '0', '0'),
('11', '03', '03', 'J-1800 M', '9', '1', '0', '0'),
('12', '9', '9', 'J-2500 S/S', '9', '1', '0', '0'),
('15', '12', '12', 'J-3000 S/S', '9', '1', '0', '0'),
('16', '13', '13', 'J-3800', '9', '1', '0', '0'),
('17', '14', '14', 'J-5000', '9', '1', '0', '0'),
('18', '15', '15', 'J-6500', '9', '1', '0', '0'),
('19', '16', '16', 'J-6500 BN NATIONAL GAS', '9', '1', '0', '0'),
('20', '17', '17', 'J-8000', '9', '1', '0', '0'),
('21', '18', '18', 'J-12000', '9', '1', '0', '0'),
('22', '19', '19', 'J-1900 M', '11', '1', '0', '0'),
('23', '20', '20', 'J-1900 S/S', '11', '1', '0', '0'),
('24', '21', '21', 'J-2600 DC', '11', '1', '0', '0'),
('25', '22', '22', 'J-3500 DC', '11', '1', '0', '0'),
('26', '23', '23', 'J-4500 DC', '11', '1', '0', '0'),
('27', '24', '24', 'J-5000 DC', '11', '1', '0', '0'),
('28', '25', '25', 'J-7500 DC', '11', '1', '0', '0'),
('29', '26', '26', 'J-9000 DC', '11', '1', '0', '0'),
('30', '27', '27', 'J-3001 DLX', '12', '1', '0', '0'),
('31', '28', '28', 'J-4001 DLX', '12', '1', '0', '0'),
('32', '29', '29', 'J-4601 DLX', '12', '1', '0', '0'),
('33', '30', '30', 'J-8001 DLX', '12', '1', '0', '0'),
('34', '31', '31', 'J-9001 DLX', '12', '1', '0', '0'),
('35', '32', '32', 'FG-2500', '13', '1', '0', '0'),
('36', '33', '33', 'FG-2900', '13', '1', '0', '0'),
('37', '34', '34', 'FG-3200', '13', '1', '0', '0'),
('38', '35', '35', 'FG-3900', '13', '1', '0', '0'),
('39', '36', '36', 'FG-7000', '13', '1', '0', '0'),
('40', '37', '37', 'FG-7600', '13', '1', '0', '0'),
('41', '38', '38', 'FG-8800', '13', '1', '0', '0'),
('42', '39', '39', 'TD-4600', '14', '1', '0', '0'),
('43', '40', '40', 'TD-5600', '14', '1', '0', '0'),
('44', '41', '41', 'TD-7600', '14', '1', '0', '0'),
('45', '42', '42', 'TD-9600', '14', '1', '0', '0'),
('46', '43', '43', 'SK-4600', '15', '1', '0', '0'),
('47', '44', '44', 'RG-4600', '19', '1', '0', '0'),
('48', '45', '45', 'RG-5600', '19', '1', '0', '0'),
('49', '47', '47', 'FG-2200 M', '13', '1', '0', '0'),
('50', '48', '48', 'FG-2100 M', '20', '1', '0', '0'),
('51', '49', '49', 'FG-2100 S/S', '20', '1', '0', '0'),
('52', '50', '50', 'FG-3700', '20', '1', '0', '0'),
('53', '51', '51', 'FG-4700', '20', '1', '0', '0'),
('54', '52', '52', 'FG-7700', '20', '1', '0', '0'),
('55', '53', '53', 'FG-9700', '20', '1', '0', '0'),
('56', '54', '54', ' J4CM2/11/075', '6', '1', '0', '0'),
('57', '55', '55', 'J4CM2/14/100', '6', '1', '0', '0'),
('58', '56', '56', 'J4CM2/19/150', '6', '1', '0', '0'),
('59', '57', '57', 'J4CM2/25/200', '6', '1', '0', '0'),
('60', '58', '58', 'J4BM2/11/75', '6', '1', '0', '0'),
('61', '59', '59', 'J4BM2/14/100', '6', '1', '0', '0'),
('62', '60', '60', 'J4BM2/19/150', '6', '1', '0', '0'),
('63', '61', '61', 'J4BM2/25/200', '6', '1', '0', '0'),
('64', '62', '62', 'J3BM1.8/27/100', '6', '1', '0', '0'),
('65', '63', '63', 'J3CM1.8/27/100', '6', '1', '0', '0'),
('66', '64', '64', 'J3BM1.8/33/150', '6', '1', '0', '0'),
('67', '65', '65', 'J3CM1.8/33/150', '6', '1', '0', '0'),
('68', '66', '66', 'J6CSE10/16-120', '6', '1', '0', '0'),
('69', '67', '67', 'JPM80L', '21', '1', '0', '0'),
('70', '68', '68', 'JPM100L', '21', '1', '0', '0'),
('71', '69', '69', 'JPM170', '21', '1', '0', '0'),
('72', '70', '70', 'JPM140', '21', '1', '0', '0'),
('73', '71', '71', 'JPM190', '21', '1', '0', '0'),
('74', '72', '72', 'JPM200', '21', '1', '0', '0'),
('75', '73', '73', 'JPJ175', '21', '1', '0', '0'),
('76', '74', '74', 'JPS180F', '21', '1', '0', '0'),
('77', '75', '75', 'JFM5AM', '21', '1', '0', '0'),
('78', '76', '76', 'RG 2&quot;X2&quot; PUMP ', '18', '1', '0', '0'),
('79', '77', '77', 'RG 3&quot;x 3&quot; PUMP', '18', '1', '0', '0'),
('80', '78', '78', 'JASCO 2&quot; x 2&quot; PUMP', '16', '1', '0', '0'),
('81', '79', '79', 'JASCO 3&quot;x 3&quot; PUMP', '16', '1', '0', '0'),
('82', '80', '80', 'JASCO 4&quot; x 4&quot; PUMP', '16', '1', '0', '0'),
('83', '81', '81', 'FUJI 2&quot; x 2&quot; PUMP', '17', '1', '0', '0'),
('84', '82', '82', 'FUJI 3&quot; x 3&quot; PUMP', '17', '1', '0', '0'),
('85', '83', '83', 'BATTERY', '7', '1', '0', '0'),
('86', '84', '84', '3&quot; WHEEL', '7', '1', '0', '0'),
('87', '85', '85', '4&quot; WHEEL', '7', '1', '0', '0'),
('88', '86', '86', 'OIL ', '7', '1', '0', '0'),
('89', '87', '87', 'GASKIT', '7', '1', '0', '0'),
('90', '88', '88', '2 WHEEL TROLLY', '7', '1', '0', '0'),
('91', '89', '89', '8.8 KW', '22', '1', '0', '0'),
('92', '90', '90', '12.8 KW', '22', '1', '0', '0'),
('93', '91', '91', '10.8 KW', '22', '1', '0', '0'),
('94', '92', '92', '18 KW', '22', '1', '0', '0'),
('95', '93', '93', '15 KW', '22', '1', '0', '0'),
('96', '94', '94', '25 KW', '22', '1', '0', '0'),
('97', '95', '95', '32 KW', '22', '1', '0', '0'),
('98', '96', '96', '48 KW', '22', '1', '0', '0'),
('99', '97', '97', '80 KW', '22', '1', '0', '0'),
('100', '98', '98', '128 KW', '22', '1', '0', '0'),
('101', '99', '99', '150 WATTS POLLY', '24', '1', '0', '0'),
('102', '100', '100', '150 WATTS MONO', '24', '1', '0', '0'),
('103', '101', '101', '250 WATTS', '24', '1', '0', '0'),
('104', '102', '102', '150 WATTS ', '24', '1', '0', '0'),
('105', '103', '103', 'JASCO 15', '25', '1', '0', '0'),
('106', '104', '104', 'JASCO 20', '25', '1', '0', '0'),
('107', '105', '105', 'JASCO 30', '25', '1', '0', '0'),
('108', '106', '106', 'JASCO 50', '25', '1', '0', '0'),
('109', '8', '8', 'J-2500 M', '9', '1', '0', '0'),
('110', '10', '10', 'J-2500 BN NATIONAL GAS', '9', '1', '0', '0'),
('111', '11', '11', 'J-3000 M', '9', '1', '0', '0'),
('112', '46', '46', 'FG-2200 S/S', '13', '1', '0', '0');

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
('pcs', 'pcs', '-1', '0');

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
('BLD', '01', '0', NULL),
('BLD', '03', '0', NULL),
('BLD', '10', '0', NULL),
('BLD', '100', '0', NULL),
('BLD', '101', '0', NULL),
('BLD', '102', '0', NULL),
('BLD', '103', '0', NULL),
('BLD', '104', '0', NULL),
('BLD', '105', '0', NULL),
('BLD', '106', '0', NULL),
('BLD', '11', '0', NULL),
('BLD', '12', '0', NULL),
('BLD', '13', '0', NULL),
('BLD', '14', '0', NULL),
('BLD', '15', '0', NULL),
('BLD', '16', '0', NULL),
('BLD', '17', '0', NULL),
('BLD', '18', '0', NULL),
('BLD', '19', '0', NULL),
('BLD', '2', '0', NULL),
('BLD', '20', '0', NULL),
('BLD', '21', '0', NULL),
('BLD', '22', '0', NULL),
('BLD', '23', '0', NULL),
('BLD', '24', '0', NULL),
('BLD', '25', '0', NULL),
('BLD', '26', '0', NULL),
('BLD', '27', '0', NULL),
('BLD', '28', '0', NULL),
('BLD', '29', '0', NULL),
('BLD', '30', '0', NULL),
('BLD', '31', '0', NULL),
('BLD', '32', '0', NULL),
('BLD', '33', '0', NULL),
('BLD', '34', '0', NULL),
('BLD', '35', '0', NULL),
('BLD', '36', '0', NULL),
('BLD', '37', '0', NULL),
('BLD', '38', '0', NULL),
('BLD', '39', '0', NULL),
('BLD', '4', '0', NULL),
('BLD', '40', '0', NULL),
('BLD', '41', '0', NULL),
('BLD', '42', '0', NULL),
('BLD', '43', '0', NULL),
('BLD', '44', '0', NULL),
('BLD', '45', '0', NULL),
('BLD', '46', '0', NULL),
('BLD', '47', '0', NULL),
('BLD', '48', '0', NULL),
('BLD', '49', '0', NULL),
('BLD', '5', '0', NULL),
('BLD', '50', '0', NULL),
('BLD', '51', '0', NULL),
('BLD', '52', '0', NULL),
('BLD', '53', '0', NULL),
('BLD', '54', '0', NULL),
('BLD', '55', '0', NULL),
('BLD', '56', '0', NULL),
('BLD', '57', '0', NULL),
('BLD', '58', '0', NULL),
('BLD', '59', '0', NULL),
('BLD', '6', '0', NULL),
('BLD', '60', '0', NULL),
('BLD', '61', '0', NULL),
('BLD', '62', '0', NULL),
('BLD', '63', '0', NULL),
('BLD', '64', '0', NULL),
('BLD', '65', '0', NULL),
('BLD', '66', '0', NULL),
('BLD', '67', '0', NULL),
('BLD', '68', '0', NULL),
('BLD', '69', '0', NULL),
('BLD', '7', '0', NULL),
('BLD', '70', '0', NULL),
('BLD', '71', '0', NULL),
('BLD', '72', '0', NULL),
('BLD', '73', '0', NULL),
('BLD', '74', '0', NULL),
('BLD', '75', '0', NULL),
('BLD', '76', '0', NULL),
('BLD', '77', '0', NULL),
('BLD', '78', '0', NULL),
('BLD', '79', '0', NULL),
('BLD', '8', '0', NULL),
('BLD', '80', '0', NULL),
('BLD', '81', '0', NULL),
('BLD', '82', '0', NULL),
('BLD', '83', '0', NULL),
('BLD', '84', '0', NULL),
('BLD', '85', '0', NULL),
('BLD', '86', '0', NULL),
('BLD', '87', '0', NULL),
('BLD', '88', '0', NULL),
('BLD', '89', '0', NULL),
('BLD', '9', '0', NULL),
('BLD', '90', '0', NULL),
('BLD', '91', '0', NULL),
('BLD', '92', '0', NULL),
('BLD', '93', '0', NULL),
('BLD', '94', '0', NULL),
('BLD', '95', '0', NULL),
('BLD', '96', '0', NULL),
('BLD', '97', '0', NULL),
('BLD', '98', '0', NULL),
('BLD', '99', '0', NULL),
('DEF', '01', '0', NULL),
('DEF', '03', '0', NULL),
('DEF', '10', '0', NULL),
('DEF', '100', '0', NULL),
('DEF', '101', '0', NULL),
('DEF', '102', '0', NULL),
('DEF', '103', '0', NULL),
('DEF', '104', '0', NULL),
('DEF', '105', '0', NULL),
('DEF', '106', '0', NULL),
('DEF', '11', '0', NULL),
('DEF', '12', '0', NULL),
('DEF', '13', '0', NULL),
('DEF', '14', '0', NULL),
('DEF', '15', '0', NULL),
('DEF', '16', '0', NULL),
('DEF', '17', '0', NULL),
('DEF', '18', '0', NULL),
('DEF', '19', '0', NULL),
('DEF', '2', '0', NULL),
('DEF', '20', '0', NULL),
('DEF', '21', '0', NULL),
('DEF', '22', '0', NULL),
('DEF', '23', '0', NULL),
('DEF', '24', '0', NULL),
('DEF', '25', '0', NULL),
('DEF', '26', '0', NULL),
('DEF', '27', '0', NULL),
('DEF', '28', '0', NULL),
('DEF', '29', '0', NULL),
('DEF', '30', '0', NULL),
('DEF', '31', '0', NULL),
('DEF', '32', '0', NULL),
('DEF', '33', '0', NULL),
('DEF', '34', '0', NULL),
('DEF', '35', '0', NULL),
('DEF', '36', '0', NULL),
('DEF', '37', '0', NULL),
('DEF', '38', '0', NULL),
('DEF', '39', '0', NULL),
('DEF', '4', '0', NULL),
('DEF', '40', '0', NULL),
('DEF', '41', '0', NULL),
('DEF', '42', '0', NULL),
('DEF', '43', '0', NULL),
('DEF', '44', '0', NULL),
('DEF', '45', '0', NULL),
('DEF', '46', '0', NULL),
('DEF', '47', '0', NULL),
('DEF', '48', '0', NULL),
('DEF', '49', '0', NULL),
('DEF', '5', '0', NULL),
('DEF', '50', '0', NULL),
('DEF', '51', '0', NULL),
('DEF', '52', '0', NULL),
('DEF', '53', '0', NULL),
('DEF', '54', '0', NULL),
('DEF', '55', '0', NULL),
('DEF', '56', '0', NULL),
('DEF', '57', '0', NULL),
('DEF', '58', '0', NULL),
('DEF', '59', '0', NULL),
('DEF', '6', '0', NULL),
('DEF', '60', '0', NULL),
('DEF', '61', '0', NULL),
('DEF', '62', '0', NULL),
('DEF', '63', '0', NULL),
('DEF', '64', '0', NULL),
('DEF', '65', '0', NULL),
('DEF', '66', '0', NULL),
('DEF', '67', '0', NULL),
('DEF', '68', '0', NULL),
('DEF', '69', '0', NULL),
('DEF', '7', '0', NULL),
('DEF', '70', '0', NULL),
('DEF', '71', '0', NULL),
('DEF', '72', '0', NULL),
('DEF', '73', '0', NULL),
('DEF', '74', '0', NULL),
('DEF', '75', '0', NULL),
('DEF', '76', '0', NULL),
('DEF', '77', '0', NULL),
('DEF', '78', '0', NULL),
('DEF', '79', '0', NULL),
('DEF', '8', '0', NULL),
('DEF', '80', '0', NULL),
('DEF', '81', '0', NULL),
('DEF', '82', '0', NULL),
('DEF', '83', '0', NULL),
('DEF', '84', '0', NULL),
('DEF', '85', '0', NULL),
('DEF', '86', '0', NULL),
('DEF', '87', '0', NULL),
('DEF', '88', '0', NULL),
('DEF', '89', '0', NULL),
('DEF', '9', '0', NULL),
('DEF', '90', '0', NULL),
('DEF', '91', '0', NULL),
('DEF', '92', '0', NULL),
('DEF', '93', '0', NULL),
('DEF', '94', '0', NULL),
('DEF', '95', '0', NULL),
('DEF', '96', '0', NULL),
('DEF', '97', '0', NULL),
('DEF', '98', '0', NULL),
('DEF', '99', '0', NULL),
('FB', '01', '0', NULL),
('FB', '03', '0', NULL),
('FB', '10', '0', NULL),
('FB', '100', '0', NULL),
('FB', '101', '0', NULL),
('FB', '102', '0', NULL),
('FB', '103', '0', NULL),
('FB', '104', '0', NULL),
('FB', '105', '0', NULL),
('FB', '106', '0', NULL),
('FB', '11', '0', NULL),
('FB', '12', '0', NULL),
('FB', '13', '0', NULL),
('FB', '14', '0', NULL),
('FB', '15', '0', NULL),
('FB', '16', '0', NULL),
('FB', '17', '0', NULL),
('FB', '18', '0', NULL),
('FB', '19', '0', NULL),
('FB', '2', '0', NULL),
('FB', '20', '0', NULL),
('FB', '21', '0', NULL),
('FB', '22', '0', NULL),
('FB', '23', '0', NULL),
('FB', '24', '0', NULL),
('FB', '25', '0', NULL),
('FB', '26', '0', NULL),
('FB', '27', '0', NULL),
('FB', '28', '0', NULL),
('FB', '29', '0', NULL),
('FB', '30', '0', NULL),
('FB', '31', '0', NULL),
('FB', '32', '0', NULL),
('FB', '33', '0', NULL),
('FB', '34', '0', NULL),
('FB', '35', '0', NULL),
('FB', '36', '0', NULL),
('FB', '37', '0', NULL),
('FB', '38', '0', NULL),
('FB', '39', '0', NULL),
('FB', '4', '0', NULL),
('FB', '40', '0', NULL),
('FB', '41', '0', NULL),
('FB', '42', '0', NULL),
('FB', '43', '0', NULL),
('FB', '44', '0', NULL),
('FB', '45', '0', NULL),
('FB', '46', '0', NULL),
('FB', '47', '0', NULL),
('FB', '48', '0', NULL),
('FB', '49', '0', NULL),
('FB', '5', '0', NULL),
('FB', '50', '0', NULL),
('FB', '51', '0', NULL),
('FB', '52', '0', NULL),
('FB', '53', '0', NULL),
('FB', '54', '0', NULL),
('FB', '55', '0', NULL),
('FB', '56', '0', NULL),
('FB', '57', '0', NULL),
('FB', '58', '0', NULL),
('FB', '59', '0', NULL),
('FB', '6', '0', NULL),
('FB', '60', '0', NULL),
('FB', '61', '0', NULL),
('FB', '62', '0', NULL),
('FB', '63', '0', NULL),
('FB', '64', '0', NULL),
('FB', '65', '0', NULL),
('FB', '66', '0', NULL),
('FB', '67', '0', NULL),
('FB', '68', '0', NULL),
('FB', '69', '0', NULL),
('FB', '7', '0', NULL),
('FB', '70', '0', NULL),
('FB', '71', '0', NULL),
('FB', '72', '0', NULL),
('FB', '73', '0', NULL),
('FB', '74', '0', NULL),
('FB', '75', '0', NULL),
('FB', '76', '0', NULL),
('FB', '77', '0', NULL),
('FB', '78', '0', NULL),
('FB', '79', '0', NULL),
('FB', '8', '0', NULL),
('FB', '80', '0', NULL),
('FB', '81', '0', NULL),
('FB', '82', '0', NULL),
('FB', '83', '0', NULL),
('FB', '84', '0', NULL),
('FB', '85', '0', NULL),
('FB', '86', '0', NULL),
('FB', '87', '0', NULL),
('FB', '88', '0', NULL),
('FB', '89', '0', NULL),
('FB', '9', '0', NULL),
('FB', '90', '0', NULL),
('FB', '91', '0', NULL),
('FB', '92', '0', NULL),
('FB', '93', '0', NULL),
('FB', '94', '0', NULL),
('FB', '95', '0', NULL),
('FB', '96', '0', NULL),
('FB', '97', '0', NULL),
('FB', '98', '0', NULL),
('FB', '99', '0', NULL),
('ISP', '01', '0', NULL),
('ISP', '03', '0', NULL),
('ISP', '10', '0', NULL),
('ISP', '100', '0', NULL),
('ISP', '101', '0', NULL),
('ISP', '102', '0', NULL),
('ISP', '103', '0', NULL),
('ISP', '104', '0', NULL),
('ISP', '105', '0', NULL),
('ISP', '106', '0', NULL),
('ISP', '11', '0', NULL),
('ISP', '12', '0', NULL),
('ISP', '13', '0', NULL),
('ISP', '14', '0', NULL),
('ISP', '15', '0', NULL),
('ISP', '16', '0', NULL),
('ISP', '17', '0', NULL),
('ISP', '18', '0', NULL),
('ISP', '19', '0', NULL),
('ISP', '2', '0', NULL),
('ISP', '20', '0', NULL),
('ISP', '21', '0', NULL),
('ISP', '22', '0', NULL),
('ISP', '23', '0', NULL),
('ISP', '24', '0', NULL),
('ISP', '25', '0', NULL),
('ISP', '26', '0', NULL),
('ISP', '27', '0', NULL),
('ISP', '28', '0', NULL),
('ISP', '29', '0', NULL),
('ISP', '30', '0', NULL),
('ISP', '31', '0', NULL),
('ISP', '32', '0', NULL),
('ISP', '33', '0', NULL),
('ISP', '34', '0', NULL),
('ISP', '35', '0', NULL),
('ISP', '36', '0', NULL),
('ISP', '37', '0', NULL),
('ISP', '38', '0', NULL),
('ISP', '39', '0', NULL),
('ISP', '4', '0', NULL),
('ISP', '40', '0', NULL),
('ISP', '41', '0', NULL),
('ISP', '42', '0', NULL),
('ISP', '43', '0', NULL),
('ISP', '44', '0', NULL),
('ISP', '45', '0', NULL),
('ISP', '46', '0', NULL),
('ISP', '47', '0', NULL),
('ISP', '48', '0', NULL),
('ISP', '49', '0', NULL),
('ISP', '5', '0', NULL),
('ISP', '50', '0', NULL),
('ISP', '51', '0', NULL),
('ISP', '52', '0', NULL),
('ISP', '53', '0', NULL),
('ISP', '54', '0', NULL),
('ISP', '55', '0', NULL),
('ISP', '56', '0', NULL),
('ISP', '57', '0', NULL),
('ISP', '58', '0', NULL),
('ISP', '59', '0', NULL),
('ISP', '6', '0', NULL),
('ISP', '60', '0', NULL),
('ISP', '61', '0', NULL),
('ISP', '62', '0', NULL),
('ISP', '63', '0', NULL),
('ISP', '64', '0', NULL),
('ISP', '65', '0', NULL),
('ISP', '66', '0', NULL),
('ISP', '67', '0', NULL),
('ISP', '68', '0', NULL),
('ISP', '69', '0', NULL),
('ISP', '7', '0', NULL),
('ISP', '70', '0', NULL),
('ISP', '71', '0', NULL),
('ISP', '72', '0', NULL),
('ISP', '73', '0', NULL),
('ISP', '74', '0', NULL),
('ISP', '75', '0', NULL),
('ISP', '76', '0', NULL),
('ISP', '77', '0', NULL),
('ISP', '78', '0', NULL),
('ISP', '79', '0', NULL),
('ISP', '8', '0', NULL),
('ISP', '80', '0', NULL),
('ISP', '81', '0', NULL),
('ISP', '82', '0', NULL),
('ISP', '83', '0', NULL),
('ISP', '84', '0', NULL),
('ISP', '85', '0', NULL),
('ISP', '86', '0', NULL),
('ISP', '87', '0', NULL),
('ISP', '88', '0', NULL),
('ISP', '89', '0', NULL),
('ISP', '9', '0', NULL),
('ISP', '90', '0', NULL),
('ISP', '91', '0', NULL),
('ISP', '92', '0', NULL),
('ISP', '93', '0', NULL),
('ISP', '94', '0', NULL),
('ISP', '95', '0', NULL),
('ISP', '96', '0', NULL),
('ISP', '97', '0', NULL),
('ISP', '98', '0', NULL),
('ISP', '99', '0', NULL),
('JS', '01', '0', NULL),
('JS', '03', '0', NULL),
('JS', '10', '0', NULL),
('JS', '100', '0', NULL),
('JS', '101', '0', NULL),
('JS', '102', '0', NULL),
('JS', '103', '0', NULL),
('JS', '104', '0', NULL),
('JS', '105', '0', NULL),
('JS', '106', '0', NULL),
('JS', '11', '0', NULL),
('JS', '12', '0', NULL),
('JS', '13', '0', NULL),
('JS', '14', '0', NULL),
('JS', '15', '0', NULL),
('JS', '16', '0', NULL),
('JS', '17', '0', NULL),
('JS', '18', '0', NULL),
('JS', '19', '0', NULL),
('JS', '2', '0', NULL),
('JS', '20', '0', NULL),
('JS', '21', '0', NULL),
('JS', '22', '0', NULL),
('JS', '23', '0', NULL),
('JS', '24', '0', NULL),
('JS', '25', '0', NULL),
('JS', '26', '0', NULL),
('JS', '27', '0', NULL),
('JS', '28', '0', NULL),
('JS', '29', '0', NULL),
('JS', '30', '0', NULL),
('JS', '31', '0', NULL),
('JS', '32', '0', NULL),
('JS', '33', '0', NULL),
('JS', '34', '0', NULL),
('JS', '35', '0', NULL),
('JS', '36', '0', NULL),
('JS', '37', '0', NULL),
('JS', '38', '0', NULL),
('JS', '39', '0', NULL),
('JS', '4', '0', NULL),
('JS', '40', '0', NULL),
('JS', '41', '0', NULL),
('JS', '42', '0', NULL),
('JS', '43', '0', NULL),
('JS', '44', '0', NULL),
('JS', '45', '0', NULL),
('JS', '46', '0', NULL),
('JS', '47', '0', NULL),
('JS', '48', '0', NULL),
('JS', '49', '0', NULL),
('JS', '5', '0', NULL),
('JS', '50', '0', NULL),
('JS', '51', '0', NULL),
('JS', '52', '0', NULL),
('JS', '53', '0', NULL),
('JS', '54', '0', NULL),
('JS', '55', '0', NULL),
('JS', '56', '0', NULL),
('JS', '57', '0', NULL),
('JS', '58', '0', NULL),
('JS', '59', '0', NULL),
('JS', '6', '0', NULL),
('JS', '60', '0', NULL),
('JS', '61', '0', NULL),
('JS', '62', '0', NULL),
('JS', '63', '0', NULL),
('JS', '64', '0', NULL),
('JS', '65', '0', NULL),
('JS', '66', '0', NULL),
('JS', '67', '0', NULL),
('JS', '68', '0', NULL),
('JS', '69', '0', NULL),
('JS', '7', '0', NULL),
('JS', '70', '0', NULL),
('JS', '71', '0', NULL),
('JS', '72', '0', NULL),
('JS', '73', '0', NULL),
('JS', '74', '0', NULL),
('JS', '75', '0', NULL),
('JS', '76', '0', NULL),
('JS', '77', '0', NULL),
('JS', '78', '0', NULL),
('JS', '79', '0', NULL),
('JS', '8', '0', NULL),
('JS', '80', '0', NULL),
('JS', '81', '0', NULL),
('JS', '82', '0', NULL),
('JS', '83', '0', NULL),
('JS', '84', '0', NULL),
('JS', '85', '0', NULL),
('JS', '86', '0', NULL),
('JS', '87', '0', NULL),
('JS', '88', '0', NULL),
('JS', '89', '0', NULL),
('JS', '9', '0', NULL),
('JS', '90', '0', NULL),
('JS', '91', '0', NULL),
('JS', '92', '0', NULL),
('JS', '93', '0', NULL),
('JS', '94', '0', NULL),
('JS', '95', '0', NULL),
('JS', '96', '0', NULL),
('JS', '97', '0', NULL),
('JS', '98', '0', NULL),
('JS', '99', '0', NULL),
('KOR', '01', '0', NULL),
('KOR', '03', '0', NULL),
('KOR', '10', '0', NULL),
('KOR', '100', '0', NULL),
('KOR', '101', '0', NULL),
('KOR', '102', '0', NULL),
('KOR', '103', '0', NULL),
('KOR', '104', '0', NULL),
('KOR', '105', '0', NULL),
('KOR', '106', '0', NULL),
('KOR', '11', '0', NULL),
('KOR', '12', '0', NULL),
('KOR', '13', '0', NULL),
('KOR', '14', '0', NULL),
('KOR', '15', '0', NULL),
('KOR', '16', '0', NULL),
('KOR', '17', '0', NULL),
('KOR', '18', '0', NULL),
('KOR', '19', '0', NULL),
('KOR', '2', '0', NULL),
('KOR', '20', '0', NULL),
('KOR', '21', '0', NULL),
('KOR', '22', '0', NULL),
('KOR', '23', '0', NULL),
('KOR', '24', '0', NULL),
('KOR', '25', '0', NULL),
('KOR', '26', '0', NULL),
('KOR', '27', '0', NULL),
('KOR', '28', '0', NULL),
('KOR', '29', '0', NULL),
('KOR', '30', '0', NULL),
('KOR', '31', '0', NULL),
('KOR', '32', '0', NULL),
('KOR', '33', '0', NULL),
('KOR', '34', '0', NULL),
('KOR', '35', '0', NULL),
('KOR', '36', '0', NULL),
('KOR', '37', '0', NULL),
('KOR', '38', '0', NULL),
('KOR', '39', '0', NULL),
('KOR', '4', '0', NULL),
('KOR', '40', '0', NULL),
('KOR', '41', '0', NULL),
('KOR', '42', '0', NULL),
('KOR', '43', '0', NULL),
('KOR', '44', '0', NULL),
('KOR', '45', '0', NULL),
('KOR', '46', '0', NULL),
('KOR', '47', '0', NULL),
('KOR', '48', '0', NULL),
('KOR', '49', '0', NULL),
('KOR', '5', '0', NULL),
('KOR', '50', '0', NULL),
('KOR', '51', '0', NULL),
('KOR', '52', '0', NULL),
('KOR', '53', '0', NULL),
('KOR', '54', '0', NULL),
('KOR', '55', '0', NULL),
('KOR', '56', '0', NULL),
('KOR', '57', '0', NULL),
('KOR', '58', '0', NULL),
('KOR', '59', '0', NULL),
('KOR', '6', '0', NULL),
('KOR', '60', '0', NULL),
('KOR', '61', '0', NULL),
('KOR', '62', '0', NULL),
('KOR', '63', '0', NULL),
('KOR', '64', '0', NULL),
('KOR', '65', '0', NULL),
('KOR', '66', '0', NULL),
('KOR', '67', '0', NULL),
('KOR', '68', '0', NULL),
('KOR', '69', '0', NULL),
('KOR', '7', '0', NULL),
('KOR', '70', '0', NULL),
('KOR', '71', '0', NULL),
('KOR', '72', '0', NULL),
('KOR', '73', '0', NULL),
('KOR', '74', '0', NULL),
('KOR', '75', '0', NULL),
('KOR', '76', '0', NULL),
('KOR', '77', '0', NULL),
('KOR', '78', '0', NULL),
('KOR', '79', '0', NULL),
('KOR', '8', '0', NULL),
('KOR', '80', '0', NULL),
('KOR', '81', '0', NULL),
('KOR', '82', '0', NULL),
('KOR', '83', '0', NULL),
('KOR', '84', '0', NULL),
('KOR', '85', '0', NULL),
('KOR', '86', '0', NULL),
('KOR', '87', '0', NULL),
('KOR', '88', '0', NULL),
('KOR', '89', '0', NULL),
('KOR', '9', '0', NULL),
('KOR', '90', '0', NULL),
('KOR', '91', '0', NULL),
('KOR', '92', '0', NULL),
('KOR', '93', '0', NULL),
('KOR', '94', '0', NULL),
('KOR', '95', '0', NULL),
('KOR', '96', '0', NULL),
('KOR', '97', '0', NULL),
('KOR', '98', '0', NULL),
('KOR', '99', '0', NULL),
('KW', '01', '0', NULL),
('KW', '03', '0', NULL),
('KW', '10', '0', NULL),
('KW', '100', '0', NULL),
('KW', '101', '0', NULL),
('KW', '102', '0', NULL),
('KW', '103', '0', NULL),
('KW', '104', '0', NULL),
('KW', '105', '0', NULL),
('KW', '106', '0', NULL),
('KW', '11', '0', NULL),
('KW', '12', '0', NULL),
('KW', '13', '0', NULL),
('KW', '14', '0', NULL),
('KW', '15', '0', NULL),
('KW', '16', '0', NULL),
('KW', '17', '0', NULL),
('KW', '18', '0', NULL),
('KW', '19', '0', NULL),
('KW', '2', '0', NULL),
('KW', '20', '0', NULL),
('KW', '21', '0', NULL),
('KW', '22', '0', NULL),
('KW', '23', '0', NULL),
('KW', '24', '0', NULL),
('KW', '25', '0', NULL),
('KW', '26', '0', NULL),
('KW', '27', '0', NULL),
('KW', '28', '0', NULL),
('KW', '29', '0', NULL),
('KW', '30', '0', NULL),
('KW', '31', '0', NULL),
('KW', '32', '0', NULL),
('KW', '33', '0', NULL),
('KW', '34', '0', NULL),
('KW', '35', '0', NULL),
('KW', '36', '0', NULL),
('KW', '37', '0', NULL),
('KW', '38', '0', NULL),
('KW', '39', '0', NULL),
('KW', '4', '0', NULL),
('KW', '40', '0', NULL),
('KW', '41', '0', NULL),
('KW', '42', '0', NULL),
('KW', '43', '0', NULL),
('KW', '44', '0', NULL),
('KW', '45', '0', NULL),
('KW', '46', '0', NULL),
('KW', '47', '0', NULL),
('KW', '48', '0', NULL),
('KW', '49', '0', NULL),
('KW', '5', '0', NULL),
('KW', '50', '0', NULL),
('KW', '51', '0', NULL),
('KW', '52', '0', NULL),
('KW', '53', '0', NULL),
('KW', '54', '0', NULL),
('KW', '55', '0', NULL),
('KW', '56', '0', NULL),
('KW', '57', '0', NULL),
('KW', '58', '0', NULL),
('KW', '59', '0', NULL),
('KW', '6', '0', NULL),
('KW', '60', '0', NULL),
('KW', '61', '0', NULL),
('KW', '62', '0', NULL),
('KW', '63', '0', NULL),
('KW', '64', '0', NULL),
('KW', '65', '0', NULL),
('KW', '66', '0', NULL),
('KW', '67', '0', NULL),
('KW', '68', '0', NULL),
('KW', '69', '0', NULL),
('KW', '7', '0', NULL),
('KW', '70', '0', NULL),
('KW', '71', '0', NULL),
('KW', '72', '0', NULL),
('KW', '73', '0', NULL),
('KW', '74', '0', NULL),
('KW', '75', '0', NULL),
('KW', '76', '0', NULL),
('KW', '77', '0', NULL),
('KW', '78', '0', NULL),
('KW', '79', '0', NULL),
('KW', '8', '0', NULL),
('KW', '80', '0', NULL),
('KW', '81', '0', NULL),
('KW', '82', '0', NULL),
('KW', '83', '0', NULL),
('KW', '84', '0', NULL),
('KW', '85', '0', NULL),
('KW', '86', '0', NULL),
('KW', '87', '0', NULL),
('KW', '88', '0', NULL),
('KW', '89', '0', NULL),
('KW', '9', '0', NULL),
('KW', '90', '0', NULL),
('KW', '91', '0', NULL),
('KW', '92', '0', NULL),
('KW', '93', '0', NULL),
('KW', '94', '0', NULL),
('KW', '95', '0', NULL),
('KW', '96', '0', NULL),
('KW', '97', '0', NULL),
('KW', '98', '0', NULL),
('KW', '99', '0', NULL),
('MMI', '01', '0', NULL),
('MMI', '03', '0', NULL),
('MMI', '10', '0', NULL),
('MMI', '100', '0', NULL),
('MMI', '101', '0', NULL),
('MMI', '102', '0', NULL),
('MMI', '103', '0', NULL),
('MMI', '104', '0', NULL),
('MMI', '105', '0', NULL),
('MMI', '106', '0', NULL),
('MMI', '11', '0', NULL),
('MMI', '12', '0', NULL),
('MMI', '13', '0', NULL),
('MMI', '14', '0', NULL),
('MMI', '15', '0', NULL),
('MMI', '16', '0', NULL),
('MMI', '17', '0', NULL),
('MMI', '18', '0', NULL),
('MMI', '19', '0', NULL),
('MMI', '2', '0', NULL),
('MMI', '20', '0', NULL),
('MMI', '21', '0', NULL),
('MMI', '22', '0', NULL),
('MMI', '23', '0', NULL),
('MMI', '24', '0', NULL),
('MMI', '25', '0', NULL),
('MMI', '26', '0', NULL),
('MMI', '27', '0', NULL),
('MMI', '28', '0', NULL),
('MMI', '29', '0', NULL),
('MMI', '30', '0', NULL),
('MMI', '31', '0', NULL),
('MMI', '32', '0', NULL),
('MMI', '33', '0', NULL),
('MMI', '34', '0', NULL),
('MMI', '35', '0', NULL),
('MMI', '36', '0', NULL),
('MMI', '37', '0', NULL),
('MMI', '38', '0', NULL),
('MMI', '39', '0', NULL),
('MMI', '4', '0', NULL),
('MMI', '40', '0', NULL),
('MMI', '41', '0', NULL),
('MMI', '42', '0', NULL),
('MMI', '43', '0', NULL),
('MMI', '44', '0', NULL),
('MMI', '45', '0', NULL),
('MMI', '46', '0', NULL),
('MMI', '47', '0', NULL),
('MMI', '48', '0', NULL),
('MMI', '49', '0', NULL),
('MMI', '5', '0', NULL),
('MMI', '50', '0', NULL),
('MMI', '51', '0', NULL),
('MMI', '52', '0', NULL),
('MMI', '53', '0', NULL),
('MMI', '54', '0', NULL),
('MMI', '55', '0', NULL),
('MMI', '56', '0', NULL),
('MMI', '57', '0', NULL),
('MMI', '58', '0', NULL),
('MMI', '59', '0', NULL),
('MMI', '6', '0', NULL),
('MMI', '60', '0', NULL),
('MMI', '61', '0', NULL),
('MMI', '62', '0', NULL),
('MMI', '63', '0', NULL),
('MMI', '64', '0', NULL),
('MMI', '65', '0', NULL),
('MMI', '66', '0', NULL),
('MMI', '67', '0', NULL),
('MMI', '68', '0', NULL),
('MMI', '69', '0', NULL),
('MMI', '7', '0', NULL),
('MMI', '70', '0', NULL),
('MMI', '71', '0', NULL),
('MMI', '72', '0', NULL),
('MMI', '73', '0', NULL),
('MMI', '74', '0', NULL),
('MMI', '75', '0', NULL),
('MMI', '76', '0', NULL),
('MMI', '77', '0', NULL),
('MMI', '78', '0', NULL),
('MMI', '79', '0', NULL),
('MMI', '8', '0', NULL),
('MMI', '80', '0', NULL),
('MMI', '81', '0', NULL),
('MMI', '82', '0', NULL),
('MMI', '83', '0', NULL),
('MMI', '84', '0', NULL),
('MMI', '85', '0', NULL),
('MMI', '86', '0', NULL),
('MMI', '87', '0', NULL),
('MMI', '88', '0', NULL),
('MMI', '89', '0', NULL),
('MMI', '9', '0', NULL),
('MMI', '90', '0', NULL),
('MMI', '91', '0', NULL),
('MMI', '92', '0', NULL),
('MMI', '93', '0', NULL),
('MMI', '94', '0', NULL),
('MMI', '95', '0', NULL),
('MMI', '96', '0', NULL),
('MMI', '97', '0', NULL),
('MMI', '98', '0', NULL),
('MMI', '99', '0', NULL),
('MW', '01', '0', NULL),
('MW', '03', '0', NULL),
('MW', '10', '0', NULL),
('MW', '100', '0', NULL),
('MW', '101', '0', NULL),
('MW', '102', '0', NULL),
('MW', '103', '0', NULL),
('MW', '104', '0', NULL),
('MW', '105', '0', NULL),
('MW', '106', '0', NULL),
('MW', '11', '0', NULL),
('MW', '12', '0', NULL),
('MW', '13', '0', NULL),
('MW', '14', '0', NULL),
('MW', '15', '0', NULL),
('MW', '16', '0', NULL),
('MW', '17', '0', NULL),
('MW', '18', '0', NULL),
('MW', '19', '0', NULL),
('MW', '2', '0', NULL),
('MW', '20', '0', NULL),
('MW', '21', '0', NULL),
('MW', '22', '0', NULL),
('MW', '23', '0', NULL),
('MW', '24', '0', NULL),
('MW', '25', '0', NULL),
('MW', '26', '0', NULL),
('MW', '27', '0', NULL),
('MW', '28', '0', NULL),
('MW', '29', '0', NULL),
('MW', '30', '0', NULL),
('MW', '31', '0', NULL),
('MW', '32', '0', NULL),
('MW', '33', '0', NULL),
('MW', '34', '0', NULL),
('MW', '35', '0', NULL),
('MW', '36', '0', NULL),
('MW', '37', '0', NULL),
('MW', '38', '0', NULL),
('MW', '39', '0', NULL),
('MW', '4', '0', NULL),
('MW', '40', '0', NULL),
('MW', '41', '0', NULL),
('MW', '42', '0', NULL),
('MW', '43', '0', NULL),
('MW', '44', '0', NULL),
('MW', '45', '0', NULL),
('MW', '46', '0', NULL),
('MW', '47', '0', NULL),
('MW', '48', '0', NULL),
('MW', '49', '0', NULL),
('MW', '5', '0', NULL),
('MW', '50', '0', NULL),
('MW', '51', '0', NULL),
('MW', '52', '0', NULL),
('MW', '53', '0', NULL),
('MW', '54', '0', NULL),
('MW', '55', '0', NULL),
('MW', '56', '0', NULL),
('MW', '57', '0', NULL),
('MW', '58', '0', NULL),
('MW', '59', '0', NULL),
('MW', '6', '0', NULL),
('MW', '60', '0', NULL),
('MW', '61', '0', NULL),
('MW', '62', '0', NULL),
('MW', '63', '0', NULL),
('MW', '64', '0', NULL),
('MW', '65', '0', NULL),
('MW', '66', '0', NULL),
('MW', '67', '0', NULL),
('MW', '68', '0', NULL),
('MW', '69', '0', NULL),
('MW', '7', '0', NULL),
('MW', '70', '0', NULL),
('MW', '71', '0', NULL),
('MW', '72', '0', NULL),
('MW', '73', '0', NULL),
('MW', '74', '0', NULL),
('MW', '75', '0', NULL),
('MW', '76', '0', NULL),
('MW', '77', '0', NULL),
('MW', '78', '0', NULL),
('MW', '79', '0', NULL),
('MW', '8', '0', NULL),
('MW', '80', '0', NULL),
('MW', '81', '0', NULL),
('MW', '82', '0', NULL),
('MW', '83', '0', NULL),
('MW', '84', '0', NULL),
('MW', '85', '0', NULL),
('MW', '86', '0', NULL),
('MW', '87', '0', NULL),
('MW', '88', '0', NULL),
('MW', '89', '0', NULL),
('MW', '9', '0', NULL),
('MW', '90', '0', NULL),
('MW', '91', '0', NULL),
('MW', '92', '0', NULL),
('MW', '93', '0', NULL),
('MW', '94', '0', NULL),
('MW', '95', '0', NULL),
('MW', '96', '0', NULL),
('MW', '97', '0', NULL),
('MW', '98', '0', NULL),
('MW', '99', '0', NULL),
('N JNP', '01', '0', NULL),
('N JNP', '03', '0', NULL),
('N JNP', '10', '0', NULL),
('N JNP', '100', '0', NULL),
('N JNP', '101', '0', NULL),
('N JNP', '102', '0', NULL),
('N JNP', '103', '0', NULL),
('N JNP', '104', '0', NULL),
('N JNP', '105', '0', NULL),
('N JNP', '106', '0', NULL),
('N JNP', '11', '0', NULL),
('N JNP', '12', '0', NULL),
('N JNP', '13', '0', NULL),
('N JNP', '14', '0', NULL),
('N JNP', '15', '0', NULL),
('N JNP', '16', '0', NULL),
('N JNP', '17', '0', NULL),
('N JNP', '18', '0', NULL),
('N JNP', '19', '0', NULL),
('N JNP', '2', '0', NULL),
('N JNP', '20', '0', NULL),
('N JNP', '21', '0', NULL),
('N JNP', '22', '0', NULL),
('N JNP', '23', '0', NULL),
('N JNP', '24', '0', NULL),
('N JNP', '25', '0', NULL),
('N JNP', '26', '0', NULL),
('N JNP', '27', '0', NULL),
('N JNP', '28', '0', NULL),
('N JNP', '29', '0', NULL),
('N JNP', '30', '0', NULL),
('N JNP', '31', '0', NULL),
('N JNP', '32', '0', NULL),
('N JNP', '33', '0', NULL),
('N JNP', '34', '0', NULL),
('N JNP', '35', '0', NULL),
('N JNP', '36', '0', NULL),
('N JNP', '37', '0', NULL),
('N JNP', '38', '0', NULL),
('N JNP', '39', '0', NULL),
('N JNP', '4', '0', NULL),
('N JNP', '40', '0', NULL),
('N JNP', '41', '0', NULL),
('N JNP', '42', '0', NULL),
('N JNP', '43', '0', NULL),
('N JNP', '44', '0', NULL),
('N JNP', '45', '0', NULL),
('N JNP', '46', '0', NULL),
('N JNP', '47', '0', NULL),
('N JNP', '48', '0', NULL),
('N JNP', '49', '0', NULL),
('N JNP', '5', '0', NULL),
('N JNP', '50', '0', NULL),
('N JNP', '51', '0', NULL),
('N JNP', '52', '0', NULL),
('N JNP', '53', '0', NULL),
('N JNP', '54', '0', NULL),
('N JNP', '55', '0', NULL),
('N JNP', '56', '0', NULL),
('N JNP', '57', '0', NULL),
('N JNP', '58', '0', NULL),
('N JNP', '59', '0', NULL),
('N JNP', '6', '0', NULL),
('N JNP', '60', '0', NULL),
('N JNP', '61', '0', NULL),
('N JNP', '62', '0', NULL),
('N JNP', '63', '0', NULL),
('N JNP', '64', '0', NULL),
('N JNP', '65', '0', NULL),
('N JNP', '66', '0', NULL),
('N JNP', '67', '0', NULL),
('N JNP', '68', '0', NULL),
('N JNP', '69', '0', NULL),
('N JNP', '7', '0', NULL),
('N JNP', '70', '0', NULL),
('N JNP', '71', '0', NULL),
('N JNP', '72', '0', NULL),
('N JNP', '73', '0', NULL),
('N JNP', '74', '0', NULL),
('N JNP', '75', '0', NULL),
('N JNP', '76', '0', NULL),
('N JNP', '77', '0', NULL),
('N JNP', '78', '0', NULL),
('N JNP', '79', '0', NULL),
('N JNP', '8', '0', NULL),
('N JNP', '80', '0', NULL),
('N JNP', '81', '0', NULL),
('N JNP', '82', '0', NULL),
('N JNP', '83', '0', NULL),
('N JNP', '84', '0', NULL),
('N JNP', '85', '0', NULL),
('N JNP', '86', '0', NULL),
('N JNP', '87', '0', NULL),
('N JNP', '88', '0', NULL),
('N JNP', '89', '0', NULL),
('N JNP', '9', '0', NULL),
('N JNP', '90', '0', NULL),
('N JNP', '91', '0', NULL),
('N JNP', '92', '0', NULL),
('N JNP', '93', '0', NULL),
('N JNP', '94', '0', NULL),
('N JNP', '95', '0', NULL),
('N JNP', '96', '0', NULL),
('N JNP', '97', '0', NULL),
('N JNP', '98', '0', NULL),
('N JNP', '99', '0', NULL),
('Q BAD', '01', '0', NULL),
('Q BAD', '03', '0', NULL),
('Q BAD', '10', '0', NULL),
('Q BAD', '100', '0', NULL),
('Q BAD', '101', '0', NULL),
('Q BAD', '102', '0', NULL),
('Q BAD', '103', '0', NULL),
('Q BAD', '104', '0', NULL),
('Q BAD', '105', '0', NULL),
('Q BAD', '106', '0', NULL),
('Q BAD', '11', '0', NULL),
('Q BAD', '12', '0', NULL),
('Q BAD', '13', '0', NULL),
('Q BAD', '14', '0', NULL),
('Q BAD', '15', '0', NULL),
('Q BAD', '16', '0', NULL),
('Q BAD', '17', '0', NULL),
('Q BAD', '18', '0', NULL),
('Q BAD', '19', '0', NULL),
('Q BAD', '2', '0', NULL),
('Q BAD', '20', '0', NULL),
('Q BAD', '21', '0', NULL),
('Q BAD', '22', '0', NULL),
('Q BAD', '23', '0', NULL),
('Q BAD', '24', '0', NULL),
('Q BAD', '25', '0', NULL),
('Q BAD', '26', '0', NULL),
('Q BAD', '27', '0', NULL),
('Q BAD', '28', '0', NULL),
('Q BAD', '29', '0', NULL),
('Q BAD', '30', '0', NULL),
('Q BAD', '31', '0', NULL),
('Q BAD', '32', '0', NULL),
('Q BAD', '33', '0', NULL),
('Q BAD', '34', '0', NULL),
('Q BAD', '35', '0', NULL),
('Q BAD', '36', '0', NULL),
('Q BAD', '37', '0', NULL),
('Q BAD', '38', '0', NULL),
('Q BAD', '39', '0', NULL),
('Q BAD', '4', '0', NULL),
('Q BAD', '40', '0', NULL),
('Q BAD', '41', '0', NULL),
('Q BAD', '42', '0', NULL),
('Q BAD', '43', '0', NULL),
('Q BAD', '44', '0', NULL),
('Q BAD', '45', '0', NULL),
('Q BAD', '46', '0', NULL),
('Q BAD', '47', '0', NULL),
('Q BAD', '48', '0', NULL),
('Q BAD', '49', '0', NULL),
('Q BAD', '5', '0', NULL),
('Q BAD', '50', '0', NULL),
('Q BAD', '51', '0', NULL),
('Q BAD', '52', '0', NULL),
('Q BAD', '53', '0', NULL),
('Q BAD', '54', '0', NULL),
('Q BAD', '55', '0', NULL),
('Q BAD', '56', '0', NULL),
('Q BAD', '57', '0', NULL),
('Q BAD', '58', '0', NULL),
('Q BAD', '59', '0', NULL),
('Q BAD', '6', '0', NULL),
('Q BAD', '60', '0', NULL),
('Q BAD', '61', '0', NULL),
('Q BAD', '62', '0', NULL),
('Q BAD', '63', '0', NULL),
('Q BAD', '64', '0', NULL),
('Q BAD', '65', '0', NULL),
('Q BAD', '66', '0', NULL),
('Q BAD', '67', '0', NULL),
('Q BAD', '68', '0', NULL),
('Q BAD', '69', '0', NULL),
('Q BAD', '7', '0', NULL),
('Q BAD', '70', '0', NULL),
('Q BAD', '71', '0', NULL),
('Q BAD', '72', '0', NULL),
('Q BAD', '73', '0', NULL),
('Q BAD', '74', '0', NULL),
('Q BAD', '75', '0', NULL),
('Q BAD', '76', '0', NULL),
('Q BAD', '77', '0', NULL),
('Q BAD', '78', '0', NULL),
('Q BAD', '79', '0', NULL),
('Q BAD', '8', '0', NULL),
('Q BAD', '80', '0', NULL),
('Q BAD', '81', '0', NULL),
('Q BAD', '82', '0', NULL),
('Q BAD', '83', '0', NULL),
('Q BAD', '84', '0', NULL),
('Q BAD', '85', '0', NULL),
('Q BAD', '86', '0', NULL),
('Q BAD', '87', '0', NULL),
('Q BAD', '88', '0', NULL),
('Q BAD', '89', '0', NULL),
('Q BAD', '9', '0', NULL),
('Q BAD', '90', '0', NULL),
('Q BAD', '91', '0', NULL),
('Q BAD', '92', '0', NULL),
('Q BAD', '93', '0', NULL),
('Q BAD', '94', '0', NULL),
('Q BAD', '95', '0', NULL),
('Q BAD', '96', '0', NULL),
('Q BAD', '97', '0', NULL),
('Q BAD', '98', '0', NULL),
('Q BAD', '99', '0', NULL),
('SD', '01', '0', NULL),
('SD', '03', '0', NULL),
('SD', '10', '0', NULL),
('SD', '100', '0', NULL),
('SD', '101', '0', NULL),
('SD', '102', '0', NULL),
('SD', '103', '0', NULL),
('SD', '104', '0', NULL),
('SD', '105', '0', NULL),
('SD', '106', '0', NULL),
('SD', '11', '0', NULL),
('SD', '12', '0', NULL),
('SD', '13', '0', NULL),
('SD', '14', '0', NULL),
('SD', '15', '0', NULL),
('SD', '16', '0', NULL),
('SD', '17', '0', NULL),
('SD', '18', '0', NULL),
('SD', '19', '0', NULL),
('SD', '2', '0', NULL),
('SD', '20', '0', NULL),
('SD', '21', '0', NULL),
('SD', '22', '0', NULL),
('SD', '23', '0', NULL),
('SD', '24', '0', NULL),
('SD', '25', '0', NULL),
('SD', '26', '0', NULL),
('SD', '27', '0', NULL),
('SD', '28', '0', NULL),
('SD', '29', '0', NULL),
('SD', '30', '0', NULL),
('SD', '31', '0', NULL),
('SD', '32', '0', NULL),
('SD', '33', '0', NULL),
('SD', '34', '0', NULL),
('SD', '35', '0', NULL),
('SD', '36', '0', NULL),
('SD', '37', '0', NULL),
('SD', '38', '0', NULL),
('SD', '39', '0', NULL),
('SD', '4', '0', NULL),
('SD', '40', '0', NULL),
('SD', '41', '0', NULL),
('SD', '42', '0', NULL),
('SD', '43', '0', NULL),
('SD', '44', '0', NULL),
('SD', '45', '0', NULL),
('SD', '46', '0', NULL),
('SD', '47', '0', NULL),
('SD', '48', '0', NULL),
('SD', '49', '0', NULL),
('SD', '5', '0', NULL),
('SD', '50', '0', NULL),
('SD', '51', '0', NULL),
('SD', '52', '0', NULL),
('SD', '53', '0', NULL),
('SD', '54', '0', NULL),
('SD', '55', '0', NULL),
('SD', '56', '0', NULL),
('SD', '57', '0', NULL),
('SD', '58', '0', NULL),
('SD', '59', '0', NULL),
('SD', '6', '0', NULL),
('SD', '60', '0', NULL),
('SD', '61', '0', NULL),
('SD', '62', '0', NULL),
('SD', '63', '0', NULL),
('SD', '64', '0', NULL),
('SD', '65', '0', NULL),
('SD', '66', '0', NULL),
('SD', '67', '0', NULL),
('SD', '68', '0', NULL),
('SD', '69', '0', NULL),
('SD', '7', '0', NULL),
('SD', '70', '0', NULL),
('SD', '71', '0', NULL),
('SD', '72', '0', NULL),
('SD', '73', '0', NULL),
('SD', '74', '0', NULL),
('SD', '75', '0', NULL),
('SD', '76', '0', NULL),
('SD', '77', '0', NULL),
('SD', '78', '0', NULL),
('SD', '79', '0', NULL),
('SD', '8', '0', NULL),
('SD', '80', '0', NULL),
('SD', '81', '0', NULL),
('SD', '82', '0', NULL),
('SD', '83', '0', NULL),
('SD', '84', '0', NULL),
('SD', '85', '0', NULL),
('SD', '86', '0', NULL),
('SD', '87', '0', NULL),
('SD', '88', '0', NULL),
('SD', '89', '0', NULL),
('SD', '9', '0', NULL),
('SD', '90', '0', NULL),
('SD', '91', '0', NULL),
('SD', '92', '0', NULL),
('SD', '93', '0', NULL),
('SD', '94', '0', NULL),
('SD', '95', '0', NULL),
('SD', '96', '0', NULL),
('SD', '97', '0', NULL),
('SD', '98', '0', NULL),
('SD', '99', '0', NULL),
('SF C', '01', '0', NULL),
('SF C', '03', '0', NULL),
('SF C', '10', '0', NULL),
('SF C', '100', '0', NULL),
('SF C', '101', '0', NULL),
('SF C', '102', '0', NULL),
('SF C', '103', '0', NULL),
('SF C', '104', '0', NULL),
('SF C', '105', '0', NULL),
('SF C', '106', '0', NULL),
('SF C', '11', '0', NULL),
('SF C', '12', '0', NULL),
('SF C', '13', '0', NULL),
('SF C', '14', '0', NULL),
('SF C', '15', '0', NULL),
('SF C', '16', '0', NULL),
('SF C', '17', '0', NULL),
('SF C', '18', '0', NULL),
('SF C', '19', '0', NULL),
('SF C', '2', '0', NULL),
('SF C', '20', '0', NULL),
('SF C', '21', '0', NULL),
('SF C', '22', '0', NULL),
('SF C', '23', '0', NULL),
('SF C', '24', '0', NULL),
('SF C', '25', '0', NULL),
('SF C', '26', '0', NULL),
('SF C', '27', '0', NULL),
('SF C', '28', '0', NULL),
('SF C', '29', '0', NULL),
('SF C', '30', '0', NULL),
('SF C', '31', '0', NULL),
('SF C', '32', '0', NULL),
('SF C', '33', '0', NULL),
('SF C', '34', '0', NULL),
('SF C', '35', '0', NULL),
('SF C', '36', '0', NULL),
('SF C', '37', '0', NULL),
('SF C', '38', '0', NULL),
('SF C', '39', '0', NULL),
('SF C', '4', '0', NULL),
('SF C', '40', '0', NULL),
('SF C', '41', '0', NULL),
('SF C', '42', '0', NULL),
('SF C', '43', '0', NULL),
('SF C', '44', '0', NULL),
('SF C', '45', '0', NULL),
('SF C', '46', '0', NULL),
('SF C', '47', '0', NULL),
('SF C', '48', '0', NULL),
('SF C', '49', '0', NULL),
('SF C', '5', '0', NULL),
('SF C', '50', '0', NULL),
('SF C', '51', '0', NULL),
('SF C', '52', '0', NULL),
('SF C', '53', '0', NULL),
('SF C', '54', '0', NULL),
('SF C', '55', '0', NULL),
('SF C', '56', '0', NULL),
('SF C', '57', '0', NULL),
('SF C', '58', '0', NULL),
('SF C', '59', '0', NULL),
('SF C', '6', '0', NULL),
('SF C', '60', '0', NULL),
('SF C', '61', '0', NULL),
('SF C', '62', '0', NULL),
('SF C', '63', '0', NULL),
('SF C', '64', '0', NULL),
('SF C', '65', '0', NULL),
('SF C', '66', '0', NULL),
('SF C', '67', '0', NULL),
('SF C', '68', '0', NULL),
('SF C', '69', '0', NULL),
('SF C', '7', '0', NULL),
('SF C', '70', '0', NULL),
('SF C', '71', '0', NULL),
('SF C', '72', '0', NULL),
('SF C', '73', '0', NULL),
('SF C', '74', '0', NULL),
('SF C', '75', '0', NULL),
('SF C', '76', '0', NULL),
('SF C', '77', '0', NULL),
('SF C', '78', '0', NULL),
('SF C', '79', '0', NULL),
('SF C', '8', '0', NULL),
('SF C', '80', '0', NULL),
('SF C', '81', '0', NULL),
('SF C', '82', '0', NULL),
('SF C', '83', '0', NULL),
('SF C', '84', '0', NULL),
('SF C', '85', '0', NULL),
('SF C', '86', '0', NULL),
('SF C', '87', '0', NULL),
('SF C', '88', '0', NULL),
('SF C', '89', '0', NULL),
('SF C', '9', '0', NULL),
('SF C', '90', '0', NULL),
('SF C', '91', '0', NULL),
('SF C', '92', '0', NULL),
('SF C', '93', '0', NULL),
('SF C', '94', '0', NULL),
('SF C', '95', '0', NULL),
('SF C', '96', '0', NULL),
('SF C', '97', '0', NULL),
('SF C', '98', '0', NULL),
('SF C', '99', '0', NULL),
('SM', '01', '0', NULL),
('SM', '03', '0', NULL),
('SM', '10', '0', NULL),
('SM', '100', '0', NULL),
('SM', '101', '0', NULL),
('SM', '102', '0', NULL),
('SM', '103', '0', NULL),
('SM', '104', '0', NULL),
('SM', '105', '0', NULL),
('SM', '106', '0', NULL),
('SM', '11', '0', NULL),
('SM', '12', '0', NULL),
('SM', '13', '0', NULL),
('SM', '14', '0', NULL),
('SM', '15', '0', NULL),
('SM', '16', '0', NULL),
('SM', '17', '0', NULL),
('SM', '18', '0', NULL),
('SM', '19', '0', NULL),
('SM', '2', '0', NULL),
('SM', '20', '0', NULL),
('SM', '21', '0', NULL),
('SM', '22', '0', NULL),
('SM', '23', '0', NULL),
('SM', '24', '0', NULL),
('SM', '25', '0', NULL),
('SM', '26', '0', NULL),
('SM', '27', '0', NULL),
('SM', '28', '0', NULL),
('SM', '29', '0', NULL),
('SM', '30', '0', NULL),
('SM', '31', '0', NULL),
('SM', '32', '0', NULL),
('SM', '33', '0', NULL),
('SM', '34', '0', NULL),
('SM', '35', '0', NULL),
('SM', '36', '0', NULL),
('SM', '37', '0', NULL),
('SM', '38', '0', NULL),
('SM', '39', '0', NULL),
('SM', '4', '0', NULL),
('SM', '40', '0', NULL),
('SM', '41', '0', NULL),
('SM', '42', '0', NULL),
('SM', '43', '0', NULL),
('SM', '44', '0', NULL),
('SM', '45', '0', NULL),
('SM', '46', '0', NULL),
('SM', '47', '0', NULL),
('SM', '48', '0', NULL),
('SM', '49', '0', NULL),
('SM', '5', '0', NULL),
('SM', '50', '0', NULL),
('SM', '51', '0', NULL),
('SM', '52', '0', NULL),
('SM', '53', '0', NULL),
('SM', '54', '0', NULL),
('SM', '55', '0', NULL),
('SM', '56', '0', NULL),
('SM', '57', '0', NULL),
('SM', '58', '0', NULL),
('SM', '59', '0', NULL),
('SM', '6', '0', NULL),
('SM', '60', '0', NULL),
('SM', '61', '0', NULL),
('SM', '62', '0', NULL),
('SM', '63', '0', NULL),
('SM', '64', '0', NULL),
('SM', '65', '0', NULL),
('SM', '66', '0', NULL),
('SM', '67', '0', NULL),
('SM', '68', '0', NULL),
('SM', '69', '0', NULL),
('SM', '7', '0', NULL),
('SM', '70', '0', NULL),
('SM', '71', '0', NULL),
('SM', '72', '0', NULL),
('SM', '73', '0', NULL),
('SM', '74', '0', NULL),
('SM', '75', '0', NULL),
('SM', '76', '0', NULL),
('SM', '77', '0', NULL),
('SM', '78', '0', NULL),
('SM', '79', '0', NULL),
('SM', '8', '0', NULL),
('SM', '80', '0', NULL),
('SM', '81', '0', NULL),
('SM', '82', '0', NULL),
('SM', '83', '0', NULL),
('SM', '84', '0', NULL),
('SM', '85', '0', NULL),
('SM', '86', '0', NULL),
('SM', '87', '0', NULL),
('SM', '88', '0', NULL),
('SM', '89', '0', NULL),
('SM', '9', '0', NULL),
('SM', '90', '0', NULL),
('SM', '91', '0', NULL),
('SM', '92', '0', NULL),
('SM', '93', '0', NULL),
('SM', '94', '0', NULL),
('SM', '95', '0', NULL),
('SM', '96', '0', NULL),
('SM', '97', '0', NULL),
('SM', '98', '0', NULL),
('SM', '99', '0', NULL);

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
('BLD', 'Jasco Power Baldia', 'Shop # 1, Plot # 1725/5407, Madina Colony, Tipu Sultan Road, Baldia Town Karachi.', '32819725', '', '0092-21-32411304', '', '', '0', '0'),
('DEF', 'Mian Chamber', 'Main Chamber Shahrah -e- Liaquat Opp,Sindh Madressah Market Karachi. 74000', '32424872-32420705', '', '0092-21-32411304', 'subhanj@hotmail.com', '', '0', '0'),
('FB', 'Faisal Brothers', 'Shop # 18, Sindh Madressah Market Shahrah -e- Liaquat  Karachi. 74000', '32427931-32437944', '', '32411304', '', '', '0', '0'),
('ISP', 'Jasco Power Ispahani', 'Shop # 23, Rabia Patel, Abul Hassan Ispahani Road, KDA Scheme 33, Karachi.', '34657168', '', '0092-21-32411304', '', '', '0', '0'),
('JS', 'J.S.Enterprises', 'Shop # 9- 10, Sindh Madressah Market, Shahrah -e- Liaquat Karachi. 74000', '32420558-32423774', '32428811', '0092-21-32411304', 'subhanj@hotmail.com', '', '0', '0'),
('KOR', 'Jasco Power Korangi ', 'Shop # 32, Area O, Korangi Karachi.', '35122488', '', '0092-21-32411304', '', '', '0', '0'),
('KW', 'Kawish Crown Plaza', '3, 4, 5, Showroom. Kawish Crown, Opp, Duty Free Shop Main Shahrah -e- Faisal Karachi.', '34387550-2', '', '0092-21-34330039', 'faisalj@jasco.com.pk', '', '0', '0'),
('MMI', 'M.M.Ispahani Ltd.', '31, west Wharf Road # 4, Karachi.', '', '', '', '', '', '0', '0'),
('MW', 'Mandviwalla Estates ', 'Old Queens Road Karachi.', '', '', '', '', '', '0', '0'),
('N JNP', 'Jasco Power Nasir Jump', 'L / 75, Gali # 1, Sector 32 /E Nasir Jump Karachi.', '35120510', '', '0092-21-32411304', '', '', '0', '0'),
('Q BAD', 'Jasco Power Quaidabad', 'Near Jama Masjid Rahmania Quaidabad Karachi.', '3', '', '0092-21-32411304', '', '', '0', '0'),
('SD', 'Sadique Godwon', 'Old Queens Road Karachi.', '', '', '', '', '', '0', '0'),
('SF C', 'Jasco Power Shah Faisal ', 'Shah Faisal Colony Karachi.', '34163136', '', '0092-21-32411304', '', '', '0', '0'),
('SM', 'Sindh Madressah Market', 'Shop #  18-19,  Sindh Madressah Market, Shahrah -e- Liaquat Karachi. 74000', '32420627-32411856', '', '0092-21-32411304', 'shoaibj@hotmail.com', '', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_payment_terms` ###

INSERT INTO `0_payment_terms` VALUES
('3', 'Payment due within 10 days', '10', '0', '0'),
('4', 'Cash Only', '0', '0', '0'),
('5', '90 Days', '90', '0', '0'),
('6', 'Advance Payment', '-1', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('4', '1002', '2', 'PKR', '200'),
('5', '001', '1', 'PKR', '77.72'),
('6', '34', '1', 'PKR', '39000');

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
('2', '2', '0', '', '1', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
('24', '42', 'CRV', '{001}/{MM}/{YYYY}', '', '1', '0');

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
('1', '17', 'IA001/09/2017');

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
  `make_po` int(11) DEFAULT NULL,
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
  `con_factor` double NOT NULL,
  `text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text4` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
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
('2', 'System Administrator', 'System Administrator', '512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;9216;9472;9728;10496;10752;11008;13056;13312;15616;15872;16128;484352;943104;1008640', '513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;775;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;9217;9218;9220;9473;9474;9475;9476;9729;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15630;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;15884;16129;16130;16131;16132;484452;943204;943205;1008740', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('6', 'JASCO WATER PUMP SUBMERSIBLE ', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('7', 'GENERATOR ACCSSORIES', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('8', 'COMPRESOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('9', 'JASCO GENERATOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('10', 'ENGINE', '1', 'pcs', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('11', 'GOLDEN GENERATOR SERIES', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('12', 'RED GENERATOR SERIES', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('13', 'FUJI GENERATOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('14', 'TORCH GENERATOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('15', 'SPARK GENERATOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('16', 'JASCO PUMP', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('17', 'FUJI PUMP', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('18', 'RIGGRD PUMP', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('19', 'RIGGED GENERATOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('20', 'FUJI GENERATOR BLACK SERIES', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('21', 'JASCO WATER PUMP', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('22', 'ALTERNATORS', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('23', 'SOLAR PANEL', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('24', 'SOLOR ', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('25', 'JASCO DIESEL GENERATOR', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0');

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
('01', '9', '1', 'J-1000', '2 STOCK, 800 W, SINGLE PHASE, 50Hz, ', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('03', '9', '1', 'J-1800 M', '800 W,SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('10', '9', '1', 'J-2500 BN NATIONAL GAS', '2200 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('100', '24', '1', '150 WATTS MONO', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('101', '24', '1', '250 WATTS', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('102', '24', '1', '150 WATTS ', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('103', '25', '1', 'JASCO 15', '380 V, THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('104', '25', '1', 'JASCO 20', '380 V, THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('105', '25', '1', 'JASCO 30', '380 V, THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('106', '25', '1', 'JASCO 50', '380 V, THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('11', '9', '1', 'J-3000 M', '2500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('12', '9', '1', 'J-3000 S/S', '2500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('13', '9', '1', 'J-3800', '3100 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('14', '9', '1', 'J-5000', '4500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('15', '9', '1', 'J-6500', '550 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('16', '9', '1', 'J-6500 BN NATIONAL GAS', '4500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('17', '9', '1', 'J-8000', '6500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('18', '9', '1', 'J-12000', 'MAX 9500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('19', '11', '1', 'J-1900 M', '1100 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('2', '9', '1', 'J-1500', '8500 W, SINGLE PHASE WITH CANOPY, 50Hz, 220V\r\n\r\n', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('20', '11', '1', 'J-1900 S/S', '1100 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('21', '11', '1', 'J-2600 DC', '1600 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('22', '11', '1', 'J-3500 DC', '2400 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('23', '11', '1', 'J-4500 DC', '2800 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('24', '11', '1', 'J-5000 DC', '3000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('25', '11', '1', 'J-7500 DC', '5500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('26', '11', '1', 'J-9000 DC', '6500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('27', '12', '1', 'J-3001 DLX', '2200 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('28', '12', '1', 'J-4001 DLX', '2800 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('29', '12', '1', 'J-4601 DLX', '3000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('30', '12', '1', 'J-8001 DLX', '5500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('31', '12', '1', 'J-9001 DLX', '6500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('32', '13', '1', 'FG-2500', '1600 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('33', '13', '1', 'FG-2900', '2400 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('34', '13', '1', 'FG-3200', '2800 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('35', '13', '1', 'FG-3900', '3000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('36', '13', '1', 'FG-7000', '6100 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('37', '13', '1', 'FG-7600', '7000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('38', '13', '1', 'FG-8800', '8000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('39', '14', '1', 'TD-4600', '2800 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('4', '9', '1', 'J-1800 S/S', '1200 W, SINGLE PHASE, 50 Hz, 1200 W', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('40', '14', '1', 'TD-5600', '3000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('41', '14', '1', 'TD-7600', '5500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('42', '14', '1', 'TD-9600', '6500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('43', '15', '1', 'SK-4600', '2800 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('44', '19', '1', 'RG-4600', '2800 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('45', '19', '1', 'RG-5600', '3000 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('46', '13', '1', 'FG-2200 S/S', '1200 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('47', '13', '1', 'FG-2200 M', '1200 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('48', '20', '1', 'FG-2100 M', '1200 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('49', '20', '1', 'FG-2100 S/S', '1200 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('5', '9', '1', 'J-2000 M', '1200W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('50', '20', '1', 'FG-3700', '2500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('51', '20', '1', 'FG-4700', '3100 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('52', '20', '1', 'FG-7700', '5500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('53', '20', '1', 'FG-9700', '6500 W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('54', '6', '1', ' J4CM2/11/075', ' 0.75 HP,  64 MTR,  15 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('55', '6', '1', 'J4CM2/14/100', '1 HP,  83 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('56', '6', '1', 'J4CM2/19/150', '1.5 HP,  111 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('57', '6', '1', 'J4CM2/25/200', '2 HP,  178 MTR TO 81 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('58', '6', '1', 'J4BM2/11/75', '0.75 HP,  77 MTR TO 34 MTR,  15 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('59', '6', '1', 'J4BM2/14/100', '1 HP,  99 MTR TO 43 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('6', '9', '1', 'J-2000 S/S', '1200W, SINGLE PHASE, 50 Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('60', '6', '1', 'J4BM2/19/150', '1.5 HP,  135 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('61', '6', '1', 'J4BM2/25/200', '2 HP,  178 MTR TO 81 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('62', '6', '1', 'J3BM1.8/27/100', '1 HP,  113 MTR TO 44 MTR,  10 TO 45 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('63', '6', '1', 'J3CM1.8/27/100', '1 HP,  11 MTR TO 44 MTR,  10 TO 45 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('64', '6', '1', 'J3BM1.8/33/150', '1.5 HP,  139 MTR TO 53 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('65', '6', '1', 'J3CM1.8/33/150', '1.5 HP,  139 MTR TO 53 MTR,  10 TO 55 LTR, OUTLET 1.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('66', '6', '1', 'J6CSE10/16-120', '12 HP,  210 MTR TO 97 MTR,  OUTLET 2.5m CABLES', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('67', '21', '1', 'JPM80L', '1.5 HP,  33 LTR HEAD 40 MTR', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('68', '21', '1', 'JPM100L', '1 HP,  60 MTR HEAD 60 MTR', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('69', '21', '1', 'JPM170', '1 HP,  32 MTR HEAD 120 MTR', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('7', '9', '1', 'J-2200', '1500 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('70', '21', '1', 'JPM140', '0.5 HP,  22 MTR HEAD 160 MTR', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('71', '21', '1', 'JPM190', '1.5 HP,  40 MTR HEAD 130 MTR', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('72', '21', '1', 'JPM200', '2 HP', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('73', '21', '1', 'JPJ175', '1 HP', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('74', '21', '1', 'JPS180F', '1 HP', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('75', '21', '1', 'JFM5AM', 'SHFm5AM', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('76', '18', '1', 'RG 2&quot;X2&quot; PUMP ', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('77', '18', '1', 'RG 3&quot;x 3&quot; PUMP', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('78', '16', '1', 'JASCO 2&quot; x 2&quot; PUMP', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('79', '16', '1', 'JASCO 3&quot;x 3&quot; PUMP', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('8', '9', '1', 'J-2500 M', '2200 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('80', '16', '1', 'JASCO 4&quot; x 4&quot; PUMP', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('81', '17', '1', 'FUJI 2&quot; x 2&quot; PUMP', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('82', '17', '1', 'FUJI 3&quot; x 3&quot; PUMP', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('83', '7', '1', 'BATTERY', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('84', '7', '1', '3&quot; WHEEL', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('85', '7', '1', '4&quot; WHEEL', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('86', '7', '1', 'OIL ', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('87', '7', '1', 'GASKIT', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('88', '7', '1', '2 WHEEL TROLLY', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('89', '22', '1', '8.8 KW', 'SINGLE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '12000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('9', '9', '1', 'J-2500 S/S', '2200 W, SINGLE PHASE, 50Hz, 220V', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('90', '22', '1', '12.8 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('91', '22', '1', '10.8 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('92', '22', '1', '18 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('93', '22', '1', '15 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('94', '22', '1', '25 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('95', '22', '1', '32 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('96', '22', '1', '48 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('97', '22', '1', '80 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('98', '22', '1', '128 KW', 'THREE PHASE', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('99', '24', '1', '150 WATTS POLLY', '', 'PCS', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', '', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '');

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
  `text1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text4` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text5` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text6` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
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
  `Unit_Amt` double DEFAULT NULL,
  `Gross_Amt` double DEFAULT NULL,
  `As_Per_B_E` double DEFAULT NULL,
  `Landing` double DEFAULT NULL,
  `Landing_Amt` double DEFAULT NULL,
  `Value_invl_Landing` double DEFAULT NULL,
  `INS` double DEFAULT NULL,
  `INS_Amt` double DEFAULT NULL,
  `Value_Incl_INC` double DEFAULT NULL,
  `F_E_D` double DEFAULT NULL,
  `F_E_D_Amt` double DEFAULT NULL,
  `Duty` double DEFAULT NULL,
  `Duty_Amt` double DEFAULT NULL,
  `Value_And_Duty` double DEFAULT NULL,
  `Value_Excl_S_T` double DEFAULT NULL,
  `S_T` double DEFAULT NULL,
  `S_T_Amt` double DEFAULT NULL,
  `Amount_Incl_S_T` double DEFAULT NULL,
  `I_Tax` double DEFAULT NULL,
  `I_Tax_Amt` double DEFAULT NULL,
  `Add_S_T` double DEFAULT NULL,
  `Add_S_T_Amt` double DEFAULT NULL,
  `Total_Charges` double DEFAULT NULL,
  `Other_Expense` double DEFAULT NULL,
  `Net_Amount` double DEFAULT NULL,
  `Job_Name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Total_Other_Expenses` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Gross_Amt_new` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `gross_rate` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total_` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('6', 'DB', 'DB', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0');

### Structure of table `0_sys_pay_pref_new` ###

DROP TABLE IF EXISTS `0_sys_pay_pref_new`;

CREATE TABLE `0_sys_pay_pref_new` (
  `name` varchar(35) NOT NULL,
  `account` tinytext NOT NULL,
  `text_name` varchar(60) NOT NULL,
  `default_value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_sys_pay_pref_new` ###


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
('coy_name', 'setup.company', 'varchar', '60', 'JASCO POWER'),
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
('discount_algorithm', 'glsetup.sales', 'INT', '11', '6'),
('discount1', 'glsetup.sales', 'varchar', '15', '4025'),
('discount2', 'glsetup.sales', 'varchar', '15', '4025'),
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
('postal_address', 'setup.company', 'tinytext', '0', '5, MAIN CHAMBER SHAHRAH E LIQUAT'),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '5030'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '5016'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '3021'),
('round_to', 'setup.company', 'int', '5', '1'),
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
('use_manufacturing', 'setup.company', 'tinyint', '1', '0'),
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
('gl_account_classes_text', 'GL Account CLasses'),
('sale_order_entry_text', 'Sale Order Entry'),
('journal_entry', '1'),
('user_account_setup_text', 'User Account Setup'),
('invoice_prepaid_order_text', 'Invoice Prepaid Orders'),
('invoice_prepaid_order', '1'),
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
('gl_account_classes_text', 'GL Account CLasses'),
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_user_locations` ###

INSERT INTO `0_user_locations` VALUES
('1', 'DEF', '12', '0'),
('2', 'DEF', '20', '0'),
('3', 'DEF', '21', '0'),
('4', 'DEF', '22', '0'),
('5', 'DEF', '23', '0'),
('6', 'SM', '23', '0'),
('7', 'DEF', '24', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2283 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###

INSERT INTO `0_useronline` VALUES
('2274', '1507548711', '182.184.110.66', '/gl/manage/gl_accounts.php'),
('2275', '1507548723', '182.184.110.66', '/index.php'),
('2276', '1507548730', '182.184.110.66', '/gl/manage/gl_accounts.php'),
('2277', '1507548748', '182.184.110.66', '/gl/manage/gl_accounts.php'),
('2278', '1507548756', '182.184.110.66', '/gl/manage/gl_accounts.php'),
('2279', '1507548786', '182.184.110.66', '/index.php'),
('2280', '1507548787', '182.184.110.66', '/admin/display_prefs.php'),
('2281', '1507548788', '182.184.110.66', '/index.php'),
('2282', '1507548793', '182.184.110.66', '/admin/backups.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('12', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Admin', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-09 11:12:10', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('20', 'faisal', '81dc9bdb52d04dc20036dbd8313ed055', 'Faisal Jahangir', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-09-18 12:10:55', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('21', 'rabia', '81dc9bdb52d04dc20036dbd8313ed055', 'Rabia Raees', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-09-26 13:02:57', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('22', 'tooba', '81dc9bdb52d04dc20036dbd8313ed055', 'Tooba Pervez', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-09-22 15:51:26', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('23', 'habiba', '81dc9bdb52d04dc20036dbd8313ed055', 'Habib Rafiq', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-09 16:21:01', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('24', 'Sarwat Ali', '960b819e7922bef48dde0fc9fd266aab', 'Sarwat Ali', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-04 12:24:46', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
('17', '1', '2017-09-26', '');

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
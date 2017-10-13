# MySQL dump of database 'cloudso1_mtg' on host 'localhost'
# Backup Date and Time: 2017-10-10 17:36
# Built by Hisaab.pk 2.4.2
# http://www.hisaab.pk
# Company: MTG
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_accounts` ###

INSERT INTO `0_bank_accounts` VALUES
('10121', '0', 'CUSTOMER PO ACCOUNT', '', 'CUSTOMER PO ACCOUNT', NULL, 'PKR', '0', '1', '101291', '0000-00-00 00:00:00', '0', '0'),
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
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `inactive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

### Data of table `0_batch` ###

INSERT INTO `0_batch` VALUES
('0', '', '0'),
('0', '9348590', '0'),
('0', '98789u', '0'),
('0', '', '0'),
('0', 't76767', '0'),
('0', '780-0', '0'),
('0', '', '0'),
('0', '87687', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '8987', '0'),
('0', '4323', '0'),
('0', '78632', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '45363', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0'),
('0', '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bom` ###

INSERT INTO `0_bom` VALUES
('1', '2001', '1001', '1', 'DEF', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_categories` ###

INSERT INTO `0_cashflow_categories` VALUES
('1', 'Cash Received From Customers', '1', '1', '0'),
('2', 'Cash paid for', '1', '0', '0'),
('3', 'Cash Received From', '2', '1', '0'),
('4', 'Cash paid for', '2', '0', '0'),
('5', 'Cash Received From', '3', '1', '0'),
('6', 'Cash paid for', '3', '0', '0');

### Structure of table `0_cashflow_gl` ###

DROP TABLE IF EXISTS `0_cashflow_gl`;

CREATE TABLE `0_cashflow_gl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashflow_category_id` int(11) NOT NULL,
  `gl_account` int(11) NOT NULL,
  `inactive` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_gl` ###

INSERT INTO `0_cashflow_gl` VALUES
('14', '1', '4024', '0'),
('15', '1', '1013', '0'),
('16', '4', '10123', '0'),
('17', '4', '10123', '0'),
('18', '5', '1018', '0'),
('19', '2', '4024', '0'),
('20', '2', '1013', '0'),
('21', '2', '1013', '0');

### Structure of table `0_cashflow_type` ###

DROP TABLE IF EXISTS `0_cashflow_type`;

CREATE TABLE `0_cashflow_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `inactive` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_type` ###

INSERT INTO `0_cashflow_type` VALUES
('1', 'Operating Activities', '0'),
('2', 'Investing Activities', '0'),
('3', 'Financing Activities', '0');

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
('10122', '', 'SCB', '1012', '0'),
('10123', '', 'Bank 3', '1012', '0'),
('101291', '', 'CUSTOMER PO ACCOUNT', '1012', '0'),
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
('2019', '', 'HACPL', '201', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_1` ###

INSERT INTO `0_combo_so_1` VALUES
('2', 'Combo 1-B', '0'),
('3', 'Combo 1-C', '0'),
('4', 'Combo 1-A', '0');

### Structure of table `0_combo_so_2` ###

DROP TABLE IF EXISTS `0_combo_so_2`;

CREATE TABLE `0_combo_so_2` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_2` ###

INSERT INTO `0_combo_so_2` VALUES
('1', 'Combo 2-A', '0'),
('2', 'Combo 2-B', '0'),
('3', 'Combo 2-C', '0');

### Structure of table `0_combo_so_3` ###

DROP TABLE IF EXISTS `0_combo_so_3`;

CREATE TABLE `0_combo_so_3` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_3` ###

INSERT INTO `0_combo_so_3` VALUES
('1', 'Combo 3-A', '0'),
('2', 'Combo 3-B', '0'),
('3', 'Combo 2-B', '0');

### Structure of table `0_combo_so_4` ###

DROP TABLE IF EXISTS `0_combo_so_4`;

CREATE TABLE `0_combo_so_4` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_4` ###

INSERT INTO `0_combo_so_4` VALUES
('1', 'Combo 4-B', '0'),
('2', 'Combo 4-C', '0'),
('3', 'Combo 4-A', '0');

### Structure of table `0_combo_so_5` ###

DROP TABLE IF EXISTS `0_combo_so_5`;

CREATE TABLE `0_combo_so_5` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_5` ###

INSERT INTO `0_combo_so_5` VALUES
('1', 'Combo 5-A', '0'),
('2', 'Combo 5-B', '0'),
('3', 'Combo 5-C', '0');

### Structure of table `0_combo_so_6` ###

DROP TABLE IF EXISTS `0_combo_so_6`;

CREATE TABLE `0_combo_so_6` (
  `combo_code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`combo_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_combo_so_6` ###

INSERT INTO `0_combo_so_6` VALUES
('2', 'Combo 6-B', '0'),
('5', 'Combo 6-A', '0'),
('6', 'Combo 6-C', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###


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
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `text_3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `opening` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disc1` double DEFAULT NULL,
  `disc2` double DEFAULT NULL,
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
  `units_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `con_factor` double NOT NULL,
  `text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
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
  `opening` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###


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
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cheque_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
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
('f_text1', 'Text Field 4', '4', '1', '13', '0', '10', '10'),
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
('h_text1', '', '4', '0', '0', '0', '0', '0'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###


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
('amount1', 'Factor', '1', '1', '1', '1', '19', '0', '10', '10'),
('amount2', 'Width(Inch)/Paper', '1', '1', '0', '0', '2', '0', '10', '10'),
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
('boxes', 'boxes', '-1', '0'),
('ltr', 'litre', '-1', '0'),
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
('DEF', 'Default', 'N/A', '', '', '', 'emailsent@gmail.com', '', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES
('4', '1002', '2', 'PKR', '200'),
('5', '001', '1', 'PKR', '77.72'),
('13', '2002', '1', 'PKR', '1537000'),
('14', '3001', '1', 'PKR', '49800'),
('15', '007', '1', 'PKR', '100'),
('17', '00002', '1', 'PKR', '1800'),
('18', '00003', '1', 'PKR', '2500'),
('19', 'CIVICOUMF', '1', 'PKR', '2722000'),
('20', 'CITYMT1.3MU', '1', 'PKR', '1567000'),
('21', 'CITYMT1.3UNF', '1', 'PKR', '1637000'),
('22', 'CITYMT1.3UF', '1', 'PKR', '1567000'),
('23', '900', '1', 'PKR', '15000'),
('24', '901', '1', 'PKR', '12000'),
('25', '902', '1', 'PKR', '10500'),
('26', '904', '1', 'PKR', '5000');

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
  `op_po` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receive_ref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
('19', '30', 'SO', '{001}/{MM}/{YYYY}', '10912', '1', '0'),
('20', '32', 'SQ', '{001}/{MM}/{YYYY}', '110', '1', '0'),
('21', '35', 'CU', '{001}/{MM}/{YYYY}', '', '1', '0'),
('22', '40', 'CC', '{001}/{MM}/{YYYY}', '', '1', '0'),
('23', '41', 'CPV', '{001}/{MM}/{YYYY}', '', '1', '0'),
('24', '42', 'CRV', '{001}/{MM}/{YYYY}', '', '1', '0'),
('25', '43', '', '{001}/{YYYY}', '', '1', '0'),
('26', '10', 'GST', '{001}/{MM}/{YYYY}', '107', '0', '0'),
('27', '32', 'GST', '{001}/{MM}/{YYYY}', '109', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_requisition_details` ###

INSERT INTO `0_requisition_details` VALUES
('1', '2', '1001', NULL, '0', '10', '2555', '10', '2555', 'abc', '0'),
('2', '2', '1001', NULL, '0', '100', '12000', '100', '12000', '1233', '0'),
('3', '4', '1001', '0', '0', '100', '12000', '100', '12000', 'qqqq', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_requisitions` ###

INSERT INTO `0_requisitions` VALUES
('1', 'aasdsdd', 'xxdfcfg', '2017-09-14 03:51:21', '0', '0', '0', 'xxdff'),
('2', 'aasdfgh azyz', 'axyz', '2017-09-14 04:18:25', '1', '0', '0', 'ayz'),
('3', 'saa', 'aaaaa', '2017-09-15 10:37:15', '0', '0', '0', 'aaaa'),
('4', 'aaa', 'aaa', '2017-09-15 10:37:59', '1', '0', '0', 'aaaa');

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
('amount_1', 'WIDTH (INCH)', '0'),
('amount_2', 'LENGTH', '0'),
('amount_3', 'No. Of Units', '0'),
('amount_4', 'amount_4', '0'),
('amount_5', 'amount_5', '0'),
('amount_6', 'amount_6', '0'),
('date1', 'DATE1', '1'),
('date2', 'DATE2', '1'),
('date3', 'Date3', '1'),
('f_combo1', 'footer_combo1', '0'),
('f_combo2', 'footer_combo2', '0'),
('f_combo3', 'Footer Combo 3', '0'),
('h_combo1', 'Combo 1', '0'),
('h_combo2', 'Combo 2', '0'),
('h_combo3', 'Combo 3', '0'),
('so_cart1', 'T1', '0'),
('so_cart2', 'T2', '0'),
('so_cart3', 'T3', '0'),
('so_cart4', 'T4', '0'),
('so_cart5', 'jhg', '0'),
('so_cart6', 'gjh', '0'),
('so_footer_long_text1', 'klhkhjkj', '0'),
('so_footer_long_text2', 'gjh', '0'),
('so_footer_long_text3', 'g', '0'),
('so_footer_long_text4', 'jh', '0'),
('so_footer_long_text5', 'gjh', '0'),
('so_footer_long_text6', 'jhg', '0'),
('so_header_combo1', 'Combo 1', '0'),
('so_header_combo2', 'Combo 2', '0'),
('so_header_combo3', 'Combo 3', '0'),
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
('total_amount', '4', '0'),
('total_date', '3', '0'),
('total_footer', '1', '1'),
('total_footer_text', '1', '0'),
('total_headers', '4', '0'),
('total_headers2', '3', '0'),
('total_headers_long', '1', '0'),
('total_header_text', '1', '0'),
('total_h_combo', '1', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_salesman` ###

INSERT INTO `0_salesman` VALUES
('1', 'Rizwan', '021-2168563', '021-5646545', 'rizwan@honda-sf.com', '5', '1000', '4', '0'),
('3', 'Uzair', '021-3546621', '021-2156462', 'uzair@honda-sf.com', '5', '10000', '4', '0'),
('4', 'Zahid', '021-3546621', '021-2156462', 'zahid@honda-sf.com', '5', '1000', '4', '0');

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
  `shipping_account` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipper_id`),
  UNIQUE KEY `name` (`shipper_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_shippers` ###

INSERT INTO `0_shippers` VALUES
('1', 'Default', '', '', '', '', '4021', '0'),
('2', 'AHG-421', '', '', '', '', '5032', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('2', 'Material', '1', 'each', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('3', 'Supplies', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('6', 'Color', '1', 'pcs', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('7', 'Vehicle', '1', 'pcs', 'D', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('8', 'Home-Furniture', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('9', 'Computer Acessories', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('10', 'Telephone, Mobile Phones etc', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('11', 'Books and Cards Etc.', '2', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('12', 'Television, Electronics Etc.', '2', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0');

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
  `text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
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
  `combo_so_1` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_2` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_4` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_5` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `combo_so_6` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
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
  `units_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `con_factor` double NOT NULL,
  `batch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `text1` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text2` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `text3` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
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
  `opening` tinyint(1) NOT NULL,
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
  `gross_rate` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `total_` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_4` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `text_5` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###


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
('add_pct', 'setup.company', 'int', '5', '0'),
('allow_negative_prices', 'glsetup.inventory', 'tinyint', '1', '1'),
('allow_negative_stock', 'glsetup.inventory', 'tinyint', '1', '1'),
('alt_uom', 'gl_setup.general', 'tinyint', '1', '1'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', ''),
('bank_account', 'setup.company', 'varchar', '40', ''),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '5036'),
('bank_details', 'setup.company', 'tinytext', '0', ''),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', ''),
('company_logo_report', 'setup.company', 'tinyint', '1', '0'),
('coy_logo', 'setup.company', 'varchar', '100', ''),
('coy_name', 'setup.company', 'varchar', '60', 'Midtrans'),
('coy_no', 'setup.company', 'varchar', '25', ''),
('creditors_act', 'glsetup.purchase', 'varchar', '15', '2011'),
('curr_default', 'setup.company', 'char', '3', 'PKR'),
('date', 'setup.company', 'int', '11', '0'),
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
('gl_closing_date', 'setup.closing_date', 'date', '8', '2017-07-01'),
('grn_clearing_act', 'glsetup.purchase', 'varchar', '15', ''),
('gst_no', 'setup.company', 'varchar', '25', ''),
('hide_prices_grn', 'glsetup.purchase', 'tinyint', '1', ''),
('legal_text', 'glsetup.customer', 'tinytext', '0', ''),
('loc_notification', 'glsetup.inventory', 'tinyint', '1', '1'),
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
('postal_address', 'setup.company', 'tinytext', '0', ''),
('print_invoice_no', 'glsetup.sales', 'tinyint', '1', '0'),
('print_item_images_on_quote', 'glsetup.inventory', 'tinyint', '1', ''),
('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '5030'),
('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '5016'),
('retained_earnings_act', 'glsetup.general', 'varchar', '15', '3021'),
('round_to', 'setup.company', 'int', '5', '1'),
('shortname_name_in_list', 'setup.company', 'tinyint', '1', '1'),
('show_doc_ref', 'glsetup.purchase', 'tinyint', '1', ''),
('show_po_item_codes', 'glsetup.purchase', 'tinyint', '1', ''),
('show_prices_dn', 'glsetup.purchase', 'tinyint', '1', ''),
('suppress_tax_rates', 'setup.company', 'tinyint', '1', ''),
('tax_algorithm', 'glsetup.customer', 'tinyint', '1', '1'),
('tax_last', 'setup.company', 'int', '11', '1'),
('tax_prd', 'setup.company', 'int', '11', '1'),
('time_zone', 'setup.company', 'tinyint', '1', '0'),
('use_dimension', 'setup.company', 'tinyint', '1', '0'),
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
('opom_text', 'GRN against PO'),
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
('gl_account_classes_text', 'GL Account CLasses'),
('sale_order_entry_text', 'Sale Order Entry'),
('journal_entry', '1'),
('user_account_setup_text', 'User Account Setup'),
('invoice_prepaid_order_text', 'Invoice Prepaid Orders'),
('invoice_prepaid_order', '1'),
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
('opom_text', 'GRN against PO'),
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
('1', '17', '2013', '2014', 'Tax', '0');

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
('2', 'DEF', '20', '0'),
('3', 'KHI', '12', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###

INSERT INTO `0_useronline` VALUES
('9193', '1507638852', '111.119.172.59', '/index.php'),
('9194', '1507638855', '111.119.172.59', '/inventory/manage/locations.php'),
('9195', '1507638858', '111.119.172.59', '/inventory/manage/locations.php'),
('9196', '1507638860', '111.119.172.59', '/inventory/manage/locations.php'),
('9197', '1507638940', '111.119.172.59', '/index.php'),
('9198', '1507638944', '111.119.172.59', '/admin/backups.php'),
('9199', '1507638963', '111.119.172.59', '/admin/backups.php'),
('9200', '1507638965', '111.119.172.59', '/admin/backups.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_users` ###

INSERT INTO `0_users` VALUES
('12', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Admin', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-10 17:32:26', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('21', 'zain', '81dc9bdb52d04dc20036dbd8313ed055', 'Zain Saleem Maniya', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-10 15:47:40', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_wo_costing` ###

INSERT INTO `0_wo_costing` VALUES
('1', '2', '1', '0', '1', '1'),
('2', '2', '0', '0', '2', '1');

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
('6', 'Filer Company', '4', '', '1013', '2', '1', '2011'),
('7', 'Nonfiler Company', '6', '', '1013', '2', '3', '1017'),
('8', 'Filer Other', '4.5', '', '1013', '2', '1', '10122'),
('9', 'Nonfile Other', '6.5', '', '1013', '2', '4', '5041'),
('10', 'Filer Company', '8', '', '1013', '1', '1', '3012'),
('11', 'Nonfiler Company', '12', '', '1013', '1', '2', '1031'),
('12', 'Filer Other', '10', '', '1013', '1', '1', '1032'),
('13', 'Nonfiler Other', '15', '', '1013', '1', '2', '10123'),
('14', 'SRB 1', '14', '', '1013', '3', '1', '1025'),
('15', 'SRB 2', '20', '', '1013', '3', '1', '5016'),
('16', 'FBR 1', '1', '', '1013', '4', '1', '1014'),
('17', 'FBR 2', '20', '', '1013', '4', '1', '1015');
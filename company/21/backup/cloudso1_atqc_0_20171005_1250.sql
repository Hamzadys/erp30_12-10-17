# MySQL dump of database 'cloudso1_atqc' on host 'localhost'
# Backup Date and Time: 2017-10-05 12:50
# Built by Hisaab.pk 2.4.2
# http://www.hisaab.pk
# Company: ATQC
# User: 

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_audit_trail` ###

INSERT INTO `0_audit_trail` VALUES
('1', '18', '1', '25', '2017-09-21 15:46:21', NULL, '3', '2017-09-22', '0', NULL),
('2', '25', '1', '25', '2017-09-22 06:56:52', NULL, '3', '2017-09-22', NULL, NULL),
('3', '20', '1', '25', '2017-09-22 06:39:09', NULL, '3', '2017-09-22', NULL, NULL),
('4', '18', '2', '21', '2017-09-21 19:38:32', NULL, '3', '2017-09-22', '0', NULL),
('5', '25', '2', '21', '2017-09-21 19:38:32', NULL, '3', '2017-09-22', '0', NULL),
('6', '20', '2', '21', '2017-09-21 19:38:42', NULL, '3', '2017-09-22', '0', NULL),
('7', '18', '3', '12', '2017-09-22 06:16:06', NULL, '3', '2017-09-22', '0', NULL),
('8', '25', '3', '12', '2017-09-22 06:57:08', NULL, '3', '2017-09-22', NULL, NULL),
('9', '20', '3', '12', '2017-09-22 06:39:21', NULL, '3', '2017-09-22', NULL, NULL),
('10', '20', '1', '21', '2017-09-22 06:39:09', 'Voided.\n', '3', '2017-09-22', '0', NULL),
('11', '20', '3', '21', '2017-09-22 06:39:21', 'Voided.\n', '3', '2017-09-22', '0', NULL),
('12', '25', '1', '21', '2017-09-22 06:56:52', 'Voided.\n', '3', '2017-09-22', '0', NULL),
('13', '25', '3', '21', '2017-09-22 06:57:08', 'Voided.\n', '3', '2017-09-22', '0', NULL),
('14', '18', '4', '21', '2017-09-25 06:49:43', NULL, '3', '2017-09-25', '0', NULL),
('15', '25', '4', '21', '2017-09-25 06:49:43', NULL, '3', '2017-09-25', '0', NULL),
('16', '20', '4', '21', '2017-09-25 06:49:46', NULL, '3', '2017-09-25', '0', NULL),
('17', '18', '5', '21', '2017-09-25 10:44:47', NULL, '3', '2017-09-25', '0', NULL),
('18', '25', '5', '21', '2017-09-25 10:44:48', NULL, '3', '2017-09-25', '0', NULL),
('19', '20', '5', '21', '2017-09-25 10:44:59', NULL, '3', '2017-09-25', '0', NULL),
('26', '20', '9', '12', '2017-10-02 05:36:15', 'Updated.', '3', '2017-10-02', '0', NULL),
('30', '18', '11', '12', '2017-10-02 06:00:35', NULL, '3', '2017-10-02', '0', NULL),
('31', '25', '9', '12', '2017-10-02 06:03:17', NULL, '3', '2017-10-02', NULL, NULL),
('32', '20', '6', '12', '2017-10-02 06:01:41', NULL, '3', '2017-10-02', NULL, NULL),
('33', '20', '6', '12', '2017-10-02 06:01:41', 'Voided.\n', '3', '2017-10-02', '0', NULL),
('34', '25', '9', '12', '2017-10-02 06:03:17', 'Voided.\n', '3', '2017-10-02', '0', NULL),
('35', '18', '12', '25', '2017-10-05 02:27:56', NULL, '3', '2017-10-05', '0', NULL),
('36', '20', '7', '25', '2017-10-05 03:48:44', NULL, '3', '2017-10-05', NULL, NULL),
('37', '41', '1', '25', '2017-10-05 03:18:10', NULL, '3', '2017-10-05', NULL, NULL),
('38', '41', '1', '25', '2017-10-05 03:49:11', NULL, '3', '2017-10-05', NULL, NULL),
('39', '20', '7', '25', '2017-10-05 03:48:44', 'Voided.\n', '3', '2017-10-05', '0', NULL),
('40', '41', '1', '25', '2017-10-05 03:49:11', 'Voided.\n', '3', '2017-10-05', '0', NULL);

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
  `cheque_date` date DEFAULT NULL,
  `text_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_bank_trans` ###

INSERT INTO `0_bank_trans` VALUES
('1', '41', '1', '3', 'CPV001/10/2017', '2017-10-05', '0', '0', '0', '3', '12', NULL, '0', '0000-00-00', NULL, NULL, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_categories` ###

INSERT INTO `0_cashflow_categories` VALUES
('1', 'marina', '11', '1', '1'),
('24', 'Cash Receipts From', '12', '1', '0'),
('25', 'Cash Paid For', '12', '0', '0'),
('26', 'Cash Receipts From', '13', '1', '0'),
('27', 'Cash Paid For', '12', '0', '0'),
('28', 'Cash Receipts From Customers', '2', '1', '0'),
('29', 'Cash Paid For', '2', '0', '0'),
('30', '6666666gyu', '12', '0', '0'),
('31', 'asiaaaa', '12', '1', '0'),
('32', 'backup', '2', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ;

### Data of table `0_cashflow_type` ###

INSERT INTO `0_cashflow_type` VALUES
('1', 'operation123', '1'),
('2', 'Operating Activities', '0'),
('12', 'Investing Activities', '0'),
('13', 'Financing Activities', '0');

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
  `combo_code` int(11) NOT NULL,
  `description` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES
('1', '1', 'cust_branch', 'general', '1'),
('2', '1', 'customer', 'general', '1'),
('3', '2', 'cust_branch', 'general', '2'),
('4', '2', 'customer', 'general', '2'),
('5', '3', 'cust_branch', 'general', '3'),
('6', '3', 'customer', 'general', '3'),
('7', '4', 'cust_branch', 'general', '4'),
('8', '4', 'customer', 'general', '4'),
('9', '5', 'cust_branch', 'general', '5'),
('10', '5', 'customer', 'general', '5'),
('11', '6', 'cust_branch', 'general', '6'),
('12', '6', 'customer', 'general', '6'),
('13', '7', 'supplier', 'general', '1'),
('14', '8', 'supplier', 'general', '2'),
('15', '9', 'supplier', 'general', '3'),
('16', '10', 'supplier', 'general', '4'),
('17', '11', 'supplier', 'general', '5'),
('18', '12', 'supplier', 'general', '6'),
('19', '13', 'supplier', 'general', '7'),
('20', '14', 'supplier', 'general', '8'),
('21', '15', 'supplier', 'general', '9'),
('22', '16', 'supplier', 'general', '10'),
('23', '17', 'supplier', 'general', '11'),
('24', '18', 'supplier', 'general', '12'),
('25', '19', 'supplier', 'general', '13'),
('26', '20', 'cust_branch', 'general', '7'),
('27', '20', 'customer', 'general', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES
('1', 'CHEF AFZAL ', 'MAIN KITCHEN ANTIQUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('2', 'SAJAD ', 'FRONT OF THE HOUSE ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('3', 'BAKERY SECTION ANTIQUE ', 'BAKERY SECTION ANTIQUE ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('4', 'BAR SECTION ANTIQUE ', 'BAR SECTION ANTIQUE ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('5', 'MIRCH MASALA GAS BILL', 'MIRCH MASALA GAS BILL ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('6', 'HOUSE KEEPING DEPARTMENT ', 'HOUSE KEEPING DEPARTMENT ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('7', 'K&amp;Ns Chickens ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('8', 'H Super Mart ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('9', 'Imtiyaz Super Store ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('10', 'Metro Cash &amp; Carry ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('11', 'Sohail Vegetables ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('12', 'Daily Veg 9 Maqsood butt ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('13', 'SBS Sea Food', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('14', 'Chicken Local  ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('15', 'Nova Publishing ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('16', 'Biotech Packages ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('17', 'Rizwan Bulk Cleaning Supplies ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('18', 'Cash Purchase Locale ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('19', 'Cash Purchase Imported ', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0'),
('20', 'Front Cutlery &amp; Crockery ', 'Front Cutlery &amp; Crockery ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES
('1', '1', 'MAIN KITCHEN ANTIQUE', 'CHEF AFZAL ', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('2', '2', 'FRONT OF THE HOUSE ', 'SAJAD ', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('3', '3', 'BAKERY SECTION ANTIQUE ', 'BAKERY SECTION ANTIQUE ', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('4', '4', 'BAR SECTION ANTIQUE ', 'BAR SECTION ANTIQUE ', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('5', '5', 'MIRCH MASALA GAS BILL ', 'MIRCH MASALA GAS BILL', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('6', '6', 'HOUSE KEEPING DEPARTMENT ', 'HOUSE KEEPING DEPARTMENT ', '', '1', '1', 'DEF', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL),
('7', '7', 'Front Cutlery &amp; Crockery ', 'Front Cutlery &amp; Crockery ', '', '1', '1', '001', '1', '', '4025', '1013', '4025', '1', '', '0', '', NULL, '0', NULL, NULL);

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
  `credit_allowed` double NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`debtor_no`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES
('1', 'MAIN KITCHEN ANTIQUE', 'MAIN KITCHEN ANTIQUE', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('2', 'FRONT OF THE HOUSE ', 'FRONT OF THE HOUSE ', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('3', 'BAKERY SECTION ANTIQUE ', 'BAKERY SECTION ANTIQUE ', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('4', 'BAR SECTION ANTIQUE ', 'BAR SECTION ANTIQUE ', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('5', 'MIRCH MASALA GAS BILL ', 'MIRCH MASALA GAS BILL', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('6', 'HOUSE KEEPING DEPARTMENT ', 'HOUSE KEEPING DEPARTMENT ', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0'),
('7', 'Front Cutlery &amp; Crockery ', 'Front Cutlery &amp; Crockery ', NULL, '', '', 'PKR', '1', '0', '0', '1', '5', '0', '0', '0', '', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_gl_trans` ###

INSERT INTO `0_gl_trans` VALUES
('1', '20', '1', '2017-09-22', '2011', '', '0', '0', '0', '3', '12', '0', '0', NULL, '0', NULL, NULL, '', NULL),
('2', '20', '1', '2017-09-22', '5011', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('3', '20', '1', '2017-09-22', '1021', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('4', '20', '1', '2017-09-22', '1021', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('5', '20', '2', '2017-09-22', '2011', '', '-177488', '0', '0', '3', '12', '0', '0', NULL, '0', NULL, NULL, '', NULL),
('6', '20', '2', '2017-09-22', '1021', '', '2200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('7', '20', '2', '2017-09-22', '1021', '', '9600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('8', '20', '2', '2017-09-22', '1021', '', '720', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('9', '20', '2', '2017-09-22', '1021', '', '1440', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('10', '20', '2', '2017-09-22', '1021', '', '1720', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('11', '20', '2', '2017-09-22', '1021', '', '21000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('12', '20', '2', '2017-09-22', '1021', '', '2900', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('13', '20', '2', '2017-09-22', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('14', '20', '2', '2017-09-22', '1021', '', '3000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('15', '20', '2', '2017-09-22', '1021', '', '1500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('16', '20', '2', '2017-09-22', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('17', '20', '2', '2017-09-22', '1021', '', '6000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('18', '20', '2', '2017-09-22', '1021', '', '9100', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('19', '20', '2', '2017-09-22', '1021', '', '1050', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('20', '20', '2', '2017-09-22', '1021', '', '7350', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('21', '20', '2', '2017-09-22', '1021', '', '1692', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('22', '20', '2', '2017-09-22', '1021', '', '564', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('23', '20', '2', '2017-09-22', '1021', '', '960', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('24', '20', '2', '2017-09-22', '1021', '', '480', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('25', '20', '2', '2017-09-22', '1021', '', '21200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('26', '20', '2', '2017-09-22', '1021', '', '19600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('27', '20', '2', '2017-09-22', '1021', '', '7616', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('28', '20', '2', '2017-09-22', '1021', '', '700', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('29', '20', '2', '2017-09-22', '1021', '', '700', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('30', '20', '2', '2017-09-22', '1021', '', '1080', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('31', '20', '2', '2017-09-22', '1021', '', '640', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('32', '20', '2', '2017-09-22', '1021', '', '390', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('33', '20', '2', '2017-09-22', '1021', '', '200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('34', '20', '2', '2017-09-22', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('35', '20', '2', '2017-09-22', '1021', '', '2000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('36', '20', '2', '2017-09-22', '1021', '', '100', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('37', '20', '2', '2017-09-22', '1021', '', '480', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('38', '20', '2', '2017-09-22', '1021', '', '11625', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('39', '20', '2', '2017-09-22', '1021', '', '3270', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('40', '20', '2', '2017-09-22', '1021', '', '560', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('41', '20', '2', '2017-09-22', '1021', '', '1000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('42', '20', '2', '2017-09-22', '1021', '', '3480', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('43', '20', '2', '2017-09-22', '1021', '', '642', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('44', '20', '2', '2017-09-22', '1021', '', '1740', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('45', '20', '2', '2017-09-22', '1021', '', '900', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('46', '20', '2', '2017-09-22', '1021', '', '480', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('47', '20', '2', '2017-09-22', '1021', '', '225', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('48', '20', '2', '2017-09-22', '1021', '', '1350', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('49', '20', '2', '2017-09-22', '1021', '', '1088', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('50', '20', '2', '2017-09-22', '1021', '', '396', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('51', '20', '2', '2017-09-22', '1021', '', '500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('52', '20', '2', '2017-09-22', '1021', '', '500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('53', '20', '2', '2017-09-22', '1021', '', '500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('54', '20', '2', '2017-09-22', '1021', '', '900', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('55', '20', '2', '2017-09-22', '1021', '', '3000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('56', '20', '2', '2017-09-22', '1021', '', '1500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('57', '20', '2', '2017-09-22', '1021', '', '780', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('58', '20', '2', '2017-09-22', '1021', '', '1800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('59', '20', '2', '2017-09-22', '1021', '', '1200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('60', '20', '2', '2017-09-22', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('61', '20', '2', '2017-09-22', '1021', '', '500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('62', '20', '2', '2017-09-22', '1021', '', '1600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('63', '20', '2', '2017-09-22', '1021', '', '800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('64', '20', '2', '2017-09-22', '1021', '', '920', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('65', '20', '2', '2017-09-22', '1021', '', '4800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('66', '20', '2', '2017-09-22', '1021', '', '50', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('67', '20', '3', '2017-09-22', '2011', '', '0', '0', '0', '3', '10', '0', '0', NULL, '0', NULL, NULL, '', NULL),
('68', '20', '3', '2017-09-22', '1021', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('69', '20', '4', '2017-09-25', '2011', '', '-872100', '0', '0', '3', '12', '0', '0', NULL, '0', NULL, NULL, '', NULL),
('70', '20', '4', '2017-09-25', '1021', '', '9000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('71', '20', '4', '2017-09-25', '1021', '', '53600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('72', '20', '4', '2017-09-25', '1021', '', '51750', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('73', '20', '4', '2017-09-25', '1021', '', '12800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('74', '20', '4', '2017-09-25', '1021', '', '12000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('75', '20', '4', '2017-09-25', '1021', '', '900', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('76', '20', '4', '2017-09-25', '1021', '', '0', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('77', '20', '4', '2017-09-25', '1021', '', '36000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('78', '20', '4', '2017-09-25', '1021', '', '27000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('79', '20', '4', '2017-09-25', '1021', '', '52000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('80', '20', '4', '2017-09-25', '1021', '', '19200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('81', '20', '4', '2017-09-25', '1021', '', '22750', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('82', '20', '4', '2017-09-25', '1021', '', '2800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('83', '20', '4', '2017-09-25', '1021', '', '52800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('84', '20', '4', '2017-09-25', '1021', '', '40800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('85', '20', '4', '2017-09-25', '1021', '', '96800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('86', '20', '4', '2017-09-25', '1021', '', '2600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('87', '20', '4', '2017-09-25', '1021', '', '120000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('88', '20', '4', '2017-09-25', '1021', '', '245000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('89', '20', '4', '2017-09-25', '1021', '', '14300', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('90', '20', '5', '2017-09-25', '2011', '', '-285888', '0', '0', '3', '12', '0', '0', NULL, '0', NULL, NULL, '', NULL),
('91', '20', '5', '2017-09-25', '1021', '', '1000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('92', '20', '5', '2017-09-25', '1021', '', '350', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('93', '20', '5', '2017-09-25', '1021', '', '9000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('94', '20', '5', '2017-09-25', '1021', '', '7200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('95', '20', '5', '2017-09-25', '1021', '', '9600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('96', '20', '5', '2017-09-25', '1021', '', '30000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('97', '20', '5', '2017-09-25', '1021', '', '8000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('98', '20', '5', '2017-09-25', '1021', '', '8500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('99', '20', '5', '2017-09-25', '1021', '', '1600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('100', '20', '5', '2017-09-25', '1021', '', '2800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('101', '20', '5', '2017-09-25', '1021', '', '3150', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('102', '20', '5', '2017-09-25', '1021', '', '1000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('103', '20', '5', '2017-09-25', '1021', '', '1200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('104', '20', '5', '2017-09-25', '1021', '', '900', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('105', '20', '5', '2017-09-25', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('106', '20', '5', '2017-09-25', '1021', '', '900', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('107', '20', '5', '2017-09-25', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('108', '20', '5', '2017-09-25', '1021', '', '1500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('109', '20', '5', '2017-09-25', '1021', '', '2000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('110', '20', '5', '2017-09-25', '1021', '', '4800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('111', '20', '5', '2017-09-25', '1021', '', '1500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('112', '20', '5', '2017-09-25', '1021', '', '3000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('113', '20', '5', '2017-09-25', '1021', '', '3000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('114', '20', '5', '2017-09-25', '1021', '', '3500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('115', '20', '5', '2017-09-25', '1021', '', '1500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('116', '20', '5', '2017-09-25', '1021', '', '5060', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('117', '20', '5', '2017-09-25', '1021', '', '6400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('118', '20', '5', '2017-09-25', '1021', '', '4000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('119', '20', '5', '2017-09-25', '1021', '', '14400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('120', '20', '5', '2017-09-25', '1021', '', '15200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('121', '20', '5', '2017-09-25', '1021', '', '9000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('122', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('123', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('124', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('125', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('126', '20', '5', '2017-09-25', '1021', '', '5400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('127', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('128', '20', '5', '2017-09-25', '1021', '', '7200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('129', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('130', '20', '5', '2017-09-25', '1021', '', '9000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('131', '20', '5', '2017-09-25', '1021', '', '1800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('132', '20', '5', '2017-09-25', '1021', '', '3600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('133', '20', '5', '2017-09-25', '1021', '', '5400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('134', '20', '5', '2017-09-25', '1021', '', '9000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('135', '20', '5', '2017-09-25', '1021', '', '10800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('136', '20', '5', '2017-09-25', '1021', '', '10800', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('137', '20', '5', '2017-09-25', '1021', '', '5400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('138', '20', '5', '2017-09-25', '1021', '', '10500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('139', '20', '5', '2017-09-25', '1021', '', '1128', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('140', '20', '5', '2017-09-25', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('141', '20', '5', '2017-09-25', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('142', '20', '5', '2017-09-25', '1021', '', '5200', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('143', '20', '5', '2017-09-25', '1021', '', '2400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('144', '20', '5', '2017-09-25', '1021', '', '1400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('145', '20', '5', '2017-09-25', '1021', '', '1000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('146', '20', '5', '2017-09-25', '1021', '', '500', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('147', '20', '5', '2017-09-25', '1021', '', '2400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('148', '20', '5', '2017-09-25', '1021', '', '2000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('149', '20', '5', '2017-09-25', '1021', '', '1400', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('150', '20', '5', '2017-09-25', '1021', '', '600', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('151', '20', '5', '2017-09-25', '1021', '', '750', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('152', '20', '5', '2017-09-25', '1021', '', '1000', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('153', '20', '5', '2017-09-25', '1021', '', '3150', '0', '0', NULL, NULL, '0', '0', NULL, '0', NULL, NULL, '', NULL),
('160', '20', '6', '2017-10-02', '2011', '', '0', '0', '0', '3', '10', '0', '0', '0000-00-00', '0', NULL, NULL, '', NULL),
('161', '20', '6', '2017-10-02', '1021', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', NULL, NULL, '', NULL),
('162', '20', '7', '2017-10-05', '2011', '', '0', '0', '0', '3', '12', '0', '0', '0000-00-00', '0', NULL, NULL, '', NULL),
('163', '20', '7', '2017-10-05', '5011', 'BALOON HAS BEEN RECEIVED, TESTING ENTRY', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', NULL, NULL, '', NULL),
('164', '41', '1', '2017-10-05', '1021', 'testing entry', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', NULL, NULL, '', NULL),
('165', '41', '1', '2017-10-05', '10111', '', '0', '0', '0', NULL, NULL, '0', '0', '0000-00-00', '0', NULL, NULL, '', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_batch` ###

INSERT INTO `0_grn_batch` VALUES
('1', '12', '1', 'GRN001/09/2017', '2017-09-22', 'DEF', '1', '1', '', '', '', '0', '0', '0', '', ''),
('2', '12', '2', 'auto', '2017-09-22', 'DEF', '1', '2', '', '', '', '', '', '', '', ''),
('3', '10', '3', 'auto', '2017-09-22', 'DEF', '1', '0', '', '', '', '', '', '', '', ''),
('4', '12', '4', 'auto', '2017-09-25', '002', '1', '3', '', '', '', '', '', '', '', ''),
('5', '12', '5', 'auto', '2017-09-25', '001', '1', '4', '', '', '', '', '', '', '', ''),
('9', '10', '11', 'auto', '2017-10-02', '001', '1', '11', '', '', '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_grn_items` ###

INSERT INTO `0_grn_items` VALUES
('1', '1', '1', '540', 'CHAIR AQUARIUM  ', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('2', '1', '2', '541', 'CHAIR VELVET ', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('3', '2', '3', '151', 'SHRIMPS WHITE BAG 2KG ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('4', '2', '4', '152', 'SHRIMPS 16/20 ', '8', '8', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('5', '2', '5', '109', 'Chicken Bone Local', '8', '8', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('6', '2', '6', '106', 'Chicken Brest Locale ', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('7', '2', '7', '103', 'Chicken Thai Boneless K&amp;Ns', '4.3', '4.3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('8', '2', '8', '101', 'Chicken Fillet 110 to 120 grams K&amp;Ns', '50', '50', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('9', '2', '9', '104', 'Chicken Nablets Wings K&amp;Ns', '10', '10', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('10', '2', '10', '107', 'Chicken 9Cut with Skin', '72', '72', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('11', '2', '11', '530', 'GLASS 50ML MINI ', '60', '60', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('12', '2', '12', '532', 'SOUP CONTINENTS BOWL  ', '30', '30', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('13', '2', '13', '533', 'SOUP CONTINENTS TRAY', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('14', '2', '14', '154', 'SHRIMPS GLOBAL ', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('15', '2', '15', '153', 'SHRIMPS 21/25', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('16', '2', '16', '102', 'Chicken Thai Boneless (locale)', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('17', '2', '17', '004', 'Beef Waste left from Cleaning ', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('18', '2', '18', '803', '7up 300ml can', '36', '36', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('19', '2', '19', '814', 'pappsi 300ml can', '12', '12', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('20', '2', '20', '808', '7up 1.5liter', '12', '12', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('21', '2', '21', '807', 'sprite 1.5liter', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('22', '2', '22', '516', 'TABLE NAPKIN ', '265', '265', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('23', '2', '23', '515', 'NAPKIN RINGS ', '98', '98', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('24', '2', '24', '702', 'PACKING BAG PRINTED (KHAKHI)', '544', '544', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('25', '2', '25', '821', 'nestle pineapple juice 1liter', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('26', '2', '26', '818', 'nestle apple juice 1liter', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('27', '2', '27', '819', 'nestle red grape 1liter', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('28', '2', '28', '817', 'nestle mango juice 1liter', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('29', '2', '29', '204', 'MILK PACK MILK 1 LTTER ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('30', '2', '30', '316', 'paprika powder', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('31', '2', '31', '320', 'coconut careem powder', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('32', '2', '32', '705', 'TISSUE BOX ANTIQUE ', '50', '50', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('33', '2', '33', '537', 'COFFEE CUP DISPOSABLE LID', '100', '100', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('34', '2', '34', '536', 'COFFEE CUP DISPOSABLE ', '80', '80', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('35', '2', '35', '327', 'Black pepper', '7.75', '7.75', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('36', '2', '36', '822', 'AQUA FINA WATER 500ML ', '109', '109', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('37', '2', '37', '203', 'PREEMA MILK ', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('38', '2', '38', '416', 'Birds chilli', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('39', '2', '39', '201', 'Fresh Cream ', '12', '12', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('40', '2', '40', '403', 'Cabbage', '4.28', '4.28', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('41', '2', '41', '413', 'garlic', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('42', '2', '42', '410', 'Yellow Capsicum', '0.9', '0.9', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('43', '2', '43', '404', 'Green Onion', '3.2', '3.2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('44', '2', '44', '417', 'ginger', '1.5', '1.5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('45', '2', '45', '412', 'Red Capsicum', '1.35', '1.35', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('46', '2', '46', '303', 'Rice Zarafa 2Year Old', '6.4', '6.4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('47', '2', '47', '314', 'salt ', '18', '18', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('48', '2', '48', '312', 'Driey Basile', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('49', '2', '49', '313', 'thyme', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('50', '2', '50', '311', 'tarragon', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('51', '2', '51', '304', 'crackers', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('52', '2', '52', '319', 'TaBasco', '12', '12', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('53', '2', '53', '307', 'Macarino Elbow Big', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('54', '2', '54', '308', 'Bread crambs', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('55', '2', '55', '305', 'crispy TamBora', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('56', '2', '56', '309', 'panne Rigate', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('57', '2', '57', '325', 'giree Brada', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('58', '2', '58', '306', 'fittaccine pasta', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('59', '2', '59', '321', 'chicken soup cube', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('60', '2', '60', '322', 'Dami glass Bass', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('61', '2', '61', '205', 'YELLOW BUTTER FRESH', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('62', '2', '62', '302', 'Mamasitta Suace 4kg ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('63', '2', '63', '326', 'Tikka Masala', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('64', '3', '64', '001', 'Beef Tenderloin without Head ', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('65', '4', '65', '537', 'COFFEE CUP DISPOSABLE LID', '4500', '4500', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('66', '4', '66', '504', 'RECT SERVING PLATE 33CM', '67', '67', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('67', '4', '67', '503', 'SQ DINNER PLATE 27CM', '69', '69', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('68', '4', '68', '502', 'SQ DESSERT PLATE 21CM', '32', '32', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('69', '4', '69', '507', 'BUTTER DISH WITH COVER', '24', '24', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('70', '4', '70', '509', 'SQ SOUP BOWL 14CM', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('71', '4', '71', '534', 'COFFEE MUG PORCILEN ', '166', '166', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('72', '4', '72', '538', 'ICE CREAM BOWL DISPOSABLE ', '4000', '4000', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('73', '4', '73', '536', 'COFFEE CUP DISPOSABLE ', '4500', '4500', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('74', '4', '74', '542', 'STOOL GOLDEN BLACK ', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('75', '4', '75', '543', 'GLASS JUG FOR ICE TEA ', '16', '16', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('76', '4', '76', '517', 'SOUP BOWL CHINA ', '70', '70', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('77', '4', '77', '518', 'SOUP SAUCER CHINA ', '28', '28', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('78', '4', '78', '528', 'GLASS 350ML JUICE LONG ', '48', '48', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('79', '4', '79', '529', 'GLASS 300ML WATER (WINE) ', '48', '48', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('80', '4', '80', '531', 'PLATE VERSECE LOGO ', '88', '88', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('81', '4', '81', '505', 'RECT SERVING BOWL 22.5CM', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('82', '4', '82', '540', 'CHAIR AQUARIUM  ', '12', '12', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('83', '4', '83', '541', 'CHAIR VELVET ', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('84', '4', '84', '506', 'SQ Soup PLATE 20.5CM', '22', '22', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('85', '5', '85', '328', 'WHITE CHEESE THREE COW 1/2 KG BLOCK ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('86', '5', '86', '329', 'CHICKEN SAUSAGES  ', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('87', '5', '87', '330', 'LEAPED MIRROR GLASS (CAKE)', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('88', '5', '88', '707', 'STEAK TORCH ', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('89', '5', '89', '543', 'GLASS JUG FOR ICE TEA ', '8', '8', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('90', '5', '90', '708', 'DIGITAL SCREEN FOR MENU', '25', '25', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('91', '5', '91', '331', 'MANGO PUREE MONTIBINACO 4KG ', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('92', '5', '92', '333', 'STRAWBERRY PUREE MONTIBINACO 4KG ', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('93', '5', '93', '334', 'SOYA SAUCE DARK 2 LITER (LEE KUM KI )', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('94', '5', '94', '335', 'SOYA SAUCE LIGHT 2 LITER (LEE KUM KI )', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('95', '5', '95', '336', 'SWEET VINEGAR ', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('96', '5', '96', '337', 'TAPAL DANEDAR TEA 1/2 KG ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('97', '5', '97', '338', 'LIPTON GREEN TEA MINT 25PCS ', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('98', '5', '98', '339', 'LIPTON GREEN TEA SENCHA 30PCS ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('99', '5', '99', '340', 'LIPTON GREEN TEA ROSEHIP 25PCS ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('100', '5', '100', '341', 'LIPTON GREEN TEA CAMOMILE 30PCS ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('101', '5', '101', '342', 'LIPTON GREEN TEA PURE BLACK 25 PCS ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('102', '5', '102', '343', 'LIPTON GREEN TEA LEMON 25 PCS ', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('103', '5', '103', '344', 'LIPTON YELLOW LABEL SACHET 100 PCS PACK ', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('104', '5', '104', '345', 'LIPTON ICED TEA SACHET ', '48', '48', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('105', '5', '105', '347', 'RIPPY TOPPING CARAMEL ', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('106', '5', '106', '348', 'RIPPY TOPPING MANGOO', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('107', '5', '107', '349', 'RIPPY TOPPING CHOCOLATE ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('108', '5', '108', '206', 'WHITE BUTTER ', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('109', '5', '109', '207', 'HICO VANILA ICE CREAM 2 LITTER ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('110', '5', '110', '205', 'YELLOW BUTTER FRESH', '11', '11', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('111', '5', '111', '350', 'FRENCH FRIES Mccain 2.5kg ', '8', '8', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('112', '5', '112', '351', 'MOZERELLA CHEESE ADAMS 2KG BLOCK ', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('113', '5', '113', '352', 'MILK CHOCOLATE 1 KG PACK COLLATA ', '18', '18', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('114', '5', '114', '353', 'WHITE CHOCOLATE 1 KG PACK COLLATA ', '19', '19', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('115', '5', '115', '750', 'FABRI MIXY BAR - MANGO', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('116', '5', '116', '742', 'FABRI MIXY CAFE - CINNAMON', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('117', '5', '117', '752', 'FABRI MIXY BAR - PEACH', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('118', '5', '118', '744', 'FABRI MIXY CAFE - HAZELNUT', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('119', '5', '119', '741', 'FABRI MIXY CAFE - CARAMEL', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('120', '5', '120', '747', 'FABRI MIXY BAR - COCONUT', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('121', '5', '121', '745', 'FABRI MIXY CAFE - IRISH CREAM', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('122', '5', '122', '751', 'FABRI MIXY BAR - ORANGE', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('123', '5', '123', '746', 'FABRI MIXY CAFE - VANILLA', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('124', '5', '124', '756', 'FABRI MIXY BAR - ROSE', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('125', '5', '125', '757', 'FABRI MIXY BAR - STRAWBERRY', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('126', '5', '126', '755', 'FABRI MIXY BAR - RASPBERRY', '2', '2', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('127', '5', '127', '754', 'FABRI MIXY BAR - POMEGRANATE', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('128', '5', '128', '755', 'FABRI MIXY BAR - RASPBERRY', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('129', '5', '129', '748', 'FABRI MIXY BAR - KIWI', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('130', '5', '130', '753', 'FABRI MIXY BAR - PINEAPPLE', '6', '6', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('131', '5', '131', '749', 'FABRI MIXY BAR - LEMON', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('132', '5', '132', '354', 'LAVAZZA ESSPRESSO COFFEE 1 KG ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('133', '5', '133', '802', 'DIET 7UP 300ML CAN ', '24', '24', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('134', '5', '134', '355', 'BAMBOO SHOOT TIN ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('135', '5', '135', '356', 'SWEET CORN TIN ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('136', '5', '136', '357', 'BABY CORN ', '26', '26', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('137', '5', '137', '358', 'BAMBOO SHOOT HALVES TIN', '12', '12', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('138', '5', '138', '359', 'AIRWIK FRESHENER 175GM  ', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('139', '5', '139', '360', 'AIRWIK DIFFUSER  MACHINE ', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('140', '5', '140', '606', 'SURGICAL GLOVES ', '1', '1', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('141', '5', '141', '362', 'MELAPINE PINEAPPLE SLICE 3KG ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('142', '5', '142', '363', 'DELMONT PINEAPPLE JUICE 1.36 LITER ', '5', '5', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('143', '5', '143', '364', 'POLAC MILK 390 GRAMS ', '7', '7', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('144', '5', '144', '365', 'YELLOW CLING PEACH HALVES IN SYRUP 820GMS ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('145', '5', '145', '366', 'LYCHEE READY TO EAT 365 GM ', '3', '3', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('146', '5', '146', '367', 'COCONUT MILK 400GMS ', '4', '4', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('147', '5', '147', '368', 'RED CHERRY SYRUP 240GMS ', '9', '9', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0'),
('151', '9', '151', '001', 'BEEF TENDERLOIN WITHOUT HEAD', '0', '0', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES
('1', '001', '001', 'BEEF TENDERLOIN WITHOUT HEAD', '7', '1', '0', '0'),
('2', '002', '002', 'BEEF TENDERLOIN WITH HEAD', '7', '1', '0', '0'),
('3', '901', '901', 'LPG GAS ', '15', '1', '0', '0'),
('4', '101', '101', 'CHICKEN FILLET 110 TO 120 GMS K&amp;N&#039;S', '8', '1', '0', '0'),
('5', '201', '201', 'FRESH CREAM', '9', '1', '0', '0'),
('6', '301', '301', 'EGGS', '10', '1', '0', '0'),
('7', '401', '401', 'ONION', '11', '1', '0', '0'),
('8', '501', '501', 'DINNER SPOON LARGE', '12', '1', '0', '0'),
('9', '601', '601', 'DISH WASHING LIQUID BULK', '13', '1', '0', '0'),
('10', '701', '701', 'ZIPPER BAG', '14', '1', '0', '0'),
('11', '801', '801', 'COKE 300 ML CAN', '16', '1', '0', '0'),
('12', '003', '003', 'BEEF SLICE FOR GRAVY', '7', '1', '0', '0'),
('13', '004', '004', 'BEEF WASTE LEFT FROM CLEANING', '7', '1', '0', '0'),
('15', '102', '102', 'CHICKEN THAI BONELESS (LOCAL)', '8', '1', '0', '0'),
('16', '103', '103', 'CHICKEN THAI BONELESS (K&amp;N&#039;S)', '8', '1', '0', '0'),
('17', '104', '104', 'CHICKEN NIBLETS WINGS (K&amp;N&#039;S)', '8', '1', '0', '0'),
('18', '105', '105', 'CHICKEN WINGS LOCAL', '8', '1', '0', '0'),
('19', '106', '106', 'CHICKEN BREAST LOCAL', '8', '1', '0', '0'),
('20', '107', '107', 'CHICKEN 9 CUT WITH SKIN (MARINATO)', '8', '1', '0', '0'),
('21', '302', '302', 'MAMASITTA OYSTER SAUCE 4KG', '10', '1', '0', '0'),
('22', '303', '303', 'RICE ZARAFA 2 YEARS OLD', '10', '1', '0', '0'),
('23', '402', '402', 'CARROTS', '11', '1', '0', '0'),
('24', '403', '403', 'CABBAGE', '11', '1', '0', '0'),
('25', '404', '404', 'GREEN ONION', '11', '1', '0', '0'),
('26', '405', '405', 'RED ONION', '11', '1', '0', '0'),
('27', '406', '406', 'ZUCCHINI', '11', '1', '0', '0'),
('28', '407', '407', 'POTATOES', '11', '1', '0', '0'),
('29', '408', '408', 'ICEBERG LETTUCE', '11', '1', '0', '0'),
('30', '409', '409', 'BROCCOLI', '11', '1', '0', '0'),
('31', '411', '411', 'GREEN CAPSICUM', '11', '1', '0', '0'),
('32', '412', '412', 'RED CAPSICUM', '11', '1', '0', '0'),
('33', '410', '410', 'YELLOW CAPSICUM', '11', '1', '0', '0'),
('34', '413', '413', 'GARLIC', '11', '1', '0', '0'),
('35', '414', '414', 'FRESH MINT', '11', '1', '0', '0'),
('36', '415', '415', 'CHERRY TOMATO', '11', '1', '0', '0'),
('37', '416', '416', 'BIRD CHILLI', '11', '1', '0', '0'),
('38', '417', '417', 'GINGER', '11', '1', '0', '0'),
('39', '803', '803', '7UP 300 ML CAN', '16', '1', '0', '0'),
('40', '804', '804', 'FANTA 300ML CAN', '16', '1', '0', '0'),
('41', '805', '805', 'SPRITE 300ML CAN', '16', '1', '0', '0'),
('42', '806', '806', 'SPRITE ZERO 300ML CAN', '16', '1', '0', '0'),
('43', '807', '807', 'SPRITE 1.5 LTR', '16', '1', '0', '0'),
('44', '808', '808', '7UP 1.5 LTR', '16', '1', '0', '0'),
('45', '809', '809', 'COKE DIET 300 ML CAN', '16', '1', '0', '0'),
('46', '810', '810', 'WATER MINERAL 1.5 LTR', '16', '1', '0', '0'),
('50', '814', '814', 'PEPSI 300ml can', '16', '1', '0', '0'),
('51', '815', '815', 'PEPSI 1.5liter', '16', '1', '0', '0'),
('52', '816', '816', 'PEPSI 500ml', '16', '1', '0', '0'),
('53', '817', '817', 'NESTLE MANGO JUICE 1 LTR', '16', '1', '0', '0'),
('54', '818', '818', 'NESTLE APPLE JUICE 1 LTR', '16', '1', '0', '0'),
('55', '819', '819', 'NESTLE RED GRAPE 1 LTR', '16', '1', '0', '0'),
('56', '820', '820', 'NESTLE PEACH JUICE 1 LTR', '16', '1', '0', '0'),
('57', '821', '821', 'NESTLE PINEAPPLE JUICE 1 LTR', '16', '1', '0', '0'),
('59', '109', '109', 'CHICKEN BONE (LOCAL)', '8', '1', '0', '0'),
('60', '304', '304', 'CRACKERS', '10', '1', '0', '0'),
('61', '305', '305', 'CRISPY TAMPOORA FLOUR', '10', '1', '0', '0'),
('62', '306', '306', 'FETTUCCINE PASTA', '10', '1', '0', '0'),
('63', '307', '307', 'MACARONI ELBLOW BIG', '10', '1', '0', '0'),
('64', '308', '308', 'BREAD CRUMBS', '10', '1', '0', '0'),
('65', '309', '309', 'PANNE REGGIA PASTA', '10', '1', '0', '0'),
('66', '310', '310', 'GREEN CHILLI SAUCE', '10', '1', '0', '0'),
('67', '311', '311', 'TARRAGON', '10', '1', '0', '0'),
('68', '312', '312', 'DRY BASIL', '10', '1', '0', '0'),
('69', '313', '313', 'THYME', '10', '1', '0', '0'),
('70', '314', '314', 'SALT', '10', '1', '0', '0'),
('71', '315', '315', 'TOMATO KETCHUP HEINZ ', '10', '1', '0', '0'),
('72', '316', '316', 'PAPRIKA POWDER', '10', '1', '0', '0'),
('73', '317', '317', 'WHITE PEPPER POWDER', '10', '1', '0', '0'),
('74', '318', '318', 'RED CURRY PASTE', '10', '1', '0', '0'),
('75', '319', '319', 'TOBASSCO SAUCE', '10', '1', '0', '0'),
('76', '320', '320', 'COCONUT CREAM POWDER', '10', '1', '0', '0'),
('77', '321', '321', 'CHICKEN SOUP CUBE', '10', '1', '0', '0'),
('78', '322', '322', 'DAMI GLASS BASE', '10', '1', '0', '0'),
('79', '323', '323', 'GINGER POWDER', '10', '1', '0', '0'),
('80', '324', '324', 'TURMERIC POWDER', '10', '1', '0', '0'),
('81', '325', '325', 'GIREE BRADA', '10', '1', '0', '0'),
('82', '326', '326', 'TIKKA MASALA', '10', '1', '0', '0'),
('83', '327', '327', 'BLACK PEPPER POWDER', '10', '1', '0', '0'),
('84', '502', '502', 'SQ DESSERT PLATE 21CM', '12', '1', '0', '0'),
('85', '503', '503', 'SQ DINNER PLATE 27CM', '12', '1', '0', '0'),
('86', '504', '504', 'RECT SERVING PLATE 33CM', '12', '1', '0', '0'),
('87', '505', '505', 'RECT SERVING BOWL 22.5CM', '12', '1', '0', '0'),
('88', '506', '506', 'SQ Soup PLATE 20.5CM', '12', '1', '0', '0'),
('89', '507', '507', 'BUTTER DISH WITH COVER', '12', '1', '0', '0'),
('90', '508', '508', 'RECT SERVING BOWL 17.5CM', '12', '1', '0', '0'),
('91', '509', '509', 'SQ SOUP BOWL 14CM', '12', '1', '0', '0'),
('92', '510', '510', 'DINNER SPOON MEDIUM', '12', '1', '0', '0'),
('93', '511', '511', 'DESSERT SPOON SMALL ', '12', '1', '0', '0'),
('94', '512', '512', 'DINNER FORK ', '12', '1', '0', '0'),
('95', '513', '513', 'DINNER KNIFE ', '12', '1', '0', '0'),
('96', '514', '514', 'STEAK KNIFE ', '12', '1', '0', '0'),
('97', '515', '515', 'NAPKIN RINGS ', '12', '1', '0', '0'),
('98', '516', '516', 'TABLE NAPKIN ', '12', '1', '0', '0'),
('99', '517', '517', 'SOUP BOWL CHINA ', '12', '1', '0', '0'),
('100', '518', '518', 'SOUP SAUCER CHINA ', '12', '1', '0', '0'),
('101', '519', '519', 'STONE PLATE BLACK CHINA ', '12', '1', '0', '0'),
('102', '520', '520', 'STEEL CURVE TRAY SMALL  ', '12', '1', '0', '0'),
('103', '521', '521', 'STEEL CURVE TRAY LARGE ', '12', '1', '0', '0'),
('104', '522', '522', 'PORTION PLATE CHINA WHITE ', '12', '1', '0', '0'),
('105', '523', '523', 'STEAK WOODEN TRAY ', '12', '1', '0', '0'),
('106', '524', '524', 'STEAK VEGI PLATE  (WOODEN) ', '12', '1', '0', '0'),
('107', '525', '525', 'STEAK SAUCE BOWL  (WOODEN)', '12', '1', '0', '0'),
('108', '526', '526', 'STEAK MARBEL  (WOODEN)', '12', '1', '0', '0'),
('109', '527', '527', 'HOT PLATE (SKILLET BROWNIE)', '12', '1', '0', '0'),
('110', '528', '528', 'GLASS 350ML JUICE LONG ', '12', '1', '0', '0'),
('111', '529', '529', 'GLASS 300ML WATER (WINE) ', '12', '1', '0', '0'),
('112', '530', '530', 'GLASS 50ML MINI ', '12', '1', '0', '0'),
('113', '531', '531', 'PLATE VERSECE LOGO ', '12', '1', '0', '0'),
('114', '532', '532', 'SOUP CONTINENTS BOWL  ', '12', '1', '0', '0'),
('115', '533', '533', 'SOUP CONTINENTS TRAY', '12', '1', '0', '0'),
('116', '534', '534', 'COFFEE MUG PORCILEN ', '12', '1', '0', '0'),
('117', '536', '536', 'COFFEE CUP DISPOSABLE ', '12', '1', '0', '0'),
('118', '537', '537', 'COFFEE CUP DISPOSABLE LID', '12', '1', '0', '0'),
('119', '538', '538', 'ICE CREAM BOWL DISPOSABLE ', '12', '1', '0', '0'),
('120', '539', '539', 'ICE CREAM SPOON DISPOSABLE ', '12', '1', '0', '0'),
('121', '822', '822', 'AQUA FINA WATER 500ML ', '16', '1', '0', '0'),
('122', '451', '451', 'APPLE GREEN ', '17', '1', '0', '0'),
('123', '452', '452', 'GRAPES', '17', '1', '0', '0'),
('124', '453', '453', 'MUSAMMBI ', '17', '1', '0', '0'),
('125', '454', '454', 'KINNO', '17', '1', '0', '0'),
('126', '455', '455', 'BANANA ', '17', '1', '0', '0'),
('127', '456', '456', 'POMEGRANATE WHITE  ', '17', '1', '0', '0'),
('128', '457', '457', 'POMEGRANATE RED', '17', '1', '0', '0'),
('129', '458', '458', 'KIWI ', '17', '1', '0', '0'),
('130', '459', '459', 'MANGOO', '17', '1', '0', '0'),
('131', '460', '460', 'BEET (CHAKUNDER)', '17', '1', '0', '0'),
('132', '461', '461', 'APPLE KALA GULU ', '17', '1', '0', '0'),
('133', '462', '462', 'PEACH ', '17', '1', '0', '0'),
('134', '463', '463', 'FALSA', '17', '1', '0', '0'),
('135', '464', '464', 'ORANGE (MALTA)', '17', '1', '0', '0'),
('136', '702', '702', 'PACKING BAG PRINTED (KHAKHI)', '14', '1', '0', '0'),
('137', '703', '703', 'PACKING ZIPPER KHAKHI LARGE ', '14', '1', '0', '0'),
('138', '704', '704', 'PACKING ZIPPER KHAKHI SMALL', '14', '1', '0', '0'),
('139', '705', '705', 'TISSUE BOX ANTIQUE ', '14', '1', '0', '0'),
('140', '706', '706', 'SHOPPING BAG PLASTIC ', '14', '1', '0', '0'),
('141', '202', '202', 'FRESH YOUGERT ', '9', '1', '0', '0'),
('142', '203', '203', 'PREMA MILK ', '9', '1', '0', '0'),
('143', '204', '204', 'MILK PACK MILK 1 LTTER ', '9', '1', '0', '0'),
('144', '205', '205', 'YELLOW BUTTER FRESH', '9', '1', '0', '0'),
('145', '602', '602', 'TILE CLEANER Liquid bulk  ', '13', '1', '0', '0'),
('146', '603', '603', 'HARPIC TOILET CLEANER BULK ', '13', '1', '0', '0'),
('147', '604', '604', 'FANAYLE LIQUID BULK ', '13', '1', '0', '0'),
('148', '605', '605', 'HAND WASH LIQUID BULK ', '13', '1', '0', '0'),
('149', '540', '540', 'CHAIR AQUARIUM  ', '12', '1', '0', '0'),
('150', '541', '541', 'CHAIR VELVET ', '12', '1', '0', '0'),
('151', '542', '542', 'STOOL GOLDEN BLACK ', '12', '1', '0', '0'),
('152', '151', '151', 'SHRIMPS WHITE BAG 2KG ', '18', '1', '0', '0'),
('153', '152', '152', 'SHRIMPS 16/20 ', '18', '1', '0', '0'),
('154', '153', '153', 'SHRIMPS 21/25', '18', '1', '0', '0'),
('155', '154', '154', 'SHRIMPS GLOBAL ', '18', '1', '0', '0'),
('156', '543', '543', 'GLASS JUG FOR ICE TEA ', '12', '1', '0', '0'),
('157', '328', '328', 'WHITE CHEESE THREE COW 1/2 KG BLOCK ', '10', '1', '0', '0'),
('158', '329', '329', 'CHICKEN SAUSAGES  ', '10', '1', '0', '0'),
('159', '330', '330', 'LEAPED MIRROR GLASS (CAKE)', '10', '1', '0', '0'),
('160', '707', '707', 'STEAK TORCH ', '14', '1', '0', '0'),
('161', '708', '708', 'DIGITAL SCREEN FOR MENU', '14', '1', '0', '0'),
('162', '331', '331', 'MANGO PUREE MONTIBINACO 4KG ', '10', '1', '0', '0'),
('164', '333', '333', 'STRAWBERRY PUREE MONTIBINACO 4KG ', '10', '1', '0', '0'),
('165', '334', '334', 'SOYA SAUCE DARK 2 LITER (LEE KUM KI )', '10', '1', '0', '0'),
('166', '335', '335', 'SOYA SAUCE LIGHT 2 LITER (LEE KUM KI )', '10', '1', '0', '0'),
('167', '336', '336', 'SWEET VINEGAR ', '10', '1', '0', '0'),
('168', '337', '337', 'TAPAL DANEDAR TEA 1/2 KG ', '10', '1', '0', '0'),
('169', '338', '338', 'LIPTON GREEN TEA MINT 25PCS ', '10', '1', '0', '0'),
('170', '339', '339', 'LIPTON GREEN TEA SENCHA 30PCS ', '10', '1', '0', '0'),
('171', '340', '340', 'LIPTON GREEN TEA ROSEHIP 25PCS ', '10', '1', '0', '0'),
('172', '341', '341', 'LIPTON GREEN TEA CAMOMILE 30PCS ', '10', '1', '0', '0'),
('173', '342', '342', 'LIPTON GREEN TEA PURE BLACK 25 PCS ', '10', '1', '0', '0'),
('174', '343', '343', 'LIPTON GREEN TEA LEMON 25 PCS ', '10', '1', '0', '0'),
('175', '344', '344', 'LIPTON YELLOW LABEL SACHET 100 PCS PACK ', '10', '1', '0', '0'),
('176', '345', '345', 'LIPTON ICED TEA SACHET ', '10', '1', '0', '0'),
('177', '346', '346', 'LIPTON TEA 475 GRAMS ', '10', '1', '0', '0'),
('178', '347', '347', 'RIPPY TOPPING CARAMEL ', '10', '1', '0', '0'),
('179', '348', '348', 'RIPPY TOPPING MANGOO', '10', '1', '0', '0'),
('180', '349', '349', 'RIPPY TOPPING CHOCOLATE ', '10', '1', '0', '0'),
('181', '206', '206', 'WHITE BUTTER ', '9', '1', '0', '0'),
('182', '207', '207', 'HICO VANILA ICE CREAM 2 LITTER ', '9', '1', '0', '0'),
('184', '350', '350', 'FRENCH FRIES Mccain 2.5kg ', '10', '1', '0', '0'),
('185', '351', '351', 'MOZERELLA CHEESE ADAMS 2KG BLOCK ', '10', '1', '0', '0'),
('186', '352', '352', 'MILK CHOCOLATE 1 KG PACK COLLATA ', '10', '1', '0', '0'),
('187', '353', '353', 'WHITE CHOCOLATE 1 KG PACK COLLATA ', '10', '1', '0', '0'),
('188', '354', '354', 'LAVAZZA ESSPRESSO COFFEE 1 KG ', '10', '1', '0', '0'),
('189', '802', '802', 'DIET 7UP 300ML CAN ', '16', '1', '0', '0'),
('190', '355', '355', 'BAMBOO SHOOT TIN ', '10', '1', '0', '0'),
('191', '356', '356', 'SWEET CORN TIN ', '10', '1', '0', '0'),
('192', '357', '357', 'BABY CORN ', '10', '1', '0', '0'),
('193', '358', '358', 'BAMBOO SHOOT HALVES TIN', '10', '1', '0', '0'),
('194', '359', '359', 'AIRWIK FRESHENER 175GM  ', '10', '1', '0', '0'),
('195', '360', '360', 'AIRWIK DIFFUSER  MACHINE ', '10', '1', '0', '0'),
('197', '606', '606', 'SURGICAL GLOVES ', '13', '1', '0', '0'),
('198', '607', '607', 'HAIR NET CAP ', '13', '1', '0', '0'),
('199', '362', '362', 'MELAPINE PINEAPPLE SLICE 3KG ', '10', '1', '0', '0'),
('200', '363', '363', 'DELMONT PINEAPPLE JUICE 1.36 LITER ', '10', '1', '0', '0'),
('201', '364', '364', 'POLAC MILK 390 GRAMS ', '10', '1', '0', '0'),
('202', '365', '365', 'YELLOW CLING PEACH HALVES IN SYRUP 820GMS ', '10', '1', '0', '0'),
('203', '366', '366', 'LYCHEE READY TO EAT 365 GM ', '10', '1', '0', '0'),
('204', '367', '367', 'COCONUT MILK 400GMS ', '10', '1', '0', '0'),
('205', '368', '368', 'RED CHERRY SYRUP 240GMS ', '10', '1', '0', '0'),
('206', '369', '369', 'STRAWBERRY IN SYRUP 425GM ', '10', '1', '0', '0'),
('207', '370', '370', 'THAI COCONUT CREAM 400 GMS ', '10', '1', '0', '0'),
('208', '371', '371', 'SUFI COOKING OIL 1 LITER ', '10', '1', '0', '0'),
('209', '372', '372', 'STRAWBERRY FILLING 595GM ', '10', '1', '0', '0'),
('210', '373', '373', 'BLUEBERRY FILLING 595GM ', '10', '1', '0', '0'),
('211', '374', '374', 'STRAWBERRY PUREE MONTIBIANCO 2KG ', '10', '1', '0', '0'),
('212', '375', '375', 'MANGOO PUREE MONTIBIANCO 2KG ', '10', '1', '0', '0'),
('213', '376', '376', 'THAI GREEN CURRY PASTE 400GM', '10', '1', '0', '0'),
('214', '377', '377', 'PLAIN MUSTERED  400G', '10', '1', '0', '0'),
('215', '378', '378', 'ANCIENNE MUSTERED 200G ', '10', '1', '0', '0'),
('216', '379', '379', 'CREAM PEANUT BUTTER 340G', '10', '1', '0', '0'),
('217', '380', '380', 'KNOOR CHICKEN STOCK POWDER ', '10', '1', '0', '0'),
('218', '381', '381', 'RICE VERMICELLI 200GRAMS  ', '10', '1', '0', '0'),
('219', '382', '382', 'HP SAUCE 255 GRAMS ', '10', '1', '0', '0'),
('220', '383', '383', 'FOOD COLOR SILVER 25 GRAM', '10', '1', '0', '0'),
('221', '384', '384', 'FOOD COLOR GOLD 25 GRAM', '10', '1', '0', '0'),
('222', '385', '385', 'FOOD COLOR RED DUBAI 25 GRAM ', '10', '1', '0', '0'),
('223', '386', '386', 'CADABRY DRINKING CHOCOLATE POWDER 500GRAMS', '10', '1', '0', '0'),
('224', '387', '387', 'TOMATO PUREE 450 GRAM ', '10', '1', '0', '0'),
('225', '388', '388', 'TOMATO PASTE 450 GRAMS ', '10', '1', '0', '0'),
('226', '389', '389', 'OLIVE OIL 4 LITTER ', '10', '1', '0', '0'),
('227', '390', '390', 'RED ALLAPINO SLICED ', '10', '1', '0', '0'),
('228', '391', '391', 'GREEN ALLAPINO SLICED 480GRAMS ', '10', '1', '0', '0'),
('229', '392', '392', 'SUN DRY TOMATO 300 GRAMS ', '10', '1', '0', '0'),
('230', '393', '393', 'STRAWBERRY JELLY 100GRAMS ', '10', '1', '0', '0'),
('231', '394', '394', 'GRAPES JELLY 100 GRAM', '10', '1', '0', '0'),
('232', '395', '395', 'ORANGE JELLY ', '10', '1', '0', '0'),
('233', '396', '396', 'RED WINE VINEGAR 500ML ', '10', '1', '0', '0'),
('234', '397', '397', 'TOM YOM GONG PASTE 227 GRAMS ', '10', '1', '0', '0'),
('235', '398', '398', 'BACKING POWDER 300 GRAMS ', '10', '1', '0', '0'),
('236', '399', '399', 'HONEY 4.2 KGS ', '10', '1', '0', '0'),
('237', '230', '230', 'CORN FLOUR LOSSE ', '10', '1', '0', '0'),
('238', '231', '231', 'RED CHILLI PWODER LOOSE ', '10', '1', '0', '0'),
('239', '232', '232', 'CRUSHED CHILLI (DADER MIRCH)', '10', '1', '0', '0'),
('240', '233', '233', 'MILK PACK CREAM 200ML ', '10', '1', '0', '0'),
('241', '234', '234', 'CINNAMON POWDER ', '10', '1', '0', '0'),
('242', '235', '235', 'FOOD COLOR YELLOW POWDER ', '10', '1', '0', '0'),
('243', '236', '236', 'GARLIC POWDER LOOSE ', '10', '1', '0', '0'),
('244', '237', '237', 'SUJI SAMOLINA ', '10', '1', '0', '0'),
('245', '238', '238', 'OREAL CHICKEN POWDER ', '10', '1', '0', '0'),
('246', '239', '239', 'DASHI CHICKEN POWDER SACHET 100GRAM ', '10', '1', '0', '0'),
('247', '240', '240', 'CHILI POWDER NATIONAL 200GRAMS ', '10', '1', '0', '0'),
('248', '241', '241', 'ZEERA POWDER 50GRAMS ', '10', '1', '0', '0'),
('249', '242', '242', 'GARLIC POWDER 50GRAMS ', '10', '1', '0', '0'),
('250', '243', '243', 'TURMARIC POWDER 50 GRAMS ', '10', '1', '0', '0'),
('251', '244', '244', 'HOT CHOCOLOT LAVAZZA ', '10', '1', '0', '0'),
('252', '608', '608', 'BLACK BIN BAG ', '13', '1', '0', '0'),
('253', '609', '609', 'FABREEZ AIR FRESHNER ', '13', '1', '0', '0'),
('254', '610', '610', 'MORTEIN SPRAY ', '13', '1', '0', '0'),
('255', '245', '245', 'CHINESE SALT (CHINA NAMAK) LOOSE ', '10', '1', '0', '0'),
('256', '611', '611', 'TOWEL LOOSE ', '13', '1', '0', '0'),
('257', '612', '612', 'GLINT GLASS CLEANER PACK ', '13', '1', '0', '0'),
('258', '613', '613', 'LEMON MAX BAR 290 GRAMS ', '13', '1', '0', '0'),
('259', '709', '709', 'HEART STYLE BALOONS ', '14', '1', '0', '0'),
('260', '246', '246', 'RED CHILLI WHOLE ROUND ', '10', '1', '0', '0'),
('261', '247', '247', 'LADY FRUIT GEL 5KG ', '10', '1', '0', '0'),
('262', '248', '248', 'IMLI LOOSE ', '10', '1', '0', '0'),
('263', '249', '249', 'ALMOND ', '10', '1', '0', '0'),
('264', '250', '250', 'PEANUTS LOOSE ', '10', '1', '0', '0'),
('265', '251', '251', 'PISTA ', '10', '1', '0', '0'),
('266', '252', '252', 'WALNUT AKHROOT ', '10', '1', '0', '0'),
('267', '253', '253', 'PICTACHIO CRUSH IMPORTD ', '10', '1', '0', '0'),
('268', '254', '254', 'CHOCO  POWDER LOOSE ', '10', '1', '0', '0'),
('269', '614', '614', 'WIPER ', '13', '1', '0', '0'),
('270', '615', '615', 'MOP BROOM ', '13', '1', '0', '0'),
('271', '616', '616', 'PICKER HELPER ', '13', '1', '0', '0'),
('272', '617', '617', 'WIPER ROD ', '13', '1', '0', '0'),
('273', '255', '255', 'KUNG PAO PASTE 150 GRAMS ', '10', '1', '0', '0'),
('274', '256', '256', 'KUNG PAO PASTE 1 KG ', '10', '1', '0', '0'),
('275', '257', '257', 'KUNG PAO PASTE 500GRAMS ', '10', '1', '0', '0'),
('276', '258', '258', 'CORRIANDER', '10', '1', '0', '0'),
('277', '823', '823', 'RED BULL', '16', '1', '0', '0'),
('278', '418', '418', 'GREEN CHILLI', '11', '1', '0', '0'),
('279', '259', '259', 'RED CHILLI PASTE', '10', '1', '0', '0'),
('280', '260', '260', 'LEMON GRASS', '10', '1', '0', '0'),
('281', '261', '261', 'WHITE CHOCOLATE', '10', '1', '0', '0'),
('282', '262', '262', 'DRIED MASHROOM BLACK', '10', '1', '0', '0'),
('283', '263', '263', 'ALL PURPOSE FLOUR', '10', '1', '0', '0'),
('285', '265', '265', 'SUGAR', '10', '1', '0', '0'),
('286', '264', '264', 'SUGAR SACHET WHITE', '10', '1', '0', '0'),
('287', '266', '266', 'GLUCOSE', '10', '1', '0', '0'),
('288', '267', '267', 'FISH SAUCE 750ML', '10', '1', '0', '0'),
('289', '268', '268', 'BALSAMIC VINEGAR', '10', '1', '0', '0'),
('290', '269', '269', 'THAI SWEET CHILLI', '10', '1', '0', '0'),
('291', '270', '270', 'HOT SAUCE (SHANGRILLA)', '10', '1', '0', '0'),
('292', '271', '271', 'LEMON JUICE (MITCHELS)', '10', '1', '0', '0'),
('293', '272', '272', 'CAPERS (BEN-DELS)', '10', '1', '0', '0'),
('294', '273', '273', 'GREEN PEPPER CORN 100GMS (BEN-DELS)', '10', '1', '0', '0'),
('295', '274', '274', 'SAMBOLIC CHILLI', '10', '1', '0', '0'),
('296', '275', '275', 'THAI CHILLI PASTE', '10', '1', '0', '0'),
('297', '276', '276', 'GREEN CHILLI PASTE', '10', '1', '0', '0'),
('298', '277', '277', 'GREEN CHILLI PICKLE', '10', '1', '0', '0'),
('299', '278', '278', 'RED CHILLI PICKLE', '10', '1', '0', '0'),
('300', '279', '279', 'CHILLI GARLIC (KNORR)', '10', '1', '0', '0'),
('301', '280', '280', 'TOMATO KETCHUP 800GMS (KNORR)', '10', '1', '0', '0'),
('302', '281', '281', 'KING SUGAR', '10', '1', '0', '0'),
('303', '282', '282', 'TOMATO KETCHUP SACHET', '10', '1', '0', '0'),
('304', '283', '283', 'GARLIC CHILLI SACHET', '10', '1', '0', '0'),
('305', '284', '284', 'SEASAME OIL (HEINZ) 500ML', '10', '1', '0', '0'),
('306', '285', '285', 'GREEN LABLE FOOD COLOR', '10', '1', '0', '0'),
('307', '286', '286', 'FOOD COLOR YELLOW 500 GMS (ASIA)', '10', '1', '0', '0'),
('308', '287', '287', 'CAKE MIX (BETTY CROCKER) 432 GMS', '10', '1', '0', '0'),
('309', '288', '288', 'YEAST 500 GMS', '10', '1', '0', '0'),
('310', '289', '289', 'VANILA FLAVOUR 450ML (BUSH BOAK ALLEN)', '10', '1', '0', '0'),
('311', '290', '290', 'BARBECUE SAUCE 800 GMS (KNORR)', '10', '1', '0', '0'),
('312', '291', '291', 'ABC SAUCE', '10', '1', '0', '0'),
('313', '292', '292', 'GRAPE VINEGAR', '10', '1', '0', '0'),
('314', '293', '293', 'SYNTHETIC VINEGAR', '10', '1', '0', '0'),
('315', '294', '294', 'BUTTER MASHROOM', '10', '1', '0', '0'),
('316', '295', '295', 'FRENCH MUSTARD ', '10', '1', '0', '0'),
('317', '296', '296', 'GREEN CAPER CORN', '10', '1', '0', '0'),
('318', '297', '297', 'RED BEANS', '10', '1', '0', '0'),
('319', '298', '298', 'ORANGE JAM', '10', '1', '0', '0'),
('320', '299', '299', 'SEA SALT', '10', '1', '0', '0'),
('321', '300', '300', 'GREEN OLIVES', '10', '1', '0', '0'),
('322', '730', '730', 'GRAPES OIL', '10', '1', '0', '0'),
('323', '731', '731', 'KACHRI POWDER LOOSE', '10', '1', '0', '0'),
('324', '732', '732', 'OREGANO DRY', '10', '1', '0', '0'),
('325', '733', '733', 'ROSEMERRY', '10', '1', '0', '0'),
('326', '734', '734', 'MASHROOM FUNGUS', '10', '1', '0', '0'),
('327', '735', '735', 'TOMATO CHIPS', '10', '1', '0', '0'),
('328', '736', '736', 'BROWN SUGAR', '10', '1', '0', '0'),
('329', '737', '737', 'BLACK PEPPER SABAT', '10', '1', '0', '0'),
('330', '738', '738', 'FRESH BASIL', '11', '1', '0', '0'),
('331', '739', '739', 'PARSLEY', '11', '1', '0', '0'),
('332', '740', '740', 'TOMATOES', '11', '1', '0', '0'),
('333', '741', '741', 'FABRI MIXY CAFE - CARAMEL', '10', '1', '0', '0'),
('334', '742', '742', 'FABRI MIXY CAFE - CINNAMON', '10', '1', '0', '0'),
('335', '743', '743', 'FABRI MIXY CAFE - COCONUT', '10', '1', '0', '0'),
('336', '744', '744', 'FABRI MIXY CAFE - HAZELNUT', '10', '1', '0', '0'),
('337', '745', '745', 'FABRI MIXY CAFE - IRISH CREAM', '10', '1', '0', '0'),
('338', '746', '746', 'FABRI MIXY CAFE - VANILLA', '10', '1', '0', '0'),
('339', '747', '747', 'FABRI MIXY BAR - COCONUT', '10', '1', '0', '0'),
('340', '748', '748', 'FABRI MIXY BAR - KIWI', '10', '1', '0', '0'),
('341', '749', '749', 'FABRI MIXY BAR - LEMON', '10', '1', '0', '0'),
('342', '750', '750', 'FABRI MIXY BAR - MANGO', '10', '1', '0', '0'),
('343', '751', '751', 'FABRI MIXY BAR - ORANGE', '10', '1', '0', '0'),
('344', '752', '752', 'FABRI MIXY BAR - PEACH', '10', '1', '0', '0'),
('345', '753', '753', 'FABRI MIXY BAR - PINEAPPLE', '10', '1', '0', '0'),
('346', '754', '754', 'FABRI MIXY BAR - POMEGRANATE', '10', '1', '0', '0'),
('347', '755', '755', 'FABRI MIXY BAR - RASPBERRY', '10', '1', '0', '0'),
('348', '756', '756', 'FABRI MIXY BAR - ROSE', '10', '1', '0', '0'),
('349', '757', '757', 'FABRI MIXY BAR - STRAWBERRY', '10', '1', '0', '0'),
('350', '758', '758', 'BELGIAN MILK CHOCOLATE 37% COCOA', '10', '1', '0', '0'),
('351', '759', '759', 'BELGIAN WHITE CHOCOLATE 31.3% COCOA', '10', '1', '0', '0'),
('352', '760', '760', 'SUPERBASE 100', '10', '1', '0', '0');

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
('Bottles', 'Bottles ', '-1', '0'),
('Bunch', 'Bunch ', '-1', '0'),
('Doz', 'Dozen', '-1', '0'),
('Jar', 'Jar', '-1', '0'),
('Kgs', 'Kilo Grams ', '-1', '0'),
('Pack', 'Pack', '-1', '0'),
('pcs', 'pcs', '-1', '0'),
('Tray ', 'Tray', '-1', '0');

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
('001', '001', '20', NULL),
('001', '002', '10', NULL),
('001', '003', '0', NULL),
('001', '004', '0', NULL),
('001', '101', '20', NULL),
('001', '102', '10', NULL),
('001', '103', '0', NULL),
('001', '104', '5', NULL),
('001', '105', '5', NULL),
('001', '106', '15', NULL),
('001', '107', '0', NULL),
('001', '109', '10', NULL),
('001', '151', '10', NULL),
('001', '152', '6', NULL),
('001', '153', '4', NULL),
('001', '154', '0', NULL),
('001', '201', '10', NULL),
('001', '202', '0', NULL),
('001', '203', '12', NULL),
('001', '204', '12', NULL),
('001', '205', '10', NULL),
('001', '206', '0', NULL),
('001', '207', '0', NULL),
('001', '230', '25', NULL),
('001', '231', '2', NULL),
('001', '232', '2', NULL),
('001', '233', '24', NULL),
('001', '234', '1', NULL),
('001', '235', '0.5', NULL),
('001', '236', '1', NULL),
('001', '237', '1', NULL),
('001', '238', '0', NULL),
('001', '239', '0', NULL),
('001', '240', '0', NULL),
('001', '241', '0', NULL),
('001', '242', '0', NULL),
('001', '243', '0', NULL),
('001', '244', '0', NULL),
('001', '245', '15', NULL),
('001', '246', '5', NULL),
('001', '247', '0', NULL),
('001', '248', '3', NULL),
('001', '249', '1.5', NULL),
('001', '250', '2', NULL),
('001', '251', '0.5', NULL),
('001', '252', '1', NULL),
('001', '253', '0', NULL),
('001', '254', '2', NULL),
('001', '255', '0', NULL),
('001', '256', '3', NULL),
('001', '257', '0', NULL),
('001', '258', '1', NULL),
('001', '259', '1', NULL),
('001', '260', '0', NULL),
('001', '261', '15', NULL),
('001', '262', '1', NULL),
('001', '263', '15', NULL),
('001', '264', '5', NULL),
('001', '265', '15', NULL),
('001', '266', '3', NULL),
('001', '267', '2', NULL),
('001', '268', '2', NULL),
('001', '269', '2', NULL),
('001', '270', '2', NULL),
('001', '271', '5', NULL),
('001', '272', '0', NULL),
('001', '273', '0', NULL),
('001', '274', '5', NULL),
('001', '275', '3', NULL),
('001', '276', '0', NULL),
('001', '277', '0', NULL),
('001', '278', '0', NULL),
('001', '279', '3', NULL),
('001', '280', '0', NULL),
('001', '281', '0', NULL),
('001', '282', '0', NULL),
('001', '283', '0', NULL),
('001', '284', '2', NULL),
('001', '285', '0', NULL),
('001', '286', '0', NULL),
('001', '287', '0', NULL),
('001', '288', '1', NULL),
('001', '289', '0', NULL),
('001', '290', '0', NULL),
('001', '291', '0', NULL),
('001', '292', '0', NULL),
('001', '293', '4', NULL),
('001', '294', '0', NULL),
('001', '295', '0', NULL),
('001', '296', '0', NULL),
('001', '297', '0', NULL),
('001', '298', '0', NULL),
('001', '299', '0', NULL),
('001', '300', '0', NULL),
('001', '301', '25', NULL),
('001', '302', '4', NULL),
('001', '303', '25', NULL),
('001', '304', '3', NULL),
('001', '305', '5', NULL),
('001', '306', '3', NULL),
('001', '307', '0', NULL),
('001', '308', '0', NULL),
('001', '309', '0', NULL),
('001', '310', '0', NULL),
('001', '311', '0', NULL),
('001', '312', '0', NULL),
('001', '313', '0', NULL),
('001', '314', '20', NULL),
('001', '315', '24', NULL),
('001', '316', '0', NULL),
('001', '317', '3', NULL),
('001', '318', '0', NULL),
('001', '319', '24', NULL),
('001', '320', '0', NULL),
('001', '321', '3', NULL),
('001', '322', '0', NULL),
('001', '323', '2', NULL),
('001', '324', '0', NULL),
('001', '325', '0', NULL),
('001', '326', '2', NULL),
('001', '327', '3', NULL),
('001', '328', '0', NULL),
('001', '329', '0', NULL),
('001', '330', '0', NULL),
('001', '331', '0', NULL),
('001', '333', '0', NULL),
('001', '334', '5', NULL),
('001', '335', '5', NULL),
('001', '336', '0', NULL),
('001', '337', '0', NULL),
('001', '338', '0', NULL),
('001', '339', '0', NULL),
('001', '340', '0', NULL),
('001', '341', '0', NULL),
('001', '342', '0', NULL),
('001', '343', '0', NULL),
('001', '344', '2', NULL),
('001', '345', '0', NULL),
('001', '346', '0', NULL),
('001', '347', '0', NULL),
('001', '348', '0', NULL),
('001', '349', '0', NULL),
('001', '350', '10', NULL),
('001', '351', '2', NULL),
('001', '352', '0', NULL),
('001', '353', '0', NULL),
('001', '354', '0', NULL),
('001', '355', '6', NULL),
('001', '356', '10', NULL),
('001', '357', '5', NULL),
('001', '358', '0', NULL),
('001', '359', '24', NULL),
('001', '360', '0', NULL),
('001', '362', '5', NULL),
('001', '363', '5', NULL),
('001', '364', '5', NULL),
('001', '365', '0', NULL),
('001', '366', '0', NULL),
('001', '367', '4', NULL),
('001', '368', '0', NULL),
('001', '369', '0', NULL),
('001', '370', '0', NULL),
('001', '371', '10', NULL),
('001', '372', '3', NULL),
('001', '373', '3', NULL),
('001', '374', '0', NULL),
('001', '375', '0', NULL),
('001', '376', '0', NULL),
('001', '377', '0', NULL),
('001', '378', '0', NULL),
('001', '379', '0', NULL),
('001', '380', '5', NULL),
('001', '381', '0', NULL),
('001', '382', '5', NULL),
('001', '383', '0', NULL),
('001', '384', '0', NULL),
('001', '385', '0', NULL),
('001', '386', '0', NULL),
('001', '387', '5', NULL),
('001', '388', '0', NULL),
('001', '389', '0', NULL),
('001', '390', '0', NULL),
('001', '391', '0', NULL),
('001', '392', '0', NULL),
('001', '393', '0', NULL),
('001', '394', '0', NULL),
('001', '395', '0', NULL),
('001', '396', '0', NULL),
('001', '397', '3', NULL),
('001', '398', '2', NULL),
('001', '399', '1', NULL),
('001', '401', '15', NULL),
('001', '402', '4', NULL),
('001', '403', '2', NULL),
('001', '404', '3', NULL),
('001', '405', '2', NULL),
('001', '406', '0', NULL),
('001', '407', '10', NULL),
('001', '408', '0', NULL),
('001', '409', '0', NULL),
('001', '410', '1', NULL),
('001', '411', '2', NULL),
('001', '412', '1', NULL),
('001', '413', '4', NULL),
('001', '414', '10', NULL),
('001', '415', '1', NULL),
('001', '416', '5', NULL),
('001', '417', '2', NULL),
('001', '418', '2', NULL),
('001', '451', '0', NULL),
('001', '452', '0', NULL),
('001', '453', '0', NULL),
('001', '454', '0', NULL),
('001', '455', '0', NULL),
('001', '456', '0', NULL),
('001', '457', '0', NULL),
('001', '458', '0', NULL),
('001', '459', '0', NULL),
('001', '460', '0', NULL),
('001', '461', '0', NULL),
('001', '462', '0', NULL),
('001', '463', '0', NULL),
('001', '464', '0', NULL),
('001', '501', '0', NULL),
('001', '502', '0', NULL),
('001', '503', '0', NULL),
('001', '504', '0', NULL),
('001', '505', '0', NULL),
('001', '506', '0', NULL),
('001', '507', '0', NULL),
('001', '508', '0', NULL),
('001', '509', '0', NULL),
('001', '510', '0', NULL),
('001', '511', '0', NULL),
('001', '512', '0', NULL),
('001', '513', '0', NULL),
('001', '514', '0', NULL),
('001', '515', '0', NULL),
('001', '516', '0', NULL),
('001', '517', '0', NULL),
('001', '518', '0', NULL),
('001', '519', '0', NULL),
('001', '520', '0', NULL),
('001', '521', '0', NULL),
('001', '522', '0', NULL),
('001', '523', '0', NULL),
('001', '524', '0', NULL),
('001', '525', '0', NULL),
('001', '526', '0', NULL),
('001', '527', '0', NULL),
('001', '528', '0', NULL),
('001', '529', '0', NULL),
('001', '530', '0', NULL),
('001', '531', '0', NULL),
('001', '532', '0', NULL),
('001', '533', '0', NULL),
('001', '534', '0', NULL),
('001', '536', '0', NULL),
('001', '537', '0', NULL),
('001', '538', '0', NULL),
('001', '539', '0', NULL),
('001', '540', '20', NULL),
('001', '541', '0', NULL),
('001', '542', '0', NULL),
('001', '543', '0', NULL),
('001', '601', '0', NULL),
('001', '602', '0', NULL),
('001', '603', '0', NULL),
('001', '604', '0', NULL),
('001', '605', '0', NULL),
('001', '606', '0', NULL),
('001', '607', '0', NULL),
('001', '608', '0', NULL),
('001', '609', '0', NULL),
('001', '610', '0', NULL),
('001', '611', '0', NULL),
('001', '612', '0', NULL),
('001', '613', '0', NULL),
('001', '614', '0', NULL),
('001', '615', '0', NULL),
('001', '616', '0', NULL),
('001', '617', '0', NULL),
('001', '701', '0', NULL),
('001', '702', '500', NULL),
('001', '703', '0', NULL),
('001', '704', '0', NULL),
('001', '705', '100', NULL),
('001', '706', '0', NULL),
('001', '707', '0', NULL),
('001', '708', '0', NULL),
('001', '709', '0', NULL),
('001', '730', '2', NULL),
('001', '731', '2', NULL),
('001', '732', '1', NULL),
('001', '733', '1', NULL),
('001', '734', '1', NULL),
('001', '735', '0', NULL),
('001', '736', '0', NULL),
('001', '737', '2', NULL),
('001', '738', '1', NULL),
('001', '739', '0.5', NULL),
('001', '740', '0', NULL),
('001', '741', '0', NULL),
('001', '742', '0', NULL),
('001', '743', '0', NULL),
('001', '744', '0', NULL),
('001', '745', '0', NULL),
('001', '746', '0', NULL),
('001', '747', '0', NULL),
('001', '748', '0', NULL),
('001', '749', '0', NULL),
('001', '750', '0', NULL),
('001', '751', '0', NULL),
('001', '752', '0', NULL),
('001', '753', '0', NULL),
('001', '754', '0', NULL),
('001', '755', '0', NULL),
('001', '756', '0', NULL),
('001', '757', '0', NULL),
('001', '758', '0', NULL),
('001', '759', '0', NULL),
('001', '760', '4', NULL),
('001', '801', '96', NULL),
('001', '802', '96', NULL),
('001', '803', '192', NULL),
('001', '804', '96', NULL),
('001', '805', '0', NULL),
('001', '806', '0', NULL),
('001', '807', '0', NULL),
('001', '808', '24', NULL),
('001', '809', '96', NULL),
('001', '810', '0', NULL),
('001', '814', '0', NULL),
('001', '815', '0', NULL),
('001', '816', '0', NULL),
('001', '817', '3', NULL),
('001', '818', '3', NULL),
('001', '819', '3', NULL),
('001', '820', '3', NULL),
('001', '821', '3', NULL),
('001', '822', '192', NULL),
('001', '823', '12', NULL),
('001', '901', '180', NULL),
('002', '001', '0', NULL),
('002', '002', '0', NULL),
('002', '003', '0', NULL),
('002', '004', '0', NULL),
('002', '101', '0', NULL),
('002', '102', '0', NULL),
('002', '103', '0', NULL),
('002', '104', '0', NULL),
('002', '105', '0', NULL),
('002', '106', '0', NULL),
('002', '107', '0', NULL),
('002', '109', '0', NULL),
('002', '151', '0', NULL),
('002', '152', '0', NULL),
('002', '153', '0', NULL),
('002', '154', '0', NULL),
('002', '201', '0', NULL),
('002', '202', '0', NULL),
('002', '203', '0', NULL),
('002', '204', '0', NULL),
('002', '205', '0', NULL),
('002', '206', '0', NULL),
('002', '207', '0', NULL),
('002', '230', '0', NULL),
('002', '231', '0', NULL),
('002', '232', '0', NULL),
('002', '233', '0', NULL),
('002', '234', '0', NULL),
('002', '235', '0', NULL),
('002', '236', '0', NULL),
('002', '237', '0', NULL),
('002', '238', '0', NULL),
('002', '239', '0', NULL),
('002', '240', '0', NULL),
('002', '241', '0', NULL),
('002', '242', '0', NULL),
('002', '243', '0', NULL),
('002', '244', '0', NULL),
('002', '245', '0', NULL),
('002', '246', '0', NULL),
('002', '247', '0', NULL),
('002', '248', '0', NULL),
('002', '249', '0', NULL),
('002', '250', '0', NULL),
('002', '251', '0', NULL),
('002', '252', '0', NULL),
('002', '253', '0', NULL),
('002', '254', '0', NULL),
('002', '255', '0', NULL),
('002', '256', '0', NULL),
('002', '257', '0', NULL),
('002', '258', '0', NULL),
('002', '259', '0', NULL),
('002', '260', '0', NULL),
('002', '261', '0', NULL),
('002', '262', '0', NULL),
('002', '263', '0', NULL),
('002', '264', '0', NULL),
('002', '265', '0', NULL),
('002', '266', '0', NULL),
('002', '267', '0', NULL),
('002', '268', '0', NULL),
('002', '269', '0', NULL),
('002', '270', '0', NULL),
('002', '271', '0', NULL),
('002', '272', '0', NULL),
('002', '273', '0', NULL),
('002', '274', '0', NULL),
('002', '275', '0', NULL),
('002', '276', '0', NULL),
('002', '277', '0', NULL),
('002', '278', '0', NULL),
('002', '279', '0', NULL),
('002', '280', '0', NULL),
('002', '281', '0', NULL),
('002', '282', '0', NULL),
('002', '283', '0', NULL),
('002', '284', '0', NULL),
('002', '285', '0', NULL),
('002', '286', '0', NULL),
('002', '287', '0', NULL),
('002', '288', '0', NULL),
('002', '289', '0', NULL),
('002', '290', '0', NULL),
('002', '291', '0', NULL),
('002', '292', '0', NULL),
('002', '293', '0', NULL),
('002', '294', '0', NULL),
('002', '295', '0', NULL),
('002', '296', '0', NULL),
('002', '297', '0', NULL),
('002', '298', '0', NULL),
('002', '299', '0', NULL),
('002', '300', '0', NULL),
('002', '301', '0', NULL),
('002', '302', '0', NULL),
('002', '303', '0', NULL),
('002', '304', '0', NULL),
('002', '305', '0', NULL),
('002', '306', '0', NULL),
('002', '307', '0', NULL),
('002', '308', '0', NULL),
('002', '309', '0', NULL),
('002', '310', '0', NULL),
('002', '311', '0', NULL),
('002', '312', '0', NULL),
('002', '313', '0', NULL),
('002', '314', '0', NULL),
('002', '315', '0', NULL),
('002', '316', '0', NULL),
('002', '317', '0', NULL),
('002', '318', '0', NULL),
('002', '319', '0', NULL),
('002', '320', '0', NULL),
('002', '321', '0', NULL),
('002', '322', '0', NULL),
('002', '323', '0', NULL),
('002', '324', '0', NULL),
('002', '325', '0', NULL),
('002', '326', '0', NULL),
('002', '327', '0', NULL),
('002', '328', '0', NULL),
('002', '329', '0', NULL),
('002', '330', '0', NULL),
('002', '331', '0', NULL),
('002', '333', '0', NULL),
('002', '334', '0', NULL),
('002', '335', '0', NULL),
('002', '336', '0', NULL),
('002', '337', '0', NULL),
('002', '338', '0', NULL),
('002', '339', '0', NULL),
('002', '340', '0', NULL),
('002', '341', '0', NULL),
('002', '342', '0', NULL),
('002', '343', '0', NULL),
('002', '344', '0', NULL),
('002', '345', '0', NULL),
('002', '346', '0', NULL),
('002', '347', '0', NULL),
('002', '348', '0', NULL),
('002', '349', '0', NULL),
('002', '350', '0', NULL),
('002', '351', '0', NULL),
('002', '352', '0', NULL),
('002', '353', '0', NULL),
('002', '354', '0', NULL),
('002', '355', '0', NULL),
('002', '356', '0', NULL),
('002', '357', '0', NULL),
('002', '358', '0', NULL),
('002', '359', '0', NULL),
('002', '360', '0', NULL),
('002', '362', '0', NULL),
('002', '363', '0', NULL),
('002', '364', '0', NULL),
('002', '365', '0', NULL),
('002', '366', '0', NULL),
('002', '367', '0', NULL),
('002', '368', '0', NULL),
('002', '369', '0', NULL),
('002', '370', '0', NULL),
('002', '371', '0', NULL),
('002', '372', '0', NULL),
('002', '373', '0', NULL),
('002', '374', '0', NULL),
('002', '375', '0', NULL),
('002', '376', '0', NULL),
('002', '377', '0', NULL),
('002', '378', '0', NULL),
('002', '379', '0', NULL),
('002', '380', '0', NULL),
('002', '381', '0', NULL),
('002', '382', '0', NULL),
('002', '383', '0', NULL),
('002', '384', '0', NULL),
('002', '385', '0', NULL),
('002', '386', '0', NULL),
('002', '387', '0', NULL),
('002', '388', '0', NULL),
('002', '389', '0', NULL),
('002', '390', '0', NULL),
('002', '391', '0', NULL),
('002', '392', '0', NULL),
('002', '393', '0', NULL),
('002', '394', '0', NULL),
('002', '395', '0', NULL),
('002', '396', '0', NULL),
('002', '397', '0', NULL),
('002', '398', '0', NULL),
('002', '399', '0', NULL),
('002', '401', '0', NULL),
('002', '402', '0', NULL),
('002', '403', '0', NULL),
('002', '404', '0', NULL),
('002', '405', '0', NULL),
('002', '406', '0', NULL),
('002', '407', '0', NULL),
('002', '408', '0', NULL),
('002', '409', '0', NULL),
('002', '410', '0', NULL),
('002', '411', '0', NULL),
('002', '412', '0', NULL),
('002', '413', '0', NULL),
('002', '414', '0', NULL),
('002', '415', '0', NULL),
('002', '416', '0', NULL),
('002', '417', '0', NULL),
('002', '418', '0', NULL),
('002', '451', '0', NULL),
('002', '452', '0', NULL),
('002', '453', '0', NULL),
('002', '454', '0', NULL),
('002', '455', '0', NULL),
('002', '456', '0', NULL),
('002', '457', '0', NULL),
('002', '458', '0', NULL),
('002', '459', '0', NULL),
('002', '460', '0', NULL),
('002', '461', '0', NULL),
('002', '462', '0', NULL),
('002', '463', '0', NULL),
('002', '464', '0', NULL),
('002', '501', '0', NULL),
('002', '502', '0', NULL),
('002', '503', '0', NULL),
('002', '504', '0', NULL),
('002', '505', '0', NULL),
('002', '506', '0', NULL),
('002', '507', '0', NULL),
('002', '508', '0', NULL),
('002', '509', '0', NULL),
('002', '510', '0', NULL),
('002', '511', '0', NULL),
('002', '512', '0', NULL),
('002', '513', '0', NULL),
('002', '514', '0', NULL),
('002', '515', '0', NULL),
('002', '516', '0', NULL),
('002', '517', '0', NULL),
('002', '518', '0', NULL),
('002', '519', '0', NULL),
('002', '520', '0', NULL),
('002', '521', '0', NULL),
('002', '522', '0', NULL),
('002', '523', '0', NULL),
('002', '524', '0', NULL),
('002', '525', '0', NULL),
('002', '526', '0', NULL),
('002', '527', '0', NULL),
('002', '528', '0', NULL),
('002', '529', '0', NULL),
('002', '530', '0', NULL),
('002', '531', '0', NULL),
('002', '532', '0', NULL),
('002', '533', '0', NULL),
('002', '534', '0', NULL),
('002', '536', '0', NULL),
('002', '537', '0', NULL),
('002', '538', '0', NULL),
('002', '539', '0', NULL),
('002', '540', '20', NULL),
('002', '541', '0', NULL),
('002', '542', '0', NULL),
('002', '543', '0', NULL),
('002', '601', '0', NULL),
('002', '602', '0', NULL),
('002', '603', '0', NULL),
('002', '604', '0', NULL),
('002', '605', '0', NULL),
('002', '606', '0', NULL),
('002', '607', '0', NULL),
('002', '608', '0', NULL),
('002', '609', '0', NULL),
('002', '610', '0', NULL),
('002', '611', '0', NULL),
('002', '612', '0', NULL),
('002', '613', '0', NULL),
('002', '614', '0', NULL),
('002', '615', '0', NULL),
('002', '616', '0', NULL),
('002', '617', '0', NULL),
('002', '701', '0', NULL),
('002', '702', '0', NULL),
('002', '703', '0', NULL),
('002', '704', '0', NULL),
('002', '705', '0', NULL),
('002', '706', '0', NULL),
('002', '707', '0', NULL),
('002', '708', '0', NULL),
('002', '709', '0', NULL),
('002', '730', '0', NULL),
('002', '731', '0', NULL),
('002', '732', '0', NULL),
('002', '733', '0', NULL),
('002', '734', '0', NULL),
('002', '735', '0', NULL),
('002', '736', '0', NULL),
('002', '737', '0', NULL),
('002', '738', '0', NULL),
('002', '739', '0', NULL),
('002', '740', '0', NULL),
('002', '741', '0', NULL),
('002', '742', '0', NULL),
('002', '743', '0', NULL),
('002', '744', '0', NULL),
('002', '745', '0', NULL),
('002', '746', '0', NULL),
('002', '747', '0', NULL),
('002', '748', '0', NULL),
('002', '749', '0', NULL),
('002', '750', '0', NULL),
('002', '751', '0', NULL),
('002', '752', '0', NULL),
('002', '753', '0', NULL),
('002', '754', '0', NULL),
('002', '755', '0', NULL),
('002', '756', '0', NULL),
('002', '757', '0', NULL),
('002', '758', '0', NULL),
('002', '759', '0', NULL),
('002', '760', '0', NULL),
('002', '801', '0', NULL),
('002', '802', '0', NULL),
('002', '803', '0', NULL),
('002', '804', '0', NULL),
('002', '805', '0', NULL),
('002', '806', '0', NULL),
('002', '807', '0', NULL),
('002', '808', '0', NULL),
('002', '809', '0', NULL),
('002', '810', '0', NULL),
('002', '814', '0', NULL),
('002', '815', '0', NULL),
('002', '816', '0', NULL),
('002', '817', '0', NULL),
('002', '818', '0', NULL),
('002', '819', '0', NULL),
('002', '820', '0', NULL),
('002', '821', '0', NULL),
('002', '822', '0', NULL),
('002', '823', '0', NULL),
('002', '901', '0', NULL),
('003', '001', '0', NULL),
('003', '002', '0', NULL),
('003', '003', '0', NULL),
('003', '004', '0', NULL),
('003', '101', '0', NULL),
('003', '102', '0', NULL),
('003', '103', '0', NULL),
('003', '104', '0', NULL),
('003', '105', '0', NULL),
('003', '106', '0', NULL),
('003', '107', '0', NULL),
('003', '109', '0', NULL),
('003', '151', '0', NULL),
('003', '152', '0', NULL),
('003', '153', '0', NULL),
('003', '154', '0', NULL),
('003', '201', '0', NULL),
('003', '202', '0', NULL),
('003', '203', '0', NULL),
('003', '204', '0', NULL),
('003', '205', '0', NULL),
('003', '206', '0', NULL),
('003', '207', '0', NULL),
('003', '230', '0', NULL),
('003', '231', '0', NULL),
('003', '232', '0', NULL),
('003', '233', '0', NULL),
('003', '234', '0', NULL),
('003', '235', '0', NULL),
('003', '236', '0', NULL),
('003', '237', '0', NULL),
('003', '238', '0', NULL),
('003', '239', '0', NULL),
('003', '240', '0', NULL),
('003', '241', '0', NULL),
('003', '242', '0', NULL),
('003', '243', '0', NULL),
('003', '244', '0', NULL),
('003', '245', '0', NULL),
('003', '246', '0', NULL),
('003', '247', '0', NULL),
('003', '248', '0', NULL),
('003', '249', '0', NULL),
('003', '250', '0', NULL),
('003', '251', '0', NULL),
('003', '252', '0', NULL),
('003', '253', '0', NULL),
('003', '254', '0', NULL),
('003', '255', '0', NULL),
('003', '256', '0', NULL),
('003', '257', '0', NULL),
('003', '258', '0', NULL),
('003', '259', '0', NULL),
('003', '260', '0', NULL),
('003', '261', '0', NULL),
('003', '262', '0', NULL),
('003', '263', '0', NULL),
('003', '264', '0', NULL),
('003', '265', '0', NULL),
('003', '266', '0', NULL),
('003', '267', '0', NULL),
('003', '268', '0', NULL),
('003', '269', '0', NULL),
('003', '270', '0', NULL),
('003', '271', '0', NULL),
('003', '272', '0', NULL),
('003', '273', '0', NULL),
('003', '274', '0', NULL),
('003', '275', '0', NULL),
('003', '276', '0', NULL),
('003', '277', '0', NULL),
('003', '278', '0', NULL),
('003', '279', '0', NULL),
('003', '280', '0', NULL),
('003', '281', '0', NULL),
('003', '282', '0', NULL),
('003', '283', '0', NULL),
('003', '284', '0', NULL),
('003', '285', '0', NULL),
('003', '286', '0', NULL),
('003', '287', '0', NULL),
('003', '288', '0', NULL),
('003', '289', '0', NULL),
('003', '290', '0', NULL),
('003', '291', '0', NULL),
('003', '292', '0', NULL),
('003', '293', '0', NULL),
('003', '294', '0', NULL),
('003', '295', '0', NULL),
('003', '296', '0', NULL),
('003', '297', '0', NULL),
('003', '298', '0', NULL),
('003', '299', '0', NULL),
('003', '300', '0', NULL),
('003', '301', '0', NULL),
('003', '302', '0', NULL),
('003', '303', '0', NULL),
('003', '304', '0', NULL),
('003', '305', '0', NULL),
('003', '306', '0', NULL),
('003', '307', '0', NULL),
('003', '308', '0', NULL),
('003', '309', '0', NULL),
('003', '310', '0', NULL),
('003', '311', '0', NULL),
('003', '312', '0', NULL),
('003', '313', '0', NULL),
('003', '314', '0', NULL),
('003', '315', '0', NULL),
('003', '316', '0', NULL),
('003', '317', '0', NULL),
('003', '318', '0', NULL),
('003', '319', '0', NULL),
('003', '320', '0', NULL),
('003', '321', '0', NULL),
('003', '322', '0', NULL),
('003', '323', '0', NULL),
('003', '324', '0', NULL),
('003', '325', '0', NULL),
('003', '326', '0', NULL),
('003', '327', '0', NULL),
('003', '328', '0', NULL),
('003', '329', '0', NULL),
('003', '330', '0', NULL),
('003', '331', '0', NULL),
('003', '333', '0', NULL),
('003', '334', '0', NULL),
('003', '335', '0', NULL),
('003', '336', '0', NULL),
('003', '337', '0', NULL),
('003', '338', '0', NULL),
('003', '339', '0', NULL),
('003', '340', '0', NULL),
('003', '341', '0', NULL),
('003', '342', '0', NULL),
('003', '343', '0', NULL),
('003', '344', '0', NULL),
('003', '345', '0', NULL),
('003', '346', '0', NULL),
('003', '347', '0', NULL),
('003', '348', '0', NULL),
('003', '349', '0', NULL),
('003', '350', '0', NULL),
('003', '351', '0', NULL),
('003', '352', '0', NULL),
('003', '353', '0', NULL),
('003', '354', '0', NULL),
('003', '355', '0', NULL),
('003', '356', '0', NULL),
('003', '357', '0', NULL),
('003', '358', '0', NULL),
('003', '359', '0', NULL),
('003', '360', '0', NULL),
('003', '362', '0', NULL),
('003', '363', '0', NULL),
('003', '364', '0', NULL),
('003', '365', '0', NULL),
('003', '366', '0', NULL),
('003', '367', '0', NULL),
('003', '368', '0', NULL),
('003', '369', '0', NULL),
('003', '370', '0', NULL),
('003', '371', '0', NULL),
('003', '372', '0', NULL),
('003', '373', '0', NULL),
('003', '374', '0', NULL),
('003', '375', '0', NULL),
('003', '376', '0', NULL),
('003', '377', '0', NULL),
('003', '378', '0', NULL),
('003', '379', '0', NULL),
('003', '380', '0', NULL),
('003', '381', '0', NULL),
('003', '382', '0', NULL),
('003', '383', '0', NULL),
('003', '384', '0', NULL),
('003', '385', '0', NULL),
('003', '386', '0', NULL),
('003', '387', '0', NULL),
('003', '388', '0', NULL),
('003', '389', '0', NULL),
('003', '390', '0', NULL),
('003', '391', '0', NULL),
('003', '392', '0', NULL),
('003', '393', '0', NULL),
('003', '394', '0', NULL),
('003', '395', '0', NULL),
('003', '396', '0', NULL),
('003', '397', '0', NULL),
('003', '398', '0', NULL),
('003', '399', '0', NULL),
('003', '401', '0', NULL),
('003', '402', '0', NULL),
('003', '403', '0', NULL),
('003', '404', '0', NULL),
('003', '405', '0', NULL),
('003', '406', '0', NULL),
('003', '407', '0', NULL),
('003', '408', '0', NULL),
('003', '409', '0', NULL),
('003', '410', '0', NULL),
('003', '411', '0', NULL),
('003', '412', '0', NULL),
('003', '413', '0', NULL),
('003', '414', '0', NULL),
('003', '415', '0', NULL),
('003', '416', '0', NULL),
('003', '417', '0', NULL),
('003', '418', '0', NULL),
('003', '451', '0', NULL),
('003', '452', '0', NULL),
('003', '453', '0', NULL),
('003', '454', '0', NULL),
('003', '455', '0', NULL),
('003', '456', '0', NULL),
('003', '457', '0', NULL),
('003', '458', '0', NULL),
('003', '459', '0', NULL),
('003', '460', '0', NULL),
('003', '461', '0', NULL),
('003', '462', '0', NULL),
('003', '463', '0', NULL),
('003', '464', '0', NULL),
('003', '501', '0', NULL),
('003', '502', '0', NULL),
('003', '503', '0', NULL),
('003', '504', '0', NULL),
('003', '505', '0', NULL),
('003', '506', '0', NULL),
('003', '507', '0', NULL),
('003', '508', '0', NULL),
('003', '509', '0', NULL),
('003', '510', '0', NULL),
('003', '511', '0', NULL),
('003', '512', '0', NULL),
('003', '513', '0', NULL),
('003', '514', '0', NULL),
('003', '515', '0', NULL),
('003', '516', '0', NULL),
('003', '517', '0', NULL),
('003', '518', '0', NULL),
('003', '519', '0', NULL),
('003', '520', '0', NULL),
('003', '521', '0', NULL),
('003', '522', '0', NULL),
('003', '523', '0', NULL),
('003', '524', '0', NULL),
('003', '525', '0', NULL),
('003', '526', '0', NULL),
('003', '527', '0', NULL),
('003', '528', '0', NULL),
('003', '529', '0', NULL),
('003', '530', '0', NULL),
('003', '531', '0', NULL),
('003', '532', '0', NULL),
('003', '533', '0', NULL),
('003', '534', '0', NULL),
('003', '536', '0', NULL),
('003', '537', '0', NULL),
('003', '538', '0', NULL),
('003', '539', '0', NULL),
('003', '540', '20', NULL),
('003', '541', '0', NULL),
('003', '542', '0', NULL),
('003', '543', '0', NULL),
('003', '601', '0', NULL),
('003', '602', '0', NULL),
('003', '603', '0', NULL),
('003', '604', '0', NULL),
('003', '605', '0', NULL),
('003', '606', '0', NULL),
('003', '607', '0', NULL),
('003', '608', '0', NULL),
('003', '609', '0', NULL),
('003', '610', '0', NULL),
('003', '611', '0', NULL),
('003', '612', '0', NULL),
('003', '613', '0', NULL),
('003', '614', '0', NULL),
('003', '615', '0', NULL),
('003', '616', '0', NULL),
('003', '617', '0', NULL),
('003', '701', '0', NULL),
('003', '702', '0', NULL),
('003', '703', '0', NULL),
('003', '704', '0', NULL),
('003', '705', '0', NULL),
('003', '706', '0', NULL),
('003', '707', '0', NULL),
('003', '708', '0', NULL),
('003', '709', '0', NULL),
('003', '730', '0', NULL),
('003', '731', '0', NULL),
('003', '732', '0', NULL),
('003', '733', '0', NULL),
('003', '734', '0', NULL),
('003', '735', '0', NULL),
('003', '736', '0', NULL),
('003', '737', '0', NULL),
('003', '738', '0', NULL),
('003', '739', '0', NULL),
('003', '740', '0', NULL),
('003', '741', '0', NULL),
('003', '742', '0', NULL),
('003', '743', '0', NULL),
('003', '744', '0', NULL),
('003', '745', '0', NULL),
('003', '746', '0', NULL),
('003', '747', '0', NULL),
('003', '748', '0', NULL),
('003', '749', '0', NULL),
('003', '750', '0', NULL),
('003', '751', '0', NULL),
('003', '752', '0', NULL),
('003', '753', '0', NULL),
('003', '754', '0', NULL),
('003', '755', '0', NULL),
('003', '756', '0', NULL),
('003', '757', '0', NULL),
('003', '758', '0', NULL),
('003', '759', '0', NULL),
('003', '760', '0', NULL),
('003', '801', '0', NULL),
('003', '802', '0', NULL),
('003', '803', '0', NULL),
('003', '804', '0', NULL),
('003', '805', '0', NULL),
('003', '806', '0', NULL),
('003', '807', '0', NULL),
('003', '808', '0', NULL),
('003', '809', '0', NULL),
('003', '810', '0', NULL),
('003', '814', '0', NULL),
('003', '815', '0', NULL),
('003', '816', '0', NULL),
('003', '817', '0', NULL),
('003', '818', '0', NULL),
('003', '819', '0', NULL),
('003', '820', '0', NULL),
('003', '821', '0', NULL),
('003', '822', '0', NULL),
('003', '823', '0', NULL),
('003', '901', '0', NULL),
('DEF', '001', '20', NULL),
('DEF', '002', '0', NULL),
('DEF', '003', '0', NULL),
('DEF', '004', '0', NULL),
('DEF', '101', '0', NULL),
('DEF', '102', '0', NULL),
('DEF', '103', '0', NULL),
('DEF', '104', '0', NULL),
('DEF', '105', '0', NULL),
('DEF', '106', '0', NULL),
('DEF', '107', '0', NULL),
('DEF', '109', '0', NULL),
('DEF', '151', '0', NULL),
('DEF', '152', '0', NULL),
('DEF', '153', '0', NULL),
('DEF', '154', '0', NULL),
('DEF', '201', '0', NULL),
('DEF', '202', '0', NULL),
('DEF', '203', '0', NULL),
('DEF', '204', '0', NULL),
('DEF', '205', '0', NULL),
('DEF', '206', '0', NULL),
('DEF', '207', '0', NULL),
('DEF', '230', '0', NULL),
('DEF', '231', '0', NULL),
('DEF', '232', '0', NULL),
('DEF', '233', '0', NULL),
('DEF', '234', '0', NULL),
('DEF', '235', '0', NULL),
('DEF', '236', '0', NULL),
('DEF', '237', '0', NULL),
('DEF', '238', '0', NULL),
('DEF', '239', '0', NULL),
('DEF', '240', '0', NULL),
('DEF', '241', '0', NULL),
('DEF', '242', '0', NULL),
('DEF', '243', '0', NULL),
('DEF', '244', '0', NULL),
('DEF', '245', '0', NULL),
('DEF', '246', '0', NULL),
('DEF', '247', '0', NULL),
('DEF', '248', '0', NULL),
('DEF', '249', '0', NULL),
('DEF', '250', '0', NULL),
('DEF', '251', '0', NULL),
('DEF', '252', '0', NULL),
('DEF', '253', '0', NULL),
('DEF', '254', '0', NULL),
('DEF', '255', '0', NULL),
('DEF', '256', '0', NULL),
('DEF', '257', '0', NULL),
('DEF', '258', '0', NULL),
('DEF', '259', '0', NULL),
('DEF', '260', '0', NULL),
('DEF', '261', '0', NULL),
('DEF', '262', '0', NULL),
('DEF', '263', '0', NULL),
('DEF', '264', '0', NULL),
('DEF', '265', '0', NULL),
('DEF', '266', '0', NULL),
('DEF', '267', '0', NULL),
('DEF', '268', '0', NULL),
('DEF', '269', '0', NULL),
('DEF', '270', '0', NULL),
('DEF', '271', '0', NULL),
('DEF', '272', '0', NULL),
('DEF', '273', '0', NULL),
('DEF', '274', '0', NULL),
('DEF', '275', '0', NULL),
('DEF', '276', '0', NULL),
('DEF', '277', '0', NULL),
('DEF', '278', '0', NULL),
('DEF', '279', '0', NULL),
('DEF', '280', '0', NULL),
('DEF', '281', '0', NULL),
('DEF', '282', '0', NULL),
('DEF', '283', '0', NULL),
('DEF', '284', '0', NULL),
('DEF', '285', '0', NULL),
('DEF', '286', '0', NULL),
('DEF', '287', '0', NULL),
('DEF', '288', '0', NULL),
('DEF', '289', '0', NULL),
('DEF', '290', '0', NULL),
('DEF', '291', '0', NULL),
('DEF', '292', '0', NULL),
('DEF', '293', '0', NULL),
('DEF', '294', '0', NULL),
('DEF', '295', '0', NULL),
('DEF', '296', '0', NULL),
('DEF', '297', '0', NULL),
('DEF', '298', '0', NULL),
('DEF', '299', '0', NULL),
('DEF', '300', '0', NULL),
('DEF', '301', '15', NULL),
('DEF', '302', '2', NULL),
('DEF', '303', '0', NULL),
('DEF', '304', '0', NULL),
('DEF', '305', '0', NULL),
('DEF', '306', '0', NULL),
('DEF', '307', '0', NULL),
('DEF', '308', '0', NULL),
('DEF', '309', '0', NULL),
('DEF', '310', '0', NULL),
('DEF', '311', '0', NULL),
('DEF', '312', '0', NULL),
('DEF', '313', '0', NULL),
('DEF', '314', '0', NULL),
('DEF', '315', '0', NULL),
('DEF', '316', '0', NULL),
('DEF', '317', '0', NULL),
('DEF', '318', '0', NULL),
('DEF', '319', '0', NULL),
('DEF', '320', '0', NULL),
('DEF', '321', '0', NULL),
('DEF', '322', '0', NULL),
('DEF', '323', '0', NULL),
('DEF', '324', '0', NULL),
('DEF', '325', '0', NULL),
('DEF', '326', '0', NULL),
('DEF', '327', '0', NULL),
('DEF', '328', '0', NULL),
('DEF', '329', '0', NULL),
('DEF', '330', '0', NULL),
('DEF', '331', '0', NULL),
('DEF', '333', '0', NULL),
('DEF', '334', '0', NULL),
('DEF', '335', '0', NULL),
('DEF', '336', '0', NULL),
('DEF', '337', '0', NULL),
('DEF', '338', '0', NULL),
('DEF', '339', '0', NULL),
('DEF', '340', '0', NULL),
('DEF', '341', '0', NULL),
('DEF', '342', '0', NULL),
('DEF', '343', '0', NULL),
('DEF', '344', '0', NULL),
('DEF', '345', '0', NULL),
('DEF', '346', '0', NULL),
('DEF', '347', '0', NULL),
('DEF', '348', '0', NULL),
('DEF', '349', '0', NULL),
('DEF', '350', '0', NULL),
('DEF', '351', '0', NULL),
('DEF', '352', '0', NULL),
('DEF', '353', '0', NULL),
('DEF', '354', '0', NULL),
('DEF', '355', '0', NULL),
('DEF', '356', '0', NULL),
('DEF', '357', '0', NULL),
('DEF', '358', '0', NULL),
('DEF', '359', '0', NULL),
('DEF', '360', '0', NULL),
('DEF', '362', '0', NULL),
('DEF', '363', '0', NULL),
('DEF', '364', '0', NULL),
('DEF', '365', '0', NULL),
('DEF', '366', '0', NULL),
('DEF', '367', '0', NULL),
('DEF', '368', '0', NULL),
('DEF', '369', '0', NULL),
('DEF', '370', '0', NULL),
('DEF', '371', '0', NULL),
('DEF', '372', '0', NULL),
('DEF', '373', '0', NULL),
('DEF', '374', '0', NULL),
('DEF', '375', '0', NULL),
('DEF', '376', '0', NULL),
('DEF', '377', '0', NULL),
('DEF', '378', '0', NULL),
('DEF', '379', '0', NULL),
('DEF', '380', '0', NULL),
('DEF', '381', '0', NULL),
('DEF', '382', '0', NULL),
('DEF', '383', '0', NULL),
('DEF', '384', '0', NULL),
('DEF', '385', '0', NULL),
('DEF', '386', '0', NULL),
('DEF', '387', '0', NULL),
('DEF', '388', '0', NULL),
('DEF', '389', '0', NULL),
('DEF', '390', '0', NULL),
('DEF', '391', '0', NULL),
('DEF', '392', '0', NULL),
('DEF', '393', '0', NULL),
('DEF', '394', '0', NULL),
('DEF', '395', '0', NULL),
('DEF', '396', '0', NULL),
('DEF', '397', '0', NULL),
('DEF', '398', '0', NULL),
('DEF', '399', '0', NULL),
('DEF', '401', '0', NULL),
('DEF', '402', '0', NULL),
('DEF', '403', '0', NULL),
('DEF', '404', '0', NULL),
('DEF', '405', '0', NULL),
('DEF', '406', '0', NULL),
('DEF', '407', '0', NULL),
('DEF', '408', '0', NULL),
('DEF', '409', '0', NULL),
('DEF', '410', '0', NULL),
('DEF', '411', '0', NULL),
('DEF', '412', '0', NULL),
('DEF', '413', '0', NULL),
('DEF', '414', '0', NULL),
('DEF', '415', '0', NULL),
('DEF', '416', '0', NULL),
('DEF', '417', '0', NULL),
('DEF', '418', '0', NULL),
('DEF', '451', '0', NULL),
('DEF', '452', '0', NULL),
('DEF', '453', '0', NULL),
('DEF', '454', '0', NULL),
('DEF', '455', '0', NULL),
('DEF', '456', '0', NULL),
('DEF', '457', '0', NULL),
('DEF', '458', '0', NULL),
('DEF', '459', '0', NULL),
('DEF', '460', '0', NULL),
('DEF', '461', '0', NULL),
('DEF', '462', '0', NULL),
('DEF', '463', '0', NULL),
('DEF', '464', '0', NULL),
('DEF', '501', '0', NULL),
('DEF', '502', '0', NULL),
('DEF', '503', '0', NULL),
('DEF', '504', '0', NULL),
('DEF', '505', '0', NULL),
('DEF', '506', '0', NULL),
('DEF', '507', '0', NULL),
('DEF', '508', '0', NULL),
('DEF', '509', '0', NULL),
('DEF', '510', '0', NULL),
('DEF', '511', '0', NULL),
('DEF', '512', '0', NULL),
('DEF', '513', '0', NULL),
('DEF', '514', '0', NULL),
('DEF', '515', '0', NULL),
('DEF', '516', '0', NULL),
('DEF', '517', '0', NULL),
('DEF', '518', '0', NULL),
('DEF', '519', '0', NULL),
('DEF', '520', '0', NULL),
('DEF', '521', '0', NULL),
('DEF', '522', '0', NULL),
('DEF', '523', '0', NULL),
('DEF', '524', '0', NULL),
('DEF', '525', '0', NULL),
('DEF', '526', '0', NULL),
('DEF', '527', '0', NULL),
('DEF', '528', '0', NULL),
('DEF', '529', '0', NULL),
('DEF', '530', '0', NULL),
('DEF', '531', '0', NULL),
('DEF', '532', '0', NULL),
('DEF', '533', '0', NULL),
('DEF', '534', '0', NULL),
('DEF', '536', '0', NULL),
('DEF', '537', '0', NULL),
('DEF', '538', '0', NULL),
('DEF', '539', '0', NULL),
('DEF', '540', '20', NULL),
('DEF', '541', '0', NULL),
('DEF', '542', '0', NULL),
('DEF', '543', '0', NULL),
('DEF', '601', '0', NULL),
('DEF', '602', '0', NULL),
('DEF', '603', '0', NULL),
('DEF', '604', '0', NULL),
('DEF', '605', '0', NULL),
('DEF', '606', '0', NULL),
('DEF', '607', '0', NULL),
('DEF', '608', '0', NULL),
('DEF', '609', '0', NULL),
('DEF', '610', '0', NULL),
('DEF', '611', '0', NULL),
('DEF', '612', '0', NULL),
('DEF', '613', '0', NULL),
('DEF', '614', '0', NULL),
('DEF', '615', '0', NULL),
('DEF', '616', '0', NULL),
('DEF', '617', '0', NULL),
('DEF', '701', '0', NULL),
('DEF', '702', '0', NULL),
('DEF', '703', '0', NULL),
('DEF', '704', '0', NULL),
('DEF', '705', '0', NULL),
('DEF', '706', '0', NULL),
('DEF', '707', '0', NULL),
('DEF', '708', '0', NULL),
('DEF', '709', '0', NULL),
('DEF', '730', '0', NULL),
('DEF', '731', '0', NULL),
('DEF', '732', '0', NULL),
('DEF', '733', '0', NULL),
('DEF', '734', '0', NULL),
('DEF', '735', '0', NULL),
('DEF', '736', '0', NULL),
('DEF', '737', '0', NULL),
('DEF', '738', '0', NULL),
('DEF', '739', '0', NULL),
('DEF', '740', '0', NULL),
('DEF', '741', '0', NULL),
('DEF', '742', '0', NULL),
('DEF', '743', '0', NULL),
('DEF', '744', '0', NULL),
('DEF', '745', '0', NULL),
('DEF', '746', '0', NULL),
('DEF', '747', '0', NULL),
('DEF', '748', '0', NULL),
('DEF', '749', '0', NULL),
('DEF', '750', '0', NULL),
('DEF', '751', '0', NULL),
('DEF', '752', '0', NULL),
('DEF', '753', '0', NULL),
('DEF', '754', '0', NULL),
('DEF', '755', '0', NULL),
('DEF', '756', '0', NULL),
('DEF', '757', '0', NULL),
('DEF', '758', '0', NULL),
('DEF', '759', '0', NULL),
('DEF', '760', '0', NULL),
('DEF', '801', '0', NULL),
('DEF', '802', '0', NULL),
('DEF', '803', '0', NULL),
('DEF', '804', '0', NULL),
('DEF', '805', '0', NULL),
('DEF', '806', '0', NULL),
('DEF', '807', '0', NULL),
('DEF', '808', '0', NULL),
('DEF', '809', '0', NULL),
('DEF', '810', '0', NULL),
('DEF', '814', '0', NULL),
('DEF', '815', '0', NULL),
('DEF', '816', '0', NULL),
('DEF', '817', '0', NULL),
('DEF', '818', '0', NULL),
('DEF', '819', '0', NULL),
('DEF', '820', '0', NULL),
('DEF', '821', '0', NULL),
('DEF', '822', '0', NULL),
('DEF', '823', '0', NULL),
('DEF', '901', '0', NULL);

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
('001', 'STORE BASEMENT ALI TRADE CENTER', '', '', '', '', '', 'SADAQAT ', '0', '0'),
('002', 'STORE GOPAL NAGAR FACTORY ', '', '', '', '', '', '', '0', '0'),
('003', 'STORE BIOTECH FACTORY ', '', '', '', '', '', '', '0', '0'),
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

INSERT INTO `0_purch_data` VALUES
('10', '001', '100', '', '1', 'BEEF TENDERLOIN WITHOUT HEAD'),
('12', '004', '1050', '', '1', 'Beef Waste left from Cleaning'),
('12', '101', '420', '', '1', 'Chicken Fillet 110 to 120 grams K&amp;Ns'),
('12', '102', '350', '', '1', 'Chicken Thai Boneless (locale)'),
('12', '103', '400', '', '1', 'Chicken Thai Boneless K&amp;Ns'),
('12', '104', '290', '', '1', 'Chicken Nablets Wings K&amp;Ns'),
('12', '106', '360', '', '1', 'Chicken Brest Locale'),
('12', '107', '50', '', '1', 'Chicken 9Cut with Skin'),
('12', '109', '90', '', '1', 'Chicken Bone Local'),
('12', '151', '1100', '', '1', 'SHRIMPS WHITE BAG 2KG'),
('12', '152', '1200', '', '1', 'SHRIMPS 16/20'),
('12', '153', '1300', '', '1', 'SHRIMPS 21/25'),
('12', '154', '1000', '', '1', 'SHRIMPS GLOBAL'),
('12', '201', '290', '', '1', 'Fresh Cream'),
('12', '203', '140', '', '1', 'PREEMA MILK'),
('12', '204', '130', '', '1', 'MILK PACK MILK 1 LTTER'),
('12', '205', '460', '', '1', 'YELLOW BUTTER FRESH'),
('12', '206', '500', '', '1', 'WHITE BUTTER'),
('12', '207', '500', '', '1', 'HICO VANILA ICE CREAM 2 LITTER'),
('12', '302', '2400', '', '1', 'Mamasitta Suace 4kg'),
('12', '303', '170', '', '1', 'Rice Zarafa 2Year Old'),
('12', '304', '300', '', '1', 'crackers'),
('12', '305', '300', '', '1', 'crispy TamBora'),
('12', '306', '500', '', '1', 'fittaccine pasta'),
('12', '307', '300', '', '1', 'Macarino Elbow Big'),
('12', '308', '260', '', '1', 'Bread crambs'),
('12', '309', '300', '', '1', 'panne Rigate'),
('12', '311', '500', '', '1', 'tarragon'),
('12', '312', '500', '', '1', 'Driey Basile'),
('12', '313', '500', '', '1', 'thyme'),
('12', '314', '22', '', '1', 'salt'),
('12', '316', '50', '', '1', 'paprika powder'),
('12', '319', '250', '', '1', 'TaBasco'),
('12', '320', '150', '', '1', 'coconut careem powder'),
('12', '321', '800', '', '1', 'chicken soup cube'),
('12', '322', '800', '', '1', 'Dami glass Bass'),
('12', '325', '600', '', '1', 'giree Brada'),
('12', '326', '50', '', '1', 'Tikka Masala'),
('12', '327', '1500', '', '1', 'Black pepper'),
('12', '328', '500', '', '1', 'WHITE CHEESE THREE COW 1/2 KG BLOCK'),
('12', '329', '350', '', '1', 'CHICKEN SAUSAGES'),
('12', '330', '1800', '', '1', 'LEAPED MIRROR GLASS (CAKE)'),
('12', '331', '8000', '', '1', 'MANGO PUREE MONTIBINACO 4KG'),
('12', '333', '8500', '', '1', 'STRAWBERRY PUREE MONTIBINACO 4KG'),
('12', '334', '400', '', '1', 'SOYA SAUCE DARK 2 LITER (LEE KUM KI )'),
('12', '335', '400', '', '1', 'SOYA SAUCE LIGHT 2 LITER (LEE KUM KI )'),
('12', '336', '450', '', '1', 'SWEET VINEGAR'),
('12', '337', '500', '', '1', 'TAPAL DANEDAR TEA 1/2 KG'),
('12', '338', '300', '', '1', 'LIPTON GREEN TEA MINT 25PCS'),
('12', '339', '450', '', '1', 'LIPTON GREEN TEA SENCHA 30PCS'),
('12', '340', '300', '', '1', 'LIPTON GREEN TEA ROSEHIP 25PCS'),
('12', '341', '450', '', '1', 'LIPTON GREEN TEA CAMOMILE 30PCS'),
('12', '342', '300', '', '1', 'LIPTON GREEN TEA PURE BLACK 25 PCS'),
('12', '343', '300', '', '1', 'LIPTON GREEN TEA LEMON 25 PCS'),
('12', '344', '500', '', '1', 'LIPTON YELLOW LABEL SACHET 100 PCS PACK'),
('12', '345', '100', '', '1', 'LIPTON ICED TEA SACHET'),
('12', '347', '1500', '', '1', 'RIPPY TOPPING CARAMEL'),
('12', '348', '1500', '', '1', 'RIPPY TOPPING MANGOO'),
('12', '349', '1500', '', '1', 'RIPPY TOPPING CHOCOLATE'),
('12', '350', '800', '', '1', 'FRENCH FRIES Mccain 2.5kg'),
('12', '351', '2000', '', '1', 'MOZERELLA CHEESE ADAMS 2KG BLOCK'),
('12', '352', '800', '', '1', 'MILK CHOCOLATE 1 KG PACK COLLATA'),
('12', '353', '800', '', '1', 'WHITE CHOCOLATE 1 KG PACK COLLATA'),
('12', '354', '3500', '', '1', 'LAVAZZA ESSPRESSO COFFEE 1 KG'),
('12', '355', '200', '', '1', 'BAMBOO SHOOT TIN'),
('12', '356', '200', '', '1', 'SWEET CORN TIN'),
('12', '357', '200', '', '1', 'BABY CORN'),
('12', '358', '200', '', '1', 'BAMBOO SHOOT HALVES TIN'),
('12', '359', '200', '', '1', 'AIRWIK FRESHENER 175GM'),
('12', '360', '1000', '', '1', 'AIRWIK DIFFUSER  MACHINE'),
('12', '362', '800', '', '1', 'MELAPINE PINEAPPLE SLICE 3KG'),
('12', '363', '400', '', '1', 'DELMONT PINEAPPLE JUICE 1.36 LITER'),
('12', '364', '200', '', '1', 'POLAC MILK 390 GRAMS'),
('12', '365', '200', '', '1', 'YELLOW CLING PEACH HALVES IN SYRUP 820GMS'),
('12', '366', '250', '', '1', 'LYCHEE READY TO EAT 365 GM'),
('12', '367', '250', '', '1', 'COCONUT MILK 400GMS'),
('12', '368', '350', '', '1', 'RED CHERRY SYRUP 240GMS'),
('12', '403', '150', '', '1', 'Cabbage'),
('12', '404', '150', '', '1', 'Green Onion'),
('12', '410', '1000', '', '1', 'Yellow Capsicum'),
('12', '412', '1000', '', '1', 'Red Capsicum'),
('12', '413', '290', '', '1', 'garlic'),
('12', '416', '250', '', '1', 'Birds chilli'),
('12', '417', '150', '', '1', 'ginger'),
('12', '502', '400', '', '1', 'SQ DESSERT PLATE 21CM'),
('12', '503', '750', '', '1', 'SQ DINNER PLATE 27CM'),
('12', '504', '800', '', '1', 'RECT SERVING PLATE 33CM'),
('12', '505', '650', '', '1', 'RECT SERVING BOWL 22.5CM'),
('12', '506', '650', '', '1', 'SQ Soup PLATE 20.5CM'),
('12', '507', '500', '', '1', 'BUTTER DISH WITH COVER'),
('12', '509', '300', '', '1', 'SQ SOUP BOWL 14CM'),
('12', '515', '200', '', '1', 'NAPKIN RINGS'),
('12', '516', '80', '', '1', 'TABLE NAPKIN'),
('12', '517', '325', '', '1', 'SOUP BOWL CHINA'),
('12', '518', '100', '', '1', 'SOUP SAUCER CHINA'),
('12', '528', '1100', '', '1', 'GLASS 350ML JUICE LONG'),
('12', '529', '850', '', '1', 'GLASS 300ML WATER (WINE)'),
('12', '530', '50', '', '1', 'GLASS 50ML MINI'),
('12', '531', '1100', '', '1', 'PLATE VERSECE LOGO'),
('12', '532', '50', '', '1', 'SOUP CONTINENTS BOWL'),
('12', '533', '100', '', '1', 'SOUP CONTINENTS TRAY'),
('12', '534', '0', '', '1', 'COFFEE MUG PORCILEN'),
('12', '536', '6', '', '1', 'COFFEE CUP DISPOSABLE'),
('12', '537', '2', '', '1', 'COFFEE CUP DISPOSABLE LID'),
('12', '538', '9', '', '1', 'ICE CREAM BOWL DISPOSABLE'),
('12', '540', '10000', '', '1', 'CHAIR AQUARIUM'),
('12', '541', '35000', '', '1', 'CHAIR VELVET'),
('12', '542', '13000', '', '1', 'STOOL GOLDEN BLACK'),
('12', '543', '1200', '', '1', 'GLASS JUG FOR ICE TEA'),
('12', '606', '500', '', '1', 'SURGICAL GLOVES'),
('12', '702', '14', '', '1', 'PACKING BAG PRINTED (KHAKHI)'),
('12', '705', '40', '', '1', 'TISSUE BOX ANTIQUE'),
('12', '707', '1200', '', '1', 'STEAK TORCH'),
('12', '708', '1200', '', '1', 'DIGITAL SCREEN FOR MENU'),
('12', '741', '1800', '', '1', 'FABRI MIXY CAFE - CARAMEL'),
('12', '742', '1800', '', '1', 'FABRI MIXY CAFE - CINNAMON'),
('12', '744', '1800', '', '1', 'FABRI MIXY CAFE - HAZELNUT'),
('12', '745', '1800', '', '1', 'FABRI MIXY CAFE - IRISH CREAM'),
('12', '746', '1800', '', '1', 'FABRI MIXY CAFE - VANILLA'),
('12', '747', '1800', '', '1', 'FABRI MIXY BAR - COCONUT'),
('12', '748', '1800', '', '1', 'FABRI MIXY BAR - KIWI'),
('12', '749', '1800', '', '1', 'FABRI MIXY BAR - LEMON'),
('12', '750', '1800', '', '1', 'FABRI MIXY BAR - MANGO'),
('12', '751', '1800', '', '1', 'FABRI MIXY BAR - ORANGE'),
('12', '752', '1800', '', '1', 'FABRI MIXY BAR - PEACH'),
('12', '753', '1800', '', '1', 'FABRI MIXY BAR - PINEAPPLE'),
('12', '754', '1800', '', '1', 'FABRI MIXY BAR - POMEGRANATE'),
('12', '755', '1800', '', '1', 'FABRI MIXY BAR - RASPBERRY'),
('12', '756', '1800', '', '1', 'FABRI MIXY BAR - ROSE'),
('12', '757', '1800', '', '1', 'FABRI MIXY BAR - STRAWBERRY'),
('12', '802', '47', '', '1', 'DIET 7UP 300ML CAN'),
('12', '803', '47', '', '1', '7up 300ml can'),
('12', '807', '80', '', '1', 'sprite 1.5liter'),
('12', '808', '80', '', '1', '7up 1.5liter'),
('12', '814', '47', '', '1', 'pappsi 300ml can'),
('12', '817', '160', '', '1', 'nestle mango juice 1liter'),
('12', '818', '140', '', '1', 'nestle apple juice 1liter'),
('12', '819', '180', '', '1', 'nestle red grape 1liter'),
('12', '821', '140', '', '1', 'nestle pineapple juice 1liter'),
('12', '822', '30', '', '1', 'AQUA FINA WATER 500ML');

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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_order_details` ###

INSERT INTO `0_purch_order_details` VALUES
('3', '2', '151', 'SHRIMPS WHITE BAG 2KG ', '2017-09-22', '2', '1100', '1100', '1100', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('4', '2', '152', 'SHRIMPS 16/20 ', '2017-09-22', '8', '1200', '1200', '1200', '8', '8', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('5', '2', '109', 'Chicken Bone Local', '2017-09-22', '8', '90', '90', '90', '8', '8', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('6', '2', '106', 'Chicken Brest Locale ', '2017-09-22', '4', '360', '360', '360', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('7', '2', '103', 'Chicken Thai Boneless K&amp;Ns', '2017-09-22', '4.3', '400', '400', '400', '4.3', '4.3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('8', '2', '101', 'Chicken Fillet 110 to 120 grams K&amp;Ns', '2017-09-22', '50', '420', '420', '420', '50', '50', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('9', '2', '104', 'Chicken Nablets Wings K&amp;Ns', '2017-09-22', '10', '290', '290', '290', '10', '10', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('10', '2', '107', 'Chicken 9Cut with Skin', '2017-09-22', '72', '50', '50', '50', '72', '72', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('11', '2', '530', 'GLASS 50ML MINI ', '2017-09-22', '60', '50', '50', '50', '60', '60', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('12', '2', '532', 'SOUP CONTINENTS BOWL  ', '2017-09-22', '30', '50', '50', '50', '30', '30', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('13', '2', '533', 'SOUP CONTINENTS TRAY', '2017-09-22', '6', '100', '100', '100', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('14', '2', '154', 'SHRIMPS GLOBAL ', '2017-09-22', '6', '1000', '1000', '1000', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('15', '2', '153', 'SHRIMPS 21/25', '2017-09-22', '7', '1300', '1300', '1300', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('16', '2', '102', 'Chicken Thai Boneless (locale)', '2017-09-22', '3', '350', '350', '350', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('17', '2', '004', 'Beef Waste left from Cleaning ', '2017-09-22', '7', '1050', '1050', '1050', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('18', '2', '803', '7up 300ml can', '2017-09-22', '36', '47', '47', '47', '36', '36', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('19', '2', '814', 'pappsi 300ml can', '2017-09-22', '12', '47', '47', '47', '12', '12', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('20', '2', '808', '7up 1.5liter', '2017-09-22', '12', '80', '80', '80', '12', '12', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('21', '2', '807', 'sprite 1.5liter', '2017-09-22', '6', '80', '80', '80', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('22', '2', '516', 'TABLE NAPKIN ', '2017-09-22', '265', '80', '80', '80', '265', '265', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('23', '2', '515', 'NAPKIN RINGS ', '2017-09-22', '98', '200', '200', '200', '98', '98', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('24', '2', '702', 'PACKING BAG PRINTED (KHAKHI)', '2017-09-22', '544', '14', '14', '14', '544', '544', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('25', '2', '821', 'nestle pineapple juice 1liter', '2017-09-22', '5', '140', '140', '140', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('26', '2', '818', 'nestle apple juice 1liter', '2017-09-22', '5', '140', '140', '140', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('27', '2', '819', 'nestle red grape 1liter', '2017-09-22', '6', '180', '180', '180', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('28', '2', '817', 'nestle mango juice 1liter', '2017-09-22', '4', '160', '160', '160', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('29', '2', '204', 'MILK PACK MILK 1 LTTER ', '2017-09-22', '3', '130', '130', '130', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('30', '2', '316', 'paprika powder', '2017-09-22', '4', '50', '50', '50', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('31', '2', '320', 'coconut careem powder', '2017-09-22', '4', '150', '150', '150', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('32', '2', '705', 'TISSUE BOX ANTIQUE ', '2017-09-22', '50', '40', '40', '40', '50', '50', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('33', '2', '537', 'COFFEE CUP DISPOSABLE LID', '2017-09-22', '100', '1', '1', '1', '100', '100', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('34', '2', '536', 'COFFEE CUP DISPOSABLE ', '2017-09-22', '80', '6', '6', '6', '80', '80', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('35', '2', '327', 'Black pepper', '2017-09-22', '7.75', '1500', '1500', '1500', '7.75', '7.75', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('36', '2', '822', 'AQUA FINA WATER 500ML ', '2017-09-22', '109', '30', '30', '30', '109', '109', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('37', '2', '203', 'PREEMA MILK ', '2017-09-22', '4', '140', '140', '140', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('38', '2', '416', 'Birds chilli', '2017-09-22', '4', '250', '250', '250', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('39', '2', '201', 'Fresh Cream ', '2017-09-22', '12', '290', '290', '290', '12', '12', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('40', '2', '403', 'Cabbage', '2017-09-22', '4.28', '150', '150', '150', '4.28', '4.28', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('41', '2', '413', 'garlic', '2017-09-22', '6', '290', '290', '290', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('42', '2', '410', 'Yellow Capsicum', '2017-09-22', '0.9', '1000', '1000', '1000', '0.9', '0.9', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('43', '2', '404', 'Green Onion', '2017-09-22', '3.2', '150', '150', '150', '3.2', '3.2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('44', '2', '417', 'ginger', '2017-09-22', '1.5', '150', '150', '150', '1.5', '1.5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('45', '2', '412', 'Red Capsicum', '2017-09-22', '1.35', '1000', '1000', '1000', '1.35', '1.35', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('46', '2', '303', 'Rice Zarafa 2Year Old', '2017-09-22', '6.4', '170', '170', '170', '6.4', '6.4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('47', '2', '314', 'salt ', '2017-09-22', '18', '22', '22', '22', '18', '18', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('48', '2', '312', 'Driey Basile', '2017-09-22', '1', '500', '500', '500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('49', '2', '313', 'thyme', '2017-09-22', '1', '500', '500', '500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('50', '2', '311', 'tarragon', '2017-09-22', '1', '500', '500', '500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('51', '2', '304', 'crackers', '2017-09-22', '3', '300', '300', '300', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('52', '2', '319', 'TaBasco', '2017-09-22', '12', '250', '250', '250', '12', '12', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('53', '2', '307', 'Macarino Elbow Big', '2017-09-22', '5', '300', '300', '300', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('54', '2', '308', 'Bread crambs', '2017-09-22', '3', '260', '260', '260', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('55', '2', '305', 'crispy TamBora', '2017-09-22', '6', '300', '300', '300', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('56', '2', '309', 'panne Rigate', '2017-09-22', '4', '300', '300', '300', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('57', '2', '325', 'giree Brada', '2017-09-22', '1', '600', '600', '600', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('58', '2', '306', 'fittaccine pasta', '2017-09-22', '1', '500', '500', '500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('59', '2', '321', 'chicken soup cube', '2017-09-22', '2', '800', '800', '800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('60', '2', '322', 'Dami glass Bass', '2017-09-22', '1', '800', '800', '800', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('61', '2', '205', 'YELLOW BUTTER FRESH', '2017-09-22', '2', '460', '460', '460', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('62', '2', '302', 'Mamasitta Suace 4kg ', '2017-09-22', '2', '2400', '2400', '2400', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('63', '2', '326', 'Tikka Masala', '2017-09-22', '1', '50', '50', '50', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('65', '4', '537', 'COFFEE CUP DISPOSABLE LID', '2017-09-25', '4500', '2', '2', '1.9782608695652', '4500', '4500', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('66', '4', '504', 'RECT SERVING PLATE 33CM', '2017-09-25', '67', '800', '800', '800', '67', '67', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('67', '4', '503', 'SQ DINNER PLATE 27CM', '2017-09-25', '69', '750', '750', '750', '69', '69', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('68', '4', '502', 'SQ DESSERT PLATE 21CM', '2017-09-25', '32', '400', '400', '400', '32', '32', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('69', '4', '507', 'BUTTER DISH WITH COVER', '2017-09-25', '24', '500', '500', '500', '24', '24', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('70', '4', '509', 'SQ SOUP BOWL 14CM', '2017-09-25', '3', '300', '300', '300', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('71', '4', '534', 'COFFEE MUG PORCILEN ', '2017-09-25', '166', '0', '0', '0', '166', '166', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('72', '4', '538', 'ICE CREAM BOWL DISPOSABLE ', '2017-09-25', '4000', '9', '9', '9', '4000', '4000', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('73', '4', '536', 'COFFEE CUP DISPOSABLE ', '2017-09-25', '4500', '6', '6', '6', '4500', '4500', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('74', '4', '542', 'STOOL GOLDEN BLACK ', '2017-09-25', '4', '13000', '13000', '13000', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('75', '4', '543', 'GLASS JUG FOR ICE TEA ', '2017-09-25', '16', '1200', '1200', '1200', '16', '16', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('76', '4', '517', 'SOUP BOWL CHINA ', '2017-09-25', '70', '325', '325', '325', '70', '70', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('77', '4', '518', 'SOUP SAUCER CHINA ', '2017-09-25', '28', '100', '100', '100', '28', '28', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('78', '4', '528', 'GLASS 350ML JUICE LONG ', '2017-09-25', '48', '1100', '1100', '1100', '48', '48', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('79', '4', '529', 'GLASS 300ML WATER (WINE) ', '2017-09-25', '48', '850', '850', '850', '48', '48', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('80', '4', '531', 'PLATE VERSECE LOGO ', '2017-09-25', '88', '1100', '1100', '1100', '88', '88', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('81', '4', '505', 'RECT SERVING BOWL 22.5CM', '2017-09-25', '4', '650', '650', '650', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('82', '4', '540', 'CHAIR AQUARIUM  ', '2017-09-25', '12', '10000', '10000', '10000', '12', '12', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('83', '4', '541', 'CHAIR VELVET ', '2017-09-25', '7', '35000', '35000', '35000', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('84', '4', '506', 'SQ Soup PLATE 20.5CM', '2017-09-25', '22', '650', '650', '650', '22', '22', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('85', '5', '328', 'WHITE CHEESE THREE COW 1/2 KG BLOCK ', '2017-09-25', '2', '500', '500', '500', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('86', '5', '329', 'CHICKEN SAUSAGES  ', '2017-09-25', '1', '350', '350', '350', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('87', '5', '330', 'LEAPED MIRROR GLASS (CAKE)', '2017-09-25', '5', '1800', '1800', '1800', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('88', '5', '707', 'STEAK TORCH ', '2017-09-25', '6', '1200', '1200', '1200', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('89', '5', '543', 'GLASS JUG FOR ICE TEA ', '2017-09-25', '8', '1200', '1200', '1200', '8', '8', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('90', '5', '708', 'DIGITAL SCREEN FOR MENU', '2017-09-25', '25', '1200', '1200', '1200', '25', '25', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('91', '5', '331', 'MANGO PUREE MONTIBINACO 4KG ', '2017-09-25', '1', '8000', '8000', '8000', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('92', '5', '333', 'STRAWBERRY PUREE MONTIBINACO 4KG ', '2017-09-25', '1', '8500', '8500', '8500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('93', '5', '334', 'SOYA SAUCE DARK 2 LITER (LEE KUM KI )', '2017-09-25', '4', '400', '400', '400', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('94', '5', '335', 'SOYA SAUCE LIGHT 2 LITER (LEE KUM KI )', '2017-09-25', '7', '400', '400', '400', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('95', '5', '336', 'SWEET VINEGAR ', '2017-09-25', '7', '450', '450', '450', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('96', '5', '337', 'TAPAL DANEDAR TEA 1/2 KG ', '2017-09-25', '2', '500', '500', '500', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('97', '5', '338', 'LIPTON GREEN TEA MINT 25PCS ', '2017-09-25', '4', '300', '300', '300', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('98', '5', '339', 'LIPTON GREEN TEA SENCHA 30PCS ', '2017-09-25', '2', '450', '450', '450', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('99', '5', '340', 'LIPTON GREEN TEA ROSEHIP 25PCS ', '2017-09-25', '2', '300', '300', '300', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('100', '5', '341', 'LIPTON GREEN TEA CAMOMILE 30PCS ', '2017-09-25', '2', '450', '450', '450', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('101', '5', '342', 'LIPTON GREEN TEA PURE BLACK 25 PCS ', '2017-09-25', '2', '300', '300', '300', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('102', '5', '343', 'LIPTON GREEN TEA LEMON 25 PCS ', '2017-09-25', '5', '300', '300', '300', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('103', '5', '344', 'LIPTON YELLOW LABEL SACHET 100 PCS PACK ', '2017-09-25', '4', '500', '500', '500', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('104', '5', '345', 'LIPTON ICED TEA SACHET ', '2017-09-25', '48', '100', '100', '100', '48', '48', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('105', '5', '347', 'RIPPY TOPPING CARAMEL ', '2017-09-25', '1', '1500', '1500', '1500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('106', '5', '348', 'RIPPY TOPPING MANGOO', '2017-09-25', '2', '1500', '1500', '1500', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('107', '5', '349', 'RIPPY TOPPING CHOCOLATE ', '2017-09-25', '2', '1500', '1500', '1500', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('108', '5', '206', 'WHITE BUTTER ', '2017-09-25', '7', '500', '500', '500', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('109', '5', '207', 'HICO VANILA ICE CREAM 2 LITTER ', '2017-09-25', '3', '500', '500', '500', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('110', '5', '205', 'YELLOW BUTTER FRESH', '2017-09-25', '11', '460', '460', '460', '11', '11', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('111', '5', '350', 'FRENCH FRIES Mccain 2.5kg ', '2017-09-25', '8', '800', '800', '800', '8', '8', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('112', '5', '351', 'MOZERELLA CHEESE ADAMS 2KG BLOCK ', '2017-09-25', '2', '2000', '2000', '2000', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('113', '5', '352', 'MILK CHOCOLATE 1 KG PACK COLLATA ', '2017-09-25', '18', '800', '800', '800', '18', '18', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('114', '5', '353', 'WHITE CHOCOLATE 1 KG PACK COLLATA ', '2017-09-25', '19', '800', '800', '800', '19', '19', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('115', '5', '750', 'FABRI MIXY BAR - MANGO', '2017-09-25', '5', '1800', '1800', '1800', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('116', '5', '742', 'FABRI MIXY CAFE - CINNAMON', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('117', '5', '752', 'FABRI MIXY BAR - PEACH', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('118', '5', '744', 'FABRI MIXY CAFE - HAZELNUT', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('119', '5', '741', 'FABRI MIXY CAFE - CARAMEL', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('120', '5', '747', 'FABRI MIXY BAR - COCONUT', '2017-09-25', '3', '1800', '1800', '1800', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('121', '5', '745', 'FABRI MIXY CAFE - IRISH CREAM', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('122', '5', '751', 'FABRI MIXY BAR - ORANGE', '2017-09-25', '4', '1800', '1800', '1800', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('123', '5', '746', 'FABRI MIXY CAFE - VANILLA', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('124', '5', '756', 'FABRI MIXY BAR - ROSE', '2017-09-25', '5', '1800', '1800', '1800', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('125', '5', '757', 'FABRI MIXY BAR - STRAWBERRY', '2017-09-25', '1', '1800', '1800', '1800', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('126', '5', '755', 'FABRI MIXY BAR - RASPBERRY', '2017-09-25', '2', '1800', '1800', '1800', '2', '2', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('127', '5', '754', 'FABRI MIXY BAR - POMEGRANATE', '2017-09-25', '3', '1800', '1800', '1800', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('128', '5', '755', 'FABRI MIXY BAR - RASPBERRY', '2017-09-25', '5', '1800', '1800', '1800', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('129', '5', '748', 'FABRI MIXY BAR - KIWI', '2017-09-25', '6', '1800', '1800', '1800', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('130', '5', '753', 'FABRI MIXY BAR - PINEAPPLE', '2017-09-25', '6', '1800', '1800', '1800', '6', '6', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('131', '5', '749', 'FABRI MIXY BAR - LEMON', '2017-09-25', '3', '1800', '1800', '1800', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('132', '5', '354', 'LAVAZZA ESSPRESSO COFFEE 1 KG ', '2017-09-25', '3', '3500', '3500', '3500', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('133', '5', '802', 'DIET 7UP 300ML CAN ', '2017-09-25', '24', '47', '47', '47', '24', '24', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('134', '5', '355', 'BAMBOO SHOOT TIN ', '2017-09-25', '3', '200', '200', '200', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('135', '5', '356', 'SWEET CORN TIN ', '2017-09-25', '3', '200', '200', '200', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('136', '5', '357', 'BABY CORN ', '2017-09-25', '26', '200', '200', '200', '26', '26', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('137', '5', '358', 'BAMBOO SHOOT HALVES TIN', '2017-09-25', '12', '200', '200', '200', '12', '12', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('138', '5', '359', 'AIRWIK FRESHENER 175GM  ', '2017-09-25', '7', '200', '200', '200', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('139', '5', '360', 'AIRWIK DIFFUSER  MACHINE ', '2017-09-25', '1', '1000', '1000', '1000', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('140', '5', '606', 'SURGICAL GLOVES ', '2017-09-25', '1', '500', '500', '500', '1', '1', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('141', '5', '362', 'MELAPINE PINEAPPLE SLICE 3KG ', '2017-09-25', '3', '800', '800', '800', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('142', '5', '363', 'DELMONT PINEAPPLE JUICE 1.36 LITER ', '2017-09-25', '5', '400', '400', '400', '5', '5', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('143', '5', '364', 'POLAC MILK 390 GRAMS ', '2017-09-25', '7', '200', '200', '200', '7', '7', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('144', '5', '365', 'YELLOW CLING PEACH HALVES IN SYRUP 820GMS ', '2017-09-25', '3', '200', '200', '200', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('145', '5', '366', 'LYCHEE READY TO EAT 365 GM ', '2017-09-25', '3', '250', '250', '250', '3', '3', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('146', '5', '367', 'COCONUT MILK 400GMS ', '2017-09-25', '4', '250', '250', '250', '4', '4', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('147', '5', '368', 'RED CHERRY SYRUP 240GMS ', '2017-09-25', '9', '350', '350', '350', '9', '9', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('149', '9', '001', 'BEEF TENDERLOIN WITHOUT HEAD', '2017-10-02', '0', '100', '0', '0', '1', '0', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL),
('151', '11', '001', 'BEEF TENDERLOIN WITHOUT HEAD', '2017-10-02', '0', '100', '100', '100', '1', '0', '', '', '', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_purch_orders` ###

INSERT INTO `0_purch_orders` VALUES
('2', '12', NULL, '2017-09-22', 'auto', '002', 'DEF', 'N/A', '177488', '0', '0', '0', '', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', ''),
('4', '12', NULL, '2017-09-25', 'auto', '003', '002', '', '872100', '0', '0', '0', '', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', ''),
('5', '12', NULL, '2017-09-25', 'auto', '004', '001', '', '285888', '0', '0', '0', '', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', ''),
('11', '10', NULL, '2017-10-02', 'auto', '11', '001', '', '100', '0', '0', '0', '', '5', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, '', '');

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
('1', '18', 'PO001/09/2017'),
('12', '18', 'PO001/10/2017'),
('1', '20', 'PI001/09/2017'),
('6', '20', 'PI001/10/2017'),
('7', '20', 'PI001/10/2017'),
('2', '20', 'PI002/09/2017'),
('3', '20', 'PI003/09/2017'),
('4', '20', 'PI003/09/2017'),
('5', '20', 'PI004/09/2017'),
('1', '25', 'GRN001/09/2017'),
('1', '41', 'CPV001/10/2017');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_requisitions` ###

INSERT INTO `0_requisitions` VALUES
('2', 'aasdfgh azyz', 'axyz', '2017-09-14 04:18:25', '1', '0', '0', 'ayz'),
('4', 'aaa', 'aaa', '2017-09-15 10:37:59', '1', '0', '0', 'aaaa'),
('5', 'kitchen', 'Food Items', '2017-10-05 11:31:32', '0', '0', '0', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES
('7', 'Beef Products ', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('8', 'Chicken Products ', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('9', 'Dairy Products ', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('10', 'Grocery Products ', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('11', 'Vegetables ', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('12', 'Cutlery &amp; Crockery ', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('13', 'House Keeping ', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('14', 'Miscellaneous ', '1', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('15', 'LPG Gas', '1', 'Kgs', 'M', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('16', 'Beverages ', '1', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('17', 'FRUITS ', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0'),
('18', 'Sea Food', '1', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0');

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
('001', '7', '1', 'BEEF TENDERLOIN WITHOUT HEAD', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '100', '100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('002', '7', '1', 'BEEF TENDERLOIN WITH HEAD', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('003', '7', '1', 'BEEF SLICE FOR GRAVY', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('004', '7', '1', 'BEEF WASTE LEFT FROM CLEANING', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1050', '1050', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('101', '8', '1', 'CHICKEN FILLET 110 TO 120 GMS K&amp;N&#039;S', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '420', '420', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('102', '8', '1', 'CHICKEN THAI BONELESS (LOCAL)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '350', '350', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('103', '8', '1', 'CHICKEN THAI BONELESS (K&amp;N&#039;S)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '400', '400', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('104', '8', '1', 'CHICKEN NIBLETS WINGS (K&amp;N&#039;S)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '290', '290', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('105', '8', '1', 'CHICKEN WINGS LOCAL', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('106', '8', '1', 'CHICKEN BREAST LOCAL', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '360', '360', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('107', '8', '1', 'CHICKEN 9 CUT WITH SKIN (MARINATO)', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('109', '8', '1', 'CHICKEN BONE (LOCAL)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '90', '90', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('151', '18', '1', 'SHRIMPS WHITE BAG 2KG ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1100', '1100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('152', '18', '1', 'SHRIMPS 16/20 ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1200', '1200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('153', '18', '1', 'SHRIMPS 21/25', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1300', '1300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('154', '18', '1', 'SHRIMPS GLOBAL ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1000', '1000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('201', '9', '1', 'FRESH CREAM', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '290', '290', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('202', '9', '1', 'FRESH YOUGERT ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('203', '9', '1', 'PREMA MILK ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '140', '140', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('204', '9', '1', 'MILK PACK MILK 1 LTTER ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '130', '130', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('205', '9', '1', 'YELLOW BUTTER FRESH', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '460', '460', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('206', '9', '1', 'WHITE BUTTER ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('207', '9', '1', 'HICO VANILA ICE CREAM 2 LITTER ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('230', '10', '1', 'CORN FLOUR LOSSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('231', '10', '1', 'RED CHILLI PWODER LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('232', '10', '1', 'CRUSHED CHILLI (DADER MIRCH)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('233', '10', '1', 'MILK PACK CREAM 200ML ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('234', '10', '1', 'CINNAMON POWDER ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('235', '10', '1', 'FOOD COLOR YELLOW POWDER ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('236', '10', '1', 'GARLIC POWDER LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('237', '10', '1', 'SUJI SAMOLINA ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('238', '10', '1', 'OREAL CHICKEN POWDER ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('239', '10', '1', 'DASHI CHICKEN POWDER SACHET 100GRAM ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('240', '10', '1', 'CHILI POWDER NATIONAL 200GRAMS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('241', '10', '1', 'ZEERA POWDER 50GRAMS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('242', '10', '1', 'GARLIC POWDER 50GRAMS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('243', '10', '1', 'TURMARIC POWDER 50 GRAMS ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('244', '10', '1', 'HOT CHOCOLOT LAVAZZA ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('245', '10', '1', 'CHINESE SALT (CHINA NAMAK) LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('246', '10', '1', 'RED CHILLI WHOLE ROUND ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('247', '10', '1', 'LADY FRUIT GEL 5KG ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('248', '10', '1', 'IMLI LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('249', '10', '1', 'ALMOND ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('250', '10', '1', 'PEANUTS LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('251', '10', '1', 'PISTA ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('252', '10', '1', 'WALNUT AKHROOT ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('253', '10', '1', 'PICTACHIO CRUSH IMPORTD ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('254', '10', '1', 'CHOCO  POWDER LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('255', '10', '1', 'KUNG PAO PASTE 150 GRAMS ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('256', '10', '1', 'KUNG PAO PASTE 1 KG ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('257', '10', '1', 'KUNG PAO PASTE 500GRAMS ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('258', '10', '1', 'CORRIANDER', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('259', '10', '1', 'RED CHILLI PASTE', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('260', '10', '1', 'LEMON GRASS', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('261', '10', '1', 'WHITE CHOCOLATE', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('262', '10', '1', 'DRIED MASHROOM BLACK', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('263', '10', '1', 'ALL PURPOSE FLOUR', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('264', '10', '1', 'SUGAR SACHET WHITE', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('265', '10', '1', 'SUGAR', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('266', '10', '1', 'GLUCOSE', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('267', '10', '1', 'FISH SAUCE 750ML', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('268', '10', '1', 'BALSAMIC VINEGAR', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('269', '10', '1', 'THAI SWEET CHILLI', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('270', '10', '1', 'HOT SAUCE (SHANGRILLA)', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('271', '10', '1', 'LEMON JUICE (MITCHELS)', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('272', '10', '1', 'CAPERS (BEN-DELS)', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('273', '10', '1', 'GREEN PEPPER CORN 100GMS (BEN-DELS)', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('274', '10', '1', 'SAMBOLIC CHILLI', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('275', '10', '1', 'THAI CHILLI PASTE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('276', '10', '1', 'GREEN CHILLI PASTE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('277', '10', '1', 'GREEN CHILLI PICKLE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('278', '10', '1', 'RED CHILLI PICKLE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('279', '10', '1', 'CHILLI GARLIC (KNORR)', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('280', '10', '1', 'TOMATO KETCHUP 800GMS (KNORR)', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('281', '10', '1', 'KING SUGAR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('282', '10', '1', 'TOMATO KETCHUP SACHET', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('283', '10', '1', 'GARLIC CHILLI SACHET', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('284', '10', '1', 'SEASAME OIL (HEINZ) 500ML', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('285', '10', '1', 'GREEN LABLE FOOD COLOR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('286', '10', '1', 'FOOD COLOR YELLOW 500 GMS (ASIA)', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('287', '10', '1', 'CAKE MIX (BETTY CROCKER) 432 GMS', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('288', '10', '1', 'YEAST 500 GMS', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('289', '10', '1', 'VANILA FLAVOUR 450ML (BUSH BOAK ALLEN)', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('290', '10', '1', 'BARBECUE SAUCE 800 GMS (KNORR)', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('291', '10', '1', 'ABC SAUCE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('292', '10', '1', 'GRAPE VINEGAR', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('293', '10', '1', 'SYNTHETIC VINEGAR', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('294', '10', '1', 'BUTTER MASHROOM', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('295', '10', '1', 'FRENCH MUSTARD ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('296', '10', '1', 'GREEN CAPER CORN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('297', '10', '1', 'RED BEANS', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('298', '10', '1', 'ORANGE JAM', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('299', '10', '1', 'SEA SALT', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('300', '10', '1', 'GREEN OLIVES', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('301', '10', '1', 'EGGS', '', '', 'Doz', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('302', '10', '1', 'MAMASITTA OYSTER SAUCE 4KG', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '2400', '2400', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('303', '10', '1', 'RICE ZARAFA 2 YEARS OLD', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '170', '170', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('304', '10', '1', 'CRACKERS', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('305', '10', '1', 'CRISPY TAMPOORA FLOUR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('306', '10', '1', 'FETTUCCINE PASTA', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('307', '10', '1', 'MACARONI ELBLOW BIG', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('308', '10', '1', 'BREAD CRUMBS', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '260', '260', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('309', '10', '1', 'PANNE REGGIA PASTA', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('310', '10', '1', 'GREEN CHILLI SAUCE', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('311', '10', '1', 'TARRAGON', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('312', '10', '1', 'DRY BASIL', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('313', '10', '1', 'THYME', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('314', '10', '1', 'SALT', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '22', '22', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('315', '10', '1', 'TOMATO KETCHUP HEINZ ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('316', '10', '1', 'PAPRIKA POWDER', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('317', '10', '1', 'WHITE PEPPER POWDER', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('318', '10', '1', 'RED CURRY PASTE', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('319', '10', '1', 'TOBASSCO SAUCE', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '250', '250', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('320', '10', '1', 'COCONUT CREAM POWDER', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '150', '150', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('321', '10', '1', 'CHICKEN SOUP CUBE', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('322', '10', '1', 'DAMI GLASS BASE', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('323', '10', '1', 'GINGER POWDER', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('324', '10', '1', 'TURMERIC POWDER', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('325', '10', '1', 'GIREE BRADA', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '600', '600', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('326', '10', '1', 'TIKKA MASALA', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('327', '10', '1', 'BLACK PEPPER POWDER', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1500', '1500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('328', '10', '1', 'WHITE CHEESE THREE COW 1/2 KG BLOCK ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('329', '10', '1', 'CHICKEN SAUSAGES  ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '350', '350', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('330', '10', '1', 'LEAPED MIRROR GLASS (CAKE)', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('331', '10', '1', 'MANGO PUREE MONTIBINACO 4KG ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '8000', '8000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('333', '10', '1', 'STRAWBERRY PUREE MONTIBINACO 4KG ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '8500', '8500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('334', '10', '1', 'SOYA SAUCE DARK 2 LITER (LEE KUM KI )', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '400', '400', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('335', '10', '1', 'SOYA SAUCE LIGHT 2 LITER (LEE KUM KI )', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '400', '400', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('336', '10', '1', 'SWEET VINEGAR ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '450', '450', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('337', '10', '1', 'TAPAL DANEDAR TEA 1/2 KG ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('338', '10', '1', 'LIPTON GREEN TEA MINT 25PCS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('339', '10', '1', 'LIPTON GREEN TEA SENCHA 30PCS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '450', '450', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('340', '10', '1', 'LIPTON GREEN TEA ROSEHIP 25PCS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('341', '10', '1', 'LIPTON GREEN TEA CAMOMILE 30PCS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '450', '450', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('342', '10', '1', 'LIPTON GREEN TEA PURE BLACK 25 PCS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('343', '10', '1', 'LIPTON GREEN TEA LEMON 25 PCS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('344', '10', '1', 'LIPTON YELLOW LABEL SACHET 100 PCS PACK ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('345', '10', '1', 'LIPTON ICED TEA SACHET ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '100', '100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '');
INSERT INTO `0_stock_master` VALUES
('346', '10', '1', 'LIPTON TEA 475 GRAMS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('347', '10', '1', 'RIPPY TOPPING CARAMEL ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1500', '1500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('348', '10', '1', 'RIPPY TOPPING MANGOO', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1500', '1500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('349', '10', '1', 'RIPPY TOPPING CHOCOLATE ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1500', '1500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('350', '10', '1', 'FRENCH FRIES Mccain 2.5kg ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('351', '10', '1', 'MOZERELLA CHEESE ADAMS 2KG BLOCK ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '2000', '2000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('352', '10', '1', 'MILK CHOCOLATE 1 KG PACK COLLATA ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('353', '10', '1', 'WHITE CHOCOLATE 1 KG PACK COLLATA ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('354', '10', '1', 'LAVAZZA ESSPRESSO COFFEE 1 KG ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '3500', '3500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('355', '10', '1', 'BAMBOO SHOOT TIN ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('356', '10', '1', 'SWEET CORN TIN ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('357', '10', '1', 'BABY CORN ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('358', '10', '1', 'BAMBOO SHOOT HALVES TIN', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('359', '10', '1', 'AIRWIK FRESHENER 175GM  ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('360', '10', '1', 'AIRWIK DIFFUSER  MACHINE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1000', '1000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('362', '10', '1', 'MELAPINE PINEAPPLE SLICE 3KG ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('363', '10', '1', 'DELMONT PINEAPPLE JUICE 1.36 LITER ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '400', '400', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('364', '10', '1', 'POLAC MILK 390 GRAMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('365', '10', '1', 'YELLOW CLING PEACH HALVES IN SYRUP 820GMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('366', '10', '1', 'LYCHEE READY TO EAT 365 GM ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '250', '250', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('367', '10', '1', 'COCONUT MILK 400GMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '250', '250', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('368', '10', '1', 'RED CHERRY SYRUP 240GMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '350', '350', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('369', '10', '1', 'STRAWBERRY IN SYRUP 425GM ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('370', '10', '1', 'THAI COCONUT CREAM 400 GMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('371', '10', '1', 'SUFI COOKING OIL 1 LITER ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('372', '10', '1', 'STRAWBERRY FILLING 595GM ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('373', '10', '1', 'BLUEBERRY FILLING 595GM ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('374', '10', '1', 'STRAWBERRY PUREE MONTIBIANCO 2KG ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('375', '10', '1', 'MANGOO PUREE MONTIBIANCO 2KG ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('376', '10', '1', 'THAI GREEN CURRY PASTE 400GM', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('377', '10', '1', 'PLAIN MUSTERED  400G', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('378', '10', '1', 'ANCIENNE MUSTERED 200G ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('379', '10', '1', 'CREAM PEANUT BUTTER 340G', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('380', '10', '1', 'KNOOR CHICKEN STOCK POWDER ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('381', '10', '1', 'RICE VERMICELLI 200GRAMS  ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('382', '10', '1', 'HP SAUCE 255 GRAMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('383', '10', '1', 'FOOD COLOR SILVER 25 GRAM', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('384', '10', '1', 'FOOD COLOR GOLD 25 GRAM', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('385', '10', '1', 'FOOD COLOR RED DUBAI 25 GRAM ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('386', '10', '1', 'CADABRY DRINKING CHOCOLATE POWDER 500GRAMS', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('387', '10', '1', 'TOMATO PUREE 450 GRAM ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('388', '10', '1', 'TOMATO PASTE 450 GRAMS ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('389', '10', '1', 'OLIVE OIL 4 LITTER ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('390', '10', '1', 'RED ALLAPINO SLICED ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('391', '10', '1', 'GREEN ALLAPINO SLICED 480GRAMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('392', '10', '1', 'SUN DRY TOMATO 300 GRAMS ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('393', '10', '1', 'STRAWBERRY JELLY 100GRAMS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('394', '10', '1', 'GRAPES JELLY 100 GRAM', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('395', '10', '1', 'ORANGE JELLY ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('396', '10', '1', 'RED WINE VINEGAR 500ML ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('397', '10', '1', 'TOM YOM GONG PASTE 227 GRAMS ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('398', '10', '1', 'BACKING POWDER 300 GRAMS ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('399', '10', '1', 'HONEY 4.2 KGS ', '', '', 'Jar', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('401', '11', '1', 'ONION', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('402', '11', '1', 'CARROTS', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('403', '11', '1', 'CABBAGE', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '150', '150', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('404', '11', '1', 'GREEN ONION', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '150', '150', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('405', '11', '1', 'RED ONION', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('406', '11', '1', 'ZUCCHINI', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('407', '11', '1', 'POTATOES', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('408', '11', '1', 'ICEBERG LETTUCE', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('409', '11', '1', 'BROCCOLI', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('410', '11', '1', 'YELLOW CAPSICUM', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1000', '1000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('411', '11', '1', 'GREEN CAPSICUM', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('412', '11', '1', 'RED CAPSICUM', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1000', '1000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('413', '11', '1', 'GARLIC', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '290', '290', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('414', '11', '1', 'FRESH MINT', '', '', 'Bunch', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('415', '11', '1', 'CHERRY TOMATO', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('416', '11', '1', 'BIRD CHILLI', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '250', '250', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('417', '11', '1', 'GINGER', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '150', '150', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('418', '11', '1', 'GREEN CHILLI', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('451', '17', '1', 'APPLE GREEN ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('452', '17', '1', 'GRAPES', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('453', '17', '1', 'MUSAMMBI ', '', '', 'Doz', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('454', '17', '1', 'KINNO', '', '', 'Doz', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('455', '17', '1', 'BANANA ', '', '', 'Doz', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('456', '17', '1', 'POMEGRANATE WHITE  ', '', '', 'Doz', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('457', '17', '1', 'POMEGRANATE RED', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('458', '17', '1', 'KIWI ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('459', '17', '1', 'MANGOO', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('460', '17', '1', 'BEET (CHAKUNDER)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('461', '17', '1', 'APPLE KALA GULU ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('462', '17', '1', 'PEACH ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('463', '17', '1', 'FALSA', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('464', '17', '1', 'ORANGE (MALTA)', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('501', '12', '1', 'DINNER SPOON LARGE', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('502', '12', '1', 'SQ DESSERT PLATE 21CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '400', '400', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('503', '12', '1', 'SQ DINNER PLATE 27CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '750', '750', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('504', '12', '1', 'RECT SERVING PLATE 33CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '800', '800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('505', '12', '1', 'RECT SERVING BOWL 22.5CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '650', '650', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('506', '12', '1', 'SQ Soup PLATE 20.5CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '650', '650', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('507', '12', '1', 'BUTTER DISH WITH COVER', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('508', '12', '1', 'RECT SERVING BOWL 17.5CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('509', '12', '1', 'SQ SOUP BOWL 14CM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '300', '300', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('510', '12', '1', 'DINNER SPOON MEDIUM', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('511', '12', '1', 'DESSERT SPOON SMALL ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('512', '12', '1', 'DINNER FORK ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('513', '12', '1', 'DINNER KNIFE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('514', '12', '1', 'STEAK KNIFE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('515', '12', '1', 'NAPKIN RINGS ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '200', '200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('516', '12', '1', 'TABLE NAPKIN ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '80', '80', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('517', '12', '1', 'SOUP BOWL CHINA ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '325', '325', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('518', '12', '1', 'SOUP SAUCER CHINA ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '100', '100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('519', '12', '1', 'STONE PLATE BLACK CHINA ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('520', '12', '1', 'STEEL CURVE TRAY SMALL  ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('521', '12', '1', 'STEEL CURVE TRAY LARGE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('522', '12', '1', 'PORTION PLATE CHINA WHITE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('523', '12', '1', 'STEAK WOODEN TRAY ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('524', '12', '1', 'STEAK VEGI PLATE  (WOODEN) ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('525', '12', '1', 'STEAK SAUCE BOWL  (WOODEN)', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('526', '12', '1', 'STEAK MARBEL  (WOODEN)', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('527', '12', '1', 'HOT PLATE (SKILLET BROWNIE)', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('528', '12', '1', 'GLASS 350ML JUICE LONG ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1100', '1100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('529', '12', '1', 'GLASS 300ML WATER (WINE) ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '850', '850', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('530', '12', '1', 'GLASS 50ML MINI ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('531', '12', '1', 'PLATE VERSECE LOGO ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1100', '1100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('532', '12', '1', 'SOUP CONTINENTS BOWL  ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '50', '50', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('533', '12', '1', 'SOUP CONTINENTS TRAY', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '100', '100', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('534', '12', '1', 'COFFEE MUG PORCILEN ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('536', '12', '1', 'COFFEE CUP DISPOSABLE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '6', '6', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('537', '12', '1', 'COFFEE CUP DISPOSABLE LID', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '2', '1.9782608695652', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('538', '12', '1', 'ICE CREAM BOWL DISPOSABLE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '9', '9', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('539', '12', '1', 'ICE CREAM SPOON DISPOSABLE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('540', '12', '1', 'CHAIR AQUARIUM  ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '10000', '10000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('541', '12', '1', 'CHAIR VELVET ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '35000', '35000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('542', '12', '1', 'STOOL GOLDEN BLACK ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '13000', '13000', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('543', '12', '1', 'GLASS JUG FOR ICE TEA ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1200', '1200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('601', '13', '1', 'DISH WASHING LIQUID BULK', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('602', '13', '1', 'TILE CLEANER Liquid bulk  ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('603', '13', '1', 'HARPIC TOILET CLEANER BULK ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('604', '13', '1', 'FANAYLE LIQUID BULK ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('605', '13', '1', 'HAND WASH LIQUID BULK ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('606', '13', '1', 'SURGICAL GLOVES ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '500', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('607', '13', '1', 'HAIR NET CAP ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('608', '13', '1', 'BLACK BIN BAG ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('609', '13', '1', 'FABREEZ AIR FRESHNER ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('610', '13', '1', 'MORTEIN SPRAY ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('611', '13', '1', 'TOWEL LOOSE ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '');
INSERT INTO `0_stock_master` VALUES
('612', '13', '1', 'GLINT GLASS CLEANER PACK ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('613', '13', '1', 'LEMON MAX BAR 290 GRAMS ', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('614', '13', '1', 'WIPER ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('615', '13', '1', 'MOP BROOM ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('616', '13', '1', 'PICKER HELPER ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('617', '13', '1', 'WIPER ROD ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('701', '14', '1', 'ZIPPER BAG', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('702', '14', '1', 'PACKING BAG PRINTED (KHAKHI)', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '14', '14', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('703', '14', '1', 'PACKING ZIPPER KHAKHI LARGE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('704', '14', '1', 'PACKING ZIPPER KHAKHI SMALL', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('705', '14', '1', 'TISSUE BOX ANTIQUE ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '40', '40', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('706', '14', '1', 'SHOPPING BAG PLASTIC ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('707', '14', '1', 'STEAK TORCH ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1200', '1200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('708', '14', '1', 'DIGITAL SCREEN FOR MENU', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1200', '1200', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('709', '14', '1', 'HEART STYLE BALOONS ', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('730', '10', '1', 'GRAPES OIL', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('731', '10', '1', 'KACHRI POWDER LOOSE', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('732', '10', '1', 'OREGANO DRY', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('733', '10', '1', 'ROSEMERRY', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('734', '10', '1', 'MASHROOM FUNGUS', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('735', '10', '1', 'TOMATO CHIPS', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('736', '10', '1', 'BROWN SUGAR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('737', '10', '1', 'BLACK PEPPER SABAT', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('738', '11', '1', 'FRESH BASIL', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('739', '11', '1', 'PARSLEY', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('740', '11', '1', 'TOMATOES', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('741', '10', '1', 'FABRI MIXY CAFE - CARAMEL', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('742', '10', '1', 'FABRI MIXY CAFE - CINNAMON', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('743', '10', '1', 'FABRI MIXY CAFE - COCONUT', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('744', '10', '1', 'FABRI MIXY CAFE - HAZELNUT', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('745', '10', '1', 'FABRI MIXY CAFE - IRISH CREAM', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('746', '10', '1', 'FABRI MIXY CAFE - VANILLA', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('747', '10', '1', 'FABRI MIXY BAR - COCONUT', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('748', '10', '1', 'FABRI MIXY BAR - KIWI', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('749', '10', '1', 'FABRI MIXY BAR - LEMON', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('750', '10', '1', 'FABRI MIXY BAR - MANGO', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('751', '10', '1', 'FABRI MIXY BAR - ORANGE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('752', '10', '1', 'FABRI MIXY BAR - PEACH', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('753', '10', '1', 'FABRI MIXY BAR - PINEAPPLE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('754', '10', '1', 'FABRI MIXY BAR - POMEGRANATE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('755', '10', '1', 'FABRI MIXY BAR - RASPBERRY', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('756', '10', '1', 'FABRI MIXY BAR - ROSE', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('757', '10', '1', 'FABRI MIXY BAR - STRAWBERRY', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '1800', '1800', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('758', '10', '1', 'BELGIAN MILK CHOCOLATE 37% COCOA', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('759', '10', '1', 'BELGIAN WHITE CHOCOLATE 31.3% COCOA', '', '', 'pcs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('760', '10', '1', 'SUPERBASE 100', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('801', '16', '1', 'COKE 300 ML CAN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('802', '16', '1', 'DIET 7UP 300ML CAN ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '47', '47', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('803', '16', '1', '7UP 300 ML CAN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '47', '47', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('804', '16', '1', 'FANTA 300ML CAN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('805', '16', '1', 'SPRITE 300ML CAN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('806', '16', '1', 'SPRITE ZERO 300ML CAN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('807', '16', '1', 'SPRITE 1.5 LTR', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '80', '80', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('808', '16', '1', '7UP 1.5 LTR', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '80', '80', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('809', '16', '1', 'COKE DIET 300 ML CAN', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('810', '16', '1', 'WATER MINERAL 1.5 LTR', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('814', '16', '1', 'PEPSI 300ml can', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '47', '47', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('815', '16', '1', 'PEPSI 1.5liter', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('816', '16', '1', 'PEPSI 500ml', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('817', '16', '1', 'NESTLE MANGO JUICE 1 LTR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '160', '160', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('818', '16', '1', 'NESTLE APPLE JUICE 1 LTR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '140', '140', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('819', '16', '1', 'NESTLE RED GRAPE 1 LTR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '180', '180', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('820', '16', '1', 'NESTLE PEACH JUICE 1 LTR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('821', '16', '1', 'NESTLE PINEAPPLE JUICE 1 LTR', '', '', 'Pack', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '140', '140', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('822', '16', '1', 'AQUA FINA WATER 500ML ', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '30', '30', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('823', '16', '1', 'RED BULL', '', '', 'Bottles', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', ''),
('901', '15', '1', 'LPG GAS ', '', '', 'Kgs', 'B', '4011', '5011', '1021', '5014', '1023', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0000-00-00', '0000-00-00', '', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_stock_moves` ###

INSERT INTO `0_stock_moves` VALUES
('3', '2', '151', '25', 'DEF', '2017-09-22', '12', '1100', '', '2', '1100', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4', '2', '152', '25', 'DEF', '2017-09-22', '12', '1200', '', '8', '1200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5', '2', '109', '25', 'DEF', '2017-09-22', '12', '90', '', '8', '90', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6', '2', '106', '25', 'DEF', '2017-09-22', '12', '360', '', '4', '360', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7', '2', '103', '25', 'DEF', '2017-09-22', '12', '400', '', '4.3', '400', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8', '2', '101', '25', 'DEF', '2017-09-22', '12', '420', '', '50', '420', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9', '2', '104', '25', 'DEF', '2017-09-22', '12', '290', '', '10', '290', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('10', '2', '107', '25', 'DEF', '2017-09-22', '12', '50', '', '72', '50', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('11', '2', '530', '25', 'DEF', '2017-09-22', '12', '50', '', '60', '50', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('12', '2', '532', '25', 'DEF', '2017-09-22', '12', '50', '', '30', '50', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('13', '2', '533', '25', 'DEF', '2017-09-22', '12', '100', '', '6', '100', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('14', '2', '154', '25', 'DEF', '2017-09-22', '12', '1000', '', '6', '1000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('15', '2', '153', '25', 'DEF', '2017-09-22', '12', '1300', '', '7', '1300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('16', '2', '102', '25', 'DEF', '2017-09-22', '12', '350', '', '3', '350', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('17', '2', '004', '25', 'DEF', '2017-09-22', '12', '1050', '', '7', '1050', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('18', '2', '803', '25', 'DEF', '2017-09-22', '12', '47', '', '36', '47', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('19', '2', '814', '25', 'DEF', '2017-09-22', '12', '47', '', '12', '47', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('20', '2', '808', '25', 'DEF', '2017-09-22', '12', '80', '', '12', '80', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('21', '2', '807', '25', 'DEF', '2017-09-22', '12', '80', '', '6', '80', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('22', '2', '516', '25', 'DEF', '2017-09-22', '12', '80', '', '265', '80', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('23', '2', '515', '25', 'DEF', '2017-09-22', '12', '200', '', '98', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('24', '2', '702', '25', 'DEF', '2017-09-22', '12', '14', '', '544', '14', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('25', '2', '821', '25', 'DEF', '2017-09-22', '12', '140', '', '5', '140', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('26', '2', '818', '25', 'DEF', '2017-09-22', '12', '140', '', '5', '140', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('27', '2', '819', '25', 'DEF', '2017-09-22', '12', '180', '', '6', '180', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('28', '2', '817', '25', 'DEF', '2017-09-22', '12', '160', '', '4', '160', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('29', '2', '204', '25', 'DEF', '2017-09-22', '12', '130', '', '3', '130', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('30', '2', '316', '25', 'DEF', '2017-09-22', '12', '50', '', '4', '50', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('31', '2', '320', '25', 'DEF', '2017-09-22', '12', '150', '', '4', '150', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('32', '2', '705', '25', 'DEF', '2017-09-22', '12', '40', '', '50', '40', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('33', '2', '537', '25', 'DEF', '2017-09-22', '12', '1', '', '100', '1', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('34', '2', '536', '25', 'DEF', '2017-09-22', '12', '6', '', '80', '6', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('35', '2', '327', '25', 'DEF', '2017-09-22', '12', '1500', '', '7.75', '1500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('36', '2', '822', '25', 'DEF', '2017-09-22', '12', '30', '', '109', '30', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('37', '2', '203', '25', 'DEF', '2017-09-22', '12', '140', '', '4', '140', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('38', '2', '416', '25', 'DEF', '2017-09-22', '12', '250', '', '4', '250', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('39', '2', '201', '25', 'DEF', '2017-09-22', '12', '290', '', '12', '290', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('40', '2', '403', '25', 'DEF', '2017-09-22', '12', '150', '', '4.28', '150', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('41', '2', '413', '25', 'DEF', '2017-09-22', '12', '290', '', '6', '290', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('42', '2', '410', '25', 'DEF', '2017-09-22', '12', '1000', '', '0.9', '1000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('43', '2', '404', '25', 'DEF', '2017-09-22', '12', '150', '', '3.2', '150', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('44', '2', '417', '25', 'DEF', '2017-09-22', '12', '150', '', '1.5', '150', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('45', '2', '412', '25', 'DEF', '2017-09-22', '12', '1000', '', '1.35', '1000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('46', '2', '303', '25', 'DEF', '2017-09-22', '12', '170', '', '6.4', '170', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('47', '2', '314', '25', 'DEF', '2017-09-22', '12', '22', '', '18', '22', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('48', '2', '312', '25', 'DEF', '2017-09-22', '12', '500', '', '1', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('49', '2', '313', '25', 'DEF', '2017-09-22', '12', '500', '', '1', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('50', '2', '311', '25', 'DEF', '2017-09-22', '12', '500', '', '1', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('51', '2', '304', '25', 'DEF', '2017-09-22', '12', '300', '', '3', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('52', '2', '319', '25', 'DEF', '2017-09-22', '12', '250', '', '12', '250', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('53', '2', '307', '25', 'DEF', '2017-09-22', '12', '300', '', '5', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('54', '2', '308', '25', 'DEF', '2017-09-22', '12', '260', '', '3', '260', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('55', '2', '305', '25', 'DEF', '2017-09-22', '12', '300', '', '6', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('56', '2', '309', '25', 'DEF', '2017-09-22', '12', '300', '', '4', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('57', '2', '325', '25', 'DEF', '2017-09-22', '12', '600', '', '1', '600', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('58', '2', '306', '25', 'DEF', '2017-09-22', '12', '500', '', '1', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('59', '2', '321', '25', 'DEF', '2017-09-22', '12', '800', '', '2', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('60', '2', '322', '25', 'DEF', '2017-09-22', '12', '800', '', '1', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('61', '2', '205', '25', 'DEF', '2017-09-22', '12', '460', '', '2', '460', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('62', '2', '302', '25', 'DEF', '2017-09-22', '12', '2400', '', '2', '2400', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('63', '2', '326', '25', 'DEF', '2017-09-22', '12', '50', '', '1', '50', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('65', '4', '537', '25', '002', '2017-09-25', '12', '2', '', '4500', '1.9782608695652', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('66', '4', '504', '25', '002', '2017-09-25', '12', '800', '', '67', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('67', '4', '503', '25', '002', '2017-09-25', '12', '750', '', '69', '750', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('68', '4', '502', '25', '002', '2017-09-25', '12', '400', '', '32', '400', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('69', '4', '507', '25', '002', '2017-09-25', '12', '500', '', '24', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('70', '4', '509', '25', '002', '2017-09-25', '12', '300', '', '3', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('71', '4', '534', '25', '002', '2017-09-25', '12', '0', '', '166', '0', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('72', '4', '538', '25', '002', '2017-09-25', '12', '9', '', '4000', '9', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('73', '4', '536', '25', '002', '2017-09-25', '12', '6', '', '4500', '6', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('74', '4', '542', '25', '002', '2017-09-25', '12', '13000', '', '4', '13000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('75', '4', '543', '25', '002', '2017-09-25', '12', '1200', '', '16', '1200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('76', '4', '517', '25', '002', '2017-09-25', '12', '325', '', '70', '325', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('77', '4', '518', '25', '002', '2017-09-25', '12', '100', '', '28', '100', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('78', '4', '528', '25', '002', '2017-09-25', '12', '1100', '', '48', '1100', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('79', '4', '529', '25', '002', '2017-09-25', '12', '850', '', '48', '850', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('80', '4', '531', '25', '002', '2017-09-25', '12', '1100', '', '88', '1100', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('81', '4', '505', '25', '002', '2017-09-25', '12', '650', '', '4', '650', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('82', '4', '540', '25', '002', '2017-09-25', '12', '10000', '', '12', '10000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('83', '4', '541', '25', '002', '2017-09-25', '12', '35000', '', '7', '35000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('84', '4', '506', '25', '002', '2017-09-25', '12', '650', '', '22', '650', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('85', '5', '328', '25', '001', '2017-09-25', '12', '500', '', '2', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('86', '5', '329', '25', '001', '2017-09-25', '12', '350', '', '1', '350', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('87', '5', '330', '25', '001', '2017-09-25', '12', '1800', '', '5', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('88', '5', '707', '25', '001', '2017-09-25', '12', '1200', '', '6', '1200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('89', '5', '543', '25', '001', '2017-09-25', '12', '1200', '', '8', '1200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('90', '5', '708', '25', '001', '2017-09-25', '12', '1200', '', '25', '1200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('91', '5', '331', '25', '001', '2017-09-25', '12', '8000', '', '1', '8000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('92', '5', '333', '25', '001', '2017-09-25', '12', '8500', '', '1', '8500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('93', '5', '334', '25', '001', '2017-09-25', '12', '400', '', '4', '400', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('94', '5', '335', '25', '001', '2017-09-25', '12', '400', '', '7', '400', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('95', '5', '336', '25', '001', '2017-09-25', '12', '450', '', '7', '450', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('96', '5', '337', '25', '001', '2017-09-25', '12', '500', '', '2', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('97', '5', '338', '25', '001', '2017-09-25', '12', '300', '', '4', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('98', '5', '339', '25', '001', '2017-09-25', '12', '450', '', '2', '450', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('99', '5', '340', '25', '001', '2017-09-25', '12', '300', '', '2', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('100', '5', '341', '25', '001', '2017-09-25', '12', '450', '', '2', '450', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('101', '5', '342', '25', '001', '2017-09-25', '12', '300', '', '2', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('102', '5', '343', '25', '001', '2017-09-25', '12', '300', '', '5', '300', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('103', '5', '344', '25', '001', '2017-09-25', '12', '500', '', '4', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('104', '5', '345', '25', '001', '2017-09-25', '12', '100', '', '48', '100', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('105', '5', '347', '25', '001', '2017-09-25', '12', '1500', '', '1', '1500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('106', '5', '348', '25', '001', '2017-09-25', '12', '1500', '', '2', '1500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('107', '5', '349', '25', '001', '2017-09-25', '12', '1500', '', '2', '1500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('108', '5', '206', '25', '001', '2017-09-25', '12', '500', '', '7', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('109', '5', '207', '25', '001', '2017-09-25', '12', '500', '', '3', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('110', '5', '205', '25', '001', '2017-09-25', '12', '460', '', '11', '460', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('111', '5', '350', '25', '001', '2017-09-25', '12', '800', '', '8', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('112', '5', '351', '25', '001', '2017-09-25', '12', '2000', '', '2', '2000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('113', '5', '352', '25', '001', '2017-09-25', '12', '800', '', '18', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('114', '5', '353', '25', '001', '2017-09-25', '12', '800', '', '19', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('115', '5', '750', '25', '001', '2017-09-25', '12', '1800', '', '5', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('116', '5', '742', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('117', '5', '752', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('118', '5', '744', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('119', '5', '741', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('120', '5', '747', '25', '001', '2017-09-25', '12', '1800', '', '3', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('121', '5', '745', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('122', '5', '751', '25', '001', '2017-09-25', '12', '1800', '', '4', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('123', '5', '746', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('124', '5', '756', '25', '001', '2017-09-25', '12', '1800', '', '5', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('125', '5', '757', '25', '001', '2017-09-25', '12', '1800', '', '1', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('126', '5', '755', '25', '001', '2017-09-25', '12', '1800', '', '2', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('127', '5', '754', '25', '001', '2017-09-25', '12', '1800', '', '3', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('128', '5', '755', '25', '001', '2017-09-25', '12', '1800', '', '5', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('129', '5', '748', '25', '001', '2017-09-25', '12', '1800', '', '6', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('130', '5', '753', '25', '001', '2017-09-25', '12', '1800', '', '6', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('131', '5', '749', '25', '001', '2017-09-25', '12', '1800', '', '3', '1800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('132', '5', '354', '25', '001', '2017-09-25', '12', '3500', '', '3', '3500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('133', '5', '802', '25', '001', '2017-09-25', '12', '47', '', '24', '47', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('134', '5', '355', '25', '001', '2017-09-25', '12', '200', '', '3', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('135', '5', '356', '25', '001', '2017-09-25', '12', '200', '', '3', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('136', '5', '357', '25', '001', '2017-09-25', '12', '200', '', '26', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('137', '5', '358', '25', '001', '2017-09-25', '12', '200', '', '12', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('138', '5', '359', '25', '001', '2017-09-25', '12', '200', '', '7', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('139', '5', '360', '25', '001', '2017-09-25', '12', '1000', '', '1', '1000', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('140', '5', '606', '25', '001', '2017-09-25', '12', '500', '', '1', '500', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('141', '5', '362', '25', '001', '2017-09-25', '12', '800', '', '3', '800', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('142', '5', '363', '25', '001', '2017-09-25', '12', '400', '', '5', '400', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('143', '5', '364', '25', '001', '2017-09-25', '12', '200', '', '7', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('144', '5', '365', '25', '001', '2017-09-25', '12', '200', '', '3', '200', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('145', '5', '366', '25', '001', '2017-09-25', '12', '250', '', '3', '250', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('146', '5', '367', '25', '001', '2017-09-25', '12', '250', '', '4', '250', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('147', '5', '368', '25', '001', '2017-09-25', '12', '350', '', '9', '350', '0', '', '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_invoice_items` ###

INSERT INTO `0_supp_invoice_items` VALUES
('1', '1', '20', '5011', '-1', '0', '', NULL, '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('2', '1', '20', '0', '1', '1', '540', 'CHAIR AQUARIUM  ', '0', '0', '1700', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('3', '1', '20', '0', '2', '2', '541', 'CHAIR VELVET ', '0', '0', '5950', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('4', '2', '20', '0', '3', '3', '151', 'SHRIMPS WHITE BAG 2KG ', '2', '1100', '187', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('5', '2', '20', '0', '4', '4', '152', 'SHRIMPS 16/20 ', '8', '1200', '204', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('6', '2', '20', '0', '5', '5', '109', 'Chicken Bone Local', '8', '90', '15.3', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('7', '2', '20', '0', '6', '6', '106', 'Chicken Brest Locale ', '4', '360', '61.2', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('8', '2', '20', '0', '7', '7', '103', 'Chicken Thai Boneless K&amp;Ns', '4.3', '400', '68', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('9', '2', '20', '0', '8', '8', '101', 'Chicken Fillet 110 to 120 grams K&amp;Ns', '50', '420', '71.4', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('10', '2', '20', '0', '9', '9', '104', 'Chicken Nablets Wings K&amp;Ns', '10', '290', '49.3', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('11', '2', '20', '0', '10', '10', '107', 'Chicken 9Cut with Skin', '72', '50', '8.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('12', '2', '20', '0', '11', '11', '530', 'GLASS 50ML MINI ', '60', '50', '8.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('13', '2', '20', '0', '12', '12', '532', 'SOUP CONTINENTS BOWL  ', '30', '50', '8.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('14', '2', '20', '0', '13', '13', '533', 'SOUP CONTINENTS TRAY', '6', '100', '17', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('15', '2', '20', '0', '14', '14', '154', 'SHRIMPS GLOBAL ', '6', '1000', '170', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('16', '2', '20', '0', '15', '15', '153', 'SHRIMPS 21/25', '7', '1300', '221', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('17', '2', '20', '0', '16', '16', '102', 'Chicken Thai Boneless (locale)', '3', '350', '59.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('18', '2', '20', '0', '17', '17', '004', 'Beef Waste left from Cleaning ', '7', '1050', '178.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('19', '2', '20', '0', '18', '18', '803', '7up 300ml can', '36', '47', '7.99', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('20', '2', '20', '0', '19', '19', '814', 'pappsi 300ml can', '12', '47', '7.99', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('21', '2', '20', '0', '20', '20', '808', '7up 1.5liter', '12', '80', '13.6', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('22', '2', '20', '0', '21', '21', '807', 'sprite 1.5liter', '6', '80', '13.6', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('23', '2', '20', '0', '22', '22', '516', 'TABLE NAPKIN ', '265', '80', '13.6', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('24', '2', '20', '0', '23', '23', '515', 'NAPKIN RINGS ', '98', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('25', '2', '20', '0', '24', '24', '702', 'PACKING BAG PRINTED (KHAKHI)', '544', '14', '2.38', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('26', '2', '20', '0', '25', '25', '821', 'nestle pineapple juice 1liter', '5', '140', '23.8', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('27', '2', '20', '0', '26', '26', '818', 'nestle apple juice 1liter', '5', '140', '23.8', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('28', '2', '20', '0', '27', '27', '819', 'nestle red grape 1liter', '6', '180', '30.6', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('29', '2', '20', '0', '28', '28', '817', 'nestle mango juice 1liter', '4', '160', '27.2', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('30', '2', '20', '0', '29', '29', '204', 'MILK PACK MILK 1 LTTER ', '3', '130', '22.1', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('31', '2', '20', '0', '30', '30', '316', 'paprika powder', '4', '50', '8.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('32', '2', '20', '0', '31', '31', '320', 'coconut careem powder', '4', '150', '25.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('33', '2', '20', '0', '32', '32', '705', 'TISSUE BOX ANTIQUE ', '50', '40', '6.8', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('34', '2', '20', '0', '33', '33', '537', 'COFFEE CUP DISPOSABLE LID', '100', '1', '0.17', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('35', '2', '20', '0', '34', '34', '536', 'COFFEE CUP DISPOSABLE ', '80', '6', '1.02', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('36', '2', '20', '0', '35', '35', '327', 'Black pepper', '7.75', '1500', '255', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('37', '2', '20', '0', '36', '36', '822', 'AQUA FINA WATER 500ML ', '109', '30', '5.1', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('38', '2', '20', '0', '37', '37', '203', 'PREEMA MILK ', '4', '140', '23.8', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('39', '2', '20', '0', '38', '38', '416', 'Birds chilli', '4', '250', '42.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('40', '2', '20', '0', '39', '39', '201', 'Fresh Cream ', '12', '290', '49.3', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('41', '2', '20', '0', '40', '40', '403', 'Cabbage', '4.28', '150', '25.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('42', '2', '20', '0', '41', '41', '413', 'garlic', '6', '290', '49.3', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('43', '2', '20', '0', '42', '42', '410', 'Yellow Capsicum', '0.9', '1000', '170', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('44', '2', '20', '0', '43', '43', '404', 'Green Onion', '3.2', '150', '25.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('45', '2', '20', '0', '44', '44', '417', 'ginger', '1.5', '150', '25.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('46', '2', '20', '0', '45', '45', '412', 'Red Capsicum', '1.35', '1000', '170', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('47', '2', '20', '0', '46', '46', '303', 'Rice Zarafa 2Year Old', '6.4', '170', '28.9', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('48', '2', '20', '0', '47', '47', '314', 'salt ', '18', '22', '3.74', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('49', '2', '20', '0', '48', '48', '312', 'Driey Basile', '1', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('50', '2', '20', '0', '49', '49', '313', 'thyme', '1', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('51', '2', '20', '0', '50', '50', '311', 'tarragon', '1', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('52', '2', '20', '0', '51', '51', '304', 'crackers', '3', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('53', '2', '20', '0', '52', '52', '319', 'TaBasco', '12', '250', '42.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('54', '2', '20', '0', '53', '53', '307', 'Macarino Elbow Big', '5', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('55', '2', '20', '0', '54', '54', '308', 'Bread crambs', '3', '260', '44.2', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('56', '2', '20', '0', '55', '55', '305', 'crispy TamBora', '6', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('57', '2', '20', '0', '56', '56', '309', 'panne Rigate', '4', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('58', '2', '20', '0', '57', '57', '325', 'giree Brada', '1', '600', '102', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('59', '2', '20', '0', '58', '58', '306', 'fittaccine pasta', '1', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('60', '2', '20', '0', '59', '59', '321', 'chicken soup cube', '2', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('61', '2', '20', '0', '60', '60', '322', 'Dami glass Bass', '1', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('62', '2', '20', '0', '61', '61', '205', 'YELLOW BUTTER FRESH', '2', '460', '78.2', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('63', '2', '20', '0', '62', '62', '302', 'Mamasitta Suace 4kg ', '2', '2400', '408', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('64', '2', '20', '0', '63', '63', '326', 'Tikka Masala', '1', '50', '8.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('65', '3', '20', '0', '64', '64', '001', 'Beef Tenderloin without Head ', '0', '0', '17', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('66', '4', '20', '0', '65', '65', '537', 'COFFEE CUP DISPOSABLE LID', '4500', '2', '0.34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('67', '4', '20', '0', '66', '66', '504', 'RECT SERVING PLATE 33CM', '67', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('68', '4', '20', '0', '67', '67', '503', 'SQ DINNER PLATE 27CM', '69', '750', '127.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('69', '4', '20', '0', '68', '68', '502', 'SQ DESSERT PLATE 21CM', '32', '400', '68', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('70', '4', '20', '0', '69', '69', '507', 'BUTTER DISH WITH COVER', '24', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('71', '4', '20', '0', '70', '70', '509', 'SQ SOUP BOWL 14CM', '3', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('72', '4', '20', '0', '71', '71', '534', 'COFFEE MUG PORCILEN ', '166', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('73', '4', '20', '0', '72', '72', '538', 'ICE CREAM BOWL DISPOSABLE ', '4000', '9', '1.53', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('74', '4', '20', '0', '73', '73', '536', 'COFFEE CUP DISPOSABLE ', '4500', '6', '1.02', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('75', '4', '20', '0', '74', '74', '542', 'STOOL GOLDEN BLACK ', '4', '13000', '2210', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('76', '4', '20', '0', '75', '75', '543', 'GLASS JUG FOR ICE TEA ', '16', '1200', '204', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('77', '4', '20', '0', '76', '76', '517', 'SOUP BOWL CHINA ', '70', '325', '55.25', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('78', '4', '20', '0', '77', '77', '518', 'SOUP SAUCER CHINA ', '28', '100', '17', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('79', '4', '20', '0', '78', '78', '528', 'GLASS 350ML JUICE LONG ', '48', '1100', '187', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('80', '4', '20', '0', '79', '79', '529', 'GLASS 300ML WATER (WINE) ', '48', '850', '144.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('81', '4', '20', '0', '80', '80', '531', 'PLATE VERSECE LOGO ', '88', '1100', '187', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('82', '4', '20', '0', '81', '81', '505', 'RECT SERVING BOWL 22.5CM', '4', '650', '110.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('83', '4', '20', '0', '82', '82', '540', 'CHAIR AQUARIUM  ', '12', '10000', '1700', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('84', '4', '20', '0', '83', '83', '541', 'CHAIR VELVET ', '7', '35000', '5950', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('85', '4', '20', '0', '84', '84', '506', 'SQ Soup PLATE 20.5CM', '22', '650', '110.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('86', '5', '20', '0', '85', '85', '328', 'WHITE CHEESE THREE COW 1/2 KG BLOCK ', '2', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('87', '5', '20', '0', '86', '86', '329', 'CHICKEN SAUSAGES  ', '1', '350', '59.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('88', '5', '20', '0', '87', '87', '330', 'LEAPED MIRROR GLASS (CAKE)', '5', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('89', '5', '20', '0', '88', '88', '707', 'STEAK TORCH ', '6', '1200', '204', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('90', '5', '20', '0', '89', '89', '543', 'GLASS JUG FOR ICE TEA ', '8', '1200', '204', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('91', '5', '20', '0', '90', '90', '708', 'DIGITAL SCREEN FOR MENU', '25', '1200', '204', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('92', '5', '20', '0', '91', '91', '331', 'MANGO PUREE MONTIBINACO 4KG ', '1', '8000', '1360', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('93', '5', '20', '0', '92', '92', '333', 'STRAWBERRY PUREE MONTIBINACO 4KG ', '1', '8500', '1445', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('94', '5', '20', '0', '93', '93', '334', 'SOYA SAUCE DARK 2 LITER (LEE KUM KI )', '4', '400', '68', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('95', '5', '20', '0', '94', '94', '335', 'SOYA SAUCE LIGHT 2 LITER (LEE KUM KI )', '7', '400', '68', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('96', '5', '20', '0', '95', '95', '336', 'SWEET VINEGAR ', '7', '450', '76.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('97', '5', '20', '0', '96', '96', '337', 'TAPAL DANEDAR TEA 1/2 KG ', '2', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('98', '5', '20', '0', '97', '97', '338', 'LIPTON GREEN TEA MINT 25PCS ', '4', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('99', '5', '20', '0', '98', '98', '339', 'LIPTON GREEN TEA SENCHA 30PCS ', '2', '450', '76.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('100', '5', '20', '0', '99', '99', '340', 'LIPTON GREEN TEA ROSEHIP 25PCS ', '2', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('101', '5', '20', '0', '100', '100', '341', 'LIPTON GREEN TEA CAMOMILE 30PCS ', '2', '450', '76.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('102', '5', '20', '0', '101', '101', '342', 'LIPTON GREEN TEA PURE BLACK 25 PCS ', '2', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('103', '5', '20', '0', '102', '102', '343', 'LIPTON GREEN TEA LEMON 25 PCS ', '5', '300', '51', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('104', '5', '20', '0', '103', '103', '344', 'LIPTON YELLOW LABEL SACHET 100 PCS PACK ', '4', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('105', '5', '20', '0', '104', '104', '345', 'LIPTON ICED TEA SACHET ', '48', '100', '17', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('106', '5', '20', '0', '105', '105', '347', 'RIPPY TOPPING CARAMEL ', '1', '1500', '255', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('107', '5', '20', '0', '106', '106', '348', 'RIPPY TOPPING MANGOO', '2', '1500', '255', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('108', '5', '20', '0', '107', '107', '349', 'RIPPY TOPPING CHOCOLATE ', '2', '1500', '255', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('109', '5', '20', '0', '108', '108', '206', 'WHITE BUTTER ', '7', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('110', '5', '20', '0', '109', '109', '207', 'HICO VANILA ICE CREAM 2 LITTER ', '3', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('111', '5', '20', '0', '110', '110', '205', 'YELLOW BUTTER FRESH', '11', '460', '78.2', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('112', '5', '20', '0', '111', '111', '350', 'FRENCH FRIES Mccain 2.5kg ', '8', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('113', '5', '20', '0', '112', '112', '351', 'MOZERELLA CHEESE ADAMS 2KG BLOCK ', '2', '2000', '340', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('114', '5', '20', '0', '113', '113', '352', 'MILK CHOCOLATE 1 KG PACK COLLATA ', '18', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('115', '5', '20', '0', '114', '114', '353', 'WHITE CHOCOLATE 1 KG PACK COLLATA ', '19', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('116', '5', '20', '0', '115', '115', '750', 'FABRI MIXY BAR - MANGO', '5', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('117', '5', '20', '0', '116', '116', '742', 'FABRI MIXY CAFE - CINNAMON', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('118', '5', '20', '0', '117', '117', '752', 'FABRI MIXY BAR - PEACH', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('119', '5', '20', '0', '118', '118', '744', 'FABRI MIXY CAFE - HAZELNUT', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('120', '5', '20', '0', '119', '119', '741', 'FABRI MIXY CAFE - CARAMEL', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('121', '5', '20', '0', '120', '120', '747', 'FABRI MIXY BAR - COCONUT', '3', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('122', '5', '20', '0', '121', '121', '745', 'FABRI MIXY CAFE - IRISH CREAM', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('123', '5', '20', '0', '122', '122', '751', 'FABRI MIXY BAR - ORANGE', '4', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('124', '5', '20', '0', '123', '123', '746', 'FABRI MIXY CAFE - VANILLA', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('125', '5', '20', '0', '124', '124', '756', 'FABRI MIXY BAR - ROSE', '5', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('126', '5', '20', '0', '125', '125', '757', 'FABRI MIXY BAR - STRAWBERRY', '1', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('127', '5', '20', '0', '126', '126', '755', 'FABRI MIXY BAR - RASPBERRY', '2', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('128', '5', '20', '0', '127', '127', '754', 'FABRI MIXY BAR - POMEGRANATE', '3', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('129', '5', '20', '0', '128', '128', '755', 'FABRI MIXY BAR - RASPBERRY', '5', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('130', '5', '20', '0', '129', '129', '748', 'FABRI MIXY BAR - KIWI', '6', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('131', '5', '20', '0', '130', '130', '753', 'FABRI MIXY BAR - PINEAPPLE', '6', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('132', '5', '20', '0', '131', '131', '749', 'FABRI MIXY BAR - LEMON', '3', '1800', '306', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL);
INSERT INTO `0_supp_invoice_items` VALUES
('133', '5', '20', '0', '132', '132', '354', 'LAVAZZA ESSPRESSO COFFEE 1 KG ', '3', '3500', '595', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('134', '5', '20', '0', '133', '133', '802', 'DIET 7UP 300ML CAN ', '24', '47', '7.99', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('135', '5', '20', '0', '134', '134', '355', 'BAMBOO SHOOT TIN ', '3', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('136', '5', '20', '0', '135', '135', '356', 'SWEET CORN TIN ', '3', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('137', '5', '20', '0', '136', '136', '357', 'BABY CORN ', '26', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('138', '5', '20', '0', '137', '137', '358', 'BAMBOO SHOOT HALVES TIN', '12', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('139', '5', '20', '0', '138', '138', '359', 'AIRWIK FRESHENER 175GM  ', '7', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('140', '5', '20', '0', '139', '139', '360', 'AIRWIK DIFFUSER  MACHINE ', '1', '1000', '170', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('141', '5', '20', '0', '140', '140', '606', 'SURGICAL GLOVES ', '1', '500', '85', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('142', '5', '20', '0', '141', '141', '362', 'MELAPINE PINEAPPLE SLICE 3KG ', '3', '800', '136', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('143', '5', '20', '0', '142', '142', '363', 'DELMONT PINEAPPLE JUICE 1.36 LITER ', '5', '400', '68', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('144', '5', '20', '0', '143', '143', '364', 'POLAC MILK 390 GRAMS ', '7', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('145', '5', '20', '0', '144', '144', '365', 'YELLOW CLING PEACH HALVES IN SYRUP 820GMS ', '3', '200', '34', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('146', '5', '20', '0', '145', '145', '366', 'LYCHEE READY TO EAT 365 GM ', '3', '250', '42.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('147', '5', '20', '0', '146', '146', '367', 'COCONUT MILK 400GMS ', '4', '250', '42.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('148', '5', '20', '0', '147', '147', '368', 'RED CHERRY SYRUP 240GMS ', '9', '350', '59.5', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('149', '6', '20', '0', '151', '151', '001', 'BEEF TENDERLOIN WITHOUT HEAD', '0', '0', '17', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL),
('150', '7', '20', '5011', '-1', '0', '', NULL, '0', '0', '0', 'BALOON HAS BEEN RECEIVED, TESTING ENTRY', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0000-00-00', '0000-00-00', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', NULL);

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
  `text_4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_5` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opening` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_supp_trans` ###

INSERT INTO `0_supp_trans` VALUES
('1', '20', '12', 'PI001/09/2017', '001', '2017-09-22', '2017-09-22', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2', '20', '12', 'PI002/09/2017', '002', '2017-09-22', '2017-12-21', '177488', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('3', '20', '10', 'PI003/09/2017', 'PI003/09/2017', '2017-09-22', '2017-12-21', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4', '20', '12', 'PI003/09/2017', '003', '2017-09-25', '2017-12-24', '872100', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('5', '20', '12', 'PI004/09/2017', '004', '2017-09-25', '2017-12-24', '285888', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6', '20', '10', 'PI001/10/2017', '11', '2017-10-02', '2017-12-31', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL),
('7', '20', '12', 'PI001/10/2017', '786', '2017-10-05', '2017-10-06', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL),
('1', '41', '12', 'CPV001/10/2017', '', '2017-10-05', '0000-00-00', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES
('1', 'K&amp;Ns Chickens ', 'K&amp;Ns Chickens ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('2', 'H Super Mart ', 'H Super Mart ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('3', 'Imtiyaz Super Store ', 'Imtiyaz Super Store ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('4', 'Metro Cash &amp; Carry ', 'Metro Cash &amp; Carry ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('5', 'Sohail Vegetables ', 'Sohail Vegetables ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('6', 'Daily Veg 9 Maqsood butt ', 'Daily Veg 9 Maqsood butt ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('7', 'SBS Sea Food', 'SBS Sea Food', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '1', '0', '', '2011', '5016', '', '0', '0'),
('8', 'Chicken Local  ', 'Chicken Local  ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('9', 'Nova Publishing ', 'Nova Publishing ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('10', 'Biotech Packages ', 'Biotech Packages ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('11', 'Rizwan Bulk Cleaning Supplies ', 'Rizwan Bulk Cleaning Supplies ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('12', 'Cash Purchase Locale ', 'Cash Purchase Locale ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0'),
('13', 'Cash Purchase Imported ', 'Cash Purchase Imported ', '', '', '', '', '', '', '', 'PKR', '5', '0', '0', '0', '2', '0', '', '2011', '5016', '', '0', '0');

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
('alt_uom', 'gl_setup.general', 'tinyint', '1', '1'),
('alternative_tax_include_on_docs', 'setup.company', 'tinyint', '1', ''),
('auto_curr_reval', 'setup.company', 'smallint', '6', ''),
('bank_account', 'setup.company', 'varchar', '40', ''),
('bank_charge_act', 'glsetup.general', 'varchar', '15', '5036'),
('bank_details', 'setup.company', 'tinytext', '0', ''),
('base_sales', 'setup.company', 'int', '11', '1'),
('bcc_email', 'setup.company', 'varchar', '100', ''),
('company_logo_report', 'setup.company', 'tinyint', '1', '0'),
('coy_logo', 'setup.company', 'varchar', '100', 'Untitled-2.jpg'),
('coy_name', 'setup.company', 'varchar', '60', 'Antique Cafe Pvt. Ltd,'),
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
('postal_address', 'setup.company', 'tinytext', '0', ''),
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
('sales_quotation', ''),
('sale_order_entry', ''),
('delivery_against', ''),
('customer_credit_note', ''),
('invoice_against', '1'),
('direct_invoice', '1'),
('customer_payment', '1'),
('allocate', ''),
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
('foreign_item_codes', ''),
('sales_kits', ''),
('item_categories', '1'),
('inventory_locations', '1'),
('unit_measure', '1'),
('recorder_levels', '1'),
('import_csv', ''),
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
('invoice_prepaid_order_text', 'Invoice Prepaid Orders'),
('invoice_prepaid_order', ''),
('sales_quotation', ''),
('sale_order_entry', ''),
('delivery_against', ''),
('customer_credit_note', ''),
('invoice_against', '1'),
('direct_invoice', '1'),
('customer_payment', '1'),
('allocate', ''),
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
('foreign_item_codes', ''),
('sales_kits', ''),
('item_categories', '1'),
('inventory_locations', '1'),
('unit_measure', '1'),
('recorder_levels', '1'),
('import_csv', ''),
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
('invoice_prepaid_order', ''),
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_trans_tax_details` ###

INSERT INTO `0_trans_tax_details` VALUES
('1', '20', '1', '2017-09-22', '0', '0', '1', '0', '0', '0', '001', '1'),
('2', '20', '2', '2017-09-22', '0', '0', '1', '0', '177488', '0', '002', '1'),
('3', '20', '3', '2017-09-22', '0', '0', '1', '0', '0', '0', 'PI003/09/2017', '1'),
('4', '20', '4', '2017-09-25', '0', '0', '1', '0', '872100', '0', '003', '1'),
('5', '20', '5', '2017-09-25', '0', '0', '1', '0', '285888', '0', '004', '1'),
('9', '20', '6', '2017-10-02', '0', '0', '1', '0', '0', '0', '11', '1');

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
('2', 'DEF', '20', '0'),
('3', '21', '3', '0'),
('4', 'DEF', '22', '0'),
('5', 'DEF', '24', '0'),
('6', 'DEF', '25', '0'),
('7', 'DEF', '26', '0'),
('8', '21', '0', '0'),
('9', 'DEF', '21', '0'),
('10', '001', '21', '0'),
('11', '001', '12', '0'),
('12', '003', '21', '0'),
('13', '002', '21', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=4340 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;

### Data of table `0_useronline` ###

INSERT INTO `0_useronline` VALUES
('4324', '1507189689', '125.209.90.232', '/admin/void_transaction.php'),
('4325', '1507189694', '125.209.90.232', '/admin/void_transaction.php'),
('4326', '1507189697', '125.209.90.232', '/admin/void_transaction.php'),
('4327', '1507189704', '125.209.90.232', '/admin/void_transaction.php'),
('4328', '1507189707', '125.209.90.232', '/admin/void_transaction.php'),
('4329', '1507189718', '125.209.90.232', '/admin/void_transaction.php'),
('4330', '1507189721', '125.209.90.232', '/admin/void_transaction.php'),
('4331', '1507189724', '125.209.90.232', '/admin/void_transaction.php'),
('4332', '1507189734', '125.209.90.232', '/admin/void_transaction.php'),
('4333', '1507189741', '125.209.90.232', '/admin/void_transaction.php'),
('4334', '1507189745', '125.209.90.232', '/admin/void_transaction.php'),
('4335', '1507189749', '125.209.90.232', '/admin/void_transaction.php'),
('4336', '1507189751', '125.209.90.232', '/admin/void_transaction.php'),
('4337', '1507189796', '125.209.90.232', '/index.php'),
('4338', '1507189799', '125.209.90.232', '/index.php'),
('4339', '1507189799', '125.209.90.232', '/admin/backups.php');

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
('12', 'admin', 'e6a932cc8ec3516c62a37100f2ca9beb', 'Admin', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-02 16:46:09', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('21', 'haroon', '527daa062ef9fefd7c093c288cbae278', 'Haroon Elahi', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-02 14:20:25', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('24', 'mehwish', '792ef3891ffee9f53a9adb92aa2d2d9d', '', '9', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('25', 'sabbih ', 'e3e37bcd0ba6a5285afc13234114db58', '', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-10-05 11:11:27', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('26', 'sadaqat', '947473a570e6369d02addaf936ed8e06', '', '4', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', NULL, '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0'),
('27', 'shoaib', 'cef53db0c24188168b9fbca30fac8f61', '', '2', '', NULL, 'C', '1', '2', '0', '0', 'premium', 'A4', '2', '2', '4', '1', '1', '1', '1', '2017-09-27 13:05:56', '10', '1', '1', '', '1', '0', 'dashboard', '30', '0', '1', '0', '0', '0');

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
('20', '1', '2017-09-22', ''),
('20', '3', '2017-09-22', ''),
('20', '6', '2017-10-02', ''),
('20', '7', '2017-10-05', ''),
('25', '1', '2017-09-22', ''),
('25', '3', '2017-09-22', ''),
('25', '9', '2017-10-02', ''),
('41', '1', '2017-10-05', '');

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
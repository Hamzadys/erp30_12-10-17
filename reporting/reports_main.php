<?php

$path_to_root="..";
$page_security = 'SA_OPEN';
include_once($path_to_root . "/includes/session.inc");

include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/data_checks.inc");
include_once($path_to_root . "/includes/ui.inc");
include_once($path_to_root . "/reporting/includes/reports_classes.inc");
$js = "";
if ($SysPrefs->use_popup_windows && $SysPrefs->use_popup_search)
	$js .= get_js_open_window(900, 500);
if (user_use_date_picker())
	$js .= get_js_date_picker();

add_js_file('reports.js');

page(_($help_context = "Reports and Analysis"), false, false, "", $js);

$reports = new BoxReports;

$dim = get_company_pref('use_dimension');

$reports->addReportClass(_('Customer Reports'), RC_CUSTOMER);
$reports->addReport(RC_CUSTOMER, 101, _('Customer &Balances'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Show Balance') => 'YES_NO',
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1011, _('Cust &Bal - Detailed 1'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Sales Areas') => 'ZONES',
			_('Sales Man') => 'SALESMEN',			
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1012,_('Cust Bal - Detailed 2'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Sales Areas') => 'ZONES',
			_('Sales Man') => 'SALESMEN',			
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 10141, _('Customer Outstanding Summary Report'),
    array(	_('Start Date') => 'DATEBEGIN',
        _('End Date') => 'DATEENDM',
        _('Customer') => 'CUSTOMERS_NO_FILTER',
        _('Branch') => 'BRANCH_LIST',
        _('Sales Areas') => 'ZONES',
        _('Sales Man') => 'SALESMEN',
        _('Groupwise') => 'GROUPS',
        _('Currency Filter') => 'CURRENCY',
        _('Suppress Zeros') => 'YES_NO',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION',
        _('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1013,_('Cust Bal - Branch Wise'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Sales Areas') => 'ZONES',
			_('Sales Man') => 'SALESMEN',			
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1014, _('Customer Balances Summary'),
	array(	_('End Date') => 'DATE',
			_('Customer') => 'CUSTOMERS_NO_FILTER',		
			_('Sales Areas') => 'ZONES',
			_('Sales Man') => 'SALESMEN',				
			_('Currency Filter') => 'CURRENCY',
			//_('Show Also Allocated') => 'YES_NO',
			_('Suppress Zeros') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1015 ,_('Customer Movements'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1016 , _('Customer &Receipts'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Sales Areas') => 'ZONES',
			_('Sales Man') => 'SALESMEN',			
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
 			_('Summary Only') => 'YES_NO',
			_('Comments') => 'TEXTBOX',			
			_('Destination') => 'DESTINATION'));

$reports->addReport(RC_CUSTOMER, 1017, _('Salesman Balances'),
	       array(	_('Start Date') => 'DATE',
			_('End Date') => 'DATE',	
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));

$reports->addReport(RC_CUSTOMER, 1018, _('&Salesman Recovery - Summary'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Sales Man') => 'SALESMEN',
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1019, _('Month Wise Sales Comparison'),
    array(//	_('Start Date') => 'DATEBEGINM',
       // _('End Date') => 'DATEENDM',
        _('Inventory Category') => 'CATEGORIES',
       // _('Location') => 'LOCATIONS',
      //  _('Customer') => 'CUSTOMERS_NO_FILTER',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION',
        _('Destination') => 'DESTINATION'));			
$reports->addReport(RC_CUSTOMER, 102, _('&Aged Customer Analysis'),
	array(	_('End Date') => 'DATE',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Currency Filter') => 'CURRENCY',
			_('Show Also Allocated') => 'YES_NO',
			_('Summary Only') => 'YES_NO',
			_('Suppress Zeros') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 1021, _('Customer Sales History'),
	array(	
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Sales Areas') => 'ZONES',
			_('Sales Man') => 'SALESMEN',				
			_('Currency Filter') => 'CURRENCY',
			_('Comments') => 'TEXTBOX',
			_('Destination') => 'DESTINATION'));


$reports->addReport(RC_CUSTOMER, 103, _('Customer &Detail Listing'),
	array(	_('Activity Since') => 'DATEBEGIN',
			_('Sales Areas') => 'AREAS',
			_('Sales Folk') => 'SALESMEN',
			_('Activity Greater Than') => 'TEXT',
			_('Activity Less Than') => 'TEXT',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 114, _('Sales &Summary Report'),
	array(	_('Start Date') => 'DATEBEGINTAX',
			_('End Date') => 'DATEENDTAX',
			_('Tax Id Only') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 104, _('&Price Listing'),
	array(	_('Currency Filter') => 'CURRENCY',
			_('Inventory Category') => 'CATEGORIES',
			_('Sales Types') => 'SALESTYPES',
			_('Show Pictures') => 'YES_NO',
			_('Show GP %') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));

$reports->addReport(RC_CUSTOMER, 105, _('&Order Status Listing'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Stock Location') => 'LOCATIONS',
			_('Back Orders Only') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_CUSTOMER, 106, _('&Salesman Listing'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Summary Only') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));

$reports->addReportClass(_('Customer Forms'), RC_CUSTOMERFORMS);



$reports->addReport(RC_CUSTOMERFORMS, 107, _('Print &Invoice 1'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));
$reports->addReport(RC_CUSTOMERFORMS, 1070, _('Print &Invoice 2'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));


$reports->addReport(RC_CUSTOMERFORMS, 1071, _('Print &Invoice 3'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_CUSTOMERFORMS, 1072, _('Print &Invoices 4'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_CUSTOMERFORMS, 999, _('Print &Invoice 5'),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Orientation') => 'ORIENTATION'
	));
			$reports->addReport(RC_CUSTOMERFORMS, 20990, _('Print &Invoice 6'),
	array(	_('From') => 'PI',
		_('To') => 'PI',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 1075, _('Print &Invoices 7'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));
			$reports->addReport(RC_CUSTOMERFORMS, 10722, _('Print &Invoices 8'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
//petro
$reports->addReport(RC_CUSTOMERFORMS, 1076, _('Print Sales Tax &Invoices 8'),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 10711, _('Print Commercial &Invoice 9'),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));
$reports->addReport(RC_CUSTOMERFORMS, 10712, _('Print Zero percent Sales Tax '),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 10713, _('Print Performa &Invoice'),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 1078, _('Print &Invoices 10'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
//petro end
/*
$reports->addReport(RC_CUSTOMERFORMS, 1077, _('Print &Invoices - new'),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Orientation') => 'ORIENTATION'
	));
*/


$reports->addReport(RC_CUSTOMERFORMS, 1073, _('Print Sales Tax &Invoice 1'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));
$reports->addReport(RC_CUSTOMERFORMS, 10730, _('Print Sales Tax &Invoice 2'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));
$reports->addReport(RC_CUSTOMERFORMS, 1077, _('Print Sales Tax &Invoice 3'),
    array(	_('From') => 'INVOICE',
        _('To') => 'INVOICE',
        _('Currency Filter') => 'CURRENCY',
        _('email Customers') => 'YES_NO',
        _('Payment Link') => 'PAYMENT_LINK',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION'));
        
        

$reports->addReport(RC_CUSTOMERFORMS, 10731, _('Print Sales Tax &Invoice 4'),
	array(	_('From') => 'INVOICE',
		_('To') => 'INVOICE',
		_('Currency Filter') => 'CURRENCY',
		_('email Customers') => 'YES_NO',
		_('Payment Link') => 'PAYMENT_LINK',
		_('Comments') => 'TEXTBOX',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Orientation') => 'ORIENTATION'
	));
        
        
        
        $reports->addReport(RC_CUSTOMERFORMS, 1074, _('Print &Commercial Invoice'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));


$reports->addReport(RC_CUSTOMERFORMS, 1079, _('Print Sales Tax &Invoice (R)'),
	array(	_('From') => 'INVOICE',
			_('To') => 'INVOICE',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Orientation') => 'ORIENTATION'
));
			$reports->addReport(RC_CUSTOMERFORMS, 109, _('&Print Sales Orders 1'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_CUSTOMERFORMS, 1090, _('&Print Sales Orders 2'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
	
$reports->addReport(RC_CUSTOMERFORMS, 1092, _('&Print Sales Orders 3'),
    array(	_('From') => 'ORDERS',
        _('To') => 'ORDERS',
        _('Currency Filter') => 'CURRENCY',
        _('Email Customers') => 'YES_NO',
        _('Print as Quote') => 'YES_NO',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION'));
        
$reports->addReport(RC_CUSTOMERFORMS, 1009, _('&Print Sales Orders 4'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_CUSTOMERFORMS, 10911, _('&Print Sales Orders 5'),
    array(	_('From') => 'ORDERS',
        _('To') => 'ORDERS',
        _('Currency Filter') => 'CURRENCY',
        _('Email Customers') => 'YES_NO',
        _('Print as Quote') => 'YES_NO',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION'));
          
        $reports->addReport(RC_CUSTOMERFORMS, 109011, _('&Print Sales Orders 6'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
   		$reports->addReport(RC_CUSTOMERFORMS, 1091, _('&Print Sales Order - POS'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
//PETRO REPORTS
$reports->addReport(RC_CUSTOMERFORMS, 1095, _('&Print Sales Orders 7'),
	array(	_('From') => 'ORDERS',
		_('To') => 'ORDERS',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Print as Quote') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 1096, _('Sale &Order - Detailed'),
	array(	_('Start Date') => 'DATEBEGIN',
		_('End Date') => 'DATEENDM',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Sales Areas') => 'ZONES',
		_('Sales Man') => 'SALESMEN',
		_('Currency Filter') => 'CURRENCY',
		_('Suppress Zeros') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION',
		_('SALES GROUP') => 'SALESGROUP'
	));
//
$reports->addReport(RC_CUSTOMERFORMS, 110, _('Print &Deliveries 1'),
	array(	_('From') => 'DELIVERY',
			_('To') => 'DELIVERY',
			_('email Customers') => 'YES_NO',
			_('Print as Packing Slip') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			
$reports->addReport(RC_CUSTOMERFORMS, 1100, _('Print &Deliveries 2'),
	array(	_('From') => 'DELIVERY',
			_('To') => 'DELIVERY',
			_('email Customers') => 'YES_NO',
			_('Print as Packing Slip') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
	
$reports->addReport(RC_CUSTOMERFORMS, 1101, _('Print &Deliveries 3'),
	array(	_('From') => 'DELIVERY',
		_('To') => 'DELIVERY',
		_('email Customers') => 'YES_NO',
		_('Print as Packing Slip') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

/*$reports->addReport(RC_CUSTOMERFORMS, 1101, _('Print &Deliveries - 2'),
	array(	_('From') => 'DELIVERY',
		_('To') => 'DELIVERY',
		_('email Customers') => 'YES_NO',
		_('Print as Packing Slip') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION')); */

$reports->addReport(RC_CUSTOMERFORMS, 11000, _('Print &Deliveries 4'),
	array(	_('From') => 'DELIVERY',
			_('To') => 'DELIVERY',
			_('email Customers') => 'YES_NO',
			_('Print as Packing Slip') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 110010, _('Print &Deliveries 5'),
	array(	_('From') => 'DELIVERY',
		_('To') => 'DELIVERY',
		_('email Customers') => 'YES_NO',
		_('Print as Packing Slip') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));
		$reports->addReport(RC_CUSTOMERFORMS, 11011, _('Print &Deliveries 6'),
	array(	_('From') => 'DELIVERY',
			_('To') => 'DELIVERY',
			_('email Customers') => 'YES_NO',
			_('Print as Packing Slip') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
//PETRO
$reports->addReport(RC_CUSTOMERFORMS, 1106, _('Print &Deliveries7'),
	array(	_('From') => 'DELIVERY',
		_('To') => 'DELIVERY',
		_('email Customers') => 'YES_NO',
		_('Print as Packing Slip') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

/*$reports->addReport(RC_CUSTOMERFORMS, 109, _('&Print Sales Orders 4'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));*/
		/*	$reports->addReport(RC_CUSTOMERFORMS, 1009, _('&Print Sales Orders 5'),
	array(	_('From') => 'ORDERS',
			_('To') => 'ORDERS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Print as Quote') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));*/


$reports->addReport(RC_CUSTOMERFORMS, 1105, _('Print &Deliveries(R) 8'),
	array(	_('From') => 'DELIVERY',
			_('To') => 'DELIVERY',
			_('email Customers') => 'YES_NO',
			_('Print as Packing Slip') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 111, _('&Print Sales Quotations 1'),
	array(	_('From') => 'QUOTATIONS',
			_('To') => 'QUOTATIONS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			     $reports->addReport(RC_CUSTOMERFORMS, 1110, _('&Print Sales Quotations 2'),
    array(	_('From') => 'QUOTATIONS',
        _('To') => 'QUOTATIONS',
        _('Currency Filter') => 'CURRENCY',
        _('Email Customers') => 'YES_NO',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION'));
        
$reports->addReport(RC_CUSTOMERFORMS, 11100, _('&Print Sales Quotations 3'),
	array(	_('From') => 'QUOTATIONS',
			_('To') => 'QUOTATIONS',
			_('Currency Filter') => 'CURRENCY',
			_('Email Customers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 11102, _('&Print Sales Quotations(Pti)'),
	array(	_('From') => 'QUOTATIONS',
		_('To') => 'QUOTATIONS',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_CUSTOMERFORMS, 11103, _('&Print Zero percent Sales Quotations '),
	array(	_('From') => 'QUOTATIONS',
		_('To') => 'QUOTATIONS',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));
$reports->addReport(RC_CUSTOMERFORMS, 11104, _('&Print Commercial Quotations '),
	array(	_('From') => 'QUOTATIONS',
		_('To') => 'QUOTATIONS',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_CUSTOMERFORMS, 108, _('Print &Statements'),
	array(	_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Currency Filter') => 'CURRENCY',
			_('Show Also Allocated') => 'YES_NO',
			_('Email Customers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_CUSTOMERFORMS, 113, _('Print &Credit Notes'),
	array(	_('From') => 'CREDIT',
			_('To') => 'CREDIT',
			_('Currency Filter') => 'CURRENCY',
			_('email Customers') => 'YES_NO',
			_('Payment Link') => 'PAYMENT_LINK',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
$reports->addReport(RC_CUSTOMERFORMS, 112, _('Print Receipts'),
	array(	_('From') => 'RECEIPT',
			_('To') => 'RECEIPT',
			_('Currency Filter') => 'CURRENCY',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));


$reports->addReportClass(_('Supplier'), RC_SUPPLIER);
$reports->addReport(RC_SUPPLIER, 201, _('Supplier &Balances'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Supplier') => 'SUPPLIERS_NO_FILTER',
			_('Show Balance') => 'YES_NO',
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_SUPPLIER, 20111, _('Supplier &Balance Detail'),
	array(	_('Start Date') => 'DATEBEGIN',
		_('End Date') => 'DATEENDM',
		_('Supplier') => 'SUPPLIERS_NO_FILTER',
		_('Currency Filter') => 'CURRENCY',
		_('Suppress Zeros') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));

$reports->addReport(RC_SUPPLIER, 101101, _('Purchase &Order Quantity Report(pti)'),
	array(  _('Start Date') => 'DATEBEGIN',
		_('End Date') => 'DATEENDM',
		_('Supplier') => 'SUPPLIERS_NO_FILTER',
		_('Currency Filter') => 'CURRENCY',
		_('Suppress Zeros') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));

$reports->addReport(RC_SUPPLIER, 1011010, _('Purchase &Order Delivery with Unit Price (exclude tax)(pti)'),
	array(  _('Start Date') => 'DATEBEGIN',
		_('End Date') => 'DATEENDM',
		_('Supplier') => 'SUPPLIERS_NO_FILTER',
		_('Currency Filter') => 'CURRENCY',
		_('Suppress Zeros') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));

$reports->addReport(RC_SUPPLIER, 1011012, _('Purchase &Order Delivery with Unit Price (include tax)(pti)'),
	array(  _('Start Date') => 'DATEBEGIN',
		_('End Date') => 'DATEENDM',
		_('Supplier') => 'SUPPLIERS_NO_FILTER',
		_('Currency Filter') => 'CURRENCY',
		_('Suppress Zeros') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));
$reports->addReport(RC_SUPPLIER, 220111, _('Supplier &Ledger  (Rev)'),
	array(	_('Start Date') => 'DATEBEGIN',
		_('End Date') => 'DATEENDM',
		_('Supplier') => 'SUPPLIERS_NO_FILTER',
		_('Currency Filter') => 'CURRENCY',
		_('Suppress Zeros') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));


$reports->addReport(RC_SUPPLIER, 202, _('&Aged Supplier Analyses'),
	array(	_('End Date') => 'DATE',
			_('Supplier') => 'SUPPLIERS_NO_FILTER',
			_('Currency Filter') => 'CURRENCY',
			_('Show Also Allocated') => 'YES_NO',
			_('Summary Only') => 'YES_NO',
			_('Suppress Zeros') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_SUPPLIER, 203, _('&Payment Report'),
	array(	_('End Date') => 'DATE',
			_('Supplier') => 'SUPPLIERS_NO_FILTER',
			_('Currency Filter') => 'CURRENCY',
			_('Suppress Zeros') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_SUPPLIER, 204, _('Outstanding &GRNs Report'),
	array(	_('Supplier') => 'SUPPLIERS_NO_FILTER',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_SUPPLIER, 205, _('Supplier &Detail Listing'),
	array(	_('Activity Since') => 'DATEBEGIN',
			_('Activity Greater Than') => 'TEXT',
			_('Activity Less Than') => 'TEXT',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_SUPPLIER, 209, _('Print Purchase &Orders 1'),
	array(	_('From') => 'PO',
			_('To') => 'PO',
			_('Currency Filter') => 'CURRENCY',
			_('Email Suppliers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_SUPPLIER, 2090, _('Print Purchase &Orders 2'),
	array(	_('From') => 'PO',
			_('To') => 'PO',
			_('Currency Filter') => 'CURRENCY',
			_('Email Suppliers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
$reports->addReport(RC_SUPPLIER, 209111, _('Print Purchase &Orders 3'),
    array(	_('From') => 'PO',
        _('To') => 'PO',
        _('Currency Filter') => 'CURRENCY',
        _('Email Customers') => 'YES_NO',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION'));
        $reports->addReport(RC_SUPPLIER, 2099, _('Print Purchase &Orders 4'),
	array(	_('From') => 'PO',
			_('To') => 'PO',
			_('Currency Filter') => 'CURRENCY',
			_('Email Suppliers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
			$reports->addReport(RC_SUPPLIER, 20999, _('Print Receiving Challan'),
	array(	_('From') => 'GRN',
		_('To') => 'GRN',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));
$reports->addReport(RC_SUPPLIER, 20911, _('Print Purchase &Requisition'),
    array(	_('From') => 'PR',
        _('To') => 'PR',
        _('Currency Filter') => 'CURRENCY',
        _('Email Customers') => 'YES_NO',
        _('Comments') => 'TEXTBOX',
        _('Orientation') => 'ORIENTATION'));

$reports->addReport(RC_SUPPLIER, 2091, _('Print Purchase &Orders (Pti)'),
	array(	_('From') => 'PO',
		_('To') => 'PO',
		_('Currency Filter') => 'CURRENCY',
		_('Email Customers') => 'YES_NO',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION'));
$reports->addReport(RC_SUPPLIER, 210, _('Print Remi&ttances'),
	array(	_('From') => 'REMITTANCE',
			_('To') => 'REMITTANCE',
			_('Currency Filter') => 'CURRENCY',
			_('Email Suppliers') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));

$reports->addReportClass(_('Inventory'), RC_INVENTORY);
$reports->addReport(RC_INVENTORY,  301, _('Inventory &Valuation Report'),
	array(	_('End Date') => 'DATE',
			_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Summary Only') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY,  302, _('Inventory &Planning Report'),
	array(	_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 303, _('Stock &Check Sheets'),
	array(	_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Show Pictures') => 'YES_NO',
			_('Inventory Column') => 'YES_NO',
			_('Show Shortage') => 'YES_NO',
			_('Suppress Zeros') => 'YES_NO',
			_('Item Like') => 'TEXT',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 304, _('Inventory &Sales Report'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Show Service Items') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 3041, _('Inventory &Sales Report - Summary'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Customer') => 'CUSTOMERS_NO_FILTER',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));

$reports->addReport(RC_INVENTORY, 3042, _('Daily &Sales Report New'),
	array(	_('Start Date') => 'DATE',
		_('End Date') => 'DATE',
		_('Inventory Category') => 'CATEGORIES',
		_('Location') => 'LOCATIONS',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 3043, _('Supply Register'),
	array(	_('Start Date') => 'DATEBEGINM',
		_('End Date') => 'DATEENDM',
		_('Inventory Category') => 'CATEGORIES',
		_('Location') => 'LOCATIONS',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Items') => 'ITEMS_P',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));		
$reports->addReport(RC_INVENTORY, 302, _('Daily &Sales Report'),
	array(	_('Start Date') => 'DATE',
		_('End Date') => 'DATE',
		_('Inventory Category') => 'CATEGORIES',
		_('Location') => 'LOCATIONS',
		_('Customer') => 'CUSTOMERS_NO_FILTER',
		_('Comments') => 'TEXTBOX',
		_('Orientation') => 'ORIENTATION',
		_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 305, _('&GRN Valuation Report'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 306, _('Inventory P&urchasing Report'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Supplier') => 'SUPPLIERS_NO_FILTER',
			_('Items') => 'ITEMS_P',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_INVENTORY, 307, _('Inventory &Movement Report'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));				
$reports->addReport(RC_INVENTORY, 308, _('C&osted Inventory Movement Report'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Location') => 'LOCATIONS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));				
$reports->addReport(RC_INVENTORY, 309,_('Item &Sales Summary Report'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Inventory Category') => 'CATEGORIES',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));				
if (get_company_pref('use_manufacturing'))
{
	$reports->addReportClass(_('Manufacturing'), RC_MANUFACTURE);
	$reports->addReport(RC_MANUFACTURE, 401, _('&Bill of Material Listing'),
		array(	_('From product') => 'ITEMS',
				_('To product') => 'ITEMS',
				_('Comments') => 'TEXTBOX',
				_('Orientation') => 'ORIENTATION',
				_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_MANUFACTURE, 402, _('Work Order &Listing'),
		array(	_('Items') => 'ITEMS_ALL',
				_('Location') => 'LOCATIONS',
				_('Outstanding Only') => 'YES_NO',
				_('Comments') => 'TEXTBOX',
				_('Orientation') => 'ORIENTATION',
				_('Destination') => 'DESTINATION'));
$reports->addReport(RC_MANUFACTURE, 4090, _('Print &Production Report'),
	array(	_('From') => 'WORKORDER',
			_('To') => 'WORKORDER',
			_('Email Locations') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION'));
	$reports->addReport(RC_MANUFACTURE, 409, _('Print &Work Orders'),
		array(	_('From') => 'WORKORDER',
				_('To') => 'WORKORDER',
				_('Email Locations') => 'YES_NO',
				_('Comments') => 'TEXTBOX',
				_('Orientation') => 'ORIENTATION'));
}
if (get_company_pref('use_fixed_assets'))
{
	$reports->addReportClass(_('Fixed Assets'), RC_FIXEDASSETS);
	$reports->addReport(RC_FIXEDASSETS, 451, _('&Fixed Assets Valuation'),
		array(	_('End Date') => 'DATE',
				_('Fixed Assets Class') => 'FCLASS',
				_('Fixed Assets Location') => 'FLOCATIONS',
				_('Summary Only') => 'YES_NO',
				_('Comments') => 'TEXTBOX',
				_('Orientation') => 'ORIENTATION',
				_('Destination') => 'DESTINATION'));
}				
$reports->addReportClass(_('Dimensions'), RC_DIMENSIONS);
if ($dim > 0)
{
	$reports->addReport(RC_DIMENSIONS, 501, _('Dimension &Summary'),
	array(	_('From Dimension') => 'DIMENSION',
			_('To Dimension') => 'DIMENSION',
			_('Show Balance') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
}
$reports->addReportClass(_('Banking'), RC_BANKING);
	$reports->addReport(RC_BANKING,  601, _('Bank &Statement'),
	array(	_('Bank Accounts') => 'BANK_ACCOUNTS',
			_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Zero values') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_BANKING,  602, _('Bank Statement w/ &Reconcile'),
	array(	_('Bank Accounts') => 'BANK_ACCOUNTS',
			_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Comments') => 'TEXTBOX',
			_('Destination') => 'DESTINATION'));

$reports->addReportClass(_('General Ledger'), RC_GL);
$reports->addReport(RC_GL, 701, _('Chart of &Accounts'),
	array(	_('Show Balances') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_GL, 702, _('List of &Journal Entries'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Type') => 'SYS_TYPES',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));

if ($dim == 2)
{
	$reports->addReport(RC_GL, 704, _('GL Account &Transactions'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('From Account') => 'GL_ACCOUNTS',
			_('To Account') => 'GL_ACCOUNTS',
			_('Dimension')." 1" =>  'DIMENSIONS1',
			_('Dimension')." 2" =>  'DIMENSIONS2',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 705, _('Annual &Expense Breakdown'),
	array(	_('Year') => 'TRANS_YEARS',
			_('Dimension')." 1" =>  'DIMENSIONS1',
			_('Dimension')." 2" =>  'DIMENSIONS2',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 706, _('&Balance Sheet'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Dimension')." 1" => 'DIMENSIONS1',
			_('Dimension')." 2" => 'DIMENSIONS2',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Decimal values') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 707, _('&Profit and Loss Statement'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Compare to') => 'COMPARE',
			_('Dimension')." 1" =>  'DIMENSIONS1',
			_('Dimension')." 2" =>  'DIMENSIONS2',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Decimal values') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 708, _('Trial &Balance'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Zero values') => 'YES_NO',
			_('Only balances') => 'YES_NO',
			_('Dimension')." 1" =>  'DIMENSIONS1',
			_('Dimension')." 2" =>  'DIMENSIONS2',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
}
elseif ($dim == 1)
{
	$reports->addReport(RC_GL, 704, _('GL Account &Transactions'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('From Account') => 'GL_ACCOUNTS',
			_('To Account') => 'GL_ACCOUNTS',
			_('Dimension') =>  'DIMENSIONS1',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 705, _('Annual &Expense Breakdown'),
	array(	_('Year') => 'TRANS_YEARS',
			_('Dimension') =>  'DIMENSIONS1',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 706, _('&Balance Sheet'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Dimension') => 'DIMENSIONS1',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Decimal values') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 707, _('&Profit and Loss Statement'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Compare to') => 'COMPARE',
			_('Dimension') => 'DIMENSIONS1',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Decimal values') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 708, _('Trial &Balance'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Zero values') => 'YES_NO',
			_('Only balances') => 'YES_NO',
			_('Dimension') => 'DIMENSIONS1',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
}
else
{
	$reports->addReport(RC_GL, 704, _('GL Account &Transactions'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('From Account') => 'GL_ACCOUNTS',
			_('To Account') => 'GL_ACCOUNTS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 705, _('Annual &Expense Breakdown'),
	array(	_('Year') => 'TRANS_YEARS',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 706, _('&Balance Sheet'),
	array(	_('Start Date') => 'DATEBEGIN',
			_('End Date') => 'DATEENDM',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Decimal values') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 707, _('&Profit and Loss Statement'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Compare to') => 'COMPARE',
			_('Account Tags') =>  'ACCOUNTTAGS',
			_('Decimal values') => 'YES_NO',
			_('Graphics') => 'GRAPHIC',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
	$reports->addReport(RC_GL, 708, _('Trial &Balance'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Zero values') => 'YES_NO',
			_('Only balances') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
}
$reports->addReport(RC_GL, 709, _('Ta&x Report'),
	array(	_('Start Date') => 'DATEBEGINTAX',
			_('End Date') => 'DATEENDTAX',
			_('Summary Only') => 'YES_NO',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));
$reports->addReport(RC_GL, 710, _('Audit Trail'),
	array(	_('Start Date') => 'DATEBEGINM',
			_('End Date') => 'DATEENDM',
			_('Type') => 'SYS_TYPES_ALL',
			_('User') => 'USERS',
			_('Comments') => 'TEXTBOX',
			_('Orientation') => 'ORIENTATION',
			_('Destination') => 'DESTINATION'));

add_custom_reports($reports);

echo $reports->getDisplay();

end_page();

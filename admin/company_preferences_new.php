<?php

$page_security = 'SA_SETUPCOMPANY';
$path_to_root = "..";
include($path_to_root . "/includes/session.inc");

page(_($help_context = "Company Setup - new "));

include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/ui.inc");
include_once($path_to_root . "/includes/access_levels.inc");
include_once($path_to_root . "/admin/db/company_db.inc");
//-------------------------------------------------------------------------------------------------

if (isset($_POST['update']) && $_POST['update'] != "")
{
//	$input_error = 0;
//	if (!check_num('login_tout', 10))
//	{
//		display_error(_("Login timeout must be positive number not less than 10."));
//		set_focus('login_tout');
//		$input_error = 1;
//	}
//	if (strlen($_POST['coy_name'])==0)
//	{
//		$input_error = 1;
//		//display_error(_("The company name must be entered."));
//		set_focus('coy_name');
//	}
	if (isset($_FILES['pic']) && $_FILES['pic']['name'] != '')
	{
    if ($_FILES['pic']['error'] == UPLOAD_ERR_INI_SIZE) {
			//display_error(_('The file size is over the maximum allowed.'));
			$input_error = 1;
    }
    elseif ($_FILES['pic']['error'] > 0) {
		//	display_error(_('Error uploading logo file.'));
			$input_error = 1;
    }
		$result = $_FILES['pic']['error'];
		$filename = company_path()."/images";
		if (!file_exists($filename))
		{
			mkdir($filename);
		}
		$filename .= "/".clean_file_name($_FILES['pic']['name']);

		 //But check for the worst
		if (!in_array( substr($filename,-4), array('.jpg','.JPG','.png','.PNG')))
		{
			display_error(_('Only jpg and png files are supported - a file extension of .jpg or .png is expected'));
			$input_error = 1;
		}
		elseif ( $_FILES['pic']['size'] > ($SysPrefs_new->max_image_size * 1024))
		{ //File Size Check
			display_error(_('The file size is over the maximum allowed. The maximum size allowed in KB is') . ' ' . $SysPrefs->max_image_size);
			$input_error = 1;
		}
		elseif ( $_FILES['pic']['type'] == "text/plain" )
		{  //File type Check
			display_error( _('Only graphics files can be uploaded'));
			$input_error = 1;
		}
		elseif (file_exists($filename))
		{
			$result = unlink($filename);
			if (!$result)
			{
				display_error(_('The existing image could not be removed'));
				$input_error = 1;
			}
		}
		if ($input_error != 1)
		{
			$result  =  move_uploaded_file($_FILES['pic']['tmp_name'], $filename);
			$_POST['coy_logo'] = clean_file_name($_FILES['pic']['name']);
			if(!$result) 
				display_error(_('Error uploading logo file'));
		}
	}
	if (check_value('del_coy_logo'))
	{
		$filename = company_path()."/images/".clean_file_name($_POST['coy_logo']);
		if (file_exists($filename))
		{
			$result = unlink($filename);
			if (!$result)
			{
				display_error(_('The existing image could not be removed'));
				$input_error = 1;
			}
		}
		$_POST['coy_logo'] = "";
	}
	if ($_POST['add_pct'] == "")
		$_POST['add_pct'] = -1;
	if ($_POST['round_to'] <= 0)
		$_POST['round_to'] = 1;
	if ($input_error != 1)
	{
		update_company_prefs_new(
			get_post( array('sales_quotation','sale_order_entry','delivery_against'
			,'customer_credit_note','invoice_against','direct_invoice','customer_payment'
			,'allocate','sales_quotation_inquiry','sale_order_inquiry','customer_inquiry'
			,'customer_allocate_inquiry','sales_reports','manage_customer','customer_branches'
			,'sales_group','sales_type','sales_persons','sales_areas','wht_types','purchase_order'
			,'opom','direct_supplier_invoice','payments_suppliers','supplier_invoice'
			,'supplier_credit','allocates','purchase_order_inquiry','supplier_transaction_inquiry'
			,'allocate_inquiry','supplier_reports','suppliers','inventry_location',
			'inventory_adjustments','inventory_item_movemnets','inventory_item_status',
			'inventory_reports','items','foreign_item_codes','sales_kits','item_categories'
			,'inventory_locations','unit_measure','recorder_levels','import_csv','sales_pricing'
			,'purchase_pricing','standard_cost','bank_payments_voucher','bank_deposit_voucher'
			,'cash_payments_voucher','cash_receipt_voucher','bank_account_transfer','journal_entry'
			,'reconcile_account','journal_inquiry','gl','bank_account_inquiry','tax_inquiry','trial_balance',
			'drill_balance','pf_drill'
			,'banking_reports','general_ledger','bank_account','quick_entries','account_tag'
			,'gl_account','gl_account_group','closing1','company_setup','user_account_setup'
			,'access_setup','user_location','display_setup','transaction_ref','taxes','tax_group'
			,'item_tax_type','system_gl','fiscal_years','print_profile','payment_terms','shipping_company'
			,'point_sale','void_transaction','print_transaction','backup','revaluation','closing','closing1','exchange_rates'
			,'currencies','revenue_cost','reconcile_account
			','gl_account_classes','invoice_prepaid_order'
			,'sales_quotation_text'
			, 'delivery_against_text', 'invoice_against_text', 'sale_order_entry_text', 'direct_invoice_text'
			, 'customer_payment_text', 'customer_credit_note_text', 'allocate_text', 'sales_quotation_inquiry_text'
			, 'sale_order_inquiry_text', 'customer_inquiry_text', 'customer_allocate_inquiry_text', 'sales_reports_text'
			, 'manage_customer_text', 'customer_branches_text', 'sales_group_text', 'sales_type_text'
			,'sales_persons_text','sales_areas_text','wht_types_text','purchase_order_text'
			,'opom_text','direct_supplier_invoice_text','payments_suppliers_text','supplier_invoice_text'
			,'supplier_credit_text','allocates_text','purchase_order_inquiry_text','supplier_transaction_inquiry_text'
			,'allocate_inquiry_text','supplier_reports_text','suppliers_text','inventry_location_text',
			'inventory_adjustments_text','inventory_item_movemnets_text','inventory_item_status_text',
			'inventory_reports_text','items_text','foreign_item_codes_text','sales_kits_text','item_categories_text'
			,'inventory_locations_text','unit_measure_text','recorder_levels_text','import_csv_text','sales_pricing_text'
			,'purchase_pricing_text','standard_cost_text','bank_payments_voucher_text','bank_deposit_voucher_text'
			,'cash_payments_voucher_text','cash_receipt_voucher_text','bank_account_transfer_text','journal_entry_text'
			,'reconcile_account_text','journal_inquiry_text','gl_text','bank_account_inquiry_text','tax_inquiry_text','trial_balance_text','drill_balance_text','pf_drill_text'
			,'banking_reports_text','general_ledger_text','bank_account_text','quick_entries_text','account_tag_text'
			,'gl_account_text','gl_account_group_text','closing_text1','company_setup_text','user_account_setu_textp'
			,'access_setup_text','user_location_text','display_setup_text','transaction_ref_text','taxes_text','tax_group_text'
			,'item_tax_type_text','system_gl_text','fiscal_years_text','print_profile_text','payment_terms_text','shipping_company_text'
			,'point_sale_text','void_transaction_text','print_transaction_text','backup_text'
			,'revaluation_text','closing_text','exchange_rates_text'
			,'currencies_text','revenue_cost_text','reconcile_account_text','gl_account_classes_text','user_account_setup_text', 'complete_voucher', 'complete_voucher_text','invoice_prepaid_order_text')
			)

		);

//		$_SESSION['wa_current_user']->timeout = $_POST['login_tout'];
//		display_notification_centered(_("Company setup has been updated."));
	}
	set_focus('coy_name');
	$Ajax->activate('_page_body');
} /* end of if submit */
?>

    <!DOCTYPE html>
    <html>
    <head>
        <title></title>
        <!--	<link rel="stylesheet" href="http://cdn.kendostatic.com/2012.2.710/styles/kendo.blueopal.min.css" />-->
        <script src="../telerik/styles/kendo.common.min.css"></script>

        <script src="../telerik/js/jquery.min.js"></script>
        <script src="../telerik/js/kendo.all.min.js"></script>
        <link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.2.805/styles/kendo.common-material.min.css" />
        <link rel="stylesheet" href="//kendo.cdn.telerik.com/2015.2.805/styles/kendo.material.min.css" />



    </head>
    <body>
<style>

    ul li a:hover{background-color:#337ab7;}

</style>

<div id="example" style="background-color: #79B3D4;">
	<div class="demo-section k-content" style="background-color: #79B3D4;" >
		<div id="tabstrip" style="background-color: #79B3D4;">
			<ul style="background-color: #79B3D4;">


				<li  style="background-color: #79B3D4;" >
					<a href="gl_setup.php"><i class="fa fa-dashboard " style="margin-right: 5px;">  </i> Main</a>
				</li>

				<li  style="background-color: #79B3D4;">
					<a href="so_pref.php"> <i class="fa fa-line-chart" style="margin-right: 5px;"></i> Sales Pref</a>
				</li>

				<li style="background-color: #79B3D4;">
					<a href="purch_pref.php"><i class="fa fa-shopping-cart" style="margin-right: 5px;"></i> Purchase Pref</a>
				</li>
				<li  style="background-color: #79B3D4;" >
					<i class="fa fa-barcode" style="margin-right: 5px;"></i> Item Pref
				</li>

				<li class="k-state-active"  style="background-color: #337ab7;"   >
					<i class="fa fa-circle-o" style="margin-right: 5px;"></i> Form Display
				</li >


				<li  style="background-color: #79B3D4;">
					<a href="print_from_setup.php"><i class="fa fa-pie-chart" style="margin-right: 5px;"></i> Report Display</a>
				</li>

				<li   style="background-color: #79B3D4;" >
					<a href="import_gl_setup.php"><i class="fa fa-ship" style="margin-right: 5px;"></i> Import GL</a>
				</li >

				<li   style="background-color: #79B3D4;" >
					<a href="cashflow_gl.php"><i class="fa fa-area-chart" style="margin-right: 5px;"></i> Cash Flow</a>
				</li >

				<li    style="background-color: #79B3D4;" >
					<a href="wht_type.php"><i class="fa fa-text-width" style="margin-right: 5px;"></i> WHT GL</a>
				</li >
			</ul>

		</div>
	</div>




	<script>
            $(document).ready(function() {
                $("#tabstrip").kendoTabStrip({
                    animation:  {
                        open: {
                            effects: "fadeIn"
                        }
                    }
                });
            });
        </script>
    </div>


    </body>
    </html>

<?php
start_form(true);

$myrow = get_company_pref_display();

$_POST['sales_quotation'] = $myrow["sales_quotation"];
$_POST['sale_order_entry'] = $myrow["sale_order_entry"];
$_POST['delivery_against'] = $myrow["delivery_against"];
$_POST['customer_credit_note'] = $myrow["customer_credit_note"];
$_POST['invoice_against']  = $myrow["invoice_against"];
$_POST['direct_invoice']  = $myrow["direct_invoice"];
$_POST['customer_payment']  = $myrow["customer_payment"];
$_POST['allocate']  = $myrow["allocate"];
$_POST['sales_quotation_inquiry']  = $myrow["sales_quotation_inquiry"];
$_POST['sale_order_inquiry']  = $myrow["sale_order_inquiry"];
$_POST['customer_inquiry']  = $myrow["customer_inquiry"];
$_POST['customer_allocate_inquiry']  = $myrow["customer_allocate_inquiry"];
$_POST['sales_reports']  = $myrow["sales_reports"];
$_POST['manage_customer']  = $myrow["manage_customer"];
$_POST['customer_branches']  = $myrow["customer_branches"];
$_POST['sales_group']  = $myrow["sales_group"];
$_POST['sales_type']  = $myrow["sales_type"];
$_POST['sales_persons']  = $myrow["sales_persons"];
$_POST['sales_areas']  = $myrow["sales_areas"];
$_POST['wht_types']  = $myrow["wht_types"];
$_POST['invoice_prepaid_order']  = $myrow["invoice_prepaid_order"];

/////purchasing
$_POST['purchase_order']  = $myrow["purchase_order"];
$_POST['opom']  = $myrow["opom"];
$_POST['direct_supplier_invoice']  = $myrow["direct_supplier_invoice"];
$_POST['payments_suppliers']  = $myrow["payments_suppliers"];
$_POST['supplier_invoice']  = $myrow["supplier_invoice"];
$_POST['supplier_credit']  = $myrow["supplier_credit"];
$_POST['allocates']  = $myrow["allocates"];
$_POST['purchase_order_inquiry']  = $myrow["purchase_order_inquiry"];
$_POST['supplier_transaction_inquiry']  = $myrow["supplier_transaction_inquiry"];
$_POST['allocate_inquiry']  = $myrow["allocate_inquiry"];
$_POST['supplier_reports']  = $myrow["supplier_reports"];
$_POST['suppliers']  = $myrow["suppliers"];
/////////////inventory

$_POST['inventry_location']  = $myrow["inventry_location"];
$_POST['inventory_adjustments']  = $myrow["inventory_adjustments"];
$_POST['inventory_item_movemnets']  = $myrow["inventory_item_movemnets"];
$_POST['inventory_item_status']  = $myrow["inventory_item_status"];
$_POST['inventory_reports']  = $myrow["inventory_reports"];
$_POST['items']  = $myrow["items"];
$_POST['foreign_item_codes']  = $myrow["foreign_item_codes"];
$_POST['sales_kits']  = $myrow["sales_kits"];
$_POST['item_categories']  = $myrow["item_categories"];
$_POST['inventory_locations']  = $myrow["inventory_locations"];
$_POST['unit_measure']  = $myrow["unit_measure"];
$_POST['recorder_levels']  = $myrow["recorder_levels"];
$_POST['import_csv']  = $myrow["import_csv"];
$_POST['sales_pricing']  = $myrow["sales_pricing"];
$_POST['purchase_pricing']  = $myrow["purchase_pricing"];
$_POST['standard_cost']  = $myrow["standard_cost"];


//////banking and general ledger
$_POST['bank_payments_voucher']  = $myrow["bank_payments_voucher"];
$_POST['bank_deposit_voucher']  = $myrow["bank_deposit_voucher"];
$_POST['cash_payments_voucher']  = $myrow["cash_payments_voucher"];
$_POST['cash_receipt_voucher']  = $myrow["cash_receipt_voucher"];
$_POST['bank_account_transfer']  = $myrow["bank_account_transfer"];
$_POST['journal_entry']  = $myrow["journal_entry"];
$_POST['reconcile_account']  = $myrow["reconcile_account"];
$_POST['journal_inquiry']  = $myrow["journal_inquiry"];

$_POST['gl']  = $myrow["gl"];
$_POST['bank_account_inquiry']  = $myrow["bank_account_inquiry"];
$_POST['tax_inquiry']  = $myrow["tax_inquiry"];
$_POST['trial_balance']  = $myrow["trial_balance"];
$_POST['drill_balance']  = $myrow["drill_balance"];
$_POST['pf_drill']  = $myrow["pf_drill"];
$_POST['banking_reports']  = $myrow["banking_reports"];
$_POST['general_ledger']  = $myrow["general_ledger"];
$_POST['bank_account']  = $myrow["bank_account"];
$_POST['quick_entries']  = $myrow["quick_entries"];
$_POST['account_tag']  = $myrow["account_tag"];
$_POST['gl_account']  = $myrow["gl_account"];
$_POST['gl_account_group']  = $myrow["gl_account_group"];
$_POST['closing']  = $myrow["closing"];
$_POST['revaluation']  = $myrow["revaluation"];
$_POST['closing']  = $myrow["closing"];
$_POST['exchange_rates']  = $myrow["exchange_rates"];
$_POST['currencies']  = $myrow["currencies"];
$_POST['revenue_cost']  = $myrow["revenue_cost"];
$_POST['reconcile_account']  = $myrow["reconcile_account"];
$_POST['gl_account_classes']  = $myrow["gl_account_classes"];

/////////////setup
$_POST['company_setup']  = $myrow["company_setup"];
$_POST['user_account_setup']  = $myrow["user_account_setup"];
$_POST['access_setup']  = $myrow["access_setup"];
$_POST['user_location']  = $myrow["user_location"];
$_POST['display_setup']  = $myrow["display_setup"];
$_POST['transaction_ref']  = $myrow["transaction_ref"];
$_POST['taxes']  = $myrow["taxes"];
$_POST['tax_group']  = $myrow["tax_group"];
$_POST['item_tax_type']  = $myrow["item_tax_type"];
$_POST['system_gl']  = $myrow["system_gl"];
$_POST['fiscal_years']  = $myrow["fiscal_years"];
$_POST['print_profile']  = $myrow["print_profile"];
$_POST['payment_terms']  = $myrow["payment_terms"];
$_POST['shipping_company']  = $myrow["shipping_company"];
$_POST['point_sale']  = $myrow["point_sale"];
$_POST['void_transaction']  = $myrow["void_transaction"];
$_POST['print_transaction']  = $myrow["print_transaction"];
$_POST['backup']  = $myrow["backup"];
$_POST['sales_quotation_text']  = $myrow["sales_quotation_text"];
$_POST['sale_order_entry_text']  = $myrow["sale_order_entry_text"];
$_POST['delivery_against_text']  = $myrow["delivery_against_text"];
$_POST['invoice_against_text']  = $myrow["invoice_against_text"];
$_POST['direct_invoice_text']  = $myrow["direct_invoice_text"];
$_POST['customer_payment_text']  = $myrow["customer_payment_text"];
$_POST['customer_credit_note_text']  = $myrow["customer_credit_note_text"];
$_POST['allocate_text']  = $myrow["allocate_text"];
$_POST['sales_quotation_inquiry_text']  = $myrow["sales_quotation_inquiry_text"];
$_POST['sale_order_inquiry_text']  = $myrow["sale_order_inquiry_text"];
$_POST['customer_inquiry_text']  = $myrow["customer_inquiry_text"];
$_POST['customer_allocate_inquiry_text']  = $myrow["customer_allocate_inquiry_text"];
$_POST['sales_reports_text']  = $myrow["sales_reports_text"];
$_POST['manage_customer_text']  = $myrow["manage_customer_text"];
$_POST['customer_branches_text']  = $myrow["customer_branches_text"];
$_POST['sales_group_text']  = $myrow["sales_group_text"];
$_POST['sales_type_text']  = $myrow["sales_type_text"];
$_POST['sales_persons_text']  = $myrow["sales_persons_text"];
$_POST['sales_areas_text']  = $myrow["sales_areas_text"];
$_POST['wht_types_text']  = $myrow["wht_types_text"];
$_POST['purchase_order_text']  = $myrow["purchase_order_text"];
$_POST['opom_text']  = $myrow["opom_text"];
$_POST['direct_supplier_invoice_text']  = $myrow["direct_supplier_invoice_text"];
$_POST['payments_suppliers_text']  = $myrow["payments_suppliers_text"];
$_POST['supplier_invoice_text']  = $myrow["supplier_invoice_text"];
$_POST['supplier_credit_text']  = $myrow["supplier_credit_text"];
$_POST['allocates_text']  = $myrow["allocates_text"];
$_POST['purchase_order_inquiry_text']  = $myrow["purchase_order_inquiry_text"];
$_POST['supplier_transaction_inquiry_text']  = $myrow["supplier_transaction_inquiry_text"];
$_POST['allocate_inquiry_text']  = $myrow["allocate_inquiry_text"];
$_POST['supplier_reports_text']  = $myrow["supplier_reports_text"];
$_POST['suppliers_text']  = $myrow["suppliers_text"];
$_POST['inventry_location_text']  = $myrow["inventry_location_text"];
$_POST['inventory_adjustments_text']  = $myrow["inventory_adjustments_text"];
$_POST['inventory_item_movemnets_text']  = $myrow["inventory_item_movemnets_text"];
$_POST['inventory_item_status_text']  = $myrow["inventory_item_status_text"];
$_POST['inventory_reports_text']  = $myrow["inventory_reports_text"];
$_POST['items_text']  = $myrow["items_text"];
$_POST['foreign_item_codes_text']  = $myrow["foreign_item_codes_text"];
$_POST['sales_kits_text']  = $myrow["sales_kits_text"];
$_POST['item_categories_text']  = $myrow["item_categories_text"];
$_POST['unit_measure_text']  = $myrow["unit_measure_text"];
$_POST['recorder_levels_text']  = $myrow["recorder_levels_text"];
$_POST['import_csv_text']  = $myrow["import_csv_text"];
$_POST['sales_pricing_text']  = $myrow["sales_pricing_text"];
$_POST['purchase_pricing_text']  = $myrow["purchase_pricing_text"];
$_POST['standard_cost_text']  = $myrow["standard_cost_text"];
$_POST['bank_payments_voucher_text']  = $myrow["bank_payments_voucher_text"];
$_POST['bank_deposit_voucher_text']  = $myrow["bank_deposit_voucher_text"];
$_POST['cash_payments_voucher_text']  = $myrow["cash_payments_voucher_text"];
$_POST['bank_account_transfer_text']  = $myrow["bank_account_transfer_text"];
$_POST['journal_entry_text']  = $myrow["journal_entry_text"];
$_POST['reconcile_account_text']  = $myrow["reconcile_account_text"];
$_POST['journal_inquiry_text']  = $myrow["journal_inquiry_text"];
$_POST['gl_text']  = $myrow["gl_text"];
$_POST['bank_account_inquiry_text']  = $myrow["bank_account_inquiry_text"];
$_POST['tax_inquiry_text']  = $myrow["tax_inquiry_text"];
$_POST['trial_balance_text']  = $myrow["trial_balance_text"];
$_POST['drill_balance_text']  = $myrow["drill_balance_text"];
$_POST['pf_drill_text']  = $myrow["pf_drill_text"];
$_POST['banking_reports_text']  = $myrow["banking_reports_text"];
$_POST['general_ledger_text']  = $myrow["general_ledger_text"];
$_POST['bank_account_text']  = $myrow["bank_account_text"];
$_POST['quick_entries_text']  = $myrow["quick_entries_text"];
$_POST['account_tag_text']  = $myrow["account_tag_text"];
$_POST['gl_account_text']  = $myrow["gl_account_text"];
$_POST['gl_account_group_text']  = $myrow["gl_account_group_text"];
$_POST['closing_text1']  = $myrow["closing_text1"];
$_POST['revaluation_text']  = $myrow["revaluation_text"];
$_POST['closing_text']  = $myrow["closing_text"];
$_POST['exchange_rates_text']  = $myrow["exchange_rates_text"];
$_POST['currencies_text']  = $myrow["currencies_text"];
$_POST['revenue_cost_text']  = $myrow["revenue_cost_text"];
$_POST['reconcile_account_text']  = $myrow["reconcile_account_text"];
$_POST['gl_account_classes_text']  = $myrow["gl_account_classes_text"];
$_POST['company_setup_text']  = $myrow["company_setup_text"];
$_POST['user_account_setup_text']  = $myrow["user_account_setup_text"];
$_POST['access_setup_text']  = $myrow["access_setup_text"];
$_POST['user_location_text']  = $myrow["user_location_text"];
$_POST['transaction_ref_text']  = $myrow["transaction_ref_text"];
$_POST['taxes_text']  = $myrow["taxes_text"];
$_POST['tax_group_text']  = $myrow["tax_group_text"];
$_POST['item_tax_type_text']  = $myrow["item_tax_type_text"];
$_POST['system_gl_text']  = $myrow["system_gl_text"];
$_POST['fiscal_years_text']  = $myrow["fiscal_years_text"];
$_POST['print_profile_text']  = $myrow["print_profile_text"];
$_POST['payment_terms_text']  = $myrow["payment_terms_text"];
$_POST['shipping_company_text']  = $myrow["shipping_company_text"];
$_POST['point_sale_text']  = $myrow["point_sale_text"];
$_POST['void_transaction_text']  = $myrow["void_transaction_text"];
$_POST['print_transaction_text']  = $myrow["print_transaction_text"];
$_POST['backup_text']  = $myrow["backup_text"];
$_POST['display_setup_text']  = $myrow["display_setup_text"];
$_POST['cash_receipt_voucher_text']  = $myrow["cash_receipt_voucher_text"];
$_POST['inventory_locations_text']  = $myrow["inventory_locations_text"];
//complete voucher
$_POST['complete_voucher']  = $myrow["complete_voucher"];
$_POST['complete_voucher_text']  = $myrow["complete_voucher_text"];

$_POST['invoice_prepaid_order_text']  = $myrow["invoice_prepaid_order_text"];
start_outer_table(TABLESTYLE2);
table_section(1);
table_section_title(_("Sales"));
table_section_title(_("Transactions"));

check_row(_("Sale Quotation Entry"), 'sales_quotation', null);
text_cells(_(""), 'sales_quotation_text', $_POST['sales_quotation_text'], 50);
check_row(_("Sale Order Entry"), 'sale_order_entry', null);
text_cells(_(""), 'sale_order_entry_text', $_POST['sale_order_entry_text'], 50);
check_row(_("Delivery Against Sales Orders"), 'delivery_against', null);
text_cells(_(""), 'delivery_against_text', $_POST['delivery_against_text'], 50);
check_row(_("Invoice Against Sales Delivery"), 'invoice_against', null);
text_cells(_(""), 'invoice_against_text', $_POST['invoice_against_text'], 50);
check_row(_("Direct Invoice"), 'direct_invoice', null);
text_cells(_(""), 'direct_invoice_text', $_POST['direct_invoice_text'], 50);


check_row(_("Invoice Prepaid Orders"), 'invoice_prepaid_order', null);
text_cells(_(""), 'invoice_prepaid_order_text', $_POST['invoice_prepaid_order_text'], 50);


check_row(_("Customer Payments"), 'customer_payment', null);
text_cells(_(""), 'customer_payment_text', $_POST['customer_payment_text'], 50);
check_row(_("Customer Credit Note"), 'customer_credit_note', null);
text_cells(_(""), 'customer_credit_note_text', $_POST['customer_credit_note_text'], 50);
check_row(_("Allocate Customer Payments Or Credit Notes"), 'allocate', null);
text_cells(_(""), 'allocate_text', $_POST['allocate_text'], 50);
table_section_title(_("Inquiries and Reports"));
check_row(_("Sale Quotation Inquiry"), 'sales_quotation_inquiry', null);
text_cells(_(""), 'sales_quotation_inquiry_text', $_POST['sales_quotation_inquiry_text'], 50);
check_row(_("Sale Order Inquiry"), 'sale_order_inquiry', null);
text_cells(_(""), 'sale_order_inquiry_text', $_POST['sale_order_inquiry_text'], 50);
check_row(_("Customer Transaction Inquiry"), 'customer_inquiry', null);
text_cells(_(""), 'customer_inquiry_text', $_POST['customer_inquiry_text'], 50);
check_row(_("Customer Allocate Inquiry"), 'customer_allocate_inquiry', null);
text_cells(_(""), 'customer_allocate_inquiry_text', $_POST['customer_allocate_inquiry_text'], 50);
check_row(_("Customer And Sales Reports"), 'sales_reports', null);
text_cells(_(""), 'sales_reports_text', $_POST['sales_reports_text'], 50);


table_section_title(_("Maintenance"));
check_row(_("Add And Manage Customer"), 'manage_customer', null);
text_cells(_(""), 'manage_customer_text', $_POST['manage_customer_text'], 50);

check_row(_("Customer Branches"), 'customer_branches', null);
text_cells(_(""), 'customer_branches_text', $_POST['customer_branches_text'], 50);

check_row(_("Sales Groups"), 'sales_group', null);
text_cells(_(""), 'sales_group_text', $_POST['sales_group_text'], 50);

check_row(_("Sales Type"), 'sales_type', null);
text_cells(_(""), 'sales_type_text', $_POST['sales_type_text'], 50);

check_row(_("Sales Persons"), 'sales_persons', null);
text_cells(_(""), 'sales_persons_text', $_POST['sales_persons_text'], 50);

check_row(_("Sales Areas"), 'sales_areas', null);
text_cells(_(""), 'sales_areas_text', $_POST['sales_areas_text'], 50);

check_row(_("WHT Types"), 'wht_types', null);
text_cells(_(""), 'wht_types_text', $_POST['wht_types_text'], 50);

table_section(2);
table_section_title(_("Purchasing"));
table_section_title(_("Transaction"));

check_row(_("Purchase Order Entry"), 'purchase_order', null);
text_cells(_(""), 'purchase_order_text', $_POST['purchase_order_text'], 50);

check_row(_("Outstanding Purchase Orders Maintenance"), 'opom', null);
text_cells(_(""), 'opom_text', $_POST['opom_text'], 50);

check_row(_("Direct Supplier Invoice"), 'direct_supplier_invoice', null);
text_cells(_(""), 'direct_supplier_invoice_text', $_POST['direct_supplier_invoice_text'], 50);

check_row(_("Payments To Suppliers"), 'payments_suppliers', null);
text_cells(_(""), 'payments_suppliers_text', $_POST['payments_suppliers_text'], 50);

check_row(_("Supplier Invoices"), 'supplier_invoice', null);
text_cells(_(""), 'supplier_invoice_text', $_POST['supplier_invoice_text'], 50);

check_row(_("Supplier Credit Notes"), 'supplier_credit', null);
text_cells(_(""), 'supplier_credit_text', $_POST['supplier_credit_text'], 50);

check_row(_("Allocate Supplier Payments Or Credit Notes"), 'allocates', null);
text_cells(_(""), 'allocates_text', $_POST['allocates_text'], 50);

table_section_title(_("Inquiries and Reports"));
check_row(_("Purchase Order Inquiry"), 'purchase_order_inquiry', null);
text_cells(_(""), 'purchase_order_inquiry_text', $_POST['purchase_order_inquiry_text'], 50);

check_row(_("Supplier Transaction Inquiry"), 'supplier_transaction_inquiry', null);
text_cells(_(""), 'supplier_transaction_inquiry_text', $_POST['supplier_transaction_inquiry_text'], 50);

check_row(_("Supplier Allocation Inquiry"), 'allocate_inquiry', null);
text_cells(_(""), 'allocate_inquiry_text', $_POST['allocate_inquiry_text'], 50);

check_row(_("Supplier And Purchasing Reports"), 'supplier_reports', null);
text_cells(_(""), 'supplier_reports_text', $_POST['supplier_reports_text'], 50);

table_section_title(_("Maintenance"));
check_row(_("Suppliers"), 'suppliers', null);
text_cells(_(""), 'suppliers_text', $_POST['suppliers_text'], 50);

table_section(3);
table_section_title(_("Items And Inventory"));
table_section_title(_("Transaction"));
check_row(_("Inventory Location Transfer"), 'inventry_location', null);
text_cells(_(""), 'inventry_location_text', $_POST['inventry_location_text'], 50);

check_row(_("Inventory Adjustments"), 'inventory_adjustments', null);
text_cells(_(""), 'inventory_adjustments_text', $_POST['inventory_adjustments_text'], 50);

table_section_title(_("Inquiries And Reports"));
check_row(_("Inventory Item Movements"), 'inventory_item_movemnets', null);
text_cells(_(""), 'inventory_item_movemnets_text', $_POST['inventory_item_movemnets_text'], 50);

check_row(_("Inventory Item Status"), 'inventory_item_status', null);
text_cells(_(""), 'inventory_item_status_text', $_POST['inventory_item_status_text'], 50);

check_row(_("Inventory Reports"), 'inventory_reports', null);
text_cells(_(""), 'inventory_reports_text', $_POST['inventory_reports_text'], 50);

table_section_title(_("Maintenance"));
check_row(_("Items"), 'items', null);
text_cells(_(""), 'items_text', $_POST['items_text'], 50);

check_row(_("Foreign Item Codes"), 'foreign_item_codes', null);
text_cells(_(""), 'foreign_item_codes_text', $_POST['foreign_item_codes_text'], 50);

check_row(_("Sales Kits"), 'sales_kits', null);
text_cells(_(""), 'sales_kits_text', $_POST['sales_kits_text'], 50);

check_row(_("Item Categories"), 'item_categories', null);
text_cells(_(""), 'item_categories_text', $_POST['item_categories_text'], 50);

check_row(_("Inventory Locations"), 'inventory_locations', null);
text_cells(_(""), 'inventory_locations_text', $_POST['inventory_locations_text'], 50);

check_row(_("Units Of Measure"), 'unit_measure', null);
text_cells(_(""), 'unit_measure_text', $_POST['unit_measure_text'], 50);

check_row(_("Recorder_levels"), 'recorder_levels', null);
text_cells(_(""), 'recorder_levels_text', $_POST['recorder_levels_text'], 50);

check_row(_("Import CSV Items"), 'import_csv', null);
text_cells(_(""), 'import_csv_text', $_POST['import_csv_text'], 50);

table_section_title(_("Pricing and Costs"));

check_row(_("Sales Pricing"), 'sales_pricing', null);
text_cells(_(""), 'sales_pricing_text', $_POST['sales_pricing_text'], 50);

check_row(_("Purchasing Pricing"), 'purchase_pricing', null);
text_cells(_(""), 'purchase_pricing_text', $_POST['purchase_pricing_text'], 50);

check_row(_("Standard Costs"), 'standard_cost', null);
text_cells(_(""), 'standard_cost_text', $_POST['standard_cost_text'], 50);

//////banking and general ledger
table_section(4);
table_section_title(_("Banking and General Ledger "));

check_row(_("Bank Payments Voucher"), 'bank_payments_voucher', null);
text_cells(_(""), 'bank_payments_voucher_text', $_POST['bank_payments_voucher_text'], 50);

check_row(_("Bank Deposits Voucher"), 'bank_deposit_voucher', null);
text_cells(_(""), 'bank_deposit_voucher_text', $_POST['bank_deposit_voucher_text'], 50);

check_row(_("Cash Payment Voucher"), 'cash_payments_voucher', null);
text_cells(_(""), 'cash_payments_voucher_text', $_POST['cash_payments_voucher_text'], 50);

check_row(_("Cash Receipt Voucher"), 'cash_receipt_voucher', null);
text_cells(_(""), 'cash_receipt_voucher_text', $_POST['cash_receipt_voucher_text'], 50);

check_row(_("Bank Account Transfer"), 'bank_account_transfer', null);
text_cells(_(""), 'bank_account_transfer_text', $_POST['bank_account_transfer_text'], 50);

check_row(_("Journal Entry"), 'journal_entry', null);
text_cells(_(""), 'journal_entry_text', $_POST['journal_entry_text'], 50);

check_row(_("Reconcile Bank Account"), 'reconcile_account', null);
text_cells(_(""), 'reconcile_account_text', $_POST['reconcile_account_text'], 50);

table_section_title(_("Inquiries and Reports "));

check_row(_("Journal Inquiry"), 'journal_inquiry', null);
text_cells(_(""), 'journal_inquiry_text', $_POST['journal_inquiry_text'], 50);

check_row(_("GL Inquiry"), 'gl', null);
text_cells(_(""), 'gl_text', $_POST['gl_text'], 50);

check_row(_("Bank Account Inquiry"), 'bank_account_inquiry', null);
text_cells(_(""), 'bank_account_inquiry_text', $_POST['bank_account_inquiry_text'], 50);

check_row(_("Tax Inquiry"), 'tax_inquiry', null);
text_cells(_(""), 'tax_inquiry_text', $_POST['tax_inquiry_text'], 50);

check_row(_("Trial Balance"), 'trial_balance', null);
text_cells(_(""), 'trial_balance_text', $_POST['trial_balance_text'], 50);

check_row(_("Balance Sheet drilldown"), 'drill_balance', null);
text_cells(_(""), 'drill_balance_text', $_POST['drill_balance_text'], 50);

check_row(_("Profit and Loss Drilldown"), 'pf_drill', null);
text_cells(_(""), 'pf_drill_text', $_POST['pf_drill_text'], 50);

check_row(_("Banking Reports"), 'banking_reports', null);
text_cells(_(""), 'banking_reports_text', $_POST['banking_reports_text'], 50);

check_row(_("General Ledger Reports"), 'general_ledger', null);
text_cells(_(""), 'general_ledger_text', $_POST['general_ledger_text'], 50);

table_section_title(_("Maintenance"));

check_row(_("Bank Account"), 'bank_account', null);
text_cells(_(""), 'bank_account_text', $_POST['bank_account_text'], 50);

check_row(_("Quick Entries"), 'quick_entries', null);
text_cells(_(""), 'quick_entries_text', $_POST['quick_entries_text'], 50);

check_row(_("Account Tags"), 'account_tag', null);
text_cells(_(""), 'account_tag_text', $_POST['account_tag_text'], 50);

check_row(_("GL Accounts"), 'gl_account', null);
text_cells(_(""), 'gl_account_text', $_POST['gl_account_text'], 50);

check_row(_("GL Account Groups"), 'gl_account_group', null);
text_cells(_(""), 'gl_account_group_text', $_POST['gl_account_group_text'], 50);

check_row(_("Closing GL Transactions"), 'closing', null);
text_cells(_(""), 'closing_text', $_POST['closing_text'], 50);

check_row(_("Revaluation"), 'revaluation', null);
text_cells(_(""), 'revaluation_text', $_POST['revaluation_text'], 50);
//check_row(_("Closing"), 'closing', null);
//text_cells(_(""), 'closing_text', $_POST['closing_text'], 50);
check_row(_("Exchange Rates"), 'exchange_rates', null);
text_cells(_(""), 'exchange_rates_text', $_POST['exchange_rates_text'], 50);

check_row(_("Currencies"), 'currencies', null);
text_cells(_(""), 'currencies_text', $_POST['currencies_text'], 50);

check_row(_("Revenue Cost"), 'revenue_cost', null);
text_cells(_(""), 'revenue_cost_text', $_POST['revenue_cost_text'], 50);

check_row(_("Reconcile Account"), 'reconcile_account', null);
text_cells(_(""), 'reconcile_account_text', $_POST['reconcile_account_text'], 50);

check_row(_("Gl Account CLasses"), 'gl_account_classes', null);
text_cells(_(""), 'gl_account_classes_text', $_POST['gl_account_classes_text'], 50);

table_section(5);
/////////////setup
table_section_title(_("Setups"));
check_row(_("Company Setup"), 'company_setup', null);
text_cells(_(""), 'company_setup_text', $_POST['company_setup_text'], 50);

check_row(_("User Account Setup"), 'user_account_setup', null);
text_cells(_(""), 'user_account_setup_text', $_POST['user_account_setup_text'], 50);

check_row(_("Access Setup"), 'access_setup', null);
text_cells(_(""), 'access_setup_text', $_POST['access_setup_text'], 50);

check_row(_("User Locations Access"), 'user_location', null);
text_cells(_(""), 'user_location_text', $_POST['user_location_text'], 50);

check_row(_("Display Setup"), 'display_setup', null);
text_cells(_(""), 'display_setup_text', $_POST['display_setup_text'], 50);

check_row(_("Transaction References"), 'transaction_ref', null);
text_cells(_(""), 'transaction_ref_text', $_POST['transaction_ref_text'], 50);

check_row(_("Taxes"), 'taxes', null);
text_cells(_(""), 'taxes_text', $_POST['taxes_text'], 50);

check_row(_("Tax Group"), 'tax_group', null);
text_cells(_(""), 'tax_group_text', $_POST['tax_group_text'], 50);

check_row(_("Item Tax Type"), 'item_tax_type', null);
text_cells(_(""), 'item_tax_type_text', $_POST['item_tax_type_text'], 50);

check_row(_("System and General GL Setup"), 'system_gl', null);
text_cells(_(""), 'system_gl_text', $_POST['system_gl_text'], 50);

check_row(_("Fiscal Years"), 'fiscal_years', null);
text_cells(_(""), 'fiscal_years_text', $_POST['fiscal_years_text'], 50);

check_row(_("Print Profiles"), 'print_profile', null);
text_cells(_(""), 'print_profile_text', $_POST['print_profile_text'], 50);

table_section_title(_("Miscellaneous"));
check_row(_("Payment Terms"), 'payment_terms', null);
text_cells(_(""), 'payment_terms_text', $_POST['payment_terms_text'], 50);

check_row(_("Shipping Company"), 'shipping_company', null);
text_cells(_(""), 'shipping_company_text', $_POST['shipping_company_text'], 50);

check_row(_("Points Of Sale"), 'point_sale', null);
text_cells(_(""), 'point_sale_text', $_POST['point_sale_text'], 50);

table_section_title(_("Maintenance"));
check_row(_("Void a Transaction"), 'void_transaction', null);
text_cells(_(""), 'void_transaction_text', $_POST['void_transaction_text'], 50);

check_row(_("View Or Print Transactions"), 'print_transaction', null);
text_cells(_(""), 'print_transaction_text', $_POST['print_transaction_text'], 50);

check_row(_("Backup And Restore"), 'backup', null);
text_cells(_(""), 'backup_text', $_POST['backup_text'], 50);

table_section_title(_("Complete Voucher"));
check_row(_("Complete voucher"), 'complete_voucher', null);
text_cells(_(""), 'complete_voucher_text', $_POST['complete_voucher_text'], 50);

end_outer_table(1);

hidden('coy_logo', $_POST['coy_logo']);
submit_center('update', _("Update"), true, '',  'default');

end_form(2);
//-------------------------------------------------------------------------------------------------

end_page();


<?php

$page_security = 'SA_GLSETUP';
$path_to_root="..";
include($path_to_root . "/includes/session.inc");

$js = "";
if ($SysPrefs->use_popup_windows && $SysPrefs->use_popup_search)
	$js .= get_js_open_window(900, 500);

page(_($help_context = "System and General GL Setup"), false, false, "", $js);

include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/ui.inc");
include_once($path_to_root . "/includes/data_checks.inc");

include_once($path_to_root . "/admin/db/company_db.inc");

//-------------------------------------------------------------------------------------------------

function can_process()
{
	if (!check_num('po_over_receive', 0, 100))
	{
		display_error(_("The delivery over-receive allowance must be between 0 and 100."));
		set_focus('po_over_receive');
		return false;
	}

	if (!check_num('po_over_charge', 0, 100))
	{
		display_error(_("The invoice over-charge allowance must be between 0 and 100."));
		set_focus('po_over_charge');
		return false;
	}

	if (!check_num('past_due_days', 0, 100))
	{
		display_error(_("The past due days interval allowance must be between 0 and 100."));
		set_focus('past_due_days');
		return false;
	}

	$grn_act = get_company_pref('grn_clearing_act');
	$post_grn_act = get_post('grn_clearing_act');
	if ($post_grn_act == null)
		$post_grn_act = 0;
	if (($post_grn_act != $grn_act) && db_num_rows(get_grn_items(0, '', true)))
	{
		display_error(_("Before GRN Clearing Account can be changed all GRNs have to be invoiced"));
		$_POST['grn_clearing_act'] = $grn_act;
		set_focus('grn_clearing_account');
		return false;
	}
	if (!is_account_balancesheet(get_post('retained_earnings_act')) || is_account_balancesheet(get_post('profit_loss_year_act')))
	{
		display_error(_("The Retained Earnings Account should be a Balance Account or the Profit and Loss Year Account should be an Expense Account (preferred the last one in the Expense Class)"));
		return false;
	}
	return true;
}

//-------------------------------------------------------------------------------------------------

if (isset($_POST['submit']) && can_process())
{
	update_company_prefs( get_post( array( 'retained_earnings_act', 'profit_loss_year_act',
		'debtors_act', 'pyt_discount_act', 'creditors_act', 'freight_act', 'deferred_income_act',
		'exchange_diff_act', 'bank_charge_act', 'default_sales_act', 'default_sales_discount_act',
		'default_prompt_payment_act', 'default_inventory_act', 'default_cogs_act', 'depreciation_period',
		'default_loss_on_asset_disposal_act', 'default_adj_act', 'default_inv_sales_act', 'default_wip_act', 'legal_text',
		'past_due_days', 'default_workorder_required', 'default_dim_required', 'default_receival_required',
		'default_delivery_required', 'default_quote_valid_days', 'grn_clearing_act', 'tax_algorithm',
		'no_zero_lines_amount', 'show_po_item_codes','hide_prices_grn','show_doc_ref', 'accounts_alpha', 'loc_notification', 'print_invoice_no',
		'allow_negative_prices', 'print_item_images_on_quote', 
		'allow_negative_stock'=> 0, 'accumulate_shipping'=> 0,
		'po_over_receive' => 0.0, 'po_over_charge' => 0.0, 'default_credit_limit'=>0.0,
		'discount1', 'discount2', 'discount_algorithm', 'show_prices_dn','alt_uom'
)));

	display_notification(_("The general GL setup has been updated."));

} /* end of if submit */

//-------------------------------------------------------------------------------------------------
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


                    <li class="k-state-active"  style="background-color: #337ab7;"  >
						<i class="fa fa-dashboard " style="margin-right: 5px;">  </i> Main
                    </li>

                    <li  style="background-color: #79B3D4;" >
                        <a href="so_pref.php"><i class="fa fa-line-chart" style="margin-right: 5px;"></i> Sales Pref</a>
                    </li>

                    <li  style="background-color: #79B3D4;">
						<a href="purch_pref.php"><i class="fa fa-shopping-cart" style="margin-right: 5px;"></i> Purchase Pref</a>
                    </li>
                    <li  style="background-color: #79B3D4;">
                        <a href="item_pref.php"><i class="fa fa-barcode" style="margin-right: 5px;"></i> Item Pref</a>
                    </li>

                    <li   style="background-color: #79B3D4;" >
                        <a href="company_preferences_new.php"><i class="fa fa-circle-o" style="margin-right: 5px;"></i> Form Display</a>
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

					<li   style="background-color: #79B3D4;" >
						<a href="wht_type.php"><i class="fa fa-text-width" style="margin-right: 5px;"></i> WHT GL </a>
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
start_form();

start_outer_table(TABLESTYLE2);

table_section(1);

$myrow = get_company_prefs();

$_POST['retained_earnings_act']  = $myrow["retained_earnings_act"];
$_POST['profit_loss_year_act']  = $myrow["profit_loss_year_act"];
$_POST['debtors_act']  = $myrow["debtors_act"];
$_POST['creditors_act']  = $myrow["creditors_act"];
$_POST['freight_act'] = $myrow["freight_act"];
$_POST['deferred_income_act'] = $myrow["deferred_income_act"];
$_POST['pyt_discount_act']  = $myrow["pyt_discount_act"];

$_POST['exchange_diff_act'] = $myrow["exchange_diff_act"];
$_POST['bank_charge_act'] = $myrow["bank_charge_act"];
$_POST['alt_uom'] = $myrow["alt_uom"];
$_POST['tax_algorithm'] = $myrow["tax_algorithm"];
$_POST['default_sales_act'] = $myrow["default_sales_act"];
$_POST['default_sales_discount_act']  = $myrow["default_sales_discount_act"];
$_POST['default_prompt_payment_act']  = $myrow["default_prompt_payment_act"];

$_POST['default_inventory_act'] = $myrow["default_inventory_act"];
$_POST['default_cogs_act'] = $myrow["default_cogs_act"];
$_POST['default_adj_act'] = $myrow["default_adj_act"];
$_POST['default_inv_sales_act'] = $myrow['default_inv_sales_act'];
$_POST['default_wip_act'] = $myrow['default_wip_act'];

$_POST['allow_negative_stock'] = $myrow['allow_negative_stock'];

$_POST['po_over_receive'] = percent_format($myrow['po_over_receive']);
$_POST['po_over_charge'] = percent_format($myrow['po_over_charge']);
$_POST['past_due_days'] = $myrow['past_due_days'];

$_POST['grn_clearing_act'] = $myrow['grn_clearing_act'];

$_POST['default_credit_limit'] = $myrow['default_credit_limit'];
$_POST['legal_text'] = $myrow['legal_text'];
$_POST['accumulate_shipping'] = $myrow['accumulate_shipping'];

$_POST['default_workorder_required'] = $myrow['default_workorder_required'];
$_POST['default_dim_required'] = $myrow['default_dim_required'];
$_POST['default_delivery_required'] = $myrow['default_delivery_required'];
$_POST['default_receival_required'] = $myrow['default_receival_required'];
$_POST['default_quote_valid_days'] = $myrow['default_quote_valid_days'];
$_POST['no_zero_lines_amount'] = $myrow['no_zero_lines_amount'];
$_POST['show_po_item_codes'] = $myrow['show_po_item_codes'];
$_POST['hide_prices_grn'] = $myrow['hide_prices_grn'];
$_POST['show_doc_ref'] = $myrow['show_doc_ref'];
$_POST['accounts_alpha'] = $myrow['accounts_alpha'];
$_POST['loc_notification'] = $myrow['loc_notification'];
$_POST['print_invoice_no'] = $myrow['print_invoice_no'];
$_POST['allow_negative_prices'] = $myrow['allow_negative_prices'];
$_POST['print_item_images_on_quote'] = $myrow['print_item_images_on_quote'];
$_POST['default_loss_on_asset_disposal_act'] = $myrow['default_loss_on_asset_disposal_act'];
$_POST['depreciation_period'] = $myrow['depreciation_period'];
$_POST['discount1'] = $myrow['discount1'];
$_POST['discount2'] = $myrow['discount2'];
$_POST['discount_algorithm'] = $myrow['discount_algorithm'];
$_POST['show_prices_dn'] = $myrow['show_prices_dn'];

//---------------


table_section_title(_("General GL"));

text_row(_("Past Due Days Interval:"), 'past_due_days', $_POST['past_due_days'], 6, 6, '', "", _("days"));

accounts_type_list_row(_("Accounts Type:"), 'accounts_alpha', $_POST['accounts_alpha']); 

gl_all_accounts_list_row(_("Retained Earnings:"), 'retained_earnings_act', $_POST['retained_earnings_act']);

gl_all_accounts_list_row(_("Profit/Loss Year:"), 'profit_loss_year_act', $_POST['profit_loss_year_act']);

gl_all_accounts_list_row(_("Exchange Variances Account:"), 'exchange_diff_act', $_POST['exchange_diff_act']);

gl_all_accounts_list_row(_("Bank Charges Account:"), 'bank_charge_act', $_POST['bank_charge_act']);

tax_algorithm_list_row(_("Tax Algorithm:"), 'tax_algorithm', $_POST['tax_algorithm']);
check_cells("Alt UOM functionality :",'alt_uom', $_POST['alt_uom']);
//---------------

table_section_title(_("Dimension Defaults"));

text_row(_("Dimension Required By After:"), 'default_dim_required', $_POST['default_dim_required'], 6, 6, '', "", _("days"));

//----------------

table_section_title(_("Customers and Sales"));

text_row(_("Default Credit Limit:"), 'default_credit_limit', $_POST['default_credit_limit'], 12, 12);

yesno_list_row(_("Invoice Identification:"), 'print_invoice_no', $_POST['print_invoice_no'], $name_yes=_("Number"), $name_no=_("Reference"));

check_row(_("Accumulate batch shipping:"), 'accumulate_shipping', null);

check_row(_("Print Item Image on Quote:"), 'print_item_images_on_quote', null);

textarea_row(_("Legal Text on Invoice:"), 'legal_text', $_POST['legal_text'], 32, 4);

gl_all_accounts_list_row(_("Shipping Charged Account:"), 'freight_act', $_POST['freight_act']);

gl_all_accounts_list_row(_("Deferred Income Account:"), 'deferred_income_act', $_POST['deferred_income_act'], true, false,
	_("Not used"), false, false, false);

//---------------

table_section_title(_("Customers and Sales Defaults"));
// default for customer branch
gl_all_accounts_list_row(_("Receivable Account:"), 'debtors_act');

gl_all_accounts_list_row(_("Sales Account:"), 'default_sales_act', null, false, false, true);

gl_all_accounts_list_row(_("Sales Discount Account:"), 'default_sales_discount_act');

gl_all_accounts_list_row(_("Prompt Payment Discount Account:"), 'default_prompt_payment_act');

text_row(_("Quote Valid Days:"), 'default_quote_valid_days', $_POST['default_quote_valid_days'], 6, 6, '', "", _("days"));

text_row(_("Delivery Required By:"), 'default_delivery_required', $_POST['default_delivery_required'], 6, 6, '', "", _("days"));

gl_all_accounts_list_row(_("Discount 1:"), 'discount1', null, false, false, true);

gl_all_accounts_list_row(_("Discount 2:"), 'discount2', null, false, false, true);

discount_algorithm_list_row(_("Discount Algorithm:"), 'discount_algorithm', $_POST['discount_algorithm']);

check_row(_("Show prices on Delivery Note:"), 'show_prices_dn', null);

//---------------

table_section(2);

table_section_title(_("Suppliers and Purchasing"));

percent_row(_("Delivery Over-Receive Allowance:"), 'po_over_receive');

percent_row(_("Invoice Over-Charge Allowance:"), 'po_over_charge');

table_section_title(_("Suppliers and Purchasing Defaults"));

gl_all_accounts_list_row(_("Payable Account:"), 'creditors_act', $_POST['creditors_act']);

gl_all_accounts_list_row(_("Purchase Discount Account:"), 'pyt_discount_act', $_POST['pyt_discount_act']);

gl_all_accounts_list_row(_("GRN Clearing Account:"), 'grn_clearing_act', get_post('grn_clearing_act'), true, false, _("No postings on GRN"));

text_row(_("Receival Required By:"), 'default_receival_required', $_POST['default_receival_required'], 6, 6, '', "", _("days"));

check_row(_("Show PO item codes:"), 'show_po_item_codes', null);

check_row(_("Hide prices on GRN:"), 'hide_prices_grn', null);

check_row(_("Show document reference instead of id:"), 'show_doc_ref', null);

table_section_title(_("Inventory"));

check_row(_("Allow Negative Inventory:"), 'allow_negative_stock', null);
label_row(null, _("Warning:  This may cause a delay in GL postings"), "", "class='stockmankofg' colspan=2"); 

check_row(_("No zero-amounts (Service):"), 'no_zero_lines_amount', null);

check_row(_("Location Notifications:"), 'loc_notification', null);

check_row(_("Allow Negative Prices:"), 'allow_negative_prices', null);

table_section_title(_("Items Defaults"));
gl_all_accounts_list_row(_("Sales Account:"), 'default_inv_sales_act', $_POST['default_inv_sales_act']);

gl_all_accounts_list_row(_("Inventory Account:"), 'default_inventory_act', $_POST['default_inventory_act']);
// this one is default for items and suppliers (purchase account)
gl_all_accounts_list_row(_("C.O.G.S. Account:"), 'default_cogs_act', $_POST['default_cogs_act']);

gl_all_accounts_list_row(_("Inventory Adjustments Account:"), 'default_adj_act', $_POST['default_adj_act']);

gl_all_accounts_list_row(_("WIP Account:"), 'default_wip_act', $_POST['default_wip_act']);

//----------------

table_section_title(_("Fixed Assets Defaults"));

gl_all_accounts_list_row(_("Loss On Asset Disposal Account:"), 'default_loss_on_asset_disposal_act', $_POST['default_loss_on_asset_disposal_act']);

array_selector_row (_("Depreciation Period:"), 'depreciation_period', $_POST['depreciation_period'], array(FA_MONTHLY => _("Monthly"), FA_YEARLY => _("Yearly")));

//----------------

table_section_title(_("Manufacturing Defaults"));

text_row(_("Work Order Required By After:"), 'default_workorder_required', $_POST['default_workorder_required'], 6, 6, '', "", _("days"));

//----------------

end_outer_table(1);

submit_center('submit', _("Update"), true, '', 'default');

end_form(2);

//-------------------------------------------------------------------------------------------------

end_page();


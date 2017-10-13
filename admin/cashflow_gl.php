<?php

$page_security = 'SA_SALESMAN';
$path_to_root = "..";
include($path_to_root . "/includes/session.inc");
include($path_to_root . "/admin/db/cashflow_db.inc");

page(_($help_context = "Cashflow_GL_Account"));

include($path_to_root . "/includes/ui.inc");

simple_page_mode(true);
//------------------------------------------------------------------------------------------------

if ($Mode=='ADD_ITEM' || $Mode=='UPDATE_ITEM')
{

	//initialise no input errors assumed initially before we test
//	$input_error = 0;
//
//	if (strlen($_POST['name']) == 0)
//	{
//		$input_error = 1;
//		display_error(_("The cashflow categories name cannot be empty."));
//		set_focus('name');
//	}
//	$pr1 = check_num('provision', 0,100);
//	if (!$pr1 || !check_num('provision2', 0, 100)) {
//		$input_error = 1;
//		display_error( _("Salesman provision cannot be less than 0 or more than 100%."));
//		set_focus(!$pr1 ? 'provision' : 'provision2');
//	}
//	if (!check_num('break_pt', 0)) {
//		$input_error = 1;
//		display_error( _("Salesman provision breakpoint must be numeric and not less than 0."));
//		set_focus('break_pt');
//	}
	if ($input_error != 1)
	{
		if ($selected_id != -1)
		{
			/*selected_id could also exist if submit had not been clicked this code would not run in this case cos submit is false of course  see the delete code below*/
			update_cashflow_gl($selected_id, $_POST['name'], $_POST['c_type'], $_POST['gl_account']);
		}
		else
		{
			/*Selected group is null cos no item selected on first time round so must be adding a record must be submitting new entries in the new Sales-person form */
			add_cashflow_gl($_POST['name'], $_POST['gl_account']);
		}

		if ($selected_id != -1)
			display_notification(_('Selected cashflow_gl_account data have been updated'));
		else
			display_notification(_('New cashflow_gl_account data have been added'));
		$Mode = 'RESET';
	}
}
if ($Mode == 'Delete')
{
	//the link to delete a selected record was clicked instead of the submit button

	// PREVENT DELETES IF DEPENDENT RECORDS IN 'debtors_master'

//	if (key_in_foreign_table($selected_id, 'cust_branch', 'cashflow_categories'))
//	{
//		display_error(_("Cannot delete this cashflow categories because categories are set up referring to this cashflow_categories - first alter the categories concerned."));
//	}
//	else
//	{
	delete_cashflow_gl($selected_id);
	display_notification(_('Selected cashflow_gl_account data have been deleted'));
//	}
	$Mode = 'RESET';
}

if ($Mode == 'RESET')
{
	$selected_id = -1;
	$sav = get_post('show_inactive');
	unset($_POST);
	$_POST['show_inactive'] = $sav;
}
//------------------------------------------------------------------------------------------------

$result = get_gl_acc_(check_value('show_inactive'));
?>

	<!DOCTYPE html>
	<html>
	<head>
		<title></title>

		<!--	<link rel="stylesheet" href="http://cdn.kendostatic.com/2012.2.710/styles/kendo.blueopal.min.css" />-->
		<script src="styles/kendo.common.min.css"></script>

		<script src="js/jquery.min.js"></script>
		<script src="js/kendo.all.min.js"></script>
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
						<a href="gl_setup.php">	<i class="fa fa-dashboard " style="margin-right: 5px;">  </i> Main</a>
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

					<li  class="k-state-active"  style="background-color: #337ab7;"  >
						<i class="fa fa-area-chart" style="margin-right: 5px;"></i> Cash Flow
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
start_table(TABLESTYLE, "width='50%'");
$th = array(_("Name"), _("Cash Flow Type"), _("GL_Account")  , "", "");
inactive_control_column($th);
table_header($th);

$k = 0;

//marina
while ($myrow = db_fetch($result))
{
//
//
//	if ($myrow["flowtype"] == 0)
//
//	{
//		$a = 'No';
//
//	}
//	else
//	{
//		$a = 'Yes';
//
//	}
////////////
	alt_table_row_color($k);
//    label_cell($myrow["name"]);
	$c_type = get_c_type_id($myrow["cashflow_category_id"]);
	$cflow_type=get_c_types_name($c_type);
	label_cell(get_cash_flow_category($myrow["cashflow_category_id"]));
	label_cell($cflow_type);

	label_cell(get_gl_account2($myrow["gl_account"]));

	inactive_control_cell($myrow["id"], $myrow["inactive"], 'gl_acc', 'id');
	edit_button_cell("Edit".$myrow["id"], _("Edit"));
	delete_button_cell("Delete".$myrow["id"], _("Delete"));
	end_row();

} //END WHILE LIST LOOP

inactive_control_row($th);
end_table();
echo '<br>';

//------------------------------------------------------------------------------------------------

//$_POST['salesman_email'] = "";
if ($selected_id != -1) {
	if ($Mode == 'Edit') {
		//editing an existing Sales-person
		//display_error($selected_id);
		$myrow = get_gl_acc_($selected_id);

		$_POST['name'] = $myrow["name"];
//		$_POST['c_type'] = $myrow["c_type"];
		$_POST['gl_account'] = $myrow["gl_account"];
	}
	hidden('selected_id', $selected_id);
}

start_table(TABLESTYLE2);

//text_row_ex(_("Name:"), 'name', 30);
cashflow_categories_list_row( _("Cashflow Category:"), 'name', null);
gl_all_accounts_list_row(_("GL Account:"), 'gl_account');
//yesno_list_row(_("Flow Type:"), 'flowtype', $_POST['flowtype'] , $name_yes="", $name_no="", false);
//text_row_ex(_("Flow Type:"), 'flowtype', 20);
end_table(1);

?>


	<center> <div id="example" style="background-color: #79B3D4; width: 400px;">
			<div class="demo-section k-content" style="background-color: #79B3D4; " >
				<div id="tabstrip1" style="background-color: #79B3D4; ">
					<ul style="background-color: #79B3D4;">


						<li  style="background-color: #79B3D4;" >
							<a href="cashflow_categories.php"  target="_blank"><i class="fa fa-dashboard " style="margin-right: 5px;">  </i> cash flow Catagries</a>
						</li>


						<li  style="background-color: #79B3D4;">
							<a href="cashflow_type.php"  target="_blank"> <i class="fa fa-line-chart" style="margin-right: 5px;"></i> cash flow type</a>
						</li>


					</ul>

				</div>
			</div>

			<script>
				$(document).ready(function() {
					$("#tabstrip1").kendoTabStrip({
						animation:  {
							open: {
								effects: "fadeIn"
							}
						}
					});
				});
			</script>
		</div></center>
	<br>
<?php
submit_add_or_update_center($selected_id == -1, '', 'both');

end_form();

end_page();


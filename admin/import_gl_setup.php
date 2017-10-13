<?php
$page_security = 'SA_GLSETUP';
$path_to_root="..";
include($path_to_root . "/includes/session.inc");

page(_($help_context = "System and General GL Setup"));

include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/ui.inc");
include_once($path_to_root . "/includes/data_checks.inc");

include_once($path_to_root . "/admin/db/gl_set_db.inc");

simple_page_mode(true);


if (isset($_POST['submit']))
{

	$input_error = 0;

	if ($input_error != 1)
	{
		if ($account != -1)
		{
			update_sys_pay ($_POST['Landing_Amt'], $_POST['account'],$_POST['text_field'],$_POST['text_field_n']);
			update_sys_pay_account($_POST['INS_Amt'], $_POST['account'],$_POST['text_field_1'],$_POST['text_field_n1']);
			update_sys($_POST['F_E_D_Amt'], $_POST['account'],$_POST['text_field_2'],$_POST['text_field_n2']);
			update_sys_pay_list($_POST['Duty_Amt'], $_POST['account'],$_POST['text_field_3'],$_POST['text_field_n3']);
			update_sys_pay_taxes($_POST['S_T_Amt'], $_POST['account'],$_POST['text_field_4'],$_POST['text_field_n4']);
			update_sys_pay_i_taxes($_POST['I_Tax_Amt'], $_POST['account'],$_POST['text_field_5'],$_POST['text_field_n5']);
			update_sys_pay_add_taxes($_POST['Add_S_T_Amt'], $_POST['account'],$_POST['text_field_6'],$_POST['text_field_n6']);
			update_sys_pay_other_expense($_POST['Other_Expense'], $_POST['account'],$_POST['text_field_7'],$_POST['text_field_n7']);
			$note = _('Selected gl accounts has been updated');
		}
		else
		{
			//add_emp_dept($_POST['description']);
			//$note = _('New sales group has been added');
		}

		display_notification($note);
		$Mode = 'RESET';
	}
}

if ($Mode == 'Delete')
{

	$cancel_delete = 0;

	$Mode = 'RESET';
}

if ($Mode == 'RESET')
{
	$selected_id = -1;
	$sav = get_post('show_inactive');
	unset($_POST);
	if ($sav) $_POST['show_inactive'] = 1;
}
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
    <style>

        ul li a:hover{background-color:#337ab7;}

    </style>
    <body>

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
                    <li  style="background-color: #79B3D4;">
						<a href="item_pref.php"><i class="fa fa-barcode" style="margin-right: 5px;"></i> Item Pref</a>
                    </li>

                    <li   style="background-color: #79B3D4;" >
                        <a href="company_preferences_new.php"><i class="fa fa-circle-o" style="margin-right: 5px;"></i> Form Display</a>
                    </li >


                    <li  style="background-color: #79B3D4;">
                        <a href="print_from_setup.php"><i class="fa fa-pie-chart" style="margin-right: 5px;"></i> Report Display</a>
                    </li>

                    <li class="k-state-active"  style="background-color: #337ab7;"    >
                        <i class="fa fa-ship" style="margin-right: 5px;"></i> Import GL
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
start_form();

//-------------------------------------------------------------------------------------------------

start_table(TABLESTYLE2);

text_cells_ex(_("Type 1:"),'text_field',20,50,get_sys_pay_pref_field('Landing_Amt'));
text_row_ex(_("Default Value"),'text_field_n',20,50,null,get_sys_pay_pref_field_n('Landing_Amt'));
gl_all_accounts_list_row(_(""), 'Landing_Amt', get_sys_pay_pref('Landing_Amt'));


text_cells_ex(_("Type 2:"),'text_field_1',20,50,get_sys_pay_pref_field('INS_Amt'));
text_row_ex(_("Default Value"),'text_field_n1',20,50,null,get_sys_pay_pref_field_n('INS_Amt'));
gl_all_accounts_list_row(_(""), 'INS_Amt', get_sys_pay_pref('INS_Amt'));


text_cells_ex(_("Type 3:"),'text_field_2',20,50,get_sys_pay_pref_field('F_E_D_Amt'));
text_row_ex(_("Default Value"),'text_field_n2',20,50,null,get_sys_pay_pref_field_n('F_E_D_Amt'));
gl_all_accounts_list_row(_(""), 'F_E_D_Amt', get_sys_pay_pref('F_E_D_Amt'));


text_cells_ex(_("Type 4:"),'text_field_3',20,50,get_sys_pay_pref_field('Duty_Amt'));
text_row_ex(_("Default Value"),'text_field_n3',20,50,null,get_sys_pay_pref_field_n('Duty_Amt'));

gl_all_accounts_list_row(_(""), 'Duty_Amt', get_sys_pay_pref('Duty_Amt'));


text_cells_ex(_("Type 5:"),'text_field_4',20,50,get_sys_pay_pref_field('S_T_Amt'));
text_row_ex(_("Default Value"),'text_field_n4',20,50,null,get_sys_pay_pref_field_n('S_T_Amt'));
gl_all_accounts_list_row(_(""), 'S_T_Amt', get_sys_pay_pref('S_T_Amt'));

text_cells_ex(_("Type 6:"),'text_field_5',20,50,get_sys_pay_pref_field('I_Tax_Amt'));
text_row_ex(_("Default Value"),'text_field_n5',20,50,null,get_sys_pay_pref_field_n('I_Tax_Amt'));
gl_all_accounts_list_row(_(""), 'I_Tax_Amt', get_sys_pay_pref('I_Tax_Amt'));

text_cells_ex(_("Type 7:"),'text_field_6',20,50,get_sys_pay_pref_field('Add_S_T_Amt'));
text_row_ex(_("Default Value"),'text_field_n6',20,50,null,get_sys_pay_pref_field_n('Add_S_T_Amt'));

gl_all_accounts_list_row(_(""), 'Add_S_T_Amt', get_sys_pay_pref('Add_S_T_Amt'));

text_cells_ex(_("Type 8:"),'text_field_7', 20, 50, get_sys_pay_pref_field('Other_Expense'));
text_row_ex(_("Default Value"),'text_field_n7',20,50,null,get_sys_pay_pref_field_n('Other_Expense'));
gl_all_accounts_list_row(_(""), 'Other_Expense', get_sys_pay_pref('Other_Expense'));

end_table(1);

submit_center('submit', _("Update"), true, '', 'default');
end_form();

end_page();
?>

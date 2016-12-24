<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WPB | Item</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Bootstrap table --> 
  <link rel="stylesheet" href="../../plugins/bootstrap-table/bootstrap-table.css">
  <link rel="stylesheet" href="../../plugins/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.css">
  
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">

 <jsp:include page="../upper-navbar.html" />
  
 <jsp:include page="../left-sidebar.html" />
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Items
        <small>here we have a list of all items</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/restaurantProject/pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Items</li>
      </ol>
    </section>
        
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- /.col -->
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-body table-responsive">
                    <div class="toolbar">
            			<button id="create" class="create btn btn-default">Create Item</button>
            			<button id="delete" class="remove btn btn-danger" disabled>Delete</button>
        			</div>
              <table id="table"
              data-toggle="table"
              data-url="../../listItem"
              data-method="post"
              data-content-type="application/x-www-form-urlencoded"
              data-query-params='action=list'
              data-striped="true"
              data-show-columns="true"
              data-pagination="true"
              data-pagination-loop="false"
              data-show-refresh="true"
              data-search="true"
              data-resizable="true"
              data-show-toggle="true"
              data-toolbar=".toolbar"
              data-show-export="true">
              	<thead>
    				<tr>
    					<th data-field="state" data-checkbox="true"></th>
        				<th data-field="id" data-sortable="true" data-width="8%">Id</th>
        				<th data-field="version_number" data-visible="false" ></th>
        				<th data-field="name" data-sortable="true" data-width="30%">Name</th>
        				<th data-field="foodClass.name" data-sortable="true">Food class</th>
        				<th data-field="price" data-sortable="true" data-align="right" data-formatter="priceFormatter">Price</th>
        				<th data-field="available" data-sortable="true" data-sorter="boolSorter" data-formatter="boolFormatter" data-align="center">Availability</th>
    					<th data-field="action" data-align="center" data-formatter="actionFormatter" data-events="actionEvents" data-width="8%">Edit</th>
    				</tr>
    			</thead>             
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <jsp:include page="../footer.html" />
  
    
  
  
  <div class="modal fade" tabindex="-1" role="dialog" id="crud-modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" form="crud-form" class="btn btn-primary" id="modal-button">Submit</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->
 
 <div class="modal hide fade" tabindex="-1" role="dialog" id="del-modal">
  <div class="modal-body">
    Are you sure?
  </div>
  <div class="modal-footer">
    <button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Delete</button>
    <button type="button" data-dismiss="modal" class="btn">Cancel</button>
  </div>
</div>
 
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- Page specific script --> 
<script src="../../plugins/bootstrap-table/bootstrap-table.min.js"></script>
<!-- put your locale files after bootstrap-table.js -->
<script src="../../plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
<!-- extensions for bootstrap-table -->
<script src="../../plugins/bootstrap-table/extensions/tableExport-jquery/tableExport.min.js"></script>
<script src="../../plugins/bootstrap-table/extensions/export/bootstrap-table-export.min.js"></script>
<script src="../../plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.min.js"></script>
<script src="../../plugins/bootstrap-table/extensions/colResizable/colResizable-1.6.min.js"></script>
<script src="../../plugins/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.min.js"></script>
<!-- scripts for modal and its validation -->
<script src="../../plugins/eModal/eModal.js"></script>
<script src="/restaurantProject/plugins/validator/validator.min.js"></script>
<!-- custom scripts -->
<script src="/restaurantProject/pages/tables/tableutil.js"></script>
<script src="/restaurantProject/pages/tables/crud.js"></script>
<script>
	
	const API_URL = '/restaurantProject/listItem';
	var $table = $('#table');
	var $create = $('#create');
	var $edit = $('.edit');
	var $delete = $('#delete');
	var $modal = $('#crud-modal');
	var $modalBody = $('.modal-body');
	var $modalButton = $('#modal-button');
	var $modalTitle = $('.modal-title');
	var editText = ['Edit Item', 'Edit'];
	var createText = ['Create new Item', 'Create'];
	var deleteText = ["Are you sure to delete the entries with the following id's?", 'Create'];
	var selection = [];

	$(document).ready(function() {
		initCRUD();
    });
	
	
	
</script>
</body>
</html>


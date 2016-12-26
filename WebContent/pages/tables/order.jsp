<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WPB | Orders</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Bootstrap table -->
<link rel="stylesheet"
	href="../../plugins/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet"
	href="../../plugins/bootstrap-table-examples/assets/examples.css">

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

		<jsp:include page="../../WEB-INF/upper-navbar.html" />

		<jsp:include page="../../WEB-INF/left-sidebar.html" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Orders <small>here we have a list of all orders</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/restaurantProject/pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Tables</a></li>
					<li class="active">Take-Away Orders</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<div class="box box-primary">
							<table id="table" data-detail-view="true" data-striped="true"
								data-pagination="true" data-pagination-loop="false"
								data-page-size="25" data-show-refresh="true" data-search="true"
								data-resizable="true" data-show-toggle="true"
								data-show-export="true" data-detail-formatter="detailFormatter"
								data-url="../../plugins/bootstrap-table-examples/json/data5.json">
								<thead>
									<tr>
										<th data-field="order_id" data-sortable="true">ID</th>
										<th data-field="orderDate" data-sortable="true">Order
											Date</th>
										<th data-field="totalCost" data-sortable="true">Total
											Cost</th>
										<th data-field="comment" data-sortable="true">Comment</th>
									</tr>
								</thead>
							</table>

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
		
		<jsp:include page="../../WEB-INF/footer.html" />
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
	<script src="../../plugins/bootstrap-table/bootstrap-table.js"></script>
	<!-- put your locale files after bootstrap-table.js -->
	<script src="../../plugins/bootstrap-table-examples/ga.js"></script>
	<script
		src="../../plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
	<!-- extensions for bootstrap-table -->
	<script
		src="../../plugins/bootstrap-table/extensions/tableExport-jquery/tableExport.js"></script>
	<script
		src="../../plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
	<script
		src="../../plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js"></script>
	<script
		src="../../plugins/bootstrap-table/extensions/colResizable/colResizable-1.6.js"></script>
	<script>
		function availableFormatter(value, row) {
			var icon = row.available === true ? 'fa-check' : 'fa-times';
			return '<i class="fa ' + icon + '"></i>';
		}

		function availableSorter(a, b) {
			if (a === true)
				return 1;
			if (a === false)
				return -1;
			return 0;
		}

		//Chinese guy's table
		var $table = $('#table');

		$(function() {
			buildTable($table, 5, 30);
		});

		function expandTable($detail, cells) {
			buildTable($detail.html('<table></table>').find('table'), cells, 1);
		}

		function buildTable($el, cells, rows) {
			var i, j, row, columns = [], data = [];

			for (i = 0; i < cells; i++) {
				columns.push({
					field : 'field' + i,
					title : 'Cell' + i,
					sortable : true
				});
			}
			for (i = 0; i < rows; i++) {
				row = {};
				for (j = 0; j < cells; j++) {
					row['field' + j] = 'Row-' + i + '-' + j;
				}
				data.push(row);
			}
			$el.bootstrapTable({
				columns : columns,
				data : data,
				detailView : cells > 1,
				onExpandRow : function(index, row, $detail) {
					expandTable($detail, cells - 1);
				}
			});
		}
	</script>
</body>
</html>


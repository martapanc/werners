<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WPB | Take-Away</title>
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
<style>
.box-body {
	min-height: 270px;
}

.fa-plus-square, .fa-minus-square {
	color: #3C8DBC;
}
</style>

</head>
<body class="hold-transition skin-red sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../../WEB-INF/upper-navbar.jsp" />

		<jsp:include page="../../WEB-INF/left-sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Take-Away Order <small>Customer View</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="../pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Customer View</a></li>
					<li class="active">Take-Away Order</li>
				</ol>
			</section>

			<jsp:include page="../../WEB-INF/customer/takeawayOrderContent.jsp" />
		</div>
		<!-- ./wrapper -->

		<jsp:include page="../../WEB-INF/footer.html" />

		<!-- jQuery 2.2.3 -->
		<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="../../bootstrap/js/bootstrap.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<!-- FastClick -->
		<script src="../../plugins/fastclick/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="../../dist/js/app.min.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script src="../../dist/js/demo.js"></script>
		<!-- Page specific script -->
		<script src="../../plugins/bootstrap-table/bootstrap-table.js"></script>
		<!-- put your locale files after bootstrap-table.js -->
		<script src="../../plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
		<!-- extensions for bootstrap-table -->
		<script src="../../plugins/bootstrap-table/extensions/tableExport-jquery/tableExport.js"></script>
		<script src="../../plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
		<script src="../../plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js"></script>
		<script src="../../plugins/bootstrap-table/extensions/colResizable/colResizable-1.6.js"></script>
		<script src="../../plugins/bootstrap-table/extensions/filter-control/bootstrap-table-filter-control.js"></script>
		<script src="../tables/tableutil.js"></script>
		<script src="js/takeawayOrderUtil.js"></script>
		<script>
			$(document).ready(function() {
				$('#ta-order-menu').addClass('active');
			});
		</script>
</body>
</html>

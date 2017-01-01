<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WPB | Take-Away Invoice</title>

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="/restaurantProject/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="/restaurantProject/plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="/restaurantProject/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/restaurantProject/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="/restaurantProject/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="/restaurantProject/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet" href="/restaurantProject/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet" href="/restaurantProject/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="/restaurantProject/plugins/select2/select2.min.css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
				Your Reservation <small>#007612</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Customer</a></li>
				<li class="active">Take-Away Invoice</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="invoice"> <!-- title row -->
		
			</section>
			<!-- /.content -->
			<div class="clearfix"></div>
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../../WEB-INF/footer.html" />
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="/restaurantProject/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="/restaurantProject/bootstrap/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="/restaurantProject/plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="/restaurantProject/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="/restaurantProject/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="/restaurantProject/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="/restaurantProject/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script src="/restaurantProject/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="/restaurantProject/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="/restaurantProject/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="/restaurantProject/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="/restaurantProject/plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="/restaurantProject/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/restaurantProject/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/restaurantProject/dist/js/demo.js"></script>
	<script src="../../plugins/bootstrap-table/bootstrap-table.js"></script>
	<!-- put your locale files after bootstrap-table.js -->
	<script src="../../plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
	<!-- extensions for bootstrap-table -->
	<script src="../../plugins/bootstrap-table/extensions/tableExport-jquery/tableExport.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/colResizable/colResizable-1.6.js"></script>
	
	<script>
		$(function() {

			$(document).ready(function() {
				$('#customer-menu').addClass('active');
			});
		});
	
	</script>

</body>
</html>

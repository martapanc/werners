<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WPB | Reservation Invoice</title>
<link rel="icon" href="../../dist/img/favicon.png">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="../../plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet" href="../../plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet" href="../../plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="../../plugins/select2/select2.min.css">


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
				<li class="active">Invoice</li>
			</ol>
			</section>


			<!-- Main content -->
			<section class="invoice"> <!-- title row -->
			<div class="row">
				<div class="col-xs-12">
					<h2 class="page-header">
						<img src="../../dist/img/burger-160x160.jpg" width="40"> &ensp;Werner's Panini & Burgers <span
							class="pull-right"><h4>
								Date: &ensp;<strong>${todayDate}</strong>
							</h4> </span>
					</h2>
				</div>
				<!-- /.col -->
			</div>
			<!-- info row -->
			<div class="row invoice-info">
				<div class="col-sm-4 invoice-col">
					<span class="lead">Reservation details</span><br>
					<h4>
						<strong>${map.get("title")}</strong> &ensp; ${map.get("firstname")} ${map.get("lastname")} <br> <strong>Tel: </strong>
						&ensp; ${map.get("telephone")}<br> <strong>Email:</strong> &ensp; ${map.get("email")}<br>
					</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					<span class="lead">Your reservation</span><br>
					<h4>
						<strong>Date:</strong> &ensp; ${map.get("date")}<br> <strong>Time:</strong> &ensp; ${map.get("time")}<br> <strong>Number
							of guests: </strong>&ensp; ${map.get("guests")}<br>
					</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-4">
					<p class="lead">Payment Methods we accept:</p>
					<img src="../../dist/img/credit/visa.png" alt="Visa"> <img
						src="../../dist/img/credit/mastercard.png" alt="Mastercard"> <img
						src="../../dist/img/credit/mestro.png" alt="Maestro"> <img
						src="../../dist/img/credit/american-express.png" alt="American Express"> <img
						src="../../dist/img/credit/cash.ico" height="45" alt="Cash">
				</div>
			</div>
			<!-- /.row --> <!-- Table row -->
			<div class="row no-print">
				<div class="col-xs-12">
					<h2 class="page-footer">
						<!-- 	<a target="_blank"
						class="btn btn-default pull-right"><i class="fa fa-print"></i> Print</a>-->
						<button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
							<i class="fa fa-download"></i> Generate PDF
						</button>
						<button type="button" class="btn btn-default pull-right" style="margin-right: 5px;">
							<i class="fa fa-print"></i> Print
						</button>
					</h2>
				</div>
				<!-- /.col -->
			</div>

			</section>
			<!-- /.content -->
			<div class="clearfix"></div>
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../../WEB-INF/footer.html" />
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="../../plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
	<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="../../plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="../../plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="../../plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	<script>
		$(function() {

			$(document).ready(function() {
				$('#customer-menu').addClass('active');
			});
		});
	</script>

</body>
</html>

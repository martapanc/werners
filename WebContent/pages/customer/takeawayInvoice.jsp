
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WPB | Take-Away Invoice</title>

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="/restaurantProject/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="/restaurantProject/plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/restaurantProject/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/restaurantProject/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="/restaurantProject/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="/restaurantProject/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="/restaurantProject/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="/restaurantProject/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="/restaurantProject/plugins/select2/select2.min.css">


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
				Your Order <small>#007612</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Customer</a></li>
				<li class="active">Order</li>
			</ol>
			</section>


			<!-- Main content -->
			<section class="invoice"> <!-- title row -->
			<div class="row">
				<div class="col-xs-12">
					<h2 class="page-header">
						<img src="/restaurantProject/dist/img/burger-160x160.jpg"
							width="40"> &ensp;Werner's Panini & Burgers <span
							class="pull-right">
							<h4 class="date">
								
							</h4> </span>
					</h2>
				</div>
				<!-- /.col -->
			</div>
			<!-- info row -->
			<div class="row invoice-info">
				<div class="col-sm-4 invoice-col">
					From
					<address>
						<strong>Admin, Inc.</strong><br> 795 Folsom Ave, Suite 600<br>
						San Francisco, CA 94107<br> Phone: (804) 123-5432<br>
						Email: info@almasaeedstudio.com
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					To
					<address>
						<strong>John Doe</strong><br> 795 Folsom Ave, Suite 600<br>
						San Francisco, CA 94107<br> Phone: (555) 539-1037<br>
						Email: john.doe@example.com
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					<b>Invoice #007612</b><br> <br> <b>Order ID:</b> 4F3S8J<br>
					<b>Payment Due:</b> 2/22/2014<br> <b>Account:</b> 968-34567
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> <!-- Table row -->
			<div class="row">
				<div class="col-xs-6 table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Item</th>
								<th>Quantity</th>
								<th>Cost</th>
							</tr>
						</thead>
						<tbody class="cart">
							
						</tbody>
					</table>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<!-- accepted payments column -->
				<div class="col-xs-6">
					<p class="lead">Payment Methods:</p>
					<img src="../../dist/img/credit/visa.png" alt="Visa"> <img
						src="../../dist/img/credit/mastercard.png" alt="Mastercard">
					<img src="../../dist/img/credit/american-express.png"
						alt="American Express"> <img
						src="../../dist/img/credit/paypal2.png" alt="Paypal">

					<p class="text-muted well well-sm no-shadow"
						style="margin-top: 10px;">Etsy doostang zoodles disqus groupon
						greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg
						dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.</p>
				</div>
				<!-- /.col -->
				<div class="col-xs-6">
					<p class="lead">Amount Due 2/22/2014</p>

					<div class="table-responsive">
						<table class="table">
							<tr>
								<th style="width: 50%">Subtotal:</th>
								<td>$250.30</td>
							</tr>
							<tr>
								<th>Tax (9.3%)</th>
								<td>$10.34</td>
							</tr>
							<tr>
								<th>Shipping:</th>
								<td>$5.80</td>
							</tr>
							<tr>
								<th>Total:</th>
								<td>$265.24</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> <!-- this row will not appear when printing -->
			<div class="row no-print">
				<div class="col-xs-12">
					<a href="invoice-print.html" target="_blank"
						class="btn btn-default"><i class="fa fa-print"></i> Print</a>
					<button type="button" class="btn btn-success pull-right">
						<i class="fa fa-credit-card"></i> Submit Payment
					</button>
					<button type="button" class="btn btn-primary pull-right"
						style="margin-right: 5px;">
						<i class="fa fa-download"></i> Generate PDF
					</button>
				</div>
			</div>
			</section>
			<!-- /.content -->
			<div class="clearfix"></div>
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../footer.html" />
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
	<script
		src="/restaurantProject/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="/restaurantProject/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script
		src="/restaurantProject/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script
		src="/restaurantProject/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- bootstrap color picker -->
	<script
		src="/restaurantProject/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script
		src="/restaurantProject/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script
		src="/restaurantProject/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="/restaurantProject/plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="/restaurantProject/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/restaurantProject/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/restaurantProject/dist/js/demo.js"></script>
	<script src="/restaurantProject/bootstrap/js/angular.min.js"></script>
	<script>
	
		$(".date").html("Date: &ensp;<strong>" + new Date() + "</strong>");
		
		var cart = JSON.parse(localStorage.getItem("data"));
		console.log(cart);
		
		cart.forEach(function(entry) {
			$(".cart").append("<tr><td>" + entry.name + "</td><td>" + entry.qnt + "</td><td>€ " + entry.totPrice.toFixed(2) + "</td></tr>");
		});
		
		
		$(function() {

			$(document).ready(function() {
				$('#customer-menu').addClass('active');
			});
		});
		
		localStorage.clear();
	</script>

</body>
</html>

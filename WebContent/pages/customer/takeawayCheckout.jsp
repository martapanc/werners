
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<jsp:include page="../../WEB-INF/upper-navbar.html" />

		<jsp:include page="../../WEB-INF/left-sidebar.html" />

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
						<img src="/restaurantProject/dist/img/burger-160x160.jpg" width="40"> &ensp;Werner's Panini & Burgers <span
							class="pull-right">
							<h4 class="date"></h4>
						</span>
					</h2>
				</div>
				<!-- /.col -->
			</div>
			<!-- info row -->

			<div class="row">
				<div class="col-md-12">
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">Take-Away Checkout</h3>
						</div>

						<form id="reservation-form" method="post" action="/restaurantProject/TakeawayServlet">
							<div class="box-body">
								<div class="col-md-1">
									<!-- Title -->
									<label for="title">Title:</label> <select name="title" class="form-control">
										<option value="Mr" selected>Mr</option>
										<option value="Mrs">Mrs</option>
										<option value="Ms">Ms</option>
										<option value="Dr">Dr</option>
										<option value="Madam">Madam</option>
										<option value="Prince">Prince</option>
										<option value="Princess">Princess</option>
										<option value="Lord">Lord</option>
										<option value="Lady">Lady</option>
									</select>
									<!-- /.form group -->
								</div>

								<div class="col-md-5">
									<!-- First name -->
									<div class="form-group">
										<label>First name:</label> <input id="fn" name="firstname" type="text" class="form-control" placeholder="John" required>
									</div>
									<!-- /.form group -->
								</div>

								<div class="col-md-6">
									<!-- Last name -->
									<div class="bootstrap-timepicker">
										<div class="form-group">
											<label>Last name:</label> <input name="lastname" type="text" class="form-control" placeholder="Watson" required>
										</div>
										<!-- /.form group -->
									</div>
								</div>

								<!-- phone mask -->
								<div class="col-md-6">
									<div class="form-group">
										<label>Telephone number:</label>

										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-phone"></i>
											</div>
											<input name="telephone" type="text" class="form-control" data-inputmask='"mask": "9999999999"' min-length="10"
												data-mask required>
										</div>
										<!-- /.input group -->
									</div>
									<!-- /.form group -->
								</div>

								<!-- email mask -->
								<div class="col-md-6">
									<div class="form-group">
										<label>Email (optional):</label>

										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-at"></i>
											</div>
											<input name="email" type="email" class="form-control" placeholder="email@example.com">
										</div>
										<!-- /.input group -->
									</div>
									<!-- /.form group -->
								</div>

								<!-- Home address -->
								<div class="col-md-12">
									<div class="form-group">
										<label>Delivery Address:</label>

										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-home"></i>
											</div>
											<input name="address" type="text" class="form-control" placeholder="221B Baker St, London, UK">
										</div>
										<!-- /.input group -->
									</div>
									<!-- /.form group -->
								</div>

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
								<div class="col-sm-1"></div>

								<div class="col-sm-4">
									<p class="lead">Payment Methods we accept:</p>
									<img src="/restaurantProject/dist/img/credit/cash.ico" height="45" alt="Cash"> <img
										src="/restaurantProject/dist/img/credit/visa.png" alt="Visa"> <img
										src="/restaurantProject/dist/img/credit/mastercard.png" alt="Mastercard"> <img
										src="/restaurantProject/dist/img/credit/mestro.png" alt="Maestro"> <img
										src="/restaurantProject/dist/img/credit/american-express.png" alt="American Express"> <img
										src="/restaurantProject/dist/img/credit/paypal2.png" alt="PayPal">
								</div>

							</div>
							<!-- /. box body -->
							<div class="box-footer">
								<button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-warning">Reset</button>
								<button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
									<i class="fa fa-download"></i> Generate PDF
								</button>
								<button type="button" class="btn btn-default pull-right" style="margin-right: 5px;">
									<i class="fa fa-print"></i> Print
								</button>
							</div>

						</form>

					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
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
	<script src="/restaurantProject/bootstrap/js/date.format.js"></script>
	<script>
		var today = new Date();
		$(".date").html(
				"Date: &ensp;<strong>"
						+ today.format("ddd, dd mmm yyyy, h:MM TT")
						+ "</strong>");

		$(function() { //Display items in cart
			var cart = JSON.parse(localStorage.getItem("cart"));
			var totPrice = JSON.parse(localStorage.getItem("totPrice"));
			cart.forEach(function(entry) {
				$(".cart").append(
						"<tr><td>" + entry.name + "</td><td>" + entry.qnt
								+ "</td><td>€ " + entry.totPrice.toFixed(2)
								+ "</td></tr>");
			});
			$(".cart").append(
					"<tr><td></td><th>Total: </th><td>€ " + totPrice.toFixed(2)
							+ "</td></tr>");
			localStorage.clear();
		});

		$(function() {

			$("#submit-btn").click(function() {
				console.log($("#reservation-form").serializeArray());
			});

		});

		$(function() {
			$(document).ready(function() {
				$('#customer-menu').addClass('active');
			});
		});
	</script>

</body>
</html>

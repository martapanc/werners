<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WBP | Customer View</title>

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
<!-- DataTables -->
<link rel="stylesheet"
	href="../../plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="../../plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="../../plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="../../plugins/timepicker/bootstrap-timepicker.min.css">
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

		<jsp:include page="../upper-navbar.html" />

		<jsp:include page="../left-sidebar.html" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Online Reservation <small>Customer View</small>
			</h1>
			<ol class="breadcrumb">
					<li><a href="/restaurantProject/pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Customer View</a></li>
					<li class="active">Table Reservation</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

			<div class="row">
				<div class="col-md-12">
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">Online Table Reservation</h3>
						</div>

						<form>
							<div class="box-body">
								<div class="col-md-1">
									<!-- First name -->
									<div class="form-group">
										<label>Choose:</label> <select class="form-group select2">
											<option selected="selected">Mr</option>
											<option>Mrs</option>
											<option>Ms</option>
										</select>
									</div>
									<!-- /.form group -->
								</div>

								<div class="col-md-5">
									<!-- First name -->
									<div class="form-group">
										<label>First name:</label> <input type="text"
											class="form-control" placeholder="John">
									</div>
									<!-- /.form group -->
								</div>

								<div class="col-md-6">
									<!-- Last name -->
									<div class="bootstrap-timepicker">
										<div class="form-group">
											<label>Last name:</label> <input type="text"
												class="form-control" placeholder="Snow">
										</div>
										<!-- /.form group -->
									</div>
								</div>

								<div class="col-md-5">
									<!-- Date dd/mm/yyyy -->
									<div class="form-group">
										<label>Date:</label>

										<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right" id="datepicker">
										</div>
										<!-- /.input group -->
									</div>
									<!-- /.form group -->
								</div>

								<div class="col-md-5">
									<!-- time Picker -->
									<div class="bootstrap-timepicker">
										<div class="form-group">
											<label>Time:</label>

											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-clock-o"></i>
												</div>
												<input type="text" class="form-control timepicker"
													data-date-container="tp">
											</div>
											<!-- /.input group -->
										</div>
										<!-- /.form group -->
									</div>
								</div>

								<div class="col-md-2">
									<!-- Guest number -->
									<div class="bootstrap-timepicker">
										<div class="form-group">
											<label>Number of guests:</label>

											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-users"></i>
												</div>
												<input type="number" class="form-control" placeholder="2"
													min="1" max="40">
											</div>

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
											<input type="text" class="form-control"
												data-inputmask='"mask": "9999999999"' data-mask>
										</div>
										<!-- /.input group -->
									</div>
									<!-- /.form group -->
								</div>

								<!-- email mask -->
								<div class="col-md-6">
									<div class="form-group">
										<label>Email:</label>

										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-at"></i>
											</div>
											<input type="email" class="form-control"
												placeholder="email@example.com">
										</div>
										<!-- /.input group -->
									</div>
									<!-- /.form group -->
								</div>

							</div>
							<!-- /. box body -->
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-warning">Reset</button>
							</div>

						</form>

					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

			</div>
		</div>



		</section>
		<!-- /.content -->

		<jsp:include page="../footer.html" />
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
	<script
		src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
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
				$('#dashboard-menu').removeClass('active');
				$('#scheduler-menu').removeClass('active');
				$('#table-menu').removeClass('active');
				$('#chart-menu').removeClass('active');

				$('#calendar-menu').removeClass('active');
				$('#customer-menu').addClass('active');
			});

			//Initialize Select2 Elements
			$(".select2").select2();

			//Datemask dd/mm/yyyy
			$("#datemask").inputmask("dd/mm/yyyy", {
				"placeholder" : "dd/mm/yyyy"
			});
			//Money Euro
			$("[data-mask]").inputmask();

			//Date range picker
			$('#reservation').daterangepicker();
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			});
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						startDate : moment().subtract(29, 'days'),
						endDate : moment()
					},
					function(start, end) {
						$('#daterange-btn span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'));
					});

			//Date picker
			
			var d = new Date();
			$('#datepicker').datepicker({
				autoclose : true,
				daysOfWeekDisabled: "1",
				format: 'D, dd M yyyy',
				startDate: d,
				todayBtn: true,
				todayHighlight: true,
				weekStart: 1
			});

			//Timepicker
			$(".timepicker").timepicker({
				showInputs : false,
				container : "#tp",
				defaultTime: 'current',
				showMeridian: false
			});

		});
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>WPB | Table Reservation</title>
<link rel="icon" href="dist/img/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<!-- Bootstrap css file-->
<link href="/restaurantProject/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Superslide css file-->
<link rel="stylesheet" href="/restaurantProject/dist/css/superslides.css">
<!-- Slick slider css file -->
<link href="/restaurantProject/dist/css/slick.css" rel="stylesheet">
<!-- smooth animate css file -->
<link rel="stylesheet" href="/restaurantProject/dist/css/animate.css">
<!-- Main structure css file -->
<link href="/restaurantProject/dist/css/main/style.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="../../plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="../../plugins/iCheck/all.css">
<!-- Bootstrap Datetime Picker -->
<link rel="stylesheet" href="../../plugins/datetime-picker/bootstrap-datetimepicker.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.footer_top {
	padding: 10px;
}

.content {
	padding: 65px 10px 10px;
}
</style>
</head>
<body>
	<!-- BEGIN HEADER SECTION -->
	<header id="header">
		<!-- BEGIN MENU -->
		<div class="menu_area">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
							aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- LOGO -->
						<div class="pull-left image" style="margin: 10px">
							<img src="/restaurantProject/dist/img/burger-160x160.jpg" height="60px" class="img-circle" alt="User Image">
						</div>
						<a class="navbar-brand" href="#"><b>Werner's </b><span style="font-size: 16px">Panini&amp;Burgers</span></a>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
							<li><a href="../../homepage.html">Home</a></li>
							<li><a href="../../homepage.html#aboutUs">About Us</a></li>
							<li class="active"><a href="#">Table Reservation</a></li>
							<li><a href="takeaway-order.jsp">Take-away Order</a></li>
							<li><a href="../../loginForm.jsp">Login/Register</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</nav>
		</div>
		<!-- END MENU -->
	</header>
	<!-- END HEADER SECTION -->
	<div class="col-md-12">
		<!-- Content Wrapper. Contains page content -->
		<div class="">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Online Reservation <small></small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-md-12">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Reservation Details</h3>
							</div>

							<form id="reservation-form" method="post" action="/restaurantProject/reservation" data-toggle="validator">
								<div class="box-body">
									<div class="col-md-12">
										<div class="col-md-2">
											<!-- Title -->
											<label for="title">Title:</label> <select name="title" class="form-control">
												<option value="Mr" selected="selected">Mr</option>
												<option value="Mrs">Mrs</option>
												<option value="Ms">Ms</option>
											</select>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- First name -->
											<div class="form-group">
												<label>First name:</label> <input id="fn" name="firstname" type="text" class="form-control" placeholder="Walter"
													required>
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- Last name -->
											<div class="form-group">
												<label>Last name:</label> <input name="lastname" type="text" class="form-control" placeholder="White" required>
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="col-md-5">
											<div class="form-group">
												<label>Date:</label>
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input name="date" type="text" class="form-control pull-right" id="datepicker" required>
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- Time Picker -->
											<div class="form-group">
												<label>Time:</label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-clock-o"></i>
													</div>
													<input name="time" type="text" class="form-control" id="timepicker" required>
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-2">
											<!-- Guest number -->
											<div class="bootstrap-timepicker">
												<div class="form-group">
													<label>N.of guests:</label>

													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-users"></i>
														</div>
														<input name="guests" type="number" class="form-control" value="2" min="1" max="12">
													</div>

												</div>
												<!-- /.form group -->
											</div>
										</div>
									</div>

									<div class="col-md-6">

										<!-- phone input -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Telephone number:</label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-phone"></i>
													</div>
													<input name="telephone" type="text" pattern="^[0-9]{10}$" class="form-control">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>

										<!-- email input -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Email:</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-at"></i>
													</div>
													<input name="email" type="email" required class="form-control" placeholder="email@example.com">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>
									</div>

									<!-- comment input -->
									<div class="col-md-6">
										<div class="col-md-12">
											<div class="form-group">
												<label>Comments:</label>
												<textarea name="comment" class="form-control" style="resize: none" rows="5" id="comments"></textarea>
											</div>
											<!-- /.form group -->
										</div>
									</div>
									<div class="col-md-12">
										<div class="col-md-12">
											<button type="submit" class="btn btn-primary">Submit</button>
											<button type="reset" class="btn btn-warning">Reset</button>
										</div>
									</div>
								</div>
								<!-- /. box body -->

							</form>
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
	</div>
	
	<!-- BEGIN FOOTER SECTION -->
	<footer id="footer">
		<!-- Start footer top area -->
		<div class="footer_top">
			<div class="container">
				<div class="row">
					<div class="col-ld-3  col-md-3 col-sm-3">
						<div class="single_footer_widget">
							<h3>About Us</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type
								specimen book.</p>
						</div>
					</div>
					<div class="col-ld-3  col-md-3 col-sm-3">
						<div class="single_footer_widget">
							<h3>Community</h3>
							<ul class="footer_widget_nav">
								<li><a href="#">Our Team</a></li>
								<li><a href="#">Forum</a></li>
								<li><a href="#">News &amp; Media</a></li>
							</ul>
						</div>
					</div>
					<div class="col-ld-3  col-md-3 col-sm-3">
						<div class="single_footer_widget">
							<h3>Others</h3>
							<ul class="footer_widget_nav">
								<li><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li><a href="#">Link 4</a></li>
								<li><a href="#">Link 5</a></li>
							</ul>
						</div>
					</div>
					<div class="col-ld-3  col-md-3 col-sm-3">
						<div class="single_footer_widget">
							<h3>Social Links</h3>
							<ul class="footer_social">
								<li><a data-toggle="tooltip" data-placement="top" title="Facebook" class="soc_tooltip" href="#"><i
										class="fa fa-facebook"></i></a></li>
								<li><a data-toggle="tooltip" data-placement="top" title="Twitter" class="soc_tooltip" href="#"><i
										class="fa fa-twitter"></i></a></li>
								<li><a data-toggle="tooltip" data-placement="top" title="Google+" class="soc_tooltip" href="#"><i
										class="fa fa-google-plus"></i></a></li>
								<li><a data-toggle="tooltip" data-placement="top" title="Linkedin" class="soc_tooltip" href="#"><i
										class="fa fa-linkedin"></i></a></li>
								<li><a data-toggle="tooltip" data-placement="top" title="Youtube" class="soc_tooltip" href="#"><i
										class="fa fa-youtube"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End footer top area -->

		<!-- Start footer bottom area -->
		<div class="footer_bottom">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="pull-right hidden-xs">
							<b>Version</b> 1.0
						</div>
						<strong>Copyright &copy; 2016-2017 <a href="http://gitlab.inf.unibz.it/InMoSe_group9/">The Awesome Group 9 @
								UniBZ</a>.
						</strong> All rights reserved.
					</div>
				</div>
			</div>
		</div>
		<!-- End footer bottom area -->
	</footer>
	<!-- END FOOTER SECTION  -->



	<!-- Javascript Files -->

	<!-- initialize jQuery Library -->
	<script src="/restaurantProject/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- For smooth animatin  
    <script src="js/wow.min.js"></script>  -->
	<!-- Bootstrap js -->
	<script src="/restaurantProject/bootstrap/js/bootstrap.min.js"></script>
	<!-- slick slider -->
	<script src="/restaurantProject/dist/js/main/slick.min.js"></script>
	<!-- superslides slider -->
	<script src="/restaurantProject/dist/js/main/jquery.easing.1.3.js"></script>
	<script src="/restaurantProject/dist/js/main/jquery.animate-enhanced.min.js"></script>
	<script src="/restaurantProject/dist/js/main/jquery.superslides.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- for circle counter -->
	<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
	<!-- Gallery slider -->
	<script type="text/javascript" language="javascript" src="/restaurantProject/dist/js/main/jquery.tosrus.min.all.js"></script>
	<!-- Moment library -->
	<script src="../../plugins/moment/moment.min.js"></script>
	<!-- Date Time Picker -->
	<script src="../../plugins/datetime-picker/bootstrap-datetimepicker.min.js"></script>
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
	<!-- Form validator -->
	<script src="../../plugins/validator/validator.min.js"></script>
	<script>
			$(document).ready(function() {
				
				$('#timepicker').datetimepicker({
                    format: 'HH:mm',
                    stepping: 15,
                    defaultDate: moment()
                });
				
				$('#datepicker').datetimepicker({
                    format: 'DD MMM YYYY',
                    defaultDate: moment()
                });
						
			});
	</script>


</body>
</html>
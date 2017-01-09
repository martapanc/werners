<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WPB | Take-Away</title>
<link rel="icon" href="../../dist/img/favicon.png">
<!-- Tell the browser to be responsive to screen width -->
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

.box-body {
	min-height: 270px;
}

.fa-plus-square, .fa-minus-square {
	color: #3C8DBC;
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
							<li><a href="../../homepage.html"><i class="fa fa-home"></i>&ensp;Home</a></li>
							<li><a href="../../homepage.html#aboutUs"><i class="fa fa-info"></i>&ensp;About Us</a></li>
							<li><a href="table-reservation.jsp"><i class="fa fa-cutlery"></i>&ensp;Table Reservation</a></li>
							<li class="active"><a href="takeaway-order.jsp"><i class="fa fa-paper-plane-o"></i>&ensp;Take-away Order</a></li>
							<li><a href="../../loginForm.jsp"><i class="fa fa-user"></i>&ensp;Login/Register</a></li>
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
				<ol class="breadcrumb">
					<li><a href="../pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Customer View</a></li>
					<li class="active">Take-Away Order</li>
				</ol>
			</section>

			<section class="content">
				<div class="row">
					<div class="col-md-8">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title order-minus">Take-Away Order</h3>
							</div>

							<form>
								<div class="box-body">
									<div class="food-menu col-md-3">
										<div class="btn-group btn-block btn-group-vertical">
											<a href="#" id="burger-btn" class="btn btn-lg btn-primary  active"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/burger.svg"> &emsp;Burgers
											</a> <a href="#" id="salad-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/salad.svg"> &emsp;Salads
											</a> <a href="#" id="pizza-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/pizza-2.svg"> &emsp;Pizza
											</a> <a href="#" id="chinese-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/noodles.svg"> &emsp;Chinese
											</a> <a href="#" id="dessert-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/cupcake.svg"> &emsp;Desserts
											</a> <a href="#" id="drink-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/glass-3.svg"> &emsp;Drinks
											</a>
										</div>

									</div>
									<!-- /. food-menu -->

									<div class="food-offers col-md-9">
										<div class="thmenu-header with-border">
											<h3>BURGERS</h3>
										</div>
										<div class="col-md-12">
											<div class="box box-primary">
												<div class="box-body table-responsive">

													<table id="item-table" data-toggle="table" data-url="../../item" data-method="post"
														data-content-type="application/x-www-form-urlencoded" data-query-params='action=list' data-striped="true"
														data-pagination="true" data-pagination-loop="false" data-page-size="10" data-show-refresh="true" data-search="true"
														data-show-toggle="true">
														<thead>
															<tr>
																<th data-field="id">Id</th>
																<th data-field="name" data-sortable="true">Name</th>
																<th data-field="price" data-sortable="true" data-align="right" data-formatter="priceFormatter">Price</th>
																<!-- Should show only available items -->
																<th data-field="action" data-formatter="actionFormatter" data-events="actionEvent">Add to Cart</th>
															</tr>
														</thead>
													</table>
												</div>

												<div class="result"></div>
												<!-- /.box-body -->
											</div>
											<!-- /. box -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /. food-offers -->
								</div>
								<!-- /. box body -->
							</form>

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

					<div class="col-md-4 ">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">
									<span class="fa fa-shopping-cart"></span> &nbsp; My Order
								</h3>
							</div>

							<div class="cart-form">
								<div class="box-body">
									<table class="table table-striped order-list"></table>
								</div>
								<!-- /. box body -->

								<div id="total-price-box" class="box-footer">
									<h4>
										<span class="pull-right total-price">Total price: € 0.00</span>
									</h4>
								</div>
								<div class="box-footer">
									<button class="btn btn-primary" id="checkout-btn" disabled>Checkout</button>
									<button class="btn btn-warning" id="reset-btn">Cancel</button>
								</div>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
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
	<script>
	
	</script>


</body>
</html>
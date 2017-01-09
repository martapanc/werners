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

			<!-- Main content -->
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
		</div>



		</section>
		<!-- /.content -->

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
	<script src="../../plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
	<!-- extensions for bootstrap-table -->
	<script src="../../plugins/bootstrap-table/extensions/tableExport-jquery/tableExport.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/colResizable/colResizable-1.6.js"></script>
	<script src="../../plugins/bootstrap-table/extensions/filter-control/bootstrap-table-filter-control.js"></script>
	<script src="../tables/tableutil.js"></script>
	<script src="takeawayOrderUtil.js"></script>		

</body>
</html>

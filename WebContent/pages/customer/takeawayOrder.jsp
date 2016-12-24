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

		<jsp:include page="../upper-navbar.html" />

		<jsp:include page="../left-sidebar.html" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Take-Away Order <small>Customer View</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="/restaurantProject/pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
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
											<a href="#" id="salad-btn" class="btn btn-lg btn-primary active"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/salad.svg"> &emsp;Salads
											</a> <a href="#" id="burger-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/burger.svg"> &emsp;Burgers
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
											<h3>SALADS</h3>
										</div>
										<div class="col-md-12">
											<div class="box box-primary">
												<div class="box-body table-responsive">

													<table id="item-table" data-toggle="table" data-url="../../listItem" data-method="post"
														data-content-type="application/x-www-form-urlencoded" data-query-params='action=list' data-striped="true"
														data-pagination="true" data-pagination-loop="false" data-page-size="10" data-show-refresh="true" data-search="true"
														data-show-toggle="true">
														<thead>
															<tr>
																<th data-field="name" data-sortable="true">Name</th>
																<th data-field="price" data-sortable="true" data-align="right">Price</th>
																<!-- Should show only available items -->
																<th data-field="foodClassName"> Class</th>
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
									<table class="table table-striped order-list">
										<!-- <thead>
											<tr>
												<th></th>
												<th data-field="action" data-formatter="pmFormatter"
													data-events="pmEvents"></th> 
												<th></th> 
												<th></th> 
											</tr>							
										</thead> 
										<tbody class="order-list">
										</tbody>-->
									</table>
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

		<jsp:include page="../footer.html" />
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
	<script>
		//Show "salad" item as default view
		$(document).ready(function(){
			$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Salad"}); 
		});
		
		// Table functions
		function availableSorter(a, b) {
			if (a === true)
				return 1;
			if (a === false)
				return -1;
			return 0;
		};

		function actionFormatter(value, row, index) {
			return [
					'<a class="add" href="javascript:void(0)" title="Add to Cart">',
					'<span class="glyphicon glyphicon-plus"></span>', '</a>' ]
					.join('');
		}
		var price = 0;
		var cart = new Array();
		window.actionEvent = {
			'click .add' : function(e, value, row, index) {
				$("#checkout-btn").prop("disabled", false); //enable Checkout button when at least one item is in the cart

				//Check if the cart already includes the selected item
				var dupCheck = -1;
				cart.forEach(function(entry, i) {
					if (row.name == entry[0])
						dupCheck = i; //Store the index of the duplicate item
				});
				if (dupCheck == -1) //If the cart has no duplicates (=the loop found no match and the index did not change) push a new item
					cart.push([ row.name, 1, row.price, row.price ]);
				else {
					cart[dupCheck][1] += 1; //Else update quantity and price of the item already in cart
					cart[dupCheck][2] += cart[dupCheck][3];
				}

				$(".order-list").html(""); //Display the cart
				cart.forEach(function(entry) {
					$(".order-list").append("<tr><td>" + entry[0] + "&emsp;</td>"
							+ "<td><i class='fa fa-plus-square fa-lg'></i>&ensp;" + entry[1] 
							+ "&ensp;<i class='fa fa-minus-square fa-lg'></i></td>"
							+ "<td>&ensp;€ "+ entry[2].toFixed(2) + "</td></tr>");
					});
				price += row.price;
				$("#total-price-box").html(
						//Display the total price
						'<h4><span class="pull-right total-price">Total price: € '
								+ price.toFixed(2) + '</span></h4>');
			}
		};

		//Increase quantity on "plus" click
		$(".cart-form")
				.on("click", "i.fa-plus-square",
						function() {
							var i = $(this).parent().parent().index(); //store index of selected row
							cart[i][1] += 1; //increase quantity by 1
							cart[i][2] += cart[i][3]; //increase price by the price of a single item
							price = 0;
							cart.forEach(function(entry) { //update cart				
								price += entry[2];
							});
							$(".order-list").html("");
							cart.forEach(function(entry) { //display changes
										$(".order-list").append(
														"<tr><td>"
																+ entry[0] + "&emsp;</td>"
																+ "<td><i class='fa fa-plus-square fa-lg'></i>&ensp;"
																+ entry[1]
																+ "&ensp;<i class='fa fa-minus-square fa-lg'></i></td>"
																+ "<td>&ensp;€ "
																+ entry[2].toFixed(2)
																+ "</td></tr>");
							});
							$("#total-price-box").html(
								//update and display total price
								'<h4><span class="pull-right total-price">Total price: € '
								+ price.toFixed(2)+ '</span></h4>');

						});

		//Decrease quantity on "minus" click. Remove when qnt reaches 0
		$(".cart-form")
				.on(
						"click",
						"i.fa-minus-square",
						function() {
							var i = $(this).parent().parent().index();
							cart[i][1] -= 1;
							if (cart[i][1] != 0) {
								cart[i][2] -= cart[i][3]; //decrease price by the price of a single item
							} else {
								cart.splice(i, 1); //remove item from array when quantity reaches 0
								if (cart[0] == null)
									$("#checkout-btn").prop("disabled", true);
							}
							price = 0;
							cart.forEach(function(entry) { //update cart				
								price += entry[2];
							});
							$(".order-list").html("");
							cart
									.forEach(function(entry) {
										$(".order-list")
												.append(
														"<tr><td>"
																+ entry[0]
																+ "&emsp;</td>"
																+ "<td><i class='fa fa-plus-square fa-lg'></i>&ensp;"
																+ entry[1]
																+ "&ensp;<i class='fa fa-minus-square fa-lg'></i></td>"
																+ "<td>&ensp;€ "
																+ entry[2]
																		.toFixed(2)
																+ "</td></tr>");
									});
							$("#total-price-box")
									.html(
											'<h4><span class="pull-right total-price">Total price: € '
													+ price.toFixed(2)
													+ '</span></h4>');
						});

		//Checkout button functions
		$("#checkout-btn").on("click", function() {
			var jsoncart = {
				jcart : []
			};
			cart.forEach(function(entry) {
				jsoncart.jcart.push({
					"name" : entry[0],
					"qnt" : entry[1],
					"totPrice" : entry[2],
					"uPrice" : entry[3]
				});
			});
			var cartToSend = JSON.stringify(jsoncart.jcart);
			if (typeof (Storage) != "undefined") {
				localStorage.setItem("cart", cartToSend);
				localStorage.setItem("totPrice", price)
				console.log("Saved: " + cartToSend + "\nPrice: " + price);
			} else {
				console.log("Local storage non supported.")
			}
			window.location.href = "takeawayCheckout.jsp";
		});

		//Reset button functions
		$("#reset-btn").on(
				"click",
				function() {
					cart = new Array();
					price = 0;
					$(".order-list").html("");
					$("#total-price-box").html(
							'<h4><span class="pull-right total-price">Total price: € '
									+ price.toFixed(2) + '</span></h4>');
					$("#checkout-btn").prop("disabled", true);
				});

		$(function() {
			$(document).ready(function() {
				$('#customer-menu').addClass('active');
			});

			//Button menu functions
			$("#salad-btn").click(function() {
				removeActive();
				$(this).addClass("active");
				$('.thmenu-header').html("<h3>SALADS</h3>");
				$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Salad"});	
			});

			$("#burger-btn").on("click", function() {
				removeActive();
				$(this).addClass("active");
				$('.thmenu-header').html("<h3>BURGERS</h3>");
				$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Burger"});
			});

			$("#pizza-btn").click(function() {
				removeActive();
				$(this).addClass("active");
				$('.thmenu-header').html("<h3>PIZZAS</h3>");
				$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Pizza"});
			});
			
			$("#chinese-btn").click(function() {
				removeActive();
				$(this).addClass("active");
				$('.thmenu-header').html("<h3>CHINESE</h3>");
				$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Chinese"});
			});
			
			$("#dessert-btn").click(function() {
				removeActive();
				$(this).addClass("active");
				$('.thmenu-header').html("<h3>DESSERTS</h3>");
				$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Dessert"});
			});
			
			$("#drink-btn").click(function() {
				removeActive();
				$(this).addClass("active");
				$('.thmenu-header').html("<h3>DRINKS</h3>");
				$("#item-table").bootstrapTable('filterBy', {"foodClassName" : "Drink"});
			});

			function removeActive() {
				$("#salad-btn").removeClass("active");
				$("#burger-btn").removeClass("active");
				$("#pizza-btn").removeClass("active");
				$("#chinese-btn").removeClass("active");
				$("#dessert-btn").removeClass("active");
				$("#drink-btn").removeClass("active");
			};
		});
	</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>WPB | Takeaway Order</title>
<link rel="icon" href="../../dist/img/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<!-- Bootstrap css file-->
<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Superslide css file-->
<link rel="stylesheet" href="../../dist/css/superslides.css">
<!-- Slick slider css file -->
<link href="../../dist/css/slick.css" rel="stylesheet">
<!-- smooth animate css file -->
<link rel="stylesheet" href="../../dist/css/animate.css">
<!-- Main structure css file -->
<link href="../../dist/css/main/style.css" rel="stylesheet">
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
							<img src="../../dist/img/burger-160x160.jpg" height="60px" class="img-circle" alt="User Image">
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
			</section>

			<jsp:include page="../../WEB-INF/customer/takeawayOrderContent.jsp" />
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
	<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- For smooth animatin  
    <script src="js/wow.min.js"></script>  -->
	<!-- Bootstrap js -->
	<script src="../../bootstrap/js/bootstrap.min.js"></script>
	<!-- slick slider -->
	<script src="../../dist/js/main/slick.min.js"></script>
	<!-- superslides slider -->
	<script src="../../dist/js/main/jquery.easing.1.3.js"></script>
	<script src="../../dist/js/main/jquery.animate-enhanced.min.js"></script>
	<script src="../../dist/js/main/jquery.superslides.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- for circle counter -->
	<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
	<!-- Gallery slider -->
	<script type="text/javascript" language="javascript" src="../../dist/js/main/jquery.tosrus.min.all.js"></script>
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
	<script src="../../pages/tables/tableutil.js"></script>
	<script src="../../pages/customer/js/takeawayOrderUtil.js"></script>
	<script>
	$(document).ready(function() {
		$("#item-table").bootstrapTable('filterBy', {
			"foodClassName" : "Burger"
		});
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
				cart.push([ row.name, 1, row.price, row.price, row.id ]);
			else {
				cart[dupCheck][1] += 1; //Else update quantity and price of the item already in cart
				cart[dupCheck][2] += cart[dupCheck][3];
			}

			$(".order-list").html(""); //Display the cart
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
												+ entry[2].toFixed(2)
												+ "</td></tr>");
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
			.on(
					"click",
					"i.fa-plus-square",
					function() {
						var i = $(this).parent().parent().index(); //store index of selected row
						cart[i][1] += 1; //increase quantity by 1
						cart[i][2] += cart[i][3]; //increase price by the price of a single item
						price = 0;
						cart.forEach(function(entry) { //update cart				
							price += entry[2];
						});
						$(".order-list").html("");
						cart
								.forEach(function(entry) { //display changes
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
										//update and display total price
										'<h4><span class="pull-right total-price">Total price: € '
												+ price.toFixed(2)
												+ '</span></h4>');

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
				"uPrice" : entry[3],
				"id": entry[4]
			});
		});
		var cartToSend = JSON.stringify(jsoncart.jcart);
		if (typeof (Storage) != "undefined") {
			localStorage.setItem("cart", cartToSend);
			localStorage.setItem("totPrice", price)
			console.log("Cart saved: " + cartToSend + "\nPrice: " + price);
		} else {
			console.log("Local storage non supported.")
		}
		var session = document.getElementById("session").value;
		console.log("session " + session);
		if (session != "")
			window.location.href = "takeawayCheckout.jsp";
		else 
			window.location.href = "../../pages/home/takeaway-checkout.jsp";
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
			$("#item-table").bootstrapTable('filterBy', {
				"foodClassName" : "Salad"
			});
		});

		$("#burger-btn").on("click", function() {
			removeActive();
			$(this).addClass("active");
			$('.thmenu-header').html("<h3>BURGERS</h3>");
			$("#item-table").bootstrapTable('filterBy', {
				"foodClassName" : "Burger"
			});
		});

		$("#pizza-btn").click(function() {
			removeActive();
			$(this).addClass("active");
			$('.thmenu-header').html("<h3>PIZZAS</h3>");
			$("#item-table").bootstrapTable('filterBy', {
				"foodClassName" : "Pizza"
			});
		});

		$("#chinese-btn").click(function() {
			removeActive();
			$(this).addClass("active");
			$('.thmenu-header').html("<h3>CHINESE</h3>");
			$("#item-table").bootstrapTable('filterBy', {
				"foodClassName" : "Chinese"
			});
		});

		$("#dessert-btn").click(function() {
			removeActive();
			$(this).addClass("active");
			$('.thmenu-header').html("<h3>DESSERTS</h3>");
			$("#item-table").bootstrapTable('filterBy', {
				"foodClassName" : "Dessert"
			});
		});

		$("#drink-btn").click(function() {
			removeActive();
			$(this).addClass("active");
			$('.thmenu-header').html("<h3>DRINKS</h3>");
			$("#item-table").bootstrapTable('filterBy', {
				"foodClassName" : "Drink"
			});
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
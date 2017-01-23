
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WPB | Take-Away Invoice</title>

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">

<link rel="stylesheet" href="../../plugins/jQueryUI/jquery-ui.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<style>
.reservation-area.col-md-12 {
	font-size: 20px;
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
				Your Order <small>#007612</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Customer</a></li>
				<li class="active">Order</li>
			</ol>
			</section>
			<jsp:include page="../../WEB-INF/customer/takeawayCheckoutContent.jsp"></jsp:include>
			<div class="clearfix"></div>
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../../WEB-INF/footer.html" />
	</div>
	<!-- ./wrapper -->

	<!-- Javascript -->
	<div>
		<!-- jQuery 2.2.3 -->
		<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="../../bootstrap/js/bootstrap.min.js"></script>
		<!-- Moment -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
		<!-- FastClick -->
		<script src="../../plugins/fastclick/fastclick.js"></script>
		<!-- AdminLTE App -->
		<script src="../../dist/js/app.min.js"></script>
		<script src="../../bootstrap/js/date.format.js"></script>
		<script src="../../plugins/bootstrapvalidator/dist/js/bootstrapValidator.min.js"></script>
		<script src="js/takeawayCheckoutUtil.js?2"></script>
	</div>
	<script>
		$(function() {
			$(document).ready(function() {
				$('#ta-order-menu').addClass('active');
			});
		});
		
		var session = '${sessionScope.userSession.user.id}';

		$.ajax({
			type : 'POST',
			cache : false,
			url : "/restaurantProject/user",
			data : {
				"session" : session,
				"action" : "getData"
			},
			success : function(response) {
				var tel = response.phoneNumber;
				var add = response.billingAddress;
				var comment = response.comment;
				$("#address").val(add);
				$("#telephone").val(tel);
			},
			error : function(error) {
				console.log(error);
			}
		});
	</script>
</body>
</html>

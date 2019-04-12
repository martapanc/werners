<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WPB | Table Reservation</title>

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">
<!-- Bootstrap Datetime Picker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datetime-picker/bootstrap-datetimepicker.css">
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
					Online Reservation <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="../dashboard.jsp"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Customer View</a></li>
					<li class="active">Table Reservation</li>
				</ol>
			</section>

			<jsp:include page="../../WEB-INF/customer/tableResContent.jsp" />
	</div>
	<!-- /.content-wrapper -->

	<jsp:include page="../../WEB-INF/footer.html" />

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- Moment library -->
	<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
	<!-- Date Time Picker -->
	<script src="${pageContext.request.contextPath}/plugins/datetime-picker/bootstrap-datetimepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

	<!-- Form validator -->
	<script src="${pageContext.request.contextPath}/plugins/validator/validator.min.js"></script>
	<script>
			$(document).ready(function() {
				$('#reservation-menu').addClass('active');
				
				$('#timepicker').datetimepicker({
                    format: 'HH:mm',
                    stepping: 15,
                    defaultDate: moment(),
                    enabledHours: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
                });
				
				$('#datepicker').datetimepicker({
                    format: 'DD MMM YYYY',
                    defaultDate: moment(),
                    minDate: moment()
                });
				
				var session = document.getElementById("session").value;
				console.log("sessions: " + session);
				
				var jsAtt = '${reservationError}';
				if (jsAtt != "")
					alert(jsAtt);

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
					$("#telephone").val(tel);
				},
				error : function(error) {
					console.log(error);
				}
			});
	</script>
</body>
</html>

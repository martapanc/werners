<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WPB | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<!-- Superslide css file-->
<link rel="stylesheet" href="dist/css/superslides.css">
<!-- Slick slider css file -->
<link href="dist/css/slick.css" rel="stylesheet">
<!-- smooth animate css file -->
<link rel="stylesheet" href="dist/css/animate.css">
<!-- Main structure css file -->
<link href="dist/css/main/dashboard-style.css" rel="stylesheet">

<!-- Bootstrap table -->
<link rel="stylesheet" href="plugins/bootstrap-table/bootstrap-table.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  <style>
	.navbar-nav>li>.dropdown-menu {
		background-color: white;
	}
	
	.glyphicon-plus {
		color: #3C8DBC !important;
	}
</style>
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">

 <jsp:include page="WEB-INF/upper-navbar.jsp" />
  
 <jsp:include page="WEB-INF/left-sidebar.jsp" />

  <jsp:include page="WEB-INF/content-wrapper.jsp" />

  <jsp:include page="WEB-INF/footer.html" />
  
</div>
<!-- ./wrapper -->
<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="plugins/chartjs/Chart.min.js"></script>
	<!-- Dashboard functions -->
	<script src="${pageContext.request.contextPath}/dist/js/dashboard.js?2"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script src="plugins/bootstrap-table/bootstrap-table.js"></script>
	<!-- put your locale files after bootstrap-table.js -->
	<script src="plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
	<script src="plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js"></script>
	
	<!-- scripts for form validation ad notifications -->
	<script src="plugins/notify/bootstrap-notify.js"></script>
	<script src="plugins/validator/validator.min.js"></script>
	<!-- custom scripts -->
	<script src="pages/tables/tableutil.js"></script>
	
	
	
	<!-- slick slider -->
	<script src="dist/js/main/slick.min.js"></script>
	<!-- superslides slider -->
	<script src="dist/js/main/jquery.easing.1.3.js"></script>
	<script src="dist/js/main/jquery.animate-enhanced.min.js"></script>
	<script src="dist/js/main/jquery.superslides.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- for circle counter -->
	<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
	<!-- Gallery slider -->
	<script type="text/javascript" type="text/javascript" src="dist/js/main/jquery.tosrus.min.all.js"></script>
	<!-- Custom js-->
	<script src="dist/js/main/homepageUtil.js"></script>
	
	<script type="text/javascript">
	var ctx = "${pageContext.request.contextPath}";
	$.ajax({
		type : 'POST',
		cache : false,
		url : ctx + "/user",
		data : {
			"action" : "list"
		},
		success : function(response) {
			$("#db-user-list").html("");
			for (var i = 0; i < 8; i++) {
				$("#db-user-list").append("<li><img src='" + ctx + "/" + response[i].avatar + "' alt='User Image'>" 
						+ "<a class='users-list-name' href='#'>" + response[i].fullName + "</a> <span class='users-list-date'>" 
						+ response[i].creationDate + "</span></li>");
			}
			$("#user-count").html(response.length);
		},
		error : function(error) {
			console.log(error);
		}
	});
	
	
	
	</script>
</body>
</html>


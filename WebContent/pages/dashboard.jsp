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
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

<!-- Bootstrap table -->
<link rel="stylesheet" href="../plugins/bootstrap-table/bootstrap-table.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">

 <jsp:include page="../WEB-INF/upper-navbar.jsp" />
  
 <jsp:include page="../WEB-INF/left-sidebar.jsp" />

<jsp:include page="../WEB-INF/content-wrapper.jsp" />
  
  

  <jsp:include page="../WEB-INF/footer.html" />
  
</div>
<!-- ./wrapper -->
<!-- jQuery 2.2.3 -->
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="../plugins/chartjs/Chart.min.js"></script>
	<!-- Dashboard functions -->
	<script src="../dist/js/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	
	<!-- Page specific script -->
	<script src="../plugins/bootstrap-table/bootstrap-table.js"></script>
	<!-- put your locale files after bootstrap-table.js -->
	<script src="../plugins/bootstrap-table/locale/bootstrap-table-en-US.js"></script>
	<!-- extensions for bootstrap-table -->
	<script src="../plugins/bootstrap-table/extensions/tableExport-jquery/tableExport.js"></script>
	<script src="../plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
	<script src="../plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js"></script>
	<script src="../plugins/bootstrap-table/extensions/colResizable/colResizable-1.6.js"></script>
	<!-- scripts for form validation ad notifications -->
	<script src="../plugins/notify/bootstrap-notify.js"></script>
	<script src="../plugins/validator/validator.min.js"></script>
	<!-- custom scripts -->
	<script src="../pages/tables/tableutil.js"></script>
	<script src="../pages/tables/crud.js"></script>
	<script>
	var ctx = "${pageContext.request.contextPath}";
	$.ajax({
		type : 'POST',
		cache : false,
		url : "../user",
		data : {
			"action" : "list"
		},
		success : function(response) {
			$("#db-user-list").html("");
			response.forEach(function(entry) {
				$("#db-user-list").append("<li><img src='" + ctx + "/" + entry.avatar + "' alt='User Image'>" 
						+ "<a class='users-list-name' href='#'>" + entry.fullName + "</a> <span class='users-list-date'>" 
						+ entry.creationDate + "</span></li>");
			});
			
		},
		error : function(error) {
			console.log(error);
		}
	});
	
	</script>
</body>
</html>


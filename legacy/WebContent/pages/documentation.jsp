<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WPB | Documentation</title>
<link rel="icon" href="../dist/img/favicon.png">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">


<style>
.box-body {
	font-size: 110%;
}

h4 {
	font-weight: bold;
	font-variant: small-caps
}

.gallerycontainer {
	position: relative;
	/*Add a height attribute and set to largest image's height to prevent overlaying*/
}

a.thumbnail {
	width: 110px;
}

.thumbnail img {
	border: 1px solid white;
	margin: 0 5px 5px 0;
}

.thumbnail:hover {
	background-color: transparent;
}

.thumbnail:hover img {
	border: 1px solid blue;
}

.thumbnail span { /*CSS for enlarged image*/
	position: fixed;
	background-color: lightyellow;
	padding: 5px;
	left: -1000px;
	margin-left: 200px;
	margin-top: 50px;
	border: 1px dashed gray;
	visibility: hidden;
	color: black;
	text-decoration: none;
}

.thumbnail span img { /*CSS for enlarged image*/
	border-width: 0;
	padding: 2px;
}

.thumbnail:hover span { /*CSS for enlarged image*/
	visibility: visible;
	top: 0;
	left: 230px;
	/*position where enlarged image should offset horizontally */
	z-index: 50;
}
</style>
</head>
<body class="hold-transition skin-red sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../WEB-INF/upper-navbar.jsp" />

		<jsp:include page="../WEB-INF/left-sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Documentation</h1>
				<ol class="breadcrumb">
					<li><a href="../pages/dashboard.jsp"><i class="fa fa-home"></i> Home</a></li>
					<li class="active">Documentation</li>
				</ol>
			</section>

			<jsp:include page="../WEB-INF/documentation-content.jsp" />
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../WEB-INF/footer.html" />

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/app.min.js"></script>
	
</body>
</html>

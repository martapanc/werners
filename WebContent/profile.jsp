<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WPB | Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-red sidebar-mini">
	<div class="wrapper">

		<jsp:include page="/WEB-INF/upper-navbar.jsp" />

		<jsp:include page="/WEB-INF/left-sidebar.jsp" />

		<!-- First-Last name modal -->
		<div id="nameModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Change User Name</h4>
					</div>
					<form method="post" action="user?action=name">
						<input type="hidden" name="session" value="${sessionScope.userSession.user.id}" />
						<div class="modal-body">
							<label for="firstname"><strong>First name:</strong></label>
							<input type="text" name="firstname" class="form-control" value="${sessionScope.userSession.user.getFirstName()}">
							<label for="lastname"><strong>Last name:</strong></label><br>
							<input type="text" name="lastname" class="form-control" value="${sessionScope.userSession.user.getLastName()}">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- telephone modal -->
		<div id="telModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Change Telephone Number</h4>
					</div>
					<form method="post" action="user?action=tel">
						<input type="hidden" name="session" value="${sessionScope.userSession.user.id}" />
						<div class="modal-body">
							<label for="telephone"><strong>Telephone number:</strong></label>
							<input type="number" name="telephone" class="form-control" value="${sessionScope.userSession.user.phoneNumber}"> 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>	
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- Address modal -->
		<div id="addressModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Change Delivery Address</h4>
					</div>
					<form method="post" action="user?action=address">
						<input type="hidden" name="session" value="${sessionScope.userSession.user.id}" />
						<div class="modal-body">
							<label for="address"><strong>Address:</strong></label> 
							<input type="text" name="address" class="form-control" value="${sessionScope.userSession.user.billingAddress}"> 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- Password modal -->
		<div id="passModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Change Password</h4>
					</div>
					<form method="post" action="user?action=pw">
						<input type="hidden" name="session" value="${sessionScope.userSession.user.id}" />
						<div class="modal-body">
							<label for="oldPass"><strong>Old Password:</strong></label>
							<input type="password" name="oldPass" class="form-control" value="**********">
							<label for="newPass1"><strong>New Password:</strong></label>
							<input type="password" name="newPass1" class="form-control">
							<label for="newPass2"><strong>Confirm New Password:</strong></label>
							<input type="password" name="newPass2" class="form-control">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Profile <small></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Profile</li>

				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- /.col -->
					<div class="col-md-12">
						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<img class="profile-user-img img-responsive img-circle" src="${sessionScope.userSession.user.avatar}"
									alt="User profile picture">

								<h3 class="profile-username text-center">${sessionScope.userSession.user.fullName}</h3>

								<p class="text-muted text-center">${sessionScope.userSession.user.role.name}</p>

								<div class="col-md-8 col-md-offset-2">
									<table class="table table-striped">
										<tbody>
											<tr>
												<td><strong>Full name</strong></td>
												<td>${sessionScope.userSession.user.fullName}</td>
												<td><button class="btn btn-primary" data-toggle="modal" data-target="#nameModal">Edit</button></td>
											</tr>
											<tr>
												<td><strong>Role</strong></td>
												<td>${sessionScope.userSession.user.role.name}</td>
												<td></td>
											</tr>
											<tr>
												<td><strong>Profile Email</strong></td>
												<td>${sessionScope.userSession.user.email}</td>
												<td></td>
											</tr>
											<tr>
												<td><strong>Telephone Number</strong></td>
												<td>${sessionScope.userSession.user.phoneNumber}</td>
												<td><button class="btn btn-primary" data-toggle="modal" data-target="#telModal">Edit</button></td>
											</tr>
											<tr>
												<td><strong>Billing Address</strong></td>
												<td>${sessionScope.userSession.user.billingAddress}</td>
												<td><button class="btn btn-primary" data-toggle="modal" data-target="#addressModal">Edit</button></td>
											</tr>
											<tr>
												<td><strong>Password</strong></td>
												<td>**********</td>
												<td><button class="btn btn-primary" data-toggle="modal" data-target="#passModal">Edit</button></td>
											</tr>
											<tr>
												<td><strong>Logged in at</strong></td>
												<td>${sessionScope.userSession.loginTime}</td>
												<td></td>
											</tr>
											<tr>
												<td><strong>Member since</strong></td>
												<td>${sessionScope.userSession.user.creationDate}</td>
												<td></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
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

		<jsp:include page="/WEB-INF/footer.html" />

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script>
		
	</script>
</body>
</html>

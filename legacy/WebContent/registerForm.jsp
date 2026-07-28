<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WPB | Registration Page</title>
<link rel="icon" href="dist/img/favicon.png">
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- image picker -->
<link rel="stylesheet" href="plugins/image-picker/image-picker.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/square/blue.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="/register"><b>Werner's</b>Panini&amp;Burgers</a>
		</div>
		<div class="register-box-body">
			<p class="login-box-msg">Create a New Account</p>
			<c:if test="${message != null}">
   				<div class="alert alert-danger text-center" id="message-div">
    				${message}
  				</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/register" method="post" data-toggle="validator">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="Full name" name="fullname"required> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="email" class="form-control" placeholder="Email" name="email" required> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" id="password" class="form-control" name="password" placeholder="Password" required> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password-confirm" class="form-control" placeholder="Retype password" 
					data-match="#password" data-match-error="Passwords don't match" required> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				<div class="help-block with-errors"></div>
				</div>
				<div class="form-group has-feedback text-center">
				<p>Choose Avatar</p>
					<select class="image-picker text-center" name="avatar">
  						<option data-img-src="dist/img/avatar1.png" data-img-class="first" data-img-alt="Page 1" value="dist/img/avatar1.png" selected></option>
  						<option data-img-src="dist/img/avatar2.png" data-img-alt="Page 2" value="dist/img/avatar2.png"></option>
  						<option data-img-src="dist/img/avatar3.png" data-img-alt="Page 3" value="dist/img/avatar3.png"></option>
  						<option data-img-src="dist/img/gusteau160x160.jpg" data-img-alt="Page 4" data-img-class="last" value="dist/img/gusteau160x160.jpg"></option>
					</select>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck form-group has-feedback">
							<label> <input type="checkbox" required> I agree to the <a href="#">terms</a>
							</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4 ">
						<button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<a href="login.jsp" class="text-center">I am already registered</a>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- Image picker -->
	<script src="plugins/image-picker/image-picker.min.js"></script>
	<!-- iCheck -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	<!-- Form validator -->
	<script src="plugins/validator/validator.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
			
			$('.checkbox').on('ifChanged', function() {
				$('form').validator('validate');
			});
			
			$('input').focus(function() {
				$('#message-div').fadeOut('medium');
			});
			
			$('select').imagepicker();
		});
	</script>
</body>
</html>

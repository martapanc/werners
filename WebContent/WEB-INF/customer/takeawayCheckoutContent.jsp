<style>
	.table-responsive, .box-footer {
		margin-left: 15px;
	}
</style>

<!-- Main content -->
			<section class="invoice"> <!-- title row -->
			<div class="row">
				<div class="col-xs-12">
					<h2 class="page-header">
						<img src="../../dist/img/burger-160x160.jpg" width="40"> &ensp;Werner's Panini & Burgers <span
							class="pull-right">
							<h4 class="date"></h4>
						</span>
					</h2>
				</div>
				<!-- /.col -->
			</div>
			<!-- info row -->

			<div class="row">
				<div class="col-md-12">
					<div class="box box-solid box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Take-Away Checkout</h3>
						</div>
						<div class="reservation-area">
							<form id="reservation-form" data-toggle="validator" role="form">
								<div class="box-body">
									<div class="col-md-12">
										<div class="col-md-1">
										<input type="hidden" id="session" value="${sessionScope.userSession.user.id}" />
											<!-- Title -->
											<label for="title">Title:</label> <select id="title" name="title" class="form-control">
												<option value="Mr" selected>Mr</option>
												<option value="Mrs">Mrs</option>
												<option value="Ms">Ms</option>
												<option value="Dr">Dr</option>
												<option value="Madam">Madam</option>
												<option value="Prince">Prince</option>
												<option value="Princess">Princess</option>
												<option value="Lord">Lord</option>
												<option value="Lady">Lady</option>
											</select>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- First name -->
											<div class="form-group">
												<label>First name:</label> <input id="firstname" name="firstname" type="text" class="form-control" placeholder="John"
													value="${sessionScope.userSession.user.getFirstName()}">
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-6">
											<!-- Last name -->
											<div class="bootstrap-timepicker">
												<div class="form-group">
													<label>Last name:</label> <input id="lastname" name="lastname" type="text" class="form-control" placeholder="Watson"
														value="${sessionScope.userSession.user.getLastName()}">
												</div>
												<!-- /.form group -->
											</div>
										</div>
									</div>
									
									<!-- Home address -->
									<div class="col-md-12">
										<div class="col-md-12">
											<div class="form-group">
												<label>Delivery Address:</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-home"></i>
													</div>
													<input id="address" name="address" type="text" class="form-control" 
													placeholder="221B Baker St, London, UK" value="${sessionScope.userSession.user.billingAddress}">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>
									</div>
									
									<div class="col-md-6">
										<!-- telephone -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Telephone number:</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-phone"></i>
													</div>
													<input name="telephone" id="telephone" type="text" pattern="^[0-9]{10}$" class="form-control"
														value="${sessionScope.userSession.user.phoneNumber}">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>
										
										<div class="col-md-12">
											<div class="form-group">
												<label>Email (optional):</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-at"></i>
													</div>
													<input id="email" name="email" type="text" class="form-control" placeholder="email@example.com"
														value="${sessionScope.userSession.user.email}">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>
										
									</div>
									
									<!-- comment input -->
										<div class="col-md-6">
											<div class="col-md-12">
												<div class="form-group">
													<label>Comments:</label>
													<textarea name="comment" class="form-control" style="resize:none" rows="5" id="comments" ></textarea>
												</div>
												<!-- /.form group -->
											</div>							
										</div>
								</div>
								<!-- /. box body -->
								<div class="box-footer">
									<button type="submit" id="submit-btn" class="btn btn-primary">Confirm</button>
									<button type="reset" id="reset-btn" class="btn btn-warning">Reset</button>
								</div>
							</form>
						</div>

						<div class="row">
							<div class="col-xs-6 table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Id</th>
											<th>Item</th>
											<th>Quantity</th>
											<th>Cost</th>
										</tr>
									</thead>
									<tbody class="cart"></tbody>
								</table>
							</div>
							<!-- /.col -->
							<div class="col-sm-1"></div>

							<!-- Payment methods -->
							<div class="col-sm-4">
								<p class="lead">Payment Methods we accept:</p>
								<img src="../../dist/img/credit/cash.ico" height="45" alt="Cash"> <img
									src="../../dist/img/credit/visa.png" alt="Visa"> <img
									src="../../dist/img/credit/mastercard.png" alt="Mastercard"> <img
									src="../../dist/img/credit/mestro.png" alt="Maestro"> <img
									src="../../dist/img/credit/american-express.png" alt="American Express"> <img
									src="../../dist/img/credit/paypal2.png" alt="PayPal">
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					
				</div>
				<!-- /.box -->
			</div>
			</section>
			<!-- /.content -->
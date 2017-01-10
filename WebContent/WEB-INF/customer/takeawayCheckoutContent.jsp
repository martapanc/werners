<!-- Main content -->
			<section class="invoice"> <!-- title row -->
			<div class="row">
				<div class="col-xs-12">
					<h2 class="page-header">
						<img src="/restaurantProject/dist/img/burger-160x160.jpg" width="40"> &ensp;Werner's Panini & Burgers <span
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
					<div class="box box-info">
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
													value="">
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-6">
											<!-- Last name -->
											<div class="bootstrap-timepicker">
												<div class="form-group">
													<label>Last name:</label> <input id="lastname" name="lastname" type="text" class="form-control" placeholder="Watson"
														value="">
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
													<input id="address" name="address" type="text" class="form-control" placeholder="221B Baker St, London, UK">
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>
									</div>
									
									<div class="col-md-6">
										<!-- phone mask -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Telephone number:</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-phone"></i>
													</div>
													<input id="telephone" name="telephone" type="text" class="form-control" data-inputmask='"mask": "9999999999"'
														min-length="10" data-mask>
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
													<input id="email" name="email" type="text" class="form-control" placeholder="email@example.com">
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
									<input type="reset" class="btn btn-warning" value="Reset" />
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
								<img src="/restaurantProject/dist/img/credit/cash.ico" height="45" alt="Cash"> <img
									src="/restaurantProject/dist/img/credit/visa.png" alt="Visa"> <img
									src="/restaurantProject/dist/img/credit/mastercard.png" alt="Mastercard"> <img
									src="/restaurantProject/dist/img/credit/mestro.png" alt="Maestro"> <img
									src="/restaurantProject/dist/img/credit/american-express.png" alt="American Express"> <img
									src="/restaurantProject/dist/img/credit/paypal2.png" alt="PayPal">
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="footer col-sm-12">
						<button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
							<i class="fa fa-download"></i> Generate PDF
						</button>
						<button type="button" class="btn btn-default pull-right" style="margin-right: 5px;">
							<i class="fa fa-print"></i> Print
						</button>
					</div>
				</div>
				<!-- /.box -->
			</div>
			</section>
			<!-- /.content -->
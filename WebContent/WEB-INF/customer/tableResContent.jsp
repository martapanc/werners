<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-md-12">
						<div class="box box-solid box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Reservation Details</h3>
							</div>

							<form id="reservation-form" method="post" action="${pageContext.request.contextPath}/reservation" data-toggle="validator">
								<div class="box-body">
									<div class="col-md-12">
										<div class="col-md-2">
											<input type="hidden" name="session" id="session" value="${sessionScope.userSession.user.id}" />
											<!-- Title -->
											<label for="title">Title:</label> <select name="title"
												class="form-control">
												<option value="Mr" selected="selected">Mr</option>
												<option value="Mrs">Mrs</option>
												<option value="Ms">Ms</option>
											</select>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- First name -->
											<div class="form-group">
												<label>First name:</label> <input id="fn" name="firstname"
													type="text" class="form-control" placeholder="Walter"
													required value="${sessionScope.userSession.user.getFirstName()}">
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- Last name -->
												<div class="form-group">
													<label>Last name:</label> <input name="lastname"
														type="text" class="form-control" placeholder="White"
														required value="${sessionScope.userSession.user.getLastName()}">
												</div>
										</div>
									</div>

									<div class="col-md-12">
										<div class="col-md-5">
											<div class="form-group">
												<label>Date:</label>
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input name="date" type="text" class="form-control pull-right" id="datepicker" required>
												</div>
												<!-- /.input group -->
											</div>
											<!-- /.form group -->
										</div>

										<div class="col-md-5">
											<!-- Time Picker -->
												<div class="form-group">
													<label>Time:</label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-clock-o"></i>
														</div>
														<input name="time" type="text" class="form-control" id="timepicker" required>
													</div>
													<!-- /.input group -->
												</div>
												<!-- /.form group -->
										</div>

										<div class="col-md-2">
											<!-- Guest number -->
											<div class="bootstrap-timepicker">
												<div class="form-group">
													<label>N.of guests:</label>

													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-users"></i>
														</div>
														<input name="guests" type="number" class="form-control"
															value="2" min="1" max="12">
													</div>

												</div>
												<!-- /.form group -->
											</div>
										</div>
									</div>

									<div class="col-md-6">

										<!-- phone input -->
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

										<!-- email input -->
										<div class="col-md-12">
											<div class="form-group">
												<label>Email:</label>

												<div class="input-group">
													<div class="input-group-addon">
														<i class="fa fa-at"></i>
													</div>
													<input name="email" type="email" required
														class="form-control" placeholder="email@example.com" 
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
								<div class="col-md-12">
									<div class="col-md-12">
									<button type="submit" class="btn btn-primary">Submit</button>
									<button type="reset" class="btn btn-warning">Reset</button>
									</div>
								</div>	
							</div>
							<!-- /. box body -->
						<div class="box-footer">
						</div>
						</form>
						<!-- /.box-body -->
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
		</div>
		<!-- /.row -->
		</section>
		<!-- /.content -->
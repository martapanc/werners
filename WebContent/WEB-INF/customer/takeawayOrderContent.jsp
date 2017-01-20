<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-md-8">
						<div class="box box-solid box-primary">
							<div class="box-header with-border">
								<h3 class="box-title order-minus">Take-Away Order</h3>
							</div>

							<form>
								<div class="box-body">
									<div class="food-menu col-md-3">
										<div class="btn-group btn-block btn-group-vertical">
										<input type="hidden" id="session" value="${sessionScope.userSession.user.id}" />
											<a href="#" id="burger-btn" class="btn btn-lg btn-primary  active"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/burger.svg"> &emsp;Burgers
											</a> <a href="#" id="salad-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/salad.svg"> &emsp;Salads
											</a> <a href="#" id="pizza-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/pizza-2.svg"> &emsp;Pizza
											</a> <a href="#" id="chinese-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/noodles.svg"> &emsp;Chinese
											</a> <a href="#" id="dessert-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/cupcake.svg"> &emsp;Desserts
											</a> <a href="#" id="drink-btn" class="btn btn-lg btn-primary"> <img width="30"
												src="../../dist/img/flat-icon-gastronomy/glass-3.svg"> &emsp;Drinks
											</a>
										</div>

									</div>
									<!-- /. food-menu -->

									<div class="food-offers col-md-9">
										<div class="thmenu-header with-border">
											<h3>BURGERS</h3>
										</div>
										<div class="col-md-12">
											<div class="box box-primary">
												<div class="box-body table-responsive">

													<table id="item-table" data-toggle="table" data-url="../../item" data-method="post"
														data-content-type="application/x-www-form-urlencoded" data-query-params='action=list' data-striped="true"
														data-pagination="true" data-pagination-loop="false" data-page-size="10" data-show-refresh="true" data-search="true"
														data-show-toggle="true">
														<thead>
															<tr>
																<th data-field="id">Id</th>
																<th data-field="name" data-sortable="true">Name</th>
																<th data-field="price" data-sortable="true" data-align="right" data-formatter="priceFormatter">Price</th>
																<!-- Should show only available items -->
																<th data-field="action" data-formatter="actionFormatter" data-events="actionEvent">Add to Cart</th>
															</tr>
														</thead>
													</table>
												</div>

												<div class="result"></div>
												<!-- /.box-body -->
											</div>
											<!-- /. box -->
										</div>
										<!-- /.col -->
									</div>
									<!-- /. food-offers -->
								</div>
								<!-- /. box body -->
							</form>

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

					<div class="col-md-4 ">
						<div class="box box-solid box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">
									<span class="fa fa-shopping-cart"></span> &nbsp; My Order
								</h3>
							</div>

							<div class="cart-form">
								<div class="box-body">
									<table class="table table-striped order-list"></table>
								</div>
								<!-- /. box body -->

								<div id="total-price-box" class="box-footer">
									<h4>
										<span class="pull-right total-price">Total price: &euro; 0.00</span>
									</h4>
								</div>
								<div class="box-footer">
									<button class="btn btn-primary" id="checkout-btn" disabled>Checkout</button>
									<button class="btn btn-warning" id="reset-btn">Cancel</button>
								</div>

							</div>

						</div>
						<!-- /.box-body -->
					</div>

				</div>
		</section>
		<!-- /.content -->
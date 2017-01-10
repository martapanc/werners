<!-- Main content -->
			<section class="invoice"> <!-- title row -->
			<div class="row">
				<div class="col-xs-12">
					<h2 class="page-header">
						<img src="../../dist/img/burger-160x160.jpg" width="40"> &ensp;Werner's Panini &amp; Burgers <span
							class="pull-right"><h4>
								Date: &ensp;<strong>${todayDate}</strong>
							</h4> </span>
					</h2>
				</div>
				<!-- /.col -->
			</div>
			<!-- info row -->
			<div class="row invoice-info">
				<div class="col-sm-4 invoice-col">
					<span class="lead">Reservation details</span><br>
					<h4>
						<strong>${map.get("title")}</strong> &ensp; ${map.get("firstname")} ${map.get("lastname")} <br> <strong>Tel: </strong>
						&ensp; ${map.get("telephone")}<br> <strong>Email:</strong> &ensp; ${map.get("email")}<br>
					</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					<span class="lead">Your reservation</span><br>
					<h4>
						<strong>Date:</strong> &ensp; ${map.get("date")}<br> <strong>Time:</strong> &ensp; ${map.get("time")}<br> <strong>Number
							of guests: </strong>&ensp; ${map.get("guests")}<br>
					</h4>
				</div>
				<!-- /.col -->
				<div class="col-sm-4">
					<p class="lead">Payment Methods we accept:</p>
					<img src="../../dist/img/credit/visa.png" alt="Visa"> <img
						src="../../dist/img/credit/mastercard.png" alt="Mastercard"> <img
						src="../../dist/img/credit/mestro.png" alt="Maestro"> <img
						src="../../dist/img/credit/american-express.png" alt="American Express"> <img
						src="../../dist/img/credit/cash.ico" height="45" alt="Cash">
				</div>
			</div>
			<!-- /.row --> <!-- Table row -->
			<div class="row no-print">
				<div class="col-xs-12">
					<h2 class="page-footer">
						<!-- 	<a target="_blank"
						class="btn btn-default pull-right"><i class="fa fa-print"></i> Print</a>-->
						<button type="button" class="btn btn-primary pull-right" style="margin-right: 5px;">
							<i class="fa fa-download"></i> Generate PDF
						</button>
						<button type="button" class="btn btn-default pull-right" style="margin-right: 5px;">
							<i class="fa fa-print"></i> Print
						</button>
					</h2>
				</div>
				<!-- /.col -->
			</div>

			</section>
			<!-- /.content -->
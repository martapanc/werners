<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="wpb.enums.Section"%>
<%@ page import="wpb.entity.Role.RoleEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="accessManager" scope="request" class="wpb.util.AccessManager" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Dashboard</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/pages/dashboard.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<c:if test="<%=accessManager.isAllowed(session, Section.DASHBOARD)%>">
			<!-- Info boxes -->
			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-aqua"><i class="fa fa-gears"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">CPU Traffic</span> <span class="info-box-number">87<small>%</small></span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-red"><i class="fa fa-google-plus"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Likes</span> <span class="info-box-number">1,163</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->

				<!-- fix for small devices only -->
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-green"><i class="fa fa-shopping-cart"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Sales</span> <span class="info-box-number">4,171</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="info-box">
						<span class="info-box-icon bg-yellow"><i class="fa fa-users"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">New Members</span> <span class="info-box-number">1,895</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</c:if>

		<c:if test="<%=accessManager.isAllowed(session, Section.DASHBOARD)%>">
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Monthly Recap Report</h3>

							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
								<div class="col-md-12">
									<p class="text-center">
										<strong>Period: 1 Oct, 2016 - 31 Jan, 2016</strong>
									</p>

									<div class="chart">
										<!-- Sales Chart Canvas -->
										<canvas id="salesChart" style="height: 180px;"></canvas>
									</div>
									<!-- /.chart-responsive -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- ./box-body -->
						<div class="box-footer">
							<div class="row">
								<div class="col-sm-4 col-xs-6">
									<div class="description-block border-right">
										<span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 17%</span>
										<h5 class="description-header">$24,212.86</h5>
										<span class="description-text">TOTAL REVENUE</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-4 col-xs-6">
									<div class="description-block border-right">
										<span class="description-percentage text-yellow"><i class="fa fa-caret-left"></i> 0%</span>
										<h5 class="description-header">$10,136.10</h5>
										<span class="description-text">TOTAL COST</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-4 col-xs-6">
									<div class="description-block border-right">
										<span class="description-percentage text-green"><i class="fa fa-caret-up"></i> 20%</span>
										<h5 class="description-header">$14,076.76</h5>
										<span class="description-text">TOTAL PROFIT</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->

							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
		</c:if>

		<c:if test="<%=accessManager.isAllowed(session, Section.DASHBOARD)%>">
			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<div class="col-md-9">
					<!-- MAP & BOX PANE -->

					<div class="row">
						<div class="col-md-6">
							<!-- ITEMS LIST -->
							<div class="box box-danger">
								<div class="box-header with-border">
									<h3 class="box-title">Latest Items</h3>

									<div class="box-tools pull-right">
										<span class="label label-danger">5 New Items</span>
										<button type="button" class="btn btn-box-tool" data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<table id="item-table" data-toggle="table" data-url="${pageContext.request.contextPath}/item" data-method="post"
										data-content-type="application/x-www-form-urlencoded" data-query-params='action=list' data-striped="true"
										data-pagination="true" data-pagination-loop="false" data-page-size="8" data-resizable="false" data-sort-name="id"
										data-sort-order="desc" data-page-list="[8]">
										<thead>
											<tr>
												<th data-field="id" data-sortable="true" data-width="8%">Id</th>
												<th data-field="name" data-sortable="true" data-width="30%">Name</th>
												<th data-field="foodClass.name" data-sortable="true">Food class</th>
												<th data-field="price" data-sortable="true" data-align="right" data-formatter="priceFormatter">Price</th>
												<th data-field="available" data-sortable="true" data-sorter="boolSorter" data-formatter="boolFormatter"
													data-align="center">Availability</th>
											</tr>
										</thead>
									</table>
									<!-- /.items-list -->
								</div>
								<!-- /.box-body -->
								<div class="box-footer text-center">
									<a href="${pageContext.request.contextPath}/pages/tables/item.jsp" class="uppercase">View All Items</a>
								</div>
								<!-- /.box-footer -->
							</div>
							<!--/.box -->
						</div>
						<!-- /.col -->

						<div class="col-md-6">
							<!-- USERS LIST -->
							<div class="box box-success">
								<div class="box-header with-border">
									<h3 class="box-title">Latest Members</h3>

									<div class="box-tools pull-right">
										<span class="label label-success">8 New Members</span>
										<button type="button" class="btn btn-box-tool" data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
									</div>
								</div>
								<!-- /.box-header -->
								<div class="box-body no-padding">
									<ul class="users-list clearfix" id="db-user-list">
									</ul>
									<!-- /.users-list -->
								</div>
								<!-- /.box-body -->
								<div class="box-footer text-center">
									<a href="${pageContext.request.contextPath}/pages/tables/user.jsp" class="uppercase">View All Users</a>
								</div>
								<!-- /.box-footer -->
							</div>
							<!--/.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.col -->

				<div class="col-md-3">
					<!-- Info Boxes Style 2 -->
					<div class="info-box bg-yellow">
						<span class="info-box-icon"><i class="fa fa-cube"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Inventory</span> <span class="info-box-number">519 items</span>

							<div class="progress">
								<div class="progress-bar" style="width: 50%"></div>
							</div>
							<span class="progress-description"> 12% Increase in 30 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
					<div class="info-box bg-green">
						<span class="info-box-icon"><i class="fa fa-cutlery"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Reservations</span> <span class="info-box-number">1,251</span>

							<div class="progress">
								<div class="progress-bar" style="width: 20%"></div>
							</div>
							<span class="progress-description"> 20% Increase in 30 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
					<div class="info-box bg-red">
						<span class="info-box-icon"><i class="fa fa-paper-plane"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Takeaway Orders</span> <span class="info-box-number">2,381</span>

							<div class="progress">
								<div class="progress-bar" style="width: 24%"></div>
							</div>
							<span class="progress-description"> 70% Increase in 30 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
					<div class="info-box bg-aqua">
						<span class="info-box-icon"><i class="fa fa-apple"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Food Classes</span> <span class="info-box-number">6</span>
							<div class="progress">
								<div class="progress-bar" style="width: 40%"></div>
							</div>
							<span class="progress-description"> 40% Increase in 30 Days </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</c:if>

		<c:if test="<%=accessManager.isAllowed(session, Section.DASHBOARD)%>">
			<div class="row">
				<div class="col-md-12">
					<!-- TABLE: LATEST TABLE RESERVATIONS -->
					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">Latest Table Reservations</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<table id="res-table" data-toggle="table" data-url="${pageContext.request.contextPath}/reservation" data-method="post" data-query-params='action=list'
									data-content-type="application/x-www-form-urlencoded" data-striped="true" data-pagination="true"
									data-pagination-loop="true" data-page-size="10" data-resizable="false" data-sort-name="id" data-sort-order="desc"
									data-page-list="[10]">
									<thead>
										<tr>
											<th data-field="id" data-sortable="true">Id</th>
											<th data-field="startDate" data-sortable="true">Start Date</th>
											<th data-field="endDate" data-sortable="true">End Date</th>
											<th data-field="user.id" data-sortable="true">User Id</th>
											<th data-field="customerName" data-sortable="true">Customer Name</th>
											<th data-field="comment" data-sortable="true">Comment</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer text-center">
							<a href="${pageContext.request.contextPath}/pages/tables/reservation.jsp" class="uppercase">View All Table Reservations</a>
						</div>
						<!-- /.box-footer -->
					</div>
					<!-- /.box LATEST TABLE RESERVATIONS-->

					<!-- TABLE: LATEST TAKEAWAY ORDERS -->
					<div class="box box-warning">
						<div class="box-header with-border">
							<h3 class="box-title">Latest Takeaway Orders</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<table id="ta-table" data-detail-view="true" data-striped="true" data-url="${pageContext.request.contextPath}/takeaway" data-method="post"
									data-query-params='action=list' data-content-type="application/x-www-form-urlencoded" data-pagination="true"
									data-pagination-loop="false" data-page-size="10" data-resizable="false" data-sort-name="id" data-sort-order="desc"
									data-detail-formatter="detailFormatter" data-page-list="[10]">
									<thead>
										<tr>
											<th data-field="order_id" data-sortable="true">ID</th>
											<th data-field="orderDate" data-sortable="true">Order Date</th>
											<th data-field="address" data-sortable="true">Address</th>
											<th data-field="phoneNumber" data-sortable="true">Phone Number</th>
											<th data-field="guest.id" data-sortable="true">Guest ID</th>
											<th data-field="cost" data-sortable="true">Cost</th>
											<th data-field="status" data-sortable="true">Status</th>
											<th data-field="comment" data-sortable="true">Comment</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer text-center">
							<a href="${pageContext.request.contextPath}/pages/tables/order.jsp" class="uppercase">View All Takeaway Orders</a>
						</div>
						<!-- /.box-footer -->
					</div>
					<!-- /.box LATEST TAKEAWAY ORDERS-->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</c:if>

	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->


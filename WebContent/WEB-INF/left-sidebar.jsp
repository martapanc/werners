<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="wpb.enums.Section" %>
<%@ page import="wpb.entity.Role.RoleEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="accessManager" scope="request" class="wpb.util.AccessManager"/>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="/restaurantProject/dist/img/burger-160x160.jpg" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Auguste Gusteau</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="not implemented yet..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">MAIN NAVIGATION</li>
			<c:if test="<%=accessManager.isAllowed(session, Section.DASHBOARD)%>">
			<li id="dashboard-menu" class="treeview"><a href="/restaurantProject/pages/dashboard.jsp"> <i class="fa fa-dashboard"></i>
					<span>Dashboard</span>
			</a></li>
			</c:if>
			<c:if test="<%=accessManager.isAllowed(session, Section.SCHEDULER)%>">
			<li id="scheduler-menu"><a href="/restaurantProject/pages/scheduler.jsp"> <i class="fa fa-clock-o"></i> <span>Scheduler</span>
					<span class="pull-right-container"> <small class="label pull-right bg-red">5</small> <small
						class="label pull-right bg-blue">2</small>
				</span>
			</a></li>
			</c:if>
			<c:if test="<%=accessManager.isAllowed(session, Section.TABLES)%>">
			<li id="table-menu" class="treeview"><a href=""> <i class="fa fa-table"></i> <span>Tables</span> <span
					class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li id="table-menu-fc"><a href="/restaurantProject/pages/tables/foodClass.jsp"> <i class="fa fa-apple"></i>Food Categories
					</a></li>
					<li id="table-menu-item"><a href="/restaurantProject/pages/tables/item.jsp"> <i class="fa fa-cube"></i>Items
					</a></li>
					<li id="table-menu-order"><a href="/restaurantProject/pages/tables/order.jsp"> <i class="fa fa-archive"></i>Orders
					</a></li>
					<li id="table-menu-reservation"><a href="/restaurantProject/pages/tables/reservation.jsp"> <i class="fa fa-book"></i>Reservations
					</a></li>
					<li id="table-menu-table"><a href="/restaurantProject/pages/tables/restaurantTable.jsp"> <i class="fa fa-cutlery"></i>Restaurant Tables
					</a></li>
					<li id="table-menu-user"><a href="/restaurantProject/pages/tables/user.jsp"> <i class="fa fa-user"></i>Users
					</a></li>
				</ul>
			</li>
			</c:if>
			<c:if test="<%=accessManager.isAllowed(session, Section.CUSTOMER)%>">
			<li id="customer-menu" class="treeview"><a href="#"> <i class="fa fa-user"></i> <span>Customer View</span> <span
					class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="/restaurantProject/pages/customer/tableReservation.jsp"> <i class="fa fa-cutlery"></i>Table Reservation
					</a></li>
					<li><a href="/restaurantProject/pages/customer/takeawayOrder.jsp"> <i class="fa fa-paper-plane-o"></i>Take-Away
							Order
					</a></li>

				</ul></li>
			</c:if>
			<li id="chart-menu" class="treeview"><a href="/restaurantProject/pages/charts/chartjs.html"> <i
					class="fa fa-pie-chart"></i> <span>Charts</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a></li>
			<li class="header">HELP</li>
			<li><a href="/restaurantProject/documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
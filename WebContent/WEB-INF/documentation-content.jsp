<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">User categories</h3>
				</div>
				<div class="box-body">
					<div class="col-md-12">
						<h4>The website has five user categories:</h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>User name</th>
									<th>Has access to...</th>
									<th>Access Email</th>
									<th>Password</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>OVERLORD</td>
									<td>everything</td>
									<td>overlord@wpb.it</td>
									<td>overlord</td>
								</tr>
								<tr>
									<td>ADMIN</td>
									<td>Dashboard, scheduler, tables</td>
									<td>admin@wpb.it</td>
									<td>admin</td>
								</tr>
								<tr>
									<td>DBMANAGER</td>
									<td>Dashboard, tables</td>
									<td>marta@wpb.it</td>
									<td>marta</td>
								</tr>
								<tr>
									<td>WAITER</td>
									<td>Dashboard, scheduler</td>
									<td>wernerd@wpb.it</td>
									<td>werner</td>
								</tr>
								<tr>
									<td>CUSTOMER</td>
									<td>Table reservation, Takeaway order</td>
									<td>giulia@wpb.it, any new customer with registration email and password</td>
									<td>giulia</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /. box body -->
				<div class="box-footer"></div>

				<!-- /.box-body -->
			</div>
			<!-- /. box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Website Map</h3>
				</div>

				<div class="box-body">
					<div class="col-md-12">
						<h4>1. Homepage</h4>
						<p>Standard view of the website as it appears to external visitors</p>
						<a class="thumbnail"><img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_THNlU2sxZUdlUGs" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_THNlU2sxZUdlUGs" width="800px" /><br />Homepage</span> </a>
						<h4>2. Table Reservation and Takeaway Order (external users)</h4>
						<p>Any external user may reserve a table or make a takeaway order without registration.</p>
						<ul>
							<li>To reserve a table, the user must type his personal data, date and time of the reservation and number of guests.</li>
							<li>To make a takeaway order, the user can choose among the available items and confirm his order in the following
								page, by entering the preferred delivery address, in addition to his personal data.</li>
						</ul>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_WnJxZThyWHh4Sjg" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_WnJxZThyWHh4Sjg" width="1000px" /><br />Table Reservation</span>
						</a> <a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_R19hUWlUR2k0Ujg" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_R19hUWlUR2k0Ujg" width="900px" /><br />Takeaway Order</span>
						</a>
						<h4>3. Login / Register</h4>
						<p>An external user can login or choose to sign up in this section. The benefits of registration is to have personal
							data stored in the database, which automatically retrieves and inserts them into the order form. An access manager checks
							whether a page is available to the current user. If not, it redirects the user to the login page.</p>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_TW5CNnhDMnJmREU" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_TW5CNnhDMnJmREU" width="500px" /><br />Login</span>
						</a> <a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_UzdnVksxT2RXcEE" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_UzdnVksxT2RXcEE" width="600px" /><br />Register</span>
						</a>
						<h4>4. Index / Dashboard</h4>
						<p>Once logged in, the user gains access to his control panel. The index / dashboard view depends on the user category:</p>
						<ul>
							<li>A customer sees his welcome page with direct links to the application sections;</li>
							<li>All other users (overlord, admin…) see a dashboard with some statistics about sales, inventory and users and basic
								tables with the last items, orders and reservations inserted.</li>
						</ul>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_YnR2a1lsOEE4MWc" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_YnR2a1lsOEE4MWc" width="1000px" /><br />Dashboard for
								customers</span>
						</a> <a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_UGpZeFVsck5VOG8" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_UGpZeFVsck5VOG8" width="1000px" /><br />Dashboard for other
								users</span>
						</a>
						<h4>5. Table Reservation and Takeaway Order (registered users)</h4>
						<p>The view is similar to the one for external users, except for the user data that are automatically inserted into the
							form.</p>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_YXpkODBhS2hvVzA" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_YXpkODBhS2hvVzA" width="1000px" /><br />Reservation as
								registered user</span>
						</a>
						<h4>6. Profile</h4>
						<p>The section includes some information about the current user and the possibility to edit the telephone number and
							home address (which are then updated in the “Table reservation” and “Takeaway Order” sections) and change password.</p>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_eUdta3BXNGlvZEU" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_eUdta3BXNGlvZEU" width="1000px" /><br />Profile</span>
						</a>
						<h4>7. Scheduler</h4>
						<p>
							The scheduler, only visible to user with particular privileges, shows a daily, weekly or monthly view of the table
							reservations made by the customers. <br>The horizontal axis refers to the chosen time span, the vertical axis
							represents the tables of the restaurant, each with a fixed number of seats.<br> The existing reservations consist of
							blue labels including the customer name and number of seats.
						</p>
						<br>
						<p>
							A function in the Reservation Servlet assigns new reservations to a free table: at first it excludes the tables with not
							enough seats, then all tables that already have a reservation overlapping the chosen time span (the default is two hours
							from the selected start time). <br> Among all remaining tables, the functions assigns the reservation to the one with
							the smallest number of seats. If no suitable tables are available, the reservation cannot be confirmed and the customer is
							prompted to try again with a different start time.
						</p>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_LUFFM29hazM4Mmc" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_LUFFM29hazM4Mmc" width="1000px" /><br />Scheduler</span>
						</a>
						<h4>8. Tables</h4>
						<p>
							This menu, only visible to specific users, includes the tables of the main entities of the database: <strong>Food
								Category, Item, Takeaway Order, Reservation, Restaurant Table, User</strong>.
						</p>
						<p>All tables include basic functions like order by column, search, refresh, display selected columns and export data in
							various formats. Some tables offers further features:</p>
						<ul>
							<li>Food Category, Item and Restaurant Tables offers create, update and delete functions, through specific popup
								modals;</li>
							<li>For each entry in Takeaway Orders, by clicking on the “plus” sign, a list of the items included in the chosen
								order is also displayed.</li>
							<li>Tables “Orders”, “Reservations” and “Users” offer no create / update functions, because an order that was
								confirmed by a customer is considered a “finalized entity” and changing it would make little sense. Also, each user should
								be able to edit his own data.</li>
						</ul>
						<a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_d2h2dTNEVDhVWGM" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_d2h2dTNEVDhVWGM" width="1000px" /><br />Takeaway Order
								Table</span>
						</a> <a class="thumbnail"> <img src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_Zk9TWmR0M2pqWkE" width="100px"
							height="66px" border="0" /> <span><img
								src="https://drive.google.com/uc?export=view&id=0Bz6vvbUH6o-_Zk9TWmR0M2pqWkE" width="1000px" /><br />Modal for adding or
								editing items</span>
						</a>
						<h4>9. Logout</h4>
						<p>At any time, the current user can logout and will be redirected to the homepage.</p>

					</div>
				</div>
				<!-- /. box body -->
				<div class="box-footer"></div>

				<!-- /.box-body -->
			</div>
			<!-- /. box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
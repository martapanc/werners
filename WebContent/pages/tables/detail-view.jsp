<!DOCTYPE html>
<html>
<head>
    <title>Detail View</title>
    <meta charset="utf-8">
<!-- Bootstrap 3.3.6 -->
 	<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="../../plugins/bootstrap-table-examples/assets/examples.css">
    <script src="../../plugins/bootstrap-table-examples/assets/jquery.min.js"></script>
    <script src="../../plugins/bootstrap-table-examples/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../plugins/bootstrap-table-examples/assets/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="../../plugins/bootstrap-table-examples/ga.js"></script>
</head>
<body>
    <div class="container">
        <table id="table" data-toggle="table" data-method="post"
								data-striped="true" data-pagination="true"
								data-pagination-loop="false" data-page-size="25"
								data-show-refresh="true" data-search="true"
								data-resizable="true" data-show-toggle="true"
								data-show-export="true" data-detail-view="true"
								data-detail-formatter="detailFormatter"
								data-url="../../plugins/bootstrap-table-examples/json/data5.json">
								<thead>
									<tr>
										<th data-field="order_id" data-sortable="true">ID</th>
										<th data-field="orderDate" data-sortable="true">Order
											Date</th>
										<th data-field="totalCost" data-sortable="true">Total
											Cost</th>
										<th data-field="comment" data-sortable="true">Comment</th>
									</tr>
								</thead>
							</table>
    </div>
<script>
    function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }
</script>
</body>
</html>

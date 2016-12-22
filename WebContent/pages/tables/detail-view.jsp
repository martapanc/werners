<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Calendar</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Bootstrap table --> 
  <link rel="stylesheet" href="../../plugins/bootstrap-table/bootstrap-table.css">
  <link rel="stylesheet" href="../../plugins/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.css">
  
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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

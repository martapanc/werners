<!DOCTYPE html>
<html>
<head>
    <title>Detail View</title>
    <meta charset="utf-8">
<!-- Bootstrap 3.3.6 -->
 	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="../plugins/bootstrap-table-examples/assets/examples.css">
    <script src="../plugins/bootstrap-table-examples/assets/jquery.min.js"></script>
    <script src="../plugins/bootstrap-table-examples/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../plugins/bootstrap-table-examples/assets/bootstrap-table/src/bootstrap-table.js"></script>
    <script src="../plugins/bootstrap-table-examples/ga.js"></script>
</head>
<body>
    <div class="container">
        <h1>Detail View</h1>
        <p>Use <code>detailView</code> and <code>detailFormatter</code> options to show detail view.</p>
        <table id="table"
               data-toggle="table"
               data-height="460"
               data-detail-view="true"
               data-detail-formatter="detailFormatter"
               data-url="../plugins/bootstrap-table-examples/json/data1.json">
            <thead>
            <tr>
                <th data-field="id">ID</th>
                <th data-field="name">Item Name</th>
                <th data-field="price">Item Price</th>
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

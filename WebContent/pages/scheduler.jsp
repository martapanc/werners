<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WPB | Scheduler</title>
  <link rel="icon" href="/restaurantProject/dist/img/favicon.png">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  
  <!-- FullCalendar 2.2.5-->
   <!--
  <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.print.css" media="print"> 
  --!> 
  
  <!-- FullCalendar & Scheduler 3.1.0-->
  <link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="../plugins/scheduler/scheduler.min.css">
  
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  
  <!-- Pace style -->
  <link rel="stylesheet" href="../plugins/pace/pace.min.css">
  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">

 <jsp:include page="../WEB-INF/upper-navbar.jsp" />
  
 <jsp:include page="../WEB-INF/left-sidebar.jsp" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Scheduler
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/restaurantProject/pages/dashboard.jsp"><i class="fa fa-apple"></i> Home</a></li>
        <li class="active">Scheduler</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- /.col -->
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE SCHEDULER -->
              <div id="scheduler"></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <jsp:include page="../WEB-INF/footer.html" />
  
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../bootstrap/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- PACE -->
<script src="../plugins/pace/pace.min.js"></script>
<!-- Slimscroll -->
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<!-- Page specific script --> 
<!-- Scheduler 1.5.0 -->
<script src="../plugins/moment/moment.min.js"></script>
<script src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="../plugins/fullcalendar/locale-all.js"></script>
<script src="../plugins/scheduler/scheduler.min.js"></script>

<script>



  $(function () { 
	  $( document ).ready(function() {
			$('#dashboard-menu').removeClass('active');
		    $('#scheduler-menu').addClass('active');
		    $('#table-menu').removeClass('active');
		    $('#chart-menu').removeClass('active');
		    $('#customer-menu').removeClass('active');
		    
		    $('#calendar-menu').removeClass('active');
		});

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex: 1070,
          revert: true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        });

      });
    }

    ini_events($('#external-events div.external-event'));

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
   
	var todayDate = moment().startOf('day');
	var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
	var TODAY = todayDate.format('YYYY-MM-DD');
	var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

	$('#scheduler').fullCalendar({
		schedulerLicenseKey: 'GPL-My-Project-Is-Open-Source',
		nowIndicator: true,
		resourceAreaWidth: 150,
		height: 'auto',
		editable: true,
		slotDuration: '00:15',
		columnFormat: 'H(:mm)',
		minTime: '11:00',
		maxTime: '26:00',
		slotWidth: 15,
		aspectRatio: 1.5,
		scrollTime: new Date(),
		header: {
			left: 'promptResource today prev,next',
			center: 'title',
			right: 'timelineDay,timelineThreeDays,agendaWeek,month'
		},
		defaultView: 'timelineDay',
		views: {
		},
		resourceLabelText: 'Tables',
		resources: {
	        url: '../roomTable?action=list',
	        type: 'POST'
	    },
		events: [
			{ id: '1', resourceId: '261', start: TODAY + 'T15:00:00', end: TODAY + 'T17:00:00', title: 'event 1' },
			{ id: '2', resourceId: '261', start: TODAY + 'T05:00:00', end: TODAY + 'T22:00:00', title: 'event 2' },
			{ id: '3', resourceId: '261', start: YESTERDAY, end: TOMORROW, title: 'event 3' },
			{ id: '4', resourceId: '261', start: TODAY + 'T03:00:00', end: TODAY + 'T08:00:00', title: 'event 4' },
			{ id: '5', resourceId: '261', start: TODAY + 'T00:30:00', end: TODAY + 'T02:30:00', title: 'event 5' }
		],
      
	
      /*windowResize: function(view) {
      alert('The scheduler has adjusted to a window resize');
      if ($(window).width() < 514){
        $('#scheduler').fullCalendar( 'changeView', 'agendaDay' );
      } else {
        $('#scheduler').fullCalendar( 'changeView', 'agendaWeek' );
      }
  }*/
});
});

// readjust sizing after font load
$(window).on('load', function() {
	$('#scheduler').fullCalendar('render');
});    
</script>
</body>
</html>


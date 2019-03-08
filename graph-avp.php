<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

?>

<html>
<head>
    <title>CDRS - Dashboard</title>
    <link href="css/application.css" rel="stylesheet">
	  <link href="css/main.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<!-- Chart Styles -->
	<style>
	#chartdiv, #chartdiv2 {
	  width: 100%;
	  height: 500px;
	}

	.amcharts-export-menu-top-right {
	  top: 10px;
	  right: 0;
	}
	</style>
</head>

<body>
<?php
  include("includes/navbar-avp.php");
?>

<div class="container">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main" style="padding-top: 50px;">
        <!--<h1 class="page-title">Dynamic - <span class="fw-semi-bold">Tables</span></h1>-->

		<div class="row">
			<div class="col-md-6 widget-container">
				<section class="widget">
					<header>
							<h5>Medicine<span class="fw-semi-bold">Requested</span></h5>
							<div class="widget-controls">
								<a data-widgster="fullscreen" title="Full Screen" href="#"><i class="glyphicon glyphicon-fullscreen"></i></a>
								<a data-widgster="restore" title="Restore" href="#"><i class="glyphicon glyphicon-resize-small"></i></a>
							</div>
						</header>
					<div class="widget-body" id="chartdiv">
					</div>
				</section>
			</div>
			<div class="col-md-6 widget-container">
				<section class="widget">
					<header>
							<h5>Patient <span class="fw-semi-bold">Complaints</span></h5>
							<div class="widget-controls">
								<a data-widgster="fullscreen" title="Full Screen" href="#"><i class="glyphicon glyphicon-fullscreen"></i></a>
								<a data-widgster="restore" title="Restore" href="#"><i class="glyphicon glyphicon-resize-small"></i></a>
							</div>
						</header>
					<div class="widget-body" id="chartdiv2">
					</div>
				</section>
			</div>

		</div>
		<div class="btn-toolbar mt-lg text-align-right hidden-print">
			<a href="report-avp.php" style="color: #fff;">
			<button class="btn btn-danger">
				Proceed to report
				&nbsp;
				<span class="circle bg-white">
					<i class="fa fa-arrow-right text-danger"></i>
				</span>
			</button>
			</a>
		</div>
		<!---->
    </main>
</div>

<!-- common libraries. required for every page-->
<script src="vendor/common.js"></script>

<!-- page specific libs -->
<script src="vendor/table.js"></script>

<!-- page specific libs -->.
<script src="vendor/bootstrap-sass/vendor/assets/javascripts/bootstrap/modal.js"></script>
<script src="vendor/jquery-ui/ui/core.js"></script>
<script src="vendor/jquery-ui/ui/widget.js"></script>
<script src="vendor/jquery-ui/ui/mouse.js"></script>
<script src="vendor/jquery-ui/ui/sortable.js"></script>
<script src="vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- page specific js -->
<script src="js/grid.js"></script>

<!-- Resources -->
<script src="vendor/amcharts/amcharts.js"></script>
<script src="vendor/amcharts/serial.js"></script>
<script src="vendor/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="vendor/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="vendor/amcharts/themes/light.js"></script>

<script src="js/test_graph.js"></script>
</body>
</html>

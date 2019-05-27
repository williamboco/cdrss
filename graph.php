<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if(isset($_SESSION['role'])) {
	switch ($_SESSION['role']) {
		case 'IT':
			header("location: home-it.php");
			break;
		case 'Admin':
			header("location: home-admin.php");
			break;
		case 'Physician':
			header("location: home-avp.php");
			break;
		default:
		header("location: home.php");
			break;
	}
}
?>

<html>
<head>
	<title>Graph</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/graph.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Resources -->
	<script src="vendor/amcharts/amcharts.js"></script>
	<script src="vendor/amcharts/serial.js"></script>
	<script src="vendor/amcharts/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="vendor/amcharts/plugins/export/export.css" type="text/css" media="all" />
	<script src="vendor/amcharts/themes/light.js"></script>
</head>
<body>
	<?php
	  include("includes/navbar.php");
	?>
	<form class="form-inline container" id="filter">
		<div class="form-group">
			<label for="filter" class="col-2 col-form-label">Filter&nbsp;<i class="fa fa-filter" aria-hidden="true"></i></label><br>
			<select class="form-control filters" name="patientType" id="filter">
				<option selected>All</option>
				<option value="coll">College</option>
				<option value="shs">Senior High School</option>
				<option value="stud">All Student</option>
				<option value="emp">Employee</option>
			</select>
		</div>
		<div class="form-group">
		  <label for="date" class="col-2 col-form-label">Visit Date&nbsp;&nbsp;<small><a href="#" onclick="setDateRange()">Reset</a></small></label><br>
			<input class="form-control filters" type="date" name="date1" id="date1">
			<span>&nbsp;-&nbsp;</span>
			<input class="form-control filters" type="date" name="date2" id="date2">
		</div>
		<div class="form-group pull-right" style="margin-top: 25px;">
	</form>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<section class="widget wow fadeInDown">
					<header>
						<h4>Medicine / Supply requested</h4>
						<div class="widget-controls">
							<a data-widgster="fullscreen" href="#">Fullscreen</a>
							<a data-widgster="restore" href="#">Back</a>
						</div>
					</header>
					<div class="body">
						<div id="chartdiv" class="chartdiv"></div>
					</div>
				</section>
			</div>

			<div class="col-md-6">
				<section class="widget wow fadeInDown" data-wow-delay="0.2s">
					<header>
						<h4>Health Complaints</h4>
						<div class="widget-controls">
							<a data-widgster="fullscreen" href="#">Fullscreen</a>
							<a data-widgster="restore" href="#">Restore</a>
						</div>
					</header>
					<div class="body">
						<div id="chartdiv2" class="chartdiv"></div>
					</div>
				</section>
			</div>

		</div>
		<div class="btn-toolbar mt-lg text-align-right hidden-print pull-right">
			<a href="cdrs/report.php" style="color: #fff;">
			<button class="btn btn-danger">
				Proceed to report
				&nbsp;
				<span class="circle bg-white">
					<i class="fa fa-arrow-right text-danger"></i>
				</span>
			</button>
			</a>
		</div>
	</div>

	<script src="vendor/jquery-2.1.0.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/widgster.js"></script>
	<script src="js/date.js"></script>
	<script src="js/graph.js"></script>
	<script src="js/test_graph.js"></script>
	<script src="js/wow.min.js"></script>
	<script>
	new WOW().init();
	</script>
</body>
</html>

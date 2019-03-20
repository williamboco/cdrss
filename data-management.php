<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if($_SESSION['role'] == 'Admin') {
	header("location: home-avp.php");
}

?>
<html>
<head>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables-1.10.15/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<?php
	  include("includes/navbartest.php");
	?>
	<div class="container">
		<div class="row" style="margin: 150px 100px 0px 100px;">
			<div class="col-sm-4">
				<a href="options.php" class="btn btn-info btn-lg btn-block datamenu"><i class="fas fa-graduation-cap"></i> <big>Courses</big></a>
			</div>
			<div class="col-sm-4">
				<a href="options.php" class="btn btn-info btn-lg btn-block datamenu"><i class="fas fa-laptop"></i>  <big>Tracks</big></a>
			</div>
			<div class="col-sm-4">
				<a href="options.php" class="btn btn-info btn-lg btn-block datamenu"><i class="fas fa-building"></i>  <big>Departments</big></a>
			</div>
		</div>

		<div class="row" style="margin: 25px 100px 100px 100px;">
			<div class="col-sm-4">
				<a href="options.php" class="btn btn-info btn-lg btn-block datamenu"><i class="fas fa-allergies"></i> <big>Allergies</big></a>
			</div>
			<div class="col-sm-4">
				<a href="options.php" class="btn btn-info btn-lg btn-block datamenu"><i class="fas fa-notes-medical"></i> <big>Complaints</big></a>
			</div>
			<div class="col-sm-4">
				<a href="options.php" class="btn btn-info btn-lg btn-block datamenu"><i class="fas fa-pills"></i> <big>Inventory</big></a>
			</div>
		</div>

	<div class="row page-footer wow fadeIn" data-wow-delay="0.7s">
		<footer class="col-lg-12 col-sm-12">
					Clinic Drug-dispense Reporting System.
		</footer>
	</div>

	<script src="vendor/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="js/options.js"></script>
	<script src="js/checkbox.js"></script>
	<script src="js/wow.min.js"></script>
	<script>
	new WOW().init();
	</script>
</body>
</html>

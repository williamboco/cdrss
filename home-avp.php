<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if($_SESSION['role'] != 'Admin') {
	header("location: home.php");
}


?>
<html>
<head>
	<title>Home - Admin</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables-1.10.15/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--Graph Resources-->
	<script src="vendor/amcharts/amcharts.js"></script>
	<script src="vendor/amcharts/serial.js"></script>
	<script src="vendor/amcharts/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="vendor/amcharts/plugins/export/export.css" type="text/css" media="all" />
	<script src="vendor/amcharts/themes/light.js"></script>
	<link href="css/graph.css" rel="stylesheet">
	<style>
	.dataTables_length {
		display: none !important;
	}
	</style>

</head>
<body>
	<div class="row">
		<?php
			include("includes/navbar-avp.php");
		?>
	</div>
	<div class="container">
	<form class="form-inline card" id="filter" action="ajax/filtered_visits_avp.php">
		<div class="form-group">
			<label for="filter" class="col-2 col-form-label"><i class="glyphicon glyphicon-sort-by-alphabet" aria-hidden="true"></i> Filter&nbsp;</label><br>
			<select class="form-control filters" name="patientType">
				<option selected>All</option>
				<option value="coll">College</option>
				<option value="shs">Senior High School</option>
				<option value="stud">All Student</	option>
				<option value="emp">Employee</option>
			</select>
		</div>
		<div class="form-group">
			<label for="date" class="col-2 col-form-label"><i class="glyphicon glyphicon-calendar"></i>  Visit Date&nbsp;&nbsp;</label><a href="#" onclick="setDateRange()">RESET</a><br>
			<input class="form-control filters" type="date" name="date1" id="date1" required>
			<span>&nbsp;TO&nbsp;</span>
			<input class="form-control filters" type="date" name="date2" id="date2" required>
		</div>
		<div class="form-group pull-right visitfunction" style="margin-top: 25px;">
			<button type="button" class="btn btn-info graphBtn"><i class="glyphicon glyphicon-stats"></i> <b>Show Graph</button>
			<button type="button" class="btn btn-info graphBtn hidden"><i class="glyphicon glyphicon-list-alt"></i>   Show Table</button>
			<button type="button" class="btn btn-secondary" onclick="proceedReport()"><i class="glyphicon glyphicon-file"></i>  Proceed to report</b></button>
		</div>
	</form>

	</div>

	<div class="container card" id="table">
		<div class="row">
			<h3><span id="filterName">All </span>Patient Visits</h3><br>
			<h5 id="date"></h5>
			<hr>
			<div class="table-responsive">
			<table id="visitTable" class="display" cellspacing="0" width="100%">
			</table>
			</div>
		</div>
	</div>

	<div class="container hidden" id="graph">
		<div class="row">
			<div class="col-md-6">
				<section class="widget">
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
				<section class="widget">
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
	</div>
	
	<!-- View Modal -->
	<div class="row">
		<div class="modal fade visit" id="viewModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
				<div class="modal-content visitdtl row">
				  <div class="modal-header col-sm-12">
					<h4 class="modal-title" style="display: inline;">Visit Details</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				  </div>
				  <div class="modal-body col-sm-12">
						<div id="viewVisitDiv">
							<div class="card row">
								<div class="contentheight col-sm-6">
									<b><p> Visit Id</b><br><i class="glyphicon glyphicon-asterisk"></i>  <span class="visitId h2"></span></p>
								</div>

							  <div class="contentheight view  col-sm-6">
									<b><p>Complaint</p></b>
									<ul id="complaint"></ul>
									<b><p>Medicine Requested</p></b>
									<ul id="medicine"></ul>
								</div>
							</div>


								<div class="view col-sm-12">
									<p>Remarks</p>
									<p id="remarks" class="h4" style="margin-left: 30px;"></p>
									<br>
									<p align="right">Created by <b><span id="createdBy"></span></b> on <span id="dateCreated"></span></p>
									<div id="modifyDiv">
										<p align="right">Modified by <b><span id="modifiedBy"></span></b>		 on <span id="dateModified"></span></p>
									</div>

									<br>
									<hr style="width:100%; margin:0px;">
								</div>
						</div>
				  </div>

				  <div class="modal-footer" class="col-sm-12">
						<div class="view">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
				  </div>

				</div>
		  </div>
		</div>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	<script src="vendor/select2-4.0.3/dist/js/select2.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="vendor/widgster.js"></script>
	<script src="js/home-avp.js"></script>
	<script src="js/date.js"></script>
	<script src="js/graph.js"></script>
	<script src="js/date.js"></script>
	<script src="js/checkbox.js"></script>
	<script src="vendor/moment.js"></script>

</body>
</html>

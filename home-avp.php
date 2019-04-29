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
	<title>Home</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="vendor/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet">
	<link href="vendor/DataTables-1.10.15/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/customSelect.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/customSelect.css" rel="stylesheet">
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Graph Resources -->
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
		<form class="form-inline card col-lg-12 col-sm-12 wow fadeIn" id="filter" action="ajax/filtered_visits_avp.php">
			<div class="form-group">
			<label for="filter" class="col-2 col-form-label"><i class="glyphicon glyphicon-sort-by-alphabet" aria-hidden="true"></i> Filter&nbsp;</label><br>
			<select class="form-control filters" name="patientType">
				<option value="All" selected>All</option>
				<option value="coll">College</option>
				<option value="shs">Senior High School</option>
				<option value="stud">All Student</	option>
				<option value="emp">Employee</option>
			</select>
			</div>

			<div class="form-group">
			  <label for="date" class="col-2 col-form-label"><i class="glyphicon glyphicon-calendar"></i>  Visit Date&nbsp;&nbsp;</label><a href="#" onclick="setDateRange()">Reset</a><br>
				<input class="form-control filters" type="date" name="date1" id="date1" required>
				<span>&nbsp;TO&nbsp;</span>
				<input class="form-control filters" type="date" name="date2" id="date2" required>
			</div>

			<div class="form-group pull-right visitfunction" style="margin-top: 25px;">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addVisitModal"><i class="glyphicon glyphicon-plus"></i> <b>Add Visit</b></button>
				<button type="button" class="btn btn-danger tableBtn" onclick="delrecordCheck()"><i class="glyphicon glyphicon-remove"></i>  Delete</button>
				<button type="button" class="btn btn-info graphBtn"><i class="glyphicon glyphicon-stats"></i> <b>Show Graph</button>
				<button type="button" class="btn btn-info graphBtn hidden"><i class="glyphicon glyphicon-list-alt"></i>   Show Table</button>
				<button type="button" class="btn btn-secondary" onclick="proceedReport()"><i class="glyphicon glyphicon-file"></i>  Generate Report</b></button>
			</div>

		</form>
	</div>


	<div class="row wow fadeIn" data-wow-delay=".4s" id="table">
		<div class="container">
			<div class="card col-12">
				<div class="tabletheme" style="margin-top: 20px;" >
					<h3><span id="filterName">All </span>Patient Visits</h3>
					<h5 id="date"></h5>
					<hr><br>
					<div class="table-responsive">
						<table id="visitTable" class="table display" cellspacing="0">
						</table>
				  </div>
				</div>
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



	<!-- Add visit modal -->
	<div class="modal fade" id="addVisitModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Add Patient Visit</h4>
			</div>

			<div class="modal-body">
				<form id="addVisitForm">
					<input type="text" name="userID" value="<?php echo $_SESSION['userID'];?>" class="hidden" required>


					<div id="searchDiv" class="row">
						<label for="patientID"><i class="glyphicon glyphicon-user"></i>  Select Patient</label>
						<div>
							<select class="form-control" id="patientID" name="idNumber" style="width: 100%;" required>
							</select>
						</div>
					</div><br>

					<div class="allergy row">
					</div>
					<div class="row">
						<label for="visitDate" class="col-lg-12 pull-left" style="margin-left:-15px;"><i class="glyphicon glyphicon-calendar"></i>  Set Visit Date</label>
						<input type="datetime-local" name="visitDate" class="visitDate" required>
					</div>
					<br><br>


					<div class="fieldsGroup complaintDiv row" value="10">
						<label for="complaint[]">Complaint/s</label>
						<div class="tbContainer" style="display: none;margin-bottom: 10px;">
							<select data-placeholder="Complaint" class="selComp formInpt col-sm-8" name="complaint[]" disabled required>
							<option></option>
							</select>
							<button class="remove btn btn-warning	"><i class="glyphicon glyphicon-remove"></i></button>
						</div>
						<a href="#" class="addInput"><i class="glyphicon glyphicon-plus"></i>	 Add</a>
					</div>
					<br>
					<div class="fieldsGroup medicineDiv row" value="10">
						<label for="med[]">Medicine requested</label>
						<div class="tbContainer" style="display: none;margin-bottom: 10px;">
							<select data-placeholder="Medicine" class="selMed formInpt" name="med[]" disabled required>
							<option></option>
							</select>
							<input type="number" min="1" class="quantity formInpt" name="med[]" placeholder="Qty." style="width: 100px;" disabled required>
							<button class="remove">Remove</button>
						</div>
						<a href="#" class="addInput"><i class="glyphicon glyphicon-plus"></i> Add</a>

					</div><br>

					<div class="form-group row">
						<label>Remarks</label>
						<textarea rows="4" class="form-control" name="remarks" placeholder="Remarks"></textarea>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-primary pull-right" form="addVisitForm">Add Visit</button>
			</div>

		</div>
		</div>
	</div>


	<!-- View visit Modal -->
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
									<b><p> Visit Id</b><br><i class="glyphicon glyphicon-asterisk"></i>  <span class="visitId h4"></span></p>
									<b><p> Visit Date</b><br><span class="visitDate h4"></span></p>
									<b><p>Patient Name</b> <br><i class="glyphicon glyphicon-user"></i>  <span class="fullName h4"></span></p>
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

						<form id="editVisitForm" class="edit hidden" style="width:80%; margin: 0 auto;">
							<input type="text" name="userID" value="<?php echo $_SESSION['userID'];?>" class="hidden">
							<input type="number" name="visitID" class="hidden">
							<label for="visitDate"><i class="glyphicon glyphicon-calendar"></i> VISIT DATE & TIME</label>
							<br>
							<input type="datetime-local" name="visitDate" class="visitDate" required>
							<br><br>
							<div class="fieldsGroup complaintDiv" value="10">
								<label for="complaint[]">Complaint/s</label>
								<div class="tbContainer" style="display: none;margin-bottom: 10px;">
									<select data-placeholder="Complaint" class="selComp formInpt" name="complaint[]" disabled required>
									<option></option>
									</select>
									<button class="remove">Remove</button>
								</div>
								<a href="#" class="addInput">+ Add</a>
							</div><br>
							<div class="fieldsGroup medicineDiv" value="10">
								<label for="med[]">Medicine requested</label>
								<div class="tbContainer" style="display: none;margin-bottom: 10px;">
									<select data-placeholder="Medicine" class="selMed formInpt" name="med[]" disabled>
									<option></option>
									</select>
									<input type="number" min="1" class="quantity formInpt" name="med[]" placeholder="Qty." style="width: 100px;" disabled>
									<button class="remove">Remove</button>
								</div>
								<a href="#" class="addInput">+ Add</a>

							</div><br>

							<div class="form-group">
								<label>Remarks</label>
								<textarea rows="4" class="form-control" name="remarks" id="remarksEdit" placeholder="Remarks" required></textarea>
							</div>
						</form>
				  </div>

				  <div class="modal-footer" class="col-sm-12">
						<div class="view">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" onclick="editVisit(this)" id="btnEdit">Edit  <i class="glyphicon glyphicon-pencil"></i> </button>
						</div>

						<div class="edit hidden">
							<button type="button" class="btn btn-secondary" onclick="editFormHide()">Cancel</button>
							<button type="submit" class="btn btn-primary pull-right" form="editVisitForm">Update Visit</button>
						</div>
				  </div>

				</div>
		  </div>
		</div>
	</div>



	<!-- Delete visit modal -->
	<div class="modal fade" id="delete-visit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-border">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title fw-bold mt" id="myModalLabel20">Are you sure you want to delete this visit?</h4>
					<p class="fs-mini text-muted mt-sm">
						Press "Confirm Delete" if you are sure to delete the visit from the system. If not, press "Cancel".
					</p>
				</div>

				<div class="modal-footer no-border">
					<button data-dismiss="modal" class="btn btn-default">Cancel</button>
					<button data-dismiss="modal" id="create-event" class="btn btn-primary" name="update" onclick="delpatientVisit();">Confirm Delete</button>
				</div>
			</div>
		</div>
	</div>

	<div class="row page-footer wow fadeIn" data-wow-delay="0.7s">
		<footer class="col-lg-12 col-sm-12">
					Clinic Drug-dispense Reporting System.
		</footer>
	</div>

	<script src="vendor/jquery-2.1.0.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="vendor/select2-4.0.3/dist/js/select2.min.js"></script>
	<script src="vendor/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	<script src="vendor/widgster.js"></script>
	<script src="vendor/moment.min.js"></script>
	<script src="js/visit_form.js"></script>
	<script src="js/home-avp2.js"></script>
	<script src="js/date.js"></script>
	<script src="js/checkbox.js"></script>
	<script src="js/graph.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="vendor/moment.js"></script>
  <script>
  new WOW().init();
  </script>


</body>
</html>

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
	<title>Report</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/DataTables/datatables.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
	<?php
	  include("includes/navbar-avp-admin.php");
	?>

	<div class="container" style="padding-bottom: 20px !important;">

		<div class="row">
			<div class="col-md-12">
				<img src="assets/LogoColored.png" style="display:block;height:40px;float:left;">
				<h4>Clinic Drug-dispense Reporting System</h4>
				<h4 id="date">Date</h4>
				<div class="card col-lg-6 col-sm-12 reportcard blue white-text" align="center">
					Filter Type:
					<b><h3 id="pType" align="center"></h3></b>
				</div>
				<div class="card col-lg-3 col-sm-6 reportcard teal white-text" align="center">
					<p>Total Unique Patients:</p>
					<b><h3 id="totalP"></h3></b>
				</div>
				<div class="card col-lg-3 col-sm-6 reportcard yellow" align="center">
					<p>Total Number of  Visits:<b><h3 id="totalV"></h3></b></p>
				</div>

				<div class="col-lg-12 card table-responsive">
					<h4>Complaints Report</h4>
					<hr>
					<table id="complaintTable" class="display" cellspacing="0" width="100%">
					</table>
					<span align="right">
						<p>Total Complaints:</p>
						<h4 id="totalComp"></h4>
					</span>
				</div>

				<div class="col-lg-12 card table-responsive">
					<h4>Medicine Dispense Report</h4>
					<hr>
					<table id="medicineTable" class="display" cellspacing="0" width="100%">
					</table>
					<span align="right">
						<p>Total Medicine / Supply Dispensed:</p>
						<h4 id="totalMed"></h4>
					</span>
				</div>

				<p>Staff</p>
				<p><?php echo $_SESSION['role']." ".$_SESSION['firstName']?></p>
				<div class="btn-toolbar mt-lg text-align-right hidden-print">
					                  <button class="btn btn-danger" onclick="window.history.go(-1)">
					                      Back
					                      &nbsp;
					                      <span class="circle bg-white">
					                          <i class="fa fa-arrow-left text-danger"></i>
					                      </span>
					                  </button>
							<button id="print" class="btn btn-inverse" onclick="window.print()">
					                      <i class="fa fa-print"></i>
					                      &nbsp;&nbsp;
					                      Print
					                  </button>
					              </div>
					  </div>

		</div>
	</div>

	<script src="vendor/jquery-2.1.0.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="vendor/widgster.js"></script>
	<script src="vendor/moment.js"></script>
	<script src="js/report.js"></script>

</body>
</html>

<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if($_SESSION['role'] != 'Avp') {
	header("location: home.php");
}

?>
<html>
<head>
	<title>Report</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables-1.10.15/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">

</head>
<body>
	<?php
	  include("includes/navbar-avp.php");
	?>

	<div class="container" style="padding-bottom: 20px !important;">

		<div class="row">
			<div class="col-md-12">
				<img src="assets/LogoColored.png" style="display:block;height:40px;float:left;">
				<h4>Clinic Drug-dispense Reporting System</h4>
				<h4 id="date">Date</h4>
				<p id="pType"></p>
				<p>Total Unique Patients:</p>
				<p id="totalP"></p>
				<p>Total Unique Visits:</p>
				<p id="totalV"></p>
				<table id="complaintTable" class="display" cellspacing="0" width="100%" style="margin: 70px 0 70px 0;">
				</table>
				<p>Total Complaints:</p>
				<h4 id="totalComp"></h4>
				<table id="medicineTable" class="display" cellspacing="0" width="100%" style="margin: 50px 0 50px 0;">

				</table>
				<span>
					<p>Total Medicine / Supply Dispensed:</p>
					<p id="totalMed"></p>
				</span>
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
	<script src="vendor/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="vendor/widgster.js"></script>
	<script src="vendor/moment.js"></script>
	<script src="js/report.js"></script>

</body>
</html>

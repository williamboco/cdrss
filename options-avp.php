<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if($_SESSION['role'] != 'Admin') {
	header("location: options.php");
}

?>
<html>
<head>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables/datatables.min.css" rel="stylesheet">
	<link href="vendor/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/all.min.css" rel="stylesheet">
	<link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Options</title>
</head>
<body>
	<?php
	  include("includes/navbar-avp.php");
	?>
	<div class="container">
		<div class="row" style="margin-top: 50px;">
			<div class="col-sm-2">
				<button type="button" class="btn btn-md btn-block filter" value="course">Courses</button>
				<button type="button" class="btn btn-md btn-block filter" value="track">Tracks</button>
				<button type="button" class="btn btn-md btn-block filter" value="department">Departments</button>
				<button type="button" class="btn btn-md btn-block filter" value="allergy">Allergies</button>
				<button type="button" class="btn btn-md btn-block filter" value="complaint">Complaints</button>
				<button type="button" class="btn btn-md btn-block medicine-filter" value="medicine">Inventory</button>
			</div>

			<div class="col-sm-10">

					<div style="margin-bottom: 30px;">
						<button type="button" class="btn btn-danger" onclick="delRecord()" id="deleteBtn"><i class="glyphicon glyphicon-remove"></i>  Delete</button>
						<button type="button" class="btn btn-info" onclick="editRecord()" id="editBtn"><i class="glyphicon glyphicon-pencil"></i>  Update</button>
						<button type="button" class="btn btn-primary" id="addBtn" data-toggle="modal" data-target="#addModal"><i class="glyphicon glyphicon-plus"></i>  Add</button>
					</div>
					<div class="btn-group btn-group-justified hidden" role="group" id="medicineBtnGrp">
						<div class="btn-group"><button type="button" class="btn btn-lg btn-info medicine-filter" value="medicine">All</button></div>
						<div class="btn-group"><button type="button" class="btn btn-lg btn-success filters" value="3">Optimum Stock Level</button></div>
						<div class="btn-group"><button type="button" class="btn btn-lg btn-warning filters" value="2">Threshold Stock Level</button></div>
						<div class="btn-group"><button type="button" class="btn btn-lg btn-danger filters" value="1">Critical Stock Level</button></div>
					</div>
					<div class="card">
						<div class="table-responsive">
							<table id="table" class="display hover" cellspacing="0" width="100%">
							</table>
						</div>
						<div class="medicine-responsive hidden">
							<table id="medicineTable" class="display hover" cellspacing="0" width="100%">
							</table>
						</div>
					</div>
			</div>

		</div>

	</div>

	<!-- Add Modal -->
	<div class="modal fade" id="addModal" role="dialog">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
			<!--<div class="modal-header">

			</div>-->
		  <div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<form id="add-medicine" class="addForm" action="ajax/table/medicineCreate.php">
					<h4>Add Medicine / Supply</h4><br>
					<div class="form-group">
						<select class="form-control" name="isSupply" required>
							<option disabled selected>Please choose...</option>
							<option value="0">Medicine</option>
							<option value="1">Supply</option>
						</select>
						<div id="medDiv" class="hidden">
							<br>
							<label>BRAND NAME *</label>
								<input type="text" class="form-control" name="brandName" placeholder="Brand name" required><br>
							<label>GENERIC NAME *</label>
								<input type="text" class="form-control" name="genericName" placeholder="Generic name"><br>
							<label>MEDICINE TYPE *</label>
								<select class="form-control" name="medicineType" required>
									<option disabled selected>Please choose..</option>
									<option value="Tablet">Tablet</option>
									<option value="Capsule">Capsule</option>
									<option value="Ointment">Ointment</option>
									<option value="Eye Drop">Eye Drop</option>
									<option value="Tooth Drop">Tooth Drop</option>
									<option value="Ear Drop">Ear Drop</option>
									<option value="Medicated spray">Medicated spray</option>
								</select><br>
							<label>UNIT OF MEASURE *</label>
								<div class="row">
									<div class="col-md-4">
										<input type="number" class="form-control" name="medicineDosageQty" placeholder="Dosage Amount" min="1" required>
									</div>
									<div class="col-md-8">
										<select class="form-control" name="medicineDosage" required>
											<option disabled selected>Please choose...</option>
											<option value="g">g</option>
											<option value="mg">mg</option>
											<option value="l">l</option>
											<option value="ml">ml</option>
										</select><br>
									</div>
								</div>
							<label>INITIAL STOCK QUANTITY *</label>
								<input type="number" class="form-control" name="medicineCurrentQty" placeholder="Initial Stock Quantity" min="1" required><br>
							<label>THRESHOLD QUANTITY *</label>
								<input type="number" class="form-control" name="medicineThresholdQty" placeholder="Threshold Quantity" min="1" required><br>
							<label>CRITICAL QUANTITY *</label>
								<input type="number" class="form-control" name="medicineCriticalQty" placeholder="Critical Quantity" min="1" required><br>
						</div>
						<div id="supDiv" class="hidden">
							<br>
							<label>SUPPLY NAME *</label>
								<input type="text" class="form-control" name="supplyName" placeholder="Supply name" required><br>
							<label>UNIT OF MEASURE *</label>
								<div class="row">
									<div class="col-md-4">
										<input type="number" class="form-control" name="supplyDosageQty" placeholder="Dosage Amount" min="1" required>
									</div>
									<div class="col-md-8">
										<select class="form-control" name="supplyDosage" required>
											<option disabled selected>Please choose...</option>
											<option value="box">Box</option>
											<option value="piece">Piece</option>
											<option value="bottle">Bottle</option>
										</select><br>
									</div>
								</div>
							<label>INITIAL STOCK QUANTITY *</label>
								<input type="number" class="form-control" name="supplyCurrentQty" placeholder="Initial Stock Quantity" min="1" required><br>
							<label>THRESHOLD QUANTITY *</label>
								<input type="number" class="form-control" name="supplyThresholdQty" placeholder="Threshold Quantity" min="1" required><br>
							<label>CRITICAL QUANTITY *</label>
								<input type="number" class="form-control" name="supplyCriticalQty" placeholder="Critical Quantity" min="1" required><br>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right hidden">Submit</button>
				</form>

				<form id="add-complaint" class="addForm" action="ajax/table/complaintCreate.php">
					<h4>Add Complaint</h4><br>
					<div class="form-group">
						<label>COMPLAINT NAME *</label>
							<input type="text" class="form-control" name="complaintName" placeholder="Complaint name" required><br>
						<label>SYMPTOMS</label>
							<textarea class="form-control" name="description" rows="3" placeholder="Symptoms"></textarea>

					</div>
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="add-allergy" class="addForm" action="ajax/table/allergyCreate.php">
					<h4>Add Allergy</h4><br>
					<div class="form-group">
						<label>ALLERGY NAME *</label>
							<input type="text" class="form-control" name="allergyName" placeholder="Allergy name" required><br>
						<label>SYMPTOMS</label>
							<textarea class="form-control" name="description" rows="3" placeholder="Symptoms"></textarea><br>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="add-course" class="addForm" action="ajax/table/courseCreate.php">
					<h4>Add Course</h4><br>
					<div class="form-group">
						<label>COURSE NAME *</label>
						<textarea class="form-control" name="courseName" rows="3" placeholder="Course name" required></textarea><br>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="add-track" class="addForm" action="ajax/table/trackCreate.php">
					<h4>Add Track</h4><br>
					<div class="form-group">
						<label>TRACK NAME *</label>
						<textarea class="form-control" name="trackName" rows="3" placeholder="Track name" required></textarea><br>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="add-department" class="addForm" action="ajax/table/departmentCreate.php">
					<h4>Add Department</h4><br>
					<div class="form-group">
						<label>DEPARTMENT NAME *</label>
						<textarea class="form-control" name="departmentName" rows="3" placeholder="Department name" required></textarea><br>
					</div>
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

		  </div>
		</div>
	  </div>
	</div>

	<!-- Edit Modal -->
	<div class="modal fade" id="editModal" role="dialog">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<form id="edit-medicine" class="editForm" action="ajax/table/medicineUpdate.php">
					<h4>Update Medicine / Supply</h4><br>
					<div class="form-group">
						<select class="form-control" name="isSupply" required>
							<option disabled selected>Please choose...</option>
							<option value="0">Medicine</option>
							<option value="1">Supply</option>
						</select>
						<div id="medDiv" class="hidden">
							<br>
							<label>BRAND NAME *</label>
								<input type="text" class="form-control" name="brandName" placeholder="Brand name" required><br>
							<label>GENERIC NAME *</label>
								<input type="text" class="form-control" name="genericName" placeholder="Generic name"><br>
							<label>MEDICINE TYPE *</label>
								<select class="form-control" name="medicineType" required>
									<option disabled selected>Please choose..</option>
									<option value="Tablet">Tablet</option>
									<option value="Capsule">Capsule</option>
									<option value="Ointment">Ointment</option>
									<option value="Eye Drop">Eye Drop</option>
									<option value="Tooth Drop">Tooth Drop</option>
									<option value="Ear Drop">Ear Drop</option>
									<option value="Medicated spray">Medicated spray</option>
								</select><br>
							<label>UNIT OF MEASURE *</label>
								<div class="row">
									<div class="col-md-4">
										<input type="number" class="form-control" name="medicineDosageQty" placeholder="Dosage Amount" min="1" required>
									</div>
									<div class="col-md-8">
										<select class="form-control" name="medicineDosage" required>
											<option disabled selected>Please choose...</option>
											<option value="g">g</option>
											<option value="mg">mg</option>
											<option value="l">l</option>
											<option value="ml">ml</option>
										</select><br>
									</div>
								</div>
								<label>THRESHOLD QUANTITY *</label>
									<input type="number" class="form-control" name="medicineThresholdQty" placeholder="Threshold Quantity" min="1" max="2000" required><br>
								<label>CRITICAL QUANTITY *</label>
									<input type="number" class="form-control" name="medicineCriticalQty" placeholder="Critical Quantity" min="1" max="2000" required><br>
						</div>
						<div id="supDiv" class="hidden">
							<br>
							<label>SUPPLY NAME *</label>
								<input type="text" class="form-control" name="supplyName" placeholder="Supply name" required><br>
							<label>UNIT OF MEASURE *</label>
								<div class="row">
									<div class="col-md-4">
										<input type="number" class="form-control" name="supplyDosageQty" placeholder="Dosage Amount" min="1" required>
									</div>
									<div class="col-md-8">
										<select class="form-control" name="supplyDosage" required>
											<option disabled selected>Please choose...</option>
											<option value="box">Box</option>
											<option value="piece">Piece</option>
											<option value="bottle">Bottle</option>
										</select><br>
									</div>
								</div>								
								<label>THRESHOLD QUANTITY *</label>
									<input type="number" class="form-control" name="supplyThresholdQty" placeholder="Threshold Quantity" min="1" max="2000" required><br>
								<label>CRITICAL QUANTITY *</label>
									<input type="number" class="form-control" name="supplyCriticalQty" placeholder="Critical Quantity" min="1" max="2000" required><br>
						</div>
					</div>
					<input type="number" name="id" class="hidden">
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="edit-complaint" class="editForm" action="ajax/table/complaintUpdate.php">
					<h4>Update Complaint</h4><br>
					<div class="form-group">
						<label>COMPLAINT NAME *</label>
							<input type="text" class="form-control" name="complaintName" placeholder="Complaint name" required><br>
						<label>SYMPTOMS</label>
							<textarea class="form-control" name="description" rows="3" placeholder="Symptoms"></textarea><br>
					</div>
					<br>
					<input type="number" name="id" class="hidden">
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="edit-allergy" class="editForm" action="ajax/table/allergyUpdate.php">
					<h4>Update Allergy</h4><br>
					<div class="form-group">
						<label>ALLERGY NAME *</label>
							<input type="text" class="form-control" name="allergyName" placeholder="Allergy name" required><br>
						<label>SYMPTOMS</label>
							<textarea class="form-control" name="description" rows="3" placeholder="Symptoms"></textarea><br>
					</div>
					<br>
					<input type="number" name="id" class="hidden">
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="edit-course" class="editForm" action="ajax/table/courseUpdate.php">
					<h4>Update Course</h4><br>
					<div class="form-group">
						<label>COURSE NAME *</label>
							<textarea class="form-control" name="courseName" rows="3" placeholder="Course name" required></textarea><br>
					</div>
					<br>
					<input type="number" name="id" class="hidden">
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="edit-track" class="editForm" action="ajax/table/trackUpdate.php">
					<h4>Update Track</h4><br>
					<div class="form-group">
						<label>TRACK NAME *</label>
							<textarea class="form-control" name="trackName" rows="3" placeholder="Track name" required></textarea><br>
					</div>
					<br>
					<input type="number" name="id" class="hidden">
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<form id="edit-department" class="editForm" action="ajax/table/departmentUpdate.php">
					<h4>Update Department</h4><br>
					<div class="form-group">
						<label>DEPARTMENT NAME *</label>
							<textarea class="form-control" name="departmentName" rows="3" placeholder="Department name" required></textarea><br>
					</div>
					<br>
					<input type="number" name="id" class="hidden">
					<button type="submit" class="btn btn-primary pull-right">Submit</button>
				</form>

				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

		  </div>
		</div>
	  </div>
	</div>

	<div class="row page-footer wow fadeIn" data-wow-delay="0.7s">
		<footer class="col-lg-12 col-sm-12">
					Clinic Drug-dispense Reporting System.
		</footer>
	</div>

	<script src="vendor/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="js/options.js"></script>
	<script src="js/checkbox.js"></script>
	<script src="js/wow.min.js"></script>
	<script>
	new WOW().init();
	</script>
</body>
</html>

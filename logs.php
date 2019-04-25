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
	<title>Audit Log</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables-1.10.15/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	<link href="css/main.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<?php
		include("includes/navbar-avp.php");
	?>
	<div class="row">
		<div class="container card" style="margin-top: 30px;">
			<div class="col-lg-12">
				<h3 class="col-lg-6 col-sm-6">Audit Log Viewer</h3>
				<div class="col-lg-6 col-sm-6" style="margin-top: 15px;">
					<button type="button" class="btn btn-info pull-right" data-toggle="modal" onClick="window.location.reload()"><i class="fas fa-redo-alt"></i>  Refresh</button>
				</div>
			</div>
		</div>
		<div class="container card" style="margin-top: 10px;">
			<div class="table-responsive">
				<table id="logsTable" class="display" cellspacing="0" width="100%">
				</table>
			</div>
		</div>
	</div>

	<!-- Add Modal -->
<div class="row">
	<div class="modal fade" id="addModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		<div class="modal-content addUser row">
			<div class="modal-header col-sm-12">
				<form id="addForm" action="ajax/userCreate.php" method="post">
					<h4 class="modal-title" style="display: inline;">Add New User Account</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
				<div class="modal-body col-sm-12">
				<div class="addUser card row">
					<div class="form-group">
						<label for ="avpID">User ID</label>
						<input type="text" class="form-control hidden" name="avpID" value="<?php echo $_SESSION['userID'];?>">
						<input type="text" class="form-control" name="idNumber" placeholder="User ID" minlength="6" required><br>
						<select class="form-control" name="role" required>
						  <option value="" disabled selected>User role</option>
						  <option value="Admin">Admin</option>
						  <option value="Physician">Physician</option>
						  <option value="Nurse">Nurse</option>
						  <option value="Dentist">Dentist</option>
						</select><br>
						<label for ="firstname">First Name</label>
						<input type="text" class="form-control" name="firstname" placeholder="Firstname" required><br>
						<label for ="lastname">Last Name</label>
						<input type="text" class="form-control" name="lastname" placeholder="Lastname" required><br>
						<label for ="email">Email Address</label>
						<input type="email" class="form-control" name="email" placeholder="Email" required><br>
						<label for ="dateEmployed">Employment Date</label>
						<input type="date" class="form-control" name="dateEmployed" placeholder="Date of employment" required><br>
						<label for ="contact">Contact Number</label>
						<input type="text" class="form-control" name="contact" placeholder="Contact Number" required><br>
						<label>Gender</label><br>
						<input type="radio" name="gender" value="Male" id="gender1" required>
					  <label for="gender1" style="margin-right: 50px;">Male</label>
					  <input type="radio" name="gender" value="Female" id="gender2" required>
					  <label for="gender2">Female</label>
					</div>
				</form>
			</div>

		  <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-primary pull-right" form="addForm">Submit</button>
		  </div>
		</div>
	 </div>
</div>
</div>
</div>

	<!-- View Modal -->
		<div class="modal fade" id="viewModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
				<div class="modal-content row">
				  <div class="modal-header col-sm-12">
						<h4 class="modal-title" style="display: inline;">Edit User Status</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
				  </div>
				  <div class="modal-body col-sm-12">
						<div class="viewProfile card row">
							<p style="font-size: 16px;"><b>User Id</b><br/><span id="userID"></span></p>
							<p style="font-size: 16px;"><b>Role</b><br/><span id="role"></span></p>
							<p style="font-size: 16px;"><b>Email</b><br/><span id="email"></span><p>
							<p style="font-size: 16px;"><b>Name</b><br/><span id="name" style="color:#014FB3;"></san></p>
							<p style="font-size: 16px;"><b>Gender</b><br/><span id="gender"></span></p>
							<p style="font-size: 16px;"><b>Contact</b><br/><span id="contact"></span></p>
							<p style="font-size: 16px;"><b>Date Employed</b><br/><span id="dateEmployed"></span></p>
							<br/><br/>

						<div class="card-body col-sm-12">
							<p style="font-size: 16px;"><i class="fas fa-power-off"></i></i><b> User Status</b><br/></p>
							<br/>
				  	<form>
	  						<div class="form-row">
									<div class="col-sm-6">
											 <label><input type="radio" name="statusType" value="1" checked="checked" required> Active</label>
									</div>
									<div class="col-sm-6">
										 <label><input type="radio" name="statusType" value="0" checked="checked" required> Inactive</label>
									</div>
							</div>
						</div>
					</div>
				<!--	<div class="confirmDelete hidden">
						<p style="font-size: 20px;"><b>Are you sure you want to deactivate this user?</b></p>
					</div>-->
				</div>
			  <div class="modal-footer col-sm-12">
				<!--	<div class="confirmDelete hidden">
						<button type="button" class="btn btn-primary" onclick="cancelDelete()">Cancel</button>
						<button type="button" class="btn btn-danger" id="deleteBtn" onclick="deleteUser(this.value)">Deactivate</button>
					</div>-->
					<div class="viewProfile">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-info" id="deleteBtn" name="submit" onclick="deleteUser(this.value)"> Update</button> <!--//update(submit) button-->
					</div>
		  	</div>
			</form>
			</div>
	 </div>
</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/DataTables-1.10.15/media/js/jquery.dataTables.min.js"></script>
	<script src="vendor/select2-4.0.3/dist/js/select2.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="js/logs.js"></script>

</body>
</html>

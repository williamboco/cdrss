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
	<title>User List - Admin</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/DataTables-1.10.15/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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
		<div class="container card" style="margin-top: 20px;">
			<div class="col-lg-12">
				<h3 class="col-lg-6 col-sm-6">Users</h3>
				<div class="col-lg-6 col-sm-6">
					<button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#addModal"><i class="glyphicon glyphicon-plus"></i> Add User</button>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="table-responsive">
				<table id="userTable" class="display" cellspacing="0" width="100%">
				</table>
			</div>
		</div>
	</div>
	<!-- Add Modal -->
	<div class="modal fade" id="addModal" role="dialog">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

				<form id="addForm" action="ajax/userCreate.php" method="post" >
					<h4>Add User</h4><br>
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

	<!-- View Modal -->
	<div class="modal fade" id="viewModal" role="dialog">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-body">

			<div class="viewProfile">
				<p>User Id<span id="userID" style="margin-left: 50px;"></span></p>
				<p>Role<span id="role" style="margin-left: 50px;"></span></p>
				<p>Email<span id="email" style="margin-left: 50px;"></span></p>
				<p>Name<span id="name" style="margin-left: 50px;"></span></p>
				<p>Gender<span id="gender" style="margin-left: 50px;"></span></p>
				<p>Contact<span id="contact" style="margin-left: 50px;"></span></p>
				<p>Date Employed<span id="dateEmployed" style="margin-left: 50px;"></span></p>

			</div>

			<div class="confirmDelete hidden">
				<h3>Are you sure you want to delete this user?</h3>
			</div>

		  </div>
		  <div class="modal-footer">
			<div class="confirmDelete hidden">
				<button type="button" class="btn btn-danger" id="deleteBtn" onclick="deleteUser(this.value)">Confirm Delete</button>
				<button type="button" class="btn btn-primary" onclick="cancelDelete()">Cancel</button>
			</div>
			<div class="viewProfile">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger" onclick="confirmDelete()">Delete</button>
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
	<!-- <script src="js/user-list.js"></script> -->
	<script type="text/javascript" src="js/users.js"></script>
</body>
</html>

	<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

?>
<html>
<head>
	<title>My Account</title>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<?php
		include("includes/navbar-avp.php");
	?>

	<div class="container">
		<div class="row card no-padding">
			<div class="col-lg-4 valign-wrapper">

					<div class="col-lg-12 card-header">
						<button type="button" class="btn btn-secondary col-lg-3 col-sm-6 marginbtn pull-left bckbtn" onclick="window.history.go(-1)"><i class="glyphicon glyphicon-arrow-left"></i>  Back</button>
					</div>

					<div class="col-lg-12 card-content">
						<h2 class="col-lg-12" align="center">My Account</h2>
						<div class="btnmyaccnt">
							<button type="button" class="btn btn-primary col-lg-5 col-md-5 col-sm-12 marginbtn" onclick="viewUser(this.value)" value="<?php echo $_SESSION['userID'];?>" id="viewBtn"><i class="glyphicon glyphicon-eye-open"></i>  View Profile</button>
							<button type="button" class="btn btn-primary col-lg-6 col-md-6 col-sm-12 marginbtn" onclick="editUser()"><i class="glyphicon glyphicon-pencil"></i>  Edit Profile</button>
							<button type="button" class="btn btn-info col-lg-6 col-md-6 col-sm-12 marginbtn" onclick="changePassword()"><i class="glyphicon glyphicon-wrench"></i>  Change Password</button>
						</div>
					</div>
			</div>
				<div class="col-lg-8 userprofileinfo">
						<div class="viewProfile divs">
							<h3><b>User Profile</b></h3>
							<hr>
							<div class="col-lg-6 col-sm-12">
								<h5>User Id</h5><h3 id="userID" ></h3>
								<h5>Role</h5><h3 id="role" ></h3>
								<h5>Gender</h5><h3 id="gender" ></h3>
						  </div>
							<div class="col-lg-6 col-sm-12">
								<h5>Name</h5><h3 id="name" ></h3>
								<h5>Account E-mail</h5><h3 id="email" ></h3>
								<h5>Contact</h5><h3 id="contact" ></h3>
								<h5>Employment Date</h5><h3 id="dateEmployed" ></h3>
							</div>
						</div>

						<div class="editProfile hidden divs">
							<form id="profileForm" action="ajax/userUpdate.php" method="post" class="col-md-8" >
								<h4>Edit Profile</h4><br>
								<div class="form-group">
									<input type="text" class="form-control hidden" name="userID" value="<?php echo $_SESSION['userID'];?>">
									<input type="text" class="form-control" name="idNumber" placeholder="User ID" required><br>
									<input type="text" class="form-control" name="firstname" placeholder="Firstname" required><br>
									<input type="text" class="form-control" name="lastname" placeholder="Lastname" required><br>
									<input type="email" class="form-control" name="email" placeholder="Email" required><br>
									<input type="date" class="form-control" name="dateEmployed" placeholder="Date of employment" required><br>
									<input type="text" minlength="1" maxlength="11" pattern="[0-9]{0-9}[0-9]{0-9}" class="form-control" name="contact" placeholder="Contact Number" required><br>
									<label>Gender</label><br>
									<input type="radio" name="gender" value="Male" id="gender1" required>
									<label for="gender1" style="margin-right: 50px;">Male</label>
									<input type="radio" name="gender" value="Female" id="gender2" required>
									<label for="gender2">Female</label>
								</div>

								<button type="submit" class="btn btn-primary pull-right marginbtn">Submit</button>
								<button type="button" class="btn btn-secondary pull-right marginbtn">Cancel</button>
							</form>
						</div>
						<div class="editPassword hidden divs">
							<form id="passwordForm" autocomplete="off"  action="ajax/password/change.php" method="post" class="col-md-8" >
								<h4>Password</h4><br>
								<div class="form-group">
									<p>Last Password Change:<span id="passChanged" ></span></p>
									<input type="text" class="form-control hidden" name="userID" value="<?php echo $_SESSION['userID'];?>">
									<input type="password" autocomplete="off"  class="form-control" name="oldPass" placeholder="Current Password" required><br>
									<input type="password" autocomplete="off"  class="form-control" name="password1" placeholder="New Password" required><br>
									<input type="password" autocomplete="off"  class="form-control" name="password2" placeholder="Repeat New Password" required><br>
								</div>

								<button type="submit" class="btn btn-primary pull-right marginbtn">Submit</button>
								<button type="button" class="btn btn-secondary pull-right marginbtn">Cancel</button>
							</form>
						</div>
					</div>
		</div>
	</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="js/account.js"></script>

</body>
</html>

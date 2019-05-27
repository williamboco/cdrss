<?php
ob_start();
session_start();
include('includes/dbcon.php');

if (isset($_SESSION['userID'])) {
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
    <title>CDRS - IT</title>
    <link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
    <link href="css/application.css" rel="stylesheet">
	  <link href="css/main.css" rel="stylesheet">
    <link rel="shortcut icon" href="favicon.png" />
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>

<body class="login-page" style="max-height: 100% !important;">
<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row"><br/>
            <div class="col-lg-4 col-sm-6 col-xs-12 col-lg-offset-4 col-sm-offset-3">
              <img src = "assets/iacademy-web-logo-white.png" class="logo-responsive">
      				<h4 class="widget-login-logo titlecolor animated fadeInUp">
      						<b>Clinic Drug-Dispense Reporting System</b>
      				</h4>
              <section class="widget widget-login animated fadeInUp viewLogin">
              <header>
                <img src="assets/LogoColored.png" class="viewLogin" style="height:100px; display:block; margin:0 auto;"><br>
                <div class="widget-body">
					        <div class="alert alert-danger">
                  </div>
                  <h3 align="center" class="viewLogin"><b>Sign in</b></h3>
              </header><br/>
              <form id="logInForm" action="ajax/log_in.php" method="post">
                <div class="form-group input-group viewLogin">
                  <span class="input-group-addon login-addon">
                    <div class="glyphicon glyphicon-envelope"></div>
                  </span>
                  <input type="email" class="form-control" name="email" placeholder="Email" required>
                </div>
                <div class="form-group input-group viewLogin">
                  <span class="input-group-addon login-addon">
                    <div class="glyphicon glyphicon-asterisk"></div>
                  </span>
                  <input class="form-control" type="password" name="password" placeholder="Password" required>
                </div>
                <div class="clearfix viewLogin">
                  <div class="btn-toolbar">
                    <button type="submit" class="btn btn-primary btn-md btn-block">Login</button>
                  </div>
                </div>
                <div class="row indent viewLogin"><br/>
                  <a href="pass-reset.php">Forgot Password?</a>
                </div>
              </form>
              <div class="viewLogin">
                New user?<button class="btn-link" onclick="regForm(this)" style="margin-top:-25px;"><i class="fas fa-user-friends fa-lg float-left"></i> Register here</button>
              </div>
            </section>
          </div>

          <!--Register Form-->
          <div class="viewRegForm hidden">
            <div class="col-lg-6 col-sm-6 col-xs-12 col-lg-offset-3 col-sm-offset-4">
              <section class="widget widget-login animated fadeInUp">
                <div class="alert alert-success"></div>
                <div class="alert alert-danger"></div>
                <h3 align="center"><b>Register</b></h3><br/>
                <form id="addForm" action="ajax/userRegister.php" method="post">
                  <div class="addUser card-reg row">
                    <div class="form-group">

                      <div class="form-group input-group">
                        <span class="input-group-addon login-addon">
                          <div class="glyphicon glyphicon-envelope"></div>
                        </span>
                        <input type="email" class="form-control" name="email" placeholder="Email" required>
                      </div>

                      <div class="form-group input-group">
                        <span class="input-group-addon login-addon">
                          <div class="glyphicon glyphicon-asterisk"></div>
                        </span>
                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                      </div><br/>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="avpID">User ID *</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control hidden" name="avpID" value="<?php echo $_SESSION['userID'];?>">
                          <input type="number" class="form-control" name="idNumber" placeholder="User ID" minlength="6" required><br>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="role">User Role *</label>
                        <div class="col-sm-8">
                          <select class="form-control" name="role" required>
                            <option value="" disabled selected>User Role</option>
                            <option value="IT">I.T</option>
                          </select><br>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="firstname">First Name *</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="firstname" placeholder="Firstname" required><br>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label"for="lastname">Last Name *</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="lastname" placeholder="Lastname" required><br>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label">Gender *</label><br>
                        <div class="col-sm-8">
                          <input type="radio" name="gender" value="Male" id="gender1" checked required>
                          <label for="gender1" style="margin-right: 50px;" checked>Male</label>
                          <input type="radio" name="gender" value="Female" id="gender2" required>
                          <label for="gender2">Female</label><br/><br/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="dateEmployed">Employment Date *</label>
                        <div class="col-sm-8">
                          <input type="date" class="form-control" name="dateEmployed" placeholder="Date of employment" required><br>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="contact">Contact Number</label>
                        <div class="col-sm-8">
                          <input type="number" class="form-control" min="1" name="contact" maxlength="11" pattern=".{0,11}" title="0 to 11 characters"placeholder="Contact Number"><br>
                        </div>
                      </div>

                    </div>
                  </div>
                </form>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary btn-md" onclick="regFormHide()">Cancel</button>
                  <button type="submit" class="btn btn-primary btn-md" form="addForm">Submit</button>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </div>
  </main>
<!-- common libraries. required for every page-->
<script src="vendor/common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
<script src="js/index.js"></script>
</body>
</html>

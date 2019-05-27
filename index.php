<?php
ob_start();
session_start();
include('includes/dbcon.php');

if (isset($_SESSION['userID'])) {
    if($_SESSION['role'] == 'Physician') {
		header("location: home-avp.php");
	}else
		header("location: home.php");
}


?>

<html>
<head>
    <title>CDRS - Login</title>
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

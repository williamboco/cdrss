<?php
ob_start();
session_start();
include('includes/dbcon.php');

if (isset($_SESSION['userID'])) {
    if($_SESSION['role'] == 'Admin') {
		header("location: home-avp.php");
	}else
		header("location: home.php");
}

?>



<html>
<head>
    <title>CDRS - Login</title>
	<link rel="shortcut icon" href="favicon.png" />
    <link href="css/application.css" rel="stylesheet">
	  <link href="css/main.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>

<body class="login-page" style="max-height: 100% !important;">
<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-12 col-lg-offset-4 col-sm-offset-3">
				<h4 class="widget-login-logo animated fadeInUp">
						<b>Clinic Drug-dispense Reporting System</b>
				</h4>
                <section class="widget widget-login animated fadeInUp">
                    <header>
						<img src="assets/LogoColored.png" style="height:100px; display:block; margin:0 auto;">
						<br>
                        <h3 align="center">Login to your account</h3>
                    </header>
                    
                    <div class="widget-body">
						<div class="alert alert-danger">
						</div>
                        <form action="ajax/log_in.php">
                            <div class="form-group input-group">
								<span class="input-group-addon login-addon">
								<div class="glyphicon glyphicon-envelope"></div>
								</span>
                                <input type="email" class="form-control " name="email" placeholder="Email" required>
                            </div>
                            <div class="form-group input-group">
								<span class="input-group-addon login-addon">
								<div class="glyphicon glyphicon-asterisk"></div>
								</span>
                                <input class="form-control" type="password" name="password" placeholder="Password" required>
                            </div>
                            <div class="clearfix">
                                <div class="btn-toolbar">
                                    <button type="submit" class="btn btn-primary btn-md btn-block">Login</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-sm-push-6">
                                    <a class="mr-n-lg" href="pass-reset.php">Forgot Password?</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </main>
    <footer class="page-footer">
        Clinic Drug-dispense Reporting System.
    </footer>

<!-- common libraries. required for every page-->
<script src="vendor/common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/index.js"></script>

</body>
</html>

<?php
	session_start();
	include('includes/dbcon.php');

?>


<html>
<head>
    <title>Reset Password</title>
    <link href="css/application.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>

<body class="login-page">

<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <section class="widget widget-login animated fadeInUp">
                    <header>
                        <h3>Reset Your Password</h3><br>
						<p>Fear not. We’ll email you instructions to reset your password.</p>
                    </header>
                    <div class="widget-body">
						<div class="alert alert-success">
						  Please check your email for the link for new password.
						</div>
						<div class="alert alert-danger">
						</div>
                        <form id="reset" action="ajax/password/reset.php" novalidate>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" placeholder="yourEmailHere@iacademy.edu.ph" required>
                            </div>
                            <div class="clearfix">
                                <div class="btn-toolbar">
									<button type="submit" class="btn btn-primary btn-md" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Please wait">Reset Password</button>
									<a class="mr-n-lg" href="index.php">Return to log-in</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </main>
    <footer class="page-footer">
        Clinic Dispense Reporting System.
    </footer>

<!-- common libraries. required for every page-->
<script src="vendor/common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
<script src="js/pass-reset.js"></script>

</body>
</html>

<?php
session_start();
include_once("includes/dbcon.php");

?>

<html>
<head>
    <title>New Password</title>
    <link href="css/application.css" rel="stylesheet">
	  <link href="css/main.css" rel="stylesheet">
    <link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
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
                        <h3>New Password</h3><br>
                    </header>
                    <div class="widget-body">
						<div class="alert alert-danger">
						</div>

                        <form action="ajax/password/new.php" novalidate>
							<input class="form-control hidden" name="requestID" type="text" value="<?php echo $_GET['rID'];?>">
							<input class="form-control hidden" name="userID" type="text">

                            <div class="form-group">
                                <input class="form-control" type="password" name="password2" placeholder="New Password" pattern=".{8,}"   required title="8 characters minimum">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="password" name="password1" placeholder="Confirm New Password" required>
                            </div>
                            <div class="clearfix">
                                <div class="btn-toolbar">
									<input type="submit" class="btn btn-primary btn-md btn-block" />
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
<script src="js/pass-new.js"></script>
<script>


</script>
</body>
</html>

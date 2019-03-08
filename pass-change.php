
<html>
<head>
    <title>CDRS - Login</title>
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
                        <h3>Change Your Password</h3><br>
                    </header>
                    <div class="widget-body">
                        <form>
                            <div class="form-group">
                                <input class="form-control" id="pswd1" type="password" placeholder="Old Password">
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="pswd2" type="password" placeholder="New Password">
                            </div>
							 <div class="form-group">
                                <input class="form-control" id="pswd3" type="password" placeholder="Confirm New Password">
                            </div>
                            <div class="clearfix">
                                <div class="btn-toolbar">
									<a class="btn btn-default btn-md" href="#">Cancel</a>
                                    <a class="btn btn-primary btn-md" href="#">Change Password</a>
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

</body>
</html>
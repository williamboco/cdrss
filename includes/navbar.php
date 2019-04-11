<!-- This is the navigation bar seen on the top. -->
<nav class="navbar navbar-default">
    <div class="container">
		 <!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="home.php">
			<div class="brandLogo">
				<p><b>CDRS</b><p>
			</div>
		  </a>
		</div>

        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="home.php">Home</a></li>
				<li><a href="patient-list.php">Patient Profiles</a></li>
				<li><a href="options.php">Lists</a></li>
			</ul>
            <!-- search form! link it to your search server -->
            <ul class="nav navbar-nav navbar-right">
                <li>
				<a><?php echo $_SESSION['role'];?>&nbsp;<?php echo htmlspecialchars($_SESSION['firstName'], ENT_QUOTES, 'utf-8');?></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-cog fa-lg" style="color: #fff;"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="account.php"><i class="glyphicon glyphicon-user"></i> &nbsp; My Account</a></li>
                        <li class="divider"></li>
                        <li><a href="includes/logout.php"><i class="fa fa-sign-out"></i> &nbsp; Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

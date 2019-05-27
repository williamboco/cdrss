<nav class="navbar navbar-default" role="navigation">
  <div class="container" id="navfluid">
      <div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigationbar">
         <span class="sr-only">Toggle navigation</span>
         <b><i class="glyphicon glyphicon-th" style="color:white;font-size:20px;"></i></b>
       </button>
       <a class="navbar-brand" href="home.php">
        <div class="brandLogo">
   				<p><b>CDRS</b><p>
   			</div>
       </a>
      </div>
    <div class="collapse navbar-collapse" id="navigationbar">
      <ul class="nav navbar-nav">
        <li><a href="home-admin.php">Home</a></li>
        <li><a href="logs-admin.php">Logs</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a>Welcome back!</a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="glyphicon glyphicon-cog"></i> <?php echo $_SESSION['role'];?>&nbsp;<?php echo htmlspecialchars($_SESSION['firstName'], ENT_QUOTES, 'utf-8');?>
          </a>
          <ul class="dropdown-menu">
              <li><a href="account-admin.php"><i class="glyphicon glyphicon-user"></i> &nbsp; My Account</a></li>
              <li class="divider"></li>
              <li><a href="user-list-admin.php"><i class="glyphicon glyphicon-tasks"></i> &nbsp; Manage Users</a></li>
              <li class="divider"></li>
              <li><a href="manuals/avp.pdf" download="Admin's Manual"><i class="fas fa-download"></i> &nbsp; Admin's Manual</a> </li>
              <li class="divider"></li>
              <li><a href="includes/logout.php"><i class="fas fa-sign-out-alt"></i> &nbsp; Log Out</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

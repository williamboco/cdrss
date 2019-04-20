<?php
	include('../../includes/dbcon.php');
	$id = $_GET['data'];
	$table = $_GET['table'];
	
	$result = mysqli_query($con, "SELECT * FROM ".$table." WHERE ID='$id'");
	$obj = mysqli_fetch_array($result);
	
	echo (json_encode($obj));
?>
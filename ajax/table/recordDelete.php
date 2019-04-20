<?php
	include('../../includes/dbcon.php');
	$table = $_GET['table'];
	$data = $_GET['data'];

	// use foreach:
	foreach($data as $id){
		$query = "UPDATE ".$table." SET `isDeleted` = '1' WHERE ".$table.".`ID` = '$id'";
		mysqli_query($con, $query);
	}

	echo "Record successfully deleted";
?>

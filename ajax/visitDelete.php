<?php
	include('../includes/dbcon.php');
	$data = $_GET['data'];

  // use foreach:
  foreach($data as $d){
     $query = "UPDATE `visit` SET `isDeleted` = '1' WHERE `visit`.`ID` = $d";
		mysqli_query($con, $query);
  }
  echo "Record deleted";

?>
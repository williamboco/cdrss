<?php
include('../includes/dbcon.php');
	$query = "SELECT * FROM `complaint` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$complaints = array();
	while($res = mysqli_fetch_array($result)) {
		array_push($complaints, $res['complaintName']);
	}
	echo json_encode($complaints);
?>
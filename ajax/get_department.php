<?php
include('../includes/dbcon.php');
	$query = "SELECT * FROM `department` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$departments = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			'id' => $res['ID'],
			'name' => $res['departmentName']
		);
		array_push($departments, $x);
	}
	echo json_encode($departments);
?>
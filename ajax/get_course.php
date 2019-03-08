<?php
include('../includes/dbcon.php');
	$query = "SELECT * FROM `course` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$courses = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			'id' => $res['ID'],
			'name' => $res['courseName']
		);
		array_push($courses, $x);
	}
	echo json_encode($courses);
?>
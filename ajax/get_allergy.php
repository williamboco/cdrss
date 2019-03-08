<?php
include('../includes/dbcon.php');
	$query = "SELECT * FROM `allergy` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$allergies = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			'id' => $res['ID'],
			'name' => $res['allergyName']
		);
		array_push($allergies, $x);
	}
	echo json_encode($allergies);
?>
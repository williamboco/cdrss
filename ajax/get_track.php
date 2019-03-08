<?php
include('../includes/dbcon.php');
	$query = "SELECT * FROM `track` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$tracks = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			'id' => $res['ID'],
			'name' => $res['trackName']
		);
		array_push($tracks, $x);
	}
	echo json_encode($tracks);
?>
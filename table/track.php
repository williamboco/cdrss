<?php
	include('../../includes/dbcon.php');
	$query = "SELECT * FROM `track` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$track = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			0 => '',	
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'"/>',	
			2 => '',
			3 => $res['trackName']
		);
		array_push($track, $x);
	}
	echo json_encode($track);
?>
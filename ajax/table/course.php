<?php
	include('../../includes/dbcon.php');
	$query = "SELECT * FROM `course` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);

	$courses = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			0 => '',
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'"/>',
			2 => '',
			3 => $res['courseName']
		);
		array_push($courses, $x);
	}
	echo json_encode($courses);
?>

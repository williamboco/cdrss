<?php
	include('../../includes/dbcon.php');
	$query = "SELECT * FROM `department` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$department = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			0 => '',	
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'"/>',	
			2 => '',
			3 => $res['departmentName']
		);
		array_push($department, $x);
	}
	echo json_encode($department);
?>
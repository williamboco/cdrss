<?php
include('../includes/dbcon.php');
	$query = "SELECT * FROM `medicine` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$medicine = array();
	while($res = mysqli_fetch_array($result)) {
		if($res['brandName'] == '') {
			$mName = $res['genericName'];
		}else 
			$mName = $res['brandName'];
		
		$x = (object) array(
			"n"   => $mName,
			"id"    => $res['ID']
		);
		array_push($medicine, $x);
	}
	echo json_encode($medicine);
?>

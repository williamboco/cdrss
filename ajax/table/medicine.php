<?php
	include('../../includes/dbcon.php');
	$query = "SELECT * FROM `medicine` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$medicine = array();
	while($res = mysqli_fetch_array($result)) {
		if($res['brandName'] == '') {
			$mName = $res['genericName'];
		}else 
			$mName = $res['brandName'];
		
		$x = (object) array(
			0 => $res['ID'],	
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'"/>',
			2 => '<i class="fa fa-sort-desc details-control" aria-hidden="true"></i>',
			3 => $mName
		);
		array_push($medicine, $x);
	}
	echo json_encode($medicine);
?>
<?php
	include('../../includes/dbcon.php');
	$query = "SELECT * FROM `complaint` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);
	
	$complaint = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			0 => $res['ID'],	
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'"/>',	
			2 => '<i class="fa fa-sort-desc details-control" aria-hidden="true"></i>',
			3 => $res['complaintName']
		);
		array_push($complaint, $x);
	}
	echo json_encode($complaint);
?>
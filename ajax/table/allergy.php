<?php
	include('../../includes/dbcon.php');
	$query = "SELECT * FROM `allergy` WHERE isDeleted=0";
	$result = mysqli_query($con, $query);

	$allergy = array();
	while($res = mysqli_fetch_array($result)) {
		$x = (object) array(
			0 => $res['ID'],
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'"/>',
			2 => '<button class="btn details-control"><i class="fa fa-sort-desc" aria-hidden="true"></i></button>',
			3 => $res['allergyName']
		);
		array_push($allergy, $x);
	}
	echo json_encode($allergy);
?>

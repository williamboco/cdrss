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
			3 => $mName,
			4 => $res['availableQty'], //Available Qty
			5 => '', //Status
			6 => '<select name="" required><option  value="" disabled selected>Add/Less</option><option value="0">Add</option><option value="1">Less</option></select>',
			7 => '<input type="number" name="stockQty" min="1" max="100">',
			8 => '<a type="button" class="btn btn-info">Adjust</a>',
			9 => '' //Total Qty (upon adjustment)
		);
		array_push($medicine, $x);
	}
	echo json_encode($medicine);
?>

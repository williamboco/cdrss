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

			$mStatus = $res['status'];
			switch ($mStatus){
				case 0:
					$mStatusName = "unavailable";
					$mStatusClass = "text-dark";
					break;

				case 1:
					$mStatusName = "critical";
					$mStatusClass = "text-danger";
					break;

				case 2:
					$mStatusName = "threshold";
					$mStatusClass = "text-warning";
					break;

				case 3:
					$mStatusName = "optimum";
					$mStatusClass = "text-success";
					break;

				default:
					break;
				}

		$x = (object) array(
			0 => $res['ID'],
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'" required/>',
			2 => '<button class="btn details-control"><i class="fas fa-sort-down" aria-hidden="true"></i></button>',
			3 => $mName,
			4 => '<p name="currentQty">' .$res['currentQty']. '</p>',
			5 => '<p style="font-weight:bold" id="statusLvl" class="'.$mStatusName.' '.$mStatusClass.'">'.ucfirst($mStatusName).'</p>',
			6 => '<select name="isAdd" required><option disabled selected>Add/Less</option><option value="1">Add</option><option value="0">Less</option></select>',
			7 => '<input type="number" name="updateQty" min="1" max="500" required/>',
			8 => '<button type="button" class="btn btn-info" onclick="adjustRecord()" id="adjustBtn"><i class="glyphicon glyphicon-resize-vertical"></i> Adjust</button>'
		);


		array_push($medicine, $x);
	}
	echo json_encode($medicine);

?>

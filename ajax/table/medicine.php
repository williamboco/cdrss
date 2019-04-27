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

		if($res['currentQty'] > 0){
			if ($res['currentQty'] > $res['thresholdQty']){
				$mStatus = "Optimum";
				$mStatusClass = "text-success";
			}
			else if ($res['currentQty'] > $res['criticalQty']){
				$mStatus = "Threshold";
				$mStatusClass = "text-warning";
			}
			else {
				$mStatus = "Critical";
				$mStatusClass = "text-danger";
			}
		} else {
			$mStatus = "Unavailable";
			$mStatusClass = "text-dark";
		}

		$x = (object) array(
			0 => $res['ID'],
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$res['ID'].'" required/>',
			2 => '<button class="btn details-control"><i class="fa fa-sort-desc" aria-hidden="true"></i></button>',
			3 => $mName,
			4 => $res['currentQty'],
			5 => '<p style="font-weight:bold" class="' .$mStatusClass. '">' .$mStatus. '</p>',
			6 => '<select name="isAdd" required><option disabled selected>Add/Less</option><option value="1">Add</option><option value="0">Less</option></select>',
			7 => '<input name="updateQty" maxlength="3" size="2" min="1" max="500" type="number" required/>',
			8 => '<button type="button" class="btn btn-info" onclick="adjustRecord()" id="adjustBtn"><i class="glyphicon glyphicon-resize-vertical"></i> Adjust</button>'
		);
		array_push($medicine, $x);
	}
	echo json_encode($medicine);
?>

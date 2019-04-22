<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];

	$query = "SELECT * FROM `medicine` WHERE ID='$id'";
	$result = mysqli_query($con, $query);

	$res = mysqli_fetch_array($result);
	$content = '';

	if($res['brandName'] != '') {
		$content .= '<p class="text-center text-info"><span class="lead">'.$res['brandName']." ( ".$res['genericName']." )".'</span></p>';
	}else {
		$content .= '<p class="text-center text-info"><span class="lead">'.$res['genericName'].'</span></p>';
	}

	if($res['isSupply'] != '0') {
		$content .= '<p class="text-center">Type: <span class="lead">Supply</span></p>';
		$content .= '<p class="text-center">Unit of Measure: <span class="lead">'.$res['dosageQty'].'   '.$res['dosage'].'</span></p>';
		$content .= '<p class="text-center">Threshold Quantity: <span class="lead">'.$res['thresholdQty'].'</span></p>';
	}else {
		$content .= '<p class="text-center">Type: <span class="lead">Drug</span></p>';
		$content .= '<p class="text-center">Form: <span class="lead">'.$res['type'].'</span></p>';
		$content .= '<p class="text-center">Unit of Measure: <span class="lead">'.$res['dosageQty'].'   '.$res['dosage'].'</span></p>';
		$content .= '<p class="text-center">Threshold Quantity: <span class="lead">'.$res['thresholdQty'].'</span></p>';
	}

	if($content == '') {
		$content .= '<p class="text-center lead">No Details</p>';
	}

	echo $content;
?>

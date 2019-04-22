<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$isAdd = $_GET['isAdd'];

	$query0 = "SELECT * FROM `medicine` WHERE ID='$id'";

	if($result = mysqli_query($con, $query0)){
		$row = mysqli_fetch_array($result);
		$currentQty = $row['currentQty'];
		$thresholdQty = $row['thresholdQty'];
		$criticalQty = $row['criticalQty'];
	}

	if($isAdd == 1) {
		$stmt = $con->prepare("UPDATE `medicine` SET  status=?, currentQty=?, updateQty=?, newQty=? WHERE ID=?");
		$stmt->bind_param("iiiii", $mStatus, $quantityLevel, $updateQty, $newQty, $id);

		$updateQty = htmlspecialchars($_GET['updateQty']);
		$newQty = $currentQty + $updateQty;
		$quantityLevel = $newQty;

		if ($quantityLevel > 0){
			if ($quantityLevel > $thresholdQty){
				$mStatus = 3;
			} else if ($quantityLevel > $criticalQty){
				$mStatus = 2;
			}	else {
				$mStatus = 1;
			}
		} else {
			$mStatus = 0;
		}

	}else {
		$stmt = $con->prepare("UPDATE `medicine` SET  status=?, currentQty=?, updateQty=?, newQty=? WHERE ID=?");
		$stmt->bind_param("iiiii", $mStatus, $quantityLevel, $updateQty, $newQty, $id);

		$updateQty = htmlspecialchars($_GET['updateQty']);
		if ($updateQty <= $currentQty){
			$newQty = $currentQty - $updateQty;
			$quantityLevel = $newQty;
		} else{
			echo "Error: Cannot proceed with adjustment";
			die();
		}

		if ($quantityLevel > 0){
			if ($quantityLevel > $thresholdQty){
				$mStatus = 3;
			} else if ($quantityLevel > $criticalQty){
				$mStatus = 2;
			}	else {
				$mStatus = 1;
			}
		} else {
			$mStatus = 0;
		}
	}

	if ($result = mysqli_query($con, $query0)) {
		$row = mysqli_fetch_array($result);
		$rowId = $row['ID'];
		if (mysqli_num_rows($result)>0 && $rowId != $id) {
			echo "Error: Unable to adjust record";
		} else {
			$stmt->execute();
			echo "Record successfully adjusted";
		}
	}else {
		echo "Error:" . mysqli_error($con);
	}

$stmt->close();
?>

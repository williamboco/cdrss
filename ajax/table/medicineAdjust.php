<?php
	include('../../includes/dbcon.php');

	session_start();
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
		$stmt = $con->prepare("UPDATE `medicine` SET  status=?, currentQty=?, updateQty=? WHERE ID=?");
		$stmt->bind_param("iiii", $mStatus, $newQty, $updateQty, $id);

		$updateQty = htmlspecialchars($_GET['updateQty']);
		if ($updateQty >= 1 && $updateQty <= 500) {
			$newQty = $currentQty + $updateQty;
		} else {
			echo "Error: Quantity must be between 1 and 500";
			die();
		}

		if ($newQty > 0){
			if ($newQty > $thresholdQty){
				$mStatus = 3;
			} else if ($newQty > $criticalQty){
				$mStatus = 2;
			}	else {
				$mStatus = 1;
			}
		}

	}else {
		$stmt = $con->prepare("UPDATE `medicine` SET  status=?, currentQty=?, updateQty=? WHERE ID=?");
		$stmt->bind_param("iiiii", $mStatus, $newQty, $updateQty, $id);

		$updateQty = htmlspecialchars($_GET['updateQty']);
		if ($updateQty <= $currentQty){
			$newQty = $currentQty - $updateQty;
		} else{
			echo "Error: Cannot proceed with adjustment \r\n";
			die();
		}

		if ($newQty > 0){
			if ($newQty > $thresholdQty){
				$mStatus = 3;
			} else if ($newQty > $criticalQty){
				$mStatus = 2;
			}	else {
				$mStatus = 1;
			}
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

	$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
	$stmt->bind_param("isi", $eventID, $eventName, $userID);

	$eventID = NULL;
	$userID = $_SESSION['userID'];
	$eventName = "Stock adjusted";
	$stmt->execute();

	$stmt->close();
?>

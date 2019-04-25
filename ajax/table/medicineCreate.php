<?php
	include('../../includes/dbcon.php');

	session_start();
	$isSupply = $_GET['isSupply'];

	if($isSupply == '0') {

		$stmt = $con->prepare("INSERT INTO `medicine` (ID, brandName, genericName, type, status, isSupply, isDeleted, dosage, dosageQty, currentQty, thresholdQty, criticalQty) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("isssiiisiiii", $isNull, $brandName, $genericName, $medicineType, $mStatus, $isSupply, $isDeleted, $dosage, $dosageQty, $currentQty, $thresholdQty, $criticalQty);

		$isNull = NULL;
		$brandName = htmlspecialchars($_GET['brandName']);
		$genericName = htmlspecialchars($_GET['genericName']);
		$medicineType = $_GET['medicineType'];
		$isDeleted = 0;
		$dosage = $_GET['medicineDosage'];
		$dosageQty = htmlspecialchars($_GET['medicineDosageQty']);
		$currentQty = htmlspecialchars($_GET['medicineCurrentQty']);
		$thresholdQty = htmlspecialchars($_GET['medicineThresholdQty']);
		$criticalQty = htmlspecialchars($_GET['medicineCriticalQty']);

			if ($currentQty > 0){
				if ($currentQty > $thresholdQty){
					$mStatus = 3;
				} else if ($currentQty > $criticalQty){
					$mStatus = 2;
				}	else {
					$mStatus = 1;
				}
			} else {
				$mStatus = 0;
			}

		$query0 = "SELECT * FROM `medicine` WHERE brandName='$brandName' AND genericName='$genericName'";

	}else {

		$stmt = $con->prepare("INSERT INTO `medicine` (ID, brandName, genericName, type, status, isSupply, isDeleted, dosage, dosageQty, currentQty, thresholdQty, criticalQty) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("isssiiisiiii", $isNull, $brandName, $genericName, $supplyType, $mStatus, $isSupply, $isDeleted, $dosage, $dosageQty, $currentQty, $thresholdQty, $criticalQty);

		$isNull = NULL;
		$brandName = '';
		$genericName = htmlspecialchars($_GET['supplyName']);
		$supplyType = '';
		$isDeleted = 0;
		$dosage = $_GET['supplyDosage'];
		$dosageQty = htmlspecialchars($_GET['supplyDosageQty']);
		$currentQty = htmlspecialchars($_GET['supplyCurrentQty']);
		$thresholdQty = htmlspecialchars($_GET['supplyThresholdQty']);
		$criticalQty = htmlspecialchars($_GET['supplyCriticalQty']);

			if ($currentQty > 0){
				if ($currentQty > $thresholdQty){
					$mStatus = 3;
				} else if ($currentQty > $criticalQty){
					$mStatus = 2;
				}	else {
					$mStatus = 1;
				}
			} else {
				$mStatus = 0;
			}

		$query0 = "SELECT * FROM `medicine` WHERE genericName='$genericName'";
	}



	if ($result = mysqli_query($con, $query0)) {
		if (mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isBrandName = $row['brandName'];

			if ($isBrandName == $brandName) {
				$stmt = $con->htmlspecialchars(prepare("UPDATE `medicine` SET currentQty=?, newQty=? WHERE ID=?"));
				$stmt->bind_param("iii", $quantityLevel, $newQty, $id);

				$newQty = $row['currentQty'] + $currentQty;
				$quantityLevel = $newQty;
				$id = $row['ID'];

				$stmt->execute();
				$unaltered_string = "There is already an existing record! \r\n Quantity has been added to it.";
				echo nl2br($unaltered_string);
			}
		} else {
			$stmt->execute();

			if(mysqli_query($con, $query0)) {
				echo "Record successfully added";
			}else {
				echo "Error: Record was not added";
			}
		}
	} else {
		echo "Error: Query failed";
	}

	$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
	$stmt->bind_param("isi", $eventID, $eventName, $userID);
	$eventID = NULL;
	$userID = $_SESSION['userID'];
	$eventName = "Created Medicine";
	$stmt->execute();

	$stmt->close();
?>

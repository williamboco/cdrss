<?php
	include('../../includes/dbcon.php');

	session_start();
	$id = $_GET['id'];
	$isSupply = $_GET['isSupply'];

	if ($isSupply == '0') {
		$brandName = htmlspecialchars($_GET['brandName']);
		$genericName = htmlspecialchars($_GET['genericName']);
	} else {
		$brandName = '';
		$genericName = htmlspecialchars($_GET['supplyName']);
	}

	if (!ctype_alpha(str_replace(' ', '', $brandName)) || !ctype_alpha(str_replace(' ', '', $genericName))) {
		echo "Error: Input must only contain letters.";
	} else {
		if($isSupply == '0') {

			$stmt = $con->prepare("UPDATE `medicine` SET brandName=?, genericName=?, type=?, dosage=?, dosageQty=?, isSupply=?, thresholdQty=?, criticalQty=? WHERE ID=?");
			$stmt->bind_param("ssssiiiii", $brandName, $genericName, $medicineType, $dosage, $dosageQty, $isSupply, $thresholdQty, $criticalQty, $id);

			$medicineType = $_GET['medicineType'];
			$dosage = $_GET['medicineDosage'];
			$dosageQty = htmlspecialchars($_GET['medicineDosageQty']);
			$isSupply = $_GET['isSupply'];
			$thresholdQty = htmlspecialchars($_GET['medicineThresholdQty']);
			$criticalQty = htmlspecialchars($_GET['medicineCriticalQty']);

			$query0 = "SELECT * FROM `medicine` WHERE brandName='$brandName' AND genericName='$genericName'";

		}else {

			$stmt = $con->prepare("UPDATE `medicine` SET genericName=?, dosage=?, dosageQty=?, isSupply=?, thresholdQty=?, criticalQty=? WHERE ID=?");
			$stmt->bind_param("ssiiiii", $genericName, $dosage, $dosageQty, $isSupply, $thresholdQty, $criticalQty, $id);

			$dosage = $_GET['supplyDosage'];
			$dosageQty = htmlspecialchars($_GET['supplyDosageQty']);
			$isSupply = $_GET['isSupply'];
			$thresholdQty = htmlspecialchars($_GET['supplyThresholdQty']);
			$criticalQty = htmlspecialchars($_GET['supplyCriticalQty']);

			$query0 = "SELECT * FROM `medicine` WHERE genericName='$genericName'";
		}

		if ($thresholdQty < $criticalQty){
			echo "Error: Threshold Quantity is less than Critical Quantity. Please enter valid input";
			die();
		}

		if ($result = mysqli_query($con, $query0)) {
			$row = mysqli_fetch_array($result);
			$rowId = $row['ID'];
			$currentQty = $row['currentQty'];

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

				$query1 = $con->prepare("UPDATE `medicine` SET status=? WHERE ID=?");
				$query1->bind_param("ii", $mStatus, $rowId);

			if(mysqli_num_rows($result) > 0 && $rowId != $id) {
				echo "Error: There is already an exisiting record.";
			} else {
					$stmt->execute();
					$query1->execute();
					echo "Record successfully updated";

					$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
					$stmt->bind_param("isi", $eventID, $eventName, $userID);
					$eventID = NULL;
					$userID = $_SESSION['userID'];
					$eventName = "Updated medicine.";
					$stmt->execute();
			}
		}else {
			echo "Error:" . mysqli_error($con);
		}



		$stmt->close();
	}


?>

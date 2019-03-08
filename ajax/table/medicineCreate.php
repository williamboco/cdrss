<?php
	include('../../includes/dbcon.php');
	$medicineType = $_GET['medicineType'];
	$thresholdQty = $_GET['thresholdQty'];

	if($medicineType == '0') {
		$brandName = $_GET['brandName'];
		$genericName = $_GET['genericName'];
		$medicineForm = $_GET['medicineForm'];

		$query = "INSERT INTO `medicine` (`ID`, `genericName`, `brandName`, `type`, isSupply, `isDeleted`, `thresholdQty`) VALUES (NULL, '$genericName', '$brandName', '$medicineForm', '$medicineType', '0', '$thresholdQty')";

		$query0 = "SELECT * FROM medicine WHERE brandName='$brandName' AND genericName='$genericName'";

	}else {
		$supplyName = $_GET['supplyName'];

		$query = "INSERT INTO `medicine` (`ID`, `genericName`, `brandName`, `type`, isSupply, `isDeleted`, `thresholdQty`) VALUES (NULL, '$supplyName', '', '', '$medicineType', '0', '$thresholdQty')";

		$query0 = "SELECT * FROM medicine WHERE genericName='$supplyName'";
	}


	if ($result=mysqli_query($con, $query0)) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];
			if($isDeleted) {
				$id = $row['ID'];
				$query = "UPDATE `medicine` SET `isDeleted` = '0' WHERE `medicine`.`ID` = '$id'";
				if(mysqli_query($con, $query)) {
					echo "success";
				}else {
					echo "Error";
				}
			}else {
				echo "Already existing record!";
			}
		} else {
			if(mysqli_query($con, $query)) {
				echo "success";
			}else {
				echo "Error";
			}
		}
	}else {
		echo "Query Failed";
	}


?>

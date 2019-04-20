<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$isSupply = $_GET['isSupply'];

	if($isSupply == '0') {

		$stmt = $con->prepare("UPDATE `medicine` SET brandName=?, genericName=?, type=?, dosage=?, dosageQty=?, isSupply=? WHERE ID=?");
		$stmt->bind_param("ssssiii", $brandName, $genericName, $medicineType, $dosage, $dosageQty, $isSupply, $id);

		$brandName = htmlspecialchars($_GET['brandName']);
		$genericName = htmlspecialchars($_GET['genericName']);
		$medicineType = $_GET['medicineType'];
		$dosage = $_GET['medicineDosage'];
		$dosageQty = htmlspecialchars($_GET['medicineDosageQty']);
		$isSupply = $_GET['isSupply'];

		$query0 = "SELECT * FROM `medicine` WHERE brandName='$brandName' AND genericName='$genericName'";

	}else {

		$stmt = $con->prepare("UPDATE `medicine` SET genericName=?, dosage=?, dosageQty=?, isSupply=? WHERE ID=?");
		$stmt->bind_param("ssiii", $supplyName, $dosage, $dosageQty, $isSupply, $id);

		$supplyName = htmlspecialchars($_GET['supplyName']);
		$dosage = $_GET['supplyDosage'];
		$dosageQty = htmlspecialchars($_GET['supplyDosageQty']);
		$isSupply = $_GET['isSupply'];

		$query0 = "SELECT * FROM `medicine` WHERE genericName='$supplyName'";
	}

	if ($result = mysqli_query($con, $query0)) {
		$row = mysqli_fetch_array($result);
		$rowId = $row['ID'];
		if(mysqli_num_rows($result) > 0 && $rowId != $id) {
			echo "Error: Unable to update record";
		} else {
				$stmt->execute();
				echo "Record successfully updated";
		}
	}else {
		echo "Error:" . mysqli_error($con);
	}

$stmt->close();
?>

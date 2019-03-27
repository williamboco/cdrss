<?php
	include('../../includes/dbcon.php');
	$inventoryType = $_GET['inventoryType'];


	if($inventoryType == '0') {

		$stmt = $con->prepare("INSERT INTO medicine (ID, genericName, brandName, type, isSupply, isDeleted, availableQty) VALUES (?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("isssiii", $isNull, $brandName, $genericName, $medicineForm, $inventoryType, $isSupply, $availableQty);

		$brandName = $_GET['brandName'];
		$genericName = $_GET['genericName'];
		$medicineForm = $_GET['medicineForm'];
		$availableQty = $_GET['medicineQty'];
		$isSupply = 0;
		$isNull = NULL;

		$query0 = "SELECT * FROM medicine WHERE brandName='$brandName' AND genericName='$genericName'";

	}else {

		$stmt = $con->prepare("INSERT INTO medicine (ID, genericName, brandName, type, isSupply, isDeleted, availableQty) VALUES (?, ?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("isssiii", $isNull, $supplyName, $brandName, $supplyType, $inventoryType, $isSupply, $availableQty);

		$supplyName = $_GET['supplyName'];
		$availableQty = $_GET['supplyQty'];
		$brandName = '';
		$supplyType = '';
		$isSupply = 0;
		$isNull = NULL;

		$query0 = "SELECT * FROM medicine WHERE genericName='$supplyName'";
	}



	if ($result = mysqli_query($con, $query0)) {
		if (mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isGenericName = $row['genericName'];
			$quantityLevel = 0;
			if ($isGenericName == $brandName || $isGenericName == $supplyName) {
				$quantityLevel = $row['availableQty'] + $availableQty;
				$id = $row['ID'];
				$stmt->prepare("UPDATE medicine SET availableQty=? WHERE ID=?");
				$stmt->bind_param("ii", $quantityLevel, $id);
				$stmt->execute();
				$unaltered_string = "There is already an existing record! \r\n Quantity has been added to it.";
				echo nl2br($unaltered_string);
			}
		} else {
			$stmt->execute();
			echo "Success!!";
		}
	} else {
		echo "Query failed!";
	}

$stmt->close();
?>

<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$inventoryType = $_GET['inventoryType'];

	if($inventoryType == '0') {


		$stmt = $con->prepare("UPDATE medicine SET genericName=?, brandName=?, type=?, isSupply=? WHERE ID=?");
		$stmt->bind_param("sssii", $genericName, $brandName, $medicineForm, $id);

		$query0 = "SELECT * FROM medicine WHERE brandName='$brandName' AND genericName='$genericName'";

		$brandName = $_GET['brandName'];
		$genericName = $_GET['genericName'];
		$medicineForm = $_GET['medicineForm'];
		$id = "SELECT ID FROM medicine";

	}else {

		$stmt = $con->prepare("UPDATE medicine SET genericName=? WHERE ID=?");
		$stmt->bind_param("si", $suppplyName, $id);

		$query0 = "SELECT * FROM medicine WHERE genericName='$supplyName'";
		$supplyName = $_GET['supplyName'];
		$id = "SELECT ID FROM medicine";
	}


	if ($result=mysqli_query($con, $query0)) {
		$row = mysqli_fetch_array($result);
		$rowId = $row['ID'];
		if(mysqli_num_rows($result) > 0 && $rowId != $id) {
			echo "dup";
		} else {
				$stmt->execute();
				echo "Success!";
		}
	}else {
		echo "Query Failed";
	}
?>

<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$medicineType = $_GET['medicineType'];

	if($medicineType == '0') {
		$brandName = $_GET['brandName'];
		$genericName = $_GET['genericName'];
		$medicineForm = $_GET['medicineForm'];
		
		$query = "UPDATE `medicine` SET `genericName` = '$genericName', `brandName` = '$brandName', `type` = '$medicineForm', isSupply='0' WHERE `medicine`.`ID` = '$id'";
		
		$query0 = "SELECT * FROM medicine WHERE brandName='$brandName' AND genericName='$genericName'";
		
	}else {
		$supplyName = $_GET['supplyName'];
		
		$query = "UPDATE `medicine` SET `genericName` = '$supplyName', `brandName` = '', `type` = '', isSupply='1' WHERE `medicine`.`ID` = '$id'";
		
		$query0 = "SELECT * FROM medicine WHERE genericName='$supplyName'";
	}
	
	
	if ($result=mysqli_query($con,$query0)) {
		$row = mysqli_fetch_array($result);
		$rowId = $row['ID'];
		if(mysqli_num_rows($result) > 0 && $rowId != $id) {
			echo "dup";
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
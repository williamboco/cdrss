<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$allergyName = $_GET['allergyName'];
	$description = $_GET['description'];

	
	$query = "UPDATE `allergy` SET allergyName = '$allergyName', `description` = '$description' WHERE `allergy`.`ID` = '$id'";
	if ($result=mysqli_query($con,"SELECT * FROM allergy WHERE allergyName='$allergyName'")) {
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
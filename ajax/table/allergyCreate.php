<?php
	include('../../includes/dbcon.php');
	$allergyName = $_GET['allergyName'];
	$description = $_GET['description'];

	$query = "INSERT INTO `allergy` (`ID`, `allergyName`, `description`, `isDeleted`) VALUES (NULL, '$allergyName', '$description', '0')";
	
	if ($result=mysqli_query($con,"SELECT * FROM allergy WHERE allergyName='$allergyName'")) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];
			if($isDeleted) {
				$id = $row['ID'];
				$query = "UPDATE `allergy` SET `isDeleted` = '0' WHERE `allergy`.`ID` = '$id'";
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
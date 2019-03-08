<?php
	include('../../includes/dbcon.php');
	$departmentName = $_GET['departmentName'];

	$query = "INSERT INTO `department` (`ID`, `departmentName`, `isDeleted`) VALUES (NULL, '$departmentName', '0')";

	
	if ($result=mysqli_query($con,"SELECT * FROM department WHERE departmentName='$departmentName'")) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];
			if($isDeleted) {
				$id = $row['ID'];
				$query = "UPDATE `department` SET `isDeleted` = '0' WHERE `department`.`ID` = '$id'";
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
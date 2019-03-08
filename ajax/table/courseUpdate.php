<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$courseName = $_GET['courseName'];

	
	$query = "UPDATE `course` SET courseName = '$courseName' WHERE `course`.`ID` = '$id'";
	if ($result=mysqli_query($con,"SELECT * FROM course WHERE courseName='$courseName'")) {
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
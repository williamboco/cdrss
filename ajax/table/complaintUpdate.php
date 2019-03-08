<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$complaintName = $_GET['complaintName'];
	$description = $_GET['description'];

	
	$query = "UPDATE `complaint` SET complaintName = '$complaintName', `description` = '$description' WHERE `complaint`.`ID` = '$id'";
	if ($result=mysqli_query($con,"SELECT * FROM complaint WHERE complaintName='$complaintName'")) {
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
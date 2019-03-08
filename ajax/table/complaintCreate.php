<?php
	include('../../includes/dbcon.php');
	$complaintName = $_GET['complaintName'];
	$description = $_GET['description'];

	$query = "INSERT INTO `complaint` (`ID`, `complaintName`, `description`, `isDeleted`) VALUES (NULL, '$complaintName', '$description', '0')";
	
	if ($result=mysqli_query($con,"SELECT * FROM complaint WHERE complaintName='$complaintName'")) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];
			if($isDeleted) {
				$id = $row['ID'];
				$query = "UPDATE `complaint` SET `isDeleted` = '0' WHERE `complaint`.`ID` = '$id'";
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
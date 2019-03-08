<?php
	include('../../includes/dbcon.php');
	$courseName = $_GET['courseName'];

	$query = "INSERT INTO `course` (`ID`, `courseName`, `isDeleted`) VALUES (NULL, '$courseName', '0')";

	
	if ($result=mysqli_query($con,"SELECT * FROM course WHERE courseName='$courseName'")) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];
			if($isDeleted) {
				$id = $row['ID'];
				$query = "UPDATE `course` SET `isDeleted` = '0' WHERE `course`.`ID` = '$id'";
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
<?php
	include('../../includes/dbcon.php');
	$trackName = $_GET['trackName'];

	$query = "INSERT INTO `track` (`ID`, `trackName`, `isDeleted`) VALUES (NULL, '$trackName', '0')";

	
	if ($result=mysqli_query($con,"SELECT * FROM track WHERE trackName='$trackName'")) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];
			if($isDeleted) {
				$id = $row['ID'];
				$query = "UPDATE `track` SET `isDeleted` = '0' WHERE `track`.`ID` = '$id'";
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
<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$track = $_GET['trackName'];

	
	$query = "UPDATE `track` SET trackName = '$track' WHERE `track`.`ID` = '$id'";
	if ($result=mysqli_query($con,"SELECT * FROM track WHERE trackName='$track'")) {
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
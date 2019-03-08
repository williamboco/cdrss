<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$department = $_GET['departmentName'];

	
	$query = "UPDATE `department` SET departmentName = '$department' WHERE `department`.`ID` = '$id'";
	if ($result=mysqli_query($con,"SELECT * FROM department WHERE departmentName='$department'")) {
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
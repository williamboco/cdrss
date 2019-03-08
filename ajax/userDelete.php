<?php
include('../includes/dbcon.php');
$id = $_GET['userID'];

$query = "UPDATE user SET `isActive` = '0' WHERE user.`ID` = '$id'";
$result = mysqli_query($con, "SELECT * FROM `user` WHERE ID='$id'");
$res = mysqli_fetch_array($result);

if($res['role'] == 'Admin') {
	$result = mysqli_query($con, "SELECT * FROM `user` WHERE role='Admin' AND isActive='1'");

	if(mysqli_num_rows($result) > 1) {
		if(mysqli_query($con, $query)) {
			echo "success";
		}else
			echo "Query failed";
	}else
		echo "Cannot delete account";
	
}else {
	
	if(mysqli_query($con, $query)) {
		echo "success";
	}else
		echo "Query failed";
}



?>
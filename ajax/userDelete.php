<?php
include('../includes/dbcon.php');
$id = $_GET['userID'];

$statusType = $_GET['statusType'];

$result = mysqli_query($con, "SELECT * FROM `user` WHERE ID='$id'");
$res = mysqli_fetch_array($result);

if($statusType == 1)
		$query = "UPDATE user SET `isActive` = '1' WHERE user.`ID` = '$id'";
else
		$query = "UPDATE user SET `isActive` = '0' WHERE user.`ID` = '$id'";

if($res['role'] == 'Admin') {
	$result = mysqli_query($con, "SELECT * FROM `user` WHERE role='Admin' AND isActive='1'");

	if(mysqli_num_rows($result) > 1) {
		if(mysqli_query($con, $query)) {
			echo 'Success.';
		}else
			echo "Query failed";
	}else
		echo "Cannot delete account";

}else {

	if(mysqli_query($con, $query)) {
		echo "<h4><b>Status updated successfully.</b></h4>";
	}else
		echo "Query failed";
}



?>

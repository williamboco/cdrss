<?php
session_start();
include('../../includes/dbcon.php');
include('../../includes/password.php');

$requestID = $_POST['requestID'];
$password = $_POST['password1'];
$userID = $_POST['userID'];

//generate hash from input password
$hashedPassword= passwordEncrypt($password);

mysqli_query($con, "UPDATE `user` SET `password` = '$hashedPassword' WHERE `user`.`ID` = '$userID'");

if(mysqli_affected_rows($con) > 0) {

	//update the request as used
	mysqli_query($con, "UPDATE `password_change_request` SET `isUsed` = '1' WHERE `password_change_request`.`requestID` = '$requestID'");

	if(mysqli_affected_rows($con) > 0) {
		//get user info
		$query = mysqli_query($con, "SELECT user.firstName, user.role FROM user WHERE ID='$userID'");
		$user = mysqli_fetch_array($query);

		$_SESSION['userID']=$userID;
		$_SESSION['firstName']=$user['firstName'];
		$_SESSION['role']=$user['role'];

		$message = "success";
	}else {
		$message = "Error";
	}


}else {
	$message = "Password change failed";
}

echo $message;
?>

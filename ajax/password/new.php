<?php
session_start();
include('../../includes/dbcon.php');
// include('../../includes/password.php');

$method = 'aes-256-cbc';
$password1 = '3sc3RLrpd17';
$key = substr(hash('sha256', $password1, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$requestID = $_POST['requestID'];
$password = htmlspecialchars($_POST['password1']);
$userID = $_POST['userID'];

if (strlen($password) < 8) {
	$message = "Error: 8 characters is the mininum for password. Please try again.";
} else {

	//generate hash from input password
	$hashedPassword = base64_encode(openssl_encrypt($password, $method, $key, OPENSSL_RAW_DATA, $iv));

	mysqli_query($con, "UPDATE `user` SET `password` = '$hashedPassword' WHERE `user`.`ID` = '$userID'");

	if(mysqli_affected_rows($con) > 0) {

		//update the request as used
		mysqli_query($con, "UPDATE `password_change_request` SET `isUsed` = '1' WHERE `password_change_request`.`requestID` = '$requestID'");

		if(mysqli_affected_rows($con) > 0) {
			//get user info
			$query = mysqli_query($con, "SELECT user.firstName, user.role FROM user WHERE ID='$userID'");
			$user = mysqli_fetch_array($query);

			$user['role'] = openssl_decrypt(base64_decode($user['role']), $method, $key, OPENSSL_RAW_DATA, $iv);
			$user['firstName'] = openssl_decrypt(base64_decode($user['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);

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

}



echo $message;
?>

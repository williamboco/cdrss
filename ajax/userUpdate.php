<?php
session_start();
include('../includes/dbcon.php');

$method = 'aes-256-cbc';
$password1 = '3sc3RLrpd17';
$key = substr(hash('sha256', $password1, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$id = htmlspecialchars($_POST['idNumber']);
$firstName = htmlspecialchars($_POST['firstname']);
$firstName = base64_encode(openssl_encrypt($firstName, $method, $key, OPENSSL_RAW_DATA, $iv));
$lastName = htmlspecialchars($_POST['lastname']);
$lastName = base64_encode(openssl_encrypt($lastName, $method, $key, OPENSSL_RAW_DATA, $iv));
$email = htmlspecialchars($_POST['email']);
$email = base64_encode(openssl_encrypt($email, $method, $key, OPENSSL_RAW_DATA, $iv));
$employed = htmlspecialchars($_POST['dateEmployed']);
$gender = htmlspecialchars($_POST['gender']);
$contact = htmlspecialchars($_POST['contact']);
$userID = htmlspecialchars($_POST['userID']);


if ($result=mysqli_query($con,"SELECT ID FROM user WHERE ID=$id")) {
	if(mysqli_num_rows($result) > 0 && $userID != $id) {
		$message = "User with that ID number already exists.";
	} else {
		$query = "UPDATE `user` SET `ID` = '$id', `email` = '$email', `dateEmployed` = '$employed', `firstName` = '$firstName', `lastName` = '$lastName', `gender` = '$gender', `contact` = '$contact' WHERE `user`.`ID` = '$userID'";
		mysqli_query($con,$query);

		if(mysqli_affected_rows($con) > 0) {
			$_SESSION['userID'] = $id;
			$message = "success";
		}else {
			$message = "Not updated.";
		}

	}
}else {
	$message = "Query Failed.";
}
echo $message;
?>

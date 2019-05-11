<?php
session_start();
include('../includes/dbcon.php');

$method = 'aes-256-cbc';
$password1 = '3sc3RLrpd17';
$key = substr(hash('sha256', $password1, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$id = htmlspecialchars($_POST['idNumber']);
$firstName = htmlspecialchars($_POST['firstname']);
$lastName = htmlspecialchars($_POST['lastname']);
$email = htmlspecialchars($_POST['email']);
$email = base64_encode(openssl_encrypt($email, $method, $key, OPENSSL_RAW_DATA, $iv));
$employed = htmlspecialchars($_POST['dateEmployed']);
$gender = htmlspecialchars($_POST['gender']);
$contact = htmlspecialchars($_POST['contact']);
$userID = htmlspecialchars($_POST['userID']);


if (!ctype_alpha($firstName) || !ctype_alpha($lastName)) {
	echo "Error: Input must only contain letters.";
} else if ($result=mysqli_query($con,"SELECT ID FROM user WHERE ID=$id")) {
	if(mysqli_num_rows($result) > 0 && $userID != $id) {
		echo "User with that ID number already exists.";
	} else {
			if (ctype_space($firstName) || ctype_space($lastName)) {
				$message = "Whitespaces are not not allowed. Please enter a valid input";
			} else {
				$firstName = base64_encode(openssl_encrypt($firstName, $method, $key, OPENSSL_RAW_DATA, $iv));
				$lastName = base64_encode(openssl_encrypt($lastName, $method, $key, OPENSSL_RAW_DATA, $iv));
				$stmt = $con->prepare("UPDATE `user` SET `ID` = ?, `email` = ?, `dateEmployed` = ?, `firstName` = ?, `lastName` = ?, `gender` = ?, `contact` = ? WHERE `user`.`ID` = ?");
				$stmt->bind_param("ssssssis", $id, $email, $employed, $firstName, $lastName, $gender, $contact, $userID);
				$stmt->execute();

				if(mysqli_affected_rows($con) > 0) {
				 $message = "Profile is successfully updated.";
				}else {
				 $message = "Profile is not updated.";
				}

			 	$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
			 	$stmt->bind_param("isi", $eventID, $eventName, $userID);
			 	$eventID = NULL;
			 	$userID = $_SESSION['userID'];
			 	$eventName = "Updated user profile.";
			 	$stmt->execute();
			}
	}
}else {

		$message = "Query Failed.";
}
echo $message;
?>

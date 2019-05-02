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
		echo "User with that ID number already exists.";
	} else {
		$query = $con->prepare("UPDATE `user` SET `ID` = ?, `email` = ?, `dateEmployed` = ?, `firstName` = ?, `lastName` = ?, `gender` = ?, `contact` = ? WHERE `user`.`ID` = ?");
		$query->bind_param("ssssssis", $id, $email, $employed, $firstName, $lastName, $gender, $contact, $userID);
		$query->execute();

		$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
		 $stmt->bind_param("isi", $eventID, $eventName, $userID);
		 $eventID = NULL;
		 $userID = $_SESSION['userID'];
		 $eventName = "Updated user profile.";
		 $stmt->execute();

		if(mysqli_affected_rows($con) > 0) {
			$message = "Profile is successfully updated.";
			$_SESSION['userID'] = $id;
		}else {
				$message = "Profile is not updated.";
		}

	}
}else {

		$message = "Query Failed.";
}
echo $message;
?>

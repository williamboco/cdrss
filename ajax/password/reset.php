<?php
session_start();
require '../../PHPMailer/vendor/autoload.php';
include('../../includes/dbcon.php');
include('../../includes/password.php');

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$query = $con->prepare("SELECT * FROM user WHERE isActive=?");
$query->bind_param("i", $isActive);
$email = htmlspecialchars($_POST['email']);
$isActive = 1;
$query->execute();
$result = $query->get_result();
$rownum = mysqli_num_rows($result);

//how to get the ipv4 php

if($rownum > 0) {
	while ($row = $result->fetch_assoc()) {
		if ($row['isActive'] == $isActive) {
			$row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);
			if ($row['email'] == $email) {

				$query1 = $con->prepare("INSERT INTO password_change_request (ID, requestID, userID, requestDate, isUsed) VALUES (?,?,?,NOW(),?)");
				$query1->bind_param("isii", $isNull, $requestID, $userID, $isUsed);
				$userID = $row['ID'];
				$requestID = randomPassword();
				$isNull = NULL;
				$isUsed = 0;

				$query1->execute();
				// email message
				$title = "link";
				$link = $_SERVER['SERVER_NAME']."/cdrs/pass-new.php?rID=".$requestID;;
				$msg = "We got a request to change your iAcademy CDRS Account password. \nPlease click this <a href='".$link."'>".$title."</a> to create new password.";

				// To send HTML mail, the Content-type header must be set
				$headers  = 'MIME-Version: 1.0' . "\r\n";
				$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

				// use wordwrap() if lines are longer than 70 characters
				$msg = wordwrap($msg,70);

				// send email
				require '../../includes/mail.php';
			 }
			}
		}
	} else {
		echo  "Password Query change failed!";
	}
?>

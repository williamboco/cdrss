<?php
require '../PHPMailer/PHPMailerAutoload.php';
include('../includes/dbcon.php');
include('../includes/password.php');

$id = $_POST['idNumber'];
$role = $_POST['role'];
$firstName = $_POST['firstname'];
$lastName = $_POST['lastname'];
$email = $_POST['email'];
$employed = $_POST['dateEmployed'];
$gender = $_POST['gender'];
$contact = $_POST['contact'];
$userID = $_POST['avpID'];

$query = "INSERT INTO `user` (`ID`, `email`, `password`, `datePassChanged`, `role`, `dateEmployed`, `isActive`, `firstName`, `lastName`, `gender`, `contact`) VALUES ('$id', '$email', 'temp', '', '$role', '$employed', '1', '$firstName', '$lastName', '$gender', '$contact')";


if ($result=mysqli_query($con,"SELECT ID FROM user WHERE ID=$id")) {
	if(mysqli_num_rows($result) > 0) {
		$message = "User with that ID number already exists.";
	} else {
		if(mysqli_query($con, $query)) {
			//generate new random characters
			$requestID = randomPassword();
			
			$query = "INSERT INTO `password_change_request` (`ID`, `requestID`, `userID`, `requestDate`, `isUsed`) VALUES (NULL, '$requestID', '$id', NOW(), '0')";
			if(mysqli_query($con, $query)) {
				// email message
				$title = "link";
				$link = $_SERVER['SERVER_NAME']."/cdrs/pass-new.php?rID=".$requestID;
				$msg = "New iAcademy CDRS Account password. \nPlease click this <a href='".$link."'>".$title."</a> to create new password.";

				// To send HTML mail, the Content-type header must be set
				$headers  = 'MIME-Version: 1.0' . "\r\n";
				$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

				// use wordwrap() if lines are longer than 70 characters
				$msg = wordwrap($msg,70);

				// send email
				require '../includes/mail.php';
				
			}else {
				$message = "Password change request query failed";
			}
			
			
		}else {
			$message = "Query failed";
		}
		
	}
}else {
	$message = "Query Failed.";
}


echo $message;

?>
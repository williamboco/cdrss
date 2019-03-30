<?php
session_start();
require '../../PHPMailer/vendor/autoload.php';
include('../../includes/dbcon.php');
include('../../includes/password.php');

$email = mysqli_real_escape_string($con, $_POST['email']);
$query = mysqli_query($con, "SELECT * FROM user WHERE  email='$email' AND isActive='1'");
$result= mysqli_fetch_array($query);

if(mysqli_num_rows($query) > 0) {
	$userID = $result['ID'];

	//generate new random characters
	$requestID = randomPassword();

	$query = "INSERT INTO `password_change_request` (`ID`, `requestID`, `userID`, `requestDate`, `isUsed`) VALUES (NULL, '$requestID', '$userID', NOW(), '0')";
	if(mysqli_query($con, $query)) {
		// email message
		$title = "link";
		$link = $_SERVER['SERVER_NAME'].":89"."/cdrss/pass-new.php?rID=".$requestID;
		$msg = "We got a request to change your iAcademy CDRS Account password. \nPlease click this <a href='".$link."'>".$title."</a> to create new password.";

		// To send HTML mail, the Content-type header must be set
		$headers  = 'MIME-Version: 1.0' . "\r\n";
		$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

		// use wordwrap() if lines are longer than 70 characters
		$msg = wordwrap($msg,70);

		// send email
		require '../../includes/mail.php';

	}else {
		$message = "Password change request query failed";
	}

}else {
	$message = "That email does not exist!";
}

echo $message;
?>

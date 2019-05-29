<?php
session_start();
require '../../PHPMailer/vendor/autoload.php';
include('../../includes/dbcon.php');
include('../../includes/password.php');

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$query = $con->prepare("SELECT * FROM `user`");
$query->execute();
$result = $query->get_result();
$email = htmlspecialchars($_POST['email']);


if($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()) {
			$message = "That email does not exist in the database. Please enter a valid CDRS account";

			$row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);

			if ($row['email'] == $email) {
				$message = "Kindly check your email for the link to reset your password.";

				$query2 = $con->prepare("INSERT INTO password_change_request (ID, requestID, userID, requestDate, isUsed) VALUES (?,?,?,NOW(),?)");
				$query2->bind_param("issi", $isNull, $requestID, $userID, $isUsed);
				$isNull = NULL;
				$requestID = randomPassword();
				$userID = htmlspecialchars($row['ID']);
				$isUsed = 0;

					if ($query2->execute()){
						// email message
						$title = "link";
						$link = "http://".$_SERVER['SERVER_NAME'].":".$_SERVER['SERVER_PORT']."/cdrs/pass-new.php?rID=".$requestID;
						$msg = "We have received your request to change your iACADEMY CDRS Account password. \nPlease click this <a href='".$link."'>".$title."</a> to create new password.";

						// To send HTML mail, the Content-type header must be set
						$headers  = 'MIME-Version: 1.0' . "\r\n";
						$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

						// use wordwrap() if lines are longer than 70 characters
						$msg = wordwrap($msg,70);

						// send email
						require '../../includes/mail.php';
					}

				 $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
				 $stmt->bind_param("isi", $eventID, $eventName, $userID);
				 $eventID = NULL;
				 $userID = htmlspecialchars($row['ID']);
				 $eventName = "Successfully reset a password";
				 $stmt->execute();

				 break;
		 }
	}
}

echo $message;
?>

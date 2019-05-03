<?php
require_once __DIR__ . '../../PHPMailer/vendor/autoload.php';
include('../includes/dbcon.php');
include('../includes/password.php');
session_start();


$allowed = [
	'iacademy.edu.ph'
];
$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';

// Must be exact 32 chars (256 bit)
// You must store this secret random key in a safe place of your system.
$key = substr(hash('sha256', $password, true), 0, 32);

// Most secure key
//$key = openssl_random_pseudo_bytes(openssl_cipher_iv_length($method));

// IV must be exact 16 chars (128 bit)
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

// Most secure iv
// Never ever use iv=0 in real life. Better use this iv:
// $ivlen = openssl_cipher_iv_length($method);
// $iv = openssl_random_pseudo_bytes($ivlen);

// av3DYGLkwBsErphcyYp+imUW4QKs19hUnFyyYcXwURU=
//$encrypted = base64_encode(openssl_encrypt($plaintext, $method, $key, OPENSSL_RAW_DATA, $iv));

// My secret message 1234
//$decrypted = openssl_decrypt(base64_decode($encrypted), $method, $key, OPENSSL_RAW_DATA, $iv);



$stmt = $con->prepare("INSERT INTO user (ID, email, password, datePassChanged, role, dateEmployed, isActive, firstName, lastName, gender, contact, dateCreated, dateModified, createdBy, modifiedBy) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW(), ?, ?)");
$stmt->bind_param("isssssisssiss", $id, $email, $password, $datePassChanged, $role, $employed, $isActive, $firstName, $lastName, $gender, $contact, $createdBy, $modifiedBy);

$id = htmlspecialchars($_POST['idNumber']);
$role = htmlspecialchars($_POST['role']);
$role = base64_encode(openssl_encrypt($role, $method, $key, OPENSSL_RAW_DATA, $iv));
$firstName = htmlspecialchars($_POST['firstname']);
$firstName = base64_encode(openssl_encrypt($firstName, $method, $key, OPENSSL_RAW_DATA, $iv));
$lastName = htmlspecialchars($_POST['lastname']);
$lastName = base64_encode(openssl_encrypt($lastName, $method, $key, OPENSSL_RAW_DATA, $iv));
$email = htmlspecialchars($_POST['email']);
$email = isset($email) ? trim($email) : null;
$createdBy = htmlspecialchars($_SESSION['firstName']);
$createdBy = base64_encode(openssl_encrypt($createdBy, $method, $key, OPENSSL_RAW_DATA, $iv));
$modifiedBy =  htmlspecialchars($_SESSION['firstName']);
$modifiedBy = base64_encode(openssl_encrypt($modifiedBy, $method, $key, OPENSSL_RAW_DATA, $iv));

$employed = htmlspecialchars($_POST['dateEmployed']);
$gender = htmlspecialchars($_POST['gender']);
$contact = htmlspecialchars($_POST['contact']);
$datePassChanged = "";
$isActive = 1;
$password = base64_encode(openssl_encrypt("iacademyCDRS", $method, $key, OPENSSL_RAW_DATA, $iv));

$query1 = $con->prepare("SELECT * FROM `user` WHERE ID=?");
$query1->bind_param("i", $id);
$query1->execute();
$result = $query1->get_result();
$rownum = mysqli_num_rows($result);

if ($rownum > 0) {

	while ($row = $result->fetch_assoc()) {
		$row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);

		if ($row['ID'] == $id) {
			echo "User ID already exists!";
		}

		if ($row['email'] == $email) {
			echo "Email Address already exists!";
		}
	}
 } else {

	   if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
			 $parts = explode('@', $email);
			 $domain = array_pop($parts);

			 if (! in_array($domain, $allowed)) {
				 echo "Please use your iACADEMY email.";
			 } else {
				 $email = base64_encode(openssl_encrypt($email, $method, $key, OPENSSL_RAW_DATA, $iv));

				 $stmt->execute();

				 $query2 = $con->prepare("INSERT INTO `password_change_request` (ID, requestID, userID, requestDate, isUsed) VALUES (?,?,?,NOW(),?)");
				 $query2->bind_param("isii", $isNull, $requestID, $id, $isUsed);
				 $isNull = NULL;
				 $requestID = randomPassword();
				 $id = htmlspecialchars($_POST['idNumber']);
				 $isUsed = 0;

				 $query2->execute();

				 $email = openssl_decrypt(base64_decode($email), $method, $key, OPENSSL_RAW_DATA, $iv);

				 // email message
				 $title = "link";
				 $link = $_SERVER['SERVER_NAME']."/cdrs/pass-new.php?rID=".$requestID;
				 $msg = "New iAcademy CDRS Account password. \nPlease click this <a href='".$link."'>".$title."</a> to create new password.";

				 // To send HTML mail, the Content-type header must be set
				 $headers  = 'MIME-Version: 1.0' . "\r\n";
				 $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

				 // use wordwrap() if lines are longer than 70 characters
				 $msg = wordwrap($msg,70);

				 $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
				 $stmt->bind_param("isi", $eventID, $eventName, $userID);
				 $eventID = NULL;
				 $userID = $_SESSION['userID'];
				 $eventName = "Created a new user.";
				 $stmt->execute();

				 // send email
				 require_once __DIR__ . '../../includes/mail.php';

			 }
		 }


	 }



?>

<?php
session_start();
include('../includes/dbcon.php');
include('../includes/password.php');
//include('../includes/audits.php');
//
 //$obj = new AuditClass();



$method = 'aes-256-cbc';
$password1 = '3sc3RLrpd17';
$key = substr(hash('sha256', $password1, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$userName = htmlspecialchars($_POST['email']);
$password = htmlspecialchars($_POST['password']);

$query = $con->prepare("SELECT * FROM user WHERE isActive=?");
$query->bind_param("i", $isActive);
$isActive = 1;
$query->execute();
$result = $query->get_result();
$rownum = mysqli_num_rows($result);

$message = array();
if($rownum > 0) {
	while($row = $result->fetch_assoc()) {
		$row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);
		$row['password'] = openssl_decrypt(base64_decode($row['password']), $method, $key, OPENSSL_RAW_DATA, $iv);
		if ($row['email'] == $userName && $row['password'] == $password) {
			$row['firstName'] = openssl_decrypt(base64_decode($row['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
			$row['role'] = openssl_decrypt(base64_decode($row['role']), $method, $key, OPENSSL_RAW_DATA, $iv);
			$_SESSION['userID']=$row['ID'];
			$_SESSION['firstName']=$row['firstName'];
			$_SESSION['role']=$row['role'];

			array_push($message, 'success');
			array_push($message, $row['role']);

      $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
       $stmt->bind_param("isi", $eventID, $eventName, $userID);
       $eventID = NULL;
       $userID = $_SESSION['userID'];
       $eventName = "Login";
       $stmt->execute();

      //call the event method thru an object of AuditClass
      //$obj->logEvent("login");
		}
	}
	array_push($message, "Invalid username and password combination");


} else {
	array_push($message, "Query Failed!");
}

echo (json_encode($message));
?>

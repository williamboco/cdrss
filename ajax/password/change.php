<?php
include('../../includes/dbcon.php');
include('../../includes/password.php');

session_start();

$method = 'aes-256-cbc';
$password1 = '3sc3RLrpd17';
$key = substr(hash('sha256', $password1, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$password = htmlspecialchars($_POST['oldPass']);
$newPass = htmlspecialchars($_POST['password1']);

//db query
$query = $con->prepare("SELECT * FROM user WHERE ID=?");
$query->bind_param("i", $userID);

$userID = $_POST['userID'];

$query->execute();
$result = $query->get_result();
$rownum = mysqli_num_rows($result);


if($rownum > 0) {

	while ($row = $result->fetch_assoc()) {
		$row['password'] = openssl_decrypt(base64_decode($row['password']), $method, $key, OPENSSL_RAW_DATA, $iv);

		if ($row['password'] == $password) {
			//generate hash from input password
		//	echo "Password updated";
			$hashedPassword = base64_encode(openssl_encrypt($newPass, $method, $key, OPENSSL_RAW_DATA, $iv));
			mysqli_query($con, "UPDATE `user` SET `password` = '$hashedPassword', `datePassChanged` = NOW() WHERE `user`.`ID` = '$userID'");

			$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
			 $stmt->bind_param("isi", $eventID, $eventName, $userID);
			 $eventID = NULL;
			 $userID = $_SESSION['userID'];
			 $eventName = "Changed password.";
			 $stmt->execute();

			if(mysqli_affected_rows($con) > 0) {
				$message = "success";
			}else {
				$message = "Not updated";
			}

		}

	}

	 $message = "Not Updated!";



}else {

	$message = "Please enter your valid password";

}

echo $message;
?>

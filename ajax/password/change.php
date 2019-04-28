<?php
include('../../includes/dbcon.php');

$method = 'aes-256-cbc';
$password1 = '3sc3RLrpd17';
$key = substr(hash('sha256', $password1, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$password = htmlspecialchars($_POST['oldPass']);
$newPass = htmlspecialchars($_POST['password1']);
$userID = $_POST['userID'];


//db query
$query = mysqli_query($con, "SELECT * FROM user WHERE ID='$userID'");
$row = mysqli_fetch_array($query);



if(mysqli_num_rows($query) > 0) {

		$row['password'] = openssl_decrypt(base64_decode($row['password']), $method, $key, OPENSSL_RAW_DATA, $iv);

		if ($row['password'] == $password) {
			//generate hash from input password
			$hashedPassword = base64_encode(openssl_encrypt($newPass, $method, $key, OPENSSL_RAW_DATA, $iv));
			mysqli_query($con, "UPDATE `user` SET `password` = '$hashedPassword', `datePassChanged` = NOW() WHERE `user`.`ID` = '$userID'");

			if(mysqli_affected_rows($con) > 0) {
				$message "success";
			}else {
				$message = "Not updated";
			}

	}

	$message = "Not Updated!";

}else {

	$message = "Please enter your valid password";

}

echo $message;
?>

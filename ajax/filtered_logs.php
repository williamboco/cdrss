<?php
include('../includes/dbcon.php');

$query = "SELECT * FROM `logs` JOIN `user` ON user.ID = logs.userID";

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$result = mysqli_query($con, $query);
$users = array();
while($row = mysqli_fetch_array($result)) {
	/*if($row['isActive'] == 1) {
		$status = "Active";
	} else {
		$status = "Inactive";
 	}*/

	$row['firstName'] = openssl_decrypt(base64_decode($row['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
	$row['lastName'] = openssl_decrypt(base64_decode($row['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);
	$row['role'] = openssl_decrypt(base64_decode($row['role']), $method, $key, OPENSSL_RAW_DATA, $iv);

	$x = (object) array(
		0 => $row['eventID'],
		1 => $row['eventDate'],
		2 => $row['eventName'],
		3 => $row['firstName'].' '.$row['lastName'],
		4 => $row['role']
	);
	array_push($users, $x);
}

$data = array(
  "data" => $users
  );
echo json_encode($data);

?>

<?php
include('../includes/dbcon.php');

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$stmt = $con->prepare("SELECT * FROM user");
$stmt->execute();
$result = $stmt->get_result();

$users = array();

while($row = $result->fetch_assoc()) {
	$row['firstName'] = openssl_decrypt(base64_decode($row['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
	$row['lastName'] = openssl_decrypt(base64_decode(  $row['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);
	$row['role'] = openssl_decrypt(base64_decode($row['role']), $method, $key, OPENSSL_RAW_DATA, $iv);
	$row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);


	if($row['isActive'] == 1) {
		$status = "Active";
	} else {
		$status = "Inactive";
 	}

	$x = (object) array(
		0 => '',
		1 => $row['ID'],
		2 => $row['firstName'].' '.$row['lastName'],
		3 => $row['email'],
		4 => $row['role'],
		5 => $status,
		6 => '<button id="ID" class="btn btn-primary pull-right" onclick="viewUser(this.value)" value="'.$row['ID'].'"> <i class="glyphicon glyphicon-edit"></i> Update Status</button>'
	);
	array_push($users, $x);
}
$data = array(
  "data" => $users
  );
echo json_encode($data);
?>

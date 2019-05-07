<?php
session_start();
include('../includes/dbcon.php');
$patientType = $_GET['patientType'];

include('filter_patients.php');

// $method = 'aes-256-cbc';
// $password = '3sc3RLrpd17';
// $key = substr(hash('sha256', $password, true), 0, 32);
// $iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

if ($_SESSION['role'] == 'Admin'){
	$url = "profile-avp.php";
} else {
	$url = "profile.php";
}

$patients = array();
while($pat = mysqli_fetch_array($result)) {
	// $pat['firstName'] = openssl_decrypt(base64_decode($pat['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
	// $pat['lastName'] = openssl_decrypt(base64_decode($pat['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);

	$x = (object) array(
			0 => '',
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$pat['ID'].'"/>',
			2 => $pat['ID'],
			3 => $pat['firstName'],
			4 => $pat['lastName'],
			5 => "<a href=".$url."?id=".$pat['ID']."><button type='button' class='btn btn-info'><i class='glyphicon glyphicon-eye-open'></i>  Profile</button></a>"
		);
	array_push($patients, $x);

}

$data = array(
  "data" => $patients
  );
echo json_encode($data);
?>

<?php
include('../includes/dbcon.php');

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$visitID = $_GET['visitID'];

$result = mysqli_query($con, "SELECT * FROM `visit` WHERE ID='$visitID'");
$vis = mysqli_fetch_array($result);
$patientID = $vis['patientID'];

$creatorID = $vis['createdBy'];
	$query = "SELECT * FROM `user` WHERE ID='$creatorID'";
	$result = mysqli_query($con, $query);
	$creator = mysqli_fetch_array($result);

$modifierID = $vis['modifiedBy'];
	$query = "SELECT * FROM `user` WHERE ID='$modifierID'";
	$result = mysqli_query($con, $query);
	$modifier = mysqli_fetch_array($result);

$result = mysqli_query($con, "SELECT * FROM `patient` WHERE ID='$patientID'");
	$pat = mysqli_fetch_array($result);
	// $pat['firstName'] = openssl_decrypt(base64_decode($pat['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
	// $pat['lastName'] = openssl_decrypt(base64_decode($pat['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);


$complaint = array();
	$result = mysqli_query($con, "SELECT complaint.complaintName FROM `visit_complaint` JOIN `complaint` ON visit_complaint.complaintID=complaint.ID WHERE visitID='$visitID'");
	while($comp = mysqli_fetch_array($result)) {
		array_push($complaint, $comp['complaintName']);
	}

$medicine = array();
	$result = mysqli_query($con, "SELECT medicine.ID, medicine.brandName, medicine.genericName, medicine.type, visit_medicine.quantity FROM `visit_medicine` JOIN `medicine` ON visit_medicine.medicineID=medicine.ID WHERE visitID='$visitID'");
	while($med = mysqli_fetch_array($result)) {
		$qtty = $med['quantity'];
		$type = $med['type'];

		if($type == 'Capsule'  || $type == 'Tablet') {
			if($qtty > 1)
				$unit = 'pcs.';
			else
				$unit = 'pc.';
		}else {
			if($qtty > 1)
				$unit = 'uses';
			else
				$unit = 'use';
		}

		$x = (object) array(
			"id" => $med['ID'],
			"name"   => $med['brandName'] ?: $med['genericName'],
			"quantity" => $qtty,
			"unit" => $unit
		);
		array_push($medicine, $x);
	}

$creator['role'] = openssl_decrypt(base64_decode($creator['role']), $method, $key, OPENSSL_RAW_DATA, $iv);
$creator['firstName'] = openssl_decrypt(base64_decode($creator['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);

$modifier['role'] = openssl_decrypt(base64_decode($modifier['role']), $method, $key, OPENSSL_RAW_DATA, $iv);
$modifier['firstName'] = openssl_decrypt(base64_decode($modifier['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);

$data = array(
	'Visit' => $vis,
	'Patient' => $pat,
	'Complaint' => $complaint,
	'Medicine' => $medicine,
	'createdBy' => $creator['role']." ".$creator['firstName'],
	'modifiedBy' => $modifier['role']." ".$modifier['firstName']
);

echo json_encode($data);

?>

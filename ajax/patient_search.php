<?php
	include('../includes/dbcon.php');
	// $method = 'aes-256-cbc';
	// $password = '3sc3RLrpd17';
	// $key = substr(hash('sha256', $password, true), 0, 32);
	// $iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

	//$q = openssl_decrypt(base64_decode($_GET['q']), $method, $key, OPENSSL_RAW_DATA, $iv);
	$q = $_GET['q'];
	$q .= '%';


	$query = "SELECT * FROM `patient` WHERE ID LIKE '$q' OR firstName LIKE '$q' OR lastName LIKE '$q'";
	$result = mysqli_query($con, $query);


	$inf = array();
	while($p = mysqli_fetch_array($result)) {

		// $p['firstName'] = openssl_decrypt(base64_decode($p['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
		// $p['lastName'] = openssl_decrypt(base64_decode($p['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);
		// $p['contact'] = openssl_decrypt(base64_decode($p['contact']), $method, $key, OPENSSL_RAW_DATA, $iv);

		//get type
		$id = $p['ID'];
		$query = "SELECT * FROM `shs` WHERE ID='$id'";
		$shs = mysqli_query($con, $query);
		$query = "SELECT * FROM `college` WHERE ID='$id'";
		$college = mysqli_query($con, $query);
		$query = "SELECT * FROM `employee` WHERE ID='$id'";
		$employee = mysqli_query($con, $query);
		if(mysqli_num_rows($shs)>0){
			$type = "Senior High School Student";
		}elseif(mysqli_num_rows($college)>0) {
			$type = "College Student";
		}elseif(mysqli_num_rows($employee)>0) {
			$type = "Employee";
		}else {
			$type = "Guest";
		}

		//get age
		$from = new DateTime($p['birthDate']);
		$to   = new DateTime('today');
		$age = $from->diff($to)->y;

		$x = (object) array(
			'id' => $p['ID'],
			'name' => $p['firstName']." ".$p['lastName']." - ".$p['ID'],
			'description' => $type,
			'gender' => $p['gender'],
			'age' => $age,
			'contact' => $p['contact']


		);
		array_push($inf, $x);
	}


	$data = array(
		'items'=> $inf
	);

	echo (json_encode($data));
?>

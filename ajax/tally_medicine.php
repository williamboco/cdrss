<?php
include('../includes/dbcon.php');

$patientType = $_GET['patientType'];
$months = $_GET['months'];
$years = $_GET['years'];

include('switch_case.php');

$i = 0;
$uN = array();
$mData = array();
$mTotal = 0;

foreach ($months as $m) {

	// $c = array();
	//array_push($c, $m);
	$query = "SELECT medicine.brandName, medicine.genericName, visit_medicine.quantity FROM patient LEFT JOIN ".$join."=visit.patientID JOIN visit_medicine on visit.ID=visit_medicine.visitID JOIN medicine ON medicine.ID=visit_medicine.medicineID WHERE MONTH(visit.visitDate) = ".$m." AND YEAR(visit.visitDate) = ".$years[$i]." AND visit.isDeleted='0' AND patient.isDeleted='0'";
	$result = mysqli_query($con, $query);


	$med = array();
	while($row = mysqli_fetch_array($result)) {

		$n = $row['brandName'] ?: $row['genericName'];
		$q = $row['quantity'];

		$obj = (object) array(
			"n"   => $n,
			"q"   => $q
		);
		array_push($med, $obj);
		array_push($uN, $n);

	}
	$x = (object) $med;
	array_push($mData, $x);
	$i++;
}

$uN = array_unique($uN);
$aData = array();

//analyze data

foreach($mData as $month) {
	$d = array();
	foreach($uN as $n) {

		$t = 0;
		foreach($month as $item) {
			if($n == $item->n) {
				$t = $t + $item->q;
			}
			$d[$n]=$t;
		}

		//array_push($m, $d);
	}

	$x = (object) $d;
	array_push($aData, $x);
}

$tData = array();
$index = 1; //Initialize index count for displaying row data

foreach ($uN as $key => $value) {
	$t = 0;
	$row = array();

	array_push($row, $index);
	array_push($row, $value);

	foreach ($aData as $m) {

		if(array_key_exists($value, $m)) {
			$t = $t + $m->$value;
			array_push($row, $m->$value);
		}else {
			array_push($row, 0);
		}
	}

	array_push($row, $t);
	$x = (object) $row;

	array_push($tData, $x);
	$mTotal = $mTotal + $t;
	++$index;
}

$data = array(
	"data" => $tData,
	"mTotal" => $mTotal
);

echo json_encode($data);

?>

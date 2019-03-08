<?php
include('../includes/dbcon.php');
$patientType = $_GET['patientType'];
$date1 = date('Y-m-d H:i:s', strtotime($_GET['date1'] . ' -1 day'));
$date2 = date('Y-m-d H:i:s', strtotime($_GET['date2'] . ' +1 day'));

$color = ['#FF0F00', '#FF6600', '#FF9E01', '#FCD202', '#F8FF01', '#B0DE09', '#04D215', '#0D8ECF', '#0D52D1', '#2A0CD0', '#8A0CCF', '#CD0D74', '#754DEB', '#DDDDDD', '#999999', '#333333', '#000000'];

include('switch_case.php');


$query = "SELECT medicine.brandName, medicine.genericName, visit_medicine.quantity FROM patient LEFT JOIN ".$join."=visit.patientID JOIN visit_medicine on visit.ID=visit_medicine.visitID JOIN medicine ON medicine.ID=visit_medicine.medicineID WHERE visit.visitDate BETWEEN '$date1' AND '$date2' AND visit.isDeleted=0 AND patient.isDeleted='0'";

$result = mysqli_query($con, $query);

$med = array();
$mName = array();

while($row = mysqli_fetch_array($result)) {
	$n = $row['brandName'] ?: $row['genericName'];
	$q = $row['quantity'];
	
	$x = (object) array(
		"n"   => $n,
		"q"    => $q
	);
	array_push($med, $x);
	array_push($mName, $n);
	
}


$mName = array_unique($mName);
$data = array();

$i = 0;
foreach ($mName as $key => $value) {
	$total = 0;
	foreach ($med as $m) {
		
		if ($m->n == $value) {
			$total= $total + $m->q;
		}
	}
	
	$x = (object) array(
			"name" => $value,
			"quantity" => $total,
			"color" => $color[$i]
		);
		array_push($data, $x);
		$i++;
}

	

echo (json_encode($data));

?>
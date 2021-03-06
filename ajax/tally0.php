<?php
include('../includes/dbcon.php');

$patientType = $_GET['patientType'];
$months = $_GET['months'];
$years = $_GET['years'];

include('switch_case.php');

$i = 0;
$pTotal = array();
$vTotal = array();

$compTotal = array();
$mTotal = 0;

foreach($months as $m) {
	//array_push($c, $m);
	$query = "SELECT visit_complaint.visitID, complaint.complaintName, patient.ID FROM `patient` LEFT JOIN ".$join."=visit.patientID JOIN visit_complaint on visit.ID=visit_complaint.visitID JOIN complaint ON complaint.ID=visit_complaint.complaintID WHERE MONTH(visit.visitDate) = ".$m." AND YEAR(visit.visitDate) = ".$years[$i]." AND visit.isDeleted='0' AND patient.isDeleted='0'";
	$result = mysqli_query($con, $query);

	$cN = array();
	while($row = mysqli_fetch_array($result)) {
		array_push($cN, $row['complaintName']);
		array_push($pTotal, $row['ID']);
		array_push($vTotal, $row['visitID']);

	}

	$obj = array_count_values($cN);
	$x = (object) $obj;
	array_push($compTotal, $x);
	$i++;
}

$tData = array();
$index = 1;

foreach ($obj as $key => $value) {
	$t = 0;
	$row = array();

	array_push($row, $index);
	array_push($row, $key);

		foreach ($compTotal as $c) {

			if(array_key_exists($key, $c)) {
				array_push($row, $value);
			} else{
				array_push($row, 0);
			}
		}

	$t = $t + $value;
	array_push($row, $t);
	$x = (object) $row;

	array_push($tData, $x);
	//Total frequency of complaints
	$mTotal = $mTotal + $t;
	++$index;
}

$data = array(
  "data" => $tData,
  "mTotal" => $mTotal,
  "pTotal" => $pTotal,
  "vTotal" => $vTotal
);



echo json_encode($data);

?>

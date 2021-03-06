<?php
include('../includes/dbcon.php');

$patientType = $_GET['patientType'];
$months = $_GET['months'];
$years = $_GET['years'];

include('switch_case.php');

$i = 0;

$pTotal = array();
$vTotal = array();

$uN = array();
$mData = array();

$compTotal = array();
$mTotal = 0;

foreach($months as $m) {

	//array_push($c, $m);
	$query = "SELECT visit_complaint.visitID, complaint.complaintName, patient.ID FROM `patient` LEFT JOIN ".$join."=visit.patientID JOIN visit_complaint on visit.ID=visit_complaint.visitID JOIN complaint ON complaint.ID=visit_complaint.complaintID WHERE MONTH(visit.visitDate) = ".$m." AND YEAR(visit.visitDate) = ".$years[$i]." AND visit.isDeleted='0' AND patient.isDeleted='0'";
	$result = mysqli_query($con, $query);

	$cN = array();
	$comp = array();
	while($row = mysqli_fetch_array($result)) {
		array_push($cN, $row['complaintName']);
			$c = $row['complaintName'];
			$count = 1;

		array_push($pTotal, $row['ID']);
		array_push($vTotal, $row['visitID']);

		$obj = (object) array(
			"c" => $c,
			"q" => $count
		);

		array_push($comp, $obj);
		array_push($uN, $c);
	}


	$x = (object) $comp;
	array_push($mData, $x);
	$i++;

}

$uN = array_unique($uN);
$aData = array();

foreach($mData as $month){
	$d = array();
	foreach($uN as $n){

		$t = 0;
		foreach($month as $item){
			if ($n == $item->c){
				$t = $t + $item->q;
			}
			$d[$n]=$t;
		}
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
			array_push($row, $m->$value); //Number of visits of complaint name
		} else{
			array_push($row, 0);
		}
	}

	array_push($row, $t); //Tally of x complaint
	$x = (object) $row;

	array_push($tData, $x);
	$mTotal = $mTotal + $t; //Total frequency of complaints
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

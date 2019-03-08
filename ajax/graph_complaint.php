<?php
include('../includes/dbcon.php');
$patientType = $_GET['patientType'];
$date1 = date('Y-m-d H:i:s', strtotime($_GET['date1'] . ' -1 day'));
$date2 = date('Y-m-d H:i:s', strtotime($_GET['date2'] . ' +1 day'));

$color = ['#FF0F00', '#FF6600', '#FF9E01', '#FCD202', '#F8FF01', '#B0DE09', '#04D215', '#0D8ECF', '#0D52D1', '#2A0CD0', '#8A0CCF', '#CD0D74', '#754DEB', '#DDDDDD', '#999999', '#333333', '#000000'];

include('switch_case.php');


$query = "SELECT complaint.complaintName FROM patient LEFT JOIn ".$join."=visit.patientID JOIN visit_complaint on visit.ID=visit_complaint.visitID JOIN complaint ON complaint.ID=visit_complaint.complaintID WHERE visit.visitDate BETWEEN '$date1' AND '$date2' AND visit.isDeleted=0 AND patient.isDeleted='0'";
$result = mysqli_query($con, $query);

$complaint = array();
while($row = mysqli_fetch_array($result)) {
	
	array_push($complaint, $row['complaintName']);
	
}

$obj = array_count_values($complaint);
$data = array();
$i = 0;
foreach ($obj as $key => $value) {
    //echo "$key => $value\n";
	$x = (object) array(
		"name" => $key,
		"visits" => $value,
		"color" => $color[$i]
	);
	array_push($data, $x);
	$i = $i +1;
}


echo (json_encode($data));

?>
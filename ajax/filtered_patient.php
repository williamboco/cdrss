<?php
include('../includes/dbcon.php');
$patientType = $_GET['patientType'];

include('filter_patients.php');

$patients = array();
while($pat = mysqli_fetch_array($result)) {

	$x = (object) array(
			0 => '',
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)" id="ID" value="'.$pat['ID'].'"/>',
			2 => $pat['ID'],
			3 => $pat['firstName'],
			4 => $pat['lastName'],
			5 => "<a href=\"profile.php?id=".$pat['ID']."\"><button type='button' class='btn btn-info'><i class='glyphicon glyphicon-eye-open'></i>  Profile</button></a>"	
		);
	array_push($patients, $x);

}

$data = array(
  "data" => $patients
  );
echo json_encode($data);
?>

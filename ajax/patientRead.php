<?php
include('../includes/dbcon.php');

$id = $_GET['patientID'];

//Patient general information
$result = mysqli_query($con, "SELECT * FROM `patient` WHERE ID='$id'");
$pat = mysqli_fetch_array($result);


//Contact person information
$cPerson = array();
$result = mysqli_query($con, "SELECT contact_person.fullName, contact_person.contact FROM contact_person WHERE patientID='$id'");
while($p = mysqli_fetch_array($result)) {
	$x = (object) array(
		"name"   => $p['fullName'],
		"contact"    => $p['contact']
	);
	array_push($cPerson, $x);
}


//Allergy information
$allerg = array();
$query = "SELECT allergy.allergyName FROM patient_allergy
			INNER JOIN allergy ON patient_allergy.allergyID=allergy.ID 
			WHERE patientID='$id'";
$result = mysqli_query($con, $query);
while($all = mysqli_fetch_array($result)) {
	array_push($allerg, $all['allergyName']);
}

//Other information
$others = array();
$shs = mysqli_query($con, "SELECT track.trackName FROM `shs` INNER JOIN track ON shs.trackID=track.ID WHERE shs.ID='$id'");
$college = mysqli_query($con, "SELECT course.courseName FROM `college` INNER JOIN course ON college.courseID=course.ID WHERE college.ID='$id'");
$employee = mysqli_query($con, "SELECT department.departmentName, employee.type FROM `employee` INNER JOIN department ON employee.departmentID=department.ID WHERE employee.ID='$id'");

if(mysqli_num_rows($shs)>0){
	
	$res = mysqli_fetch_array($shs);
	$x = (object) array(
		"type"   => "SHS",
		"track"    => $res['trackName']
	);
	array_push($others, $x);
	
}elseif(mysqli_num_rows($college)>0) {
	
	$res = mysqli_fetch_array($college);
	$x = (object) array(
		"type"   => "College",
		"course"    => $res['courseName']
	);
	array_push($others, $x);
	
}elseif(mysqli_num_rows($employee)>0) {
	
	$res = mysqli_fetch_array($employee);
	$x = (object) array(
		"type"   => "Employee",
		"department"    => $res['departmentName'],
		"employmentType" => $res['type']
	);
	array_push($others, $x);
	
}

$data = array(
	'Patient' => $pat,
	'Allergy' => $allerg,
	'ContactPerson' =>  $cPerson,
	'Others' => $others
);
echo (json_encode($data));
?>
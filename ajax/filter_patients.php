<?php
switch($patientType) {
	case 'All':
		$query = "SELECT * FROM `patient` WHERE isDeleted = '0'";
		break;
	case 'shs':
		$query = "SELECT patient.ID, patient.firstName, patient.lastName FROM patient JOIN shs ON patient.ID=shs.ID WHERE patient.isDeleted=0";
		break;
	case 'coll':
		$query = "SELECT patient.ID, patient.firstName, patient.lastName FROM patient JOIN college ON patient.ID=college.ID WHERE patient.isDeleted=0";
		break;
	case 'stud':
		$query = "SELECT * FROM shs JOIN patient ON patient.ID=shs.ID where patient.isDeleted=0 UNION ALL SELECT * FROM college JOIN patient ON patient.ID=college.ID WHERE patient.isDeleted=0";
		break;
	case 'emp':
		$query = "SELECT patient.ID, patient.firstName, patient.lastName FROM patient JOIN employee ON patient.ID=employee.ID WHERE patient.isDeleted=0";
		break;
	default:
		//fallback
}
$result = mysqli_query($con, $query);

?>
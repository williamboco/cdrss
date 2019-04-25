<?php
include('../includes/dbcon.php');
$patientType = $_GET['patientType'];
$date1 = $_GET['date1'];
$date2 = date('Y-m-d H:i:s', strtotime($_GET['date2'] . ' +1 day'));	//http://stackoverflow.com/questions/1394791/adding-one-day-to-a-date


include('filter_patients.php');

$visits = array();
while($patient = mysqli_fetch_array($result)) {
	$patientID = $patient['ID'];
	$query = "SELECT * FROM `visit` WHERE patientID = '$patientID' AND visitDate BETWEEN '$date1' AND '$date2' AND isDeleted=0";
	$visResult = mysqli_query($con, $query);
	while($vis = mysqli_fetch_array($visResult)) {
		$visID = $vis['ID'];

			$complaint = "";
			$resComp = mysqli_query($con, "SELECT complaint.complaintName FROM visit_complaint JOIN complaint ON visit_complaint.complaintID=complaint.ID WHERE visitID=$visID");
			while($compInf = mysqli_fetch_array($resComp)) {
				$complaint .= $compInf['complaintName'].", ";
			}
			$complaint = rtrim($complaint,", ");

			$medicine = "";
			$resMed = mysqli_query($con, "SELECT medicine.brandName, medicine.genericName, visit_medicine.quantity FROM visit_medicine JOIN medicine ON visit_medicine.medicineID=medicine.ID WHERE visitID=$visID");
			while($medInf = mysqli_fetch_array($resMed)) {
				$n = $medInf['brandName'] ?: $medInf['genericName'];
				$q = $medInf['quantity'];
				$unit = "";
				if($q <= 1) {
					$unit = "pc.";
				}else
					$unit = "pcs.";
				
				$medicine .= $n." (".$q.$unit."), ";
			}
			$medicine = rtrim($medicine,", ");

			//$date = date_create($vis['visitDate']);
			//$date = date_format($date, 'd/m/y');

			$x = (object) array(
				0 => '',
				1 => $complaint,
				2 => $medicine,
				3 => $vis['visitDate'],
				4 => '<button id="ID" onclick="viewVisit(this.value)" class="btn btn-info" value="'.$visID.'"><i class="glyphicon glyphicon-eye-open"></i>  Details</button>'
			);
			array_push($visits, $x);
	}
}


$data = array(
  "data" => $visits
  );
echo json_encode($data);

?>

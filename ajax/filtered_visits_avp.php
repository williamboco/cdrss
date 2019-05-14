<?php
include('../includes/dbcon.php');
$patientType = $_GET['patientType'];
$date1 = $_GET['date1'];
$date2 = date('Y-m-d H:i:s', strtotime($_GET['date2'] . ' +1 day'));	//http://stackoverflow.com/questions/1394791/adding-one-day-to-a-date

// $method = 'aes-256-cbc';
// $password = '3sc3RLrpd17';
// $key = substr(hash('sha256', $password, true), 0, 32);
// $iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

include('filter_patients.php');

$visits = array();
while($patient = mysqli_fetch_array($result)) {
	$patientID = $patient['ID'];
	$query = "SELECT * FROM `visit` WHERE patientID = '$patientID' AND visitDate BETWEEN '$date1' AND '$date2' AND isDeleted=0";
	$visResult = mysqli_query($con, $query);

	while($vis = mysqli_fetch_array($visResult)) {
			$visID = $vis['ID'];

			$complaint = "";
			$compResult = mysqli_query($con, "SELECT complaint.complaintName FROM `visit_complaint` JOIN `complaint` ON visit_complaint.complaintID=complaint.ID WHERE visitID=$visID");

			while($compInf = mysqli_fetch_array($compResult)) {
				$complaint .= $compInf['complaintName'].", ";
			}

			$complaint = rtrim($complaint,", ");

			$medicine = "";
			$medResult = mysqli_query($con, "SELECT * FROM `visit_medicine` JOIN `medicine` ON visit_medicine.medicineID=medicine.ID WHERE visitID=$visID");
			while($medInf = mysqli_fetch_array($medResult)) {
				$q = $medInf['quantity'];
				$type = $medInf['type'];
				$q = intval($q);
				$name = $medInf['brandName'] ?: $medInf['genericName'];

				if($type == 'Capsule'  || $type == 'Tablet') {
					if($q > 1)
						$unit = 'pcs.';
					else
						$unit = 'pc.';
				}else {
					if($q > 1)
						$unit = 'uses';
					else
						$unit = 'use';
				}

				$medicine .= $name." (".$q.$unit."), ";

			}
			$medicine = rtrim($medicine,", ");

		//	$date = date_create($vis['visitDate']);
			//$date = date_format($date, 'd/m/y');

			// $patient['firstName'] = openssl_decrypt(base64_decode($patient['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
			// $patient['lastName'] = openssl_decrypt(base64_decode(  $patient['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);

			$x = (object) array(
				0 => '',
				1 => '<input type="checkbox" name="check" onclick="selectOne(this)"/>',
				2 => $patient['ID'],
				3 => $patient['firstName']." ".$patient['lastName'],
				4 => $complaint,
				5 => $medicine,
				6 => $vis['visitDate'],
				7 => '<button id="ID" onclick="viewVisit(this.value)" class="btn btn-info" value="'.$visID.'"><i class="glyphicon glyphicon-eye-open"></i>  Details</button>'
			);
			array_push($visits, $x);
	}
}


$data = array(
  "data" => $visits
  );
echo json_encode($data);

?>

<?php
include("../includes/dbcon.php");
$patID = $_GET['id'];

$query = "SELECT * FROM `visit` WHERE patientID = '$patID' AND isDeleted=0";
$result = mysqli_query($con, $query);
$resPat = mysqli_query($con, "SELECT * FROM `patient` WHERE ID='$patID'");
$patInf = mysqli_fetch_array($resPat);

$visits = array();
while($vis = mysqli_fetch_array($result)) {
	$visID = $vis['ID'];
	
	$complaint = "";
	$resComp = mysqli_query($con, "SELECT complaint.complaintName FROM visit_complaint JOIN complaint ON visit_complaint.complaintID=complaint.ID WHERE visitID=$visID");
	while($compInf = mysqli_fetch_array($resComp)) {
		$complaint .= $compInf['complaintName'].", ";
	}
	$complaint = rtrim($complaint,", ");

	$medicine = "";
			$resMed = mysqli_query($con, "SELECT * FROM visit_medicine JOIN medicine ON visit_medicine.medicineID=medicine.ID WHERE visitID=$visID");
			while($medInf = mysqli_fetch_array($resMed)) {
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
	
	$x = (object) array(
			0 => '',
			1 => '<input type="checkbox" name="check" onclick="selectOne(this)"/>',			
			2 => $vis['visitDate'],	
			3 => $complaint,
			4 => $medicine,
			5 => '<button id="ID" onclick="viewVisit(this.value)" class="btn btn-info" value="'.$visID.'"><i class="glyphicon glyphicon-eye-open"></i>  Details</button>'	
		);
	array_push($visits, $x);
}
$data = array(
  "data" => $visits
  );
echo json_encode($data);
?>


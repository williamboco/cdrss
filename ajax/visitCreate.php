<?php
include('../includes/dbcon.php');

session_start();
$user = $_POST['userID'];
$id = $_POST['idNumber'];
//http://stackoverflow.com/questions/24570744/remove-extra-spaces-but-not-space-between-two-words
$remarks = trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $_POST["remarks"])));
$comp = $_POST["complaint"];
$med = $_POST["med"];
$time = $_POST["visitDate"];

	$query0 = $con->prepare("INSERT INTO visit (ID, patientID, visitDate, remarks, isDeleted, createdBy, modifiedBy, dateCreated, dateModified) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
	$query0->bind_param("isssiss", $isNull, $id, $time, $remarks, $isDeleted, $user, $user);

	$isNull = NULL;
	$isDeleted = 0;

	if($query0->execute()) {
		$message = "success";

		//get autoIncrement ID from recent query
		$vId = mysqli_insert_id($con);

		foreach($comp as $i => $item) {
			$query1 = $con->prepare("INSERT INTO `complaint` (complaintName) SELECT * FROM (SELECT $item) AS tmp WHERE NOT EXISTS ( SELECT complaintName FROM `complaint` WHERE complaintName=$item)");
			$query1->execute();

			//get autoIncrement ID from recent query
			$cId = mysqli_insert_id($con);

			if($cId==0) {
				$query2 = "SELECT ID FROM `complaint` WHERE complaintName=$item";
				$result = mysqli_query($con, $query2);
				$row = mysqli_fetch_array($result);
				$cId = $row['ID'];
			}

			$query3 = $con->prepare("INSERT INTO visit_complaint (ID, visitID, complaintID) VALUES (?,?,?)");
			$query3->bind_param("iii", $isNull, $vId, $cId);
			if($query3->execute()) {
				// $message = "Complaint".$cId.":".$item;
			}
		}

		$len = count($med);
		for ($i=0; $i<$len; $i++) {

			//if medicine name is not blank
			if($med[$i]!='') {
				$mId = $med[$i];
				$mQty = $med[$i+1];

				$query4 = $con->prepare("INSERT INTO `visit_medicine` (ID, visitID, medicineID, quantity, complaintID) VALUES (?,?,?,?,?)");
				$query4->bind_param("iiiii", $isNull, $vId, $mId, $mQty, $cId);
				$isNull = 0;

				if($query4->execute())	{

					$query0 = "SELECT * FROM `medicine` WHERE ID='$mId'";
					if($result = mysqli_query($con, $query0)){
						$row = mysqli_fetch_array($result);
						$currentQty = $row['currentQty'];
						$thresholdQty = $row['thresholdQty'];
						$criticalQty = $row['criticalQty'];

						$stmt = $con->prepare("UPDATE `medicine` SET  status=?, currentQty=?, updateQty=? WHERE ID=?");
						$stmt->bind_param("iiii", $mStatus, $newQty, $mQty, $mId);

						if ($mQty <= $currentQty){
							$newQty = $currentQty - $mQty;
						} else{
							$message = "Error: Insufficient stock of medicine/supply \r\n";
							die();
						}

						if ($newQty > 0){
							if ($newQty > $thresholdQty)
								$mStatus = 3;
							else if ($newQty > $criticalQty)
								$mStatus = 2;
							else
								$mStatus = 1;
						}
					}
				 		$stmt->execute();

				}
			}
		}

		$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
		$stmt->bind_param("isi", $eventID, $eventName, $userID);
		$eventID = NULL;
		$userID = $_SESSION['userID'];
		$eventName = "Created patient visit";
		$stmt->execute();

	}else {
		$message = "Error: Patient visit not created";
	}

echo json_encode($message);

?>

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

<<<<<<< HEAD
	$query0 = $con->prepare("INSERT INTO visit (ID, patientID, visitDate, remarks, isDeleted, createdBy, modifiedBy, dateCreated, dateModified) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
	$query0->bind_param("isssiss", $isNull, $id, $time, $remarks, $isDeleted, $user, $user);

	$isNull = NULL;
	$isDeleted = 0;

	if($query0->execute()) {
		$message = "success";
=======
$message = array();

	$query = "INSERT INTO `visit` (ID, patientID, visitDate, remarks, isDeleted, createdBy, modifiedBy, dateCreated, dateModified) VALUES (NULL, $id, $time, $remarks, 0, $user, $user, NOW(), NOW())";

	if(mysqli_query($con, $query)) {
		array_push($message, "success");
>>>>>>> cc3862f8555afa5347310ec099ca867f976cde1f

		//get autoIncrement ID from recent query
		$vId = mysqli_insert_id($con);
		// array_push($message, "visit id: ".$vId);

		foreach($comp as $i => $item) {
<<<<<<< HEAD
			$query1 = $con->prepare("INSERT INTO `complaint` (complaintName) SELECT * FROM (SELECT $item) AS tmp WHERE NOT EXISTS ( SELECT complaintName FROM `complaint` WHERE complaintName=$item)");
			$query1->execute();
=======
			$query = "INSERT INTO `complaint` (complaintName) SELECT * FROM (SELECT $item) AS tmp WHERE NOT EXISTS ( SELECT complaintName FROM `complaint` WHERE complaintName=$item )";
			mysqli_query($con, $query);
>>>>>>> cc3862f8555afa5347310ec099ca867f976cde1f

			//get autoIncrement ID from recent query
			$cId = mysqli_insert_id($con);

			if($cId==0) {
				$query = "SELECT ID FROM `complaint` WHERE complaintName=$item";
				$result = mysqli_query($con, $query);
				$row = mysqli_fetch_array($result);
				$cId = $row['ID'];
			}

<<<<<<< HEAD
			$query3 = $con->prepare("INSERT INTO visit_complaint (ID, visitID, complaintID) VALUES (NULL, $vId, $cId)");
			$query3->bind_param("iii", $isNull, $vId, $cId);
			if($query3->execute()) {
				// $message = "Complaint".$cId.":".$item;
=======
			$query = "INSERT INTO `visit_complaint` (ID, visitID, complaintID) VALUES (NULL, $vId, $cId)";
			if(mysqli_query($con, $query)) {
				// array_push($message, "complaint".$cId.":".$item);
>>>>>>> cc3862f8555afa5347310ec099ca867f976cde1f
			}
		}

		$len = count($med);
		for ($i=0; $i<$len; $i++) {

			//if medicine name is not blank
			if($med[$i]!='') {
				$mId = $med[$i];
				$mQty = $med[$i+1];

				$query4 = $con->prepare("INSERT INTO `visit_medicine` (ID, visitID, medicineID, quantity, complaintID) VALUES (NULL, $vId, $cId, $mId, $mQty)");
				$query4->bind_param("iiiii", $isNull, $vId, $mId, $mQty, $cId);
				$isNull = 0;

				if($query4->execute())	{

					array_push($message, "medicine".$mId.":(".$mQty.")");

					$query = "SELECT * FROM `medicine` WHERE ID='$mId'";
					if($result = mysqli_query($con, $query)){
						$row = mysqli_fetch_array($result);
						$currentQty = $row['currentQty'];
						$thresholdQty = $row['thresholdQty'];
						$criticalQty = $row['criticalQty'];

						$stmt = $con->prepare("UPDATE `medicine` SET  status=?, currentQty=?, updateQty=? WHERE ID=?");
						$stmt->bind_param("iiii", $mStatus, $newQty, $mQty, $mId);

						if ($mQty <= $currentQty){
							$newQty = $currentQty - $mQty;
							$stmt->execute();
						} else{
							array_push($message, "Error: Insufficient stock of medicine/supply \r\n");
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
				++$i;
			}
			array_push($message, "remarks: ".$remarks);
		}

		$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
		$stmt->bind_param("isi", $eventID, $eventName, $userID);
		$eventID = NULL;
		$userID = $_SESSION['userID'];
		$eventName = "Created patient visit";
		$stmt->execute();

	}else {
		array_push($message, "Error: Patient profile not created");
	}

echo (json_encode($message));

?>

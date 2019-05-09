<?php
include('../includes/dbcon.php');

session_start();
$user = $_POST['userID'];
$comp = $_POST['complaint'];
$med = $_POST['med'];
$time = $_POST['visitDate'];
//http://stackoverflow.com/questions/24570744/remove-extra-spaces-but-not-space-between-two-words
$remarks = htmlspecialchars(trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $_POST['remarks']))));

//Create a guest patient profile
if ($_POST['idNumber']==''){

	$query = $con->prepare("INSERT INTO `guest` (ID) VALUES (?)");
	$query->bind_param("i", $id);
	$id = NULL;

	if ($query->execute()){
		$query = $con->prepare("INSERT INTO `patient` (ID, firstName, lastName, gender, contact, isDeleted, createdBy, modifiedBy, dateCreated, dateModified) VALUES (?,?,?,?,?,?,?,?,NOW(),NOW())");
		$query->bind_param("sssssiss", $id, $firstName, $lastName, $gender, $contact, $isDeleted, $user, $user);

		$firstName = htmlspecialchars($_POST['firstname']);
		$lastName = htmlspecialchars($_POST['lastname']);
		$gender = $_POST['gender'];
		$contact = htmlspecialchars($_POST['contact']);
		$isDeleted = 0;
		$query->execute();
	}
} else{
	$id = $_POST['idNumber'];
}

	$query = $con->prepare("INSERT INTO `visit` (ID, patientID, visitDate, remarks, isDeleted, createdBy, modifiedBy, dateCreated, dateModified) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
	$query->bind_param("isssiss", $isNull, $id, $time, $remarks, $isDeleted, $user, $user);

	$isNull = NULL;
	$isDeleted = 0;

	if($query->execute()) {
		$message = "Patient visit record successfully created";

		//get autoIncrement ID from recent query
		$vId = mysqli_insert_id($con);

		foreach($comp as $i => $item) {
			if ($item!=''){
				$query = $con->prepare("INSERT INTO `complaint` (complaintName) SELECT * FROM (SELECT '$item') AS tmp WHERE NOT EXISTS ( SELECT complaintName FROM `complaint` WHERE complaintName=?)");
				$query->bind_param("s", $item);
				$query->execute();

				//get autoIncrement ID from recent query
				$cId = mysqli_insert_id($con);

				if($cId==0) {
					$query = $con->prepare("SELECT ID FROM `complaint` WHERE complaintName=?");
					$query->bind_param("s", $item);
					$query->execute();
					$result = $query->get_result();
					$row = $result->fetch_assoc();
					$cId = $row['ID'];
				}

				$query = $con->prepare("INSERT INTO `visit_complaint` (ID, visitID, complaintID) VALUES (?,?,?)");
				$query->bind_param("iii", $isNull, $vId, $cId);

				if($query->execute()) {
					// $message = "Complaint".$cId.":".$item;
				}
			}

		}

		$len = count($med);
		for ($i=0; $i<$len; $i++) {

			//if medicine name is not blank
			if($med[$i]!='') {
				$query = $con->prepare("INSERT INTO `visit_medicine` (ID, visitID, medicineID, quantity, complaintID) VALUES (?,?,?,?,?)");
				$query->bind_param("iiiii", $isNull, $vId, $mId, $mQty, $cId);

				$mId = $med[$i];
				$mQty = $med[$i+1];

				if($query->execute())	{

					$query = $con->prepare("SELECT * FROM `medicine` WHERE ID=?");
					$query->bind_param("i", $mId);

					if($query->execute()){
						$result = $query->get_result();
						$row = $result->fetch_assoc();
						$currentQty = $row['currentQty'];
						$thresholdQty = $row['thresholdQty'];
						$criticalQty = $row['criticalQty'];

						$query = $con->prepare("UPDATE `medicine` SET status=?, currentQty=?, updateQty=? WHERE ID=?");
						$query->bind_param("iiii", $mStatus, $newQty, $mQty, $mId);

						if ($mQty <= $currentQty){
							$newQty = $currentQty - $mQty;
							if ($newQty > 0){
								if ($newQty > $thresholdQty)
								$mStatus = 3;
								else if ($newQty > $criticalQty)
								$mStatus = 2;
								else
								$mStatus = 1;
							}
							$query->execute();
						} else{
							$message = "Error: Insufficient stock of medicine/supply \r\n";
							die();
						}

					}

				}
			}

			++$i;
		}

		$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
		$stmt->bind_param("isi", $eventID, $eventName, $userID);
		$eventID = NULL;
		$userID = $_SESSION['userID'];
		$eventName = "Created patient visit";
		$stmt->execute();

	}else {
		$message = "Error: Patient visit record not created";
	}

echo $message;

?>

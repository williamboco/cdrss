<?php
include('../includes/dbcon.php');

session_start();
$user = $_POST['userID'];
$vId = $_POST['visitID'];
$comp = $_POST["complaint"];
$med = $_POST["med"];
$remarks = htmlspecialchars(trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $_POST["remarks"]))));
$isNull = NULL;

$query = $con->prepare("UPDATE `visit` SET remarks=?, modifiedBy=?, dateModified=NOW() WHERE `visit`.`ID`=?");
$query->bind_param("ssi", $remarks, $user, $vId);

if ($query->execute()){
	$message = "Patient visit record successfully updated";

	//delete records from visit_complaint & visit_medicine tables
	$query = $con->prepare("DELETE FROM `visit_complaint` WHERE visitID=?");
	$query->bind_param("i", $vId);
	$query->execute();

	$query = $con->prepare("DELETE FROM `visit_medicine` WHERE visitID=?");
	$query->bind_param("i", $vId);
	$query->execute();


	foreach($comp as $i => $item) {
		if ($item!=''){
			$query = $con->prepare("INSERT INTO `complaint` (complaintName) SELECT * FROM (SELECT '$item') AS tmp WHERE NOT EXISTS (SELECT complaintName FROM `complaint` WHERE complaintName=?)");
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
				// array_push($message, "Complaint".$cId.":".$item);
			}
		}

	}

	$len = count($med);
	for ($i=0; $i< $len; $i++) {

		//if medicine name is not blank
		if($med[$i]!='') {
			$query = $con->prepare("INSERT INTO `visit_medicine` (ID, visitID, medicineID, quantity, complaintID) VALUES (?,?,?,?,?)");
			$query->bind_param("iiiii", $isNull, $vId, $mId, $mQty, $cId);

			$mId = $med[$i];
			$mQty = $med[$i+1];

			if($query->execute())
			{
				// array_push($message, "Medicine".$mId.":(".$mQty."));
			}
		}

		++$i;
	}

	$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
	$stmt->bind_param("isi", $eventID, $eventName, $userID);
	$eventID = NULL;
	$userID = $_SESSION['userID'];
	$eventName = "Updated patient visit record.";
	$stmt->execute();

} else{
		$message = "Error: Patient visit record not created";
}

$data = array(
	'Message' => $message,
	'vId' => $vId
);

echo json_encode($data);

?>

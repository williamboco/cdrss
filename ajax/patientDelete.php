<?php
include('../includes/dbcon.php');

session_start();
$data = $_GET['data'];

// use foreach:
foreach($data as $id){
	$query =$con->prepare("UPDATE `patient` SET `isDeleted` = ? WHERE `patient`.`ID` = '$id'");
	$query->bind_param("i", $isDeleted);
	$isDeleted = 1;
	$query->execute();

	$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
	 $stmt->bind_param("isi", $eventID, $eventName, $userID);
	 $eventID = NULL;
	 $userID = $_SESSION['userID'];
	 $eventName = "Deleted patient profile.";
	 $stmt->execute();
}
echo "Record deleted" . "<meta http-equiv='refresh' content='0'>";

?>

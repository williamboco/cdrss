<?php
	include('../includes/dbcon.php');

	session_start();
	$data = $_GET['data'];

  // use foreach:
  foreach($data as $d){
     $query = "UPDATE `visit` SET `isDeleted` = '1' WHERE `visit`.`ID` = $d";
		 mysqli_query($con, $query);

	   $stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
		 $stmt->bind_param("isi", $eventID, $eventName, $userID);
		 $eventID = NULL;
		 $userID = $_SESSION['userID'];
		 $eventName = "Deleted patient visit record.";
		 $stmt->execute();
  }
  echo "Patient visit record successfully deleted.";

?>

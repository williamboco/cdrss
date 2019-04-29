<?php
	include('../../includes/dbcon.php');

	session_start();
	$table = $_GET['table'];
	$data = $_GET['data'];

	// use foreach:
	foreach($data as $id){
		$query = "UPDATE ".$table." SET `isDeleted` = '1' WHERE ".$table.".`ID` = '$id'";
		mysqli_query($con, $query);

		$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
		$stmt->bind_param("isi", $eventID, $eventName, $userID);
		$eventID = NULL;
		$userID = $_SESSION['userID'];
		$eventName = "Deleted data record.";
		$stmt->execute();
	}

	echo "Record successfully deleted";
?>

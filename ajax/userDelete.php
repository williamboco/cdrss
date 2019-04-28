<?php
include('../includes/dbcon.php');
include('../includes/password.php');
//include('../includes/audits.php');

session_start();

//$obj = new AuditClass();
$id = $_GET['userID'];
$statusType = $_GET['statusType'];

$query = "SELECT * FROM `user` WHERE ID=$id";

if($statusType == 1){
	$stmt = $con->prepare("UPDATE `user` SET isActive=? WHERE ID=?");
	$stmt->bind_param("ii", $status, $id);
	$status = 1;
}else {
	$stmt = $con->prepare("UPDATE `user` SET isActive=? WHERE ID=?");
	$stmt->bind_param("ii", $status, $id);
	$status = 0;
}


<<<<<<< HEAD
<<<<<<< HEAD
		//$obj->logEvent("Changed status");
		$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
		 $stmt->bind_param("isi", $eventID, $eventName, $userID);
		 $eventID = NULL;
		 $userID = $_SESSION['userID'];
		 $eventName = "Updated status of user.";
		 $stmt->execute();
=======
if($result = mysqli_query($con, $query)) {
	$row = mysqli_fetch_array($result);
	$isActive = $row['isActive'];
>>>>>>> 1f8366bc03c2d847f6138683a79f2fa756a384ca
=======
if($result = mysqli_query($con, $query)) {
	$row = mysqli_fetch_array($result);
	$isActive = $row['isActive'];
>>>>>>> 1f8366bc03c2d847f6138683a79f2fa756a384ca

	if ($isActive == $status){
		echo "<h4><b>Error: Status is already updated</b></h4>";
	} else{
		$stmt->execute();

		if(mysqli_query($con, $query))
		echo "<h4><b>Status successfully updated.</b></h4>";
		else
		echo "<h4><b>Error: Status was not updated.</b></h4>";
	}
}else {
	echo "Error: Query failed";
}

		//$obj->logEvent("Changed status");
		 $stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
		 $stmt->bind_param("isi", $eventID, $eventName, $userID);

		 $eventID = NULL;
		 $userID = $_SESSION['userID'];
		 $eventName = "Changed status";
		 $stmt->execute();

?>

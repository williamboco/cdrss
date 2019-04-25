<?php
include('../includes/dbcon.php');
include('../includes/password.php');
//include('../includes/audits.php');

session_start();

//$obj = new AuditClass();
$id = $_GET['userID'];

$statusType = $_GET['statusType'];

$result = mysqli_query($con, "SELECT * FROM `user` WHERE ID='$id'");
$res = mysqli_fetch_array($result);


if($statusType == 1)
		$query = "UPDATE user SET `isActive` = '1' WHERE user.`ID` = '$id'";
else
		$query = "UPDATE user SET `isActive` = '0' WHERE user.`ID` = '$id'";

		//$obj->logEvent("Changed status");
		$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
		 $stmt->bind_param("isi", $eventID, $eventName, $userID);
		 $eventID = NULL;
		 $userID = $_SESSION['userID'];
		 $eventName = "Changed status";
		 $stmt->execute();

if($res['role'] == 'Admin') {
	$result = mysqli_query($con, "SELECT * FROM `user` WHERE role='Admin' AND isActive='1'");

	if(mysqli_num_rows($result) > 0) {
		if(mysqli_query($con, $query)) {
			echo "<h4><b>Status updated successfully.</b></h4>";
		}else
			echo "Query failed";
	}

}else {

	if(mysqli_query($con, $query)) {
		echo "<h4><b>Status updated successfully.</b></h4>";
	}else
		echo "Query failed";
}



?>

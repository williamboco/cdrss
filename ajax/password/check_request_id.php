<?php
session_start();
include('../../includes/dbcon.php');

$requestID = $_GET['requestID'];
$today = date('Y-m-d');
$date = date('Y-m-d H:i:s', strtotime($today . ' -1 day'));

$query = mysqli_query($con, "SELECT * FROM password_change_request WHERE requestID='$requestID' AND requestDate > '$date' AND isUsed='0'");

if(mysqli_num_rows($query)) {
	$row = mysqli_fetch_array($query);
	$userID = $row['userID'];
	
	$message = $userID;
}else {
	$message = "error";
}


echo $message;
?>
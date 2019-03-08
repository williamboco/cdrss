<?php
session_start();
include('../includes/dbcon.php');

$id = $_POST['idNumber'];
$firstName = $_POST['firstname'];
$lastName = $_POST['lastname'];
$email = $_POST['email'];
$employed = $_POST['dateEmployed'];
$gender = $_POST['gender'];
$contact = $_POST['contact'];
$userID = $_POST['userID'];


if ($result=mysqli_query($con,"SELECT ID FROM user WHERE ID=$id")) {
	if(mysqli_num_rows($result) > 0 && $userID != $id) {
		$message = "User with that ID number already exists.";
	} else {
		$query = "UPDATE `user` SET `ID` = '$id', `email` = '$email', `dateEmployed` = '$employed', `firstName` = '$firstName', `lastName` = '$lastName', `gender` = '$gender', `contact` = '$contact' WHERE `user`.`ID` = '$userID'";
		mysqli_query($con,$query);
		
		if(mysqli_affected_rows($con) > 0) {
			$_SESSION['userID'] = $id;
			$message = "success";
		}else {
			$message = "Not updated.";
		}
		
	}
}else {
	$message = "Query Failed.";
}
echo $message;
?>
<?php
include('../../includes/dbcon.php');
include('../../includes/password.php');

$password = $_POST['oldPass'];
$newPass = $_POST['password1'];
$userID =$_POST['userID'];

//db query
$query = mysqli_query($con, "SELECT * FROM user WHERE ID='$userID'");
$row= mysqli_fetch_array($query);

if(mysqli_num_rows($query) > 0 && verify($password, $row['password'])) {

	//generate hash from input password
	$hashedPassword = generateHash($newPass);
	mysqli_query($con, "UPDATE `user` SET `password` = '$hashedPassword', `datePassChanged` = NOW() WHERE `user`.`ID` = '$userID'");

	if(mysqli_affected_rows($con) > 0) {
		$message = "Success";
	}else {
		$message = "Not updated";
	}

}else {

	$message = "Please enter your valid password";

}

echo $message;
?>

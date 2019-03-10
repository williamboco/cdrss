<?php
session_start();
include('../includes/dbcon.php');
//include('../includes/password.php');

$userName = mysqli_real_escape_string($con, $_POST['email']);
$password = mysqli_real_escape_string($con, $_POST['password']);

//db query
$query = mysqli_query($con, "SELECT * FROM user WHERE email='$userName' AND isActive='1'");
$row= mysqli_fetch_array($query);

$message = array();
if(mysqli_num_rows($query) > 0 /*&& verify($password, $row['password'])*/) {
	$_SESSION['userID']=$row['ID'];
	$_SESSION['firstName']=$row['firstName'];
	$_SESSION['role']=$row['role'];

	array_push($message, 'Success');
	array_push($message, $row['role']);

}else {
	array_push($message, "Invalid username and password combination");
}

echo (json_encode($message));
?>

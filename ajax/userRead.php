<?php
include('../includes/dbcon.php');
$userID = $_GET['userID'];

$query = "SELECT * FROM `user` WHERE ID='$userID'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);

echo json_encode($row);

?>
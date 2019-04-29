<?php
include('../includes/dbcon.php');
session_start();

$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
 $stmt->bind_param("isi", $eventID, $eventName, $userID);
 $eventID = NULL;
 $userID = $_SESSION['userID'];
 $eventName = "Successfully logged out.";
 $stmt->execute();

session_destroy();
header('location:../index.php');
?>

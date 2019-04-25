<?php
include('../includes/dbcon.php');

$userID = $_GET['userID'];

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);


$query = "SELECT * FROM `user` WHERE ID='$userID'";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);
$row['firstName'] = openssl_decrypt(base64_decode($row['firstName']), $method, $key, OPENSSL_RAW_DATA, $iv);
$row['lastName'] = openssl_decrypt(base64_decode(  $row['lastName']), $method, $key, OPENSSL_RAW_DATA, $iv);
$row['role'] = openssl_decrypt(base64_decode($row['role']), $method, $key, OPENSSL_RAW_DATA, $iv);
$row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);

echo json_encode($row);
?>

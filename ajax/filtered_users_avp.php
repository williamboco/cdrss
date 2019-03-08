<?php
include('../includes/dbcon.php');

$query = "SELECT * FROM `user` WHERE isActive=1";
$result = mysqli_query($con, $query);


$users = array();
while($row = mysqli_fetch_array($result)) {
	$x = (object) array(
		0 => '',
		1 => $row['role'],
		2 => $row['firstName'],
		3 => $row['lastName'],
		4 => $row['email'],
		5 => '<button id="ID" onclick="viewUser(this.value)" value="'.$row['ID'].'">View</button>'
	);
	array_push($users, $x);
}

$data = array(
  "data" => $users
  );
echo json_encode($data);

?>
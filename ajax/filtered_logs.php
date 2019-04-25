<?php
include('../includes/dbcon.php');

$query = "SELECT * FROM `logs` JOIN `user` ON user.ID = logs.userID";

$result = mysqli_query($con, $query);
$users = array();
while($row = mysqli_fetch_array($result)) {
	/*if($row['isActive'] == 1) {
		$status = "Active";
	} else {
		$status = "Inactive";
 	}*/

	$x = (object) array(
		0 => $row['eventID'],
		1 => $row['eventDate'],
		2 => $row['firstName'].' '.$row['lastName'],
		3 => $row['role'],
		4 => $row['eventName']
	);
	array_push($users, $x);
}

$data = array(
  "data" => $users
  );
echo json_encode($data);

?>

<?php
include('../includes/dbcon.php');

$query = "SELECT * FROM `user`";
$result = mysqli_query($con, $query);

$users = array();
while($row = mysqli_fetch_array($result)) {
	if($row['isActive'] == 1) {
		$status = "Active";
	} else {
		$status = "Inactive";
 	}

	$x = (object) array(
		0 => '',
		1 => $row['ID'],
		2 => $row['firstName'].' '.$row['lastName'],
		3 => $row['email'],
		4 => $row['role'],
		5 => $status,
		6 => '<button id="ID" class="btn btn-primary pull-right" onclick="viewUser(this.value)" value="'.$row['ID'].'"> <i class="glyphicon glyphicon-edit"></i> Update Status</button>'
	);
	array_push($users, $x);
}

$data = array(
  "data" => $users
  );
echo json_encode($data);

?>

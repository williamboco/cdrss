<?php

include('../includes/dbcon.php');

$filter = $_GET['filter'];
//echo $filter;$
$patients = array();
switch($filter){
	case 'All':
		$query = "SELECT * FROM `patient` WHERE isDeleted = '0'";
			$result = mysqli_query($con, $query);
			while($res = mysqli_fetch_array($result)) {
				$x = (object) array(
			"id"   => $res['ID'],
			"firstname" => $res['firstName'],
			"lastname" =>$res['lastName']
		);
		array_push($patients, $x);

			}
		break;
	case 'shs':
		$query = "SELECT * FROM `shs` WHERE isDeleted = '0'";
			$result = mysqli_query($con, $query);
			$senior = array();
			while($res = mysqli_fetch_array($result)) {
				array_push($senior, $res['ID']);
			};
			var i = 0;
			$senior.forEach(function(){
				$id = $senior[i];
				$query = "SELECT * FROM `patient` WHERE ID = '$id'";
			$result = mysqli_query($con, $query);
			while($res = mysqli_fetch_array($result)) {
				$x = (object) array(
			"id"   => $res['ID'],
			"firstname" => $res['firstName'],
			"lastname" =>$res['lastName']
		);
		array_push($patients, $x);
			});
}


echo (json_encode($patients));
?>

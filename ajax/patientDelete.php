<?php
include('../includes/dbcon.php');
$data = $_GET['data'];

// use foreach:
foreach($data as $id){
	$query = "UPDATE `patient` SET `isDeleted` = '1' WHERE `patient`.`ID` = '$id'";
	mysqli_query($con, $query);
}
echo "Record deleted" . "<meta http-equiv='refresh' content='0'>";

?>

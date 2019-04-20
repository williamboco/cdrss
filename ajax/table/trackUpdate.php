<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$trackName = htmlspecialchars($_GET['trackName']);

	$stmt = $con->prepare("UPDATE `track` SET trackName=? WHERE ID=?");
	$stmt->bind_param("si", $trackName, $id);

	$query0 = "SELECT * FROM `track` WHERE trackName='$trackName'";

	if ($result=mysqli_query($con, $query0)) {
		$row = mysqli_fetch_array($result);
		$rowId = $row['ID'];

		if(mysqli_num_rows($result) > 0 && $rowId != $id) {
			echo "Error: Duplicate Record";
		} else {

			$stmt->execute();
			if(mysqli_query($con, $query0)) {
				echo "Record successfully updated";
			}else {
				echo "Error: Record was not updated";
			}
		}
	}else {
		echo "Error: Query Failed";
	}

$stmt->close();
?>

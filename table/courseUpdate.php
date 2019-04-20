<?php
	include('../../includes/dbcon.php');
	$id = $_GET['id'];
	$courseName = htmlspecialchars($_GET['courseName']);

	$stmt = $con->prepare("UPDATE `course` SET courseName=? WHERE ID=?");
	$stmt->bind_param("si", $courseName, $id);

	$query0 = "SELECT * FROM `course` WHERE courseName='$courseName'";

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

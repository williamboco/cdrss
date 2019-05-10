<?php
	include('../../includes/dbcon.php');

	session_start();
	$id = $_GET['id'];
	$department = htmlspecialchars($_GET['departmentName']);

	if (ctype_space($department)) {
		echo "Whitespaces are not allowed. Please enter valid input.";
	} else {
		$stmt = $con->prepare("UPDATE `department` SET departmentName=? WHERE ID=?");
		$stmt->bind_param("si", $department, $id);

		$query0 = "SELECT * FROM `department` WHERE departmentName='$department'";

		if ($result=mysqli_query($con, $query0)) {
			$row = mysqli_fetch_array($result);
			$rowId = $row['ID'];

			if(mysqli_num_rows($result) > 0 && $rowId != $id) {
				echo "Error: Unable to update record";
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

		$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
		$stmt->bind_param("isi", $eventID, $eventName, $userID);
		$eventID = NULL;
		$userID = $_SESSION['userID'];
		$eventName = "Updated department.";
		$stmt->execute();

		$stmt->close();
	}

?>

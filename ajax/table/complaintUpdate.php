<?php
	include('../../includes/dbcon.php');

	session_start();
	$id = $_GET['id'];
	$complaintName = htmlspecialchars($_GET['complaintName']);
	$description = htmlspecialchars($_GET['description']);

	if (!ctype_alpha(str_replace(' ', '', $complaintName))) {
		echo "Error: Input must only contain letters.";
	} else {
		$stmt = $con->prepare("UPDATE `complaint` SET complaintName=?, description=? WHERE ID=?");
		$stmt->bind_param("ssi", $complaintName, $description, $id);

		$query0 = "SELECT * FROM `complaint` WHERE complaintName='$complaintName'";

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

			$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
			$stmt->bind_param("isi", $eventID, $eventName, $userID);
			$eventID = NULL;
			$userID = $_SESSION['userID'];
			$eventName = "Updated complaint";
			$stmt->execute();

		}else {
			echo "Error: Query Failed";
		}

		$stmt->close();
	}


?>

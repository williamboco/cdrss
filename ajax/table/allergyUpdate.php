<?php
	include('../../includes/dbcon.php');

	session_start();
	$id = $_GET['id'];
	$allergyName = htmlspecialchars($_GET['allergyName']);
	$description = htmlspecialchars($_GET['description']);


	if (!ctype_alpha($allergyName) || !ctype_alpha($description)) {
		echo "Error: Input must only contain letters.";
	} else {
		$stmt = $con->prepare("UPDATE `allergy` SET allergyName=?, description=? WHERE ID=?");
		$stmt->bind_param("ssi", $allergyName, $description, $id);

		$query0 = "SELECT * FROM `allergy` WHERE allergyName='$allergyName'";

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

		 $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
		 $stmt->bind_param("isi", $eventID, $eventName, $userID);
		 $eventID = NULL;
		 $userID = $_SESSION['userID'];
		 $eventName = "Updated allergy";
		 $stmt->execute();

		 $stmt->close();
	}


?>

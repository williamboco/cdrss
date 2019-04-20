<?php
	include('../../includes/dbcon.php');
	$complaintName = htmlspecialchars($_GET['complaintName']);
	$description = htmlspecialchars($_GET['description']);

	$stmt = $con->prepare("INSERT INTO `complaint` (ID, complaintName, description, isDeleted) VALUES (?, ?, ?, ?)");
	$stmt->bind_param("issi", $isNull, $complaintName, $description, $isDeleted);

	$isNull = NULL;
	$isDeleted = 0;

	$query0 = "SELECT * FROM `complaint` WHERE complaintName='$complaintName'";

	if ($result=mysqli_query($con, $query0)) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];

			if($isDeleted) {
				$stmt = $con->prepare("UPDATE `complaint` SET isDeleted=? WHERE ID=?");
				$stmt->bind_param("ii", $isDeleted, $id);

				$isDeleted = 0;
				$id = $row['ID'];
				$stmt->execute();

					if(mysqli_query($con, $query0)) {
						echo "Record successfully added";
					}else {
						echo "Error: Record was not added";
					}
			}else {
				echo "There is already an existing record!";
			}
		} else {
			$stmt->execute();

			if(mysqli_query($con, $query0)) {
				echo "Record successfully added";
			}else {
				echo "Error: Record was not added";
			}
		}
	}else {
		echo "Error: Query Failed";
	}

$stmt->close();
?>

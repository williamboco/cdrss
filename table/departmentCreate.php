<?php
	include('../../includes/dbcon.php');
	$departmentName = htmlspecialchars($_GET['departmentName']);

	$stmt = $con->prepare("INSERT INTO `department` (ID, departmentName, isDeleted) VALUES (?,?,?)");
	$stmt->bind_param("isi", $isNull, $departmentName, $isDeleted);

	$isNull = NULL;
	$isDeleted = 0;

	$query0 = "SELECT * FROM `department` WHERE departmentName='$departmentName'";


	if ($result=mysqli_query($con, $query0)) {
		if(mysqli_num_rows($result) > 0) {
			$row = mysqli_fetch_array($result);
			$isDeleted = $row['isDeleted'];

			if($isDeleted) {
				$stmt = $con->prepare("UPDATE `department` SET isDeleted=? WHERE ID=?'");
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

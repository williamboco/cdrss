<?php
	include('../../includes/dbcon.php');

	session_start();

	$allergyName = htmlspecialchars($_GET['allergyName']);
	$description = htmlspecialchars($_GET['description']);

 if (ctype_space($allergyName) || ctype_space($description)) {
	 echo "Whitespaces are not allowed. Please enter valid input";
 } else {
	 $stmt = $con->prepare("INSERT INTO `allergy` (ID, allergyName, description, isDeleted) VALUES (?, ?, ?, ?)");
 	$stmt->bind_param("issi", $isNull, $allergyName, $description, $isDeleted);

 	$isNull = NULL;
 	$isDeleted = 0;

 	$query0 = "SELECT * FROM `allergy` WHERE allergyName='$allergyName'";

 	if ($result=mysqli_query($con, $query0)) {
 		if(mysqli_num_rows($result) > 0) {
 			$row = mysqli_fetch_array($result);
 			$isDeleted = $row['isDeleted'];

 			if($isDeleted) {
 				$stmt = $con->prepare("UPDATE `allergy` SET isDeleted=? WHERE ID=?");
 				$stmt->bind_param("ii", $isDeleted, $id);

 				$isDeleted = 0;
 				$id = $row['ID'];
 				$stmt->execute();

 					if(mysqli_query($con, $query0)) {
 						echo "Record successfully added";
 					}else {
 						echo "Error: Record was not added";
 					}
 			} else {
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
 		echo "Error: Query failed";
 	}

 	 $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
 	 $stmt->bind_param("isi", $eventID, $eventName, $userID);
 	 $eventID = NULL;
 	 $userID = $_SESSION['userID'];
 	 $eventName = "Created allergy.";
 	 $stmt->execute();

 	 $stmt->close();
 }

?>

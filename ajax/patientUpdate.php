<?php
include("../includes/dbcon.php");

session_start();
$origID = $_POST['origID'];
$user = $_POST['userID'];
$id = $_POST['idNumber'];
$firstName = $_POST['firstname'];
$lastName = $_POST['lastname'];
$birthDate = $_POST['birthdate'];
$gender = $_POST['gender'];
$allergy = $_POST['allergy'];
$cPerson = $_POST['cPerson'];
$contact = $_POST['contactnumber'];


$query = "UPDATE `patient` SET `ID` = '$id', `firstName` = '$firstName', `lastName` = '$lastName', `birthDate` = '$birthDate', `gender` = '$gender', `contact` = '$contact', `modifiedBy` = '$user', `dateModified` = '2017-05-01 22:17:05' WHERE `patient`.`ID` = '$origID'";

$message = array();

if ($result=mysqli_query($con,"SELECT * FROM patient WHERE ID=$id")) {
	if(mysqli_num_rows($result) > 0 && $origID != $id) {
		array_push($message, "Patient with that ID number already exists.");
	} else {

		//execute update query
		if(mysqli_query($con, $query)) {
			array_push($message, "success");
			array_push($message, $id);

			//delete id from shs, college, employee, patient_allergy, contact_person tables
			mysqli_query($con, "DELETE FROM shs WHERE ID='$id'");
			mysqli_query($con, "DELETE FROM college WHERE ID='$id'");
			mysqli_query($con, "DELETE FROM employee WHERE ID='$id'");
			mysqli_query($con, "DELETE FROM patient_allergy WHERE patientID='$id'");
			mysqli_query($con, "DELETE FROM contact_person WHERE patientID='$id'");

			//insert into shs or college or employee tables
			if($_POST['ptype'] == 'student') {

				if($_POST['studenttype'] == 'college') {

					$courseName = $_POST['course'];
					$query = "INSERT INTO course (courseName) SELECT * FROM (SELECT '$courseName') AS tmp WHERE NOT EXISTS ( SELECT courseName FROM course WHERE courseName='$courseName' )";
					mysqli_query($con, $query);

					//get autoIncrement ID from recent query
					$ref = mysqli_insert_id($con);
					if($ref==0) {
						$query = "SELECT ID FROM `course` WHERE courseName='$courseName'";
						$result = mysqli_query($con, $query);
						$res = mysqli_fetch_array($result);
						$ref = $res['ID'];
					}

					if(mysqli_query($con, "INSERT INTO `college` (`ID`, `courseID`) VALUES ('$id', '$ref')"))
					{
					//$message .= "\nCollege table: record inserted";
					}

				}else {
					$trackName = $_POST['trackname'];
					$query = "INSERT INTO track (trackName) SELECT * FROM (SELECT '$trackName') AS tmp WHERE NOT EXISTS ( SELECT trackName FROM track WHERE trackName='$trackName' )";
					mysqli_query($con, $query);

					//get autoIncrement ID from recent query
					$ref = mysqli_insert_id($con);
					if($ref==0) {
						$query = "SELECT ID FROM `track` WHERE trackName='$trackName'";
						$result = mysqli_query($con, $query);
						$res = mysqli_fetch_array($result);
						$ref = $res['ID'];
					}

					if(mysqli_query($con, "INSERT INTO `shs` (`ID`, `trackID`) VALUES ('$id', '$ref')"))
					{
					//$message .= "\nSHS table: record inserted";
					}


				}

			}elseif($_POST['ptype'] == 'employee') {
				$departmentName = $_POST['depart'];
				$employeeType = $_POST['employeeType'];

				$query = "INSERT INTO department (departmentName) SELECT * FROM (SELECT '$departmentName') AS tmp WHERE NOT EXISTS ( SELECT departmentName FROM department WHERE departmentName='$departmentName' )";
				mysqli_query($con, $query);

				//get autoIncrement ID from recent query
				$ref = mysqli_insert_id($con);
				if($ref==0) {
					$query = "SELECT ID FROM `department` WHERE departmentName='$departmentName'";
					$result = mysqli_query($con, $query);
					$res = mysqli_fetch_array($result);
					$ref = $res['ID'];
				}

				if(mysqli_query($con, "INSERT INTO `employee` (`ID`, `departmentID`, `type`) VALUES ('$id', '$ref', '$employeeType')"))
				{
				//$message .= "\nEmployee table: record inserted";
				}

			}


			//Insert allergy
			foreach($allergy as $i => $item) {

				if($item!='') {
					$query = "INSERT INTO allergy (allergyName) SELECT * FROM (SELECT '$item') AS tmp WHERE NOT EXISTS ( SELECT allergyName FROM allergy WHERE allergyName='$item' )";
					mysqli_query($con, $query);

					//get autoIncrement ID from recent query
					$ref = mysqli_insert_id($con);
					if($ref>0) {

					}else {
						$query = "SELECT ID FROM `allergy` WHERE allergyName='$item'";
						$result = mysqli_query($con, $query);
						$res = mysqli_fetch_array($result);
						$ref = $res['ID'];
					}

					if(mysqli_query($con, "INSERT INTO `patient_allergy` (`ID`, `patientID`, `allergyID`) VALUES (NULL, '$id', '$ref')"))
					{
						//array_push($message,"Patient_allergy table: record inserted");
					}
				}

			}



			//Insert contact person
			$i=0;
			$len = count($cPerson);

			// We could have used count($arr) instead of $len. But, it will lead to multiple calls to count() function causing code run slowly.
			for ($i=0; $i< $len; $i++) {

				//if person name is not blank
				if($cPerson[$i]!='') {
					$pName = $cPerson[$i] ;
					$pContact = $cPerson[$i+1];

					$result = mysqli_query($con, "INSERT INTO `contact_person` (`ID`, `patientID`, `fullName`, `contact`) VALUES (NULL, '$id', '$pName', '$pContact')");
					if($result) {
						//$message .= "\ncontact person inserted";
					}
				}

				++$i;
			}

			$stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
			 $stmt->bind_param("isi", $eventID, $eventName, $userID);
			 $eventID = NULL;
			 $userID = $_SESSION['userID'];
			 $eventName = "Updated patient profile.";
			 $stmt->execute();

		}else {
			array_push($message, "Error");
		}
	}
}else {
	array_push($message, "Query Failed.");
}


echo (json_encode($message));
?>

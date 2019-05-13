<?php
include("../includes/dbcon.php");

session_start();

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$origID = htmlspecialchars($_POST['origID']);
$user = htmlspecialchars($_POST['userID']);
$id = htmlspecialchars($_POST['idNumber']);
$firstName = htmlspecialchars($_POST['firstname']);
// $firstName = base64_encode(openssl_encrypt($firstName, $method, $key, OPENSSL_RAW_DATA, $iv));
$lastName = htmlspecialchars( $_POST['lastname']);
// $lastName = base64_encode(openssl_encrypt($lastName, $method, $key, OPENSSL_RAW_DATA, $iv));
$birthDate = htmlspecialchars($_POST['birthdate']);
$gender = htmlspecialchars($_POST['gender']);
$allergy = $_POST['allergy'];
$cPerson = $_POST['cPerson'];
$contact = htmlspecialchars($_POST['contactnumber']);
// $contact = base64_encode(openssl_encrypt($contact, $method, $key, OPENSSL_RAW_DATA, $iv));


$query = $con->prepare("UPDATE `patient` SET ID=?, firstName=?, lastName=?, birthDate=?, gender=?, contact=?, modifiedBy=?, dateModified=NOW() WHERE `patient`.`ID`=?");
$query->bind_param("ssssssis", $id, $firstName, $lastName, $birthDate, $gender, $contact, $user, $origID);

$message = array();

if (!ctype_alpha(str_replace(' ', '', $firstName)) || !ctype_alpha(str_replace(' ', '', $lastName))) {
	$message = "Error: Input must only contain letters.";
} else {
	if ($result=mysqli_query($con,"SELECT * FROM `patient` WHERE ID='$id'")) {
		if(mysqli_num_rows($result) > 0 && $origID != $id) {
			$message = "Patient with that ID number already exists.";
		} else {

			//execute update query
			if($query->execute()) {
				array_push($message, "Patient profile record successfully updated");
				array_push($message, $id);

				//delete id from shs, college, employee, patient_allergy, contact_person tables
				mysqli_query($con, "DELETE FROM `shs` WHERE ID='$id'");
				mysqli_query($con, "DELETE FROM `college` WHERE ID='$id'");
				mysqli_query($con, "DELETE FROM `employee` WHERE ID='$id'");
				mysqli_query($con, "DELETE FROM `patient_allergy` WHERE patientID='$id'");
				mysqli_query($con, "DELETE FROM `contact_person` WHERE patientID='$id'");

				//insert into shs or college or employee tables
				if($_POST['ptype'] == 'student') {

					if($_POST['studenttype'] == 'college') {

						$courseName = $_POST['course'];
						$query = $con->prepare("INSERT INTO `course` (courseName) SELECT * FROM (SELECT '$courseName') AS tmp WHERE NOT EXISTS ( SELECT courseName FROM `course` WHERE courseName=?)");
						$query->bind_param("s", $courseName);
						$query->execute();

						//get autoIncrement ID from recent query
						$ref = mysqli_insert_id($con);
						if($ref==0) {
							$query = $con->prepare("SELECT ID FROM `course` WHERE courseName=?");
							$query->bind_param("s", $courseName);
							$query->execute();
							$result = $query->get_result();
							$res = $result->fetch_assoc();
							$ref = $res['ID'];
						}

						$query = $con->prepare("INSERT INTO `college` (ID, courseID) VALUES (?,?)");
						$query->bind_param("ii", $id, $ref);

						if($query->execute())	{
						//$message .= "\nCollege table: record inserted";
						}

					}else {
						$trackName = $_POST['trackname'];
						$query = $con->prepare("INSERT INTO `track` (trackName) SELECT * FROM (SELECT '$trackName') AS tmp WHERE NOT EXISTS ( SELECT trackName FROM track WHERE trackName=?)");
						$query->bind_param("s", $trackName);
						$query->execute();

						//get autoIncrement ID from recent query
						$ref = mysqli_insert_id($con);
						if($ref==0) {
							$query = $con->prepare("SELECT ID FROM `track` WHERE trackName=?");
							$query->bind_param("s", $trackName);
							$query->execute();
							$result = $query->get_result();
							$res = $result->fetch_assoc();
							$ref = $res['ID'];
						}

						$query = $con->prepare("INSERT INTO `shs` (ID, trackID) VALUES (?,?)");
						$query->bind_param("ii", $id, $ref);

						if($query->execute())	{
						//$message .= "\nSHS table: record inserted";
						}


					}

				}elseif($_POST['ptype'] == 'employee') {
					$departmentName = $_POST['depart'];
					$employeeType = $_POST['employeeType'];

					$query = $con->prepare("INSERT INTO `department` (departmentName) SELECT * FROM (SELECT '$departmentName') AS tmp WHERE NOT EXISTS ( SELECT departmentName FROM department WHERE departmentName=?)");
					$query->bind_param("s", $departmentName);
					$query->execute();

					//get autoIncrement ID from recent query
					$ref = mysqli_insert_id($con);
					if($ref==0) {
						$query = $con->prepare("SELECT ID FROM `department` WHERE departmentName=?");
						$query->bind_param("s", $departmentName);
						$query->execute();
						$result = $query->get_result();
						$res = $result->fetch_assoc();
						$ref = $res['ID'];
					}

					$query = $con->prepare("INSERT INTO `employee` (ID, departmentID, type) VALUES (?,?,?)");
					$query->bind_param("iii", $id, $ref, $employeeType);

					if($query->execute())	{
					//array_push($message, "\nEmployee table: record inserted");
					}

				}


				//Insert allergy
				foreach($allergy as $i => $item) {

					if($item!='') {
						$query = $con->prepare("INSERT INTO `allergy` (allergyName) SELECT * FROM (SELECT '$item') AS tmp WHERE NOT EXISTS ( SELECT allergyName FROM allergy WHERE allergyName=?)");
						$query->bind_param("s", $allergy);
						$query->execute();

						//get autoIncrement ID from recent query
						$ref = mysqli_insert_id($con);
						if($ref>0) {

						}else {
							$query = $con->prepare("SELECT ID FROM `allergy` WHERE allergyName=?");
							$query->bind_param("s", $item);
							$result = $query->get_result();
							$res = $result->fetch_assoc();
							$ref = $res['ID'];
						}

						$query = $con->prepare("INSERT INTO `patient_allergy` (ID, patientID, allergyID) VALUES (?,?,?)");
						$query->bind_param("iii", $isNull, $id, $ref);
						$isNull = NULL;

						if($query->execute())	{
							//$message .= "Patient_allergy table: record inserted";
						}
					}

				}


				if (ctype_space($cPerson)) {
					array_push($message, "Error: Whitespaces are not allowed. Please enter valid input.");
				} else {
					//Insert contact person
					$i=0;
					$len = count($cPerson);

					// We could have used count($arr) instead of $len. But, it will lead to multiple calls to count() function causing code run slowly.
					for ($i=0; $i< $len; $i++) {

						//if person name is not blank
						if($cPerson[$i]!='') {
							$pName = htmlspecialchars($cPerson[$i]);
							$pContact = htmlspecialchars($cPerson[$i+1]);

							$result = $con->prepare("INSERT INTO `contact_person` (ID, patientID, fullName, contact) VALUES (?,?,?,?)");
							$result->bind_param("iiss", $isNull, $id, $pName, $pContact);

							// $pName = htmlspecialchars($cPerson[$i]);
							// $pName = base64_encode(openssl_encrypt($pName, $method, $key, OPENSSL_RAW_DATA, $iv));
							// $pContact = htmlspecialchars( $cPerson[$i+1]);
							// $pContact = base64_encode(openssl_encrypt($pContact, $method, $key, OPENSSL_RAW_DATA, $iv));
							$isNull = NULL;

							if($result->execute()) {
								//$message .= "\ncontact person inserted";
							}
						}

						++$i;
					}
				}

				 $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
				 $stmt->bind_param("isi", $eventID, $eventName, $userID);
				 $eventID = NULL;
				 $userID = $_SESSION['userID'];
				 $eventName = "Updated patient profile.";
				 $stmt->execute();

			}else {
				$message = "Error: Unable to update patient profile record";
			}
		}
	}else {
		$message = "Error: Query failed";
	}
}



echo (json_encode($message));
?>

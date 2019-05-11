<?php
include("../includes/dbcon.php");
session_start();

// $method = 'aes-256-cbc';
// $password = '3sc3RLrpd17';
// $key = substr(hash('sha256', $password, true), 0, 32);
// $iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$query = $con->prepare("INSERT INTO `patient` (ID, firstName, lastName, birthDate, gender, contact, isDeleted, createdBy, modifiedBy, dateCreated, dateModified) VALUES (?,?,?,?,?,?,?,?,?,NOW(),NOW())");
$query->bind_param("ssssssiss", $id, $firstName, $lastName, $birthDate, $gender, $contact, $isDeleted, $user, $user);

$id = htmlspecialchars($_POST['idNumber']);
$firstName = htmlspecialchars($_POST['firstname']);
// $firstName = base64_encode(openssl_encrypt($firstName, $method, $key, OPENSSL_RAW_DATA, $iv));
$lastName = htmlspecialchars($_POST['lastname']);
// $lastName = base64_encode(openssl_encrypt($lastName, $method, $key, OPENSSL_RAW_DATA, $iv));
$birthDate = htmlspecialchars($_POST['birthdate']);
$contact = htmlspecialchars($_POST['contact']);
$gender = htmlspecialchars($_POST['gender']);
$isDeleted = 0;
$cPerson = $_POST['cPerson'];
$allergy = $_POST['allergy'];
// $contact = base64_encode(openssl_encrypt($contact, $method, $key, OPENSSL_RAW_DATA, $iv));
$user = htmlspecialchars($_SESSION['userID']);
// $user = base64_encode(openssl_encrypt($user, $method, $key, OPENSSL_RAW_DATA, $iv));

if (ctype_space($firstName) || ctype_space($lastName) || ctype_space($cPerson)) {
	$message = "Error: Whitespaces are not allowed. Please enter valid input";
} else {
	if ($result=mysqli_query($con,"SELECT * FROM patient WHERE ID='$id'")) {
		if(mysqli_num_rows($result) > 0) {
			$message = "Patient with that ID number already exists.";
		} else {
			//echo "Doesn't exist";
			if($query->execute()) {
				$message = "Patient profile successfully created\n";
				if($_POST['ptype'] == 'student') {

					if($_POST['studenttype'] == 'college') {

						$courseName = htmlspecialchars($_POST['course']);
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

						if($query->execute()) {
						//$message .= "\nCollege table: Record inserted";
						}

					}else {
						$trackName = htmlspecialchars($_POST['trackname']);
							$query = $con->prepare("INSERT INTO `track` (trackName) SELECT * FROM (SELECT '$trackName') AS tmp WHERE NOT EXISTS ( SELECT trackName FROM `track` WHERE trackName=?)");
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

						if($query->execute())
						{
							// $message .= "\nSHS table: Record inserted";
						}


					}

				}elseif($_POST['ptype'] == 'employee') {
					$departmentName = htmlspecialchars($_POST['depart']);
					$employeeType = htmlspecialchars($_POST['employeeType']);
						$query = $con->prepare("INSERT INTO `department` (departmentName) SELECT * FROM (SELECT '$departmentName') AS tmp WHERE NOT EXISTS ( SELECT departmentName FROM `department` WHERE departmentName=?)");
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
					$query->bind_param("iis", $id, $ref, $employeeType);

					if($query->execute())
					{
					//$message .= "\nEmployee table: Record inserted";
					}

				}


				//Insert allergy
				foreach($allergy as $i => $item) {

					if($item!='') {
						$query = $con->prepare("INSERT INTO `allergy` (allergyName) SELECT * FROM (SELECT '$item') AS tmp WHERE NOT EXISTS ( SELECT allergyName FROM `allergy` WHERE allergyName=?)");
						$query->bind_param("s", $item);
						$query->execute();

						//get autoIncrement ID from recent query
						$ref = mysqli_insert_id($con);
						if($ref>0) {

						}else {
							$query = $con->prepare("SELECT ID FROM `allergy` WHERE allergyName=?");
							$query->bind_param("s", $item);
							$query->execute();
							$result = $query->get_result();
							$res = $result->fetch_assoc();
							$ref = $res['ID'];
						}

						$query = $con->prepare("INSERT INTO `patient_allergy` (ID, patientID, allergyID) VALUES (?,?,?)");
						$query->bind_param("iii", $isNull, $id, $ref);
						$isNull = NULL;

						if($query->execute())
						{
							// $message .= "\nPatient_allergy table: Record inserted";
						}
					}

				}


				if (ctype_space($cPerson)) {
					$message = "Whitespaces are not allowed. Please enter valid input";
				} else {
					//Insert contact person
					$len = count($cPerson);
					// We could have used count($arr) instead of $len. But, it will lead to multiple calls to count() function causing code run slowly.
					for ($i=0; $i< $len; $i++) {

						//if person name is not blank
						if($cPerson[$i]!='') {

							$result = $con->prepare("INSERT INTO `contact_person` (ID, patientID, fullName, contact) VALUES (?,?,?,?)");
							$result->bind_param("iisi", $isNull, $id, $pName, $pContact);

							$pName = htmlspecialchars($cPerson[$i]);
							// $pName = base64_encode(openssl_encrypt($pName, $method, $key, OPENSSL_RAW_DATA, $iv));
							$pContact = htmlspecialchars( $cPerson[$i+1]);
							// $pContact = base64_encode(openssl_encrypt($pContact, $method, $key, OPENSSL_RAW_DATA, $iv));
							$isNull = NULL;

							if($result->execute()) {
								// $message .= "\nContact_person table: Record inserted";
							}
						}

						++$i;
					}
				}


			} else {
				$message = "Error: Patient profile not created";
			}
		}

		$stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
		$stmt->bind_param("isi", $eventID, $eventName, $userID);
		$eventID = NULL;
		$userID = $_SESSION['userID'];
		$eventName = "Created new patient profile.";
		$stmt->execute();

	} else {
		$message = "Error: Query Failed";
	}
}

//Message
echo $message;
?>

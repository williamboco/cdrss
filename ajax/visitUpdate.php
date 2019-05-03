<?php
include('../includes/dbcon.php');

session_start();
$vId = $_POST['visitID'];
$user = $_POST['userID'];
$remarks = trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $_POST["remarks"])));
$comp = $_POST["complaint"];
$med = $_POST["med"];

$message = array();

$query = "UPDATE `visit` SET `remarks`=$remarks, `modifiedBy`=$user, `dateModified`=NOW() WHERE `visit`.`ID`=$vId";
$result = mysqli_query($con, $query);

array_push($message, "success");
array_push($message, $vId);

//delete records from visit_complaint & visit_medicine tables
mysqli_query($con, "DELETE FROM `visit_complaint` WHERE visitID='$vId'");
mysqli_query($con, "DELETE FROM `visit_medicine` WHERE visitID='$vId'");

foreach($comp as $i => $item) {
	$query = "INSERT INTO `complaint` (complaintName) SELECT * FROM (SELECT $item) AS tmp WHERE NOT EXISTS (SELECT complaintName FROM `complaint` WHERE complaintName=$item)";
	mysqli_query($con, $query);

	//get autoIncrement ID from recent query
	$cId = mysqli_insert_id($con);

	if($cId==0) {
		$query = "SELECT ID FROM `complaint` WHERE complaintName=$item";
		$result = mysqli_query($con, $query);
		$row = mysqli_fetch_array($result);
		$cId = $row['ID'];
	}

	$query = "INSERT INTO `visit_complaint` (ID, visitID, complaintID) VALUES (NULL, $vId, $cId)";
	if(mysqli_query($con, $query)) {
		array_push($message, "complaint".$cId.":".$item);
	}

}

$len = count($med);
for ($i=0; $i< $len; $i++) {

	//if medicine name is not blank
	if($med[$i]!='') {
		$mId = $med[$i];
		$mQty = $med[$i+1];

		if(mysqli_query($con, "INSERT INTO `visit_medicine` (ID, visitID, medicineID, quantity) VALUES (NULL, $vId, $mId, $mQty)"))
		{
			array_push($message, "medicine".$mId.":(".$mQty.")");
		}
	}

	++$i;

	 $stmt = $con->prepare("INSERT INTO `logs` (eventID, eventDate, eventName, userID) VALUES (?, NOW(), ?, ?)");
	 $stmt->bind_param("isi", $eventID, $eventName, $userID);
	 $eventID = NULL;
	 $userID = $_SESSION['userID'];
	 $eventName = "Updated patient visit record.";
	 $stmt->execute();
}


echo (json_encode($message));

?>

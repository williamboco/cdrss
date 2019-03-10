<?php
include('../includes/dbcon.php');
$user = $_POST['userID'];
$id = $_POST['idNumber'];
//http://stackoverflow.com/questions/24570744/remove-extra-spaces-but-not-space-between-two-words
$remarks = trim(preg_replace('/\s\s+/', ' ', str_replace("\n", " ", $_POST["remarks"])));
$comp = $_POST["complaint"];
$med = $_POST["med"];
$time = $_POST["visitDate"];

$message = array();

	$query = "INSERT INTO `visit` (`visitID`, `patientID`, `visitDate`, `remarks`, `isDeleted`, `createdBy`, `modifiedBy`, `dateCreated`, `dateModified`) VALUES (NULL, '$id', '$time', '$remarks', '0', '$user', '$user', NOW(), NOW())";

	if(mysqli_query($con, $query)) {
		array_push($message, "success");

		//get autoIncrement ID from recent query
		$vId = mysqli_insert_id($con);
		array_push($message, "visit id: ".$vId);


		foreach($comp as $i => $item) {
			$query = "INSERT INTO complaint (complaintName) SELECT * FROM (SELECT '$item') AS tmp WHERE NOT EXISTS ( SELECT complaintName FROM complaint WHERE complaintName='$item' )";
			mysqli_query($con, $query);

			//get autoIncrement ID from recent query
			$cId = mysqli_insert_id($con);

			if($cId==0) {
				$query = "SELECT ID FROM `complaint` WHERE complaintName='$item'";
				$result = mysqli_query($con, $query);
				$row = mysqli_fetch_array($result);
				$cId = $row['ID'];
			}

			$query = "INSERT INTO `visit_complaint` (`ID`, `visitID`, `complaintID`) VALUES (NULL, '$vId', '$cId')";
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

				if(mysqli_query($con, "INSERT INTO `visit_medicine` (`ID`, `visitID`, `medicineID`, `quantity`) VALUES (NULL, '$vId', '$mId', '$mQty')"))
				{
					array_push($message, "medicine".$mId.":(".$mQty.")");
				}
			}

			++$i;
		}

		array_push($message, "remarks: ".$remarks);

	}else {
		array_push($message, "error");
	}

echo (json_encode($message));

?>

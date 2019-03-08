<?php
	//fetching data in descending order (lastest entry first)
	$query = "SELECT * FROM `visit`";
	$result = mysqli_query($con, $query);
	

	while($res = mysqli_fetch_array($result)) {
		$ref = $res['ID'];
		$id = $res['patientID'];
			
		//echo "<td style=\"display: none;\">".$res['remarks']."</td>";
		echo "<td>".$res['dateCreated']."</td>";
		
		echo "<td>";
			$result2 = mysqli_query($con, "SELECT * FROM `visit_complaint` WHERE visitID='$ref'");
			while($comp = mysqli_fetch_array($result2)) {
				echo "<small>".$comp['complaintName']."</small><br>";
			}
		echo "</td>";
		
		echo "<td>";
			$result3 = mysqli_query($con, "SELECT * FROM `visit_medicine` WHERE visitID='$ref'");
			while($med = mysqli_fetch_array($result3)) {
				echo "<small>".$med['quantity']." ".$med['medicineName']."</small><br>";
			}
		echo "</td>";
		
		
		echo "</tr>";
		
	}
?>   
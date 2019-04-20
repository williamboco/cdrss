<?php
	include('../../includes/dbcon.php');
	$allId = $_GET['id'];
	
	$query = "SELECT * FROM `allergy` WHERE ID='$allId'";
	$result = mysqli_query($con, $query);
	
	$res = mysqli_fetch_array($result);
	$content = '';
	if($res['description'] != '') {
		$content .= '<p class="text-center">Symptoms: <span class="lead">'.$res['description'].'</span></p>';
	}
	if($content == '') {
		$content .= "<p class='text-center lead'>No Details</p>";
	}
	
	echo $content;
?>
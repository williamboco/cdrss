<?php
switch ($mStatus){
	case 0:
		$mStatusName = "unavailable";
		$mStatusClass = "text-dark";
		break;

	case 1:
		$mStatusName = "critical";
		$mStatusClass = "text-danger";
		break;

	case 2:
		$mStatusName = "threshold";
		$mStatusClass = "text-warning";
		break;

	case 3:
		$mStatusName = "optimum";
		$mStatusClass = "text-success";
		break;

	default:
		break;
	}
?>

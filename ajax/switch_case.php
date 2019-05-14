<?php

switch($patientType) {
	case 'All':
		$join = "visit ON patient.ID";
		break;
	case 'shs':
		$join = "shs ON patient.ID=shs.ID INNER JOIN visit ON shs.ID";
		break;
	case 'coll':
		$join = "college ON patient.ID=college.ID INNER JOIN visit ON college.ID";
		break;
	case 'stud':
		$join = "(SELECT ID FROM shs UNION SELECT ID FROM college) AS t ON patient.ID=t.ID INNER JOIN visit ON t.ID";
		break;
	case 'emp':
		$join = "employee ON patient.ID=employee.ID INNER JOIN visit ON employee.ID";
		break;
	case 'guest':
		$join = "guest ON ID";
		break;
	default:
		//fallback
}

?>

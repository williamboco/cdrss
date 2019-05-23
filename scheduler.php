<?php
session_start();
require_once __DIR__ . '/PHPMailer/vendor/autoload.php';
require_once __DIR__ . ('/includes/dbcon.php');

// $method = 'aes-256-cbc';
// $password = '3sc3RLrpd17';
// $key = substr(hash('sha256', $password, true), 0, 32);
// $iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);

$query = $con->prepare("SELECT * FROM user WHERE isActive=?");
$query->bind_param("i", $isActive);
$isActive = 1;
$query->execute();
$result = $query->get_result();
$rownum = mysqli_num_rows($result);


if($rownum > 0) {
	while ($row = $result->fetch_assoc()) {
		if ($row['isActive'] == $isActive) {

    		//$email = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);
				// email message

				$query1  = $con->prepare("SELECT * from medicine WHERE isDeleted=? AND status=?");
				$query1->bind_param("ii", $isDeleted, $threshold);
				$threshold = 2;
				$isDeleted = 0;
				$query1->execute();
				$result1 = $query1->get_result();
				$rownum1 = mysqli_num_rows($result1);

				$msg = '';
				if ($rownum1 > 0) {
					$msg = "These are the medicines/supplies that are in their <strong>Threshold Level:</strong>";
					$msg .= "<table border=1><tr><th>Medicines/Supplies</th><th>Available Quantity</th></tr>";
					while ($row1 = $result1->fetch_assoc()) {

						if ($row1['isSupply'] == "0") {
							$msg .="<tr><td>".$row1['brandName'] . "(".$row1['genericName'].")</td><td>". $row1['currentQty']."</td></tr>";
						} else {
							$msg .= "<tr><td>".$row1['genericName'] . "</td><td> ". $row1['currentQty']."</td></tr>";
						}
					}
					$msg .="</table><br>";
				}

				$query2  = $con->prepare("SELECT * from medicine WHERE isDeleted=? AND status=?");
				$query2->bind_param("ii", $isDeleted, $critical);
				$critical = 1;
				$isDeleted = 0;
				$query2->execute();
				$result2 = $query2->get_result();
				$rownum2 = mysqli_num_rows($result2);

				if ($rownum2 > 0) {
					$msg .= "These are the medicines/supplies that are in their <strong>Critical Level:</strong>";
					$msg .= "<table border=1><tr><th>Medicines/Supplies</th><th>Available Quantity</th></tr>";
					while ($row2 = $result2->fetch_assoc()) {

						if ($row2['isSupply'] == "0") {
							$msg .="<tr><td>".$row2['brandName'] . "(".$row2['genericName'].")</td><td>". $row2['currentQty']."</td></tr>";
						} else {
							$msg .= "<tr><td>".$row2['genericName'] . "</td><td> ". $row2['currentQty']."</td></tr>";
						}
					}
					$msg .="</table><br>";
				}

				$query3  = $con->prepare("SELECT * from medicine WHERE isDeleted=? AND status=?");
				$query3->bind_param("ii", $isDeleted, $unavailable);
				$unavailable = 0;
				$isDeleted = 0;
				$query3->execute();
				$result3 = $query3->get_result();
				$rownum3 = mysqli_num_rows($result3);

				if ($rownum3 > 0) {
					$msg .= "These are the medicines/supplies that are <strong>Unavailable:</strong>";
					$msg .= "<table border=1><tr><th>Medicines/Supplies</th></tr>";
					while ($row3 = $result3->fetch_assoc()) {

						if ($row3['isSupply'] == "0") {
							$msg .="<tr><td>".$row3['brandName'] . "(".$row3['genericName'].")</td></tr>";
						} else {
							$msg .= "<tr><td>".$row3['genericName'] . "</td>></tr>";
						}
					}
					$msg .="</table>";
				}

				// To send HTML mail, the Content-type header must be set
				$headers  = 'MIME-Version: 1.0' . "\r\n";
				$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

				// use wordwrap() if lines are longer than 70 characters


				// send email
				require_once __DIR__ . '/includes/inventory_mail.php';
			}
		}
	} else {
		echo  "Query  failed!";
	}
?>

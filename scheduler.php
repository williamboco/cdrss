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

				$query1  = $con->prepare("SELECT brandName, genericName, isSupply from medicine WHERE status=? OR status=?");
				$query1->bind_param("ii", $threshold, $critical);
				$threshold = 2;
				$critical = 1;
				$query1->execute();
				$result1 = $query1->get_result();
				$rownum1 = mysqli_num_rows($result1);

				if ($rownum1 > 0) {
					$msg = array("These are the medicines that are in Threshold and Critical Level: ");
					while ($row1 = $result1->fetch_assoc()) {

						if ($row1['isSupply'] == "1") {
							array_push($msg, $row1['genericName']);
						} else {
							array_push($msg, $row1['brandName'], $row1['genericName']);
						}
					}
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

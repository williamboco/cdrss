<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$method = 'aes-256-cbc';
$password = '3sc3RLrpd17';
$key = substr(hash('sha256', $password, true), 0, 32);
$iv = chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0) . chr(0x0);
// Load Composer's autoloader
require_once __DIR__ . '../../PHPMailer/vendor/autoload.php';

$mail = new PHPmailer(true);

try {
    //Server settings
    $mail->SMTPDebug = 0;                                       // Enable verbose debug output
    $mail->isSMTP();                                            // Set mailer to use SMTP
    $mail->Host       = 'smtp.gmail.com';  // Specify main and backup SMTP servers
    $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
    $mail->Username   = 'cdrsiac@gmail.com';                     // SMTP username
    $mail->Password   = 'capstone_project';
    $mail->SMTPOptions = array(
        'ssl' => array(
            'verify_peer' => false,
            'verify_peer_name' => false,
            'allow_self_signed' => true
        )
    );                                        // SMTP password
    $mail->SMTPSecure = 'ssl';                                  // Enable TLS encryption, `ssl` also accepted
    $mail->Port       = 465;                                    // TCP port to connect to




   while ($row = $result->fetch_assoc()) {
      $row['email'] = openssl_decrypt(base64_decode($row['email']), $method, $key, OPENSSL_RAW_DATA, $iv);


        $mail->addAddress($row['email']);     // Add a recipient
        //$mail->AddCC("201601045@iacademy.edu.ph");

        $mail->setFrom('cdrsiac@gmail.com', 'iACADEMY CDRS');    // Add Set Email

        // Content
        $mail->isHTML(true);                                  // Set email format to HTML
        $mail->Subject = 'Threshold and Critical Level';
        $mail->Body = (json_encode($msg));




        $mail->send();
        $mail->clearAddresses();

    }

    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}

?>

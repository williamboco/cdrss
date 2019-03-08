<?php

$mail = new PHPMailer;

$mail->SMTPDebug = 3;                               // Enable verbose debug output

$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = 'tls://smtp.gmail.com:587';  // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = 'iacCDRS@gmail.com';                 // SMTP username
$mail->Password = 'november_rain';
$mail->SMTPOptions = array(
    'ssl' => array(
        'verify_peer' => false,
        'verify_peer_name' => false,
        'allow_self_signed' => true
    )
);                          // SMTP password
//$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
//$mail->Port = 587;                                    // TCP port to connect to

$mail->setFrom('iacCDRS@gmail.com');
//$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
$mail->addAddress($email);               // Name is optional
//$mail->addReplyTo('info@example.com', 'Information');
//$mail->addCC('cc@example.com');
//$mail->addBCC('bcc@example.com');

//$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = 'CDRS';
$mail->Body    = $msg;
$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

if(!$mail->send()) {
    $message = 'Message could not be sent.';
    $message .= 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    $message = 'Message has been sent';
}
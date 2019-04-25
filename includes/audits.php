<?php
include('../includes/dbcon.php');
//include('../includes/password.php');
//include('../includes/session.php');

class AuditClass {
  public function logEvent($eventName) {
    //get the userid for session
    $stmt = $con->prepare("INSERT INTO logs (eventID, eventDate, eventName,   userID) VALUES (?, NOW(), ?, ?)");
     $stmt->bind_param("isi", $eventID, $eventName, $userID);
     $eventID = NULL;
     $userID = $_SESSION['userID'];
     $stmt->execute();
  }
}

?>

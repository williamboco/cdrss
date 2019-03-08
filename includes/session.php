<?php
//Start session
if (!isset($_SESSION['userID']) || (trim($_SESSION['userID']) == '')) {
    header("location: index.php");
    exit();
}
$user_id=$_SESSION['userID'];

?>
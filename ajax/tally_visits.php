<?php
include('../includes/dbcon.php');
$ids= $_POST['ids'];


echo json_encode($ids);

?>

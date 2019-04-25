<?php
session_start();
session_destroy();
include('../includes/dbcon.php');
header('location:../index.php');
?>

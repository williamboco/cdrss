<?php 
require_once __DIR__.'/vendor/autload.php';

use GO\Scheduler;

// new scheduler
$scheduler = new Scheduler();



// run the scheduler
$scheduler->run();


?>
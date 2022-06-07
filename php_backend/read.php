

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

$sql = creating_a_review($conn, 5, 'good', "memo", 70);

print($sql);

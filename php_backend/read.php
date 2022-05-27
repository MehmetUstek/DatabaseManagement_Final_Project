<!--
    COMP306-DatabaseManagement_Final_Project

    This file is for debugging.
-->

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

$result = search_actor($conn,'Jack');

print_table('actor', $result);
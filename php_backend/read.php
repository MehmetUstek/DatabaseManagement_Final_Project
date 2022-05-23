<!--
    COMP306-DatabaseManagement_Final_Project

    This file is for debugging.
-->

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

$result = dummy_query($conn);
print_table('movie', $result);
<!--
    COMP306-DatabaseManagement_Final_Project

    This file is for debugging.
-->

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

$result = search_by_only_genre($conn, "Action");

print_table('movie', $result);
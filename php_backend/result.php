<!--
    COMP306-DatabaseManagement_Final_Project

    This file reads the POST variables and calls the corresponding function.
-->

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

if (isset($_POST['dummy'])){

    $title = $_POST["title"];

    $result = search_by_movie_name($conn, $title);
    
    echo json_encode($result);
}




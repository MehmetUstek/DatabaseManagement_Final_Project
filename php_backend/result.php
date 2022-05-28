

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

if (isset($_POST['dummy'])){
	

    $sql = search_by_movie_name($conn, 'star');

    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}




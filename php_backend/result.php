

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

if (isset($_POST['search_by_movie_name'])){
	

    $sql = search_by_movie_name($conn, 'star');

    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    $json = json_encode($results);
    
    echo $json;
}




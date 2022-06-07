

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

if (isset($_POST['search_by_movie_name'])){
	
    $title = $_POST['title'];

    $sql = search_by_movie_name($conn, $title);

    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['finding_genres_of_movie'])){
	
    $mid = $_POST['MID'];

    $sql = finding_genres_of_movie($conn, $mid);

    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['search_by_movie_and_genre'])){
	
    $title = $_POST['title'];
    $genre = $_POST['gName'];
    $sql = finding_genres_of_movie($conn, $title, $genre);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['search_by_only_genre'])){
	
    $genre = $_POST['gName'];
    $sql = finding_genres_of_movie($conn, $genre);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['search_by_actor'])){
	
    $name = $_POST['fullName'];
    $sql = search_by_actor($conn, $name);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['showing_actors_in_movie'])){
	
    $mid = $_POST['MID'];
    $sql = showing_actors_in_movie($conn, $mid);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['show_movie_count_in_watchlist'])){
	
    $lid = $_POST['LID'];
    $sql = show_movie_count_in_watchlist($conn, $lid);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}


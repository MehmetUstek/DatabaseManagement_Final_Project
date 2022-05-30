

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
    $sql = search_by_only_genre($conn, $genre);


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

if (isset($_POST['search_by_username'])){
	
    $username = $_POST['username'];
    $sql = search_by_username($conn, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['show_profile_page'])){
	
    $username = $_POST['username'];
    $sql = show_profile_page($conn, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['show_followings_of_user'])){
	
    $username = $_POST['username'];
    $sql = show_followings_of_user($conn, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['show_followers_of_user'])){
	
    $username = $_POST['username'];
    $sql = show_followers_of_user($conn, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['show_watchlist_of_user'])){
	
    $username = $_POST['username'];
    $sql = show_watchlist_of_user($conn, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['show_reviews_of_user'])){
	
    $username = $_POST['username'];
    $sql = show_reviews_of_user($conn, $username);


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
if (isset($_POST['show_reviews_of_movie'])){
	
    $mid = $_POST['MID'];
    $sql = show_reviews_of_movie($conn, $mid);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['register_user'])){
	
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $gender = $_POST['gender'];
    $payment_method = $_POST['payment_method'];
    $isPremium = $_POST['isPremium'];

    $sql = register_user($conn, $username,$email,$password,$fname,$lname,$gender,$payment_method,$isPremium);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['choose_interested_genres'])){
	
    //ASK FOR THIS QUERY ON THE FRONT END FOR EACH GENRE NAME THAT THE USER HAS CHOSEN
    $username = $_POST['username'];
    $genre_name = $_POST['genre_name'];

    $sql = choose_interested_genres($conn, $username, $genre_name);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['check_password'])){
	
    $username = $_POST['username'];
    $pass = $_POST['password'];
    $sql = check_password($conn, $username, $pass);
    $json = json_encode($sql, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['creating_a_review'])){

    $rating = $_POST['rating'];
    $comment = $_POST['comment'];
    $username = $_POST['username'];
    $MID = $_POST['MID'];

    $sql = creating_a_review($conn, $rating, $comment, $username, $MID);

    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['creating_a_watchlist'])){
	
    $name = $_POST['name'];
    $username = $_POST['username'];

    $sql = creating_a_watchlist($conn, $name, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['add_movie_to_list'])){
	
    $MID = $_POST['MID'];
    $LID = $_POST['LID'];

    $sql = add_movie_to_list($conn, $MID, $LID);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

///////////////COMPLEX QUERIES//////////////////////
if (isset($_POST['show_top_rated_movies_per_genre'])){


    $sql = show_top_rated_movies_per_genre($conn);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['num_movies_by_liked_genre'])){

    $username = $_POST['username'];
    $sql = num_movies_by_liked_genre($conn, $username);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

if (isset($_POST['updating_vote_avg'])){

    $MID = $_POST['MID'];
    $sql = updating_vote_avg($conn, $MID);


    $results = array();
    while($row = mysqli_fetch_assoc($sql))
    {
        $results[] = $row;
    }
    
    // Encode function should include the following numeric checks.
    $json = json_encode($results, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION);
    
    echo $json;
}

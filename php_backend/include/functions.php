

<?php

# Functions to check inputs

function check_mid($mid){
    return is_numeric($mid);
}

function check_email($name){
    return ctype_alpha($name) and (strlen($name) < 50);
}

function check_name($name){
    return ctype_alpha($name) and (strlen($name) < 20);
}


# Functions to run queries

function dummy_query($conn){
    if ($result = mysqli_query($conn, "SELECT * FROM movie LIMIT 10")
    //or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($conn), E_USER_ERROR) 
    ){
        return $result;
    }
}

function search_by_movie_name($conn, $str) {
    $query = "  SELECT 	*
                FROM 	Movie M
                WHERE 	M.title LIKE '%$str%'";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_movie_and_genre($conn, $genre, $title) {
    $query = "  SELECT 	M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount
                FROM 	Belongs_to B, Movie M, Genre G
                WHERE 	B.GID = G.GID AND B.MID = M.MID AND G.gname = '$genre' AND M.title LIKE '%$title%'";

    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_only_genre($conn, $str) {
    $query = "SELECT 	M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount
                FROM 	Belongs_to B, Movie M, Genre G
                WHERE 	B.GID = G.GID AND B.MID = M.MID AND G.gname = '$str'
                LIMIT   20";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_actor($conn, $str) {
    $query = "  SELECT 	M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount
                FROM 	Actor A, Movie M, Plays_in P
                WHERE 	A.AID = P.AID AND P.MID = M.MID AND A.fullName LIKE '%$str%'
                LIMIT   20";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_username($conn, $str) {
    $query = "  SELECT 	U.username
                FROM 	User U
                WHERE 	U.username LIKE '%$str%'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_profile_page($conn, $str) {
    $query = "  SELECT 	*
                FROM 	User U
                WHERE 	U.username = '$str'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_followers_of_user($conn, $str) {
    $query = " SELECT 	DISTINCT F.followerUsername, U.fname, U.lname
               FROM 	Follow F, User U
               WHERE 	F.followingUsername = '$str' AND F.followerUsername = U.username
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_followings_of_user($conn, $str) {
    $query = "  SELECT 	DISTINCT  F.followingUsername, U.fname, U.lname
                FROM 	Follow F, User U
                WHERE 	F.followerUsername = '$str' AND F.followingUsername = U.username
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_watchlist_of_user($conn, $str) {
    $query = "  SELECT 	    *
                FROM 	    Watchlist W
                WHERE 	    W.username = '$str'
                ORDER BY	W.date DESC
                LIMIT		5
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_reviews_of_user($conn, $str) {
    $query = "  SELECT 	    *
                FROM 	    Review R
                WHERE 	    R.username = '$str'
                ORDER BY	R.date DESC
                LIMIT		5
    ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function showing_actors_in_movie($conn, $id) {
    $query = "  SELECT  A.fullName
                FROM 	Actor A, Movie M, Plays_in P
                WHERE 	A.AID = P.AID AND P.MID = M.MID AND M.MID = '$id'
                LIMIT   5";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function finding_genres_of_movie($conn, $id) {
    $query = "  SELECT 	G.gname
                FROM 	Movie M, Belongs_to B, Genre G
                WHERE 	M.MID = $id AND B.MID = M.MID AND G.GID = B.GID";
    
    if ($result = mysqli_query($conn, $query)){       
        return $result;
    }
}

function show_reviews_of_movie($conn, $str) {
    $query = "  SELECT 	    *
                FROM 	    Review R
                WHERE 	    R.MID = $str
                ORDER BY	R.date DESC
                LIMIT		5";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function register_user($conn, $username,$email,$password,$fname,$lname,$gender,$payment_method,$isPremium) {
    $query = "  INSERT INTO	User
                VALUES	    ('$username', '$email', '$password', GETDATE(), '$fname','$lname','$gender','$payment_method', $isPremium)";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function choose_interested_genres($conn, $username,$genre_name) {
    $query = "  INSERT INTO	User
                VALUES	    ('$username',  (SELECT G.GID
                                         FROM 	Genre G
                                         WHERE 	G.gname = '$genre_name'))";

    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
    
}

function check_password($conn, $str, $pass) {
    $query = "  SELECT 	U.username
                FROM 	User U
                WHERE 	U.username = '$str' and U.password = '$pass'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        if(mysqli_num_rows($result) > 0){
            return true;
        }
        else{
            return false;
        }
    }
}

function creating_a_review($conn, $rating, $comment, $username, $MID) {
    $query = "  INSERT INTO	Review (rating, comment, date,  username, MID)
                VALUES	    ($rating, '$comment', GETDATE(), '$username', $MID)";

    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
    
}

function creating_a_watchlist($conn, $name, $username) {
    $query = "  INSERT INTO	Watchlist (name, creationDate, username)
                VALUES	    ('$name', GETDATE(), '$username')";

    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
    
}

function add_movie_to_list($conn, $MID,$LID) {
    $query = "  INSERT INTO	Movie_in_list
                VALUES	    ($MID, $LID)";

    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
    
}


///////////////COMPLEX QUERIES//////////////////////

function show_top_rated_movies_per_genre($conn){
    $query = "  SELECT 	DISTINCT M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount, G.gname
                FROM 	Genre G, Belongs_to B, Movie M
                WHERE 	G.GID = B.GID AND B.MID = M.MID AND (G.GID, M.voteAvg) IN ( SELECT 	G.GID, MAX(M.VoteAvg)
                                                                                    FROM 	Genre G, Belongs_to B, Movie M
                                                                                    WHERE 	G.GID = B.GID AND B.MID = M.MID
                                                                                    GROUP BY 	GID)";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function num_movies_by_liked_genre($conn, $username){
    $query = "  SELECT 	    G.gname, Count(MID)
                FROM 	    Intrested_in I, Genre G, Belongs_to B, User U, Watchlist W, Movie_in_list ML
                WHERE 	    U.username = '$username' AND U.username = W.username AND U.username = I.username AND I.GID = B.GID AND B.MID = ML.MID AND ML.LID = W.LID
                GROUP BY 	GID";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function updating_vote_avg($conn, $MID){
    $query = "  UPDATE	Movie M1
                SET		M1.voteAvg = (  SELECT SUM(R.rating) / (M2.voteCount + 1)
                                        FROM Movie M2, Review R
                                        WHERE M2.MID = '$MID' M2.MID = R.MID),
                        M1.voteCount = M1.voteCount + 1
                WHERE 	M1.MID = '$MID'";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}


// print_table is for debugging
function print_table($table_name, $result){

    if ($table_name === 'movie'){

        ?><br>

        <table border='1'>

        <tr>

        <th>MovieID</th>

        <th>Title</th>

        <th>Release Date</th>

        <th>Duration</th>

        <th>Vote Average</th>

        <th>Vote Count</th>

        <th>Genre</th>

        </tr>

        <?php


        foreach($result as $row){

            echo "<tr>";

            echo "<td>" . $row['MID'] . "</td>";

            echo "<td>" . $row['title'] . "</td>";

            echo "<td>" . $row['releaseDate'] . "</td>";

            echo "<td>" . $row['duration'] . "</td>";

            echo "<td>" . $row['voteAvg'] . "</td>";

            echo "<td>" . $row['voteCount'] . "</td>";

            echo "<td>" . $row['gname'] . "</td>";

            echo "</tr>";
        }

        echo "</table>";
    }
    


}

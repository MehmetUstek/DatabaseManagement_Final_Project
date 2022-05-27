<!--
    COMP306-DatabaseManagement_Final_Project

    This file contains functions that create appropriate SQL queries with given parameters and run them on the database.

    There are functions from HW3 to be deleted.
-->

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

function dummy_query($conn, $str){
    if ($result = mysqli_query($conn, "SELECT $str FROM movie LIMIT 10")
    //or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($conn), E_USER_ERROR) 
    ){
        return $result;
    }
}

function search_by_movie_name($conn, $str) {
    $query = "SELECT 	*
                FROM 	Movie M
                WHERE 	M.title LIKE '%$str%'";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_only_genre($conn, $str) {
    $query = "SELECT 	*
                FROM 	Belongs_to B, Movie M, Genre G
                WHERE 	B.GID = G.GID AND B.MID = M.MID AND G.gname = '$str'";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}
function search_by_username($conn, $str) {
    $query = "SELECT 	P.username
                FROM 		Premium_user P
                WHERE 	P.username LIKE '%$str%'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}


function show_profile_page($conn, $str) {
    $query = "SELECT 	*
                FROM 		Premium_user P
                WHERE 	P.username = '$str'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function check_password($conn, $str) {
    $query = "SELECT 	P.password
                    FROM 		Premium_user P
                    WHERE 	P.username = '$str'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_followings_of_user($conn, $str) {
    $query = "SELECT 	followingUsername
                FROM 		Follow F
                WHERE 	F.followerUsername = ''$str'
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_followers_of_user($conn, $str) {
    $query = "SELECT 	followerUsername
                    FROM 		Follow F
                    WHERE 	F.followingUsername = '$str'
    
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_actor($conn, $str) {
    $query = "SELECT 	*
                FROM 		Actor A
                WHERE 	A.fullname LIKE '%$str%'
    
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_watchlists_of_user($conn, $str) {
    $query = "SELECT 	*
                FROM 	Watchlist W
                WHERE 	W.username = '$str'
                ORDER BY	W.date DESC
                LIMIT		5
                ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_reviews_of_user($conn, $str) {
    $query = "SELECT 	*
                FROM 		Review R
                WHERE 	R.username = '$str'
                ORDER BY	R.date DESC
                LIMIT		5
    ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_reviews_of_movie($conn, $str) {
    $query = "SELECT 	*
                FROM 	Review R
                WHERE 	R.MID = $str
                ORDER BY	R.date DESC
                LIMIT		5";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_average_rating($conn, $str) {
    $query = "SELECT 	M.voteAvg
                FROM 		Movie M
                WHERE 	M.MID = $str";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function show_username($conn, $str) {
    $query = "SELECT 	P.name
                 FROM 		Premium_user P
                  WHERE 	P.username = '$str' ";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function register_free_user($conn, $username,$email,$password,$fname,$lname,$gender) {
    $query = "INSERT INTO	Free_user
                VALUES	('$username',  '$email', '$password', GETDATE(), '$fname','$lname','$gender')";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}
function register_premium_user($conn, $username,$email,$password,$fname,$lname,$gender,$payment_method) {
    $query = "INSERT INTO	Premium_user
                VALUES	('$username',  '$email', '$password', GETDATE(), '$fname','$lname','$gender','$payment_method')";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}
function choose_interested_genres($conn, $username,$genre_name) {

    
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

            echo "</tr>";
        }

        echo "</table>";
    }
    


}

function insert_city($conn,$cid, $name, $country_code, $district, $population){


    $sql = "INSERT INTO city(ID, Name, CountryCode, District, Population) VALUES('$cid', '$name', '$country_code', '$district','$population');";
    if ($conn->query($sql) === TRUE) { #We used different function to run our query.
        echo "<br>Record updated successfully<br>";
    } else {
        echo "<br>Error updating record: " . $conn->error . "<br>";
    }
}

function remove_city($conn,$cid){
    $sql = "DELETE FROM city WHERE ID='$cid'";
    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $conn->error;
    }

}

function manipulate_city($conn,$cid,$name){

    $sql = "UPDATE city SET Name='$name' WHERE ID='$cid'" ;
    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
    } else {
        echo "Error updating record: " . $conn->error;
    }

}

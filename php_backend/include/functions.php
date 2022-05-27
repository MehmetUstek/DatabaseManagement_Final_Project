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

function dummy_query($conn){
    if ($result = mysqli_query($conn, "SELECT * FROM movie LIMIT 10")
    //or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error($conn), E_USER_ERROR) 
    ){
        return $result;
    }
}

function search_by_movie_name($conn, $str) {
    $query = "SELECT 	M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount, G.gname
                FROM 	Movie M, Genre G, Belongs_to B
                WHERE 	M.title LIKE '%$str%' AND B.GID = G.GID AND B.MID = M.MID";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_only_genre($conn, $str) {
    $query = "SELECT 	M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount, G.gname
                FROM 	Belongs_to B, Movie M, Genre G
                WHERE 	B.GID = G.GID AND B.MID = M.MID AND G.gname = '$str'";
    
    if ($result = mysqli_query($conn, $query)){
        return $result;
    }
}

function search_by_movie_and_genre($conn, $movie_name, $genre) {
    $query = "SELECT 	M.MID, M.title, M.releaseDate, M.duration, M.voteAvg, M.voteCount, G.gname
                FROM    Belongs_to B, Movie M, Genre G
                WHERE 	B.GID = G.GID AND B.MID = M.MID AND G.gname = '$genre' AND M.title LIKE '%$movie_name%'";
    
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

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
    if ($result = mysqli_query($conn, "SELECT * FROM movie LIMIT 10")) {
        return $result;
    }
}


function get_city_info($conn,$cid){

    if ($result = mysqli_query($conn, "SELECT * FROM city WHERE ID=" . $cid )) {
        return $result;
    }
}

function is_contains($conn, $string, $needle, $table_name){

    $is_contains = False;

    ########
    #Please enter your code here
    $sql_query =  "SELECT * FROM $table_name WHERE $needle = '$string'";
    $entries = mysqli_query($conn, $sql_query);

    if ($entries) {
        if (mysqli_num_rows($entries) > 0) {
            $is_contains = True;
        } 
    } else {
        echo "Error at is_contains function: " . $conn->error;
    }
    ########
    return $is_contains;
}

function diff_lang($conn, $country1, $country2){

    $result = Null;
    ########
    #Please enter your code here
    $sql_query = "SELECT Language FROM country, countrylanguage
                    WHERE country.Code = countrylanguage.CountryCode
                    AND country.Name = '$country1'
                    AND Language NOT IN
                    (SELECT Language FROM country, countrylanguage
                    WHERE country.Code = countrylanguage.CountryCode
                    AND country.Name = '$country2')";

    $result = mysqli_query($conn, $sql_query);

    if ($result == False) {
        echo "Error at diff_lang function: " . $conn->error;
    }
    ########
    return $result;
}

function diff_lang_join($conn, $country1, $country2){

    $result = Null;
    ########
    #Please enter your code here
    $sql_query = "SELECT CL1.Language FROM 
                    (country AS C1 INNER JOIN countrylanguage AS CL1 ON Code = CountryCode 
                                                        AND Name = '$country1')
                    LEFT OUTER JOIN
                    (country AS C2 INNER JOIN countrylanguage AS CL2 ON Code = CountryCode 
                                                        AND Name = '$country2')
                    ON CL1.Language = CL2.Language
                    WHERE CL2.Language IS NULL";

    $result = mysqli_query($conn, $sql_query);

    if ($result == False) {
        echo "Error at diff_lang_join function: " . $conn->error;
    }
    ########
    return $result;
}

function aggregate_countries($conn,$agg_type, $country_name){

    $result = Null;
    ########
    #Please enter your code here
    $sql_query = "SELECT DISTINCT Name, LifeExpectancy, GovernmentForm, Language 
                    FROM country, countrylanguage
                    WHERE country.Code = countrylanguage.CountryCode
                    AND country.LifeExpectancy > (SELECT $agg_type(LifeExpectancy) FROM country)
                    AND country.LifeExpectancy < (SELECT LifeExpectancy FROM country
                                                    WHERE Name = '$country_name')
                    AND countrylanguage.IsOfficial = 'T'";

    $result = mysqli_query($conn, $sql_query);

    if ($result == False) {
    echo "Error at diff_lang function: " . $conn->error;
    }
    ########
    return $result;
}

function find_min_max_continent($conn) {

    $sql_query = "SELECT Name, Continent, LifeExpectancy
                        FROM country
                        WHERE (Continent, LifeExpectancy) IN
                        (SELECT Continent, MIN(LifeExpectancy) FROM country GROUP BY Continent)
                    UNION
                    SELECT Name, Continent, LifeExpectancy
                        FROM country
                        WHERE (Continent, LifeExpectancy) IN
                        (SELECT Continent, MAX(LifeExpectancy) FROM country GROUP BY Continent)
                    ORDER BY Name;";

    $result = mysqli_query($conn, $sql_query);

    if ($result == False) {
    echo "Error at diff_lang function: " . $conn->error;
    }

    return $result;
}

function find_country_language($conn, $percentage, $language) {

    $sql_query = "SELECT Name, Language, Percentage
                    FROM country AS C INNER JOIN countrylanguage AS CL
                    ON C.Code = CL.CountryCode
                    WHERE CL.Percentage > $percentage
                    AND CL.Language = '$language'";

    $result = mysqli_query($conn, $sql_query);

    if ($result == False) {
    echo "Error at diff_lang function: " . $conn->error;
    }

    return $result;
}

function find_country_count($conn, $amount) {

    $sql_query = "SELECT Name, LifeExpectancy, Continent FROM country 
                    WHERE (Continent, LifeExpectancy) IN
                        (SELECT Continent, MAX(LifeExpectancy) FROM country
                            WHERE country.Name IN (SELECT country.Name
                                                        FROM country INNER JOIN city 
                                                                ON CountryCode = Code
                                                        GROUP BY country.Name
                                                            HAVING COUNT(*) > $amount)
                            GROUP BY Continent);";

    $result = mysqli_query($conn, $sql_query);

    if ($result == False) {
    echo "Error at diff_lang function: " . $conn->error;
    }

    return $result;
}


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

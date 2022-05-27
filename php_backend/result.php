<!--
    COMP306-DatabaseManagement_Final_Project

    This file reads the POST variables and calls the corresponding function.
-->

<?php

require_once 'include/dbConnect.php';
require_once 'include/functions.php';

if (isset($_POST['insert'])){

    $cid = $_POST["cid_insert"];
    $name = $_POST["name_insert"];
    $country_code = $_POST["country_code_insert"];
    $district = $_POST["district_insert"];
    $population = $_POST["population_insert"];

    if(check_cid($cid) !== true){
        exit("Wrong cid value");
    }

    if(check_name($name) !== true){
        exit("Wrong name");
    }

    if(check_country_code($conn,$country_code) !== true){
        exit("Wrong country code");
    }

    if(check_district($district) !== true){
        exit("Wrong district");
    }

    if(check_population($population) !== true){
        exit("Wrong population");
    }

    $result = get_city_info($conn,$cid);
    echo "Returned rows are: " . mysqli_num_rows($result);
    print_table('city', $result);
    mysqli_free_result($result);
    insert_city($conn,$cid, $name, $country_code, $district, $population);
    $result = get_city_info($conn,$cid);
    echo "Returned rows are: " . mysqli_num_rows($result);
    print_table('city', $result);
    mysqli_free_result($result);
}


if (isset($_POST['remove'])){

    $cid = $_POST["cid_remove"];

    if(check_cid($cid) !== true){
        exit("Wrong cid value");
    }
    $result = get_city_info($conn,$cid);
    echo "Returned rows are: " . mysqli_num_rows($result);
    print_table('city', $result);
    mysqli_free_result($result);
    remove_city($conn,$cid);
    $result = get_city_info($conn,$cid);
    echo "Returned rows are: " . mysqli_num_rows($result);
    print_table('city', $result);
    mysqli_free_result($result);
}


if (isset($_POST['manipulate'])){

    $cid = $_POST["cid_manipulate"];
    $name = $_POST["name_insert"];

    if(check_cid($cid) !== true){
        exit("Wrong cid value");
    }
    get_city_info($conn,$cid);
    manipulate_city($conn,$cid,$name);
    get_city_info($conn,$cid);
}

if (isset($_POST['get_differences'])){

    $country1 = $_POST["country1"];
    $country2 = $_POST["country2"];

    if(check_country($conn, $country1) !== true || check_country($conn, $country2) !== true){
        exit("Invalid name for country.");
    }

    $result = diff_lang($conn, $country1, $country2);
    print_table('languages', $result);
}

if (isset($_POST['get_differences_join'])){

    $country1 = $_POST["country1"];
    $country2 = $_POST["country2"];

    if(check_country($conn, $country1) !== true || check_country($conn, $country2) !== true){
        exit("Invalid name for country.");
    }

    $result = diff_lang_join($conn, $country1, $country2);
    print_table('languages', $result);
}

if (isset($_POST['get_life_expectancy'])){

    $aggregate = $_POST["aggregate"];
    $country = $_POST["country"];

    if(check_country($conn, $country) !== true){
        exit("Invalid name for country.");
    }

    $result = aggregate_countries($conn, $aggregate, $country);
    print_table('aggregate', $result);
}




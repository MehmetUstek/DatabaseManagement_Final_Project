<!--
    COMP306-DatabaseManagement_Final_Project

    This file secures the connection to the database with given parameters.

<?php

/*
More information about the parameters can be found: 
https://www.php.net/manual/en/mysqli.construct.php
*/

$host     = 'localhost';
$username = 'atahantap'; # Please write your username here.
$passwd   = '123'; # Please write your passwd here.
$dbName   = 'movies';

$conn = mysqli_connect($host, $username, $passwd, $dbName);

if(!$conn){
    die('Connection failed: '.mysqli_connect_error());
}
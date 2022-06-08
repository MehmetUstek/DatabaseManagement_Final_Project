<?php


$host     = 'localhost';
$username = 'root'; # Please write your username here.
$passwd   = 'root';
$dbName   = 'movies';

$conn = mysqli_connect($host, $username, $passwd, $dbName);

if(!$conn){
    die('Connection failed: '.mysqli_connect_error());
}

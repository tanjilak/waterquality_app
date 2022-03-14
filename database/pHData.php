<?php
require('connection.php');

$makeQuery = "SELECT * from ph_values" ;

$servername = "localhost:3306";
$username = "admin";
$password = "Capstone2022";

$connection = new PDO("mysql:host=localhost;dbname=h2o", $username, $password);
$statement = $connection->prepare($makeQuery);

$statement->execute();

$myarray = array();

while ($resultsFrom = $statement ->fetch()){

    array_push(
        $myarray,array(

            "d1" => $resultsFrom['d1'],
            "d2" => $resultsFrom['d2'],
            "d3" => $resultsFrom['d3'],
            "d4" => $resultsFrom['d4'],
            "d5" => $resultsFrom['d5'],
            "y" => $resultsFrom['y'],
        )
      );
    }

echo json_encode($myarray);

?>

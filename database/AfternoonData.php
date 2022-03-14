<?php
require('connection.php');

$makeQuery = "SELECT * FROM data WHERE time_of_day = 'Afternoon' AND week_id='1'";

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
            "id" => $resultsFrom['id'],
            "week_id" => $resultsFrom['week_id'],
            "time_of_day" => $resultsFrom['time_of_day'],
            "time" => $resultsFrom['time'],
            "temp" => $resultsFrom['temp'],
            "ph" => $resultsFrom['ph'],
            "orp" => $resultsFrom['orp'],
        )
      );
    }

echo json_encode($myarray);

?>

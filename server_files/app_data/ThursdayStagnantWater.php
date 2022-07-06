<?php
require('connection.php');

$makeQuery = "SELECT * FROM Sensor_Data WHERE id BETWEEN 4092 AND 5091 AND date='2022-04-07'" ;


$servername = "localhost:3306";
$username = "arduino2022";
$password = $PASS;

$connection = new PDO("mysql:host=localhost;dbname=Sensor_Data", $username, $password);
$statement = $connection->prepare($makeQuery);

$statement->execute();

$myarray = array();
//APRIL 6, 2022
///BEFORE FLUSHING 

while ($resultsFrom = $statement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsFrom['id'],
            "Temp" => $resultsFrom['Temp'],
            "Ph" => $resultsFrom['Ph'],
            "ORP" => $resultsFrom['ORP'],
            "reading_time" => $resultsFrom['reading_time'],
        	"date" => $resultsFrom['date'],
        )
      );
    }

echo json_encode($myarray);

?>


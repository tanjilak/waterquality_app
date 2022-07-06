<!DOCTYPE html>
<html><body>
<?php
/*
  Rui Santos
  Complete project details at https://RandomNerdTutorials.com/esp32-esp8266-mysql-database-php/
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files.
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
*/

$servername = "localhost:3306";

// REPLACE with your Database name
$dbname = "Sensor_Data";
// REPLACE with Database user
$username = "arduino2022";
// REPLACE with Database user password
$password = $PASS;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT id, sensor, location, Temp, Ph, ORP, reading_time, date recorded FROM Sensor_Data ORDER BY id DESC";

echo '<table cellspacing="5" cellpadding="5">
      <tr> 
        <td>ID</td> 
        <td>Sensor</td> 
        <td>Location</td> 
        <td>Temperature</td> 
        <td>pH</td>
        <td>ORP</td>
        <td>Reading Time</td>
        <td>Date</td>

      </tr>';
 
if ($result = $conn->query($sql)) {
    while ($row = $result->fetch_assoc()) {
        $row_id = $row["id"];
        $row_sensor = $row["sensor"];
        $row_location = $row["location"];
        $row_Temp = $row["Temp"];
		$row_Ph = $row["Ph"];
   		$row_ORP = $row["ORP"];
    	$row_reading_time = $row["reading_time"];
    	$row_date = $row["date"];
 
        // Uncomment to set timezone to - 1 hour (you can change 1 to any number)
        //$row_reading_time = date("Y-m-d H:i:s", strtotime("$row_reading_time - 1 hours"));
      
        // Uncomment to set timezone to + 4 hours (you can change 4 to any number)
        //$row_reading_time = date("Y-m-d H:i:s", strtotime("$row_reading_time + 4 hours"));
      
        echo '<tr> 
                <td>' . $row_id . '</td> 
                <td>' . $row_sensor . '</td> 
                <td>' . $row_location . '</td> 
                <td>' . $row_Temp . '</td> 
                <td>' . $row_Ph . '</td> 
                <td>' . $row_ORP . '</td> 
                <td>' . $row_reading_time . '</td> 
                <td>' . $row_date . '</td>

              </tr>';
    }
    $result->free();
}

$conn->close();
?> 
</table>
</body>
</html>
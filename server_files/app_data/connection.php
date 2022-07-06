<?php
$servername = "localhost:3306";
$username = "arduino2022";
$password = $PASS;

// Create connection
$conn = mysqli_connect($servername, $username, $password);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "";
?>

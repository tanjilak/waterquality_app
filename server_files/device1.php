<?php
 
 $host = "localhost:3306";
 $db = "Sensor_Data";
 $user = "arduino2022";
 $pass = $PASS; 


 
 $con = mysqli_connect($host,$user,$pass,$db);
 
 $json = file_get_contents('php://input');

 $obj = json_decode($json,true);
 

 $name = $obj['name'];

 $location = $obj['location'];
 
 $deviceQuery = "select * from device_name where name = '$name' and location = '$location' ";
 

 $check = mysqli_fetch_array(mysqli_query($con,$deviceQuery));
 
	if(isset($check)){

		 $onDeviceSuccess = 'Device Details Matched';

		 $SuccessMSG = json_encode($onDeviceSuccess);

		 echo $SuccessMSG ; 
	 
	 }
	 
	 else{

		$InvalidMSG = 'Invalid Name or Location';

		$InvalidMSGJSon = json_encode($InvalidMSG);

		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($con);
?>

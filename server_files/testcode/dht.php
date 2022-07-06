<?php
class sensors_data{
 public $link='';
 function __construct($temperature, $phvalue, $ORPvalue){
  $this->connect();
  $this->storeInDB($temperature, $phvalue, $ORPvalue);
 }
 
 function connect(){
  $this->link = mysqli_connect('http://h2ocapstone2022.ddns.net','arduino2022',$PASS) or die('Cannot connect to the DB');
  mysqli_select_db($this->link,'Sensor_Data') or die('Cannot select the DB');
 }
 
 function storeInDB($temperature, $phvalue, $ORPvalue){
  $query = "insert into sesnors_data set phvalue='".$phvalue."', temperature='".$temperature."', $ORPvalue='".$ORPvalue."'";
  $result = mysqli_query($this->link,$query) or die('Errant query:  '.$query);
 }
 
}
if($_GET['temperature'] != '' and  $_GET['phvalue'] != '' and  $_GET['ORPvalue'] != ''){
 $sensors_data=new sensors_data($_GET['temperature'],$_GET['phvalue'],$_GET['ORPvalue']);
}


?>

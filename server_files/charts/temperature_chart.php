<?php

define("DB_HOST","localhost:3306");
define("DB_USER", "arduino2022");
define("DB_PASSWORD", $PASS);
define("DB_NAME", "Sensor_Data");



$connection = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

?>

<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart',]});
      google.charts.setOnLoadCallback(drawChart);
	 google.charts.setOnLoadCallback(drawChart2);
google.charts.setOnLoadCallback(drawChart3);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['time', 'Temp'],
         <?php
         $sql = "SELECT reading_time,Temp FROM Sensor_Data ORDER BY id ASC";
         $fire = mysqli_query($connection,$sql);
          while ($result = mysqli_fetch_assoc($fire)) {
            echo"['".$result['reading_time']."',".$result['Temp']."],";
          }

         ?>
        ]);

        var options = {
          title: 'Week 1 Temperature (°C)',
          titleTextStyle: {
     
        fontSize: 20, // 12, 18 whatever you want (don't specify px)
      
    },
         hAxis: {
          title: 'Time',
         
        },
     
      
        
        };

         var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }




 function drawChart2() {

        var data = google.visualization.arrayToDataTable([
          ['time', 'pH'],
         <?php
         $sql = "SELECT reading_time,Ph FROM Sensor_Data ORDER BY id ASC";
         $fire = mysqli_query($connection,$sql);
          while ($result = mysqli_fetch_assoc($fire)) {
            echo"['".$result['reading_time']."',".$result['Ph']."],";
          }

         ?>
        ]);

        var options = {
          title: 'Week 1 pH',
          titleTextStyle: {
     
        fontSize: 20, // 12, 18 whatever you want (don't specify px)
      
    },
         hAxis: {
          title: 'Time',
         
        },
     
      
        
        };

         var chart2 = new google.visualization.LineChart(document.getElementById('curve_chart2'));

        chart2.draw(data, options);
      }


 function drawChart3() {

        var data = google.visualization.arrayToDataTable([
          ['time', 'ORP'],
         <?php
         $sql = "SELECT reading_time,ORP FROM Sensor_Data ORDER BY id ASC;";
         $fire = mysqli_query($connection,$sql);
          while ($result = mysqli_fetch_assoc($fire)) {
            echo"['".$result['reading_time']."',".$result['ORP']."],";
          }

         ?>
        ]);

        var options = {
          title: 'Week 1 ORP (mV)',
          titleTextStyle: {
     
        fontSize: 20, // 12, 18 whatever you want (don't specify px)
      
    },
         hAxis: {
          title: 'Time',
         
        },
     
      
        
        };

         var chart3 = new google.visualization.LineChart(document.getElementById('curve_chart3'));

        chart3.draw(data, options);
      }
    </script>
  </head>
  <body>
       <div id="curve_chart" style="width: 1400px; height: 800px"></div>
    	 <div id="curve_chart2" style="width: 1400px; height: 800px"></div>
        	 <div id="curve_chart3" style="width: 1400px; height: 800px"></div>
  </body>
</html>
    
 

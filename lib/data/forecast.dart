
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Forecast extends StatefulWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        children: <Widget>[
          const Text("pH",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,),
          ),
          Container(
            child: Image.network('http://h2ocapstone2022.ddns.net:9999/python/LSTM/PH/PH_LSTM_ML.png'),
          ),
          Container(
            height: 10,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
            ),
          ),
          const Text("Temperature",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,),
          ),
          Container(
            child: Image.network('http://h2ocapstone2022.ddns.net:9999/python/LSTM/Temp/Temp_LSTM_ML.png'),
          ),
          Container(
            height: 10,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
            ),
          ),
          const Text("ORP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,),
          ),
          Container(
            child: Image.network('http://h2ocapstone2022.ddns.net:9999/python/LSTM/ORP/ORP_LSTM_ML.png'),
          ),
        ],
      ),);
  }
}
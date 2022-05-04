
import 'package:flutter/material.dart';
import 'package:waterquality_app/prediction.dart';
import 'package:waterquality_app/prediction2.dart';

import '../constants.dart';
import '../prediction3.dart';



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
          const Text("Week 2 Predictions",  style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: primarycolor,
          ),),
          const SizedBox(height: 10,),
          Container(
            height: 10,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
            ),
          ),
          const Text("pH",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,),
          ),
          Image.network('https://h2ocapstone2022.ddns.net:9999/python/LSTM/week%2001/fullweek/ph-pred.png'),
          const Prediction2(),
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

          Image.network('https://h2ocapstone2022.ddns.net:9999/python/LSTM/week%2001/fullweek/temp-pred.png'),
          const Prediction(),
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
          Image.network('https://h2ocapstone2022.ddns.net:9999/python/LSTM/week%2001/fullweek/orp-pred.png'),
          const Prediction3(),
        ],
      ),);
  }
}
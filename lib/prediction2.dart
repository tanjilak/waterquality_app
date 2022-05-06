import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'constants.dart';
import 'dart:convert';


class Prediction2 extends StatefulWidget {
  const Prediction2({Key? key}) : super(key: key);

  @override
  _Prediction2State createState() => _Prediction2State();
}

class _Prediction2State extends State<Prediction2> {

  Future<String> prediction() async{
    final data = await http.get(Uri.parse("https://h2ocapstone2022.ddns.net:9999/python/LSTM/week01/monday/ph-pred-mean.txt"));
    return data.body.toString();
  }

  bool _visible = false;

  void _toggle(){
    setState((){
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          MaterialButton(
            color: secondarycolor,
            child: const Text(
              "Predict Average pH for Next Week",
              style: TextStyle(fontSize: 15, color: Colors.white,),

            ),
            onPressed: _toggle,
          ),
          Visibility(
            child: FutureBuilder(
              future: prediction(),
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  return Text("pH: ${snapshot.data.toString()}") ;
                } else {
                  return const Text('Loading...');
                }
              },
            ),
            visible: _visible,
          ),


        ],
      ),
    );

  }
}
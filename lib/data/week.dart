
import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:waterquality_app/data/ph_test.dart';
import 'package:waterquality_app/data/temp_test.dart';
import 'dart:convert';

import 'orp_test.dart';


class Week extends StatefulWidget {
  const Week({Key? key}) : super(key: key);

  @override
  _WeekState createState() => _WeekState();
}

class _WeekState extends State<Week> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text("Week 1",  style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: primarycolor,
          ),),
          const SizedBox(height:5,),

          //PH
          Container(
            height: 5,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
            ),
          ),
          const Text("pH",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,),
          ),
          const SizedBox(height:10,),
          Container(
            height: 150,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0x9900738C),
              ),
            ),


            child: const phTable(),
          ),

          const SizedBox(height:10,),


          //TEMPERATURE
          Container(
            height: 10,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
            ),
          ),
          const Text("Temperature (°C)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,

            ),
          ),
          const SizedBox(height:10,),
          Container(
            height: 150,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0x9900738C),
              ),
            ),


            child: const tempTable(),
          ),

          const SizedBox(height:10,),

          //ORP
          Container(
            height: 10,
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
            ),
          ),
          const Text("ORP (mV)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,

            ),
          ),
          const SizedBox(height:10,),
          Container(
            height: 150,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0x9900738C),
              ),
            ),


            child: const orpTable(),
          ),

          const SizedBox(height:10,),

        ],
      ),
    );
  }
}
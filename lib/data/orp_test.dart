import 'package:flutter/material.dart';
import 'package:csv/csv.dart' as csv;
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;


import '../constants.dart';

class orpTable extends StatefulWidget {
  const orpTable({Key? key}) : super(key: key);

  @override
  _orpTableState createState() => _orpTableState();
}

class _orpTableState extends State<orpTable> {
  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await http.get(Uri.parse("https://h2ocapstone2022.ddns.net:9999/app_data/csv_files/orp.csv"));
   csv.CsvToListConverter converter = new csv.CsvToListConverter(eol: '\r\n', fieldDelimiter: ',');
    //List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);
    List<List> csvTable = converter.convert(myData.body);
    return csvTable;
  }

  void load() async{
    var newdata = await loadAsset();
    setState(() {
      data = newdata;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: load,
        backgroundColor: primarycolor,
      ),

      body: SingleChildScrollView(
        child: Table(

          border: TableBorder.all(width: 0.5),
          children: data.map((item) {
            return TableRow(
                children: item.map((row) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      row.toString(),
                      style: const TextStyle(fontSize: 11.5),
                    ),
                  );
                }).toList());
          }).toList(),
        ),
      ),
    );
  }
}
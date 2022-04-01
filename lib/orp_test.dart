import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class orpTable extends StatefulWidget {
  const orpTable({Key? key}) : super(key: key);

  @override
  _orpTableState createState() => _orpTableState();
}

class _orpTableState extends State<orpTable> {
  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/orp.csv");
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);

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
          onPressed: load),

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
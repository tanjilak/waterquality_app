import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'constants.dart';


class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  var prediction = "";
  var prediction2 = "";
  var prediction3 ="";

  @override
  void initState() {
    super.initState();
    prediction = "click predict button";
    prediction2 ="click predict button";
    prediction3 ="click predict button";
  }

  Future<void> Data() async {
    final interpreter = await Interpreter.fromAsset('converted_model.tflite');
    var input = [
      [6.95, 7.1, 7.04, 7.04, 6.95]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    print(output[0][0]);

    final interpreter2 = await Interpreter.fromAsset('model_2.tflite');
    var input2 = [7.1, 6.96, 6.97, 7.41, 6.72];
    var output2 = List.filled(1,0).reshape([1,1]);
    interpreter2.run(input2,output2);
    print(output2[0][0]);

  final interpreter3 = await Interpreter.fromAsset('model_3.tflite');
  var input3 = [8.06, 6.8, 6.82, 7.84, 6.48];
  var output3 = List.filled(1,0).reshape([1,1]);
  interpreter3.run(input3,output3);
  interpreter3.run(input3,output3);
  print(output3[0][0]);

    this.setState(() {
      prediction = output[0][0].toString();
      prediction2 = output2[0][0].toString();
      prediction3 = output3[0][0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            MaterialButton(
              color: primarycolor,
              child: const Text(
                "Predict pH values for next Monday",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: Data,
            ),
            const SizedBox(height: 12),
            Text(
              "Monday Morning:  $prediction ",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            Text(
              "Monday Afternoon: $prediction2 ",
                style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            Text(
              "Monday Night: $prediction3 ",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      );

  }
}
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
  @override
  void initState() {
    super.initState();
    prediction = "click predict button";
  }

  Future<void> Data() async {
    final interpreter = await Interpreter.fromAsset('converted_model.tflite');
    var input = [
      [7.24, 7.00, 7.04, 7.31, 6.82]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    print(output[0][0]);

    this.setState(() {
      prediction = output[0][0].toString();
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
                "Predict pH value for Next Monday",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: Data,
            ),
            const SizedBox(height: 12),
            Text(
              "Predicted Value :  $prediction ",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      );

  }
}
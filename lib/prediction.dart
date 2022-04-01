import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'constants.dart';


class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {



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
                "Predict pH values for next week",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: (){},
            ),
            const SizedBox(height: 12),

          ],
        ),
      );

  }
}
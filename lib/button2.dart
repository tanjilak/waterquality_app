import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';

class Button2 extends StatelessWidget {
  const Button2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 430,
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(10))
        ),
      ),
    );
  }
}
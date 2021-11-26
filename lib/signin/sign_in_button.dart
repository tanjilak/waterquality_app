import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 370,
      width: 280,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Sign In",
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
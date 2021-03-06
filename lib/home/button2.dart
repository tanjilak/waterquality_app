import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/signup/signup.dart';

class Button2 extends StatelessWidget {
  const Button2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 300,
      width: 280,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SignUp();
              },
            ),
          );
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(

            backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(15))
        ),
      ),
    );
  }
}
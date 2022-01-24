import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/signin/sign_in.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 370,
      width: 280,
      child: ElevatedButton(
        onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(
                builder:(context){
                  return const SignIn();
                },
            ),
        );
        },
        child: const Text(
          "Sign In",
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
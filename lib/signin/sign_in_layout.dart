import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/signin/email.dart';
import 'package:waterquality_app/signin/password.dart';
import 'package:waterquality_app/signin/sign_in_button.dart';
import 'package:waterquality_app/background.dart';
import 'package:waterquality_app/signup.dart';

class SignInLayout extends StatelessWidget {
  const SignInLayout({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Background1(size: size),
        Background2(size: size),
        const Positioned(
          top: 117,
          left: 15,
          child: Text(
            "Welcome Back!",
                style: TextStyle(
                  color: primarycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
          ),
          ),
        ),
        const Email(),
        const Password(),
        Button(size: size),
        Positioned(
          top: 430,
          child: GestureDetector(
                onTap: () {},
               child: const Text("Forgot Password?",
                 style: TextStyle(
                      color: hintsecondarycolor,
                   fontWeight: FontWeight.bold,
                 ),
               ),
          ),
        ),
        Positioned(
          top: 460,
          child: GestureDetector(
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUp();
                },
              ),
            );
            },
            child: const Text("Sign Up",
              style: TextStyle(
                color: secondarycolor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
            ),
          ),
        ),
      ],
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/signin/email.dart';
import 'package:waterquality_app/password.dart';
import 'package:waterquality_app/sign_in_button.dart';

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
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "assets/images/img.png",
            width: size.width * 0.5,
          ),
        ),
        Positioned(
          top: 100,
          right: 0,
          child: Image.asset(
            "assets/images/img_2.png",
            width: size.width * 0.32,
          ),
        ),
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
      ],
      ),
    );
  }
}


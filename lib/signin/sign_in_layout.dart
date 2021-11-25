import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';

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
        Positioned(
          child: TextField(
           decoration: InputDecoration(
             filled: true,
              fillColor: textcolor,
              hintText: "Email",
             hintStyle: const TextStyle(
               color: hintcolor,
             ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: transparent),
            ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}
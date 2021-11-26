import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 380,
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 20,
              spreadRadius: -20,
              offset: const Offset(0, 19),
            ),
          ],
        ),
        child: TextField(
          obscureText: true,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            filled: true,
            fillColor: textcolor,
            hintText: "Confirm Password",
            hintStyle: const TextStyle(
              color: hintcolor,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
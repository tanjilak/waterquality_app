import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';

class Email extends StatelessWidget {
  const Email({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
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
          decoration: InputDecoration(

            filled: true,
            fillColor: textcolor,
            hintText: "Email",
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

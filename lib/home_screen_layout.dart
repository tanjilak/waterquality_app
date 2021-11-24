import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
      Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
          children:<Widget>[
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/img_1.png")
            ),
            const Positioned(
              top: 25,
              child: Text(
                "SMART WATER QUALITY MONITOR",
                style: TextStyle(
                  color: secondarycolor,
                  fontWeight: FontWeight.bold,
              ),
            ),
            ),
          ],
      ),
      );
  }
}
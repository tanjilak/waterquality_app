import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waterquality_app/home/button.dart';

import 'button2.dart';

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

            Positioned(
              top: 120,
              left: 20,
              child: SvgPicture.asset(
                "assets/icons/faucet.svg",
                height: size.height * 0.26,
              ),
            ),
            const Positioned(
              bottom: 440,
              left: 20,
              child: Text(
                "Welcome!",
                    style: TextStyle(
                  color: primarycolor,
                  fontWeight: FontWeight.bold,
                        fontSize: 48,
              ),
              ),
            ),
            Button(size: size),
            Button2(size: size),
            const Positioned(
              bottom: 25,
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


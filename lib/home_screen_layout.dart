import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Positioned(
              top: 104,
              left: 20,
              child: SvgPicture.asset(
                "assets/icons/beverage.svg",
                height: size.height * 0.3,
              ),
            ),
            const Positioned(
              top: 300,
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
            Container(
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
                  ),
            ),
            ),
          ],
      ),
      );
  }
}
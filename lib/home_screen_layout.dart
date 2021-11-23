import 'package:flutter/material.dart';

class HomeScreenLayout extends StatelessWidget{
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
          children:<Widget>[Positioned(child: Image.asset("assets/images/img_1.png"))],
      ),
      );
  }
}
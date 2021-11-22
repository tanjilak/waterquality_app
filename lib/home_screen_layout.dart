import 'package:flutter/material.dart';

class HomeScreenLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
          children:<Widget>[Positioned(child: Image.asset("assets/images/img.png"))],
      ),
      );
  }
}
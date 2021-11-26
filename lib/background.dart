import 'package:flutter/material.dart';


class Background2 extends StatelessWidget {
  const Background2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      right: 0,
      child: Image.asset(
        "assets/images/img_2.png",
        width: size.width * 0.32,
      ),
    );
  }
}

class Background1 extends StatelessWidget {
  const Background1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Image.asset(
        "assets/images/img.png",
        width: size.width * 0.5,
      ),
    );
  }
}
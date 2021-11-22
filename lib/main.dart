import 'package:flutter/material.dart';
import 'package:waterquality_app/home_screen.dart';
import 'package:waterquality_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Water Quality Monitor',
      theme: ThemeData(
        primaryColor: primarycolor,
        scaffoldBackgroundColor:Colors.white,

      ),
      home: HomeScreen(),
    );
  }
}


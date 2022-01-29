import 'package:flutter/material.dart';
import 'package:waterquality_app/home/home_screen.dart';
import 'package:waterquality_app/constants.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Water Quality Monitor',
      theme: ThemeData(
        primaryColor: primarycolor,
        scaffoldBackgroundColor:Colors.white,


      ),
      home: const HomeScreen(),
    );
  }
}


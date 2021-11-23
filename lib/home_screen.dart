import 'package:flutter/material.dart';
import 'package:waterquality_app/home_screen_layout.dart';

//home screen
class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(body: HomeScreenLayout());
  }
}
import 'package:flutter/material.dart';
import 'package:waterquality_app/signup/sign_up_layout.dart';

class SignUp extends StatelessWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SignUpLayout(),
    );
  }
}
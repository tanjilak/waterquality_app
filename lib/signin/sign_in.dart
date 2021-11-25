import 'package:flutter/material.dart';
import 'package:waterquality_app/signin/sign_in_layout.dart';

class SignIn extends StatelessWidget{
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SignInLayout(),
    );
  }
}


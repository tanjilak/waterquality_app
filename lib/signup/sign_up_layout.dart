import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/background.dart';
import 'package:waterquality_app/email.dart';
import 'package:waterquality_app/password.dart';
import 'package:waterquality_app/signup/confirm_password.dart';
import 'package:waterquality_app/signup/sign_up_button.dart';
import 'package:waterquality_app/signin/sign_in.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Background1(size: size),
              Background2(size: size),
              const Positioned(
                top: 117,
                left: 15,
                child: Text("Create an account",
                  style: TextStyle(
                    color: primarycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              const Email(),
              const Password(),
              const ConfirmPassword(),
              Button2(size: size),
              Positioned(
                top: 515,
                left: 25,
                child: GestureDetector(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context){
                        return const SignIn();
                      },
                    ),
                  );
                  },
                  child: const Text("Already have an account?",
                    style: TextStyle(
                      color: hintsecondarycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
        ),
    );
  }
}


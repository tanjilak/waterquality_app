import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/background.dart';
import 'package:waterquality_app/signup/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:waterquality_app/entry_page.dart';

import '../entry_page.dart';

class SignInLayout extends StatefulWidget {
  const SignInLayout({Key? key,}) : super(key: key);

  @override
  State<SignInLayout> createState() => _SignInLayoutState();
}

class _SignInLayoutState extends State<SignInLayout> {
  final _formKey = GlobalKey<FormState>();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

//firebase
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
      alignment: Alignment.center,
        key: _formKey,
      children: <Widget>[
        Background1(size: size),
        Background2(size: size),
        const Positioned(
          top: 135,
          left: 15,
          child: Text(
            "Welcome Back!",
                style: TextStyle(
                  color: primarycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
          ),
          ),
        ),


        //email
        Positioned(
          top: 200,
          child: Container(
            width: 280,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 20,
                  spreadRadius: -20,
                  offset: const Offset(0, 19),
                ),
              ],
            ),
            child: TextFormField(
              autofocus: false,
              controller: emailController,
              onSaved: (value){
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: textcolor,
                hintText: "Email",
                hintStyle: const TextStyle(
                  color: hintcolor,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),


        //password
        Positioned(
          top: 290,
          child: Container(
            width: 280,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 20,
                  spreadRadius: -20,
                  offset: const Offset(0, 19),
                ),
              ],
            ),
            child: TextFormField(
              controller: passwordController,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Enter a valid password");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter a valid password");
                }
              },
              onSaved: (value){
                passwordController.text = value!;
              },
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                filled: true,
                fillColor: textcolor,
                hintText: "Password",
                hintStyle: const TextStyle(
                  color: hintcolor,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),

        //SIGN IN BUTTON
      Positioned(
        top: 370,
        width: 280,
        child: ElevatedButton(
          onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const EntryPage();
              },
            ),
          );
          },
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
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(13))
          ),
        ),
      ),


        //FORGOT PASS??
        Positioned(
          top: 430,
          child: GestureDetector(
                onTap: () {},
               child: const Text("Forgot Password?",
                 style: TextStyle(
                      color: hintsecondarycolor,
                   fontWeight: FontWeight.bold,
                 ),
               ),
          ),
        ),


        //GO TO SIGN UP PAGE
        Positioned(
          top: 460,
          child: GestureDetector(
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUp();
                },
              ),
            );
            },
            child: const Text("Sign Up",
              style: TextStyle(
                color: secondarycolor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
            ),
          ),
        ),
      ],
      ),
    );
  }




}


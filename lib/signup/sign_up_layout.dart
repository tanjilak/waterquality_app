import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/background.dart';
import 'package:waterquality_app/signin/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waterquality_app/entry_page.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({Key? key,}) : super(key: key);

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailForm = TextEditingController();
  final TextEditingController passwordForm = TextEditingController();


  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

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
                top: 135,
                left: 15,
                child: Text("Create an account",
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
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TextFormField(
              controller: emailForm,
              onSaved: (value){
                emailForm.text = value!;
              },
              decoration: const InputDecoration(

                filled: true,
                fillColor: textcolor,
                hintText: "Email",
                hintStyle: TextStyle(
                  color: hintcolor,

                ),
                border: OutlineInputBorder(
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
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: TextFormField(
              controller: passwordForm,

              onSaved: (value){
                passwordForm.text = value!;
              },
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                filled: true,
                fillColor: textcolor,
                hintText: "Password",
                hintStyle: TextStyle(
                  color: hintcolor,

                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),

              //SIGN UP BUTTON
      Positioned(
        top: 370,
        width: 280,
        child: ElevatedButton(
          onPressed: () async {

            final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailForm.text, password: passwordForm.text,);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const EntryPage();
                },
              ),
            );
            setState(() {});
          },

          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(

              backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15))
          ),
        ),
      ),

              Positioned(
                top: 430,
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


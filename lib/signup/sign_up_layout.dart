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

  final TextEditingController name = TextEditingController();
  final TextEditingController emailForm = TextEditingController();
  final TextEditingController passwordForm = TextEditingController();


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
              controller: emailForm,
              onSaved: (value){
                emailForm.text = value!;
              },
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

        //name
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
              controller: name,
              onSaved: (value){
                name.text = value!;
              },
              decoration: InputDecoration(

                filled: true,
                fillColor: textcolor,
                hintText: "Name",
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
          top: 380,
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
              controller: passwordForm,
              onSaved: (value){
                passwordForm.text = value!;
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

              //SIGN UP BUTTON
      Positioned(
        top: 465,
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

              Positioned(
                top: 520,
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


import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/background.dart';
import 'package:waterquality_app/data/display.dart';
import 'package:waterquality_app/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignInLayout extends StatefulWidget {
  const SignInLayout({Key? key,}) : super(key: key);

  @override
  State<SignInLayout> createState() => _SignInLayoutState();
}

class _SignInLayoutState extends State<SignInLayout> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';


  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Form(
        key: _key,
      child: Stack(
      alignment: Alignment.center,

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
            decoration: const BoxDecoration(

            ),
            child: TextFormField(
              autofocus: false,
              controller: emailController,
              validator: validateEmail,
              onSaved: (value){
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                filled: true,
                fillColor: textcolor,
                hintText: "Email",
                hintStyle: TextStyle(
                  color: hintcolor,

                ),
                border: OutlineInputBorder(

                  borderSide: BorderSide(color: Colors.black54),
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

            ),
            child: TextFormField(
              controller: passwordController,
              validator: validatePassword,
              onSaved: (value){
                passwordController.text = value!;
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

                  borderSide: BorderSide(color: Colors.black54),
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
          onPressed: () async {
            setState((){
              errorMessage ='';});

          if(_key.currentState!.validate()) {
             try {
              final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                 email: emailController.text,
                 password: passwordController.text,
               );

               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) {
                     return const DisplayPage();
                   },
                 ),
               );
             } on FirebaseAuthException catch(error){
               errorMessage = error.message!;


             }

          }

          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: ButtonStyle(

              backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15)),
          ),
        ),
      ),




        //GO TO SIGN UP PAGE
        Positioned(
          top: 430,
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

        Positioned(
          top: 490,
          child:  SizedBox(
            height: 200,
            width: 280,
            child: Text(errorMessage,
            style: const TextStyle(
              color: Colors.red,
            ),),
          ),
        ),

      ],
      ),
      ),
    );
  }

}

String? validateEmail(String? formEmail){
  if (formEmail == null || formEmail.isEmpty) {
    return 'Please enter an Email Address';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);

  if(!regex.hasMatch(formEmail)) {
    return 'Invalid Email Address';
  }
  return null;

}

String? validatePassword(String? formPassword){
  if (formPassword == null || formPassword.isEmpty){
    return 'Please enter a Password';
  }

  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regex = RegExp(pattern);

  if(!regex.hasMatch(formPassword)){
    return 'Password needs to be at least 6 characters; '
        'Add an uppercase letter, a symbol, and a number in password';
  }
  return null;
}
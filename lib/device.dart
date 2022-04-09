import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/display.dart';

import 'entry_page.dart';
import 'home/home_screen.dart';

//https://flutter-examples.com/flutter-online-user-login-using-php-mysql-api/

//make it into a form
//validation to see the data

class DeviceDetails extends StatefulWidget{
  const DeviceDetails({Key? key, }): super(key: key);
  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {

  bool visible = false;

  final nameController = TextEditingController();
  final locationController = TextEditingController();

  Future deviceAuthentication() async{
    setState((){
      visible = true;
    });

    String name = nameController.text;
    String location = locationController.text;

    var url = "http://h2ocapstone2022.ddns.net:9999/device1.php";
    var data = {'name': name, 'location': location};
    http.Response response = await http.post(Uri.parse(url), body: json.encode(data));

    var message = jsonDecode(response.body);

    if(message == 'Device Details Matched'){
      setState(() {
        visible = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const DisplayPage();
          },
        ),
      );
    }else{
      setState(() {
        visible = false;
      });


      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: <Widget>[
              OutlinedButton(
                child: const Text("Try Again"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

  }



  final GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: hintsecondarycolor,
        toolbarHeight: 40,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            UserAccountsDrawerHeader(

              decoration: const BoxDecoration(
                color: hintsecondarycolor,
              ),
              accountEmail:  Text("${FirebaseAuth.instance.currentUser!.email}"),
              accountName: null,
              currentAccountPicture: const CircleAvatar(
                child: Text("T"),
                backgroundColor: Colors.white,
              ),
            ),

            ListTile(
              title: const Text('Settings', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EntryPage();
                  },
                ),
              );

              },
            ),
            ListTile(
              title: const Text('Device', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: (){ Navigator.pop(context);},
            ),
            ListTile(
              title: const Text('Sign Out', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: () async{
                await FirebaseAuth.instance.signOut();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
        body:
        Form(
          key: _key,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Connect to a Device",
                  style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold,
                    color: primarycolor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Device Details",
                  style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: hintsecondarycolor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Device Name",
                  style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(

                  controller: nameController,

                  decoration: const InputDecoration(

                    hintText: "Enter Device Name (Ex: Arduino UNO)",
                    hintStyle: TextStyle(
                      color: hintcolor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(

                  "Location",
                  style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(

                controller: locationController,


                  decoration: const InputDecoration(
                    hintText: "Enter Location of Device",
                    hintStyle: TextStyle(
                      color: hintcolor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                OutlinedButton(
                  child: const Text(
                    "Connect to Device",
                    style: TextStyle(
                      color: primarycolor,
                    ),
                  ),
                  onPressed: () {
                        deviceAuthentication();
                   },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),



                ),
                const SizedBox(height: 10),
                Visibility(
                    visible: visible,
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        child: const CircularProgressIndicator()
                    )
                ),

              ],
          ),
        ),
        ),
    );
  }

  }
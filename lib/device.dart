import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/display.dart';

import 'entry_page.dart';
import 'home/home_screen.dart';


//make it into a form
//validation to see the data

class DeviceDetails extends StatefulWidget{
  const DeviceDetails({Key? key, }): super(key: key);
  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  final TextEditingController deviceForm = TextEditingController();
  final TextEditingController iPForm = TextEditingController();

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
              title: const Text('Home', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DisplayPage();
                  },
                ),
              );},
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

                  controller: deviceForm,
                    onSaved: (value){
                    deviceForm.text = value!;
                    },
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

                  "Serial Number",
                  style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(

                  controller: iPForm,
                  onSaved: (value){
                  iPForm.text = value!;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Serial Number of Device",
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
                    Map<String, dynamic> data = {"device": {
                      "device_name": deviceForm.text,
                      "ip_address": iPForm.text,},};


                    showDialog(
                              context: context,
                              builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Connected Device'),
                                  content: SingleChildScrollView(
                                  child: ListBody(
                                       children: <Widget>[
                                         Card(
                                           elevation: 1,
                                           child: ListTile(
                                             title: Text(deviceForm.text),
                                             subtitle: Text(iPForm.text),
                                             trailing:  OutlinedButton(
                                               onPressed: () {   Navigator.push(
                                                 context,
                                                 MaterialPageRoute(
                                                   builder: (context) {
                                                     return const DisplayPage();
                                                   },
                                                 ),
                                               ); },
                                               child: const Text('Data', style: TextStyle(
                                                 color: primarycolor,
                                               ),),
                                               style: OutlinedButton.styleFrom(
                                                 padding: const EdgeInsets.all(20),
                                               ),
                                             ),
                                           ),

                                         ),
                                       ],
                                  ),
                                  ),
                              );
                              },
                    );





                   },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),



                ),
                const SizedBox( height: 20,),

              ],
          ),
        ),
        ),
    );
  }
  }
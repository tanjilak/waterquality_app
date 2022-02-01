import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/display.dart';

import 'entry_page.dart';
import 'home/home_screen.dart';

class DeviceDetails extends StatefulWidget{
  const DeviceDetails({Key? key, }): super(key: key);
  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
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
        SingleChildScrollView(
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
                  decoration: const InputDecoration(
                    hintText: "Enter Device Name (Ex: Raspberry PI 3)",
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
                  "IP Address",
                  style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter IP Address of Device",
                    hintStyle: TextStyle(
                      color: hintcolor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                OutlinedButton(
                  child: const Text(
                    "Save All and Continue",
                    style: TextStyle(
                      color: primarycolor,
                    ),
                  ),
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DisplayPage();
                      },
                    ),
                  ); },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ],
          ),
        ),
        ),
    );
  }
  }
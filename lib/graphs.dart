import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/device.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'constants.dart';
import 'display.dart';
import 'entry_page.dart';
import 'home/home_screen.dart';
import 'dart:io';

class Graphs extends StatefulWidget{
  const Graphs({Key? key, }): super(key: key);
  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: hintsecondarycolor,
        toolbarHeight: 40,
        title: const Text("Building RLC, Room 302"),
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
              title: const Text('Connect to a New Device', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DeviceDetails();
                  },
                ),
              ); },
            ),
            ListTile(
              title: const Text('Numerical Data', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: (){ Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DisplayPage();
                  },
                ),
              ); },

            ),
            ListTile(
              title: const Text('Graphs', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: (){Navigator.pop(context);},
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
              title: const Text('Sign Out', style: TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500,
              ),),
              onTap: () async {
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
            ),
          ],
        ),
      ),
      body:

             InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse("http://h2ocapstone2022.ddns.net:9999/charts/temperature_chart.php"),
              ),
              initialOptions: InAppWebViewGroupOptions(
               android: AndroidInAppWebViewOptions(
                 useHybridComposition: true,
             ),
             ),),




    );
  }
}


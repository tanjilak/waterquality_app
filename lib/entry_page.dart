import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/device.dart';
import 'package:waterquality_app/display.dart';

import 'constants.dart';
import 'home/home_screen.dart';


class EntryPage extends StatefulWidget{
  const EntryPage({Key? key, }): super(key: key);
  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context){

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
            DrawerHeader(
              decoration: const BoxDecoration(
                color: hintsecondarycolor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(height: 20,),
                  Text("Name", style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height:10,),
                  Text("Email", style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w700,
                  ),),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home', style: TextStyle(
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
              title: const Text('Device', style: TextStyle(
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

      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold,
                  color: primarycolor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Name",
                style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Update Name",
                  hintStyle: TextStyle(
                    color: hintcolor,
                    fontSize: 15,
                  ),),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500,
        ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Update Email",
                  hintStyle: TextStyle(
                    color: hintcolor,
                    fontSize: 15,
                  ),),
              ),
              const SizedBox(
                height: 30,
              ),
                const Text(
                  "Password",
                      style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500,
                ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Change Password",
                    hintStyle: TextStyle(
                      color: hintcolor,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),


              OutlinedButton(
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DeviceDetails();
                    },
                  ),
                );
                },
                child: const Text("Connect to a Device",

                  style: TextStyle(
                    color: primarycolor,
                  ),),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),

                ),
              ),
                const SizedBox(
                  height: 20,
                ),
              OutlinedButton(
                child: const Text(
                  "Save All",
                  style: TextStyle(
                    color: primarycolor,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DisplayPage();
                      },
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
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
                child: const Text('Sign Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(13)),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}


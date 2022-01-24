import 'package:flutter/material.dart';
import 'package:waterquality_app/device.dart';

import 'constants.dart';


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
      body:


      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height:40,
              ),
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
                child: const Text(
                  "Save All",
                  style: TextStyle(
                    color: primarycolor,
                  ),
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
                const SizedBox(
                  height: 20,
                ),
              OutlinedButton(
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DeviceDetails();
                    },
                  ),
                );  },
                child: const Text("Connect to a Device",

                  style: TextStyle(
                    color: primarycolor,
                  ),),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),

                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {  },
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


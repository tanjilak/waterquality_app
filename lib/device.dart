import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/display.dart';

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
import 'package:flutter/material.dart';


class EntryPage extends StatefulWidget{
  const EntryPage({Key? key, }): super(key: key);
  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Name",
                style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500,
                ),
              ),

              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500,
        ),
              ),
              const SizedBox(
                height: 15,
              ),
                ActionChip(
                    label: const Text(
                        "Sign Out"
                    ),
                  onPressed: () {}
                ),
            ],
          ),
        ),
      ),
    );
  }
}


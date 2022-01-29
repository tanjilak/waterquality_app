import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/entry_page.dart';
import 'package:waterquality_app/home/home_screen.dart';


import 'device.dart';


class DisplayPage extends StatefulWidget{
  const DisplayPage({Key? key, }): super(key: key);
  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
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
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: hintsecondarycolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(height: 20,),

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
              )
            ],
          ),
        ),
        body:

        DefaultTabController(
          length: 5,
          child: Column(
            children:<Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
              constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(
                  isScrollable: true,
                  labelColor: primarycolor,
                  unselectedLabelColor: hintsecondarycolor,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text("pH",
                        ),
                      ),
                   ),

                    Tab( child: Container(
                      alignment: Alignment.center,
                      child: const Text("Chlorine",
                         ),
                    ),
                    ),

                    Tab( child: Container(
                      alignment: Alignment.center,
                      child: const Text("Conductivity",
                          ),
                    ),
                    ),

                    Tab( child: Container(
                      alignment: Alignment.center,
                      child: const Text("Temperature",
                        ),
                    ),
                    ),

                    Tab( child: Container(
                      alignment: Alignment.center,
                      child: const Text("Flow Rate",
                         ),
                    ),
                    ),
                  ] //tab
                ),
              ),

            Container(
              height: 30,
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
              ),
            ),

              Expanded(
                child: TabBarView(
                  children:[
                    Column(
                     children: <Widget>[
                       Container(
                         alignment: Alignment.center,
                         height: 200,
                        width: 280,
                         decoration: BoxDecoration(
                             border: Border.all(
                                 color: const Color(0x9900738C),

                             ),
                           borderRadius: BorderRadius.circular(50.0),
                           boxShadow: const [
                             BoxShadow(
                                 color: Color(0x40000000),
                                 blurRadius: 4,
                                 spreadRadius: 0,
                                 offset: Offset(0, 4)
                             ),
                           ],
                             color: Colors.white,

                         ),

                         child: const Text("ph"),
                       ),
                       const SizedBox(height: 20,),
                       OutlinedButton(
                         onPressed: () {},
                         child: const Text("Update",
                           style: TextStyle(
                             color: secondarycolor,
                             fontWeight: FontWeight.bold,
                             fontSize: 18,
                           ),
                         ),
                       ),
                     ],

                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("chlorine"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("conductivity"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("temp"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("flow"),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),

    );
  }
}
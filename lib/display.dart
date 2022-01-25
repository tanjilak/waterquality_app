import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';


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
        body:
        DefaultTabController(
          length: 5,
          child: Column(
            children:<Widget>[

              const SizedBox(
                height: 70,
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
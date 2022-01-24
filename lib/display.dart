import 'package:flutter/material.dart';
import 'constants.dart';

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
              height: 400, //height of TabBarView
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
              ),
            ),

            ],
          ),
        ),
    );
  }
}
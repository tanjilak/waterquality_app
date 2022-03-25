import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/entry_page.dart';
import 'package:waterquality_app/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:waterquality_app/ph_test.dart';
import 'package:waterquality_app/prediction.dart';
import 'dart:convert';


import 'device.dart';

//display page ONLY FOR ARDUINO UNO
//more display pages for other devices //same format //just different php files

class DisplayPage extends StatefulWidget{
  const DisplayPage({Key? key, }): super(key: key);
  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {

//MONDAY
  Future<List> getMethod() async{
    var theUrl = "http://h2ocapstone2022.ddns.net:9999/MorningData.php";
  http.Response response = await http.get(Uri.parse(theUrl));

  //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
  var data = json.decode(response.body);

  return data;
  }
  Future<List> getMethod2() async{
    var theUrl = "http://h2ocapstone2022.ddns.net:9999/AfternoonData.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }


  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
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
          length: 3,
          child: Column(
            children:<Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
              constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(

                  labelColor: primarycolor,
                  unselectedLabelColor: hintsecondarycolor,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text("Day",
                        ),
                      ),
                   ),

                    Tab( child: Container(
                      alignment: Alignment.center,
                      child: const Text("Week",
                         ),
                    ),
                    ),

                    Tab( child: Container(
                      alignment: Alignment.center,
                      child: const Text("Graphs",
                          ),
                    ),
                    ),




                  ] //tab
                ),
              ),

            Container(
              height: 20,
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
              ),
            ),

              Expanded(

                child: TabBarView(
                  children:[
                    PageView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                    children: <Widget>[
                      //MONDAY
                      //see if current monday could show
                    Column(
                     children: <Widget>[
                      const Text(
                          "Monday, 2/21/22",
                        style: TextStyle(
                          color: primarycolor,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                       const SizedBox(height:10,),
                       Container(
                         height: 5,
                         decoration: const BoxDecoration(
                             border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
                         ),
                       ),
                       const Text(
                         "Morning",
                         style: TextStyle(

                           fontWeight: FontWeight.w500,
                           fontSize: 18,
                         ),
                       ),

                       const SizedBox(height: 13),

                       Container(
                         alignment: Alignment.center,
                         height: 150,
                         width: 290,
                         decoration: BoxDecoration(
                           border: Border.all(
                             color: const Color(0x9900738C),

                           ),

                           boxShadow: const [
                             BoxShadow(
                                 color: Color(0x40000000),
                                 blurRadius: 4,
                                 spreadRadius: 0,
                                 offset: Offset(0, 4)
                             ),
                           ],
                             color: hintsecondarycolor,

                         ),


                         child: FutureBuilder<List>(
                           future: getMethod(),
                             builder: (context, snapshot) {
                               if (snapshot.connectionState == ConnectionState.done) {
                                 if (snapshot.hasData) {

                                     // Success case
                                     return ListView.builder(
                                       itemBuilder: (context, index) {
                                         return Card(
                                           elevation: 5,
                                           child: ListTile(
                                             title:
                                             Container(
                                               padding: const EdgeInsets
                                                   .fromLTRB(0, 5, 0, 0),
                                               child: Text("Time: ${snapshot
                                                   .data![index]['time']} AM",
                                                 style: const TextStyle(
                                                   fontWeight: FontWeight.w500,
                                                   color: secondarycolor,
                                                 ),),),

                                             subtitle:
                                             Column(
                                               mainAxisAlignment: MainAxisAlignment
                                                   .start,
                                               crossAxisAlignment: CrossAxisAlignment
                                                   .start,
                                               children: <Widget>[

                                                 Text("Temperature: ${snapshot
                                                     .data![index]['temp']} °C",
                                                   style: const TextStyle(
                                                     color: Colors.black,
                                                   ),),
                                                 Text("pH Value: ${snapshot
                                                     .data![index]['ph']}",
                                                   style: const TextStyle(
                                                     color: Colors.black,
                                                   ),),
                                                 Text("ORP Value: ${snapshot
                                                     .data![index]['orp']}",
                                                   style: const TextStyle(
                                                     color: Colors.black,
                                                   ),),
                                               ],

                                             ),

                                           ),
                                         );
                                       },
                                       itemCount: snapshot.data!.length,
                                     );

                                 }
                                 // Error case
                                 return const Text('Not Available Yet');
                               } else {

                                 return const Center(
                                   child: CircularProgressIndicator(),
                                 );
                               }
                             }

                         ),

                       ),


                       const SizedBox(height: 40,),
                       const Text(
                         "Afternoon",
                         style: TextStyle(

                           fontWeight: FontWeight.w500,
                           fontSize: 18,
                         ),
                       ),

                       const SizedBox(height: 13),
                       Container(
                         alignment: Alignment.center,
                         height: 150,
                         width: 290,
                         decoration: BoxDecoration(
                           border: Border.all(
                             color: const Color(0x9900738C),

                           ),

                           boxShadow: const [
                             BoxShadow(
                                 color: Color(0x40000000),
                                 blurRadius: 4,
                                 spreadRadius: 0,
                                 offset: Offset(0, 4)
                             ),
                           ],
                           color: hintsecondarycolor,

                         ),


                         child: FutureBuilder<List>(
                             future: getMethod2(),
                             builder: (context, snapshot) {
                               if (snapshot.connectionState == ConnectionState.done) {
                                 if (snapshot.hasData) {

                                   // Success case
                                   return ListView.builder(
                                     itemBuilder: (context, index) {
                                       return Card(
                                         elevation: 5,
                                         child: ListTile(
                                           title:
                                           Container(
                                             padding: const EdgeInsets
                                                 .fromLTRB(0, 5, 0, 0),
                                             child: Text("Time: ${snapshot
                                                 .data![index]['time']} PM",
                                               style: const TextStyle(
                                                 fontWeight: FontWeight.w500,
                                                 color: secondarycolor,
                                               ),),),

                                           subtitle:
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment
                                                 .start,
                                             crossAxisAlignment: CrossAxisAlignment
                                                 .start,
                                             children: <Widget>[

                                               Text("Temperature: ${snapshot
                                                   .data![index]['temp']} °C",
                                                 style: const TextStyle(
                                                   color: Colors.black,
                                                 ),),
                                               Text("pH Value: ${snapshot
                                                   .data![index]['ph']}",
                                                 style: const TextStyle(
                                                   color: Colors.black,
                                                 ),),
                                               Text("ORP Value: ${snapshot
                                                   .data![index]['orp']}",
                                                 style: const TextStyle(
                                                   color: Colors.black,
                                                 ),),
                                             ],

                                           ),

                                         ),
                                       );
                                     },
                                     itemCount: snapshot.data!.length,
                                   );

                                 }
                                 // Error case
                                 return const Text('Not Available Yet');
                               } else {

                                 return const Center(
                                   child: CircularProgressIndicator(),
                                 );
                               }
                             }

                         ),

                       ),


                       const SizedBox(height: 20,),

                     ],

                    ),
                      //TUESDAY
                      Column(
                        children: <Widget>[
                          const Text(
                            "Tuesday, 2/22/22",
                            style: TextStyle(
                              color: primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height:10,),
                          Container(
                            height: 5,
                            decoration: const BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
                            ),
                          ),
                          const Text(
                            "Morning",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),

                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} AM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 40,),
                          const Text(
                            "Afternoon",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod2(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} PM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 20,),

                        ],

                      ),
                      //WEDNESDAY
                      Column(
                        children: <Widget>[
                          const Text(
                            "Wednesday, 2/23/22",
                            style: TextStyle(
                              color: primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height:10,),
                          Container(
                            height: 5,
                            decoration: const BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
                            ),
                          ),
                          const Text(
                            "Morning",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),

                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} AM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 40,),
                          const Text(
                            "Afternoon",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod2(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} PM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 20,),

                        ],

                      ),
                      //THURSDAY
                      Column(
                        children: <Widget>[
                          const Text(
                            "Thursday, 2/24/22",
                            style: TextStyle(
                              color: primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height:10,),
                          Container(
                            height: 5,
                            decoration: const BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
                            ),
                          ),
                          const Text(
                            "Morning",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),

                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} AM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 40,),
                          const Text(
                            "Afternoon",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod2(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} PM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 20,),

                        ],

                      ),
                      //FRIDAY
                      Column(
                        children: <Widget>[
                          const Text(
                            "Friday, 2/25/22",
                            style: TextStyle(
                              color: primarycolor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height:10,),
                          Container(
                            height: 5,
                            decoration: const BoxDecoration(
                                border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
                            ),
                          ),
                          const Text(
                            "Morning",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),

                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} AM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 40,),
                          const Text(
                            "Afternoon",
                            style: TextStyle(

                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 13),
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            width: 290,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0x9900738C),

                              ),

                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)
                                ),
                              ],
                              color: hintsecondarycolor,

                            ),


                            child: FutureBuilder<List>(
                                future: getMethod2(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {

                                      // Success case
                                      return ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Card(
                                            elevation: 5,
                                            child: ListTile(
                                              title:
                                              Container(
                                                padding: const EdgeInsets
                                                    .fromLTRB(0, 5, 0, 0),
                                                child: Text("Time: ${snapshot
                                                    .data![index]['time']} PM",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: secondarycolor,
                                                  ),),),

                                              subtitle:
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[

                                                  Text("Temperature: ${snapshot
                                                      .data![index]['temp']} °C",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("pH Value: ${snapshot
                                                      .data![index]['ph']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                  Text("ORP Value: ${snapshot
                                                      .data![index]['orp']}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),),
                                                ],

                                              ),

                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data!.length,
                                      );

                                    }
                                    // Error case
                                    return const Text('Not Available Yet');
                                  } else {

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }

                            ),

                          ),


                          const SizedBox(height: 20,),

                        ],

                      ),
                      ],
                    ),

                  SingleChildScrollView(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text("Week 1",  style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: primarycolor,
                        ),),
                        const SizedBox(height:5,),
                        Container(
                          height: 5,
                          decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.grey, width: 0.2))
                          ),
                        ),
                        const Text("pH",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,),
                        ),
                        const SizedBox(height:10,),
                        Container(
                          height: 150,
                          width: 340,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0x9900738C),
                            ),
                          ),


                          child: const phTable(),
                        ),

                        const Prediction(),
                        const SizedBox(height:10,),
                        Container(
                          height: 10,
                          decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                          ),
                        ),
                        const Text("Temperature",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),
                        ),
                      ],
                    ),
                  ),



                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child: const Text("insert graphs"),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterquality_app/constants.dart';
import 'package:waterquality_app/settings.dart';
import 'package:waterquality_app/data/graphs.dart';
import 'package:waterquality_app/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:waterquality_app/data/week.dart';
import 'dart:convert';

import '../device.dart';
import 'forecast.dart';


//display page ONLY FOR ARDUINO MEGA //ROOM 302 IN RLC

//more display pages for other devices //same format //just different php files

class DisplayPage extends StatefulWidget{
  const DisplayPage({Key? key, }): super(key: key);
  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {


  //LATESt VALUE
  Future<List> getLatest() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/latest_value.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  Future<List> getAll() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/AllData.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  //different getmethods for each day
//MONDAY
  Future<List> getMethod() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/MondayStagnantWater.php";
  http.Response response = await http.get(Uri.parse(theUrl));

  //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
  var data = json.decode(response.body);

  return data;
  }
  Future<List> getMethod2() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/MondayFlowingWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  //Tuesday
  Future<List> getMethod3() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/TuesdayStagnantWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }
  Future<List> getMethod4() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/TuesdayFlowingWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  //Wednesday
  Future<List> getMethod5() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/WednesdayStagnantWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }
  Future<List> getMethod6() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/WednesdayFlowingWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  //Thursday
  Future<List> getMethod7() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/ThursdayStagnantWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }
  Future<List> getMethod8() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/ThursdayFlowingWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  //Friday
  Future<List> getMethod9() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/FridayStagnantWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }
  Future<List> getMethod10() async{
    var theUrl = "https://h2ocapstone2022.ddns.net:9999/app_data/FridayFlowingWater.php";
    http.Response response = await http.get(Uri.parse(theUrl));

    //  var res = await http.get(Uri.parse(theUrl),headers: {"Accept:":"application/json"});
    var data = json.decode(response.body);

    return data;
  }

  late Future<List> _getLatest;

  @override
  void initState() {
    super.initState();
    _getLatest = getLatest();
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
                onTap: (){Navigator.pop(context);},
              ),
              ListTile(
                title: const Text('Graphs', style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.w500,
                ),),
                onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Graphs();
                    },
                  ),
                ); },
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

       DefaultTabController(
          length: 4,
          child: Column(
            children:<Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
              constraints: const BoxConstraints.expand(height: 50),
                //tab bar names
                child: TabBar(

                  labelColor: primarycolor,
                  unselectedLabelColor: hintsecondarycolor,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text("Data",

                        ),
                      ),
                    ),
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
                      child: const Text("Forecast",
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
                  //latest
                    buildColumn(),
                    //day tab
                    buildPageView(controller),
                  const Week(),
                  const Forecast(),
                  ]
                ),
              ),
            ],
          ),
        ),

    );
  }

  Column buildColumn() {
    return Column(
                    children: <Widget>[
                      buildElevatedButton(),
                      const SizedBox(height: 10,),
                      Container(
                        height: 10,
                        decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text("Latest Value",  style: TextStyle(
                        color: primarycolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),),
                      const SizedBox(height:20),
                      Container(
                          alignment: Alignment.center,
                          height: 180,
                          width: 300,

                        child:
                        FutureBuilder<List>(
                            future: getLatest(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {

                                  // Success case
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: const BorderSide(
                                            color: hintsecondarycolor,
                                            width:5.0,
                                          ),
                                        ),
                                        color: blueblue,
                                        elevation: 5,
                                        child: ListTile(
                                          title:
                                          Container(
                                            padding: const EdgeInsets
                                                .fromLTRB(0,10, 0, 20),
                                            child: Text("Time: ${snapshot
                                                .data![index]['reading_time']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 30,
                                              ),),),

                                          subtitle:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[

                                              Text("Temperature: ${snapshot
                                                  .data![index]['Temp']} °C",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),),
                                              Text("pH: ${snapshot
                                                  .data![index]['Ph']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),),
                                              Text("ORP: ${snapshot
                                                  .data![index]['ORP']} mV",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),),
                                              const Text("     "),
                                            ],

                                          ),

                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data!.length,
                                  );

                                }
                                // Error case
                                return const Text('Error');
                              } else {

                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }

                        ),


                      ),
                      const SizedBox(height:15),
                      Container(
                        height: 10,
                        decoration: const BoxDecoration(
                            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                        ),
                      ),
                      const Text("All Data",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,),
                      ),
                      const SizedBox(height:10),
                      Container(
                        alignment: Alignment.center,
                        height: 250,
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
                            future: getAll(),
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
                                            child: Text("Date: ${snapshot
                                                .data![index]['date']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),),),

                                          subtitle:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[
                                              Text("Time: ${snapshot
                                                  .data![index]['reading_time']}",
                                                style: const TextStyle(
                                                  color: secondarycolor,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text("Temperature: ${snapshot
                                                  .data![index]['Temp']} °C",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),),
                                              Text("pH Value: ${snapshot
                                                  .data![index]['Ph']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),),
                                              Text("ORP Value: ${snapshot
                                                  .data![index]['ORP']} mV",
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
                     ],);
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _getLatest = getLatest();
                        });
                      },
                      child: Text('Update Data'.toUpperCase()),
                      style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.all<Color>(primarycolor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),

                              )
                          ),
                      ),
                    );
  }

  PageView buildPageView(PageController controller) {
    return PageView(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                  children: <Widget>[

                    //SHOW ONLY ONE WEEK (THE CURRENT WEEK)
                    //UPDATES NEW WEEK IF MONDAY HAS NEW VALUES

                    //MONDAY
                    Column(
                   children: <Widget>[
                    const Text(
                        "Monday",
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
                     const SizedBox(height: 10,),
                     const Text(
                       "Stagnant Water",
                       style: TextStyle(

                         fontWeight: FontWeight.w500,
                         fontSize: 18,
                       ),
                     ),

                     const SizedBox(height: 13),

                     Container(
                       alignment: Alignment.center,
                       height: 190,
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
                                             child: Text("Date: ${snapshot
                                                 .data![index]['date']}",
                                               style: const TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.black,
                                               ),),),

                                           subtitle:
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment
                                                 .start,
                                             crossAxisAlignment: CrossAxisAlignment
                                                 .start,
                                             children: <Widget>[
                                               Text("Time: ${snapshot
                                                   .data![index]['reading_time']}",
                                                 style: const TextStyle(
                                                   color: secondarycolor,
                                                   fontWeight: FontWeight.bold,
                                                 ),),
                                               Text("Temperature: ${snapshot
                                                   .data![index]['Temp']} °C",
                                                 style: const TextStyle(
                                                   color: Colors.black,
                                                 ),),
                                               Text("pH Value: ${snapshot
                                                   .data![index]['Ph']}",
                                                 style: const TextStyle(
                                                   color: Colors.black,
                                                 ),),
                                               Text("ORP Value: ${snapshot
                                                   .data![index]['ORP']} mV",
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
                       "Flowing Water",
                       style: TextStyle(

                         fontWeight: FontWeight.w500,
                         fontSize: 18,
                       ),
                     ),

                     const SizedBox(height: 13),
                     Container(
                       alignment: Alignment.center,
                       height: 190,
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
                                           child: Text("Date: ${snapshot
                                               .data![index]['date']}",
                                             style: const TextStyle(
                                               fontWeight: FontWeight.bold,
                                               color: Colors.black,
                                             ),),),

                                         subtitle:
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment
                                               .start,
                                           crossAxisAlignment: CrossAxisAlignment
                                               .start,
                                           children: <Widget>[
                                             Text("Time: ${snapshot
                                                 .data![index]['reading_time']}",
                                               style: const TextStyle(
                                                 color: secondarycolor,
                                                 fontWeight: FontWeight.bold,
                                               ),),
                                             Text("Temperature: ${snapshot
                                                 .data![index]['Temp']} °C",
                                               style: const TextStyle(
                                                 color: Colors.black,
                                               ),),
                                             Text("pH Value: ${snapshot
                                                 .data![index]['Ph']}",
                                               style: const TextStyle(
                                                 color: Colors.black,
                                               ),),
                                             Text("ORP Value: ${snapshot
                                                 .data![index]['ORP']} mV",
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


                     const SizedBox(height: 30,),

                     buildElevatedButton(),
                   ],

                  ),

                    //TUESDAY
                    Column(
                      children: <Widget>[
                        const Text(
                          "Tuesday",
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
                        const SizedBox(height: 10,),
                        const Text(
                          "Stagnant Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),

                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod3(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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
                          "Flowing Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),
                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod4(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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

                        const SizedBox(height: 30,),

                        buildElevatedButton(),

                      ],

                    ),

                    //WEDNESDAY
                    Column(
                      children: <Widget>[
                        const Text(
                          "Wednesday",
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
                        const SizedBox(height:10,),
                        const Text(
                          "Stagnant Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),

                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod5(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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
                          "Flowing Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),
                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod6(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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

                        const SizedBox(height: 30,),

                        buildElevatedButton(),

                      ],

                    ),

                    //THURSDAY
                    Column(
                      children: <Widget>[
                        const Text(
                          "Thursday",
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
                        const SizedBox(height:10,),
                        const Text(
                          "Stagnant Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),

                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod7(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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
                          "Flowing Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),
                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod8(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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
                                  return const Text('Not Available');
                                } else {

                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }

                          ),

                        ),

                        const SizedBox(height: 30,),

                        buildElevatedButton(),

                      ],

                    ),

                    //FRIDAY
                    Column(
                      children: <Widget>[
                        const Text(
                          "Friday",
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
                        const SizedBox(height:10),
                        const Text(
                          "Stagnant Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),

                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod9(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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
                          "Flowing Water",
                          style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 13),
                        Container(
                          alignment: Alignment.center,
                          height: 190,
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
                              future: getMethod10(),
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
                                              child: Text("Date: ${snapshot
                                                  .data![index]['date']}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),),

                                            subtitle:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Text("Time: ${snapshot
                                                    .data![index]['reading_time']}",
                                                  style: const TextStyle(
                                                    color: secondarycolor,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                Text("Temperature: ${snapshot
                                                    .data![index]['Temp']} °C",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("pH Value: ${snapshot
                                                    .data![index]['Ph']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),),
                                                Text("ORP Value: ${snapshot
                                                    .data![index]['ORP']} mV",
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

                        const SizedBox(height: 30,),

                        buildElevatedButton(),

                      ],

                    ),
                    ],
                  );
  }
}


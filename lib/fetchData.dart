
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//int timeScale = 24;

//get the json file
//Future<List<ApiData>> fetchApiData() async {
////  Map<String, dynamic> yeet = new Map<>
//  final response =
//  await http.get('http://188.166.24.214/data.php?key=group4&time=' + timeScale.toString());
//
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON.
////    return ApiData.fromJson(json.decode(response.body));
////    return compute(parseData, response.body);
//    return parseData(response.body);
////      parseData(response.body);
//  } else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load post');
//  }
//}

//put the data from the json in here
class ApiData {
  final String time ;
  final String temperature ;
  final String pressure ;
  final String ambientlight;

//  JSSONParser jsonParse
  ApiData({this.time, this.temperature, this.pressure, this.ambientlight});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
        time: json['time'] as String,
        temperature: json['temperature'] as String,
        pressure: json['pressure'] as String,
        ambientlight: json['ambientlight'] as String);

  }

}

////make variables form the json
//List<ApiData> parseData(String responseBody){
//
//  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//
//  return parsed.map<ApiData>((json) => ApiData.fromJson(json)).toList();
//}
//
////make the app
//void main() {
//  runApp(MyApp());
//}
//
////create the app
//class MyApp extends StatefulWidget {
//  MyApp({Key key}) : super(key: key);
//
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
////the actual building of the app
//class _MyAppState extends State<MyApp> {
//  Future<List<ApiData>> post;
//
//  @override
//  void initState() {
//    super.initState();
//    post = fetchApiData();
////    all = fetchApiData();
////    print(post.toString());
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'Fetch Data practice',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text('Fetch Data practice'),
//          ),
//          body: Center(
//
//            child: PageView(
//              children: <Widget>[
//                FutureBuilder<List<ApiData>>(
//                  future: post,
//                  builder: (context, oneDataPoint) {
//                    return Text("Time: " + oneDataPoint.data[0].time
//                        + "\n" + "Temprerature: " +
//                        oneDataPoint.data[0].temperature + "\n" + "Pressure: " +
//                        oneDataPoint.data[0].pressure.toString() + "\n" +
//                        "ambientlight: " +
//                        oneDataPoint.data[0].ambientlight.toString());
//
////                  if(oneDataPoint.hasData){
////                  }else
////                  {
////                    return CircularProgressIndicator();
////                  }
////              }
//                    // By default, show a loading spinner.
//                  },
//                ),
//              ],
//            ),
//          ),
//        ));
//  }
//}
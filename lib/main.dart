//http://188.166.24.214/data.php?key=group4&time=24
/***
Mobile App
PSE - GROUP 4
Quinten Nierkens / 466490@student.saxion.nl
Luciano Regis Orlandini / 460952@student.saxion.nl
Alexander Dymond / 452939@student.saxion.nl
Luc Grefte / 470173@student.saxion.nl
Tygo Verholen / 461941@student.saxion.nl
**/

/***
Name:       class LineChartPage()
Parameters:
Return:     List
Desc:       Fetches data in Json format and adds it to List the values
            specified by the column variable.
***/


import 'dart:async';
import 'dart:convert';
import 'line_chart_sample1.dart';

import 'fetchData.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

var primaryColor = Colors.white;
var secondaryColor = Colors.black;
List<ApiData> globalList;
//get the json file
Future<List<ApiData>> fetchApiData() async {
//  Map<String, dynamic> yeet = new Map<>
  var currDate = new DateTime.now();
  var enddate = new DateFormat("yyyy-MM-dd H:m:s").format(currDate);
  var startdate = new DateFormat("yyyy-MM-dd H:m:s").format(currDate.subtract(new Duration(days: 1)));
  final response =
  await http.get('http://188.166.24.214/data.php?key=group4&startdate=' + startdate + '&enddate=' + enddate);

  if (response.statusCode == 200) {

    // If the call to the server was successful, parse the JSON.
    return compute(parseData, response.body);

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}


//make variables form the json
List<ApiData> parseData(String responseBody){

  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ApiData>((json) => ApiData.fromJson(json)).toList();
}

//make the app
void main() {
  runApp(MyApp());
}

//create the app
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

//the actual building of the app
class _MyAppState extends State<MyApp> {
  Future<List<ApiData>> post;
  List<ApiData> listData;

  @override
  void initState() {
    super.initState();
    post = fetchApiData();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data practice',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Weather station'),
          ),
          body: Center(

            child: PageView(
              children: <Widget>[

                FutureBuilder<List<ApiData>>(
                  future: post,
                  builder: (context, dataPoints) {
                    if(dataPoints.hasData){
                      var a = PhotosList(myData : dataPoints.data);
                      listData =  a.myData;
                      globalList = listData;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 36.0,
                                top: 24,
                              ),
                              child: Text(
                                'Current data',
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text("Time: " + listData.last.time
                            + "\n" + "Temprerature: " +
                            listData.last.temperature + " °C"
                            + "\n" + "Pressure: " +
                            listData.last.pressure + " hPa"
                            + "\n" + "Ambientlight: " +
                            listData.last.ambientlight + "%",
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 23
                            ),
                            )
                        ],
                      );
                    }else
                    {
                      return CircularProgressIndicator();
                    }

                    // By default, show a loading spinner.
                  },
                ),
                LineChartPage(),
              ],
            ),
          ),
        ));
  }
}
class PhotosList  {

  final List<ApiData> myData;

//      : super(key: key
  PhotosList({Key key, this.myData});

  List<ApiData> getData(){
    return myData;
}

}

class LineChartPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
//    ApiData
    return Container(
        color: primaryColor,
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 36.0,
                  top: 24,
                ),
                child: Text(
                  'Temperature chart',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 28,
                right: 28,
              ),
              child: LineChartSample1(globalList),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
//              child: ButtonsFunction(),
            )
          ],
        )
    );
  }
}


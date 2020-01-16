import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:weather_mobileapp_flutter/fetchData.dart';
import 'package:weather_mobileapp_flutter/main.dart';

List<ApiData> publicData;

class LineChartSample1 extends StatefulWidget {
  List<ApiData> aList;

LineChartSample1(List<ApiData> a)
{
  aList = a;
}

  @override
  State<StatefulWidget> createState() => LineChartSample1State(aList);
}

/***
    Name:       class LineChartSample1State()
    Widgets:    Container, has all the different parts,
    Desc:       makes the top text and first graph
 ***/
class LineChartSample1State extends State<LineChartSample1> {


  bool isShowingMainData;
  bool theme;
  var primaryColor = Colors.white;
  var secondaryColor = Colors.black;

  LineChartSample1State(List<ApiData>aList)
  {
    publicData = aList;

  }

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    theme = true;
  }

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors:  [
                primaryColor,
                primaryColor,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Stack(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'Saxion ACS group four',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'temperature',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                      child: LineChart(
                          sampleData2()
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
//            IconButton(
//              icon: Icon(
//                Icons.refresh,
//                color: secondaryColor.withOpacity(isShowingMainData ? 1.0 : 0.5),
//              ),
//              onPressed: () {
//                setState(() {
//                  isShowingMainData = !isShowingMainData;
//                  if(theme){
//                    primaryColor = Colors.black;
//                    secondaryColor = Colors.white;
//                    theme =! theme;
//                  }else{
//                    theme =! theme;
//                    primaryColor = Colors.white;
//                    secondaryColor = Colors.black;
//                  }
//                });
//              },
//            )
          ],
        ),
      ),
    );
  }

  /***
      Name:       class LineChartSample1State()
      Widgets:    Container, has all the different parts
      Desc:       makes the top text
   ***/
  LineChartData sampleData1() {

    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print(touchResponse);
        },
        handleBuiltInTouches: true,
      ),

      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return globalList.first.time;
              case 5:
                return '12H';
              case 9:
                return globalList.last.time;
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 10:
                return '10';
              case 20:
                return '20';
              case 25:
                return '25';
              case 30:
                return '30';
              case 40:
                return '40';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: secondaryColor,
              width: 4,
            ),
            left: BorderSide(
              color: secondaryColor,
              width: 4,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 11,
      maxY: 33,
      minY: 20,
      lineBarsData: linesBarData1(),
    );
  }

  /***
      Name:        List<LineChartBarData> linesBarData1()
      Widgets:    spots,
      Desc:       add the datapoints to the graphs
   ***/
  List<LineChartBarData> linesBarData1()
  {
    int ind = 0;
    for(MapEntry entry in globalList.asMap().entries)
      {
        ind++;
      }
    LineChartBarData lineChartBarData3 = LineChartBarData(
      spots:  [

        FlSpot(1, double.parse( publicData[0].temperature)),
        FlSpot(2, double.parse( publicData[int.parse((ind/10).round().toString())].temperature)),
        FlSpot(3, double.parse( publicData[int.parse((ind/10*2).round().toString())].temperature)),
        FlSpot(4, double.parse( publicData[int.parse((ind/10*3).round().toString())].temperature)),
        FlSpot(5, double.parse(publicData[int.parse((ind/10*4).round().toString())].temperature)),
        FlSpot(6, double.parse(publicData[int.parse((ind/10*5).round().toString())].temperature)),
        FlSpot(7, double.parse(publicData[int.parse((ind/10*6).round().toString())].temperature)),
        FlSpot(8, double.parse(publicData[int.parse((ind/10*7).round().toString())].temperature)),
        FlSpot(9, double.parse( publicData[int.parse((ind/10*8).round().toString())].temperature)),
        FlSpot(10, double.parse( publicData[int.parse((ind/10*9).round().toString())].temperature)),
        FlSpot(11, double.parse( publicData.last.temperature)),


      ],
      isCurved: false,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: const FlDotData(
        show: false,
      ),
      belowBarData: const BarAreaData(
        show: false,
      ),
    );
    return [

      lineChartBarData3,
    ];
  }

  /***
      Name:        List<LineChartBarData> linesBarData1()
      Widgets:    spots,
      Desc:       add the datapoints to the graphs
   ***/
  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print(touchResponse);
        },
        handleBuiltInTouches: true,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return globalList.first.time;
              case 5:
                return '12H';
              case 9:
                return publicData.last.time;
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 5:
                return '5';
              case 10:
                return '10';
              case 15:
                return '15';
              case 20:
                return '20';
              case 25:
                return '25';
              case 30:
                return '30';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(
              color: secondaryColor,
              width: 4,
            ),
            left: BorderSide(
              color: secondaryColor,
              width: 4,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 11,
      maxY: 33,
      minY: 20,
      lineBarsData: linesBarData2(),
    );
  }

  /***
   * send the datapoints to the graph datapoints
   ****/
  List<LineChartBarData> linesBarData2() {
    int ind = 0;
    for(MapEntry entry in globalList.asMap().entries)
    {
      ind++;
    }
    return [

      LineChartBarData(
        spots: [
          FlSpot(1, double.parse( publicData[0].temperature)),
          FlSpot(2, double.parse( publicData[int.parse((ind/10).round().toString())].temperature)),
          FlSpot(3, double.parse( publicData[int.parse((ind/10*2).round().toString())].temperature)),
          FlSpot(4, double.parse( publicData[int.parse((ind/10*3).round().toString())].temperature)),
          FlSpot(5, double.parse(publicData[int.parse((ind/10*4).round().toString())].temperature)),
          FlSpot(6, double.parse(publicData[int.parse((ind/10*5).round().toString())].temperature)),
          FlSpot(7, double.parse(publicData[int.parse((ind/10*6).round().toString())].temperature)),
          FlSpot(8, double.parse(publicData[int.parse((ind/10*7).round().toString())].temperature)),
          FlSpot(9, double.parse( publicData[int.parse((ind/10*8).round().toString())].temperature)),
          FlSpot(10, double.parse( publicData[int.parse((ind/10*9).round().toString())].temperature)),
          FlSpot(11, double.parse( publicData.last.temperature)),
        ],
        isCurved: false,
        curveSmoothness: 0,
        colors: [
          Color(0xff27b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }
}
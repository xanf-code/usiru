import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usiru/Reusables/tempcardWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackContainer extends StatefulWidget {
  const BackContainer({
    Key key,
  }) : super(key: key);

  @override
  _BackContainerState createState() => _BackContainerState();
}

class _BackContainerState extends State<BackContainer> {
  final String url = "https://api.openweathermap.org/data/2.5/onecall?lat=12.98&lon=77.6&%20exclude=daily&units=metric&appid=7190713792495b31e2f95f0d3c6b2688";
  List data;
  List hour;

  Future<String> getCardData()async{
    var res = await http.get(Uri.encodeFull(url),headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['daily'];
      hour = resBody['hourly'];
    });
    return "SuccessxD";
  }

  @override
  void initState() {
    this.getCardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -6),
              blurRadius: 4,
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF780206),
              Color(0xFF061161),
            ],
          ),
        ),
        child: PageView(
          physics: BouncingScrollPhysics(),
          children: [
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[1]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[1]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[1]['weather'][0]['description']}",
                date: data==null? 0:data[1]['dt'],
                humidity: "${data==null? 0:data[1]['humidity'].toString()}",
                rain: "${data==null? 0:data[1]['clouds'].toString()}",
                maxtemp: data==null? 0:data[1]['temp']['max'],
                mintemp: data==null? 0:data[1]['temp']['min'],
                y1: hour==null? 0: hour[21]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[24]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[27]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[30]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[33]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[36]['temp'].toDouble(),//9pm
              ),
            ),
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[2]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[2]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[2]['weather'][0]['description']}",
                date: data==null? 0:data[2]['dt'],
                humidity: "${data==null? 0:data[2]['humidity'].toString()}",
                rain: "${data==null? 0:data[2]['clouds'].toString()}",
                maxtemp: data==null? 0:data[2]['temp']['max'],
                mintemp: data==null? 0:data[2]['temp']['min'],
                y1: hour==null? 0: hour[45]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[7]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[1]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[29]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[12]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[15]['temp'].toDouble(),//9pm
              ),
            ),
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[3]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[3]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[3]['weather'][0]['description']}",
                date: data==null? 0:data[3]['dt'],
                humidity: "${data==null? 0:data[3]['humidity'].toString()}",
                rain: "${data==null? 0:data[3]['clouds'].toString()}",
                maxtemp: data==null? 0:data[3]['temp']['max'],
                mintemp: data==null? 0:data[3]['temp']['min'],
                y1: hour==null? 0: hour[10]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[21]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[17]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[0]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[41]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[45]['temp'].toDouble(),//9pm
              ),
            ),
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[4]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[4]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[4]['weather'][0]['description']}",
                date: data==null? 0:data[4]['dt'],
                humidity: "${data==null? 0:data[4]['humidity'].toString()}",
                rain: "${data==null? 0:data[4]['clouds'].toString()}",
                maxtemp: data==null? 0:data[4]['temp']['max'],
                mintemp: data==null? 0:data[4]['temp']['min'],
                y1: hour==null? 0: hour[20]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[13]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[31]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[17]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[21]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[43]['temp'].toDouble(),//9pm
              ),
            ),
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[5]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[5]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[5]['weather'][0]['description']}",
                date: data==null? 0:data[5]['dt'],
                humidity: "${data==null? 0:data[5]['humidity'].toString()}",
                rain: "${data==null? 0:data[5]['clouds'].toString()}",
                maxtemp: data==null? 0:data[5]['temp']['max'],
                mintemp: data==null? 0:data[5]['temp']['min'],
                y1: hour==null? 0: hour[40]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[44]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[19]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[39]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[7]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[5]['temp'].toDouble(),//9pm
              ),
            ),
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[6]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[6]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[6]['weather'][0]['description']}",
                date: data==null? 0:data[6]['dt'],
                humidity: "${data==null? 0:data[6]['humidity'].toString()}",
                rain: "${data==null? 0:data[6]['clouds'].toString()}",
                maxtemp: data==null? 0:data[6]['temp']['max'],
                mintemp: data==null? 0:data[6]['temp']['min'],
                y1: hour==null? 0: hour[30]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[23]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[36]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[29]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[42]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[16]['temp'].toDouble(),//9pm
              ),
            ),
            DelayedDisplay(
              child: TempBackCard(
                temp: data==null? 0: data[7]['temp']['day'].toDouble(),
                tempType: "${data==null? 0:data[7]['weather'][0]['main']}",
                subtitle: "${data==null? 0:data[7]['weather'][0]['description']}",
                date: data==null? 0:data[7]['dt'],
                humidity: "${data==null? 0:data[7]['humidity'].toString()}",
                rain: "${data==null? 0:data[7]['clouds'].toString()}",
                maxtemp: data==null? 0:data[7]['temp']['max'],
                mintemp: data==null? 0:data[7]['temp']['min'],
                y1: hour==null? 0: hour[3]['temp'].toDouble(),//6:00am
                y2: hour==null? 0: hour[33]['temp'].toDouble(),//9:00am
                y3: hour==null? 0: hour[6]['temp'].toDouble(),//12pm
                y4: hour==null? 0: hour[39]['temp'].toDouble(),//3pm
                y5: hour==null? 0: hour[32]['temp'].toDouble(),//6pm
                y6: hour==null? 0: hour[45]['temp'].toDouble(),//9pm
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usiru/Reusables/tempCardChart.dart';
import 'package:usiru/Reusables/tempcardWidget.dart';

class BackContainer extends StatefulWidget {
  const BackContainer({
    Key key,
  }) : super(key: key);

  @override
  _BackContainerState createState() => _BackContainerState();
}

class _BackContainerState extends State<BackContainer> {
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
            TempBackCard(
              temp: 23.71,
              tempType: 'Cloudy',
              subtitle: 'Take an umbrella',
              date: '18/7',
              day: 'TODAY',
              humidity: '35',
              comma: ",",
              rain: '78',
              maxtemp: 21.8,
              mintemp: 17.6,
              y1: 21.7,
              y2: 17.8,
              y3: 24.1,
              y4: 16.5,
              y5: 24.5,
              y6: 15.7,
            ),
            TempBackCard(
              temp: 22.42,
              tempType: 'Cloudy',
              subtitle: 'Take an umbrella',
              date: '18/7/20',
              day: "",
              comma: "",
              humidity: '35',
              rain: '78',
              maxtemp: 21.8,
              mintemp: 17.6,
              y1: 21.7,
              y2: 17.8,
              y3: 24.1,
              y4: 16.5,
              y5: 24.5,
              y6: 15.7,
            ),
            TempBackCard(
              temp: 24.6,
              tempType: 'Cloudy',
              subtitle: 'Take an umbrella',
              date: '19/7/20',
              comma: "",
              day: "",
              humidity: '35',
              rain: '78',
              maxtemp: 21.8,
              mintemp: 17.6,
              y1: 21.7,
              y2: 17.8,
              y3: 24.1,
              y4: 16.5,
              y5: 24.5,
              y6: 15.7,
            ),
            TempBackCard(
              temp: 23.54,
              tempType: 'Cloudy',
              subtitle: 'Take an umbrella',
              date: '18/7/20',
              day: '',
              humidity: '35',
              rain: '78',
              comma: "",
              maxtemp: 21.8,
              mintemp: 17.6,
              y1: 21.7,
              y2: 17.8,
              y3: 24.1,
              y4: 16.5,
              y5: 24.5,
              y6: 15.7,
            ),
            TempBackCard(
              temp: 21.21,
              tempType: 'Cloudy',
              subtitle: 'Take an umbrella',
              date: '18/7/20',
              comma: "",
              day: '',
              humidity: '35',
              rain: '78',
              maxtemp: 21.8,
              mintemp: 17.6,
              y1: 21.7,
              y2: 17.8,
              y3: 24.1,
              y4: 16.5,
              y5: 24.5,
              y6: 15.7,
            ),
            TempBackCard(
              temp: 16.31,
              tempType: 'Cloudy',
              subtitle: 'Take an umbrella',
              date: '18/7/20',
              day: '',
              comma: "",
              humidity: '35',
              rain: '78',
              maxtemp: 21.8,
              mintemp: 17.6,
              y1: 21.7,
              y2: 17.8,
              y3: 24.1,
              y4: 16.5,
              y5: 24.5,
              y6: 15.7,
            ),
          ],
        ),
      ),
    );
  }
}

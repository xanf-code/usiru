import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:usiru/Reusables/tempCardChart.dart';

class TempBackCard extends StatelessWidget {
  final double temp;
  final String tempType;
  final String subtitle;
  final int date;
  final String humidity;
  final String rain;
  final double maxtemp;
  final double mintemp;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
  final double y5;
  final double y6;
  final String day;
  final String comma;
  const TempBackCard({
    Key key,
    this.temp,
    this.tempType,
    this.subtitle,
    this.date,
    this.humidity,
    this.rain,
    this.maxtemp,
    this.mintemp,
    this.y1,
    this.y2,
    this.y3,
    this.y4,
    this.y5,
    this.y6,
    this.day,
    this.comma,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "${this.temp.toStringAsFixed(1)}°",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                  color: Colors.white.withOpacity(0.8))),
                          TextSpan(
                              text: "c",
                              style: GoogleFonts.oxygen(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.white))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          this.tempType,
                          style: GoogleFonts.ubuntu(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 5),
                        child: Text(
                          this.subtitle,
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 8,bottom: 5),
                        child: Container(
                          height: 3,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: 160,
                      width: 160,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: this.day,
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    TextSpan(
                                      text: "${this.comma} ",
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    TextSpan(
                                      text:
                                          "${DateTime.fromMillisecondsSinceEpoch(date * 1000)}"
                                              .replaceRange(10, 23, "")
                                              .replaceAll("-", '/').replaceAll('2020/', ""),
                                      style: GoogleFonts.openSans(
                                          color: Colors.white54,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                  ]),
                                )),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://images.vexels.com/media/users/3/146228/isolated/preview/685088eecf6250447d473e7ae3b0a5da-blue-water-drops-icon-by-vexels.png",
                                      color: Colors.purpleAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${this.humidity} %",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://freesvg.org/img/1339577112.png",
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${this.rain} %",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://www.freeiconspng.com/uploads/temperature-icon-png-11.png",
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${this.maxtemp.toStringAsFixed(0)} °c",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn4.iconfinder.com/data/icons/weather-300/550/downtemprature-512.png",
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${this.mintemp.toStringAsFixed(0)} °c",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    height: 135,
                    width: 400,
                    child: TempCardGraph(
                      y1: this.y1,
                      y2: this.y2,
                      y3: this.y3,
                      y4: this.y4,
                      y5: this.y5,
                      y6: this.y6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

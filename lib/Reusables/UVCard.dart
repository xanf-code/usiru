import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class UVCard extends StatelessWidget {
  final String name;
  final double value;
  final double percent;
  const UVCard({
    Key key, this.name, this.value, this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 180,
        width: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(5,5),
              blurRadius: 10,
              color: Color(0xFFD3D3D3).withOpacity(.84),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                this.name,
                style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircularPercentIndicator(
                    //backgroundWidth: 0,
                    animation: true,
                    arcType: ArcType.HALF,
                    //startAngle: 275.0,
                    radius: 100.0,
                    lineWidth: 12.0,
                    percent: this.percent,
                    animationDuration: 1500,
                    backgroundColor: Colors.white,
                    circularStrokeCap:
                    CircularStrokeCap.round,
                    center: new Text(
                      "${this.value} nm",
                      style: GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.red,
                        Colors.purpleAccent
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 22.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Low',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: new BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Mid',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: new BoxDecoration(
                                color: Colors.purpleAccent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'High',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 17,
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
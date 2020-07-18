import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usiru/Reusables/tempCardChart.dart';

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
            Padding(
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
                                      text: "${298 - 279}°",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 90,
                                          color: Colors.white)),
                                  TextSpan(
                                      text: "c",
                                      style: GoogleFonts.oxygen(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 50,
                                          color: Colors.white))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "Cloudy",
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 5),
                                child: Text(
                                  "Carry an Umbrella",
                                  style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white54),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 18.0, top: 8),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "TODAY,",style:  GoogleFonts.openSans(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,fontSize: 18),
                                                ),
                                                TextSpan(
                                                  text: " 18/7",style:  GoogleFonts.openSans(
                                                    color: Colors.white54,
                                                    fontWeight: FontWeight.normal,fontSize: 16),
                                                ),
                                              ]
                                            ),
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            "35%",
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
                                            "35%",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            "23° c",
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
                                            "17° c",
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
                              y1: 19.3,
                              y2: 18.5,
                              y3: 20.6,
                              y4: 23.1,
                              y5: 21.7,
                              y6: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://cdn.dribbble.com/users/54130/screenshots/6238979/ladder.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://craft.atlassian.design/uploads/guidelines/marketing/illustrations/Confluence-Spot-Hero@2x_171013_112432.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://maxcdn.icons8.com/app/uploads/2019/10/teamwork-illustration-2-1024x768.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://assets-global.website-files.com/5bcb5ee81fb2091a2ec550c7/5de6dd312578f7f8427f4e69_5cbe9efc8edd98b9c4d325c0_grape-pack-illustration-1.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

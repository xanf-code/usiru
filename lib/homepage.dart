import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:usiru/Custom/clipper.dart';
import 'package:usiru/Reusables/EndTileCard.dart';
import 'package:usiru/Reusables/chart.dart';
import 'Reusables/Pollutant_card.dart';
import 'Reusables/QualityCard.dart';
import 'Reusables/TopClipperCard.dart';
import 'Reusables/UVCard.dart';
import 'Reusables/Maps.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: TopClipperCard(
                  Image:
                      "https://cdn.dribbble.com/users/1118956/screenshots/6608006/bnglr-final.jpg",
                  title: 'Bengaluru, Karnataka',
                  cityname: 'Hombegowda Nagar',
                  mask:
                      "https://images.vexels.com/media/users/3/205468/isolated/preview/6495a5cc336d47f345c90e5b41e2b4c8-pitta-mask-illustration-by-vexels.png",
                  aqi: 135,
                  lastUpdate: "8:36",
                ),
              ),
              QualityCard(
                subtitle: 'UNSAFE',
                temp: '29°',
                humidity: '90',
                wind: '4.1',
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1000),
                        offset: -0.5,
                        child: Text(
                          "Pollutants",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                      ),
                      ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1000),
                        offset: 0.5,
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: ShowUpAnimation(
                  direction: Direction.vertical,
                  animationDuration: Duration(milliseconds: 1000),
                  offset: -0.2,
                  child: Row(
                    children: [
                      UVCard(
                        name: 'UV Index',
                        value: 7.3,
                        percent: 0.85,
                      ),
                      PollutantCard(
                        Name: 'Carbon Monoxide',
                        Comments: 'Average',
                        Value: 3.3,
                        BarVal: 0.3,
                        Emoji:
                            "https://media1.giphy.com/media/h4OGa0npayrJX2NRPT/source.gif",
                      ),
                      PollutantCard(
                        Name: 'Nitrogen Dioxide',
                        Comments: 'Moderate',
                        Value: 8,
                        BarVal: 0.47,
                        Emoji:
                            "https://i.pinimg.com/originals/0e/3e/e5/0e3ee551876e1ad2a39f89e4adf9168a.gif",
                      ),
                      PollutantCard(
                        Name: 'Ozone',
                        Comments: 'Unhealthy',
                        Value: 3.30,
                        BarVal: 0.87,
                        Emoji:
                            "https://media1.giphy.com/media/gfI2SFqrtxwf2Aw9x5/giphy.gif",
                      ),
                      PollutantCard(
                        Name: 'PM\u2081\u2080',
                        Comments: 'Healthy',
                        Value: 20,
                        BarVal: 0.68,
                        Emoji:
                            "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif",
                      ),
                      PollutantCard(
                        Name: 'Sulfur Dioxide',
                        Comments: 'Healthy',
                        Value: 4,
                        BarVal: 0.34,
                        Emoji:
                            "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 25, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1000),
                        offset: -0.5,
                        child: Text(
                          "7-Day Forcast",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                      ),
                      ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1000),
                        offset: 0.5,
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: ShowUpAnimation(
                  direction: Direction.vertical,
                  child: Graph(
                    y1: 27.2,
                    y2: 23,
                    y3: 19.6,
                    y4: 24,
                    y5: 21,
                    y6: 25.6,
                    y7: 19.6,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 25, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1000),
                        offset: -0.5,
                        child: Text(
                          "Air-Index Map",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                      ),
                      ShowUpAnimation(
                        direction: Direction.horizontal,
                        animationDuration: Duration(milliseconds: 1000),
                        offset: 0.5,
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Map(
                Urlone:
                    "https://tiles.waqi.info/tiles/usepa-aqi/{z}/{x}/{y}.png?token=7190713792495b31e2f95f0d3c6b2688",
                Urltwo: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              Center(
                child: Text(
                  'Data Sources',
                  style: GoogleFonts.openSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              EndTile(
                title: 'Central Pollution Control Board',
                subtitle: 'https://cpcb.nic.in/',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

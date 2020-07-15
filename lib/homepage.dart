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
import 'Reusables/focusedMenu.dart';

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
          physics: ClampingScrollPhysics(),
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
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: FocusedMenu(
                          child: UVCard(
                            name: 'UV Index',
                            value: 7.3,
                            percent: 0.85,
                          ),
                          onedate: '14/1',
                          onemin: '4.5',
                          onemax: '2.3',
                          oneavg: '3.2',
                          twodate: '15/1',
                          twomin: '2.2',
                          twomax: '4',
                          twoavg: '10',
                          threedate: '16/1',
                          threemin: '2',
                          threemax: '4.3',
                          threeavg: '5',
                          fourdate: '17/1',
                          fourmin: '10',
                          fourmax: '9.2',
                          fouravg: '2',
                          fivedate: '18/1',
                          fivemin: '10.2',
                          fivemax: '5',
                          fiveavg: '1',
                          sixdate: '19/1',
                          sixmin: '2',
                          sixmax: '8.7',
                          sixavg: '2',
                          sevendate: '20/1',
                          sevenmin: '1',
                          sevenmax: '3',
                          sevenavg: '9.7',
                        ),
                      ),
                      FocusedMenu(
                        child: PollutantCard(
                          Name: 'Carbon Monoxide',
                          Comments: 'Average',
                          Value: 3.3,
                          BarVal: 0.3,
                          Emoji:
                          "https://media1.giphy.com/media/h4OGa0npayrJX2NRPT/source.gif",
                        ),
                        onedate: '14/1',
                        onemin: '4.5',
                        onemax: '2.3',
                        oneavg: '3.2',
                        twodate: '15/1',
                        twomin: '2.2',
                        twomax: '4',
                        twoavg: '10',
                        threedate: '16/1',
                        threemin: '2',
                        threemax: '4.3',
                        threeavg: '5',
                        fourdate: '17/1',
                        fourmin: '10',
                        fourmax: '9.2',
                        fouravg: '2',
                        fivedate: '18/1',
                        fivemin: '10.2',
                        fivemax: '5',
                        fiveavg: '1',
                        sixdate: '19/1',
                        sixmin: '2',
                        sixmax: '8.7',
                        sixavg: '2',
                        sevendate: '20/1',
                        sevenmin: '1',
                        sevenmax: '3',
                        sevenavg: '9.7',
                      ),
                      FocusedMenu(
                        child: PollutantCard(
                          Name: 'Nitrogen Dioxide',
                          Comments: 'Moderate',
                          Value: 8,
                          BarVal: 0.47,
                          Emoji:
                          "https://i.pinimg.com/originals/0e/3e/e5/0e3ee551876e1ad2a39f89e4adf9168a.gif",
                        ),
                        onedate: '14/1',
                        onemin: '4.5',
                        onemax: '2.3',
                        oneavg: '3.2',
                        twodate: '15/1',
                        twomin: '2.2',
                        twomax: '4',
                        twoavg: '10',
                        threedate: '16/1',
                        threemin: '2',
                        threemax: '4.3',
                        threeavg: '5',
                        fourdate: '17/1',
                        fourmin: '10',
                        fourmax: '9.2',
                        fouravg: '2',
                        fivedate: '18/1',
                        fivemin: '10.2',
                        fivemax: '5',
                        fiveavg: '1',
                        sixdate: '19/1',
                        sixmin: '2',
                        sixmax: '8.7',
                        sixavg: '2',
                        sevendate: '20/1',
                        sevenmin: '1',
                        sevenmax: '3',
                        sevenavg: '9.7',
                      ),
                      FocusedMenu(
                        child:  PollutantCard(
                          Name: 'Ozone',
                          Comments: 'Unhealthy',
                          Value: 3.30,
                          BarVal: 0.87,
                          Emoji:
                          "https://media1.giphy.com/media/gfI2SFqrtxwf2Aw9x5/giphy.gif",
                        ),
                        onedate: '14/1',
                        onemin: '4.5',
                        onemax: '2.3',
                        oneavg: '3.2',
                        twodate: '15/1',
                        twomin: '2.2',
                        twomax: '4',
                        twoavg: '10',
                        threedate: '16/1',
                        threemin: '2',
                        threemax: '4.3',
                        threeavg: '5',
                        fourdate: '17/1',
                        fourmin: '10',
                        fourmax: '9.2',
                        fouravg: '2',
                        fivedate: '18/1',
                        fivemin: '10.2',
                        fivemax: '5',
                        fiveavg: '1',
                        sixdate: '19/1',
                        sixmin: '2',
                        sixmax: '8.7',
                        sixavg: '2',
                        sevendate: '20/1',
                        sevenmin: '1',
                        sevenmax: '3',
                        sevenavg: '9.7',
                      ),
                      FocusedMenu(
                        child: PollutantCard(
                          Name: 'PM\u2081\u2080',
                          Comments: 'Healthy',
                          Value: 20,
                          BarVal: 0.68,
                          Emoji:
                          "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif",
                        ),
                        onedate: '14/1',
                        onemin: '4.5',
                        onemax: '2.3',
                        oneavg: '3.2',
                        twodate: '15/1',
                        twomin: '2.2',
                        twomax: '4',
                        twoavg: '10',
                        threedate: '16/1',
                        threemin: '2',
                        threemax: '4.3',
                        threeavg: '5',
                        fourdate: '17/1',
                        fourmin: '10',
                        fourmax: '9.2',
                        fouravg: '2',
                        fivedate: '18/1',
                        fivemin: '10.2',
                        fivemax: '5',
                        fiveavg: '1',
                        sixdate: '19/1',
                        sixmin: '2',
                        sixmax: '8.7',
                        sixavg: '2',
                        sevendate: '20/1',
                        sevenmin: '1',
                        sevenmax: '3',
                        sevenavg: '9.7',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: FocusedMenu(
                          child: PollutantCard(
                            Name: 'Sulfur Dioxide',
                            Comments: 'Healthy',
                            Value: 4,
                            BarVal: 0.34,
                            Emoji:
                            "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif",
                          ),
                          onedate: '14/1',
                          onemin: '4.5',
                          onemax: '2.3',
                          oneavg: '3.2',
                          twodate: '15/1',
                          twomin: '2.2',
                          twomax: '4',
                          twoavg: '10',
                          threedate: '16/1',
                          threemin: '2',
                          threemax: '4.3',
                          threeavg: '5',
                          fourdate: '17/1',
                          fourmin: '10',
                          fourmax: '9.2',
                          fouravg: '2',
                          fivedate: '18/1',
                          fivemin: '10.2',
                          fivemax: '5',
                          fiveavg: '1',
                          sixdate: '19/1',
                          sixmin: '2',
                          sixmax: '8.7',
                          sixavg: '2',
                          sevendate: '20/1',
                          sevenmin: '1',
                          sevenmax: '3',
                          sevenavg: '9.7',
                        ),
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
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
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
                padding: const EdgeInsets.only(left: 12.0, right: 12.0,top: 10),
                child: ShowUpAnimation(
                  direction: Direction.vertical,
                  child: Graph(
                    y1: 68,
                    y2: 67,
                    y3: 73,
                    y4: 67,
                    y5: 79,
                    y6: 67,
                    y7: 68,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 200,
                child: PageView(
                  children: [
                    Container(child: Center(child: Text('1'),),),
                    Container(child: Center(child: Text('2'),),),
                    Container(child: Center(child: Text('3'),),),
                    Container(child: Center(child: Text('4'),),),
                    Container(child: Center(child: Text('5'),),),
                    Container(child: Center(child: Text('6'),),),
                    Container(child: Center(child: Text('7'),),),
                    Container(child: Center(child: Text('8'),),),
                    Container(child: Center(child: Text('9'),),),
                    Container(child: Center(child: Text('10'),),),
                  ],
                ),
              ),//InitialDemo
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
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
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
                      fontSize: 16, fontWeight: FontWeight.w600),
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
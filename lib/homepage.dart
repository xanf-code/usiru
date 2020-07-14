import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usiru/Custom/clipper.dart';
import 'package:latlong/latlong.dart';

import 'Constants/constant.dart';

class MyHomePage extends StatefulWidget {
  final double goalCompleted = 0.9;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);
  double progressDegrees = 0;
  var count = 0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = widget.goalCompleted * _progressAnimation.value;
        });
      });

    _radialProgressAnimationController.forward();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF780206),
                      Color(0xFF061161),
                    ],
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: CachedNetworkImageProvider(
                      "https://cdn.dribbble.com/users/1118956/screenshots/6608006/bnglr-final.jpg",
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ShowUpAnimation(
                          direction: Direction.vertical,
                          animationDuration: Duration(milliseconds: 1000),
                          offset: -0.5,
                          child: Text(
                            'Bengaluru, Karnataka',
                            style: GoogleFonts.ubuntu(
                                color: Colors.white.withOpacity(0.75),
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShowUpAnimation(
                              direction: Direction.horizontal,
                              animationDuration: Duration(milliseconds: 1200),
                              offset: -0.5,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ShowUpAnimation(
                              direction: Direction.horizontal,
                              animationDuration: Duration(milliseconds: 1200),
                              offset: 0.5,
                              child: Text(
                                'Hombegowda Nagar',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //                            CustomPaint(
//                              child: Container(
//                                height: 200.0,
//                                width: 200.0,
//                                padding: EdgeInsets.symmetric(vertical: 30.0),
//                                child: AnimatedOpacity(
//                                  opacity: progressDegrees > 30 ? 1.0 : 0.0,
//                                  duration: fadeInDuration,
//                                  child: Column(
//                                    children: <Widget>[
//                                      CachedNetworkImage(
//                                        color: Colors.white.withOpacity(0.3),
//                                        imageUrl:
//                                            "https://cdn.onlinewebfonts.com/svg/img_378105.png",
//                                        height: 40,
//                                        width: 40,
//                                      ),
//                                      SizedBox(
//                                        height: 10.0,
//                                      ),
//                                      Text(
//                                        '135',
//                                        style: GoogleFonts.ubuntu(
//                                            fontSize: 40.0,
//                                            color: Colors.white,
//                                            fontWeight: FontWeight.bold),
//                                      ),
//                                      SizedBox(
//                                        height: 3.0,
//                                      ),
//                                      Text(
//                                        'PM\u00B2\u2075',
//                                        style: GoogleFonts.ubuntu(
//                                            fontSize: 20.0,
//                                            color: Colors.white),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                              painter: RadialPainter(progressDegrees),
//                            ),
                        CircularPercentIndicator(
                          backgroundWidth: 0,
                          animationDuration: 1100,
                          restartAnimation: true,
                          animation: true,
                          radius: 220.0,
                          lineWidth: 15,
                          percent: 0.80,
                          linearGradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.red,
                            Colors.yellow
                          ]),
                          backgroundColor: Colors.white,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    color: Colors.white.withOpacity(0.5),
                                    imageUrl:
                                        "https://images.vexels.com/media/users/3/205468/isolated/preview/6495a5cc336d47f345c90e5b41e2b4c8-pitta-mask-illustration-by-vexels.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  DelayedDisplay(
                                    slidingBeginOffset: Offset(0.5, 0),
                                    child: Text(
                                      '135',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 40.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  DelayedDisplay(
                                    slidingBeginOffset: Offset(-0.5, 0),
                                    child: Text(
                                      'PM\u00B2\u2075',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DelayedDisplay(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timeline,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Last Updated 8:36pm',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 10),
              child: DelayedDisplay(
                child: Container(
                  height: 100,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DelayedDisplay(
                              slidingBeginOffset: Offset(-0.5, 1),
                              child: Text(
                                'AirQuality',
                                style: GoogleFonts.openSans(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            DelayedDisplay(
                              slidingBeginOffset: Offset(-0.5, 1),
                              child: Text(
                                'UNSAFE',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        SizedBox(
                          height: 25,
                          width: 30,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://icon-library.com/images/temp-icon/temp-icon-26.jpg',
                            color: Colors.white70,
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          child: Text(
                            '29°',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 25,
                          width: 30,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://lh3.googleusercontent.com/proxy/gKOfQJC-TlCglPMDFyQP6bwVK-O_yJDOYV7rI8GK6U8tlPvdMBnrUm_EL0ZBKVWsB-hewqPks9MwVMYmrbUN6uyRiFXNcIh3E1utf0KfKYgt_aoqcW8hWJ2IIc0iPmy70XCtOaLceu13SD_rX7g',
                            color: Colors.white70,
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          child: Text(
                            '90',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 25,
                          width: 30,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://www.pngrepo.com/download/140232/wind.png',
                            color: Colors.white70,
                          ),
                        ),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          child: Text(
                            ' 4.1 Kmph',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: FocusedMenuHolder(
                        animateMenuItems: true,
                        menuItems: <FocusedMenuItem>[
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('12/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('13/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('14/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('15/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('16/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('17/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FocusedMenuItem(
                            title: Row(
                              children: [
                                SizedBox(width: 25,),
                                Text('18/07',style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '8',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  height: 35,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '0',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 180,
                            width: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                                    "UV Index",
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
                                        percent: 0.78,
                                        animationDuration: 1500,
                                        backgroundColor: Colors.white,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: new Text(
                                          "7 nm",
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
                                            const EdgeInsets.only(left: 15.0),
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 180,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Carbon Monoxide",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "3.30",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: " μg/m\u00B3",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Average",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://media1.giphy.com/media/h4OGa0npayrJX2NRPT/source.gif"))
                                ],
                              ),
                              LinearPercentIndicator(
                                leading: Text('🛡'),
                                width: 150,
                                animationDuration: 1900,
                                animation: true,
                                percent: 0.70,
                                linearGradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.red,
                                  Colors.yellow
                                ]),
                                backgroundColor: Colors.black12,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 180,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nitrogen Dioxide",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "8",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: " μg/m\u00B3",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Moderate",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://i.pinimg.com/originals/0e/3e/e5/0e3ee551876e1ad2a39f89e4adf9168a.gif"))
                                ],
                              ),
                              LinearPercentIndicator(
                                leading: Text('🛡'),
                                width: 150,
                                animationDuration: 1500,
                                animation: true,
                                percent: 0.42,
                                linearGradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.red,
                                  Colors.yellow
                                ]),
                                backgroundColor: Colors.black12,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 180,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ozone",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "3.30",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: " μg/m\u00B3",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Unhealthy",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://media1.giphy.com/media/gfI2SFqrtxwf2Aw9x5/giphy.gif"))
                                ],
                              ),
                              LinearPercentIndicator(
                                leading: Text('🛡'),
                                width: 150,
                                animationDuration: 1500,
                                animation: true,
                                percent: 0.90,
                                linearGradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.red,
                                  Colors.yellow
                                ]),
                                backgroundColor: Colors.black12,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 180,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PM \u2081\u2080",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "20",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: " μg/m\u00B3",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Healthy",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif"))
                                ],
                              ),
                              LinearPercentIndicator(
                                leading: Text('🛡'),
                                width: 150,
                                animationDuration: 1500,
                                animation: true,
                                percent: 0.74,
                                linearGradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.red,
                                  Colors.yellow
                                ]),
                                backgroundColor: Colors.black12,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 180,
                        width: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sulfur Dioxide",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black38),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "4",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: " μg/m\u00B3",
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Healthy",
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              "https://media0.giphy.com/media/QWvra259h4LCvdJnxP/giphy.gif"))
                                ],
                              ),
                              LinearPercentIndicator(
                                leading: Text('🛡'),
                                width: 150,
                                animationDuration: 1500,
                                animation: true,
                                percent: 0.74,
                                linearGradient: LinearGradient(colors: [
                                  Colors.black,
                                  Colors.red,
                                  Colors.yellow
                                ]),
                                backgroundColor: Colors.black12,
                                linearStrokeCap: LinearStrokeCap.roundAll,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 25, top: 20),
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
              padding: const EdgeInsets.only(right: 32, top: 30),
              child: ShowUpAnimation(
                child: Container(
                  height: 220,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      borderData: FlBorderData(show: true),
                      titlesData: FlTitlesData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(1, 23),
                            FlSpot(2, 22),
                            FlSpot(3, 21),
                            FlSpot(4, 22),
                            FlSpot(5, 19),
                            FlSpot(6, 21),
                          ],
                          isCurved: true,
                          dotData: FlDotData(
                            show: true,
                          ),
                          belowBarData: BarAreaData(show: false),
                          colors: [kPrimaryColor],
                          barWidth: 6,
                        ),
                      ],
                    ),
                    swapAnimationDuration: Duration(milliseconds: 1100),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 25, top: 20),
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
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: ShowUpAnimation(
                direction: Direction.vertical,
                animationDuration: Duration(milliseconds: 1000),
                offset: 0.2,
                child: Container(
                  height: 300,
                  child: FlutterMap(
                    options: new MapOptions(
                      interactive: true,
                      center: LatLng(12.9716, 77.5946),
                      zoom: 11.0,
                    ),
                    layers: [
                      TileLayerOptions(
                          opacity: 1,
                          urlTemplate:
                              "https://tiles.waqi.info/tiles/usepa-aqi/{z}/{x}/{y}.png?token=7190713792495b31e2f95f0d3c6b2688",
                          subdomains: ['a', 'b', 'c']),
                      TileLayerOptions(
                          opacity: 0.5,
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c']),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Data Sources',
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
              child: ListTile(
                onTap: () => launch('https://cpcb.nic.in/'),
                title: Text(
                  'Central Pollution Control Board',
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'https://cpcb.nic.in/',
                  style: GoogleFonts.openSans(
                      fontSize: 13, fontWeight: FontWeight.normal),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vector_math/vector_math_64.dart' as math;

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
          physics: BouncingScrollPhysics(),
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
                        Text(
                          'Bengaluru, Karnataka',
                          style: GoogleFonts.ubuntu(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Hombegowda Nagar',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
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
                          backgroundColor: Colors.white12,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    color: Colors.white.withOpacity(0.3),
                                    imageUrl:
                                        "https://cdn.onlinewebfonts.com/svg/img_378105.png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '135',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 40.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    'PM\u00B2\u2075',
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 10),
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
                          Text(
                            'AirQuality',
                            style: GoogleFonts.openSans(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'UNSAFE',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                      Text(
                        '29°',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
                      Text(
                        '90',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
                      Text(
                        '4.1 Kmph',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                                  color: Colors.black45),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                                  color: Colors.black45),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                                  color: Colors.black45),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                                  color: Colors.black45),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

//class RadialPainter extends CustomPainter {
//  double progressInDegrees;
//
//  RadialPainter(this.progressInDegrees);
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = Paint()
//      ..color = Colors.black12
//      ..strokeCap = StrokeCap.round
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = 8.0;
//
//    Offset center = Offset(size.width / 2, size.height / 2);
//    canvas.drawCircle(center, size.width / 2, paint);
//
//    Paint progressPaint = Paint()
//      ..shader = LinearGradient(
//              colors: [Colors.white, Colors.red, Colors.yellow])
//          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
//      ..strokeCap = StrokeCap.round
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = 8.0;
//
//    canvas.drawArc(
//        Rect.fromCircle(center: center, radius: size.width / 2),
//        math.radians(-90),
//        math.radians(progressInDegrees),
//        false,
//        progressPaint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}

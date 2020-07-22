import 'package:counter_animation/counter_animation.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:show_up_animation/show_up_animation.dart';

class TopClipperCard extends StatelessWidget {
  final String Image;
  final String title;
  final String cityname;
  final String mask;
  final int aqi;
  final String lastUpdate;
  final double percent;
  const TopClipperCard({
    Key key,
    this.title,
    this.cityname,
    this.mask,
    this.aqi,
    this.lastUpdate,
    this.Image,
    this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            this.Image,
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
                  this.title,
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
                      this.cityname,
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
              CircularPercentIndicator(
                backgroundWidth: 0,
                animationDuration: 3000,
                restartAnimation: true,
                animation: true,
                radius: 220.0,
                lineWidth: 15,
                percent: this.percent,
                linearGradient: LinearGradient(
                  colors: [
                    Color(0xFF833ab4),
                    Color(0xFFfd1d1d),
                    Color(0xFFfcb045)
                  ],
                ),
                backgroundColor: Colors.white,
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: <Widget>[
                        CachedNetworkImage(
                          color: Colors.white.withOpacity(0.5),
                          imageUrl: this.mask,
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DelayedDisplay(
                          slidingBeginOffset: Offset(0.5, 0),
                          child: CounterAnimation(
                            begin: 0,
                            end: this.aqi,
                            textStyle: GoogleFonts.ubuntu(
                                fontSize: 40.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            duration: 3,
                            curve: Curves.easeOut,
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
                      'Last Updated${this.lastUpdate}',
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
    );
  }
}

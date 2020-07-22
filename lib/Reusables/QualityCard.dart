import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:show_up_animation/show_up_animation.dart';

class QualityCard extends StatelessWidget {
  final String subtitle;
  final String temp;
  final String humidity;
  final String wind;
  const QualityCard({
    Key key, this.subtitle, this.temp, this.humidity, this.wind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20.0, right: 20, bottom: 25),
      child: DelayedDisplay(
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    DelayedDisplay(
                      slidingBeginOffset: Offset(-0.5, 1),
                      child: Text(
                        this.subtitle,
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                        this.temp.toString(),
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 25,
                      width: 30,
                      child: CachedNetworkImage(
                        imageUrl: 'https://www.freepngimg.com/thumb/water/76727-vector-of-drop-water-drop-water-free-download-image-thumb.png',
                        color: Colors.white70,
                      ),
                    ),
                    ShowUpAnimation(
                      direction: Direction.horizontal,
                      child: Text(
                        this.humidity.toString(),
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                        ' ${this.wind.toString()} Kph',
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
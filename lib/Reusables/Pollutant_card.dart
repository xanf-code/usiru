import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PollutantCard extends StatelessWidget {
  final String Name;
  final double Value;
  final String Comments;
  final double BarVal;
  final String Emoji;
  const PollutantCard({
    Key key,
    this.Name,
    this.Value,
    this.Comments,
    this.BarVal, this.Emoji,
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
          padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.Name,
                style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: this.Value.toString(),
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
                    this.Comments,
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
                          this.Emoji))
                ],
              ),
              LinearPercentIndicator(
                leading: Text('🛡'),
                width: 150,
                animationDuration: 1900,
                animation: true,
                percent: this.BarVal,
                linearGradient: LinearGradient(
                    colors: [Colors.black, Colors.red, Colors.yellow]),
                backgroundColor: Colors.black12,
                linearStrokeCap: LinearStrokeCap.roundAll,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class Locations extends StatelessWidget {
  final String area;
  final String subtitle;
  final String image;
  final int aqi;
  const Locations({
    Key key, this.area, this.subtitle, this.image, this.aqi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
              this.image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 27.0,left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.white,size: 22,),
                      SizedBox(width: 5,),
                      Text(
                        this.area,
                        style: GoogleFonts.openSans(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 12),
                    child: Text(
                      this.subtitle,
                      style: GoogleFonts.openSans(color: Colors.white70,fontWeight: FontWeight.w600,fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                this.aqi.toString(),
                style: GoogleFonts.openSans(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                child: Center(
                    child: CachedNetworkImage(imageUrl: "https://i.pinimg.com/originals/f7/62/69/f76269d4940355b003697ca5a0972314.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:Container(
                color: Colors.transparent,
                child: Center(
                    child: CachedNetworkImage(imageUrl: "https://cdn.dribbble.com/users/54130/screenshots/6238979/ladder.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                    child: CachedNetworkImage(imageUrl: "https://craft.atlassian.design/uploads/guidelines/marketing/illustrations/Confluence-Spot-Hero@2x_171013_112432.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:Container(
                color: Colors.transparent,
                child: Center(
                    child: CachedNetworkImage(imageUrl: "https://maxcdn.icons8.com/app/uploads/2019/10/teamwork-illustration-2-1024x768.png")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                    child: CachedNetworkImage(imageUrl: "https://assets-global.website-files.com/5bcb5ee81fb2091a2ec550c7/5de6dd312578f7f8427f4e69_5cbe9efc8edd98b9c4d325c0_grape-pack-illustration-1.png")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

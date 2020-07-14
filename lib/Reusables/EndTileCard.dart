import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EndTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const EndTile({
    Key key, this.title, this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
      child: ListTile(
        onTap: () => launch('https://cpcb.nic.in/'),
        title: Text(
          this.title,
          style: GoogleFonts.openSans(
              fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          this.subtitle,
          style: GoogleFonts.openSans(
              fontSize: 13, fontWeight: FontWeight.normal),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 14,
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';

class FocusedMenu extends StatelessWidget {
  final Widget child;
  final String onedate;
  final String onemin;
  final String onemax;
  final String oneavg;
  final String twodate;
  final String twomin;
  final String twomax;
  final String twoavg;
  final String threedate;
  final String threemin;
  final String threemax;
  final String threeavg;
  final String fourdate;
  final String fourmin;
  final String fourmax;
  final String fouravg;
  final String fivedate;
  final String fivemin;
  final String fivemax;
  final String fiveavg;
  final String sixdate;
  final String sixmin;
  final String sixmax;
  final String sixavg;
  final String sevendate;
  final String sevenmin;
  final String sevenmax;
  final String sevenavg;
  const FocusedMenu({
    Key key,
    this.child,
    this.onedate,
    this.onemin,
    this.onemax,
    this.oneavg,
    this.twodate,
    this.twomin,
    this.twomax,
    this.twoavg,
    this.threedate,
    this.threemin,
    this.threemax,
    this.threeavg,
    this.fourdate,
    this.fourmin,
    this.fourmax,
    this.fouravg,
    this.fivedate,
    this.fivemin,
    this.fivemax,
    this.fiveavg,
    this.sixdate,
    this.sixmin,
    this.sixmax,
    this.sixavg,
    this.sevendate,
    this.sevenmin,
    this.sevenmax,
    this.sevenavg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      menuItems: [
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date',style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text('Min',style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text('Max',style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text('Avg',style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.onedate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.onemin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.onemax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.oneavg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //1
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.twodate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.twomin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.twomax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.twoavg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //2
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.threedate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.threemin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.threemax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.threeavg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //3
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.fourdate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.fourmin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.fourmax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.fouravg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //4
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.fivedate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.fivemin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.fivemax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.fiveavg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //5
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.sixdate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.sixmin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.sixmax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.sixavg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //6
        FocusedMenuItem(
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.sevendate),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.sevenmin,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.sevenmax,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                        this.sevenavg,
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ), //7
      ],
      child: this.child,
    );
  }
}
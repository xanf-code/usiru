import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class TempCardGraph extends StatelessWidget {
  final double y1;
  final double y2;
  final double y3;
  final double y4;
  final double y5;
  final double y6;
  const TempCardGraph({
    Key key,
    this.y1,
    this.y2,
    this.y3,
    this.y4,
    this.y5,
    this.y6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 35,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                "${rod.y.toString()}°",
                GoogleFonts.ubuntu(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              textStyle: GoogleFonts.ubuntu(color: Colors.white70),
              margin: 10,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return '6 am';
                  case 1:
                    return '9 am';
                  case 2:
                    return '12 pm';
                  case 3:
                    return '3 pm';
                  case 4:
                    return '6 pm';
                  case 5:
                    return '9 pm';
                  default:
                    return '';
                }
              }),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(
              y: this.y1,
              color: Colors.white,
            ),
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
              y: this.y2,
              color: Colors.white,
            ),
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
              y: this.y3,
              color: Colors.white,
            ),
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
              y: this.y4,
              color: Colors.white,
            ),
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
              y: this.y5,
              color: Colors.white,
            ),
          ], showingTooltipIndicators: [
            0
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
              y: this.y6,
              color: Colors.white,
            ),
          ], showingTooltipIndicators: [
            0
          ]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Graph extends StatelessWidget {
  final double y1;
  final double y2;
  final double y3;
  final double y4;
  final double y5;
  final double y6;
  final double y7;
  const Graph({
    Key key,
    this.y1,
    this.y2,
    this.y3,
    this.y4,
    this.y5,
    this.y6,
    this.y7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 56,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  rod.y.toString() + "°",
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
                margin: 10,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mon';
                    case 1:
                      return 'Tue';
                    case 2:
                      return 'Wed';
                    case 3:
                      return 'Thu';
                    case 4:
                      return 'Fri';
                    case 5:
                      return 'Sat';
                    case 6:
                      return 'Sun';
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
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                y: this.y2,
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                y: this.y3,
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                y: this.y4,
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                y: this.y5,
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(
                y: this.y6,
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(
                y: this.y7,
                color: Colors.deepPurple,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
          ],
        ),
      ),
    );
  }
}

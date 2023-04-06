import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../controller/statistic_controller.dart';
import 'chart_title_widgets.dart';

LineChartData weekChartData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          dashArray: [5],
          color: Colors.white24,
          strokeWidth: .5,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          dashArray: [5],
          color: Colors.white24,
          strokeWidth: .5,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: weekBottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: Colors.white24,
      ),
    ),
    minX: 1,
    maxX: 7,
    minY: 0,
    maxY: 1000,
    lineBarsData: [
      LineChartBarData(
        isStrokeCapRound: true,
        spots: StatisticController.statisticController.weekChartData,
        isCurved: true,
        barWidth: 3,
        show: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          gradient: LinearGradient(colors: [
            const Color(0xff095260).withOpacity(.3),
            const Color(0xff0bcdac).withOpacity(.3)
          ]),
          show: true,
        ),
      ),
    ],
  );
}

LineChartData monthChartData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          dashArray: [5],
          color: Colors.white24,
          strokeWidth: .5,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          dashArray: [5],
          color: Colors.white24,
          strokeWidth: .5,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: monthBottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: Colors.white24,
      ),
    ),
    minX: 1,
    maxX: 30,
    minY: 0,
    maxY: 1000,
    lineBarsData: [
      LineChartBarData(
        isStrokeCapRound: true,
        spots: StatisticController.statisticController.monthChartData,
        isCurved: true,
        barWidth: 3,
        show: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          gradient: LinearGradient(colors: [
            const Color(0xff095260).withOpacity(.3),
            const Color(0xff0bcdac).withOpacity(.3)
          ]),
          show: true,
        ),
      ),
    ],
  );
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/modules/focus/bar_graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      weeklySummary[0],
      weeklySummary[1],
      weeklySummary[2],
      weeklySummary[3],
      weeklySummary[4],
      weeklySummary[5],
      weeklySummary[6],
    );
    barData.init();

    return BarChart(
        BarChartData(
          minY: 0,
          maxY: 10,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getTitles,
                reservedSize: 32,
              ),
            ),
          ),
          barGroups: barData.data
              .map((data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Theme.of(context).colorScheme.primary,
                    width: 25,
                    borderRadius: BorderRadius.circular(2),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 10,
                      color: Theme.of(context).colorScheme.surface,
                    )
                )
              ]
          )).toList(),
        )
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    const weekendsStyle = TextStyle(
      color: Color(0xFFD86461),
      // fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Sun', style: weekendsStyle);
        break;
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Tue', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 4:
        text = const Text('Thu', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 6:
        text = const Text('Sat', style: weekendsStyle);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      space: 16,
      meta: meta,
      child: text,
    );
  }
}
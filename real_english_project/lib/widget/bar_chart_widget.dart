import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/day_ıtem.dart';

class BarChartContent extends StatelessWidget {

  ///Bu listeye SharedPreference dan bilgi gelecek şekilde düzenle
  final List<DayItem> barChartGroupData = [
    DayItem(x: 1, y: 20),DayItem(x: 2, y: 25),DayItem(x: 3, y: 15),DayItem(x: 4, y: 10),DayItem(x: 5, y: 22),DayItem(x: 6, y: 17),DayItem(x: 7, y: 13)
  ];


  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          borderData: FlBorderData(
              border: Border.all(
                  color: Colors.white,
                  width:
                      0.5)),
          maxY: 60,
          barGroups: barChartGroupData
              .map((dayItem) => BarChartGroupData(x: dayItem.x, barRods: [
                    BarChartRodData(
                        width: 30, toY: dayItem.y, color: Colors.white)
                  ]))
              .toList(),
          titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                interval: 5,
                showTitles: true,
                getTitlesWidget: (value, TitleMeta a) {
                  /// value => barChartGroupData da ki x değerlerinden geliyor
                  switch (value.toInt()) {
                    case 1:
                      return Text('Mon');
                    case 2:
                      return Text('Tues');
                    case 3:
                      return Text('Wed');
                    case 4:
                      return Text('Thu');
                    case 5:
                      return Text('Fri');
                    case 6:
                      return Text('Sat');
                    case 7:
                      return Text('Sun');
                  }
                  return Text('');
                },
              )))),
    );
  }
}

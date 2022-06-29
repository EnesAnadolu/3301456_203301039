
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/day_ıtem.dart';
import '../widget/bar_chart_widget.dart';
import '../widget/chart_container.dart';

class AppUsageChart extends StatefulWidget {
  AppUsageChart({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AppUsageChartState createState() => _AppUsageChartState();
}

class _AppUsageChartState extends State<AppUsageChart> {
  late SharedPreferences preferences;
  List<String> keys = ["pzt", "sali", "crs", "prs", "cum", "cmt", "pzr"];

  late List<DayItem> barChartGroupData = List.generate(7, (index) => DayItem(x: index + 1, y: 10));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    //barChartGroupData =List.generate(7, (index) => DayItem(x: index + 1, y: double.parse(preferences.getString(keys[1]) ?? "0")));
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future setTime(String time, String key) async {
    await preferences.setString(key, time);
  }

  String getTime(String key) {
    return preferences.getString(key)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Color(0xfff0f0f0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            children: <Widget>[
              if(barChartGroupData.isEmpty)
                CircularProgressIndicator(),
              ChartContainer(
                  title: 'App Usage Chart',
                  color: Color(0xfffc5185),
                  chart: BarChartContent()
              ),
              SizedBox(height: 20,),

            ],
          ),
        ));
  }
}


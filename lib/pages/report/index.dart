import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // 初始化日期选择器的初始值和选择范围
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime(2021, 1, 1);
  DateTime endDate = DateTime.now();

  // 初始化饼图数据
  final List<PieChartSectionData> pieChartData = [
    PieChartSectionData(
      value: 20,
      title: 'Food',
      color: Colors.blue[400],
    ),
    PieChartSectionData(
      value: 30,
      title: 'Entertainment',
      color: Colors.green[400],
    ),
    PieChartSectionData(
      value: 10,
      title: 'Transportation',
      color: Colors.yellow[400],
    ),
    PieChartSectionData(
      value: 40,
      title: 'Others',
      color: Colors.red[400],
    ),
  ];

  // 初始化趋势条形图数据
  final List<BarChartGroupData> barChartData = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 20,
          color: Colors.blue[400],
        ),
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          color: Colors.green[400],
          toY: 30,
        ),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          color: Colors.yellow[400],
          toY: 10,
        ),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          color: Colors.red[400],
          toY: 40,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Report'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          // 饼图
          AspectRatio(
            aspectRatio: 1.2,
            child: PieChart(
              PieChartData(
                sections: pieChartData,
                // 设置中心圆的半径和颜色
                centerSpaceRadius: 40,
                centerSpaceColor: Colors.white,
                // 饼图的各种样式
                sectionsSpace: 0,
                pieTouchData: PieTouchData(
                  touchCallback: (event, pieTouchResponse) {},
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                // 饼图的动画效果
                // sectionsCount: pieChartData.length,
                // animationDuration: Duration(milliseconds: 800),
                // animate: true,
              ),
            ),
          ),
          // 日期选择器
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                  height: 150,
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: startDate,
                      maximumDate: endDate,
                      initialDateTime: selectedDate,
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          selectedDate = value;
                        });
                      })))
        ])));
  }
}

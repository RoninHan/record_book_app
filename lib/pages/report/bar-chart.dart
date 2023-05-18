import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 360,
        height: 250,
        child: Container(
          child: Echarts(
            option: '''
    {
      xAxis: {
        type: 'category',
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'line'
      }]
    }
  ''',
          ),
        ));
  }
}

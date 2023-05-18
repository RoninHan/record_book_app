import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 350,
      child: Echarts(
        option: '''
    {
      tooltip: {
        trigger: 'item'
      },
      
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          label: {
            show: false,
            position: 'center'
          },
          label: {
            show: true,
          },
          data: [
            { value: 1048, name: 'Search Engine' },
            { value: 735, name: 'Direct' },
            { value: 580, name: 'Email' },
            { value: 484, name: 'Union Ads' },
            { value: 300, name: 'Video Ads' }
          ]
        }
      ]
    }
  ''',
      ),
    );
  }
}

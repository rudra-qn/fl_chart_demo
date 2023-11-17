import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfBarChartPage extends StatefulWidget {
  const SfBarChartPage({super.key});

  @override
  State<SfBarChartPage> createState() => _SfBarChartPageState();
}

class ChartSampleData {
  final int x;
  final int y;

  ChartSampleData({required this.x, required this.y});
}

class _SfBarChartPageState extends State<SfBarChartPage> {
  /// Specifies the list of chart sample data.
  List<ChartSampleData> chartData = <ChartSampleData>[];

  final stream = Stream.periodic(const Duration(seconds: 1), (count) => count);

  @override
  void initState() {
    super.initState();
    stream.listen((event) {
      setState(() {
        if (chartData.length >= 10) {
          chartData.removeAt(0);
        }
        chartData.add(ChartSampleData(x: event, y: Random().nextInt(100)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          child: SfCartesianChart(
        primaryXAxis: NumericAxis(),
        primaryYAxis: NumericAxis(),
        series: <ColumnSeries<ChartSampleData, num>>[
          ColumnSeries<ChartSampleData, num>(
              dataSource: chartData,
              xValueMapper: (ChartSampleData data, _) => data.x,
              yValueMapper: (ChartSampleData data, _) => data.y,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              animationDuration: 0),
        ],
      )),
    ));
  }
}

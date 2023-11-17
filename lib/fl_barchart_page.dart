import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final barGroups = <BarChartGroupData>[];
  final stream = Stream.periodic(const Duration(seconds: 2), (count) => count);

  @override
  void initState() {
    super.initState();
    stream.listen((event) {
      setState(() {
        if (barGroups.length >= 10) {
          barGroups.removeAt(0);
        }
        barGroups.add(BarChartGroupData(
            x: event,
            barRods: [BarChartRodData(toY: Random().nextInt(100).toDouble())]));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Fl Chart"),
        ),
        body: Center(
            child:
            BarChart(BarChartData(barGroups: barGroups, maxY: 500, minY: 0
              // gridData: FlGridData(
              //     drawHorizontalLine: true, drawVerticalLine: false),
              // borderData: FlBorderData(show: false),
              // titlesData: FlTitlesData(show: false)
            ))));
  }
}
import 'package:bottomstreet/performanceitem.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PerformanceWidget extends StatelessWidget {
  final PerformanceItem item;

  const PerformanceWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item.Label),
        item.ChangePercent > 0
            ? LinearPercentIndicator(
                width: 150,
                lineHeight: 25,
                percent: item.ChangePercent > 100
                    ? double.parse((1).toStringAsFixed(2))
                    : double.parse(
                        (item.ChangePercent.abs() / 100).toStringAsFixed(2)),
                backgroundColor: Colors.white,
                progressColor: Colors.green[800],
              )
            : LinearPercentIndicator(
                width: 150,
                lineHeight: 25,
                percent: item.ChangePercent > 100
                    ? double.parse((1).toStringAsFixed(2))
                    : double.parse(
                        (item.ChangePercent.abs() / 100).toStringAsFixed(2)),
                backgroundColor: Colors.white,
                progressColor: Colors.red[800],
              ),
        item.ChangePercent > 0
            ? Text(
                "🔺" +
                    double.parse((item.ChangePercent.abs()).toStringAsFixed(2))
                        .toString() +
                    "%",
                style: const TextStyle(color: Colors.green),
              )
            : Text(
                "🔻" +
                    double.parse((item.ChangePercent.abs()).toStringAsFixed(2))
                        .toString() +
                    "%",
                style: const TextStyle(color: Colors.red),
              )
      ],
    );
  }
}

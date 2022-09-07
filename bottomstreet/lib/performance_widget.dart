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
        LinearPercentIndicator(
          width: 150,
          percent: item.ChangePercent.toDouble().abs(),
          backgroundColor: Colors.white,
          progressColor: Colors.green[800],
        ),
        item.ChangePercent > 0
            ? Text(
                item.ChangePercent.toDouble().toString() + "%",
                style: const TextStyle(color: Colors.green),
              )
            : Text(
                item.ChangePercent.toDouble().toString() + "%",
                style: const TextStyle(color: Colors.red),
              )
      ],
    );
  }
}

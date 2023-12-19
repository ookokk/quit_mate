import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomPercentIndicator extends StatelessWidget {
  final double percent;
  const CustomPercentIndicator({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animationDuration: 1500,
      percent: percent,
      animateFromLastPercent: true,
      progressColor: Colors.blue,
      animation: false,
      lineHeight: 3,
    );
  }
}

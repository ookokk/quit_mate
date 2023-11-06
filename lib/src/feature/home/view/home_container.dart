import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeContainer extends ConsumerWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    StreamController<double> secondStreamController =
        StreamController<double>();

    double currentSecond = 0.0; // Başlangıç saniyesi

    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSecond += 1.0; // Her saniyede bir saniyeyi artır
      secondStreamController.sink.add(currentSecond);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SizedBox(
          height: 500,
          child: Center(
            child: StreamBuilder<double>(
              stream: secondStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  double second = snapshot.data!;

                  return SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Saniye: $second",
                          style: currentTheme.textTheme.displaySmall,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              gridData: const FlGridData(show: false),
                              titlesData: const FlTitlesData(show: false),
                              borderData: FlBorderData(show: false),
                              barGroups: [
                                BarChartGroupData(x: 0, barRods: [
                                  BarChartRodData(
                                    fromY: 60 - second,
                                    toY: 60,
                                    width: 16,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Text("Veri alınamadı...");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

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

    StreamController<Map<String, double>> dataStreamController =
        StreamController<Map<String, double>>();

    double currentSecond = 0.0;
    double currentMinute = 0.0;
    double currentHour = 0.0;
    double currentDay = 0.0;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSecond += 1.0;
      if (currentSecond >= 60) {
        currentSecond = 0.0;
        currentMinute += 1.0;
      }

      if (currentMinute >= 60) {
        currentMinute = 0.0;
        currentHour += 1.0;
      }

      if (currentHour >= 24) {
        currentHour = 0.0;
        currentDay += 1.0;
      }

      dataStreamController.sink.add({
        'second': currentSecond,
        'minute': currentMinute,
        'hour': currentHour,
        'day': currentDay,
      });
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SizedBox(
          height: 500,
          child: StreamBuilder<Map<String, double>>(
            stream: dataStreamController.stream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (data == null) {
                return CircularProgressIndicator();
              }
              final currentSecond = data['second'] ?? 0.0;
              final currentMinute = data['minute'] ?? 0.0;
              final currentHour = data['hour'] ?? 0.0;
              final currentDay = data['day'] ?? 0.0;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        print(currentSecond);
                      },
                      icon: Icon(Icons.plus_one_outlined),
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
                                fromY: 24 - currentDay,
                                toY: 24,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                fromY: 24 - currentHour,
                                toY: 24,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                fromY: 60 - currentMinute,
                                toY: 60,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                fromY: 60 - currentSecond,
                                toY: 60,
                                width: 16,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

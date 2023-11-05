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

    StreamController<int> secondStreamController = StreamController<int>();

    int currentSecond = 0; // Başlangıç saniyesi

    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSecond += 1; // Her saniyede bir saniyeyi artır
      secondStreamController.sink.add(currentSecond);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SizedBox(
          height: 500,
          child: Center(
            child: StreamBuilder<int>(
              stream: secondStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int second = snapshot.data!;

                  return SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Saniye: $second"),
                        const SizedBox(height: 16),
                        BarChart(
                          BarChartData(
                            titlesData: const FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(
                                  fromY: 0,
                                  toY: second
                                      .toDouble(), // Çubuğun bitiş yüksekliği
                                  width: 16,
                                ),
                              ]),
                            ],
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

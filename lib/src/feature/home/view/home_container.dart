import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quit_mate/src/feature/home/viewmodel/home_container_mixin.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';
import 'dart:async';

class HomeContainer extends ConsumerStatefulWidget {
  final UserRepository userRepository = UserRepository();
  HomeContainer({Key? key}) : super(key: key);
  @override
  ConsumerState<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends ConsumerState<HomeContainer>
    with HomeContainerMixin {
  double currentSecond = 0;
  double currentMinute = 10.0;
  double currentHour = 10.0;
  double currentDay = 10.0;
  DateTime? soberStartDate;

  final StreamController<Map<String, double>> dataStreamController =
      StreamController<Map<String, double>>();

  @override
  void initState() {
    super.initState();

    widget.userRepository.getUser('user123').then((user) {
      if (user != null) {
        soberStartDate = user.soberStartDate;

        void updateData() {
          if (soberStartDate != null) {
            DateTime now = DateTime.now();
            Duration duration = now.difference(soberStartDate!);

            int days = duration.inDays;
            int hours = duration.inHours % 24;
            int minutes = duration.inMinutes % 60;
            int seconds = duration.inSeconds % 60;

            setState(() {
              currentDay = days.toDouble();
              currentHour = hours.toDouble();
              currentMinute = minutes.toDouble();
              currentSecond = seconds.toDouble();
            });

            dataStreamController.sink.add({
              'day': currentDay,
              'hour': currentHour,
              'minute': currentMinute,
              'second': currentSecond,
            });
          }
        }

        Timer.periodic(const Duration(seconds: 1), (timer) {
          updateData();
        });

        // İlk veriyi güncelleyin
        updateData();
      }
    });
  }

  int calculateDaysDifference(DateTime startDate, DateTime endDate) {
    final difference = endDate.difference(startDate);
    return difference.inDays;
  }

  @override
  void dispose() {
    dataStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SizedBox(
          height: 700,
          child: StreamBuilder<Map<String, double>>(
            stream: dataStreamController.stream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (data == null) {
                return const CircularProgressIndicator();
              }
              final currentSecond = data['second'] ?? 0.0;
              final currentMinute = data['minute'] ?? 0.0;
              final currentHour = data['hour'] ?? 0.0;
              final currentDay = data['day'] ?? 0.0;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          print(currentDay);
                          print(currentHour);
                          print(currentMinute);
                          print(currentSecond);
                        },
                        child: Text('check')),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          gridData: const FlGridData(show: true),
                          titlesData: const FlTitlesData(show: true),
                          borderData: FlBorderData(show: true),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                fromY: currentDay,
                                toY: 0,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                fromY: currentHour,
                                toY: 0,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                fromY: currentMinute,
                                toY: 0,
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

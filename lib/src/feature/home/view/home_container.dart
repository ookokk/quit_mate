import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class HomeContainer extends ConsumerWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    StreamController<Map<String, double>> dataStreamController =
        StreamController<Map<String, double>>();

    double currentSecond = 50.0;
    double currentMinute = 10.0;
    double currentHour = 10.0;
    double currentDay = 10.0;
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
    final UserRepository userRepository = UserRepository();
    final String userId = "user123";

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
                    IconButton(
                      onPressed: () {
                        print(currentSecond);
                        print(currentMinute);
                        print(currentHour);
                        print(currentDay);
                      },
                      icon: const Icon(Icons.plus_one_outlined),
                    ),
                    IconButton(
                      onPressed: () async {
                        // Kullanıcı verilerini kaydet
                        final user = SoberUser(
                          addictiveFactor: "Example",
                          soberStartDate: DateTime.now(),
                          weeklyUse: 3,
                          dailyUseOnDays: 2,
                          pledgeTime: const TimeOfDay(hour: 12, minute: 12),
                          reviewTime: const TimeOfDay(hour: 11, minute: 11),
                        );
                        await userRepository.saveUser(userId, user);
                        print("Kullanıcı verileri kaydedildi.");
                      },
                      icon: Text(
                        'Set',
                        style: currentTheme.textTheme.bodyLarge,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        // Kullanıcı verilerini al
                        final retrievedUser =
                            await userRepository.getUser(userId);
                        if (retrievedUser != null) {
                          print(
                              "Kullanıcı verileri alındı: ${retrievedUser.toJson()}");
                        } else {
                          print("Kullanıcı bulunamadı.");
                        }
                      },
                      icon: Text(
                        'Get',
                        style: currentTheme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    /*Expanded(
                      child: BarChart(
                        BarChartData(
                          gridData: const FlGridData(show: true),
                          titlesData: const FlTitlesData(show: true),
                          borderData: FlBorderData(show: true),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                fromY: 24 - currentDay,
                                toY: 0,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                fromY: 24 - currentHour,
                                toY: 0,
                                width: 16,
                              ),
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                fromY: 60 - currentMinute,
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
                    ),*/
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

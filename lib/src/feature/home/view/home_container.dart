import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quit_mate/src/feature/home/viewmodel/home_container_mixin.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class HomeContainer extends ConsumerStatefulWidget {
  final UserRepository userRepository = UserRepository();
  HomeContainer({Key? key}) : super(key: key);
  @override
  ConsumerState<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends ConsumerState<HomeContainer>
    with HomeContainerMixin {
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
                    IconButton(
                      onPressed: () {
                        /* widget.userRepository.getUser('user123').then((user) {
                          print(user?.soberStartDate);
                        });*/
                      },
                      icon: const Icon(Icons.plus_one_outlined),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
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

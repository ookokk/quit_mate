import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/device_size.dart';
import 'package:quit_mate/src/core/const/project_radius.dart';
import 'package:quit_mate/src/core/const/strings.dart';
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
    return Container(
      color: currentTheme.scaffoldBackgroundColor,
      height: DeviceSize.kHeight(context) * 0.4,
      child: StreamBuilder<Map<String, double>>(
        stream: dataStreamController.stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const SizedBox(
                height: 50, width: 50, child: CircularProgressIndicator());
          }
          final currentSecond = data['second'] ?? 0.0;
          final currentMinute = data['minute'] ?? 0.0;
          final currentHour = data['hour'] ?? 0.0;
          final currentDay = data['day'] ?? 0.0;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: DeviceSize.kHeight(context) * 0.4,
                child: BarChart(
                  swapAnimationDuration: const Duration(milliseconds: 300),
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 60,
                    minY: 0,
                    gridData: const FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      topTitles: buildTopData(currentDay, currentHour,
                          currentMinute, currentSecond, currentTheme),
                      leftTitles: const AxisTitles(drawBelowEverything: false),
                      rightTitles: const AxisTitles(
                        drawBelowEverything: false,
                      ),
                      bottomTitles: buildBottomData(currentTheme),
                      show: true,
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                            fromY: 0,
                            toY: currentYear,
                            width: 35,
                            borderRadius: BorderRadius.circular(
                                ProjectRadius.small.value)),
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                            fromY: 0,
                            toY: currentMonth,
                            width: 35,
                            borderRadius: BorderRadius.circular(
                                ProjectRadius.small.value)),
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                            fromY: 0,
                            toY: currentDay,
                            width: 35,
                            borderRadius: BorderRadius.circular(
                                ProjectRadius.small.value)),
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(
                            fromY: 0,
                            toY: currentHour,
                            width: 35,
                            borderRadius: BorderRadius.circular(
                                ProjectRadius.small.value)),
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(
                            fromY: 0,
                            toY: currentMinute,
                            width: 35,
                            borderRadius: BorderRadius.circular(
                                ProjectRadius.small.value)),
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(
                            fromY: 0,
                            toY: currentSecond,
                            width: 35,
                            borderRadius: BorderRadius.circular(
                                ProjectRadius.small.value)),
                      ]),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  AxisTitles buildBottomData(ThemeData currentTheme) {
    return AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (double value, TitleMeta meta) {
              final titles = [
                Strings.year,
                Strings.month,
                Strings.day,
                Strings.hour,
                Strings.minute,
                Strings.second,
              ];
              return Text(
                titles[value.toInt()],
                style: currentTheme.textTheme.titleSmall,
              );
            }));
  }

  AxisTitles buildTopData(double currentDay, double currentHour,
      double currentMinute, double currentSecond, ThemeData currentTheme) {
    return AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              final titles = [
                currentYear.toInt(),
                currentMonth.toInt(),
                currentDay.toInt(),
                currentHour.toInt(),
                currentMinute.toInt(),
                currentSecond.toInt(),
              ];

              return Text(
                titles[value.toInt()].toString(),
                style: currentTheme.textTheme.titleSmall,
              );
            }));
  }
}

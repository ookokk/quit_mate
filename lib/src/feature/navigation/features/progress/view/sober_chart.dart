import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/material/project_radius.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/sober_chart_viewmodel.dart';

class SoberChart extends ConsumerWidget {
  final double currentYear = 0;
  final double currentMonth = 0;
  const SoberChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final soberChartViewModel = ref.watch(soberChartProvider);
    return Container(
      color: currentTheme.hoverColor,
      height: DeviceSize.kHeight(context) * 0.35,
      child: StreamBuilder<Map<String, double>>(
        stream: soberChartViewModel.dataStreamController.stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  children: [
                    Icon(
                      Icons.refresh,
                      color: currentTheme.indicatorColor,
                    ),
                  ],
                ));
          }
          final currentSecond = data['second'] ?? 0.0;
          final currentMinute = data['minute'] ?? 0.0;
          final currentHour = data['hour'] ?? 0.0;
          final currentDay = data['day'] ?? 0.0;
          final currentMonth = data['month'] ?? 0.0;
          final currentYear = data['year'] ?? 0.0;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "iHaveBeen".tr(),
                style: currentTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: DeviceSize.kWidth(context),
                height: DeviceSize.kHeight(context) * 0.35,
                child: BarChart(
                  swapAnimationDuration: const Duration(milliseconds: 100),
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 60,
                    minY: 0,
                    gridData: const FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      topTitles: buildTopData(data, currentTheme),
                      leftTitles: const AxisTitles(drawBelowEverything: false),
                      rightTitles: const AxisTitles(
                        drawBelowEverything: false,
                      ),
                      bottomTitles: buildBottomData(currentTheme),
                      show: true,
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      buildBarChartGroupData(
                          0, 0, currentYear, currentTheme, Colors.green),
                      buildBarChartGroupData(
                          1, 0, currentMonth, currentTheme, Colors.deepPurple),
                      buildBarChartGroupData(
                          2, 0, currentDay, currentTheme, Colors.red),
                      buildBarChartGroupData(
                          3, 0, currentHour, currentTheme, Colors.deepPurple),
                      buildBarChartGroupData(
                          4, 0, currentMinute, currentTheme, Colors.green),
                      buildBarChartGroupData(
                          5, 0, currentSecond, currentTheme, Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  AxisTitles buildTopData(Map<String, double> data, ThemeData currentTheme) {
    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          final titles = [
            data['year']?.toInt() ?? 0,
            data['month']?.toInt() ?? 0,
            data['day']?.toInt() ?? 0,
            data['hour']?.toInt() ?? 0,
            data['minute']?.toInt() ?? 0,
            data['second']?.toInt() ?? 0,
          ];
          return Text(
            titles[value.toInt()].toString(),
            style: currentTheme.textTheme.titleSmall
                ?.copyWith(color: Colors.white),
          );
        },
      ),
    );
  }

  BarChartGroupData buildBarChartGroupData(
    int x,
    double fromY,
    double toY,
    ThemeData currentTheme,
    Color color,
  ) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
          color: color,
          fromY: fromY,
          toY: toY,
          width: 35,
          borderRadius: BorderRadius.circular(ProjectRadius.small.value)),
    ]);
  }

  AxisTitles buildBottomData(ThemeData currentTheme) {
    return AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (double value, TitleMeta meta) {
              final titles = [
                "year".tr(),
                "month".tr(),
                "day".tr(),
                "hour".tr(),
                "minute".tr(),
                "second".tr(),
              ];
              return Text(
                titles[value.toInt()],
                style: currentTheme.textTheme.titleSmall
                    ?.copyWith(color: Colors.white),
              );
            }));
  }
}

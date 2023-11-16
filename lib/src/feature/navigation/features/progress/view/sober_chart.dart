import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/material/project_radius.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/sober_chart_mixin.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class SoberChart extends ConsumerStatefulWidget {
  final UserRepository userRepository = UserRepository();
  SoberChart({Key? key}) : super(key: key);
  @override
  ConsumerState<SoberChart> createState() => _SoberChartState();
}

class _SoberChartState extends ConsumerState<SoberChart>
    with SoberChartMixin, WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);
    return Container(
      color: currentTheme.hoverColor,
      height: DeviceSize.kHeight(context) * 0.4,
      child: StreamBuilder<Map<String, double>>(
        stream: dataStreamController.stream,
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Strings.iHaveBeen,
                style: currentTheme.textTheme.bodyMedium,
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
                      buildBarChartGroupData(
                          0, 0, currentYear, currentTheme, Colors.deepPurple),
                      buildBarChartGroupData(
                          1, 0, currentMonth, currentTheme, Colors.green),
                      buildBarChartGroupData(
                          2, 0, currentDay, currentTheme, Colors.red),
                      buildBarChartGroupData(
                          3, 0, currentHour, currentTheme, Colors.deepPurple),
                      buildBarChartGroupData(
                          4, 0, currentMinute, currentTheme, Colors.green),
                      buildBarChartGroupData(
                          5, 0, currentSecond, currentTheme, Colors.yellow),
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

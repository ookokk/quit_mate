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
        child: Container(
      color: currentTheme.scaffoldBackgroundColor,
      height: 400,
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
              TextButton(
                  onPressed: () async {
                    print(currentDay);
                    print(currentHour);
                    print(currentMinute);
                    print(currentSecond);
                  },
                  child: Text('check')),
              SizedBox(
                height: 400,
                child: BarChart(
                  swapAnimationDuration: const Duration(milliseconds: 300),
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 60,
                    minY: 0,
                    gridData: const FlGridData(show: true),
                    titlesData: const FlTitlesData(show: true),
                    borderData: FlBorderData(show: true),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                            fromY: 60 - currentDay,
                            toY: 60,
                            width: 35,
                            borderRadius: BorderRadius.circular(5)),
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                            fromY: 60 - currentHour,
                            toY: 60,
                            width: 35,
                            borderRadius: BorderRadius.circular(5)),
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                            fromY: 60 - currentMinute,
                            toY: 60,
                            width: 35,
                            borderRadius: BorderRadius.circular(5)),
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(
                            fromY: 60 - currentSecond,
                            toY: 60,
                            width: 35,
                            borderRadius: BorderRadius.circular(5)),
                      ]),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}

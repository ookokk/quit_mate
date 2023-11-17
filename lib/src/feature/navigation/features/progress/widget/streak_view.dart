import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/sober_chart_viewmodel.dart';

class StreakView extends ConsumerWidget {
  const StreakView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final soberProvider = ref.watch(soberChartProvider);
    final totalDaysSober = soberProvider.calculateTotalDaysSober();
    return Container(
      color: currentTheme.hoverColor,
      child: Column(
        children: [
          Expanded(
            child: Text(Strings.mySoberStreak,
                style: currentTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white)),
          ),
          Expanded(
              child: Text(totalDaysSober.toString(),
                  style: currentTheme.textTheme.displayLarge
                      ?.copyWith(color: Colors.white))),
          Expanded(
              child: Text(Strings.days,
                  style: currentTheme.textTheme.bodyLarge
                      ?.copyWith(color: Colors.white))),
        ],
      ),
    );
  }
}

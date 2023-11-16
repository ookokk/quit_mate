import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/sober_chart_viewmodel.dart';

class YearsView extends ConsumerWidget {
  const YearsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final soberProvider = ref.watch(soberChartProvider);
    final double month = soberProvider.currentMonth;
    final double year = soberProvider.currentYear;
    return Container(
        color: currentTheme.hoverColor,
        child: Stack(
          children: [
            Positioned.fill(
                child: Lottie.asset('assets/animations/congrats.json',
                    animate: false)),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                Strings.iHaveBeen,
                style: currentTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 35, child: Text(year.toInt().toString())),
                    Text(
                      Strings.year,
                      style: currentTheme.textTheme.headlineSmall
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Text(month.toInt().toString()),
                    ),
                    Text(
                      Strings.month,
                      style: currentTheme.textTheme.headlineSmall
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

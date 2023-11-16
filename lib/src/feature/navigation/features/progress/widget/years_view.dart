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
                    animate: true)),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                Strings.iHaveBeen,
                style: currentTheme.textTheme.bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            NumberCircleAvatar(
              soberDifferenceNumber: year,
              currentTheme: currentTheme,
              alignment: Alignment.centerLeft,
              underText: Strings.year,
            ),
            NumberCircleAvatar(
              soberDifferenceNumber: month,
              currentTheme: currentTheme,
              alignment: Alignment.centerRight,
              underText: Strings.month,
            ),
          ],
        ));
  }
}

class NumberCircleAvatar extends StatelessWidget {
  const NumberCircleAvatar({
    super.key,
    required this.soberDifferenceNumber,
    required this.currentTheme,
    required this.alignment,
    required this.underText,
  });
  final AlignmentGeometry alignment;
  final double soberDifferenceNumber;
  final ThemeData currentTheme;
  final String underText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Colors.deepPurple.shade900,
                radius: 35,
                child: Text(soberDifferenceNumber.toInt().toString(),
                    style: currentTheme.textTheme.headlineSmall
                        ?.copyWith(color: Colors.white))),
            Text(
              underText,
              style: currentTheme.textTheme.headlineSmall
                  ?.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/custom_number_picker_weekly.dart';
import 'package:quit_mate/src/feature/get_user_information/widget/custom_percent_indicator.dart';

class WeeklyFrequencyOfUseView extends ConsumerWidget {
  const WeeklyFrequencyOfUseView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 18,
            ),
            const CustomPercentIndicator(percent: 0.6),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.howMany,
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const CustomNumberPickerWeekly(
              minValue: 0,
              maxValue: 7,
            )
          ],
        ),
      ),
    ));
  }
}

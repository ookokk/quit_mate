// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_percent_indicator.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/sober_start_date_row.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';

class SoberStartDateView extends ConsumerWidget {
  SoberStartDateView({
    super.key,
  });
  DateTime? selectedDate = DateTime.now();
  final SoberUser mySoberUser = SoberUser();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            const CustomPercentIndicator(percent: 0.4),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "whenWas".tr(),
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SoberStartDateRow()
          ],
        ),
      ),
    ));
  }
}

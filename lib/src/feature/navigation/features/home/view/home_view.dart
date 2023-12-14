import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/view/sober_page_view.dart';
import 'package:quit_mate/src/feature/navigation/features/progress/viewmodel/sober_chart_viewmodel.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final soberProvider = ref.watch(soberChartProvider);
    final totalDaysSober = soberProvider.calculateTotalDaysSober();
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SoberPageView(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "lastMilestone".tr(),
                  style: currentTheme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(
              width: DeviceSize.kWidth(context),
              child: Card(
                color: currentTheme.primaryColorDark,
                child: Column(
                  children: [
                    Text(
                      "$totalDaysSober    ${"days".tr()}",
                      style: currentTheme.textTheme.titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

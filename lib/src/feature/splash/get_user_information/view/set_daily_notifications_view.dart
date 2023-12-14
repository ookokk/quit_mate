import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_percent_indicator.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_pledge_time_picker.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_review_time_picker.dart';

class SetDailyNotificationsView extends ConsumerWidget {
  const SetDailyNotificationsView({
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
            const CustomPercentIndicator(percent: 1),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "confirmYourDaily".tr(),
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              width: DeviceSize.kWidth(context) * 0.9,
              height: DeviceSize.kHeight(context) * 0.06,
              child: Card(
                color: currentTheme.scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "pledge".tr(),
                          style: currentTheme.textTheme.titleMedium,
                        ),
                      ),
                      const Expanded(
                        child: CustomPledgeTimePicker(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: DeviceSize.kWidth(context) * 0.9,
              height: DeviceSize.kHeight(context) * 0.06,
              child: Card(
                color: currentTheme.scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "review".tr(),
                          style: currentTheme.textTheme.titleMedium,
                        ),
                      ),
                      const Expanded(
                        child: CustomReviewTimePicker(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "youWillReceive".tr(),
              style: currentTheme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    ));
  }
}

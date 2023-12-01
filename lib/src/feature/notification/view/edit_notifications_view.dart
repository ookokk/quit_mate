import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/material/device_size.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/notification/model/notification_service.dart';
import 'package:quit_mate/src/feature/settings/widget/settings_alert_dialog.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_pledge_time_picker.dart';
import 'package:quit_mate/src/feature/splash/get_user_information/widget/custom_review_time_picker.dart';
import 'package:quit_mate/src/product/widget/custom_app_bar.dart';

class EditNotificationsView extends ConsumerWidget {
  const EditNotificationsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final ntfService = NotificationService();
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.confirmYourDaily,
                style: currentTheme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TimePickerRow(
              currentTheme: currentTheme,
              text: Strings.pledge,
              child: const CustomPledgeTimePicker(),
            ),
            const SizedBox(
              height: 14,
            ),
            TimePickerRow(
              currentTheme: currentTheme,
              text: Strings.review,
              child: const CustomReviewTimePicker(),
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              Strings.youWillReceive,
              style: currentTheme.textTheme.titleSmall,
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: DeviceSize.kWidth(context) * 0.9,
              height: DeviceSize.kHeight(context) * 0.06,
              child: Card(
                elevation: 3,
                color: currentTheme.scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          Strings.muteNotifications,
                          style: currentTheme.textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                          child: IconButton(
                        onPressed: () {
                          SettingsAlertDialog().showSettingsAlertDialog(
                              context, ref, () {
                            ntfService.cancelNotifications();
                          },
                              MaterialStateProperty.all(Colors.red.shade200),
                              Strings.warning,
                              Strings.areYouSureTurnOff,
                              Strings.yes);
                        },
                        icon: Icon(
                          Icons.notifications_off_outlined,
                          color: currentTheme.indicatorColor,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class TimePickerRow extends StatelessWidget {
  const TimePickerRow({
    super.key,
    required this.currentTheme,
    required this.text,
    required this.child,
  });
  final String text;
  final Widget child;
  final ThemeData currentTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  text,
                  style: currentTheme.textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}

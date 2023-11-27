import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';

class CustomPledgeTimePicker extends ConsumerWidget {
  const CustomPledgeTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pledgeTime = ref.watch(pledgeTimeProvider);
    final currentTheme = ref.watch(themeProvider);
    Future ringAlarm() async {
      AwesomeNotifications().initialize("", [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ]);

      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });

      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: 'Simple Notification',
              body: 'Simple body'));
    }

    return Column(
      children: [
        IconButton(
            onPressed: () {
              ringAlarm();
            },
            icon: Icon(Icons.traffic)),
        InkWell(
          onTap: () async {
            final selectedTime = await showTimePicker(
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData(primaryColor: currentTheme.primaryColor),
                  child: child!,
                );
              },
              context: context,
              initialTime: pledgeTime ?? const TimeOfDay(hour: 8, minute: 0),
            );

            if (selectedTime != null) {
              ref.read(pledgeTimeProvider.notifier).state = selectedTime;
            }
          },
          child: Text(
            pledgeTime != null
                ? '${pledgeTime.hour}:${pledgeTime.minute.toString().padLeft(2, '0')}'
                : "kFourthSelectTime".tr(),
            style: currentTheme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

final pledgeTimeProvider =
    StateProvider<TimeOfDay?>((ref) => const TimeOfDay(hour: 08, minute: 00));

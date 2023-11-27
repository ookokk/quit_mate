import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/notification/model/my_notification.dart';
import 'package:quit_mate/src/feature/notification/model/notification_service.dart';

class CustomPledgeTimePicker extends ConsumerWidget {
  const CustomPledgeTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pledgeTime = ref.watch(pledgeTimeProvider);
    final currentTheme = ref.watch(themeProvider);
    return InkWell(
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
          final notificationService = NotificationService();
          final myNotification = MyNotification(
            title: "Notification Title",
            message: "Notification Message",
          );
          final now = DateTime.now();
          final scheduledTime = DateTime(
            now.year,
            now.month,
            now.day,
            selectedTime.hour,
            selectedTime.minute,
          );

          await notificationService.scheduleNewNotification(
            pushNotification: myNotification,
            notificationId: 1,
            interval: 1,
            scheduledTime: scheduledTime,
          );
        }
      },
      child: Text(
        pledgeTime != null
            ? '${pledgeTime.hour}:${pledgeTime.minute.toString().padLeft(2, '0')}'
            : "kFourthSelectTime".tr(),
        style: currentTheme.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}

final pledgeTimeProvider =
    StateProvider<TimeOfDay?>((ref) => const TimeOfDay(hour: 08, minute: 00));

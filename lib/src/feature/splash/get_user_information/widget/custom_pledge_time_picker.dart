import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
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
          initialTime: pledgeTime,
        );

        if (selectedTime != null) {
          ref.read(pledgeTimeProvider.notifier).state = selectedTime;
          final hour = pledgeTime.hour;
          final minute = pledgeTime.minute;
          NotificationService()
              .setNotification(hour, minute, "goodMorning".tr(), "pledge".tr());
        }
      },
      child: Text(
        '${pledgeTime.hour}:${pledgeTime.minute.toString().padLeft(2, '0')}',
        style: currentTheme.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}

final pledgeTimeProvider =
    StateProvider<TimeOfDay>((ref) => const TimeOfDay(hour: 08, minute: 00));

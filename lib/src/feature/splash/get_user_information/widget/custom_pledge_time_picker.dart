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
    return Column(
      children: [
        Expanded(
            child: IconButton(
                onPressed: () {
                  NotificationService()
                      .setNotification(pledgeTime?.hour, pledgeTime?.minute);
                  print(pledgeTime);
                },
                icon: Icon(Icons.traffic))),
        Expanded(
          child: InkWell(
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
        ),
      ],
    );
  }
}

final pledgeTimeProvider =
    StateProvider<TimeOfDay?>((ref) => const TimeOfDay(hour: 08, minute: 00));

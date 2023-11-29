import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/const/strings.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/feature/notification/model/notification_service.dart';

class CustomReviewTimePicker extends ConsumerWidget {
  const CustomReviewTimePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewTime = ref.watch(reviewTimeProvider);
    final currentTheme = ref.watch(themeProvider);
    return InkWell(
      onTap: () async {
        final selectedTime = await showTimePicker(
          builder: (BuildContext context, Widget? child) {
            return Theme(
                data: ThemeData(primaryColor: currentTheme.primaryColor),
                child: child!);
          },
          context: context,
          initialTime: reviewTime,
        );

        if (selectedTime != null) {
          ref.read(reviewTimeProvider.notifier).state = selectedTime;
          final hour = reviewTime.hour;
          final minute = reviewTime.minute;
          NotificationService()
              .setNotification(hour, minute, Strings.goodNight, Strings.review);
        }
      },
      child: Text(
        '${reviewTime.hour}:${reviewTime.minute.toString().padLeft(2, '0')}',
        style: currentTheme.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}

final reviewTimeProvider =
    StateProvider<TimeOfDay>((ref) => const TimeOfDay(hour: 21, minute: 00));

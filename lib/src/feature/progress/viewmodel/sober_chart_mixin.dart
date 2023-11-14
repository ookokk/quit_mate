import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/auth/service/auth_manager.dart';
import 'package:quit_mate/src/feature/progress/view/sober_chart.dart';
import 'dart:async';

mixin SoberChartMixin on ConsumerState<SoberChart> {
  double currentSecond = 0;
  double currentMinute = 0;
  double currentHour = 0.0;
  double currentDay = 0.0;
  double currentMonth = 0.0;
  double currentYear = 0.0;
  DateTime? soberStartDate;
  final authManager = AuthManager();
  final StreamController<Map<String, double>> dataStreamController =
      StreamController<Map<String, double>>();

  @override
  void initState() {
    super.initState();
    final String? currentUserId = authManager.getCurrentUserId();
    widget.userRepository.getUser(currentUserId ?? "").then((user) {
      if (user != null) {
        soberStartDate = user.soberStartDate;
        void updateData() {
          if (soberStartDate != null) {
            DateTime now = DateTime.now();
            Duration duration = now.difference(soberStartDate!);
            int days = duration.inDays;
            int hours = duration.inHours % 24;
            int minutes = duration.inMinutes % 60;
            int seconds = duration.inSeconds % 60;
            int months = calculateMonths(duration);
            int years = calculateYears(duration);
            if (months > 12) months = 12;
            if (days > 30) days = 30;
            if (hours > 24) hours = 24;

            setState(() {
              currentDay = days.toDouble();
              currentHour = hours.toDouble();
              currentMinute = minutes.toDouble();
              currentSecond = seconds.toDouble();
              currentMonth = months.toDouble();
              currentYear = years.toDouble();
            });

            dataStreamController.sink.add({
              'year': currentYear,
              'month': currentMonth,
              'day': currentDay,
              'hour': currentHour,
              'minute': currentMinute,
              'second': currentSecond,
            });
          }
        }

        Timer.periodic(const Duration(seconds: 1), (timer) {
          updateData();
        });

        updateData();
      }
    });
  }

  int calculateDaysDifference(DateTime startDate, DateTime endDate) {
    final difference = endDate.difference(startDate);
    return difference.inDays;
  }

  int calculateMonths(Duration duration) {
    return (duration.inDays ~/ 30);
  }

  int calculateYears(Duration duration) {
    return (duration.inDays ~/ 365);
  }

  @override
  void dispose() {
    dataStreamController.close();
    super.dispose();
  }
}

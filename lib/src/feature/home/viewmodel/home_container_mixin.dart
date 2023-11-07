import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/home/view/home_container.dart';
import 'dart:async';

mixin HomeContainerMixin on ConsumerState<HomeContainer> {
  double currentSecond = 0;
  double currentMinute = 10.0;
  double currentHour = 10.0;
  double currentDay = 10.0;
  DateTime? soberStartDate;

  final StreamController<Map<String, double>> dataStreamController =
      StreamController<Map<String, double>>();

  @override
  void initState() {
    super.initState();

    widget.userRepository.getUser('user123').then((user) {
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

            setState(() {
              currentDay = days.toDouble();
              currentHour = hours.toDouble();
              currentMinute = minutes.toDouble();
              currentSecond = seconds.toDouble();
            });

            dataStreamController.sink.add({
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

        // İlk veriyi güncelleyin
        updateData();
      }
    });
  }

  int calculateDaysDifference(DateTime startDate, DateTime endDate) {
    final difference = endDate.difference(startDate);
    return difference.inDays;
  }

  @override
  void dispose() {
    dataStreamController.close();
    super.dispose();
  }
}

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/home/view/home_container.dart';

mixin HomeContainerMixin on ConsumerState<HomeContainer> {
  double currentSecond = 50.0;
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

        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (soberStartDate != null) {
            DateTime now = DateTime.now();
            Duration duration = now.difference(soberStartDate!);

            setState(() {
              currentSecond = duration.inSeconds.toDouble();
              currentMinute = duration.inMinutes.toDouble();
              currentHour = duration.inHours.toDouble();
              currentDay = duration.inDays.toDouble();
            });

            dataStreamController.sink.add({
              'second': currentSecond,
              'minute': currentMinute,
              'hour': currentHour,
              'day': currentDay,
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    dataStreamController.close();
    super.dispose();
  }
}

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/home/view/home_container.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

mixin HomeContainerMixin on ConsumerState<HomeContainer> {
  double currentSecond = 50.0;
  double currentMinute = 10.0;
  double currentHour = 10.0;
  double currentDay = 10.0;
  final StreamController<Map<String, double>> dataStreamController =
      StreamController<Map<String, double>>();
 // final UserRepository userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSecond += 1.0;
      if (currentSecond >= 60) {
        currentSecond = 0.0;
        currentMinute += 1.0;
      }
      if (currentMinute >= 60) {
        currentMinute = 0.0;
        currentHour += 1.0;
      }
      if (currentHour >= 24) {
        currentHour = 0.0;
        currentDay += 1.0;
      }
      dataStreamController.sink.add({
        'second': currentSecond,
        'minute': currentMinute,
        'hour': currentHour,
        'day': currentDay,
      });
    });
  }

  @override
  void dispose() {
    dataStreamController.close();
    super.dispose();
  }
}

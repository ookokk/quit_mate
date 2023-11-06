import 'package:flutter/material.dart';

class SoberUser {
  final String addictiveFactor;
  final DateTime soberStartDate;
  final int weeklyUse;
  final int dailyUseOnDays;
  final TimeOfDay pledgeTime;
  final TimeOfDay reviewTime;

  SoberUser({
    required this.addictiveFactor,
    required this.soberStartDate,
    required this.weeklyUse,
    required this.dailyUseOnDays,
    required this.pledgeTime,
    required this.reviewTime,
  });
  Map<String, double> parseSoberStartDate(DateTime soberStartDate) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(soberStartDate);
    double seconds = difference.inSeconds.toDouble();
    double minutes = difference.inMinutes.toDouble();
    double hours = difference.inHours.toDouble();
    double days = difference.inDays.toDouble();

    return {
      'second': seconds,
      'minute': minutes,
      'hour': hours,
      'day': days,
    };
  }

  SoberUser.fromJson(Map<String, dynamic> json)
      : addictiveFactor = json['addictiveFactor'],
        soberStartDate = DateTime.parse(json['soberStartDate']),
        weeklyUse = json['weeklyUse'],
        dailyUseOnDays = json['dailyUseOnDays'],
        pledgeTime = TimeOfDay(
          hour: json['pledgeTime']['hour'],
          minute: json['pledgeTime']['minute'],
        ),
        reviewTime = TimeOfDay(
          hour: json['reviewTime']['hour'],
          minute: json['reviewTime']['minute'],
        );

  Map<String, dynamic> toJson() {
    return {
      'addictiveFactor': addictiveFactor,
      'soberStartDate': soberStartDate.toIso8601String(),
      'weeklyUse': weeklyUse,
      'dailyUseOnDays': dailyUseOnDays,
      'pledgeTime': {
        'hour': pledgeTime.hour,
        'minute': pledgeTime.minute,
      },
      'reviewTime': {
        'hour': reviewTime.hour,
        'minute': reviewTime.minute,
      },
    };
  }
}

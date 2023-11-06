import 'package:flutter/material.dart';

class SoberUser {
  final String addictiveFactor;
  final DateTime soberStartDate;
  final int weeklyUse;
  final int dailyUseOnDays;
  final TimeOfDay pledgeTime;
  final TimeOfDay reviewTime;

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

import 'package:flutter/material.dart';

class SoberUser {
  final String userName;
  final String addictiveFactor;
  final DateTime soberStartDate;
  final int weeklyUse;
  final int dailyUseOnDays;
  final TimeOfDay pledgeTime;
  final TimeOfDay reviewTime;

  SoberUser({
    required this.userName,
    required this.addictiveFactor,
    required this.soberStartDate,
    required this.weeklyUse,
    required this.dailyUseOnDays,
    required this.pledgeTime,
    required this.reviewTime,
  });
  SoberUser.fromJson(Map<String, dynamic> json)
      : addictiveFactor = json['addictiveFactor'] ?? '',
        soberStartDate = DateTime.parse(json['soberStartDate'] ?? ''),
        userName = json['userName'] ?? '',
        weeklyUse = json['weeklyUse'] ?? 0,
        dailyUseOnDays = json['dailyUseOnDays'] ?? 0,
        pledgeTime = _parseTime(json['pledgeTime']),
        reviewTime = _parseTime(json['reviewTime']);

  static TimeOfDay _parseTime(Map<String, dynamic>? timeData) {
    if (timeData == null) return const TimeOfDay(hour: 0, minute: 0);

    final int hour = timeData['hour'] ?? 0;
    final int minute = timeData['minute'] ?? 0;

    return TimeOfDay(hour: hour, minute: minute);
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
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

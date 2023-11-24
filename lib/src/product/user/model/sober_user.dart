import 'package:flutter/material.dart';

class SoberUser{
  String? userId;
  String? userName;
  String? email;
  String? addictiveFactor;
  DateTime? soberStartDate;
  int? weeklyUse;
  int? dailyUseOnDays;
  TimeOfDay? pledgeTime;
  TimeOfDay? reviewTime;

  static final SoberUser _instance = SoberUser._internal();
  factory SoberUser() {
    return _instance;
  }
  SoberUser._internal();

  factory SoberUser.fromJson(Map<String, dynamic> json) {
    _instance.userId = json['userId'] ?? '';
    _instance.addictiveFactor = json['addictiveFactor'] ?? '';

    final soberStartDateString = json['soberStartDate'];
    _instance.soberStartDate =
        soberStartDateString != null && soberStartDateString.isNotEmpty
            ? DateTime.tryParse(soberStartDateString) ?? DateTime.now()
            : DateTime.now();

    _instance.userName = json['userName'] ?? '';
    _instance.email = json['email'] ?? '';
    _instance.weeklyUse = json['weeklyUse'] ?? 0;
    _instance.dailyUseOnDays = json['dailyUseOnDays'] ?? 0;
    _instance.pledgeTime = _parseTime(json['pledgeTime']);
    _instance.reviewTime = _parseTime(json['reviewTime']);
    return _instance;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'addictiveFactor': addictiveFactor,
      'soberStartDate': soberStartDate?.toIso8601String(),
      'weeklyUse': weeklyUse,
      'dailyUseOnDays': dailyUseOnDays,
      'pledgeTime': {
        'hour': pledgeTime?.hour,
        'minute': pledgeTime?.minute,
      },
      'reviewTime': {
        'hour': reviewTime?.hour,
        'minute': reviewTime?.minute,
      },
    };
  }

  static TimeOfDay _parseTime(Map<String, dynamic>? timeData) {
    if (timeData == null) return const TimeOfDay(hour: 0, minute: 0);

    final int hour = timeData['hour'] ?? 0;
    final int minute = timeData['minute'] ?? 0;

    return TimeOfDay(hour: hour, minute: minute);
  }

  void setUserId(String userId) {
    this.userId = userId;
  }

  void setUserName(String userName) {
    this.userName = userName;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setAddictiveFactor(String addictiveFactor) {
    this.addictiveFactor = addictiveFactor;
  }

  void setSoberStartDate(DateTime soberStartDate) {
    this.soberStartDate = soberStartDate;
  }

  void setWeeklyUse(int weeklyUse) {
    this.weeklyUse = weeklyUse;
  }

  void setDailyUseOnDays(int dailyUseOnDays) {
    this.dailyUseOnDays = dailyUseOnDays;
  }

  void setPledgeTime(TimeOfDay pledgeTime) {
    this.pledgeTime = pledgeTime;
  }

  void setReviewTime(TimeOfDay reviewTime) {
    this.reviewTime = reviewTime;
  }
}

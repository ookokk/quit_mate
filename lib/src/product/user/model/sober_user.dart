import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/core/cache/cache_manager/cache_manager.dart';

class SoberUser {
  String? userId;
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

    _instance.weeklyUse = json['weeklyUse'] ?? 0;
    _instance.dailyUseOnDays = json['dailyUseOnDays'] ?? 0;
    _instance.pledgeTime = _parseTime(json['pledgeTime']);
    _instance.reviewTime = _parseTime(json['reviewTime']);
    return _instance;
  }
  String generateRandomUserId() {
    const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    final currentUserId = List.generate(
        10, (index) => characters[random.nextInt(characters.length)]).join();
    userId = currentUserId;
    CacheManager.setString('userId', currentUserId);
    return currentUserId;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
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

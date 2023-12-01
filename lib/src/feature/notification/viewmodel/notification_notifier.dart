import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/feature/notification/model/notification_service.dart';

class NotificationController {
  final NotificationService _notificationService = NotificationService();
  bool _notificationsEnabled = false;

  bool get notificationsEnabled => _notificationsEnabled;

  Future<void> toggleNotification(bool enable, BuildContext context) async {
    if (enable) {
      _notificationService.cancelNotifications();
    } else {
      //Navigator.pushNamed(context, '/editNotification');
      _notificationService.requestPermission();
    }
    _notificationsEnabled = enable;
  }
}

final notificationControllerProvider =
    Provider((ref) => NotificationController());

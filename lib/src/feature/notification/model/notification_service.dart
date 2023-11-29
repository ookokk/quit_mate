import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  Future setNotification(
      int? hour, int? minute, String title, String description) async {
    AwesomeNotifications().initialize('resource://drawable/logo', [
      NotificationChannel(
          channelKey: 'base',
          channelName: 'Base',
          channelDescription: 'Daily Pledge-Review Time',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white),
    ]);

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
        schedule: NotificationCalendar(
          allowWhileIdle: true,
          hour: hour ?? DateTime.now().hour,
          minute: minute ?? DateTime.now().minute,
        ),
        content: NotificationContent(
            wakeUpScreen: true,
            showWhen: false,
            id: 1,
            channelKey: 'pledge',
            title: title,
            body: description));
  }

  Future<void> requestPermission() async {
    AwesomeNotifications().isNotificationAllowed().then((allowed) {
      if (!allowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> cancelNotifications() async {
    AwesomeNotifications().cancelAll();
  }
}

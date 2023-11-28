import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();
  Future setNotification(int? hour, int? minute) async {
    AwesomeNotifications().initialize("", [
      NotificationChannel(
          channelKey: 'pledge',
          channelName: 'Pledge',
          channelDescription: 'Daily Pledge Time',
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
          repeats: true,
          hour: hour ?? DateTime.now().hour,
          minute: minute ?? DateTime.now().minute,
        ),
        content: NotificationContent(
            showWhen: false,
            id: 1,
            channelKey: 'pledge',
            title: 'Pledge Time',
            body: 'Good Morning'));
  }

  Future<void> requestPermission() async {
    AwesomeNotifications().isNotificationAllowed().then((allowed) {
      if (!allowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:quit_mate/src/feature/notification/model/my_notification.dart';

class NotificationService {
  static Future<void> initializeNotifications() async {
    await AwesomeNotifications().initialize(
        "resource://drawable/notifier_icon",
        [
          NotificationChannel(
            channelKey: "high_importance_channel",
            channelName: "Daily Review",
            channelDescription:
                "This channel is for setting up notifications for user to schedule plantcare processes.",
            channelGroupKey: "high_importance_channel",
            defaultColor: Colors.blueAccent,
            ledColor: Colors.red.shade400,
            playSound: true,
            channelShowBadge: true,
            onlyAlertOnce: true,
            criticalAlerts: true,
            enableVibration: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: "high_importance_channel",
            channelGroupName: "Daily Review",
          )
        ],
        debug: true);

    await AwesomeNotifications().isNotificationAllowed().then((value) async {
      if (!value) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreatedMethod);
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification notification) async {
    debugPrint("onNotificationDisplayedMethod");
  }

  static Future<void> onActionReceivedMethod(
      ReceivedNotification notificationAction) async {
    debugPrint("onActionReceived");
    final payload = notificationAction.payload ?? {};
    if (payload["navigate"] != null) {
      // Handle navigation
    }
  }

  Future<void> scheduleNewNotification({
    required MyNotification pushNotification,
    required int notificationId,
    required int interval,
    String? body,
    required DateTime scheduledTime,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        color: Colors.blueAccent,
        actionType: ActionType.Default,
        largeIcon: "resource://drawable/largeicon",
        id: notificationId,
        channelKey: "high_importance_channel",
        title: pushNotification.title,
        body: pushNotification.message,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: "Göz At",
          label: "Göz At",
        ),
      ],
      schedule: NotificationCalendar(
        year: scheduledTime.year,
        month: scheduledTime.month,
        day: scheduledTime.day,
        weekday: scheduledTime.weekday,
        hour: scheduledTime.hour,
        minute: scheduledTime.minute,
        second: scheduledTime.second,
        millisecond: scheduledTime.millisecond,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      ),
    );
  }
}

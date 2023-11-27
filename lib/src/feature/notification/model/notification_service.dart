import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  Future<void> initAwesomeNotification() async {
    AwesomeNotifications().initialize(
      'resource://drawable/ic_applogo',
      [
        NotificationChannel(
          channelKey: 'main_channel',
          channelName: 'main_channel',
          channelDescription: 'main_channel notifications',
          enableLights: true,
          importance: NotificationImportance.Max,
        )
      ],
    );
  }

  Future<void> requestPermission() async {
    AwesomeNotifications().isNotificationAllowed().then((allowed) {
      if (!allowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> showNotification(
      int id, String channelKey, String title, String body) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
      ),
    );
  }

  Future<void> showScheduledNotification(int id, String channelKey,
      String title, String body, int interval) async {
    String localTZ = await AwesomeNotifications().getLocalTimeZoneIdentifier();

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id,
          channelKey: channelKey,
          title: title,
          body: body,
        ),
        schedule: NotificationInterval(
          interval: interval,
          timeZone: localTZ,
          repeats: false,
        ));
  }
}

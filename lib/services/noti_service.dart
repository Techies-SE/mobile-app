import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  bool get initialized => _initialized;

  //initialized
  Future<void> initNotification() async {
    if (_initialized) return;

    //android initialization
    const initSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //ios initialization
    const initSettingIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    //init Setting
    const iniSetting = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingIOS,
    );

    //initialzed
    await notificationPlugin.initialize(iniSetting);

    // Request permission explicitly for iOS
  await notificationPlugin
      .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

  _initialized = true;
  }

  //nitification detail set up
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          'scheduled_noti_id', 'Scheduled Notifications',
          channelDescription: 'Scheduled Notification Chennel',
          importance: Importance.max,
          priority: Priority.high),
      iOS: DarwinNotificationDetails(),
    );
  }

  //show notificaton
  Future<void> showNoti({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationPlugin.show(
      id,
      title,
      body,
      NotificationDetails(),
    );
  }
}

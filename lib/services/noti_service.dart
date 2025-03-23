import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

class NotiService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  bool get initialized => _initialized;

  //initialized
  Future<void> initNotification() async {
    if (_initialized) return;

    //intialized time
    tz.initializeTimeZones();
    final String currentTime = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(getLocation(currentTime));

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
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
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

  //schedue notification
  Future<void> scheduleNoti({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int min,
  }) async {
    //get current time
    final now = tz.TZDateTime.now(tz.local);
    //set scheduled data
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.day,
      now.month,
      hour,
      min,
    );
    // schedule noti
    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}

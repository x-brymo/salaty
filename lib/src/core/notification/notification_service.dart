import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'receive_notification.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject = BehaviorSubject<ReceivedNotification>();
  final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    await _configureLocalTimeZone();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher'); // Ensure this matches your icon resource name
    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    await checkNotification();
  }

  Future _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    didReceiveLocalNotificationSubject.add(
      ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  }

  Future _onSelectNotification(String? payload) async {
    selectNotificationSubject.add(payload);
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> showPrayerNotification({
    required int id,
    required String title,
    required String body,
    required Duration duration,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '1',
      'Prayer Timing',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      ticker: 'Prayer Timing',
      visibility: NotificationVisibility.public,
      category: AndroidNotificationCategory.reminder,
    );
    DarwinNotificationDetails iosPlatformChannelSpecifics = DarwinNotificationDetails(
      sound: 'slow_spring_board.aiff',
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      payload: '',
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  Future<void> checkNotification() async {
    final available = await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    log(available.length.toString());
  }
}

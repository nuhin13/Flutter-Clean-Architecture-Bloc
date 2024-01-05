import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
      // onSelectNotification: NotificationRouter.routeByPayload,
    );
  }

  Future<void> show(
      String title, String body, Map<String, dynamic> data) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
    );
    const iOSNotificationDetails = DarwinNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSNotificationDetails);
    await _flutterLocalNotifications.show(
        0, title, body, platformChannelSpecifics,
        payload: jsonEncode(data));
  }

  Future<String?> getAppLaunchPayload() async {
    NotificationAppLaunchDetails? details =
        await _flutterLocalNotifications.getNotificationAppLaunchDetails();

    return (details?.didNotificationLaunchApp ?? false)
        ? details!.notificationResponse!.payload
        : null;
  }

  void onSelectNotification(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null) {
      final String body = json.decode(notificationResponse.payload!);
      debugPrint(
          "========Notification Data======${notificationResponse.toString()}");
    }
  }

  void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) {
    debugPrint("payload: ${payload ?? "empty payload"}");
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

import '../../core/core_export.dart';
import 'local_service.dart';
import 'notification_repository.dart';

class FirebaseNotificationService {
  static const String _generalTopic = "GeneralChannel";

  late final NotificationRepository _notificationRepo =
      serviceLocator<NotificationRepository>();

  late LocalNotificationService _localNotification;
  late FirebaseMessaging _firebaseMessaging;

  FirebaseMessaging get test => _firebaseMessaging;

  Future<void> init(LocalNotificationService localNotification) async {
    _localNotification = localNotification;

    await Firebase.initializeApp();
    _firebaseMessaging = FirebaseMessaging.instance;

    if (await _doesNotHavePermission()) return;

    await _firebaseMessaging.subscribeToTopic(_generalTopic);

    _registerListeners();
  }

  Future<void> subscribe() async {
    String? token = await _firebaseMessaging.getToken();
    debugPrint('Device Token: $token');
    if (token == null) return;
    await _notificationRepo.subscribe(token);
  }

  Future<void> unsubscribe() async {
    String? token = await _firebaseMessaging.getToken();
    if (token == null) return;
    await _notificationRepo.unsubscribe(token);
  }

  Future<String?> getAppLaunchPayload() async {
    RemoteMessage? message = await _firebaseMessaging.getInitialMessage();
    if (message == null) return null;

    return jsonEncode(message.data);
  }

  Future<bool> _doesNotHavePermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    return settings.authorizationStatus != AuthorizationStatus.authorized;
  }

  void _registerListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _convertRemoteNotificationAndShowAsLocal(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // NotificationRouter.routeByPayload(jsonEncode(message.data));
      debugPrint(jsonEncode(message.data));
    });
  }

  Future<void> _convertRemoteNotificationAndShowAsLocal(
      RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

    await _localNotification.show(
      (notification != null && notification.title != null)
          ? notification.title!
          : "",
      (notification != null && notification.body != null)
          ? notification.body!
          : "",
      message.data,
    );
  }
}

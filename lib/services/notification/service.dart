import 'dart:async';

import 'firebase_service.dart';
import 'local_service.dart';

class NotificationService {
  late final LocalNotificationService _local = LocalNotificationService();
  late final FirebaseNotificationService _firebase =
      FirebaseNotificationService();

  bool didNotificationLaunchApp = false;
  late String _appLaunchedPayload;

  Future<void> init() async {
    await _local.init();
    await _firebase.init(_local);
    await _determineIfAppLaunchedByNotification();
  }

  FirebaseNotificationService getPushService() {
    return _firebase;
  }

  String get appLaunchedPayload {
    return _appLaunchedPayload;
  }

  // Widget getLaunchedTargetWidget() {
  //   return NotificationRouter.getTargetWidgetFromPayload(_appLaunchedPayload);
  // }

  Future<void> _determineIfAppLaunchedByNotification() async {
    await _firebase.getAppLaunchPayload().then(_processAppLaunchPayload);
    if (didNotificationLaunchApp) return;
    await _local.getAppLaunchPayload().then(_processAppLaunchPayload);
  }

  FutureOr<String?> _processAppLaunchPayload(String? payload) async {
    if (payload == null) return null;

    didNotificationLaunchApp = true;
    _appLaunchedPayload = payload;
    return null;
  }
}

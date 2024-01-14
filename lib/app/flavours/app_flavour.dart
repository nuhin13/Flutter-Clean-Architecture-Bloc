import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/domain/di/service_locator.dart';
import '../../services/services_export.dart';
import 'app_config.dart';

Future<NotificationService> _bootNotificationServices() async {
  var notificationService = NotificationService();
  await notificationService.init();
  return notificationService;
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await dotenv.load();
  appConfig.loadData(dotenv.env);
  // var notificationService = await _bootNotificationServices(); // when notification is needed

  ServiceLocator().init(appConfig: appConfig);
  await getVersion();

  runApp(await builder());

  /*await runZonedGuarded(
    () async {
      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );*/
}

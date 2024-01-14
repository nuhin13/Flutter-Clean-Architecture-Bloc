import 'package:logger/logger.dart';

import '../../core/data/cache/client/base_cache.dart';
import '../../core/domain/di/service_locator.dart';
import '../navigation/navigation_service.dart';
import '../notification/service.dart';

class LogoutService {
  final BaseCache cache;
  final NotificationService notificationService;

  final Logger logger = serviceLocator<Logger>();

  LogoutService({
    required this.cache,
    required this.notificationService,
  });

  Future<void> doLogout() async {
    await cache.flushAll();
    await NavigationService.logoutAndNavigateToLoginScreen();
  }

  Future<void> unsubscribeFCM() async {
    await notificationService.getPushService().unsubscribe();
  }
}

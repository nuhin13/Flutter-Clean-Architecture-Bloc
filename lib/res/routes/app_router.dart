import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feature_screen_export.dart';

import '../res_export.dart';

class AppRouter {
  static final widgetMap = <String, Widget Function(RouteSettings)>{
    RoutePaths.splash: (_) => const SplashScreen(),
    RoutePaths.loginScreen: (settings) => const LoginScreen(),
    RoutePaths.tradeScreen: (settings) => const TradesScreen(),
  };

  static Route generateRoute(RouteSettings settings) {
    Widget widget = widgetMap[settings.name]?.call(settings) ??
        Container(); // default to Container if route not found. Not found widget

    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (_onPop(context) && didPop) Navigator.of(context).pop();
            },
            child: widget,
          );
        },
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
    }

    return _createRoute(settings, widget);
  }

  static Route _createRoute(final RouteSettings settings, final widget) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      barrierColor: Colors.black,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static bool _onPop(BuildContext context) {
    if (Navigator.of(context).userGestureInProgress) {
      return false;
    }
    return true;
  }
}

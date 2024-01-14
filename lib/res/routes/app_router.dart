import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feature_screen_export.dart';

import '../res_export.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    Widget widget;

    switch (settings.name) {
      case RoutePaths.splash:
        widget = const SplashScreen();
        break;
      case RoutePaths.loginScreen:
        widget = const LoginScreen();
        break;
      case RoutePaths.tradeScreen:
        widget = const TradesScreen();
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => widget = Container(),
        );
    }

    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (context) {
          return WillPopScope(
            onWillPop: () => _onPop(context),
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

  static Future<bool> _onPop(BuildContext context) async {
    if (Navigator.of(context).userGestureInProgress) {
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}

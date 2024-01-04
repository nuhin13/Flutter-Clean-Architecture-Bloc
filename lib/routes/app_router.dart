import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/routes/route_paths.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    Widget widget;

    switch (settings.name) {
      case RoutePaths.splash:
        //widget =  SplashScreen();
        break;
      case RoutePaths.welcome:
        //widget = const WelcomeScreen();
        break;
      case RoutePaths.otp:
        //widget = OtpScreen(settings.arguments as OTPArgs?);
        break;
      case RoutePaths.profile:
        //widget = const ProfileScreen();
        break;
      case RoutePaths.homepage:
        //widget = HomepageScreen();
        break;
      case RoutePaths.commonError:
        //widget = const ErrorScreen();
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }

    widget = Container(); // Have to remove while real navigation added

    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (context) {
          return WillPopScope(
            onWillPop: () => _onPop(context),
            child: widget,
          );
        },
        settings: RouteSettings(name: settings.name, arguments: settings.arguments),
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
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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

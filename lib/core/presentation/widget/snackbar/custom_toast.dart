import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../services/navigation/navigation_service.dart';
import '../../../core_export.dart';

void showCustomToast(
    {required String msg, Color? bg, ToastGravity? gravity, Toast? length}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: length ?? Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: bg ?? AppColors().colorPrimary,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

/// has no support for android 12, so don't use now
void showCustomToastWithCustomDuration(
    {required String message,
    required int durationInSecond,
    ToastGravity? gravity,
    Color? color}) {
  FToast toast = FToast();
  BuildContext? context = NavigationService.navigatorKey.currentContext;
  if (context != null) {
    toast.init(context);
    toast.showToast(
      child: getChild(message, color),
      toastDuration: Duration(seconds: durationInSecond),
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }
}

Widget getChild(String message, Color? color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: color ?? AppColors().primaryColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
      ],
    ),
  );
}

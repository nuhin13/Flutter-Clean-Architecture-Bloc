import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../dimensions/app_dimension.dart';

class AppFontSize {
  static double get tooSmallTextSize => AppDimension().tooSmallTextSize;
  static double get smallTextSize => AppDimension().smallTextSize;
  static double get mediumTextSize => AppDimension().mediumTextSize;
  static double get largeTextSize => AppDimension().largeTextSize;
  static double get appBarTextSize => AppDimension().appBarTextSize;
  static double get semiLargeTextSize => AppDimension().semiLargeTextSize;
  static double get extraLargeTextSize => AppDimension().extraLargeTextSize;
  static double get splashScreenTextSize => AppDimension().splashScreenTextSize;
}

class AppTextStyle {
  AppColors appColors = AppColors();

  TextStyle get appBarTextStyle => TextStyle(fontWeight: FontWeight.w600, fontSize: AppFontSize.appBarTextSize);

  TextStyle get splashScreenTextStyle =>
      TextStyle(fontWeight: FontWeight.w800, fontSize: AppFontSize.splashScreenTextSize, color: appColors.black);

  TextStyle w400s14([Color? color]) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s10([Color? color]) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s12([Color? color]) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w700s12([Color? color]) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s14([Color? color]) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w600s14([Color? color]) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w700s14([Color? color]) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w800s14([Color? color]) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s16([Color? color]) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s16([Color? color]) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w600s16([Color? color]) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w700s16([Color? color, double? height]) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color ?? appColors.black600,
      height: height ?? 1,
    );
  }

  TextStyle w700s18([Color? color, double? height]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color ?? appColors.black600,
      height: height ?? 1,
    );
  }

  TextStyle w800s16([Color? color]) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w500s20([Color? color]) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s12([Color? color]) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w400s18([Color? color]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w600s12([Color? color]) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w800s26([Color? color]) {
    return TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }

  TextStyle w800s40([Color? color]) {
    return TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      color: color ?? appColors.black600,
    );
  }
}

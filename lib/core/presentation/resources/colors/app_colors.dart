import 'package:flutter/material.dart';

import 'base_colors.dart';

class AppColors implements BaseColors {
  final Map<int, Color> _primary = {
    50: const Color.fromRGBO(218, 107, 255, 0.1),
    100: const Color.fromRGBO(218, 107, 255, 0.2),
    200: const Color.fromRGBO(218, 107, 255, 0.3),
    300: const Color.fromRGBO(218, 107, 255, 0.4),
    400: const Color.fromRGBO(218, 107, 255, 0.5),
    500: const Color.fromRGBO(218, 107, 255, 0.6),
    600: const Color.fromRGBO(218, 107, 255, 0.7),
    700: const Color.fromRGBO(218, 107, 255, 0.8),
    800: const Color.fromRGBO(218, 107, 255, 0.9),
    900: const Color.fromRGBO(218, 107, 255, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  Color get borderColor => const Color.fromRGBO(244, 244, 244, 1);

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFFEFB7D2, _primary);

  @override
  Color get primaryColor => const Color(0xFFE6BD4E);

  @override
  Color get secondaryColor => const Color(0xFF0A0B1C);

  @override
  Color get primaryColorBackground => const Color(0xFFFBF4E2);

  @override
  Color get primaryColorBorder => const Color(0xFF7B7B85);

  // black

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get black10 => const Color(0xFF1A1A1A);

  @override
  Color get black40 => const Color(0xFF666666);

  @override
  Color get black100 => const Color(0xFFEAECF0);

  @override
  Color get black150 => const Color(0xFFD9D9D9);

  @override
  Color get black200 => const Color(0xFFA7AAB1);

  @override
  Color get black250 => const Color(0xFFCCCCCC);

  @override
  Color get black300 => const Color(0xFF868990);

  @override
  Color get black350 => const Color(0xFFF7F7F7);

  @override
  Color get black400 => const Color(0xFF4D4F55);

  @override
  Color get black50 => const Color.fromRGBO(153, 153, 153, 1);

  @override
  Color get black500 => const Color(0xFF404040);

  @override
  Color get black550 => const Color(0xFF333333);

  @override
  Color get black600 => const Color(0xFF2F3137);

  @override
  Color get black650 => const Color(0xFF1A1A1A);

  @override
  Color get black700 => const Color(0xFF121212);

  @override
  Color get black800 => const Color(0xFF0F1117);

  @override
  Color get black900 => const Color.fromRGBO(26, 26, 26, 1);

  @override
  Color get eerieBlack => const Color(0xFF151625);

  //blue

  @override
  Color get blue400 => const Color(0xFF95BEF9);

  @override
  Color get blue50 => const Color(0xFFEEF6FB);

  @override
  Color get blue700 => const Color(0xFF080D21);

  @override
  Color get blue750 => const Color(0xFF1877F2);

  @override
  Color get blue800 => const Color(0xFF17254D);

  @override
  Color get blue850 => const Color(0xFF171204);

  @override
  Color get blue900 => const Color(0xFF06091B);

  @override
  Color get hanBlue => const Color(0xFF3771C8);

  //green

  @override
  Color get green100 => const Color(0xFFF5FBF6);

  @override
  Color get green150 => const Color(0xFFECF9ED);

  @override
  Color get green200 => const Color(0xFFF0FFEC);

  @override
  Color get green25 => const Color(0xFFFBFFF9);

  @override
  Color get green300 => const Color(0xFF8FE59B);

  @override
  Color get green50 => const Color(0xFFEFF8F1);

  @override
  Color get green500 => const Color(0xFF39B54A);

  @override
  Color get green600 => const Color(0xFF39B54B);

  @override
  Color get green700 => const Color(0xFF00A24A);

  @override
  Color get green75 => const Color(0xFFF4FFF1);

  @override
  Color get green750 => const Color(0xFF0F925B);

  @override
  Color get green800 => const Color(0xFF126836);

  @override
  Color get green900 => const Color(0xFF1F6127);

  //grey

  @override
  Color get grey100 => const Color(0xFFF4F5F7);

  @override
  Color get grey150 => const Color(0xFFCDCDCD);

  @override
  Color get grey200 => const Color(0xFFBFBFBF);

  @override
  Color get grey300 => const Color(0xFF999999);

  @override
  Color get grey350 => const Color(0xFF808080);

  @override
  Color get grey400 => const Color(0xFF828282);

  @override
  Color get grey450 => const Color(0xFF7B7B7B);

  @override
  Color get grey500 => const Color(0xFF606268);

  @override
  Color get grey550 => const Color.fromRGBO(83, 90, 115, 1);

  @override
  Color get grey600 => const Color(0xFF4A4A4A);

  @override
  Color get grey700 => const Color(0xFF2D2D2D);

  @override
  Color get grey800 => const Color(0xFF222222);

  //red

  @override
  Color get red100 => const Color(0xFFF9EDEC);

  @override
  Color get red300 => const Color(0xFFFB999D);

  @override
  Color get red400 => const Color(0xFFEF655A);

  @override
  Color get red500 => const Color(0xFFDC3044);

  @override
  Color get red600 => const Color(0xFFBF392B);

  @override
  Color get red700 => const Color(0xFFC92236);

  //silver

  @override
  Color get silver100 => const Color(0xFFCAD6E3);

  @override
  Color get silver200 => const Color(0xFFC9CCD2);

  @override
  Color get sonicSilver10 => const Color.fromRGBO(117, 117, 117, 0.1);

  //state

  @override
  Color get stateBlue => const Color(0xFF578AF8);

  @override
  Color get stateDeepBlue => const Color(0xFF17254D);

  @override
  Color get stateGreen => const Color(0xFF81C585);

  @override
  Color get statePurple => const Color(0xFF6B4CF6);

  @override
  Color get stateRed => const Color(0xFFEF655A);

  //white

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get white700 => const Color(0xFFF2F2F2);

  @override
  Color get white800 => const Color(0xFFF4F4F4);

  @override
  Color get white16P => const Color.fromRGBO(255, 255, 255, 0.16);

  @override
  Color get white60P => const Color.fromRGBO(255, 255, 255, 0.6);

  @override
  Color get white70P => const Color.fromRGBO(255, 255, 255, 0.7);

  //yellow

  @override
  Color get yellow500 => const Color(0xFFEEB50B);

  @override
  Color get yellow600 => const Color(0xFFEDA109);

  @override
  Color get maize => const Color(0xFFFAC242);

  @override
  LinearGradient get splashGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFE6BD4E),
          Color(0xFFE4BC4A),
          Color(0xFFF4CF62),
          Color(0xFFFFD36E),
        ],
        stops: [0.0, 0.3745, 0.8404, 1.0],
      );

  @override
  LinearGradient get mainBgGradient => const LinearGradient(
        colors: [
          Color.fromRGBO(56, 107, 169, 0.14),
          Color.fromRGBO(211, 96, 53, 0.14),
        ],
        begin: FractionalOffset(0.5, 0.3),
        end: FractionalOffset(0.0, 0.5),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      );
}

abstract class BasicDrawables
    implements AuthenticationDrawables, DashboardDrawables {

  String get logoSmall;
  String get splashImage;
  String get welcomeBackground;
  String get welcomeBackgroundSVG;

  String get save;
  String get progress;
  String get saved;
  String get seen;

  String get menuIcon;
  String get backArrow;
  String get errorIcon;
}

abstract class AuthenticationDrawables {
  String get loginUpperImage;
  String get loginLowerPart;
}

abstract class DashboardDrawables {
  String get dashboardImage;
}

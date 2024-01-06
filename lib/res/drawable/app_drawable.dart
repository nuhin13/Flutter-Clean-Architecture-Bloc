import '../../res/drawable/drawables.dart';

class AppDrawable extends Drawables {
  @override
  String get logoSmall => "${basePng}logo_small.png";


  @override
  String get splashImage => "${baseSvg}dizi_splash.svg";

  @override
  String get welcomeBackground => "${basePng}welcome_background.png";

  @override
  String get welcomeBackgroundSVG => "${baseSvg}welcome_background.svg";

  @override
  String get save => "${basePng}save.png";

  @override
  String get progress => "${basePng}progress.png";

  @override
  String get saved => "${baseSvg}saved.svg";

  @override
  String get seen => "${baseSvg}seen.svg";

  @override
  String get campaignDefault => "${basePng}campaign_card_icon.png";

  @override
  String get menuIcon => "${basePng}menu_icon.png";

  @override
  String get backArrow => "${baseSvg}arrow_back.svg";

  @override
  String get errorIcon => "${basePng}error_icon.png";

  @override
  String get loginDiziCash => "${baseSvg}dizi_cash.svg";
}

import 'items/authentication_strings.dart';
import 'items/dashboard_strings.dart';
import 'items/menu_strings.dart';

abstract class CommonStrings
    implements MenuStrings, DashboardStrings, AuthenticationStrings {
  String get appName;

  String get send;

  String get submit;

  String get ok;

  String get cancel;

  String get resend;

  String get next;

  String get verify;

  static String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.substring(2, 7);
  }
}
